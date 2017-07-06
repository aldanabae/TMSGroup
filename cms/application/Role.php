<?php

/*
* -------------------------------------
* www.desarrollowebline.com.ar | Oscar Castillo
* Framework CMS WebAdmin
* Role.php
* -------------------------------------
*/

class Role 
{ 
  protected $permissions;

  protected function __construct() {
    $this->permissions = array();
    $this->_registry = Registry::getInstance();
    $this->_db = $this->_registry->_db;
  }

  // return a role object with associated permissions
  public static function getRolePerms($role_id) {
    $t1 = DB_PREF . 'sys_rol_perm';
    $t2 = DB_PREF . 'sys_permisos';
    
    $sql = "SELECT t2.Permiso FROM ".$t1." as t1 JOIN ".$t2." as t2 ON t1.PermisoID = t2.ID
            WHERE t1.RolID = ".$role_id;
    $res = $this->_db->query($sql);
    $perms = $res->fetchall();    
    
    $role = new Role();
    
    foreach ($perms as $perm) {
      $role->permissions[$perm["Permiso"]] = true;
    }
    return $role;
  }

  // check if a permission is set
  public function hasPerm($permission) {
    return isset($this->permissions[$permission]);
  }

}
