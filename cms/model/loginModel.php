<?php

class loginModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function verifyCookie() {
    if (isset($_COOKIE['user_id']) && isset($_COOKIE['key_cookie'])) {
      if ($_COOKIE['user_id'] != '' || $_COOKIE['key_cookie'] != '') {
        return $this->where(array('table' => 'sys_user',
                    'where' => "ID='" . $_COOKIE['user_id'] . "' AND KeyCookie='" . $_COOKIE['key_cookie'] . "' AND KeyCookie!=''"));
      }
    }
    return false;
  }

  public function getUser($usuario, $password) {
    return $this->where(array('table' => 'sys_user',
                'where' => "Usuario='" . $usuario . "' AND Contrasenia='" . Hash::getHash('sha1', $password, HASH_KEY) . "'"));
  }

  public function saveAccess($fields) {
    $this->save('sys_user', $fields);
  }

}

?>
