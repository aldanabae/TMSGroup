<?php

/*
 * -------------------------------------
 * www.desarrollowebline.com.ar | Oscar Castillo
 * Framework CMS WebAdmin
 * MenuBpt.php
 * -------------------------------------
 */

class MenuBot {

  const table = 'seccion';

  private $_registry;
  protected $_db;
  private $total;
  private $media;

  public function __construct() {
    $this->_registry = Registry::getInstance();
    $this->_db = $this->_registry->_db;
  }

  public function getMenuBot($ids) {
    $tabla = DB_PREF . self::table;
    $menu = $this->_db->query("SELECT ID,PadreID,URL,MenuBot as Titulo
    													 FROM $tabla 
    													 WHERE Publico='1' AND (ID IN (" . $ids . ") OR PadreID IN (" . $ids . "))  
    													 ORDER BY Posicion");
    return $menu->fetchall();
  }

  public function getItemsMenu($data) {
    $menu = array(
        'items' => array(),
        'parents' => array()
    );

    $ids = implode(',', $data);
    $items = $this->getMenuBot($ids);

    foreach ($items as $item) {
      $menu['items'][$item['ID']] = $item;
      $menu['parents'][$item['PadreID']][] = $item['ID'];
    }

    return $menu;
  }

  public function recursiveMenu($parent, $menu, $name = 'list', $parent_url = '') {
    $html = '';
    if (isset($menu['parents'][$parent])) {
      $html .= '<ul class="' . $name . '">' . "\n";
      foreach ($menu['parents'][$parent] as $itemID) {
        $class = '';
        if (!isset($menu['parents'][$itemID])) {
          $url = (!empty($parent_url)) ? URL_WEB . $parent_url . '/' : URL_WEB;
          $url.= $menu['items'][$itemID]['URL'];

          $html .= '<li>
											<a href="' . $url . '">' . $menu['items'][$itemID]['Titulo'] . '</a>
										</li>';
        }
        if (isset($menu['parents'][$itemID])) {
          $parent_url = 'seccion/' . $menu['items'][$itemID]['URL'];

          $html .= '<li>
											<a href="' . $parent_url . '">' . $menu['items'][$itemID]['Titulo'] . '</a>';
          $html .= $this->recursiveMenu($itemID, $menu, '', $parent_url);
          $html .= '</li>';
        }
      }
      $html .= '</ul>' . "\n";
    }
    return $html;
  }

  public function render() {
    $ids = array();
    $tabla = DB_PREF . self::table;
    $menu = $this->_db->query("SELECT ID FROM " . $tabla . " WHERE Publico='1' AND PadreID='0'");
    $parents = $menu->fetchall();

    if (count($parents) > 0) {
      foreach ($parents as $parent) {
        $ids[] = $parent['ID'];
      }

      $media = round(count($parents) / 3);
      $data = array_chunk($ids, $media, true);

      $submenu1 = $this->getItemsMenu($data[0]);
      $menu = $this->recursiveMenu(0, $submenu1);

      if (isset($data[1])) {
        $submenu2 = $this->getItemsMenu($data[1]);
        $menu.= $this->recursiveMenu(0, $submenu2);
      }

      return $menu;
    }

    return false;
  }

}
