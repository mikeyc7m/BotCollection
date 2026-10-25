<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\FieldType\DBInt;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

class BotTeam extends DataObject
{

    private static $db = array(
        'Title' => 'Varchar',
        'Content' => 'HTMLText',
        'Gestalt' => 'Varchar',
        'Inactive' => 'Boolean',
        'Sort' => 'Int',
    );

    private static $has_one = [
        'Leader' => 'Character',
    ];

    private static $many_many = array(
        'Characters' => 'Character',
        'TeamImages' => 'BotsImage'
    );

    private static $many_many_extraFields = array(
        "TeamImages" => array(
            'Sort' => 'SilverStripe\ORM\FieldType\DBInt',
        )
    );

    private static $summary_fields = array(
        'ImageThumb' => 'Image',
        'Title' => 'Title',
        'Characters.Count' => 'Count',
        'getCollected' => 'Collected',
        'Leader.KnownAs' => 'Leader',
        'Gestalt' => 'Gestalt',
        'Faction' => 'Faction'
    );

    private static $searchable_fields = array(
        'Title' => ['title'=> 'Title'],
        'Leader.KnownAs' => ['title'=>'Leader'],
        'Gestalt' => ['title'=>'Gestalt'],
    );

    public function ImageThumb()
    {
        if ($first = $this->TeamImages()->first())
            return $first->Image()->CMSThumbnail();
        return false;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->insertAfter('Title', DropdownField::create('LeaderID', 'Leader')->setSource($this->Characters()
            ->map('ID', 'KnownAs'))
            ->setEmptyString('(No leader)'));
        $chars = $fields->dataFieldByName('Characters');
        $fields->removeByName('Characters');
        if ($chars)
            $fields->insertAfter('LeaderID', $chars);
        if (!$this->Characters()->Count())
            $fields->removeByName('LeaderID');
        if (!$this->Gestalt)
            $fields->removeByName('Image');

        if ($gf = $fields->dataFieldByName('TeamImages')) {
            $config = $gf->getConfig();
            $config->addComponent($bulk = new \Colymba\BulkUpload\BulkUploader());
            $bulk->setUfSetup('setFolderName', 'Uploads');
            $config->addComponent(new GridFieldOrderableRows('Sort'));
        }

        return $fields;
    }

    public function getCollected()
    {
        $collected = 0;
        $chars = $this->Characters()->column();
        if(count($chars)){
            foreach ($chars as $id)
            $collected += Collection::get()->filter('Characters.ID', $id)->Count();
        }
        return DBField::create_field(DBInt::class,$collected);
    }

    public function getFaction()
    {
        if ($chars = $this->Characters()->first()) return $chars->Faction;
        return false;
    }

    public function getTeamImage()
    {
        if ($this->TeamImages()->Count()) return $this->TeamImages()->first();
        if ($first = $this->Characters()->first()) return $first->BotImages()->first();
        return false;
    }

    public function TeamImages()
    {
        return $this->getManyManyComponents('TeamImages')->sort('Sort');
    }
}
