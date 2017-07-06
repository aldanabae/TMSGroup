<?php

class newsletterController extends Controller
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
  	$this->_wimage = 500;
  	$this->_himage = 300;
  	$this->_wthumb = 250;
  	$this->_hthumb = 150;	
  }
  
  public function index()
  {
  	$this->listar();
  }
  
  public function listar($type = 1)
  {
  	$data['title'] = 'Listando Newsletters';
  	$data['tabla'] = $this->_tabla;
  	$data['type'] = $type;
    
    $this->getBreadcrumb('Newsletters','listar/'.$type);	

		if(Validator::validateInteger('listar', true) == 1) {
	  	$opt = Validator::sanitizeInteger('accion', true);
	  	$ids = $_POST['selected'];	  	
	  	($opt == 4) ? $this->_model->deleteNewsletters($ids) : $this->_model->updateNewsletters($opt,$ids);				
	  }
	  	  	   
		$data['base_url'] = $this->base_url;
		$data['heads'][] = array('title'=>'Fecha | Hora','sort'=>'sisort','align'=>'center');
		$data['heads'][] = array('title'=>'Asunto','sort'=>'sisort','align'=>'left');
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
      $asunto = Validator::sanitizeString($fields['Asunto']);
      
      $data['meta'] = isset($_POST['meta']) ? $_POST['meta'] : array();
	    $data['parrafo'] = isset($_POST['paragraph']) ? $_POST['paragraph'] : array();
	    $data['galeria'] = isset($_POST['gallery']) ? $_POST['gallery'] : array();
	         	
		  if(empty($asunto)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Asunto del Newsletter');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  
		  
		  $id = $this->_model->updateNewsletter($fields);
		  
		  $this->_model->updateMeta($data['meta'],$id);
		  $this->_model->updateParrafos($data['parrafo'],$id);
		  $this->_model->updateGaleria($data['galeria'],$id);	

      Url::redirect($this->base_url.'listar/1');
    }

		$data['selectcat'] = $this->_model->getSelectCategory();	
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function editar($id)
  {
  	if(!Validator::validateInteger($id)) Url::redirect();
    if(!$this->_model->getNewsletter($id)) Url::redirect();

  	$data['title'] = 'Editar Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Newsletters','listar');	
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $asunto = Validator::sanitizeString($fields['Asunto']);
      
      $data['meta'] = isset($_POST['meta']) ? $_POST['meta'] : array();
	    $data['parrafo'] = isset($_POST['paragraph']) ? $_POST['paragraph'] : array();
	    $data['galeria'] = isset($_POST['gallery']) ? $_POST['gallery'] : array();
	         	
		  if(empty($asunto)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Asunto del Newsletter');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }		  
		  $this->_model->updateMeta($data['meta'],$id);
		  $this->_model->updateParrafos($data['parrafo'],$id);
		  $this->_model->updateGaleria($data['galeria'],$id);	
	   
	    $fields['ID'] = $id;
		  $this->_model->updateNewsletter($fields);

      Url::redirect($this->base_url.'listar/1');
    }
    
    $data[$this->_tabla] = $this->_model->getNewsletter($id);     
    $data['meta'] = $this->_model->getMeta($id);
    $data['parrafo'] = $this->_model->getParrafos($id);
    $data['galeria'] = $this->_model->getGaleria($id);
		$data['selectcat'] = $this->_model->getSelectCategory();	
		
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function select($categoria = '')
  {
  	$data['emails'] = $this->_model->getSelectEmails($categoria);
		$data['base_url'] = $this->base_url;
  	echo Load::view($this->base_root.'editar'.DS.'mod-email',$data);
  }
  
  public function filter($type = '') 
	{
		$type = (!empty($type)) ? "Publico='".$type."'" : '';
		$cols = array('ID','Fecha','Asunto','Publico','URL');   
		 
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
		  	$row = date_format($date,'d-m-Y - H:i:s');
	  	break;
			case 'URL': 
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
		$url_ver = URL_WEB.'newsletters/';
		$url_edit = URL_CMS.Controller::getItem().'/editar/';

  	$icon1 = Helper::tag2('i','',array('class'=>'fa fa-external-link'));
  	$icon2 = Helper::tag2('i','',array('class'=>'fa fa-edit'));
  	$link1 = Helper::tag2('a',$icon1.' Ver',array('class'=>'btn btn-success btn-sm','href'=>$url_ver.$row['URL'],'target'=>'_blank'));
  	$link2 = Helper::tag2('a',$icon2.' Editar',array('class'=>'btn btn-info btn-sm','href'=>$url_edit.$row['ID']));
  	return $link1.'  '.$link2;
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