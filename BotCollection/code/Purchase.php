<?php

use Decimal\Decimal;
use Mikeyc7m\GridFieldSummary\GridFieldSummaryFooter;
use Money\Currency;
use SilverStripe\AssetAdmin\Forms\PreviewImageField;
use SilverStripe\Forms\GridField\GridFieldAddExistingAutocompleter;
use SilverStripe\Forms\GridField\GridFieldFilterHeader;
use SilverStripe\Forms\LiteralField;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\ManyManyList;
use Symbiote\GridFieldExtensions\GridFieldAddExistingSearchHandler;
use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
use SilverStripe\Forms\GridField\GridFieldDataColumns;
use SilverStripe\Forms\GridField\GridFieldPaginator;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\CurrencyField;


/**
 * @property Currency|null Spent
 * @property Currency|null Shipping
 * @property Decimal|null ExchangeRate
 * @property Currency|null Total
 * @method ManyManyList Characters()
 */
class Purchase extends DataObject
{
    private static $db = array(
        'Title' => 'Varchar',
        'PurchaseDescription' => 'Text',
        'PurchaseDate' => 'Date',
        'ExchangeRate' => 'Decimal(8,6)',
        'Spent' => 'Currency',
        'Shipping' => 'Currency',
        'Total' => 'Currency',
        'SellerName' => 'Varchar'
    );

    private static $has_one = array(
        'Vendor' => 'Vendor',
        'Shipment' => 'Purchase'
    );

    private static $has_many = array(
        'Packages' => 'Purchase'
    );

    private static $many_many = array(
        'Characters' => 'Character',
    );

    private static $many_many_extraFields = array(
        'Characters' => ['Paid' => 'Currency', 'Description' => 'Varchar', 'Amount' => 'Currency'],
    );

    private static $summary_fields = array(
        'PurchaseDate' => 'Purchase Date',
        'getSpentAUD' => ['title' => 'Cost (AUD)'],
        'Total' => ['title' => 'Total (AUD)'],
        'SellerName' => 'Seller',
        'Title' => 'Title'
    );

    private static $searchable_fields = array(
        'Title' => ['title' => 'Title'],
        'PurchaseDescription' => ['title' => 'Description'],
        'PurchaseDate' => ['title' => 'Purchase Date'],
        'Total' => ['title' => 'Total (or greater)', 'field' => TextField::class, 'filter' => 'GreaterThanOrEqualFilter'],
        'SellerName' => ['title' => 'Seller', 'filter' => 'PartialMatchFilter'],
    );

    private static $default_sort = "PurchaseDate DESC";
    /**
     * @var mixed|null
     */
    private $updatedByCharacter = false;

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->dataFieldByName('ExchangeRate')
            ->setDescription('If the amounts spent is not in AUD, enter the exchange rate at the time as AUD &#247; USD');
        if ($this->ID) {
            $field = $fields->dataFieldByName('Characters');
            $config = $field->getConfig();
            $config->removeComponentsByType(GridFieldDataColumns::class);
            $config->addComponent($cols = new GridFieldEditableColumns(), GridFieldFilterHeader::class);
            $config->addComponent(new GridFieldSummaryFooter(), GridFieldPaginator::class);
            $cols
                ->setDisplayFields([
                    'ImageThumb' => ['title' => 'Image', 'field' => LiteralField::class],
                    'Title' => ['title' => 'Character', 'field' => ReadonlyField::class],
                    'PurchaseCost' => ['title' => 'Price (AUD)', 'field' => CurrencyField::class],
                    'Description' => 'Description',
                    'InvoicePrice' => ['title' => 'Invoiced', 'field' => ReadonlyField::class],
                    'Paid' => ['title' => 'Paid', 'field' => CurrencyField::class],
                ]);
            $cols
                ->setFieldCasting([
                    'PurchaseCost' => 'Currency->Nice',
                    'InvoicePrice' => 'Currency->Nice',
                    'Spent' => 'Currency->Nice',
                ]);

            $field = $fields->dataFieldByName('Packages');
            $config = $field->getConfig();
            /** @var GridFieldAddExistingAutocompleter $search */
            $search = $config->getComponentByType(GridFieldAddExistingAutocompleter::class);
            $search->setSearchFields(['Title', 'SellerName']);
        }

        $fields->dataFieldByName('Spent')
            ->setTitle('SubTotal');
        $fields->dataFieldByName('Shipping')
            ->setTitle('Shipping & Tax');
        $fields->dataFieldByName('Total')
            ->setAttribute('disabled', 'true')
            ->setTitle('Total (AUD)');
        $fields->insertBefore(
            'Total',
            ReadonlyField::create('theInvoiceTotal', 'Invoice Total')->setValue($this->InvoiceTotal()->Nice())
        );

        if ($this->VendorID && $this->Vendor()->OnlyShipping) {
            $fields->removeByName(['Spent', 'ShipmentID', 'SellerName', 'Characters']);
        } else {
            $fields->removeByName(['Packages']);
        }

        return $fields;
    }
    
    public function getSpentAUD(){
        $spent = (!$this->ExchangeRate) ? $this->Spent : ($this->Spent / $this->ExchangeRate);
        return DBField::create_field('Currency', $spent);
    }

    public function InvoiceTotal()
    {
        return DBField::create_field('Currency', ($this->Spent + $this->Shipping));
    }

    public function onBeforeWrite()
    {
        parent::onBeforeWrite();
        $subtotal = 0;
        $shipping = 0;
        if ($this->ID) { // skip on first write
            if (!$this->Spent) {
                $subtotal += $this->Characters()->Sum('PurchaseCost');
            }
            if (!$this->Shipping) {
                $shipping += $this->Characters()->Sum('Postage');
            }
        }
        if (!$subtotal) {
            if ($this->ExchangeRate) {
                $subtotal = $this->Spent / $this->ExchangeRate;
            } else {
                $subtotal = $this->Spent;

            }
        }
        if (!$shipping) {
            if ($this->ExchangeRate) {
                $shipping = $this->Shipping / $this->ExchangeRate;
            } else {
                $shipping = $this->Shipping;
            }
        }
        $this->Total = $subtotal + $shipping;
    }

    public function onAfterWrite()
    {
        if (($chars = $this->Characters()) && ($count = $chars->Count())) {
            $spent = 0;
            $extra = 0;
            if (!$chars->sum('Paid')) {
                // If no Character has a "paid" value, split the purchase subtotal between them.
                $spent = $this->Spent / $count;
                $extra = ((($spent * 100) % $count) - 1) / 100 * -1;
            }
            /** @var Character $char */
            foreach ($chars as $char) {
                $charSpent = ($spent ?: $char->Paid) + $extra;
                $extra = 0;
                $charTotal = $this->ExchangeRate == 0 ? $charSpent : ($charSpent / $this->ExchangeRate);
                if ($charTotal) $char->PurchaseCost = $charTotal;
                if ($this->Shipping) {
                    $charShipping = ($this->ExchangeRate ? $this->Shipping / $this->ExchangeRate
                            : $this->Shipping) / $count;
                    $char->Postage = $charShipping;
                }
                if ($char->isChanged('PurchaseCost', 2)
                    || $char->isChanged('Postage', 2)
                ) $char->write();
                $this->Characters()->add($char, ['Amount' => $charTotal]);
            }
        }
    }
}
