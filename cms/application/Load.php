<?php

/*
 * -------------------------------------
 * www.desarrollowebline.com.ar | Oscar Castillo
 * Framework CMS WebAdmin
 * Controller.php
 * -------------------------------------
 */

class Load {

  public static function view($file, $data = array()) {
    $viewFile = ROOT . 'view' . DS . CMS_THEME . DS . 'template' . DS . $file . '.php';

    if (is_readable($viewFile)) {
      require($viewFile);
    } else {
      throw new Exception('Error: Vista ' . $viewFile . ' no encontrada');
    }
  }

  public static function model($name) {
    $model = $name . 'Model';
    $modelPath = ROOT . 'model' . DS . $model . '.php';

    if (is_readable($modelPath)) {
      require_once($modelPath);

      if (class_exists($model)) {
        $registry = Registry::getInstance();
        $registry->$name = new $model;
        return $registry->$name;
      }
    } else {
      throw new Exception('Error: Modelo ' . $modelPath . ' no encontrado');
    }
  }

  public static function library($name) {
    $libPath = ROOT . 'lib' . DS . $name . '.php';

    if (is_readable($libPath)) {
      require_once($libPath);
    } else {
      throw new Exception('Error: Libreria ' . $libPath . ' no encontrada');
    }
  }

  public static function loadCssFile($filename, $media = 'screen', $base_url = null, $conditional = null) {
    if ($base_url) {
      $result = '<link rel="stylesheet" href="' . $base_url . $filename . '.css" type="text/css" media="' . $media . '" />' . PHP_EOL;
    } else {
      $result = '<link rel="stylesheet" href="' . URL_CMS . $filename . '.css" type="text/css" media="' . $media . '" />' . PHP_EOL;
    }
    if ($conditional != null) {
      $result = '<!--[if ' . $conditional . ']>' . $result . '<![endif]-->' . PHP_EOL;
    }
    return $result;
  }

  public static function loadJsFile($filename, $base_url = null, $full_path = null) {
    if ($full_path) {
      $result = '<script type="text/javascript" src="' . $filename . '"></script>' . PHP_EOL;
    } else if ($base_url) {
      $result = '<script type="text/javascript" src="' . $base_url . $filename . '.js"></script>' . PHP_EOL;
    } else {
      $result = '<script type="text/javascript" src="' . URL_CMS . $filename . '.js"></script>' . PHP_EOL;
    }
    return $result;
  }

}
