<?php
/*
 * -------------------------------------
 * www.desarrollowebline.com.ar | Oscar Castillo
 * CMS MVC
 * Paginador.php
 * -------------------------------------
 */

class Paginador
{
  private $_datos;
  private $_paginacion;
  private $_firstlast;
  private $_funcion;
  
  public function __construct() {
    $this->_datos = array();
    $this->_paginacion = array();
  }
  
  public function paginar($query, $pagina = false, $limite = false, $show = false, $funcion = false, $paginacion = false)
  {
  	$this->_firstlast = $show;
  	$this->_funcion = $funcion;
  	
    $limite = ($limite && is_numeric($limite)) ? $limite : 20;
    
    if($pagina && is_numeric($pagina)) {
      $pagina = $pagina;
      $inicio = ($pagina - 1) * $limite;
    } else {
      $pagina = 1;
      $inicio = 0;
    }    
    
    $registros = count($query);
    
    $total = ceil($registros / $limite);
    $this->_datos = array_slice($query, $inicio, $limite);
           
    $paginacion = array();
    $paginacion['actual'] = $pagina;
    $paginacion['total'] = $total;
    
    if($pagina > 1) {
      $paginacion['primero'] = 1;
      $paginacion['anterior'] = $pagina - 1;
    } else {
      $paginacion['primero'] = '';
      $paginacion['anterior'] = '';
    }
    
    if($pagina < $total) {
      $paginacion['ultimo'] = $total;
      $paginacion['siguiente'] = $pagina + 1;
    } else {
      $paginacion['ultimo'] = '';
      $paginacion['siguiente'] = '';
    }
    
    $this->_paginacion = $paginacion;
		$this->_rangoPaginacion($paginacion);
      
    return $this->_datos;
  }
  
  private function _rangoPaginacion($limite = false)
  {
    $limite = ($limite && is_numeric($limite)) ? $limite : 10;
    
    $total_paginas = $this->_paginacion['total'];
    $pagina_seleccionada = $this->_paginacion['actual'];
    $rango = ceil($limite / 2);
    $paginas = array();
    $rango_derecho = $total_paginas - $pagina_seleccionada;
    
    $resto = ($rango_derecho < $rango) ? ($rango - $rango_derecho) : 0;
    $rango_izquierdo = $pagina_seleccionada - ($rango + $resto);
    
    for($i = $pagina_seleccionada; $i > $rango_izquierdo; $i--) {
      if($i == 0) break;
      $paginas[] = $i;
    }
        
    sort($paginas);
    
    $rango_derecho = ($pagina_seleccionada < $rango) ? $limite : $pagina_seleccionada + $rango;
    
    for($i = $pagina_seleccionada + 1; $i <= $rango_derecho; $i++) {
      if($i > $total_paginas) break;
      $paginas[] = $i;
    }
    
    $this->_paginacion['rango'] = $paginas;    
    return $this->_paginacion;      
  }

	public function getView($vista, $link = false)
	{
		$rutaView = ROOT.'view'.DS.'template'.DS.'paginator'.DS.$vista.'.php';
		
		if($link) $link = URL_CMS . $link . '/';

		if(is_readable($rutaView)) {
			ob_start();			
			include $rutaView;			
			$contenido = ob_get_contents();			
			ob_end_clean();			
			return $contenido;
		}		
		throw new Exception('Error de paginacion');		
	}
}

?>
