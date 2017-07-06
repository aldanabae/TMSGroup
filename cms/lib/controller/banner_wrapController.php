<?php

class banner_wrapController extends Controller
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
  	$this->_wimage = 300;
  	$this->_himage = 250;
  	$this->_wthumb = 150;
  	$this->_hthumb = 125;  		
  }
  
  public function index()
  {
  	$this->listar();
  }
  
  public function listar($type = 1)
  {
  	$data['title'] = 'Listando Banners';
  	$data['tabla'] = $this->_tabla;
  	$data['type'] = $type;
    
    $this->getBreadcrumb('Banners','listar');

		if(Validator::validateInteger('listar', true) == 1) {
	  	$opt = Validator::sanitizeInteger('accion', true);
	  	$ids = $_POST['selected'];	 

	  	($opt == 4) ? $this->_model->deleteBanners($ids) : $this->_model->updateBanners($opt,$ids);				
	  }
	  	   
		$data['base_url'] = $this->base_url;
		$data['heads'][] = array('title'=>'Titulo','sort'=>'sisort','align'=>'center');
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

    $num = ($this->_model->countBanners() > 0) ? ($this->_model->countBanners() + 1) : 1;
    $this->getBreadcrumb('Banners','listar');
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];     
      $fields = $_POST[$this->_tabla];
		  $titulo = Validator::sanitizeString($fields['Titulo']);

		  if(empty($titulo)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el T&iacute;tulo del Banner');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  		  
	
			$fields['Posicion'] = $num;
			$fields['Codigo'] = (!empty($fields['Codigo'])) ? htmlentities(stripslashes($fields['Codigo'])) : '';
		  $id = $this->_model->updateBanner($fields);
      Url::redirect($this->base_url.'listar');
    }
    
		$data[$this->_tabla]['Titulo'] = 'Banner'.$num;
		$data['selectcat'] = $this->_model->getSelectCategory();	
    $data['selectpos'] = $this->recordSort($this->_model->getSelectPos(),'Posicion');	
		
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function editar($id)
  {
  	if(!Validator::validateInteger($id)) Url::redirect();
    if(!$this->_model->getBanner($id)) Url::redirect();

  	$data['title'] = 'Editar Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Banners','listar');
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $titulo = Validator::sanitizeString($fields['Titulo']);
	         	
		  if(empty($titulo)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el T&iacute;tulo del Banner');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }
	    $fields['ID'] = $id;
	    $fields['Codigo'] = (!empty($fields['Codigo'])) ? htmlentities(stripslashes($fields['Codigo'])) : '';
		  $this->_model->updateBanner($fields);

      Url::redirect($this->base_url.'listar');
    }

		$data['selectcat'] = $this->_model->getSelectCategory();	
    $data[$this->_tabla] = $this->_model->getBanner($id);   
    $data['categoria'] = $this->_model->getCategoria($data[$this->_tabla]['TipoID']);  
    $data['selectpos'] = $this->recordSort($this->_model->getSelectPos($data[$this->_tabla]),'Posicion');	
		
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function filter($type = '') 
	{
		$type = (!empty($type)) ? "Publico='".$type."'" : '';
		$cols = array('ID','Titulo','TipoID','Publico');   
		 
    $grid = new DataTables($this->_tabla,$cols,$type,
    	array($this,'setRowsExtra'),
    	array($this,'addActions'), 'Posicion'
    );
    echo $grid->render();
	}
	
	public function setRowsExtra($key = '',$value = null)
	{	
		$row = '';
			
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
	  	case 'TipoID': 		  
		  	$data = $this->_model->getCategoria($value);
		  	$row = ($data) ? $data['Nombre'] : '';
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
  
  public function moveup() 
  {
  	$categoria = (isset($_POST['categoria'])) ? $_POST['categoria'] : '';
  	
  	if(!empty($categoria)) {
  		$data = $this->_model->getCategoria($categoria);
  		
  		$this->_wimage = $data['Width'];
  		$this->_himage = $data['Height'];
  	}
  	
  	$result = $this->uploadFile($_FILES['userfile'],$this->_wimage,$this->_himage);  	
  	echo $result;
  }
  
  public function sortable()
  {  
		$ids = $_POST['sortable'];
		$this->_model->updatePosiciones($ids);
		echo 'Las posiciones se ordenaron correctamente!';		
  }
	
	public function upload() 
  {
  	$categoria = (isset($_POST['categoria'])) ? $_POST['categoria'] : '';
  	
  	if(!empty($categoria)) {
  		$data = $this->_model->getCategoria($categoria);
  		
  		$this->_wimage = $data['Width'];
  		$this->_himage = $data['Height'];
  		$this->_wthumb = round($data['Width']/2);
  		$this->_hthumb = round($data['Height']/2);
  	}
  	  	
  	$result = $this->uploadImage($_FILES['userfile'],$this->_wimage,$this->_himage,$this->_wthumb,$this->_hthumb);  	
  	echo $result;
  }
  
  public function jcrop($code = '',$file = '',$ext = '',$categoria = '') 
  {
  	if(isset($_POST['img'])) {  		
	  	if(!empty($_POST['category'])) {
	  		$categoria = $_POST['category'];
	  		$data = $this->_model->getCategoria($categoria);
	  		
	  		$this->_wthumb = round($data['Width']/2);
	  		$this->_hthumb = round($data['Height']/2);
	  	}
	  	$this->cropImage($this->_wthumb,$this->_hthumb);
		} else {
			$imagen = $file.'.'.$ext;

	  	if(!empty($categoria)) {
	  		$data = $this->_model->getCategoria($categoria);
	  		$this->_wimage = $data['Width'];
	  		$this->_himage = $data['Height'];
	  	}

	  	$this->displayCrop($code,$imagen,$this->_wimage,$this->_himage,$categoria);
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