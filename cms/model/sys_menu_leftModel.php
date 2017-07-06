<?php

class sys_menu_leftModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getMenu($id) {
    return $this->where(array('table' => 'sys_menu_left', 'where' => "ID='" . $id . "'"));
  }

  public function getTablas() {
    return $this->all(array('table' => 'sys_tables', 'where' => "Publico='1'"));
  }

  public function updateMenu($fields) {
    $id = $this->save('sys_menu_left', $fields);
    return ($id) ? $id : false;
  }

  public function deleteMenus($ids) {
    return $this->delete('sys_menu_left', "ID IN (" . implode(',', $ids) . ")");
  }

  public function updateMenus($type, $ids) {
    return $this->update('sys_menu_left', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getNivelMenu($type, $parent) {
    return $this->all(array('table' => 'sys_menu_left', 'where' => "(Publico='" . $type . "') AND (PadreID='" . $parent . "')"));
  }

  public function getSelectPos($menu = null) {
    $where = (is_array($menu)) ? "AND (ID!='" . $menu['ID'] . "') AND (PadreID='" . $menu['PadreID'] . "')" : "AND (PadreID='0')";

    $select = $this->all(array('table' => 'sys_menu_left',
        'campo' => 'ID,Titulo,Posicion,PadreID',
        'where' => "(Publico='1') " . $where,
        'order' => 'Posicion'
    ));

    if (is_array($menu))
      $select[] = array('ID' => $menu['ID'], 'Titulo' => $menu['Titulo'],
          'Posicion' => $menu['Posicion'], 'PadreID' => $menu['PadreID']);

    return $select;
  }

  public function getSelectMenu() {
    return $this->all(array('table' => 'sys_menu_left', 'where' => "(Publico='1') AND (PadreID='0')", 'order' => 'Posicion'));
  }

  public function reorderParentPrev($id, $parent_ant) {
    $select_id = $this->all(array('table' => 'sys_menu_left', 'field' => 'ID',
        'where' => "(Publico='1') AND (ID!='" . $id . "') AND (PadreID='" . $parent_ant . "')", 'order' => 'Posicion'));

    $pos = 1;
    foreach ($select_id as $select) {
      $this->save('sys_menu_left', array('ID' => $select['ID'], 'Posicion' => $pos));
      $pos++;
    }
  }

  public function getSelectPosAct($parent_id) {
    return $this->all(array('table' => 'sys_menu_left', 'field' => 'ID,Titulo,Posicion,PadreID',
                'where' => "(Publico='1') AND (PadreID='" . $parent_id . "')", 'order' => 'Posicion'));
  }

  public function updateParentPos($id, $parent_id, $count) {
    $this->save('sys_menu_left', array('ID' => $id, 'PadreID' => $parent_id, 'Posicion' => $count));
    return $this->where(array('table' => 'sys_menu_left', 'field' => 'ID,Titulo,PadreID,Posicion', 'where' => "ID='" . $id . "'"));
  }

  public function updatePosiciones($ids) {
    $pos = 1;
    foreach ($ids as $id) {
      if ($id != 0) {
        $this->save('sys_menu_left', array('ID' => $id, 'Posicion' => $pos));
      }
      $pos++;
    }
  }

  public function getRoles() {
    return $this->all(array('table' => 'sys_group_user'));
  }

}

?>
