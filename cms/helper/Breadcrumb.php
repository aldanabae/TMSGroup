<?php

/*
* -------------------------------------
* www.desarrollowebline.com.ar | Oscar Castillo
* Framework CMS WebAdmin
* Breadcrumb.php
* -------------------------------------
*/

class Breadcrumb
{
	const table = 'sys_menu_left';
	private $breadcrumb = array();
	private $str_link = '<li><a href="$1">$2</a>$3</li>';
  private $controller = '';


  public function __construct($controller = '') 
	{
    $this->controller = $controller;
		$this->_registry = Registry::getInstance();
		$this->_db = $this->_registry->_db;
	}
	
	public function getTitle($url) {
   	$table = DB_PREF.self::table;
 	  $menu = $this->_db->query("SELECT Titulo FROM ".$table." WHERE Tabla='".$this->controller."' AND Url='".$url."'");
   	$data = $menu->fetch();
   	
   	return $data['Titulo'];
	}
	
	public function add($url,$title = '')
	{
    if($url != 'home') {
    	$title = (!empty($title)) ? $title : $this->getTitle($url);
    	$url = ($url == '#') ? $url : URL_CMS.$url;
	    $this->breadcrumb[] = array('title'=>$title,'link'=>$url);
    } 
	}

	public function render($bracket = '&nbsp;',$class = 'breadcrumb')
	{
		$count = count($this->breadcrumb);
		$output = '<ul class="'.$class.'">
			<li>
        <i class="fa fa-home"></i>
				<a href="'.URL_CMS.'">Home</a>'.(($count > 0) ? $bracket : '').'
			</li>';

		for($i=0;$i < $count-1;$i++) {
			$swap = str_replace('$1',$this->breadcrumb[$i]['link'],$this->str_link);
			$swap = str_replace('$2',$this->breadcrumb[$i]['title'],$swap);
			$swap = str_replace('$3',$bracket,$swap);
			$output .= $swap;
		}
		$output .= '<li class="active">'.$this->breadcrumb[$i]['title'].'</li></ul>';
		
		return $output;
	}
}

?>
