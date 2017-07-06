<?php

/*
 * -------------------------------------
 * www.ideacreativa.tk | Oscar Castillo
 * Framework CMS WebAdmin
 * Model.php
 * -------------------------------------
 */

class Model {

  private $_registry;
  protected $_db;

  public function __construct() {
    $this->_registry = Registry::getInstance();
    $this->_db = $this->_registry->_db;
  }

  public function create($info = array('table' => '', 'field' => '', 'where' => '', 'order' => '', 'limit' => '')) {
    if (isset($info['table']) && !empty($info['table'])) {
      $field = (isset($info['field'])) ? $info['field'] : '*';
      $where = (isset($info['where'])) ? "WHERE " . $info['where'] . " " : '';
      $order = (isset($info['order'])) ? "ORDER BY " . $info['order'] . " " : '';
      $limit = (isset($info['limit'])) ? "LIMIT " . $info['limit'] : '';

      $table = DB_PREF . $info['table'];
      $query = "SELECT " . $field . " FROM " . $table . ' ' . $where . $order . $limit;
      return $query;
    }
  }

  public function field($table, $field, $where) {
    $result = $this->where(array('table' => $table, 'field' => $field, 'where' => $where), true);

    return ($result) ? $result : false;
  }

  public function find($table, $id) {
    $result = $this->where(array('table' => $table, 'where' => 'ID=' . $id));

    return ($result) ? $result : false;
  }

  public function where($info = array('table' => '', 'field' => '', 'where' => ''), $one = false) {
    try {
      $query = $this->create($info);
      $result = $this->_db->prepare($query);
      $result->execute();
      $result = $result->fetch(PDO::FETCH_ASSOC);
      $result = ($one) ? $result[$info['field']] : $result;

      return ($result) ? $result : false;
    } catch (PDOException $e) {
      throw new Exception($e->getMessage());
    }
  }

  public function all($info = array('table' => '', 'field' => '', 'where' => '', 'order' => '', 'limit' => '')) {
    try {
      $query = $this->create($info);
      $result = $this->_db->prepare($query);
      $result->execute();

      return ($result) ? $result->fetchAll(PDO::FETCH_ASSOC) : false;
    } catch (PDOException $e) {
      throw new Exception($e->getMessage());
    }
  }

  public function save($table, $attributes = array(), $id_name = "ID") {
    $attributes = $this->matchColumns($table, $attributes);

    if (isset($attributes[$id_name])) {
      $sql = $this->getUpdate($table, $attributes, $id_name);
    } else {
      $sql = $this->getInsert($table, $attributes);
    }

    try {
      $sth = $this->_db->prepare($sql);
      $sth->execute($attributes);

      return $this->_db->lastInsertId();
    } catch (PDOException $e) {
      throw new Exception($e->getMessage());
    }
  }

  private function getInsert($table, $attributes = array()) {
    $keys = array_keys($attributes);
    $table = DB_PREF . $table;

    return "INSERT INTO " . $table .
            "(" . implode(",", $keys) . ")" .
            " VALUES(:" . implode(",:", $keys) . ")";
  }

  private function getUpdate($table, $attributes, $id_name) {
    $updates = '';
    foreach ($attributes as $key => $value) {
      if ($id_name != $key) {
        $updates .= $key . '=:' . $key . ',';
      }
    }

    $updates = rtrim($updates, ",");
    $table = DB_PREF . $table;

    $sql = "UPDATE " . $table .
            " SET " . $updates .
            " WHERE " . $id_name . "=:" . $id_name;
    return $sql;
  }

  public function update($table, $sets, $where) {
    $updates = '';
    foreach ($sets as $key => $value) {
      $updates .= $key . "='" . $value . "',";
    }

    $updates = rtrim($updates, ",");

    $table = DB_PREF . $table;
    $sql = "UPDATE " . $table . " SET " . $updates . " WHERE " . $where;
    //Controller::trace($sql);
    try {
      $sth = $this->_db->prepare($sql);
      $sth->execute();
    } catch (PDOException $e) {
      throw new Exception($e->getMessage());
    }
  }

  public function delete($table, $where) {
    $table = DB_PREF . $table;
    $sql = "DELETE FROM " . $table . " WHERE " . $where;
    try {
      $sth = $this->_db->prepare($sql);
      $sth->execute();
    } catch (PDOException $e) {
      throw new Exception($e->getMessage());
    }
  }

  private function matchColumns($table, $attributes) {
    $new = array();
    $table = DB_PREF . $table;
    $sth = $this->_db->query('DESCRIBE ' . $table);

    foreach ($sth->fetchAll(PDO::FETCH_ASSOC) as $row) {
      if (isset($attributes[$row['Field']]))
        $new[$row['Field']] = $attributes[$row['Field']];
    }
    return $new;
  }

  public function rowCount($table, $where = '') {
    $where = (!empty($where)) ? " WHERE " . $where : '';

    $table = DB_PREF . $table;
    $sth = $this->_db->query("SELECT * FROM " . $table . $where);
    return $sth->rowCount();
  }

  /*
    Example: ALTER TABLE table_name ADD `campo` VARCHAR(20) NOT NULL,
   */

  public function alterTable($tab = '', $query = '') {
    $table = DB_PREF . $tab;
    $this->_db->beginTransaction();
    $sth = $this->_db->exec("ALTER TABLE " . $table . " " . $query);
    $this->_db->commit();
  }

  public function truncateTable($tab = '') {
    $table = DB_PREF . $tab;
    $this->_db->beginTransaction();
    $sth = $this->_db->exec("TRUNCATE TABLE " . $table);
    $this->_db->commit();
  }

  public function sql($query = '') {
    try {
      $result = $this->_db->prepare($query);
      $result->execute();
      $result = $result->fetchAll(PDO::FETCH_ASSOC);

      return ($result) ? $result : false;
    } catch (PDOException $e) {
      throw new Exception($e->getMessage());
    }
  }

}

?>
