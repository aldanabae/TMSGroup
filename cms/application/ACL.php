<?php

/*
* -------------------------------------
* www.desarrollowebline.com.ar | Oscar Castillo
* Framework CMS WebAdmin
* ACL.php
* -------------------------------------
*/

class ACL {

  private $roles;

  public function __construct() {
    parent::__construct();
    $this->_registry = Registry::getInstance();
    $this->_db = $this->_registry->_db;
  }

  // override User method
  public static function getUsername($username) {
    $tabla = DB_PREF . 'sys_user';
    $sql = "SELECT * FROM " . $tabla . " WHERE Usuario = " . $username;
    $res = $this->_db->query($sql);
    $user = $res->fetch();

    if (!empty($user)) {
      $aclUser = new ACL();
      $aclUser->user_id = $user['ID'];
      $aclUser->username = $username;
      $aclUser->password = $user['Contrasenia'];
      $aclUser->email = $user['Email'];
      $aclUser->initRoles();

      return $aclUser;
    } else {
      return false;
    }
  }

  // populate roles with their associated permissions
  protected function initRoles() {
    $t1 = DB_PREF . 'sys_user_rol';
    $t2 = DB_PREF . 'sys_roles';

    $this->roles = array();
    $sql = "SELECT t1.RolID, t2.Rol FROM " . $t1 . " as t1
                JOIN " . $t2 . " as t2 ON t1.RolID = t2.RolID
                WHERE t1.UserID = " . $this->user_id;
    $res = $this->_db->query($sql);
    $roles = $res->fetchAll();

    foreach ($roles as $rol) {
      $this->roles[$rol['Rol']] = Role::getRolePerms($rol['RolID']);
    }
  }

  // check if user has a specific privilege
  public function hasPrivilege($perm) {
    foreach ($this->roles as $role) {
      if ($role->hasPerm($perm)) {
        return true;
      }
    }
    return false;
  }

  // insert a new role
  public static function insertRole($role_name) {
    $tabla = DB_PREF . 'sys_roles';
    $sql = "INSERT INTO " . $tabla . " (Rol) VALUES (" . $role_name . ")";
    $rol = $this->_db->query($sql);

    return $rol;
  }

  // insert array of roles for specified user id
  public static function insertUserRoles($user_id, $roles) {
    $tabla = DB_PREF . 'sys_user_rol';

    foreach ($roles as $role_id) {
      $sql = "INSERT INTO " . $tabla . " (UserID, RolID) VALUES (" . $user_id . ", " . $role_id . ")";
      $rol = $this->_db->query($sql);
    }
    return true;
  }

  // delete array of roles, and all associations
  public static function deleteRoles($roles) {
    $t1 = DB_PREF . 'sys_roles';
    $t2 = DB_PREF . 'sys_user_rol';
    $t3 = DB_PREF . 'sys_rol_perm';

    foreach ($roles as $role_id) {
      $sql = "DELETE t1, t2, t3 FROM " . $t1 . " as t1
            JOIN " . $t2 . " as t2 on t1.ID = t2.RolID
            JOIN " . $t3 . " as t3 on t1.ID = t3.RolID
            WHERE t1.ID = " . $role_id;
      $rol = $this->_db->query($sql);
    }
    return true;
  }

  // delete ALL roles for specified user id
  public static function deleteUserRoles($user_id) {
    $tabla = DB_PREF . 'sys_user_rol';
    $sql = "DELETE FROM " . $tabla . " WHERE UserID = " . $user_id;
    $rol = $this->_db->query($sql);

    return $rol;
  }

  // check if a user has a specific role
  public function hasRole($role_name) {
    return isset($this->roles[$role_name]);
  }

  // insert a new role permission association
  public static function insertPerm($role_id, $perm_id) {
    $tabla = DB_PREF . 'sys_rol_perm';
    $sql = "INSERT INTO ".$tabla." (RolID, PermisoID) VALUES (".$role_id.",".$perm_id.")";
    $rol = $this->_db->query($sql);
    
    return $rol;
  }

  // delete ALL role permissions
  public static function deletePerms() {
    $tabla = DB_PREF . 'sys_rol_perm';
    $sql = "TRUNCATE ".$tabla;
    $rol = $this->_db->query($sql);
    return $rol;
  }

}
