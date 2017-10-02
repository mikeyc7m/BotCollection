<?php
use SilverStripe\Admin\ModelAdmin;

    class Bot_ModelAdmin extends ModelAdmin
    {

        private static $managed_models = [
            'Collection',
        	'Character',
            'BotGroup',
        	'BotTeam',
        ];

        private static $url_segment = 'bots';

        private static $menu_title = 'Database';
        //private static $model_importers = [];
    }