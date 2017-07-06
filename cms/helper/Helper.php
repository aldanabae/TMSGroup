<?php

class Helper {

	public static function setAttributes($attributes = array()) {
		$content = '';
		foreach($attributes as $attribute => $value) {
			if($value != '') $content .= ($content != '' ? ' ' : '').$attribute.'="'.preg_replace('/\"/', '&quot;', $value).'"';
		}
		return $content;
	}

	public static function tag2($tag,$value,$attributes = array()) {
		return '<'.$tag.' '.self::setAttributes($attributes).'>'.$value.'</'.$tag.'>';
	}

	public static function input($attributes = array()) {
		return '<input '.self::setAttributes($attributes).' />';
	}

	public static function image_youtube($code,$num = 0) {
		return "http://img.youtube.com/vi/".$code."/".$num.".jpg";
	}

	public static function format_date($date,$anio = true)
	{
		$days = array('Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado');
		$months = array('','Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
		$year = date('Y',$date);
		$month = date('n',$date);
		$day = date('j',$date);
		$week = date('w',$date);
		$text_year = ($anio) ? ' de '.$year : '';
		$new_date = $days[$week].', '.$day.' de '.$months[$month].$text_year;

		return $new_date;
	}

	public static function text_limit($string,$limit,$break = ' ',$pad = '...')
	{
		/* $break = '.' */
		if(strlen($string) <= $limit) return $string;
		$breakpoint = strpos($string, $break, $limit);
		if($breakpoint !== false) {
			if($breakpoint < (strlen($string)-1)) {
				$string = substr($string, 0, $breakpoint).$pad;
			}
		}
		return $string;
	}

	public function replace_accents($str) {
		$str = htmlentities($str, ENT_COMPAT, "UTF-8");
		$str = preg_replace('/&([a-zA-Z])(uml|acute|grave|circ|tilde);/','$1',$str);
		return html_entity_decode($str);
	}
	
	public function html_entities($str) {
		$str = htmlspecialchars(stripslashes($str));
		return $str;
	}

}
