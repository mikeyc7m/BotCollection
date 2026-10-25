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

class BotsImage extends DataObject
{
    private static $db = [
    ];

    private static $owns = array(
        "Image"
    );

    private static $has_one = array(
        "Image" => 'SilverStripe\Assets\Image'
    );

    private static $belongs_many_many = array(
        'GroupImage' => BotGroup::class.'.GroupImages',
        'TeamImage' => BotTeam::class.'.TeamImages'
    );

    private static $summary_fields = array(
        'Image.CMSThumbnail' => 'Image',
        "Title" => 'Title',
    );

    private static $searchable_fields = array(
        "Image.Title" => ['title' => 'Title'],
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
        if($this->GroupImage()->count()) return $this->GroupImage()->first()->getTitle();
        if($this->TeamImage()->count()) return $this->TeamImage()->first()->getTitle();
        return $this->Image()->Title;
    }

    public function getThumbURL()
    {
        return $this->Image()->FocusFillMax(187, 187)->getAbsoluteURL();
    }

    public function getHeroURL()
    {
        return $this->Image()->FocusFillMax(640, 640)->getAbsoluteURL();
    }
}
