<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\FileField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\ORM\FieldType\DBBoolean;

class BotImage extends DataObject
{
    private static $db = [
        'IsRobot' => DBBoolean::class
    ];

    private static $owns = array(
        "Image"
    );

    private static $has_one = array(
        "Character" => 'Character',
        "Image" => 'SilverStripe\Assets\Image'
    );
    
    private static $belongs_many_many = array(
        "Characters" => 'Character',
    );

    private static $summary_fields = array(
        'Image.CMSThumbnail' => 'Image',
        'Title' => 'Character',
    );

    private static $searchable_fields = array(
        "Character.Title" => ['title' => 'Character'],
//        "Image.Title" => ['title' => 'Title'],
        "Image.FileFilename" => ['title' => 'Filename'],
    );

    public function canView($member = null)
    {
        return true;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        return $fields;
    }

    public function getTitle()
    {
        return $this->Character()->getKnownAs() ?: $this->Image()->Title;
    }

    public function getThumbURL()
    {
        $img = $this->Image()->FocusFillMax(187, 187)->getAbsoluteURL();
        gc_collect_cycles();
        return $img;
    }

    public function getHeroURL()
    {
        return $this->Image()->FocusFillMax(640, 640)->getAbsoluteURL();
    }
}
