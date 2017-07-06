<?php

/*
 * -------------------------------------
 * www.desarrollowebline.com.ar | Oscar Castillo
 * Framework CMS WebAdmin
 * MenuTop.php
 * -------------------------------------
 */

class MenuTop {

  const table = 'seccion';
  const ulMain = 'flexnav';
  const ulSub = '';
  const liSub = 'active';

  private $_registry;
  protected $_db;

  public function __construct() {
    $this->_registry = Registry::getInstance();
    $this->_db = $this->_registry->_db;
  }

  public function getMenuTop() {
    $tabla = DB_PREF . self::table;
    $menu = $this->_db->query("SELECT ID,PadreID,URL,MenuTop as Titulo
    													 FROM $tabla 
    													 WHERE (Publico='1') AND MenuTop !='' 
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

      if ($name == self::ulMain) {
        $html .= '<li><a href="' . URL_WEB . '">Home</a></li>';
      }

      foreach ($menu['parents'][$parent] as $itemID) {
        if (!isset($menu['parents'][$itemID])) {
          if ($name != self::ulMain)
            $url = (!empty($parent_url)) ? $parent_url . '/' : URL_WEB . 'seccion/';
          else
            $url = URL_WEB . 'seccion/';

          $url.= (!empty($menu['items'][$itemID]['URL'])) ? $menu['items'][$itemID]['URL'] : '';
          $html .= '<li>
											<a href="' . $url . '">' . $menu['items'][$itemID]['Titulo'] . '</a>
										</li>';
        }
        if (isset($menu['parents'][$itemID])) {
          $parent_url = (!empty($menu['items'][$itemID]['URL'])) ?
                  URL_WEB . 'seccion/' . $menu['items'][$itemID]['URL'] : '';
          $url_vacia = (!empty($parent_url)) ? $parent_url : 'javascript:;';
          //$current = ($menu['items'][$itemID]['URL'] == Controller::getItem()) ? self::liSub : '';
          $html .= '<li>
											<a href="' . $url_vacia . '">' . $menu['items'][$itemID]['Titulo'] . '</a>';
          $html .= $this->recursiveMenu($itemID, $menu, self::ulSub, false, $parent_url);
          $html .= '</li>';
        }
      }
      $html .= '</ul>' . "\n";
    }
    return $html;
  }

  public function render() {
    $output = '<div class="menu-button">'
            . '<span class="line-menu"></span>'
            . '<span class="line-menu"></span>'
            . '<span class="line-menu"></span>'
            . '</div>';
    $menu = $this->getItemsMenu();
    $output.= $this->recursiveMenu(0, $menu, self::ulMain);
    return $output;
  }

}
