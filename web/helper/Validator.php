<?php

class Validator
{
	public function __construct() {}

	public static function validateEmail($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		
		if(filter_var($var, FILTER_VALIDATE_EMAIL) === FALSE) {
			return false;
		}
		
		return true;
	}
			
	public static function sanitizeEmail($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		$email = preg_replace('((?:\n|\r|\t|%0A|%0D|%08|%09)+)i' ,'',$var);
		$var = (string) filter_var($email, FILTER_SANITIZE_EMAIL);
		
		return $var;
	}
	
	public static function validateUrl($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		
		if(filter_var($var, FILTER_VALIDATE_URL) === FALSE) {
			return false;
		}
		
		return true;
	}
	
	public static function sanitizeUrl($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		$var = (string) filter_var($var,  FILTER_SANITIZE_URL);
		
		return $var;
	}
	
	public static function validateInteger($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		
		if(filter_var($var, FILTER_VALIDATE_INT) === FALSE) {
			return false;
		}
		
		return true;
	}
	
	public static function sanitizeInteger($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		$var = (int) filter_var($var, FILTER_SANITIZE_NUMBER_INT);
		
		return $var;
	}
	
	public static function validateString($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		
		if(!is_string($var))	{
			return false;
		}
		
		return true;
	}

	public static function sanitizeString($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		$var = (string) filter_var($var, FILTER_SANITIZE_STRING);
		
		return $var;
	}
	
	public static function validateFloat($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		
		if(filter_var($var, FILTER_VALIDATE_FLOAT) === false) {
			return false;
		}
		
		return true;
	}
	
	public static function validateBool($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		
		if(filter_var($var, FILTER_VALIDATE_BOOLEAN) === false) {
			return false;
		}
		
		return true;
	}
	
	public static function sanitizeSQL($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');		
		$var = strip_tags($var);
	
		if (!get_magic_quotes_gpc()) {
			$var = addslashes($var);
		}
		
		return trim($var);
	}
	
	public static function sanitizeHTML($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		$var = htmlspecialchars($var, ENT_QUOTES);
		
		return $var;
	}
	
	public static function validateAlphaNum($var, $is_post = false) 
	{
		$var = (!$is_post) ? $var : (isset($_POST[$var]) ? $_POST[$var] : '');
		
		if (!preg_match('/^[a-z\d_]{4,28}$/i', $var)) {
    	return false;
		}
		
		return $var;
	}

}

?>
