<?php

use SilverStripe\Control\Controller;
use SilverStripe\ORM\DataExtension;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\FieldType\DBHTMLText;
use SilverStripe\Security\Security;
use SilverStripe\Security\SecurityToken;
use SilverStripe\Versioned\Versioned;
use SilverStripe\View\Requirements;

class EditableExtension extends DataExtension
{
    function onBeforeInit()
    {
        Requirements::javascript('resources/Editable/toggle.js');
    }

    public function FrontendEditAllowed()
    {
        return !!Security::getCurrentUser();
    }

    public function EditableField($fieldName, $tagType = 'div')
    {
        // Requirements::javascript('resources/Editable/nicEditDev.js');
        // Requirements::javascript('/assets/_tinymce/tinymce-cms-e54c20c1e6.js');
        Requirements::javascript('resources/silverstripe/admin/thirdparty/tinymce/tinymce.min.js');
        Requirements::javascript('resources/Editable/editor.js');
        Requirements::css('resources/Editable/editor.css');
        $ID = $this->owner->ID;
        $typeInfo = $this->owner->ClassName . '-' . $ID;
        return DBField::create_field(DBHTMLText::class, '<' . $tagType . ' data-security-id="' . SecurityToken::inst()->getSecurityID()
            . '" class="__wysiwyg-editable" id="' . $typeInfo . '|' . $ID . '|' . $fieldName . '">' .
            $this->owner->XML_val($fieldName) . '</' . $tagType . '>');
    }

    public function getLiveSite()
    {
        return Versioned::get_stage() == 'Live';
    }
}
