<?php

/*
 * -------------------------------------
 * www.desarrollowebline.com.ar | Oscar Castillo
 * Framework CMS WebAdmin
 * MenuTop.php
 * -------------------------------------
 */

class MenuLeft {

  const table = 'categoria_prod';
  const ulMain = 'menuleft';
  const ulSub = 'sub-menu';
  const liSub = 'current';

  private $id;
  private $_registry;
  protected $_db;

  public function __construct($id) {
    $this->id = $id;
    $this->_registry = Registry::getInstance();
    $this->_db = $this->_registry->_db;
  }

  public function getMenuTop() {
    $tabla = DB_PREF . self::table;
    $menu = $this->_db->query("SELECT ID,Nombre,PadreID,URL,Css
    													 FROM $tabla 
    													 WHERE (Publico='1') 
    													 ORDER BY Posicion");
    return $menu->fetchall();
  }

  public function getItemsMenu() {
    $menu = array(
        'items' => array(),
        'parents' => array()
    );

    $items = $this->getMenuTop();

    foreach ($items as $item) {
      $menu['items'][$item['ID']] = $item;
      $menu['parents'][$item['PadreID']][] = $item['ID'];
    }
    return $menu;
  }

  public function recursiveMenu($parent, $menu, $name = '', $icono = true, $parent_url = '') {
    $html = '';

    if (isset($menu['parents'][$parent])) {
      $html .= '<ul class="' . $name . '">' . "\n";

      foreach ($menu['parents'][$parent] as $itemID) {
        if (!isset($menu['parents'][$itemID])) {
          $url = (!empty($menu['items'][$itemID]['URL'])) ? $parent_url . '/' . $menu['items'][$itemID]['URL'] : '';
          $css = (!empty($menu['items'][$itemID]['Css'])) ? 'class="' . $menu['items'][$itemID]['Css'] . '"' : '';

          $html .= '<li ' . $css . '>
											<a href="' . $url . '">' . $menu['items'][$itemID]['Nombre'] . '</a>
										</li>';
        }
        if (isset($menu['parents'][$itemID])) {
          $parent_url = (!empty($menu['items'][$itemID]['URL'])) ?
                  $parent_url . '/' . $menu['items'][$itemID]['URL'] : '';

          $css = (!empty($menu['items'][$itemID]['Css'])) ? 'class="' . $menu['items'][$itemID]['Css'] . '"' : '';

          $html .= '<li ' . $css . '>
											<a href="javascript:;">' . $menu['items'][$itemID]['Nombre'] . '</a>';
          $html .= $this->recursiveMenu($itemID, $menu, self::ulSub, false, $parent_url);
          $html .= '</li>';
        }
      }
      $html .= '</ul>' . "\n";
    }
    return $html;
  }

  public function render() {
    $menu = $this->getItemsMenu();
    $url_parent = URL_WEB . 'cateprod/' . $menu['items'][$this->id]['URL'];

    return $this->recursiveMenu($this->id, $menu, self::ulMain, false, $url_parent);
  }

}
