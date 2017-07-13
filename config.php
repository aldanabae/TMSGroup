<?php

/*
 * ---------------------------------------------
 * www.ideacreativa.tk | Oscar Castillo
 * Framework CMS WebAdmin
 * Config.php
 * ---------------------------------------------
 */

//CONFIGURACION TIMEZONE
date_default_timezone_set('America/Argentina/Buenos_Aires');

//DATOS DE CONFIGURACIÓN DEL WEBSITE
define('URL_WEB', 'http://192.168.1.236/TMSGroup/');
define('URL_THEME', 'template');
define('URL_GAL', URL_WEB . 'galleries/');
define('URL_CSS', URL_WEB . 'web/view/' . URL_THEME . '/assets/css/');
define('URL_JS', URL_WEB . 'web/view/' . URL_THEME . '/assets/js/');
define('URL_IMG', URL_WEB . 'web/view/' . URL_THEME . '/assets/img/');
define('URL_PLUGINS', URL_WEB . 'web/view/' . URL_THEME . '/assets/plugins/');

//DATOS DE CONFIGURACIÓN DE CMS
define('URL_CMS', URL_WEB . 'cms/');
define('CMS_THEME', 'kingboard');
define('CMS_FONTS', URL_CMS . 'view/' . CMS_THEME . '/assets/fonts/');
define('CMS_CSS', URL_CMS . 'view/' . CMS_THEME . '/assets/css/');
define('CMS_JS', URL_CMS . 'view/' . CMS_THEME . '/assets/js/');
define('CMS_IMG', URL_CMS . 'view/' . CMS_THEME . '/assets/img/');
define('CMS_TEMP', URL_CMS . 'view/temp/');

//MARCA DE AGUA
define('USE_MARCA', '');
define('CMS_MARCA', '');

//CONFIGURACION DE SESION
define('SESSION_PREF', 'tms_');
define('SESSION_TIME', 60);
define('HASH_KEY', '4f6a6d832be79');

//DATOS DE CONFIGURACIÓN DE LA WEB
define('APP_NAME', 'TMS Group');
define('APP_WEB', 'http://www.tmsgroup.com.ar/');
define('APP_AUTOR', 'Oscar Castillo');
define('APP_DESCRIPTION', 'Website by TMS Group');

//DATOS DE LA BASE DE DATOS
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', 'Admin123$');
define('DB_NAME', 'tmsgroup');
define('DB_CHAR', 'latin1');
define('DB_PREF', 'aws_');
define('DB_DRIVER', 'mysql');

//EMAILS DE TESTEO
define('ACTIVE_EMAIL', false);
define('EMAIL_WEBMASTER', 'ocastillo1108@gmail.com');
define('EMAIL_TESTER', 'ocastillo77@outlook.com');

