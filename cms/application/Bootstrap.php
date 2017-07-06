<?php
/*
* -------------------------------------
* www.adnyamultimedia.com.ar | Oscar Castillo
* CMS MVC
* Bootstrap.php
* -------------------------------------
*/

class Bootstrap
{
	public static function route(Request $request)
	{
		$controller = $request->getController().'Controller';
		$method = $request->getMethod();
		$args = $request->getArgs();

		$controllerFile = ROOT.'controller'.DS.$controller.'.php';

		if(is_readable($controllerFile)) {
			require_once $controllerFile;

			$class = new $controller;
			$method = (is_callable(array($class,$method))) ? $method : 'index';

			if(isset($args)) {
				call_user_func_array(array($class,$method),$args);
			} else {
				call_user_func(array($class,$method));
			}
		}	else {
			throw new Exception('Error: Controlador '.$controllerFile.' no encontrado');
		}
	}
}

?>