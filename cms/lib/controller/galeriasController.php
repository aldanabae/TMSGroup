<?php

class galeriasController extends Controller
{
	private $_wimage;
	private $_himage;
	private $_wthumb;
	private $_hthumb;
	private $_gal_wimage;
	private $_gal_himage;
	private $_gal_wthumb;
	private $_gal_hthumb;
	private $_model;
	private $_tabla;
	
  public function __construct()
  {
    parent::__construct(); 
    // Cargamos Todos los Elementos del Panel de Control
  	$this->initialize(); 
    $this->_tabla = $this->_route['controller'];  	
  	$this->_model = Load::model($this->_tabla);
  	$this->_wimage = 590;
  	$this->_himage = 330;
  	$this->_wthumb = 250;
  	$this->_hthumb = 150;  	
  	$this->_gal_wimage = 800;
  	$this->_gal_himage = 600;
  	$this->_gal_wthumb = 200;
  	$this->_gal_hthumb = 150; 
  }
  
  public function index()
  {
  	$this->listar();
  }
  
  public function listar($type = 1)
  {
  	$data['title'] = 'Listando Galerias';
  	$data['tabla'] = $this->_tabla;
  	$data['type'] = $type;
    
    $this->getBreadcrumb('Galer&iacute;as','listar/'.$type);

		if(Validator::validateInteger('listar', true) == 1) {
	  	$opt = Validator::sanitizeInteger('accion', true);
	  	$ids = $_POST['selected'];	 

	  	($opt == 4) ? $this->_model->deleteGalerias($ids) : $this->_model->updateGalerias($opt,$ids);				
	  }
	  	   
		$data['base_url'] = $this->base_url;
		$data['heads'][] = array('title'=>'Fecha','sort'=>'sisort','align'=>'center');
		$data['heads'][] = array('title'=>'Titulo','sort'=>'sisort','align'=>'left');
		$data['heads'][] = array('title'=>'Estado','sort'=>'nosort center','align'=>'center');

    $this->_view->assign('data',$data);    
    $this->_view->render();    
  }
  
  public function insertar($type = '')
  {
  	$data['title'] = 'Nuevo Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
		$data['type'] = $type;
    $this->getBreadcrumb('Galer&iacute;as','listar/'.$type);
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
	    $data['galeria'] = isset($_POST['gallery']) ? $_POST['gallery'] : array();
      $fields = $_POST[$this->_tabla];      
	    $titulo = Validator::sanitizeString($fields['Titulo']);

		  if(empty($titulo)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el T&iacute;tulo de la Galeria');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  
		  
		  $id = $this->_model->updateGaleria($fields);
		  $this->_model->updateArchivos($data['galeria'],$id);	
      Url::redirect($this->base_url.'listar/'.$type);
    }
		  	
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function editar($id,$type = '')
  {
  	if(!Validator::validateInteger($id)) Url::redirect();    
    if(!$this->_model->getGaleria($id)) Url::redirect();

  	$data['title'] = 'Editar Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
		$data['type'] = $type;
    $this->getBreadcrumb('Galer&iacute;as','listar/'.$type);
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
	    $data['galeria'] = isset($_POST['gallery']) ? $_POST['gallery'] : array();
      $fields = $_POST[$this->_tabla];
      $titulo = Validator::sanitizeString($fields['Titulo']);
	         	
		  if(empty($titulo)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el T&iacute;tulo de la Galeria');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }
		  
		  $this->_model->updateArchivos($data['galeria'],$id);
		  		   
	    $fields['ID'] = $id;
		  $this->_model->updateGaleria($fields);
      Url::redirect($this->base_url.'listar/'.$type);
    }
    
    $data[$this->_tabla] = $this->_model->getGaleria($id);    
    $data['galeria'] = $this->_model->getArchivos($id);
		
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function filter($type = '') 
	{
		$type = (!empty($type)) ? "Tipo='".$type."'" : '';
		$cols = array('ID','Fecha','Titulo','Publico','URL','Tipo');   
		 
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
			case 'Fecha': 		  
		  	$date = date_create($value);
		  	$row = date_format($date,'d/m/Y');
	  	break;
			case 'URL': 
				$row = null;
	  	break;
	  	case 'Tipo': 
				$row = null;
	  	break;
	  	default :
		    /* General output */
		    $row = $value;
		}
		
	  return $row;
	}
	
	public function addActions($row) 
  {		
		$url_ver = URL_WEB.'galerias/';
		$url_edit = URL_CMS.$this->base_url.'editar/';

  	$icon1 = Helper::tag2('i','',array('class'=>'fa fa-external-link'));
  	$icon2 = Helper::tag2('i','',array('class'=>'fa fa-edit'));
  	$link1 = Helper::tag2('a',$icon1.' Ver',array('class'=>'btn btn-success btn-sm','href'=>$url_ver.$row['URL'],'target'=>'_blank'));
  	$link2 = Helper::tag2('a',$icon2.' Editar',array('class'=>'btn btn-info btn-sm','href'=>$url_edit.$row['ID'].'/'.$row['Tipo']));
  	return $link1.'  '.$link2;
  }
  
  public function getimage()
  {
    if(isset($_POST['num'])) {
      $data['name'] = $_POST['name'];
      $data['thumb'] = $_POST['thumb'];
      $data['image'] = $_POST['image'];
      $data['num'] = (int) $_POST['num'];
      echo Load::view('b-content'.DS.'modules'.DS.$this->base_root.'editar'.DS.'mod-image',$data);
    }
  }
  
  public function getvideo()
  {
    if(isset($_POST['num'])) {
      $data['name'] = $_POST['name'];
      $data['thumb'] = $_POST['thumb'];
      $data['image'] = $_POST['image'];
      $data['num'] = (int) $_POST['num'];
      echo Load::view('b-content'.DS.'modules'.DS.$this->base_root.'editar'.DS.'mod-video',$data);
    }
  }
  
  public function upload($crop = 0) 
  {  	
  	$crop = ($crop == 0) ? true : true;
  	$result = $this->uploadImage($_FILES['userfile'],$this->_wimage,$this->_himage,$this->_wthumb,$this->_hthumb, $crop);  	
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
  
  public function galeria() 
  { 	
    if(isset($_FILES['Filedata'])) {
	    echo $this->uploadImage($_FILES['Filedata'],$this->_gal_wimage,$this->_gal_himage,$this->_gal_wthumb,$this->_gal_hthumb,true);
    }
  }
  
  public function delimage()
  {
	  $id = (isset($_POST['id']) && $_POST['id'] != 0) ? $_POST['id'] : false;	  
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