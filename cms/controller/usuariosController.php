<?php

class usuariosController extends Controller
{
	private $_wimage;
	private $_himage;
	private $_wthumb;
	private $_hthumb;
	private $_model;
	private $_tabla;
	
  public function __construct()
  {
    parent::__construct();  
    // Cargamos Todos los Elementos del Panel de Control
  	$this->initialize();
    $this->_tabla = $this->_route['controller'];  	
  	$this->_model = Load::model($this->_tabla);
  	$this->_wimage = 130;
  	$this->_himage = 150;
  	$this->_wthumb = 130;
  	$this->_hthumb = 150; 	
  }
  
  public function index()
  {
  	$this->listar();
  }
  
  public function listar($type = 1)
  {
  	$data['title'] = 'Listando Usuarios';
  	$data['tabla'] = $this->_tabla;
  	$data['type'] = $type;
    
    $this->getBreadcrumb('Usuarios','listar/' . $type);	

		if(Validator::validateInteger('listar', true) == 1) {
	  	$opt = Validator::sanitizeInteger('accion', true);
	  	$ids = $_POST['selected'];	  	
	  	($opt == 4) ? $this->_model->deleteUsers($ids) : $this->_model->updateUsers($opt,$ids);				
	  }
	  	   
		$data['base_url'] = $this->base_url;
		$data['heads'][] = array('title'=>'Nombre','sort'=>'sisort','align'=>'left');
		$data['heads'][] = array('title'=>'Email','sort'=>'sisort','align'=>'center');
		$data['heads'][] = array('title'=>'Tel&eacute;fono','sort'=>'sisort','align'=>'left');
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
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Nombre del usuario');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  
      
      $fields['Publico'] = (isset($fields['Publico'])) ? $fields['Publico'] : 1;
		  $fields['Newsletter'] = (isset($fields['Newsletter'])) ? $fields['Newsletter'] : 0;
		  $id = $this->_model->updateUser($fields);
      Url::redirect($this->base_url.'listar/1');
    }
    
		$data['selectdpto'] = $this->_model->getSelectDpto();
    $this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function editar($id)
  {
  	if(!Validator::validateInteger($id)) Url::redirect();    
    if(!$this->_model->getUser($id)) Url::redirect();

  	$data['title'] = 'Editar Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Usuarios','listar');	
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $nombre = Validator::sanitizeString($fields['Nombre']);
      
		  if(empty($nombre)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Nombre del Usuario');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }		  

	    $fields['ID'] = $id;
      $fields['Newsletter'] = (isset($fields['Newsletter'])) ? $fields['Newsletter'] : 0;
		  $this->_model->updateUser($fields);
      Url::redirect($this->base_url.'listar/1');
    }
    
    $data['selectdpto'] = $this->_model->getSelectDpto();
    $data[$this->_tabla] = $this->_model->getUser($id);     
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function filter($type = '') 
	{
		$type = (!empty($type)) ? "Publico='".$type."'" : '';
		$cols = array('ID','Nombre','Email','Telefono','Publico');   
		 
    $grid = new DataTables($this->_tabla,$cols,$type,
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
	
	public function upload() 
  {
  	$result = $this->uploadImage($_FILES['userfile'],$this->_wimage,$this->_himage,$this->_wthumb,$this->_hthumb);  	
  	echo $result;
  }
  
  public function jcrop($code = '',$file = '',$ext = '') 
  {
  	if(isset($_POST['img'])) {  		
	  	$this->cropImage($this->_wthumb,$this->_hthumb);
		} else {
			$imagen = $file.'.'.$ext;
	  	$this->displayCrop($code,$imagen,$this->_wimage,$this->_himage);
		}
  }
  
  public function delimage()
  {
	  $id = (isset($_POST['id'])) ? $_POST['id'] : false;	  
	  $imagen = (isset($_POST['img'])) ? $_POST['img'] : '';	  

		$dir_thumb = $this->ruta_image.'thumbs'.DS;
    $dir_image = $this->ruta_image.'images'.DS;
    
	  @unlink($dir_image.'IM_'.$imagen);
		@unlink($dir_thumb.'TH_'.$imagen);
		
		if($id) $this->_model->deleteItemGaleria($id);
		
		echo 'true';
  }
}

?>