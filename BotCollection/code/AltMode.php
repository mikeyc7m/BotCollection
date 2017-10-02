<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\TextField;

class AltMode extends DataObject
{
    private static $db = array(
    	'Title' => 'Varchar',
    	'Terrain' => 'Enum("Space,Land,Sea,Air","Land")',
    	'Type' => 'Enum("Vehicle,Creature,Base,Weapon","Vehicle")'
    );

    private static $belongs_many_many = array(
    	'Characters' => 'Character',
    );

    public function getCMSFields(){
    	$fields = parent::getCMSFields();

    	if( $this->ID ){
    		$config = $fields->dataFieldByName('Characters')->getConfig();
    	$config->getComponentByType('SilverStripe\Forms\GridField\GridFieldDataColumns')->setDisplayFields([
    			'Title'=>'Title',
    			'Name'=>'Name',
    	]);
    	}
    	return $fields;
    }


}
