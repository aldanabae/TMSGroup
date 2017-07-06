<?php

/*
 * -------------------------------------
 * www.desarrollowebline.com.ar | Oscar Castillo
 * Framework CMS WebAdmin
 * DataTables.php
 * -------------------------------------
 */

class DataTables {

  private $sIndexColumn;
  private $aColumns;
  private $sTable;
  private $_registry;
  protected $_db;
  protected $_callback_row;
  protected $_callback_action;
  protected $_where;
  protected $_order;

  public function __construct($sTable = '', $aColumns = array(), $where = '', $callback_row = null, $callback_action = null, $order = null) {
    $this->sTable = $sTable;
    $this->aColumns = $aColumns;
    $this->sIndexColumn = 'ID';
    $this->_where = $where;
    $this->_order = $order;
    $this->_callback_row = $callback_row;
    $this->_callback_action = $callback_action;

    $this->_registry = Registry::getInstance();
    $this->_db = $this->_registry->_db;
  }

  public function getLimit() {
    $sLimit = '';
    if (isset($_GET['iDisplayStart']) && $_GET['iDisplayLength'] != '-1') {
      $max_length = intval($_GET['iDisplayLength']);
      $sLimit = "LIMIT " . intval($_GET['iDisplayStart']) . ", " . $max_length;
    }
    return $sLimit;
  }

  public function getOrder() {
    $sOrder = '';
    if (isset($_GET['iSortCol_0'])) {
      $sOrder = "ORDER BY  ";
      for ($i = 0; $i < intval($_GET['iSortingCols']); $i++) {
        if ($_GET['bSortable_' . intval($_GET['iSortCol_' . $i])] == "true") {
          $sOrder .= "`" . $this->aColumns[intval($_GET['iSortCol_' . $i])] . "` " .
                  ($_GET['sSortDir_' . $i] === 'asc' ? 'asc' : 'desc') . ", ";
        }
      }
      $sOrder = substr_replace($sOrder, '', -2);

      if ($sOrder == "ORDER BY") {
        $sOrder = '';
      }
    }

    if ($this->_order)
      $sOrder = "ORDER BY " . $this->_order;

    return $sOrder;
  }

  public function getFiltering() {
    $sWhere = (!empty($this->_where)) ? 'WHERE ' . $this->_where : '';

    if (isset($_GET['sSearch']) && $_GET['sSearch'] != '') {
      $sWhere = (empty($sWhere)) ? 'WHERE ' : ' AND ';

      $sWhere.= "(";
      for ($i = 0; $i < count($this->aColumns); $i++) {
        if (isset($_GET['bSearchable_' . $i]) && $_GET['bSearchable_' . $i] == "true") {
          $sWhere .= "`" . $this->aColumns[$i] . "` LIKE '%" . filter_input(INPUT_GET, 'sSearch', FILTER_SANITIZE_URL) . "%' OR ";
        }
      }
      $sWhere = substr_replace($sWhere, '', -3);
      $sWhere .= ')';
    }

    /* Individual column filtering */
    for ($i = 0; $i < count($this->aColumns); $i++) {
      if (isset($_GET['bSearchable_' . $i]) && $_GET['bSearchable_' . $i] == "true" && $_GET['sSearch_' . $i] != '') {
        if ($sWhere == '') {
          $sWhere = "WHERE ";
        } else {
          $sWhere .= " AND ";
        }
        $sWhere .= "`" . $this->aColumns[$i] . "` LIKE '%" . filter_input(INPUT_GET, 'sSearch_' . $i, FILTER_SANITIZE_URL) . "%' ";
      }
    }
    return $sWhere;
  }

  public function getFilterTotal() {
    $sQuery = "SELECT SQL_CALC_FOUND_ROWS `" . str_replace(" , ", " ", implode("`, `", $this->aColumns)) . "`
      FROM " . DB_PREF . $this->sTable . ' ' . $this->getFiltering() . ' ' . $this->getOrder() . ' ' . $this->getLimit();

    return $this->_db->foundRows($sQuery);
  }

  public function getDataDisplay() {
    $output = array();

    $sQuery = "SELECT SQL_CALC_FOUND_ROWS `" . str_replace(" , ", " ", implode("`, `", $this->aColumns)) . "`
      FROM " . DB_PREF . $this->sTable . ' ' . $this->getFiltering() . ' ' . $this->getOrder() . ' ' . $this->getLimit();
    //Controller::trace($sQuery);

    $rResult = $this->_db->query($sQuery);

    foreach ($rResult as $aRow) {
      $row = array();

      foreach ($this->aColumns as $aColumn) {
        if ($this->_callback_row)
          $field = call_user_func($this->_callback_row, $aColumn, $aRow[$aColumn]);
        if (!is_null($field))
          $row[] = $field;
      }
      if ($this->_callback_action)
        $row[] = call_user_func($this->_callback_action, $aRow);
      $output[] = $row;
    }

    return $output;
  }

  public function totalRecords() {
    $aTotalRecords = $this->_db->count($this->sTable, '', $this->sIndexColumn);

    return $aTotalRecords;
  }

  public function render() {
    $output = array(
        "sEcho" => intval($_GET['sEcho']),
        "iTotalRecords" => $this->totalRecords(),
        "iTotalDisplayRecords" => $this->getFilterTotal(),
        "aaData" => $this->getDataDisplay()
    );
    return json_encode($output);
  }

}
