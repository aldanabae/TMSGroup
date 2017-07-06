<?php

class group_usersController extends Controller
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
  
  public function listar($type = 1)
  {
  	$data['title'] = 'Listando Categor&iacute;as';
  	$data['tabla'] = $this->_tabla;
  	$data['type'] = $type;
    
    $this->getBreadcrumb('Usuarios','listar');

		if(Validator::validateInteger('listar', true) == 1) {
	  	$opt = Validator::sanitizeInteger('accion', true);
	  	$ids = $_POST['selected'];	  	
	  	($opt == 4) ? $this->_model->deleteCategorias($ids) : $this->_model->updateCategorias($opt,$ids);				
	  }
	  	   
		$data['base_url'] = $this->base_url;
		$data['heads'][] = array('title'=>'Nombre','sort'=>'sisort','align'=>'left');
		$data['heads'][] = array('title'=>'Descripci&oacute;n','sort'=>'sisort','align'=>'left');
		$data['heads'][] = array('title'=>'Estado','sort'=>'nosort center','align'=>'center');

    $this->_view->assign('data',$data);    
    $this->_view->render();    
  }
  
  public function insertar()
  {
  	$data['title'] = 'Nuevo Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Usuarios','listar');
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $nombre = Validator::sanitizeString($fields['Nombre']);

		  if(empty($nombre)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Nombre de la Categor&iacute;a');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  		  
		  $id = $this->_model->updateCategoria($fields);
      Url::redirect($this->base_url.'listar/1');
    }

  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function editar($id)
  {
  	if(!Validator::validateInteger($id)) Url::redirect();
    if(!$this->_model->getCategoria($id)) Url::redirect();

  	$data['title'] = 'Editar Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Usuarios','listar');
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $nombre = Validator::sanitizeString($fields['Nombre']);

		  if(empty($nombre)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Nombre de la Categor&iacute;a');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }
	    $fields['ID'] = $id;
		  $this->_model->updateCategoria($fields);

      Url::redirect($this->base_url.'listar/1');
    }
    
    $data[$this->_tabla] = $this->_model->getCategoria($id);  	
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function filter() 
	{		
		$cols = array('ID','Nombre','Descripcion','Publico');   
		 
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
			case 'ID': 		  
		  	$row = Helper::input(array('type'=>'checkbox','value'=>$value,'name'=>'selected[]'));
	  	break;
			case 'Publico': 		  
		  	switch($value) { 	
		  		case 1: 		  
		  			$row = Helper::tag2('span','P&uacute;blico',array('class'=>'label label-success'));
		  		break;
		  		case 2: 		  
		  			$row = Helper::tag2('span','Borrador',array('class'=>'label label-warning'));
		  		break; 	
		  		case 3: 		  
		  			$row = Helper::tag2('span','Archivado',array('class'=>'label label-danger'));
		  		break;        		
		  	}
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