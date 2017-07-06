<?php

/*
* -------------------------------------
* www.desarrollowebline.com.ar | Oscar Castillo
* Framework CMS WebAdmin
* Captcha.php
* -------------------------------------
*/

class Captcha
{
	private $width = 115;
	private $height = 30;
	private $img = null;
	private $chars = 6;
	private $fontsize = 20;
	private $sessionvar = 'captcha';

	public function __construct() {}

	public function check($post_captcha) 
	{
		if($post_captcha == Session::get($this->sessionvar)) {
			return true;
		}
	}

	public function randomString($length = 6)
	{
		$string = '';
		$chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
		for ($i = 0; $i < $length; $i++) {
			$string .= $chars[mt_rand(0, strlen($chars)-1)];
		}
		return $string;
	}

	public function run($url_font = '')
	{
		$this->img = ImageCreate($this->width, $this->height);

		if($this->img) {
			header('Content-Type: image/png');

			$im = imagecreatetruecolor($this->width, $this->height);
			$blanco = imagecolorallocate($im, 255, 255, 255);
			$gris = imagecolorallocate($im, 128, 128, 128);
			$negro = imagecolorallocate($im, 0, 0, 0);
			imagefilledrectangle($im, 0, 0, $this->width-1, $this->height-1, $blanco);

			$texto = $this->randomString($this->chars);
			$fuente = $url_font;

			imagettftext($im, $this->fontsize, 0, 11, 24, $gris, $fuente, $texto);
			imagettftext($im, $this->fontsize, 0, 10, 23, $negro, $fuente, $texto);
			imagepng($im);
			imagedestroy($im);

			Session::set($this->sessionvar,$texto);
		}
	}
}
?>