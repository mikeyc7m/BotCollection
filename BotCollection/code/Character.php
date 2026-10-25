<?php

use Colymba\BulkUpload\BulkUploader;
use Mikeyc7m\GridFieldSummary\GridFieldSummaryFooter;
use Money\Currency;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldDataColumns;
use SilverStripe\Forms\GridField\GridFieldEditButton;
use SilverStripe\Forms\GridField\GridFieldPageCount;
use SilverStripe\Forms\GridField\GridFieldPaginator;
use SilverStripe\Forms\OptionsetField;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\ManyManyList;
use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

/**
 * @property Currency|null PurchaseCost
 * @property Currency|null Postage
 * @property Currency|null Paid (only on Purchase_Characters join!)
 * @method ManyManyList Purchases()
 */
class Character extends DataObject
{

    private static $db = [
        'Title' => 'Varchar',
        'KnownAs' => 'Varchar(25)',
        'Status' => 'Enum("Unchanged,Customised,InProgress","Unchanged")',
        'Content' => 'HTMLText',
        'Faction' => 'Enum("Autobot,Decepticon","")',
        'Rank' => 'Enum("Warrior,Officer,Commander,Leader","Warrior")',
        'Role' => 'Enum("Soldier,Scientist,Engineer,Scout,Spy,Cityspeaker,Medic,Bounty Hunter,Bodyguard,Security,Terrorist,Courier,Trader","Soldier")',
        'Gender' => 'Enum("Male,Female,Unknown","Male")',
        'AltMode' => 'Enum("Aircraft Propeller,Aircraft Fighter Jet,Aircraft Jet,Spaceship,Motorbike,Beast,Monster,Car Performance,Car Large/SUV,Car Luxury,Car Street,Car Small,Car Alien,Tank/Armoured,Industrial,Aquatic,Truck,Object","")',
        'PurchaseCost' => 'Currency',
        'Postage' => 'Currency',
    ];

    private static $many_many = array(
        "BotImages" => 'BotImage',
    );

    private static $many_many_extraFields = array(
        "BotImages" => array(
            'Sort' => 'SilverStripe\ORM\FieldType\DBInt',
        )
    );

    private static $belongs_to = [
        'Leader' => 'BotTeam.Leader',
    ];
    private static $has_one = [];

    private static $owns = array(
        "BotImages"
    );

    private static $belongs_many_many = array(
        'BotTeams' => 'BotTeam',
        'BotGroups' => 'BotGroup',
        'Collections' => 'Collection',
        'Purchases' => 'Purchase.Characters',
    );

    private static $summary_fields = array(
        'ImageThumb' => 'Image',
        'Title' => 'Title',
        'Faction' => 'Faction',
        'Gender' => "Gender",
        'Status' => 'Status',
        'Collections.Count' => 'Collections',
        'Purchases.first.PurchaseDate' => 'Purchased',
        'PurchaseCost' => 'Cost'
    );

    private static $searchable_fields = array(
        'Title' => ['title' => 'Title'],
        'Faction' => ['title' => 'Faction'],
        'Gender' => ['title' => "Gender"],
        'AltMode' => ['title' => 'Alt Mode'],
        'Status' => ['title' => 'Status'],
        // others are hacked into modeladmin
    );

    private static $default_sort = 'Title ASC';

    public function getKnownAs()
    {
        return $this->dbObject('KnownAs')->getValue() ?: $this->Title;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        /** @var GridField $gf */
        if ($gf = $fields->dataFieldByName('BotImages')) {
            $config = $gf->getConfig();
            $config->addComponent($bulk = new BulkUploader());
            $bulk->setUfSetup('setFolderName', 'Uploads');
            $config->removeComponentsByType(GridFieldDataColumns::class);
            $config->addComponent($ed = new GridFieldEditableColumns(), GridFieldEditButton::class);
            $hasEd = $ed->getDisplayFields($gf);
            $hasEd['IsRobot'] = ['field' => CheckboxField::create('IsRobot'), 'title' => 'Is Robot?'];
            $ed->setDisplayFields($hasEd);
            $config->addComponent(new GridFieldOrderableRows('Sort'));
        }
        $fields->dataFieldByName('Title')->setTitle('Title (all names)');
        $fields->dataFieldByName('PurchaseCost')->setTitle('Price (AUD)')->setDescription('Enter AUD only.');
        $fields->dataFieldByName('Postage')->setTitle('Shipping & Tax (AUD)')->setDescription('Enter AUD only.');
        if ($this->Purchases()->count()) {
            $fields->dataFieldByName('PurchaseCost')->setReadonly(1);
            $fields->dataFieldByName('Postage')->setReadonly(1);
        }
        $fields->replaceField('Status', OptionsetField::create('Status')->setSource([
            'Unchanged' => 'Unchanged',
            'Customised' => 'Customised',
            'InProgress' => 'In Progress'
        ])->addExtraClass('inline-optionset'));
        
        if ($gf = $fields->dataFieldByName('Purchases')) {
            $config = $gf->getConfig();
            $config->addComponent(new GridFieldSummaryFooter(), GridFieldPaginator::class);
        }
        
        return $fields;
    }

    public function ImageThumb()
    {
        if ($first = $this->BotImages()->first())
            return $first->Image()->CMSThumbnail();
        return false;
    }

    public function BotImages()
    {
        return $this->getManyManyComponents('BotImages')->sort('Sort');
    }

    public function BotModeImage()
    {
        if ($first = $this->BotImages()->filter('IsRobot', true)->first())
            return $first->Image();
        return false;
    }

    public function getDefaultImage(){
        return BotImage::get_by_id(339)->Image();
    }

    public function AltModeImage()
    {
        if ($first = $this->BotImages()->filter('IsRobot', false)->first())
            return $first->Image();
        return false;
    }

    public function InvoicePrice()
    {
        /** @var Purchase $purchase */
        $purchase = $this->getMainPurchase();
        $value = 0;
        if ($purchase && $purchase->exists()) {
            $rate = $purchase->ExchangeRate ?: 1;
            $value = ($this->PurchaseCost * $rate);
        }
        return DBField::create_field('Currency', $value);
    }

    public function getMainPurchase()
    {
        return $this->Purchases()->filter('Amount', $this->PurchaseCost)->first();
    }
}
