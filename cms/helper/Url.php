<?php

class Url {

	public static function redirect($url = null, $fullpath = false)
	{
		if($fullpath == false) {
			header('location: '.URL_CMS.$url);
			exit;
		} else {
			header('location: '.$url);
			exit;
		}
	}

	public static function getTemplatePath()
	{
		return ROOT.'view/template/'.Session::get('template').'/';
	}
}
