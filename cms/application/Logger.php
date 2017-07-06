<?php

/*
* -------------------------------------
* www.desarrollowebline.com.ar | Oscar Castillo
* Framework CMS WebAdmin
* Logger.php
* -------------------------------------
*/

class Logger
{
	private static $print_error = false;

	public static function customErrorMsg()
	{
		echo "<p><b>Importante</b>: Ha ocurrido un error, se ha informado del error al equipo de desarrollo y estará solucionado lo antes posible.</p>";
		exit;
	}

	public static function exception_handler($e)
	{
		self::newMessage($e);
		self::customErrorMsg();
	}

	public static function error_handler($number, $message, $file, $line)
	{
		$msg = "$message en $file en linea $line";

		if(($number !== E_NOTICE) && ($number < 2048)) {
			self::errorMessage($msg);
			self::customErrorMsg();
		}
		return 0;
	}

	public static function newMessage(Exception $exception, $print_error = false, $clear = false, $error_file = 'errorlog.html')
	{
		$message = $exception->getMessage();
		$code = $exception->getCode();
		$file = $exception->getFile();
		$line = $exception->getLine();
		$trace = $exception->getTraceAsString();
		$date = date('M d, Y G:iA');

		$log_message = "<h3>Exception information:</h3>\n
			<p><strong>Fecha:</strong> {$date}</p>\n
			<p><strong>Mensaje:</strong> {$message}</p>\n
			<p><strong>Codigo:</strong> {$code}</p>\n
			<p><strong>Archivo:</strong> {$file}</p>\n
			<p><strong>Linea:</strong> {$line}</p>\n
			<h3>Stack trace:</h3>\n
			<pre>{$trace}</pre>\n
			<hr />\n";

		if(is_file($error_file) === false) {
			file_put_contents($error_file, '');
		}

		if($clear) {
			$content = '';
		} else {
			$content = file_get_contents($error_file);
		}

		file_put_contents($error_file, $log_message . $content);

		if($print_error == true){
			echo $log_message;
			exit;
		}
	}

	public static function errorMessage($error, $print_error = false, $error_file = 'errorlog.html')
	{
		$date = date('M d, Y G:iA');
		$log_message = "<p>Error on $date - $error</p>";

		if( is_file($error_file) === false ) {
			file_put_contents($error_file, '');
		}

		$content = file_get_contents($error_file);
		file_put_contents($error_file, $log_message . $content);

		if($print_error == true){
			echo $log_message;
			exit;
		}
	}
}
