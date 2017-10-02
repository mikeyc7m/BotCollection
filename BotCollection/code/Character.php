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

class Character extends DataObject
{
    private static $db = [
     	'Title' => 'Varchar',
     	'Faction' => 'Enum("Autobot,Decepticon","")',
    	'Rank' => 'Enum("Warrior,Officer,Commander,Leader","Warrior")',
    	'Role' => 'Enum("Soldier,Scientist,Engineer,Scout,Spy,Cityspeaker,Medic,Assasin,Bounty Hunter,Bodyguard,Security,Terrorist,Courier,Trader","Soldier")',
    	'Gender' => 'Enum("Male,Female,Unknown","Male")',
    	'AltMode' => 'Enum("Aircraft Propeller,Aircraft Fighter Jet,Aircraft Jet,Spaceship,Motorbike,Beast,Monster,Car Performance,Car Large/SUV,Car Luxury,Car Street,Car Small,Car Alien,Tank/Armoured,Industrial/Specialist,Truck,Object","")',
    ];

    private static $has_one = array(
    	"Image" => 'SilverStripe\Assets\Image'
    );

 	private static $belongs_to = [
 //   	'Gestalt' => 'BotTeam.Gestalt',
 		'Leader' => 'BotTeam.Leader',
    ];
/*
    private static $many_many = array(
     	'AltModes' => 'AltMode',
    );

    private static $many_many_extraFields = array(
     	'AltModes' => [
     		'Name' => 'Varchar',
     		'Fashion' => 'Enum("Futuristic,Alien,Contemporary,Retro,Ancient","Contemporary")',
     	],
    );
*/
    private static $belongs_many_many = array(
    	'BotTeams' => 'BotTeam',
    	'BotGroups' => 'BotGroup',
    	'Collections' => 'Collection',
    );

    private static $summary_fields = array(
    		'ID',
    		'Title',
    		'Faction',
    		'Gender',
    		'AltMode',
    );

    public function getCMSFields(){
    	$fields = parent::getCMSFields();
/*
    	if( $this->IsGestalt ){
    		if( $this->Gestalt()->ID ){
    			$fields->dataFieldByName('Teams')->setList($this->Gestalt()->Characters());
    		} else {
    			$fields->removeByName('Teams');
    		}
    		$fields->removeByName('AltModes');
    		$fields->insertAfter('IsGestalt', ReadonlyField::create('', 'Gestalt Team', $this->Gestalt()->Title));
    	} elseif( $this->ID ) {


			$altFields = singleton('AltMode')->getCMSFields();
			$altFields->addFieldsToTab(
					'Root.Main',[
					new TextField('ManyMany[Name]', 'Name'),
					new DropdownField('ManyMany[Fashion]', 'Fashion', [
							"Futuristic"=>"Futuristic",
							"Alien"=>"Alien",
							"Contemporary"=>"Contemporary",
							"Retro"=>"Retro",
							"Ancient"=>"Ancient",
					]),
			]);

			$config = GridFieldConfig_RelationEditor::create();
			$config->getComponentByType('SilverStripe\Forms\GridField\GridFieldDetailForm')->setFields($altFields);
			$config->getComponentByType('SilverStripe\Forms\GridField\GridFieldDataColumns')->setDisplayFields([
					'Name'=>'Name',
					'Title'=>'Title',
			]);

			$gridField = new GridField('AltModes', 'AltModes', $this->AltModes(), $config);
			$fields->findOrMakeTab('Root.AltModes')->replaceField('AltModes', $gridField);

    	}
*/
    	return $fields;
    }
}