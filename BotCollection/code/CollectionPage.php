<?php

use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;

class CollectionPage extends Page
{
    private static $db = array(
    );

    private static $many_many = array(
    		"Collections"=>'Collection'
    );

    public function getCMSFields(){
    	$fields=parent::getCMSFields();
    	$fields->addFieldsToTab('Root.Collections', GridField::create('Collections',null,$this->Collections(), GridFieldConfig_RelationEditor::create()));
    	return $fields;
    }

}

class CollectionPage_Controller extends PageController
{

	private static $allowed_actions = array(

	);

	protected function init()
	{
		parent::init();
		// You can include any CSS or JS required by your project here.
		// See: https://docs.silverstripe.org/en/developer_guides/templates/requirements/
	}

	public function getAllTeams(){
		return BotTeam::get();
	}

	public function getAllCharacters(){
		return Character::get();
	}
}
