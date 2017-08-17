<?php

/*
 * -------------------------------------
 * www.ideacreativa.tk | Oscar Castillo
 * Framework CMS WebAdmin
 * View.php
 * -------------------------------------
 */

class View {

  private $_vars;

  public function __construct() {
    
  }

  public function assign($name, $value = null) {
    if (is_array($name)) {
      $this->_vars = $name + $this->_vars;
    } else {
      $this->_vars[$name] = $value;
    }
  }

  public function render($view = '', $route = array()) {
    $this->assign('view', $view);

    extract($this->_vars);

    $_rutaFiles = array(
        'header' => ROOT . 'view' . DS . URL_THEME . DS . 'header' . DS,
        'content' => ROOT . 'view' . DS . URL_THEME . DS . 'modules' . DS,
        'footer' => ROOT . 'view' . DS . URL_THEME . DS . 'footer' . DS,
        'common' => ROOT . 'view' . DS . URL_THEME . DS . 'modules' . DS . 'common' . DS,
        'plantillas' => ROOT . 'view' . DS . URL_THEME . DS . 'modules' . DS . 'plantillas' . DS
    );

    $fileView = $_rutaFiles['content'] . $route['method'] . DS . 'index.php';

    if (is_readable($fileView)) {
      require_once $_rutaFiles['header'] . 'index.php';
      require_once $fileView;
      require_once $_rutaFiles['footer'] . 'index.php';
    } else {
      Url::redirect('error');
    }
  }

}
