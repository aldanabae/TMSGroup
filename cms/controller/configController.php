<?php

class configController extends Controller
{
	private $_model;
	private $_tabla;
	
  public function __construct()
  {
    parent::__construct();  
    // Cargamos Todos los Elementos del Panel de Control
  	$this->initialize();
  	$this->_tabla = $this->_route['controller'];  	
  	$this->_model = Load::model($this->_tabla);
  }
  
  public function index()
  {
  	$this->listar();
  }
  
  public function listar()
  {
  	$data['title'] = 'Listando Configuraci&oacute;n Web';
  	$data['tabla'] = $this->_tabla;
    
    $this->getBreadcrumb('Sitio Web','listar');

		$data['base_url'] = $this->base_url;
		$data['heads'][] = array('title'=>'Nombre','sort'=>'sisort','align'=>'left');
		$data['heads'][] = array('title'=>'Slogan','sort'=>'sisort','align'=>'left');
		$data['count'] = $this->_model->countConfig();
		
    $this->_view->assign('data',$data);    
    $this->_view->render();    
  }
  
  public function insertar()
  {
  	$data['title'] = 'Nuevo Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Sitio Web','listar');
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $nombre = Validator::sanitizeString($fields['Nombre']);
	         	
		  if(empty($nombre)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Nombre del Sitio Web');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  		  

			$fields['Nombre'] = (!empty($fields['Nombre'])) ? Helper::html_entities($fields['Nombre']) : '';
			$fields['Analytics'] = (!empty($fields['Analytics'])) ? Helper::html_entities($fields['Analytics']) : '';
		  
		  $id = $this->_model->updateConfig($fields);
      Url::redirect($this->base_url.'listar');
    }
    
		$data['selectpais'] = $this->_model->getSelectPais(); 
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function editar($id)
  {
  	if(!Validator::validateInteger($id)) Url::redirect(); 
    if(!$this->_model->getConfig($id)) Url::redirect();

  	$data['title'] = 'Editar Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Sitio Web','listar');
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $nombre = Validator::sanitizeString($fields['Nombre']);
	         	
		  if(empty($nombre)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Nombre del Sitio Web');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }

			$fields['Nombre'] = (!empty($fields['Nombre'])) ? Helper::html_entities($fields['Nombre']) : '';
			$fields['Analytics'] = (!empty($fields['Analytics'])) ? Helper::html_entities($fields['Analytics']) : '';

	    $fields['ID'] = $id;
		  $this->_model->updateConfig($fields);

      Url::redirect($this->base_url.'listar');
    }
    
    $data['selectpais'] = $this->_model->getSelectPais();     
    $data[$this->_tabla] = $this->_model->getConfig($id);     
		
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function filter() 
	{		
		$cols = array('ID','Nombre','Slogan');   
		 
    $grid = new DataTables($this->_tabla,$cols,'',
    	array($this,'setRowsExtra'),
    	array($this,'addActions')
    );
    echo $grid->render();
	}
	
	public function setRowsExtra($key = '',$value = null)
	{		
		switch($key) {
			case 'version': 		  
	      /* Special output formatting for 'version' column */
	      $row = ($value=="0") ? '-' : $value;
	  	break;
	  	default :
		    /* General output */
		    $row = $value;
		}
		
	  return $row;
	}
	
	public function addActions($row) 
  {		
		$url_edit = URL_CMS.Controller::getItem().'/editar/';

  	$icon = Helper::tag2('i','',array('class'=>'fa fa-edit'));
  	$link = Helper::tag2('a',$icon.' Editar',array('class'=>'btn btn-info btn-sm','href'=>$url_edit.$row['ID']));
  	return $link;
  }
	
}

?>