<?php

/*
 * -------------------------------------
 * www.ideacreativa.tk | Oscar Castillo
 * Framework CMS WebAdmin
 * Registry.php
 * -------------------------------------
 */

class Registry {

  private static $_instance;
  private $_data;

  private function __construct() {
    
  }

  public static function getInstance() {
    if (!self::$_instance instanceof self) {
      self::$_instance = new Registry();
    }
    return self::$_instance;
  }

  public function __set($name, $value) {
    $this->_data[$name] = $value;
  }

  public function __get($name) {
    if (isset($this->_data[$name])) {
      return $this->_data[$name];
    }
    return false;
  }

}
