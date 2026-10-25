<?php

use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;
use SilverStripe\ORM\ArrayList;
use SilverStripe\ORM\DataList;
use SilverStripe\ORM\Queries\SQLSelect;

class CollectionPage extends Page
{

    private static $db = [];

    private static $many_many = [
        "Collections" => 'Collection'
    ];

    private static $has_one = [
//        "Collection" => 'Collection'
    ];


    private static $owns = [
        "Collections"
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->addFieldsToTab('Root.Collection', [
            GridField::create('Collections', null, $this->Collections(), GridFieldConfig_RelationEditor::create()),
        ]);
        return $fields;
    }

    public function notCollected(): DataList
    {
        $myGroupedChars = [];
        $myChars = Character::get();
        foreach ($myChars as $c) {
            if ($c->BotGroups()->Count()) $myGroupedChars[$c->ID] = 1;
        }
        $notGrouped = $this->notGrouped()->column();
        return Character::get()->filter('ID:not', array_merge(array_keys($myGroupedChars), $notGrouped))->sort('Title');
    }

    public function notGrouped(): DataList
    {
        $myGroupedChars = [];
        $myChars = Character::get();
        foreach ($myChars as $c) {
            if ($c->BotGroups()->Count()) $myGroupedChars[$c->ID] = 1;
        }
        return Collection::get()->first()->Characters()->filter('ID:not', array_keys($myGroupedChars))->sort('Title');
    }
    
    public function notTeamed(): DataList
    {
        $myGroupedChars = [];
        $myChars = Character::get();
        foreach ($myChars as $c) {
            if ($c->BotTeams()->Count()) $myGroupedChars[$c->ID] = 1;
        }
        return Character::get()->filter('ID:not', array_keys($myGroupedChars))->sort('Title');
    }
    
    public function getAllMyBots()
    {
        $query = SQLSelect::create();
        $query->addFrom('Collection_Characters');
        $query->addWhere('CharacterID > 0');
        $query->addSelect('CharacterID');
        $result = $query->execute();
        $bots = Character::get()->filter('ID', $result->column('CharacterID'));
        $bots = Character::get();
        return $bots->sort('Title');
    }
    
}

class CollectionPage_Controller extends PageController
{

    private static $url_handlers = [
        'collection/$ID' => 'viewCollection',
        'character/$ID' => 'viewBot',
        'group/$ID' => 'viewGroup',
        'team/$ID' => 'viewTeam'
    ];

    private static $allowed_actions = array(
        'viewBot',
        'viewTeam',
        'viewGroup',
        'viewCollection'
    );

    public function getAllCharacters()
    {
        return Character::get();
    }

    public function viewCollection()
    {
        $view = false;
        $prev = false;
        $next = false;

        if ($id = $this->request->param('ID')) {
            $view = Collection::get_by_id('Collection', $id);
        }

        if (!$this->request->isAjax() && $view) {
            if (($characters = $view->Characters()) && $characters->Count()) {
                $list = $characters->sort('KnownAs ASC, Title ASC')->column("ID");
                $mine = false;

                foreach ($list as $l) {
                    if ($mine) {
                        $next = $l;
                        break;
                    }
                    if ($l == $id) {
                        $mine = $l;
                        continue;
                    }
                    $prev = $l;
                }
            }
        }

        return $this->customise(array(
            'theCollection' => $view,
            'nextCollection' => $next,
            'prevCollection' => $prev,
            'allCollections' => Collection::get()->sort('Sort')
        ));
    }
    
    public function viewBot()
    {
        $view = false;
        $prev = false;
        $next = false;

        if ($id = $this->request->param('ID')) {
            $view = Character::get_by_id('Character', $id);
        } else {
            return $this;
        }

        if (!$this->request->isAjax() && $view) {
            if (($collections = $view->Collections()) && $collections->Count()) {
                $list = $collections->first()->Characters()->sort('KnownAs ASC, Title ASC')->column("ID");
                $mine = false;

                foreach ($list as $l) {
                    if ($mine) {
                        $next = $l;
                        break;
                    }
                    if ($l == $id) {
                        $mine = $l;
                        continue;
                    }
                    $prev = $l;
                }
            }
        }

        return $this->customise(array(
            'theBot' => $view,
            'nextBot' => $next,
            'prevBot' => $prev
        ));
    }

    public function viewTeam()
    {
        $view = false;
        $prev = false;
        $next = false;

        if ($id = $this->request->param('ID')) {
            $view = BotTeam::get_by_id('BotTeam', $id);
        }

        if (!$this->request->isAjax() && $view) {
            if ($view && ($bots = $view->Characters()->column('ID')) && count($bots) && ($collections = Collection::get()->filter('Characters.ID', $bots)) && $collections->Count()) {
                $myList = $collections->first()->Characters()->column("ID");
                $list = array_unique(BotTeam::get()->filter('Characters.ID', $myList)->sort('Sort')->column("ID"));
                $mine = false;

                foreach ($list as $l) {
                    if ($mine) {
                        $next = $l;
                        break;
                    }
                    if ($l == $id) {
                        $mine = $l;
                        continue;
                    }
                    $prev = $l;
                }
            }
        }

        return $this->customise(array(
            'theTeam' => $view,
            'nextTeam' => $next,
            'prevTeam' => $prev,
            'allTeams' => BotTeam::get()->sort('Sort')
        ));
    }

    public function viewGroup()
    {
        $view = false;
        $prev = false;
        $next = false;

        if ($id = $this->request->param('ID')) {
            $view = BotGroup::get_by_id('BotGroup', $id);
        }

        if (!$this->request->isAjax() && $view) {
            if (($bots = $view->Characters()->column('ID')) && count($bots) && ($collections = Collection::get()->filter('Characters.ID', $bots)) && $collections->Count()) {
                $myList = $collections->first()->Characters()->column("ID");
                $list = array_unique(BotGroup::get()->filter('Characters.ID', $myList)->sort('Sort')->column("ID"));
                $mine = false;

                foreach ($list as $l) {
                    if ($mine) {
                        $next = $l;
                        break;
                    }
                    if ($l == $id) {
                        $mine = $l;
                        continue;
                    }
                    $prev = $l;
                }
            }
        }

        return $this->customise(array(
            'theGroup' => $view,
            'nextGroup' => $next,
            'prevGroup' => $prev,
            'allGroups' => BotGroup::get()->sort('Sort')
        ));
    }

    public function getTeamCount()
    {
        return BotTeam::get()->count();
    }

    public function getGroupCount()
    {
        return BotGroup::get()->count();
    }

    public function getBotCount()
    {
        return Character::get()->count();
    }

    public function getDefaultImgURL(){
        return BotImage::get_by_id(339)->Image()->FocusFill(187,187)->URL;
    }

    protected function init()
    {
        parent::init();
    }
}
