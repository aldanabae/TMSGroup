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
  private $_registry;  
  protected $_db;
	private $breadcrumb = array();
	private $str_link = '<li><a href="$1">$2</a>$3</li>';
  
  public function __construct() 
	{
		$this->_registry = Registry::getInstance();
		$this->_db = $this->_registry->_db;
	}

	public function add($url,$title = '')
	{
    $this->breadcrumb[] = array('title'=>Helper::text_limit($title,60),'link'=>URL_WEB.$url);
	}

	public function render($bracket = ' / ', $class = 'breadcrumb')
	{
		$count = count($this->breadcrumb);
		$output = '<ul class="'.$class.'">';

		for($i=0;$i < $count-1;$i++) {
			$swap = str_replace('$1',$this->breadcrumb[$i]['link'],$this->str_link);
			$swap = str_replace('$2',$this->breadcrumb[$i]['title'],$swap);
			$swap = str_replace('$3',$bracket,$swap);
			$output .= $swap;
		}
		$output .= '<li class="active">'.$this->breadcrumb[$i]['title'].'</li></ol>';
		
		return $output;
	}
}

?>
