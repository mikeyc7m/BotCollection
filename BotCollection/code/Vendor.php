<?php

use Mikeyc7m\GridFieldSummary\GridFieldSummaryFooter;
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\GridField\GridFieldPaginator;
use SilverStripe\ORM\FieldType\DBBoolean;
use SilverStripe\ORM\FieldType\DBCurrency;

class Vendor extends DataObject
{
    private static $db = array(
        'Title' => 'Varchar',
        'OnlyShipping' => 'Boolean'
    );

    private static $has_many = array(
        'Purchases' => 'Purchase',
    );

    private static $casting = ["OnlyShipping" => 'Boolean'];

    private static $default_sort = "Title ASC";

    private static $summary_fields = array(
        'Title' => 'Title',
        'getTotal' => 'Spent',
        'OnlyShipping' => 'Only Shipping',
    );

    private static $searchable_fields = array(
        'Title',
        'OnlyShipping',
    );

    public function getTotal()
    {
        if ($this->Purchases()->Count())
            return DBCurrency::create_field('Currency', $this->Purchases()->sum('Total'));
        return DBCurrency::create_field('Currency', 0);
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $foo = $fields->dataFieldByName('Purchases');
        $fields->removeByName('Purchases');
        if ($foo) {
            $foo->getConfig()->addComponent(new GridFieldSummaryFooter(), GridFieldPaginator::class);
            $fields->insertAfter('OnlyShipping', $foo);
        }
        return $fields;
    }


}
