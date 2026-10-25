<?php

use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\OptionsetField;
use SilverStripe\Omnipay\GatewayFieldsFactory;
use SilverStripe\Omnipay\GatewayInfo;

class SalePageController extends PageController
{
    /**
     * An array of actions that can be accessed via a request. Each array element should be an action name, and the
     * permissions or conditions required to allow the user to access it.
     *
     * <code>
     * [
     *     'action', // anyone can access this action
     *     'action' => true, // same as above
     *     'action' => 'ADMIN', // you must have ADMIN permissions to access this action
     *     'action' => '->checkAction' // you can only access this action if $this->checkAction() returns true
     * ];
     * </code>
     *
     * @var array
     */
    private static $allowed_actions = ['form'];

    protected function init()
    {
        parent::init();
        // You can include any CSS or JS required by your project here.
        // See: https://docs.silverstripe.org/en/developer_guides/templates/requirements/
    }

    public function form()
    {
        $gateways = GatewayInfo::getSupportedGateways();
        // $factory = GatewayFieldsFactory::create($gateways['PayPal_Express']);
        $factory = GatewayFieldsFactory::create('\Omnipay\PayPal\ExpressGateway');

        $form = Form::create(
            $this,
            "Form",
            $factory->getFields(),
            FieldList::create(FormAction::create(
                "doSubmit",
                _t("Checkout.PayNow", "Pay Now")
            ))
        );
        return $form;
    }

    public function doSubmit()
    {
        $request = $this->getRequest();
    }
}
