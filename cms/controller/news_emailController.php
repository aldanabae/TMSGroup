<?php

class news_emailController extends Controller
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
  	$data['title'] = 'Listando Emails';
  	$data['tabla'] = $this->_tabla;
  	$data['type'] = $type;
    
    $this->getBreadcrumb('Newsletters','listar');

		if(Validator::validateInteger('listar', true) == 1) {
	  	$opt = Validator::sanitizeInteger('accion', true);
	  	$ids = $_POST['selected'];	  	
	  	($opt == 4) ? $this->_model->deleteEmails($ids) : $this->_model->updateEmails($opt,$ids);				
	  }
	  	   
		$data['base_url'] = $this->base_url;
		$data['heads'][] = array('title'=>'Email','sort'=>'sisort','align'=>'center');
		$data['heads'][] = array('title'=>'Categor&iacute;a','sort'=>'sisort','align'=>'center');
		$data['heads'][] = array('title'=>'Estado','sort'=>'nosort center','align'=>'center');

    $this->_view->assign('data',$data);    
    $this->_view->render();    
  }
  
  public function insertar()
  {
  	$data['title'] = 'Nuevo Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Newsletters','listar');
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $email = Validator::sanitizeString($fields['Email']);
	         	
		  if(empty($email)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar su Email');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  	
		  if(Validator::validateEmail($fields['Email'])) {	  
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar un Email v&aacute;lido');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }
		  $id = $this->_model->updateEmail($fields);
      Url::redirect($this->base_url.'listar/1');
    }

		$data['selectcat'] = $this->_model->getSelectCategory();	
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function editar($id)
  {
  	if(!Validator::validateInteger($id)) Url::redirect();    
    if(!$this->_model->getEmail($id)) Url::redirect();

  	$data['title'] = 'Editar Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Newsletters','listar');
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $email = Validator::sanitizeString($fields['Email']);
	         	
		  if(empty($email)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar su Email');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  	
		  if(Validator::validateEmail($fields['Email'])) {	  
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar un Email v&aacute;lido');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }
	    $fields['ID'] = $id;
		  $this->_model->updateEmail($fields);

      Url::redirect($this->base_url.'listar/1');
    }
    
		$data['selectcat'] = $this->_model->getSelectCategory();	
    $data[$this->_tabla] = $this->_model->getEmail($id);     
		
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function filter() 
	{
		$cols = array('ID','Email','GroupID','Publico');   
		 
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
	  	case 'GroupID': 		  
		  	$data = $this->_model->getCategoria($value);
		  	$row = $data['Nombre'];
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