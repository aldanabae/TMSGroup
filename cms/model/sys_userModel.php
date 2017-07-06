<?php

class sys_userModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getUser($id) {
    return $this->where(array('table' => 'sys_user', 'where' => "ID='" . $id . "'"));
  }

  public function getContrasenia($id) {
    return $this->field(array('table' => 'sys_user', 'field' => 'Contrasenia', 'where' => "ID='" . $id . "'"));
  }

  public function getRol($id) {
    return $this->field('sys_group_user', 'Nombre', "ID='" . $id . "'");
  }

  public function getRoles() {
    return $this->all(array('table' => 'sys_group_user'));
  }

  public function checkEmail() {
    $id = Session::get('user_id');
    $email = Session::get('email');
    return $this->where(array('table' => 'sys_user', 'where' => "ID!='" . $id . "' AND Email='" . $email . "'"));
  }

  public function checkUser() {
    $id = Session::get('user_id');
    $user = Session::get('user');
    return $this->where(array('table' => 'sys_user', 'where' => "ID!='" . $id . "' AND Usuario='" . $user . "'"));
  }

  public function updateUser($fields) {    
    if (!empty($fields['Contrasenia'])) {
      $fields['Contrasenia'] = Hash::getHash('sha1', $fields['Contrasenia'], HASH_KEY);
    } else {
      unset($fields['Contrasenia']);
    }
    $id = $this->save('sys_user', $fields);
    return ($id) ? $id : false;
  }

}

?>
