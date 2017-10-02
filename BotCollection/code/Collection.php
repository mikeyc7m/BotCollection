<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Security\Member;
use SilverStripe\Dev\Debug;

class Collection extends DataObject
{
    private static $db = array(
    		'Title' => 'Varchar',
    		'Sort' => 'Int',
    );

    private static $has_one = [
    		'Member' => 'Silverstripe\Security\Member'
    ];

    private static $has_many = array(
    		'BotGroups'=>'BotGroup'
    );

    private static $many_many = array(
    		'Characters'=>'Character'
    );

    private static $many_many_extraFields=[
    		'Characters' => ['Sort'=>'Int']
    ];
    private static $summary_fields = [
    		'Title' => 'Title',
    		'Characters.Count' => 'Characters'
    ];
    private static $searchable_fields = [
    		'Title',
    		'Characters.Title' => array('title'=>'Character Name'),
    		'Characters.AltMode' => ['title'=>'Alt Mode'],
    ];

    public function getCMSFields(){
    	$fields = parent::getCMSFields();

    	if( $field = $fields->dataFieldByName('BotGroups') ){
    		$foo = $field->getConfig();
    		$fee = $foo->getComponentByType('SilverStripe\Forms\GridField\GridFieldSortableHeader');
    		//$fee->setFieldSorting(['Title'=>'aTitle']);
    	}

    	return $fields;
    }
}