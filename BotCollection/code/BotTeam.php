<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Assets\Image;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\DropdownField;

class BotTeam extends DataObject
{
    private static $db = array(
    	'Title' => 'Varchar',
    	'Gestalt' => 'Varchar',
    );

    private static $has_one = [
    	'Leader' => 'Character',
    	'Image' => 'SilverStripe\Assets\Image',
    ];

    private static $many_many = array(
    	'Characters' => 'Character',
    );

    private static $summary_fields = array(
    		'Title'=>'Title',
    		'Characters.Count'=>'Count',
    		'Leader.Title'=>'Leader',
    		'Gestalt'=>'Gestalt',
    		'Faction'=>'Faction'
    );

	public function getCMSFields(){
		$fields = parent::getCMSFields();
		$fields->insertAfter('Title', DropdownField::create('LeaderID','Leader')->setSource($this->Characters()->map())->setEmptyString('(No leader)'));
		$chars = $fields->dataFieldByName('Characters');
		$fields->removeByName('Characters');
		if( $chars ) $fields->insertAfter('LeaderID', $chars);
		if( !$this->Characters()->Count() ) $fields->removeByName('LeaderID');
		if( !$this->Gestalt ) $fields->removeByName('Image');
		return $fields;
	}

	public function getFaction(){
		if( $chars = $this->Characters()->first() ) return $chars->Faction;
		return false;
	}

}