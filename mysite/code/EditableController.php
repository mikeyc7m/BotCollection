<?php

use SilverStripe\Assets\Image;
use SilverStripe\CMS\Model\SiteTree;
use SilverStripe\Control\Controller;
use SilverStripe\Core\Convert;
use SilverStripe\Forms\TreeDropdownField;
use SilverStripe\Forms\TreeDropdownField_Readonly;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\ValidationException;
use SilverStripe\Security\PermissionProvider;
use SilverStripe\Security\SecurityToken;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Versioned\Versioned;

class EditableController extends Controller implements PermissionProvider
{

    private static $allowed_actions = array(
        'frontendContent',
        'frontendCommit',
        'frontendSave',
        'batchContent',
        'getLinksList',
    );

    public function providePermissions()
    {
        // TODO: Implement providePermissions() method.
    }

    /**
     * Commit a page changed via the frontend editing
     *
     * @param HTTPRequest $request
     * @return string
     */
    public function frontendCommit(HTTPRequest $request)
    {
        if (!SecurityToken::inst()->check($this->request->postVar('SecurityID'))) {
            return $this->ajaxResponse('Invalid security token', false);
        }
        Versioned::set_stage('Stage');
        $urlName = isset($_POST['url']) ? $_POST['url'] : null;

        if ($urlName) {
            $obj = $this->Page($urlName);
            if ($obj->canPublish()) {
                $obj->write();
                $obj->doPublish();
            }
        }

//		Versioned::choose_site_stage();
        $return = new stdClass();
        $return->success = 0;
        $return->message = "1Data not found";

        $data = isset($_POST['data']) ? $_POST['data'] : null;
        if ($data) {
            // deserialise
            $data = json_decode($data);
            $topublish = $data->toPublish;
            foreach ($topublish as $typeInfo => $nothing) {
                list($type, $id) = explode('-', $typeInfo);
                if ($id) {
                    // set all the contents on the item
                    $obj = DataObject::get_by_id($type, $id);
                    if ($obj) {
                        if ($obj->FrontendEditAllowed() && $obj->doPublish()) {
                            $return->success = 1;
                            $return->message = _t('FrontendEditing.PUBLISH_SUCCESSFUL', "Successfully published page");
                        } else {
                            $return->message = _t('FrontendEditing.PUBLISH_NOT_ALLOWED', "You cannot publish that content.");
                        }
                    } else {
                        $return->message = sprintf(_t('FrontendEditing.PAGE_MISSING', 'Page %s could not be found'), $id);
                    }
                } else {
                    $return->message = sprintf(_t('FrontendEditing.PAGE_MISSING', 'Page %s could not be found'), $id);
                }
            }
        }
        $this->response->addHeader('Content-Type', 'application/json');
        return json_encode($return);
    }

    /**
     * Save data into the requested object. Need to make sure that we have a logged in
     * user, and we're operating on the draft stage (can't edit the published stuff directly!)
     *
     * @param HTTPRequest $request
     * @return string
     * @throws ValidationException
     */
    public function frontendSave(HTTPRequest $request)
    {
        if (!$this->validateId(isset($_POST['SecurityID']) ? $_POST['SecurityID'] : null)) {
            return $this->ajaxResponse('Invalid security token', false);
        }

        Versioned::set_stage('Stage');
        $return = new stdClass();
        $return->success = 0;
        $return->message = "2Data not found";

        $rawData = $request->requestVar('data');
        if ($rawData) {
            // deserialise
            $data = json_decode($rawData);
            foreach ($data as $typeInfo => $properties) {
                $id = $properties->ID;
                if ($id) {
                    list($type, $otherid) = explode('-', $typeInfo);
                    // set all the contents on the item
                    $obj = DataObject::get_by_id($type, $id);
                    if ($obj) {
                        if ($obj->FrontendEditAllowed()) {
                            unset($properties->ID);
                            $obj->update($properties);
                            $result = $obj->write();

                            $return->success = $result;
                            $return->message = "Successfully saved page #$id";
                        } else {
                            $return->message = "You cannot edit that object.";
                        }
                    } else {
                        $return->message = sprintf(_t('FrontendEditing.PAGE_MISSING', 'Page %s could not be found'), $id);
                    }
                } else {
                    $return->message = sprintf(_t('FrontendEditing.PAGE_MISSING', 'Page %s could not be found'), $id);
                }
            }
        }
        $this->response->addHeader('Content-Type', 'application/json');
        return Convert::raw2json($return);
    }

    protected function validateId($id)
    {
        $session = $this->request->getSession();
        if (!$id || $id != $session->get('SecurityID')) {
            return false;
        }
        return true;
    }

    /**
     * Gets the content for a particular node. This takes a single parameter to indicate whether
     * to get the RAW content, or whether to get the escaped content that should appear (eg XML_Val) so that
     * things like URLs etc resolve correctly
     * @param HTTPRequest $request
     * @return string
     */
    public function frontendContent(HTTPRequest $request)
    {
        Versioned::choose_site_stage($request);
        $item = $request->param('ID');
        $form = $request->param('OtherID');
        $return = new stdClass();
        $return->success = 0;
        $return->message = "3Data not found";

        if ($item) {
            list($type, $id, $field) = explode('-', $item);
            $item = DataObject::get_by_id($type, $id);
            if ($item && $item->FrontendEditAllowed()) {
                // safe to return data
                $return->success = 1;
                $return->message = "";
                $return->data = $form == 'raw' ? $item->getField($field) : $item->XML_val($field);
            }
        }
        $this->response->addHeader('Content-Type', 'application/json');
        return Convert::raw2json($return);
    }

    public function batchContent(HTTPRequest $request)
    {
        $objects = $this->request->getVar('objects');
        $format = $this->request->getVar('format');
        Versioned::set_stage('Stage');
        $return = new stdClass();
        $return->success = 0;
        $return->message = "Data not found";

        $return->data = array();

        if (is_array($objects) && count($objects)) {
            foreach ($objects as $itemKey) {
                list($type, $id, $field) = explode('-', $itemKey);
                $item = DataObject::get_by_id($type, $id);
                if ($item && $item->FrontendEditAllowed()) {
                    // safe to return data
                    $return->success = 1;
                    $return->message = "";
                    $return->data[$itemKey] = /*$format == 'escaped' ? $item->getField($field) :*/ $item->XML_val($field);
                }
            }
        }

        $this->response->addHeader('Content-Type', 'application/json');
        return Convert::raw2json($return);
    }

    public function getLinksList()
    {
        $this->response->addHeader('Content-Type', 'application/json');
        $pageList = SiteTree::get()->setQueriedColumns(['ID', 'Title', 'ParentID']);
        $list = [];
        foreach ($pageList as $page) {
            $list[$page->ParentID][] = ['ID' => $page->ID, 'title' => $page->Title, 'value' => "[sitetree_link,id=$page->ID]"];
        }
        function branches(&$list, $parent)
        {
            $branch = [];
            foreach ($parent as $k => $v) {
                if (isset($list[$v['ID']])) {
                    $me = $v;
                    $v['menu'] = branches($list, $list[$v['ID']]);
                    array_unshift($v['menu'], $me);
                }
                $branch[] = $v;
            }
            return $branch;
        }

        $tree = branches($list, $list[0]);
        return json_encode($tree);
    }

    public function ajaxResponse($message, $status)
    {
        $this->response->addHeader('Content-Type', 'application/json');
        return Convert::raw2json(array(
            'message' => $message,
            'status' => $status,
        ));
    }
}
