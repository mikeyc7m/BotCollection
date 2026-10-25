<?php

use SilverStripe\Control\Controller;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Core\Convert;
use SilverStripe\ORM\ArrayList;
use SilverStripe\Security\PermissionProvider;
use SilverStripe\Security\SecurityToken;
use SilverStripe\View\ViewableData;

class DraggableController extends Controller implements PermissionProvider
{

    private static $allowed_actions = array(
        'collection',
        'group',
        'team'
    );

    public function providePermissions()
    {
        // TODO: Implement providePermissions() method.
    }

    public function group(HTTPRequest $request){
        return $this->lookup($request, 'BotGroup');
    }
    
    public function team(HTTPRequest $request){
        return $this->lookup($request, 'BotTeam');
    }
    
    public function collection(HTTPRequest $request){
        return $this->lookup($request, 'Collection');
    }
    
    public function lookup(HTTPRequest $request, $classType)
    {
        if (!SecurityToken::inst()->check($this->request->postVar('SecurityID'))) {
            //    return $this->ajaxResponse('Invalid security token', false);
        }

        $return = new stdClass();
        $return->success = 0;
        $return->message = "Data not found";

        $groupNewID = $_POST['groupNewID'] ?? null;
        $groupOldID = $_POST['groupOldID'] ?? null;
        $botID = $_POST['botID'] ?? null;
        $pageID = $_POST['pageID'] ?? null;

        if (($groupNewID != $groupOldID) && $groupNewID && $groupOldID && $botID && $pageID) {
            /**@var $groupNewObj BotGroup */
            /**@var $groupOldObj BotGroup */
            $groupNewObj = (int)$groupNewID > 0 ? $classType::get()->byID($groupNewID) : null;
            $groupOldObj = (int)$groupOldID > 0 ? $classType::get()->byID($groupOldID) : null;

            $alteredArray = [];
            if ($groupNewObj && $groupNewObj->exists()) {
                $groupNewObj->Characters()->add($botID);
                $alteredArray[] = $groupNewObj;
            }
            if ($groupOldObj && $groupOldObj->exists()) {
                $groupOldObj->Characters()->removeByID($botID);
                $alteredArray[] = $groupOldObj;
            }

            $pageObj = Page::get()->byID($pageID);
            /**@var $extras CollectionPage */
            $extras = CollectionPage::get()->first();
            $result = ViewableData::create();

            return $result->customise([
                'notTeamed'=> $pageObj->notTeamed(),
                'allTeams' => ArrayList::create($alteredArray),
                'notCollected' => $extras->notCollected(),
                'notGrouped' => $extras->notGrouped(),
                'allGroups' => ArrayList::create($alteredArray),
                'isAjax' => true,
                'thePage' => $pageObj
            ])->renderWith($classType . 's');

        }
        $this->response->addHeader('Content-Type', 'application/json');
        return $this->ajaxResponse($return->message, $return->success);
    }

    public function ajaxResponse($message, $status)
    {
        $this->response->addHeader('Content-Type', 'application/json');
        return Convert::raw2json(array(
            'message' => $message,
            'status' => $status,
        ));
    }

    protected function validateId($id)
    {
        $session = $this->request->getSession();
        if (!$id || $id != $session->get('SecurityID')) {
            return false;
        }
        return true;
    }
}
