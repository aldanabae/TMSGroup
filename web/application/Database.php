<?php

/*
 * -------------------------------------
 * www.ideacreativa.tk | Oscar Castillo
 * Framework CMS WebAdmin
 * Database.php
 * -------------------------------------
 */

class Database {

  private static $db;
  private $dbh;

  private function __construct() {
    $params = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES " . DB_CHAR);

    try {
      $this->dbh = new PDO(DB_DRIVER . ":dbname=" .
              DB_NAME . ";host=" .
              DB_HOST, DB_USER, DB_PASS, $params);
    } catch (PDOException $e) {
      echo 'Connection failed: ' . $e->getMessage() . "\n";
      self::$db = null;
    }
  }

  private function __clone() {
    
  }

  public static function connect() {
    if (!self::$db) {
      self::$db = new Database;
    }
    return self::$db;
  }

  public static function changeDB($database) {
    self::instance()->exec('USE ' . $database);
  }

  public function foundRows($query) {
    try {
      $result = self::$db->query($query);
      $results = self::$db->query('SELECT FOUND_ROWS()');
      return (int) $results->fetchColumn();
    } catch (PDOException $e) {
      throw new Exception($e->getMessage());
    }
  }

  public function count($table, $where = '', $field = '*') {
    try {
      $where = (!empty($where)) ? " WHERE " . $where : '';

      $table = DB_PREF . $table;
      $query = "SELECT count(" . $field . ") FROM " . $table . $where;
      $result = self::$db->prepare($query);
      $result->execute();
      return $result->fetchColumn();
    } catch (PDOException $e) {
      throw new Exception($e->getMessage());
    }
  }

  public function __call($method, $args = array()) {
    return call_user_func_array(array($this->dbh, $method), $args);
  }

  public static function __callStatic($method, $args = array()) {
    $db = self::instance();
    return call_user_func_array(array($db->dbh, $method), $args);
  }

}

?>