<?php

use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\ReadonlyField;
use SilverStripe\Forms\CompositeField;
use SilverStripe\ORM\ArrayList;

class BotGroup extends DataObject
{
    private static $db = array(
//    	'Title' => 'Varchar',
    	'aTitle' => 'Varchar',
    	'dTitle' => 'Varchar',
    	'Sort' => 'Int',
    );

    private static $has_one = [
    		'Collection' => 'Collection'
    ];

    private static $many_many = array(
    	'Characters' => 'Character',
    );

    private static $summary_fields = array(
    		'Title'=>'Title',
    		'Autobots'=>'Autobots',
    		'Decepticons'=>'Decepticons',
    );

    private static $searchable_fields = array(
    		'aTitle',
    		'dTitle'
    );


    public function getTitle(){
    	return $this->aTitle . ' vs ' . $this->dTitle;
    }

    public function BotList($faction){
    	$bots = $this->Characters()->Filter('Faction',$faction);
    	$mine = $this->Collection()->Characters()->map()->toArray();
    	$extras = $bots->filter('ID:not',array_keys($mine));
    	$list = [];
   		foreach( $bots as $b ){
    		$list[$b->ID] = $b->Title;
    	}
    	foreach( $extras as $b ){
    		$list[$b->ID] = $b->Title . "*";
    	}

    	return count($list) . ': ' . implode(", ", $list);
    }

	public function getAutobots(){
    	return $this->BotList("Autobot");
    }
    public function getDecepticons(){
    	return $this->BotList("Decepticon");
    }

    public function getCMSFields(){
		$fields = parent::getCMSFields();

		$fields->addFieldsToTab('Root.Main', array(
				TextField::create('aTitle','Autobot Group Title'),
				TextField::create('dTitle','Decepticon Group Title'),

		));
		if( $this->ID ){
			$ab = $fields->dataFieldByName('Characters');
			$fields->removeByName('Characters');
			$fields->insertAfter('dTitle', $ab );
		}

		$myGroupedChars = [];
		$myChars = $this->Collection()->Characters();
		foreach($myChars as $c){
			if( $c->BotGroups()->Count() ) $myGroupedChars[$c->ID] = 1;
		}

		$fields->addFieldToTab('Root.Main', ReadonlyField::create('Others','Not grouped', implode(", ", $this->Collection()->Characters()->filter('ID:not',array_keys($myGroupedChars))->sort('Title')->map()->toArray())));

		return $fields;
	}

}