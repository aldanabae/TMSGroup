<?php

class loginController extends Controller {

  private $_model;

  public function __construct() {
    parent::__construct();
    $this->_model = Load::model('login');
  }

  public function index() {
    $cookie = $this->_model->verifyCookie();

    if ($cookie) {
      $this->initSession($cookie);
      Url::redirect();
    }
    if (Session::get('authorized')) {
      Url::redirect();
    }
    $data['title'] = 'Inicia sesi&oacute;n con tu nombre de usuario y contrase&ntilde;a.';

    if (Validator::validateInteger('login', true) == 1) {
      $data['login'] = $_POST;
      $this->_view->assign('data', $data);

      $post_user = Validator::sanitizeString('username', true);
      $post_pass = Validator::sanitizeSQL('password', true);
      $nologout = Validator::validateInteger('nologout', true);

      if (empty($post_user)) {
        $data['error']['message'] = 'Debe ingresar su nombre de usuario';
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      if (empty($post_pass)) {
        $data['error']['message'] = 'Debe ingresar su contrase&ntilde;a';
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      $user = $this->_model->getUser($post_user, $post_pass);

      if (!$user) {
        $data['error']['message'] = 'Usuario y/o contrase&ntilde;a incorrectos';
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      if ($user['Publico'] != 1) {
        $data['error']['message'] = 'Este usuario no esta habilitado';
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      $this->initSession($user, $nologout);

      Url::redirect();
    }
    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function initSession($user, $nologout = 0) {
    Session::set('authorized', true);
    Session::set('level', $user['RolID']);
    Session::set('name', $user['Nombre']);
    Session::set('email', $user['Email']);
    Session::set('user', $user['Usuario']);
    Session::set('user_id', $user['ID']);
    Session::set('time', time());

    $fields['ID'] = $user['ID'];
    $fields['UltimaVez'] = date('Y-m-d H:i:s', time());
    
    if ($nologout == 1) {
      $fields['KeyCookie'] = $this->generateCookie($user['ID']);
    }
    $this->_model->saveAccess($fields);
  }

  public function close() {
    Session::destroy();
    
    unset($_COOKIE['user_id']);
    unset($_COOKIE['key_cookie']);
    
    setcookie('user_id', '', time() - 3600);
    setcookie('key_cookie', '', time() - 3600);
    
    Url::redirect();
  }

  public function generateCookie($user_id, $days = 30) {
    mt_srand(time());
    $random = mt_rand(1000000, 999999999);
    setcookie('user_id', $user_id, time() + (60 * 60 * 24 * $days));
    setcookie('key_cookie', $random, time() + (60 * 60 * 24 * $days));
    
    return $random;
  }

}

?>
