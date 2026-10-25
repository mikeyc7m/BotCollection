<?php

use Mikeyc7m\GridFieldSummary\GridFieldSummaryFooter;
use SilverStripe\Admin\ModelAdmin;
use SilverStripe\Forms\CurrencyField;
use SilverStripe\Forms\DateField;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldDataColumns;
use SilverStripe\Forms\GridField\GridFieldFilterHeader;
use SilverStripe\Forms\GridField\GridFieldPageCount;
use SilverStripe\Forms\GridField\GridFieldPaginator;
use SilverStripe\Forms\NumericField;
use SilverStripe\Security\Security;
use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\GridField\GridFieldExportButton;

class Bot_ModelAdmin extends ModelAdmin
{
    private static $url_segment = 'bots';
    private static $menu_title = 'Database';
    private static $managed_models = [
        'Character',
        'Collection',
        'Purchase',
        'Vendor',
        'BotGroup',
        'BotTeam',
        'BotImage',
        'BotsImage',
    ];

    //private static $model_importers = [];

    public function getEditForm($id = null, $fields = null)
    {
        $form = parent::getEditForm($id, $fields);
        $className = $this->sanitiseClassName($this->modelClass);
        /** @var GridField $gf */
        $gf = $form->Fields()->fieldByName($className);
        $config = $gf->getConfig();
        if ($className == 'Character') {

            $exp = $config->getComponentByType(GridFieldExportButton::class);
            $expCols = $this->getExportFields();
            unset($expCols['ImageThumb']);
            $expCols['Rank'] = 'Rank';
            $expCols['Role'] = 'Role';
            $expCols['AltMode'] = 'AltMode';
            $expCols['BotTeams.first.Title'] = 'Team';
            $expCols = ['ID' => 'ID', 'KnownAs' => 'Known As'] + $expCols;
            $exp->setExportColumns($expCols);

            /**@var GridFieldFilterHeader $fh */
            $fh = $config->getComponentByType(GridFieldFilterHeader::class);
            $context = $fh->getSearchContext($gf);

            // Create the fields
            $amountFrom = NumericField::create('Search__TotalFrom', 'from');
            $amountTo = NumericField::create('Search__TotalTo', 'to');
            $amountGroup = FieldGroup::create('Cost (AUD)', [$amountFrom, $amountTo])
                ->setName('Total')
                ->addExtraClass('fieldgroup--fill-width');
            $context->getFields()->insertAfter(
                'PurchaseCost',
                $amountGroup
            );

            $source = [];
            $source[null] = "(Any)";
            $source[0] = "(None assigned)";
            $sourceCollection = $source + Collection::get()
                    ->map('ID', 'Title')->toArray();
            $tagDropdown = DropdownField::create(
                'CollectionsID',
                'Collection',
                $sourceCollection
            )->setEmptyString("(Any)");
            $context->getFields()->insertBefore(
                'CollectionsID',
                $tagDropdown
            );

            $source = [];
            $source[null] = "(Any)";
            $source[0] = "(Free)";
            $sourcePurchases = $source + [1 => '(Is Purchased)'];
            $tagDropdown = DropdownField::create(
                'PurchasesID',
                'Purchased',
                $sourcePurchases
            )->setEmptyString("(Any)");
            $context->getFields()->insertBefore(
                'PurchasesID',
                $tagDropdown
            );
        }
        if (singleton($className)->hasDatabaseField('Sort')) {
            $gf->getConfig()->addComponent(new GridFieldOrderableRows());
        }
        $gf->getConfig()->addComponent(new GridFieldSummaryFooter(), GridFieldPaginator::class);
        $gf->getConfig()->removeComponentsByType(GridFieldPageCount::class);

        if ($className == 'BotImage' || $className == 'BotsImage') {
            $gf->addExtraClass('use-grid-layout');
            $gf->getConfig()->getComponentByType(GridFieldPaginator::class)->setItemsPerPage(70);
        }

        if ($className == 'Purchase') {
            /**@var GridFieldFilterHeader $fh */
            $fh = $config->getComponentByType(GridFieldFilterHeader::class);
            $context = $fh->getSearchContext($gf);
            // Create the fields
            $dateFrom = DateField::create('Search__PurchaseDateFrom', 'from');
            $dateTo = DateField::create('Search__PurchaseDateTo', 'to');
            $dateGroup = FieldGroup::create('Purchase Date', [$dateFrom, $dateTo])
                ->setName('PurchaseDate')
                ->addExtraClass('fieldgroup--fill-width');
            $context->getFields()->insertAfter(
                'Title',
                $dateGroup
            );

            // Create the fields
            $amountFrom = NumericField::create('Search__TotalFrom', 'from');
            $amountTo = NumericField::create('Search__TotalTo', 'to');
            $amountGroup = FieldGroup::create('Total (AUD)', [$amountFrom, $amountTo])
                ->setName('Total')
                ->addExtraClass('fieldgroup--fill-width');
            $context->getFields()->insertAfter(
                'PurchaseDate',
                $amountGroup
            );
        }

        return $form;
    }

    public function getList()
    {
        $params = $this->getRequest()->requestVar('filter');
        $className = $this->sanitiseClassName($this->modelClass);
        if (empty($params) && $requestVar = $this->getRequest()->requestVar($className)) {
            if (isset($requestVar['GridState']) && !empty($requestVar['GridState'])) {
                $gridState = json_decode($requestVar['GridState'], true);
                if (isset($gridState['GridFieldFilterHeader']['Columns'])
                    && is_array($gridState['GridFieldFilterHeader']['Columns'])) {
                    $params = [$className => $gridState['GridFieldFilterHeader']['Columns']];
                }
            }
        }
        $list = parent::getList();

        if (isset($params['Character'])) {
            if (isset($params['Character']['CollectionsID'])) {
                $val = (int)$params['Character']['CollectionsID'] ?: null;
                $list = $list->filter("Collections.ID", $val);
            }
            if (isset($params['Character']['PurchasesID'])) {
                $val = (int)$params['Character']['PurchasesID'] ? ':GreaterThan' : '';
                $list = $list->filter("PurchaseCost$val", 0);
            }
            if (isset($params['Character']['TotalFrom'])) {
                $list = $list->filter("PurchaseCost:GreaterThanOrEqual", $params['Character']['TotalFrom']);
            }
            if (isset($params['Character']['TotalTo'])) {
                $list = $list->filter("PurchaseCost:LessThanOrEqual", $params['Character']['TotalTo']);
            }
        } elseif (isset($params['Purchase'])) {
            if (isset($params['Purchase']['PurchaseDateFrom'])) {
                $fromDate = new DateField(null, null, $params['Purchase']['PurchaseDateFrom']);
                $list = $list->filter("PurchaseDate:GreaterThanOrEqual", $fromDate->dataValue() . ' 00:00:00');
            }
            if (isset($params['Purchase']['PurchaseDateTo'])) {
                $toDate = new DateField(null, null, $params['Purchase']['PurchaseDateTo']);
                $list = $list->filter("PurchaseDate:LessThanOrEqual", $toDate->dataValue() . ' 00:00:00');
            }
            if (isset($params['Purchase']['TotalFrom'])) {
                $list = $list->filter("Total:GreaterThanOrEqual", $params['Purchase']['TotalFrom']);
            }
            if (isset($params['Purchase']['TotalTo'])) {
                $list = $list->filter("Total:LessThanOrEqual", $params['Purchase']['TotalTo']);
            }
        }
        return $list;
    }
}
