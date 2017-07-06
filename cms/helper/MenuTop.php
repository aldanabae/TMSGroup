<?php

/*
* -------------------------------------
* www.desarrollowebline.com.ar | Oscar Castillo
* Framework CMS WebAdmin
* MenuTop.php
* -------------------------------------
*/

class MenuTop
{
	const table = 'sys_menu_top';
	private $_registry;  
  protected $_db;
  
  public function __construct() 
	{
		$this->_registry = Registry::getInstance();
		$this->_db = $this->_registry->_db;
	}
	
	public function getMenuTop()
  {
    $tabla = DB_PREF.self::table;
    $menu =  $this->_db->query("SELECT * FROM ".$tabla." WHERE Publico='1' ORDER BY Posicion");
    return $menu->fetchall();
  }

  public function getItemsMenu() 
  {
  	$menu = array(
			'items' => array(),
			'parents' => array()
		);
		
		$items = $this->getMenuTop();

		foreach($items as $item) {
			$menu['items'][$item['ID']] = $item;
			$menu['parents'][$item['PadreID']][] = $item['ID'];
		}    
		return $menu;
  }

  public function recursiveMenu($parent,$menu,$name = 'nav nav-pills',$icono = true,$parent_url = '') 
  {
		$html = '';
		
		if(isset($menu['parents'][$parent])) {      
			$html .= '<ul class="'.$name.'">'."\n";
			
			foreach ($menu['parents'][$parent] as $itemID) {
        $class = '';
        
				if(!isset($menu['parents'][$itemID])) {
					$url = (!empty($parent_url)) ? $parent_url.'/' : URL_CMS;					
					$url.= (!empty($menu['items'][$itemID]['URL'])) ? $menu['items'][$itemID]['URL'] : '';
					
					$html .= '<li class="dropdown">
											<a href="'.$url.'">'.$menu['items'][$itemID]['Titulo'].'<b class="caret"></b></a>
										</li>';
				}                
				if(isset($menu['parents'][$itemID])) {
					$parent_url = (!empty($menu['items'][$itemID]['URL'])) ? URL_CMS.$menu['items'][$itemID]['URL'] : '';
          
					$html .= '<li>
											<a href="'.$parent_url.'">'.$menu['items'][$itemID]['Titulo'].'</a>';
					$html .= $this->recursiveMenu($itemID,$menu,'submenu',false,$parent_url);
					$html .= '</li>';
				}
			}
			$html .= '</ul>'."\n";
		}
		return $html;
	}
  
  public function render() {
    $menu = $this->getItemsMenu();
    return $this->recursiveMenu(0,$menu);
  }
}