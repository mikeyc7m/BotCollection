<?php

use SilverStripe\Assets\Folder;
use SilverStripe\Assets\Image;
use SilverStripe\Control\Director;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\Search\SearchContext;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;

class BotGroup extends DataObject
{
    private static $db = array(
//    	'Title' => 'Varchar',
        'aTitle' => 'Varchar',
        'dTitle' => 'Varchar',
        'Content' => 'HTMLText',
        'Inactive' => 'Boolean',
        'Sort' => 'Int',
    );

    private static $has_one = [
        'Collection' => 'Collection',
    ];

    private static $many_many = array(
        'Characters' => 'Character',
        'GroupImages' => 'BotsImage'
    );

    private static $many_many_extraFields = array(
        "GroupImages" => array(
            'Sort' => 'SilverStripe\ORM\FieldType\DBInt',
        )
    );

    private static $owns = array(
        "GroupImages"
    );
    private static $summary_fields = array(
        'ImageThumb' => 'Image',
        'Title' => 'Title',
        'Autobots' => 'Autobots',
        'Decepticons' => 'Decepticons',
        'Sort' => 'Sort'
    );

    private static $searchable_fields = array(
        'aTitle',
        'dTitle'
    );


    public function getTitle()
    {
        return $this->aTitle . ' vs ' . $this->dTitle;
    }

    public function ImageThumb()
    {
        if ($first = $this->GroupImages()->first())
            return $first->Image()->CMSThumbnail();
        return false;
    }

    public function BotList($faction)
    {
        $list = [];
        $bots = $this->Characters()->Filter('Faction', $faction);
        $mine = $this->Collection()->Characters()->map()->toArray();
        if(count($mine)) {
            $extras = $bots->filter('ID:not', array_keys($mine));

            foreach ($bots as $b) {
                $counta = $b->BotGroups()->Count();
                $list[$b->ID] = $b->KnownAs . ($counta > 1 ? "($counta)" : '');
            }
            foreach ($extras as $b) {
                $list[$b->ID] = $b->KnownAs . "*";
            }
        }
        return count($list) . ': ' . implode(", ", $list);
    }

    public function getAutobots()
    {
        return $this->BotList("Autobot");
    }

    public function getDecepticons()
    {
        return $this->BotList("Decepticon");
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();

        $fields->addFieldsToTab('Root.Main', array(
            TextField::create('aTitle', 'Autobot Group Title'),
            TextField::create('dTitle', 'Decepticon Group Title'),

        ));
        if ($this->ID) {
            $ab = $fields->dataFieldByName('Characters');
            $fields->removeByName('Characters');
            $fields->insertAfter('dTitle', $ab);
        }

        $myGroupedChars = [];
        $myChars = Character::get();
        foreach ($myChars as $c) {
            if ($c->BotGroups()->Count()) $myGroupedChars[$c->ID] = 1;
        }

        $fields->addFieldsToTab('Root.Main', [
            ReadonlyField::create('Others', 'Not grouped', implode(", ", $this->Collection()->Characters()->filter('ID:not', array_keys($myGroupedChars))->sort('Title')->map()->toArray())),
            ReadonlyField::create('Nothers', 'Not collected', implode(", ", Character::get()->filter('Collections.ID', null)->filter('ID:not', array_keys($myGroupedChars))->sort('Title')->map()->toArray()))
        ]);

        /** @var GridField $gf */
        if ($gf = $fields->dataFieldByName('GroupImages')) {
            $config = $gf->getConfig();
            $config->addComponent($bulk = new \Colymba\BulkUpload\BulkUploader());
            $config->addComponent(new GridFieldOrderableRows('Sort'));
            $bulk->setUfSetup('setFolderName', 'Uploads');
        }

        return $fields;
    }

    public function getGroupImage()
    {
        if ($this->GroupImages()->Count()) return $this->GroupImages()->first();
        if ($first = $this->Characters()->first()) return $first->BotImages()->first();
        return false;
    }

    public function GroupImages()
    {
        return $this->getManyManyComponents('GroupImages')->sort('Sort');
    }
    
    public function onAfterWrite(){
        parent::onAfterWrite();
        if ($this->GroupImages()->Count()) return;
        if (!$this->Characters()->Count()) return;
        $imgs = [];
        $chars = $this->Characters()->sort();
        foreach($chars as $bot){
            $img = $bot->BotImages()->first();
            if ($img && $img->exists()){
               $imgs[] = $img->Image(); 
            }
        }
        if (count($imgs)){
            $canvas = imagecreatetruecolor(600, 450);
            foreach($imgs as $count => $img){
                list($width, $height) = getimagesize($img->File->getAbsoluteURL());
                $icon1 = imagecreatefromstring($img->getString());
                imagecopyresampled($canvas, $icon1, ($count % 3) * 200, ($count < 3 ? 0 : 225), 0, 0, 200, 225, $width, $height);
            }
        }
        $folder = Folder::find_or_make('Uploads');
        $path = $folder->getAbsoluteURL() . $this->ID.'groupImg.jpg';
        $success = @\imagejpeg($canvas, $path);
        $contents = file_get_contents($path);
        $newImg = Image::create();
        $newImg->setFromString($contents, 'image.jpg');
        $newImg->ParentID = $folder->ID;
        $newImg->write();
        $groupImg = BotsImage::create();
        $groupImg->ImageID = $newImg->ID;
        $groupImg->write();
        $this->GroupImages()->add($groupImg);
    } 
}
