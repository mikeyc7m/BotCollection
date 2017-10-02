<?php

use SilverStripe\ORM\DataExtension;

class BotMember_extension extends DataExtension
{
    private static $has_many = array(
   		'Collections'=>'Collection'
    );

}