<?php

class sys_menu_leftController extends Controller
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
  	$data['title'] = 'Listando Menu Lateral';
  	$data['tabla'] = $this->_tabla;
  	$data['type'] = $type;
    
    $this->getBreadcrumb('Menu Lateral','listar'.$type);	

		if(Validator::validateInteger('listar', true) == 1) {
	  	$opt = Validator::sanitizeInteger('accion', true);
	  	//seleccion de checkboxs
	  	$ids = $_POST['selected'];	  	
	  	($opt == 4) ? $this->_model->deleteMenus($ids) : $this->_model->updateMenus($opt,$ids);				
	  }
	  	   
		$data['base_url'] = $this->base_url;
		
		$tree = new TreeMenu($this->base_url,$type);
		$data['tree_table'] = $tree->render();
    $this->_view->assign('data',$data);    
    $this->_view->render();    
  }
  
  public function insertar()
  {
  	$data['title'] = 'Nuevo Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Menu Lateral','listar/1');	
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $titulo = Validator::sanitizeString($fields['Titulo']);

		  if(empty($titulo)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el T&iacute;tulo del Menu Lateral');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }  
		  $id = $this->_model->updateMenu($fields);
      Url::redirect($this->base_url.'listar/1');
    }
        
    $select = new SelectMenu();
		$data['selectsec'] = $select->render();
		$data['selectpos'] = $this->recordSort($this->_model->getSelectPos(),'Posicion');	
		$data['list_tables'] = $this->_model->getTablas();
    $data['roles'] = $this->_model->getRoles();
		  	
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function editar($id)
  {
  	if(!Validator::validateInteger($id)) Url::redirect();    
    if(!$this->_model->getMenu($id)) Url::redirect();

  	$data['title'] = 'Editar Registro';
  	$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Menu Lateral','listar/1');	
    
    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];      
      $fields = $_POST[$this->_tabla];
      $titulo = Validator::sanitizeString($fields['Titulo']);
	         	
		  if(empty($titulo)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el T&iacute;tulo del Menu Lateral');
		  	$this->_view->assign('data',$data);    
    		$this->_view->render();
		    exit;
		  }
	    $fields['ID'] = $id;
      var_dump($fields);
		  $this->_model->updateMenu($fields);
      Url::redirect($this->base_url.'listar/1');
    }
    
    $data[$this->_tabla] = $this->_model->getMenu($id);     
		
		$select = new SelectMenu($data[$this->_tabla]['PadreID']);
		$data['selectsec'] = $select->render();		
		$data['selectpos'] = $this->recordSort($this->_model->getSelectPos($data[$this->_tabla]),'Posicion');	
		$data['list_tables'] = $this->_model->getTablas();
    $data['roles'] = $this->_model->getRoles();
		
  	$this->_view->assign('data',$data);    
 		$this->_view->render();
  }
  
  public function select($id = '')
  {
  	$parent_id = (int) $_POST['parent'];
  	$parent_ant = (int) $_POST['prev'];
		$select_pos = $this->_model->getSelectPosAct($parent_id);
  	$count = count($select_pos)+1;

  	if($id != 0) {  	
	  	$this->_model->reorderParentPrev($id,$parent_ant);
	  	$data[$this->_tabla] = $this->_model->updateParentPos($id,$parent_id,$count);
	  	$select_pos[] = $data[$this->_tabla];
  	} else {
  		$data[$this->_tabla] = array('ID'=> $id,
						  						'Titulo'=>'Nuevo Menu',
						  						'Posicion'=>$count,
						  						'PadreID'=>$parent_id,
						  					);
						  					
			if(is_array($select_pos)) {
				$select_pos[] = $data[$this->_tabla];
			} else {
				$select_pos = array($data[$this->_tabla]);
			}
		}
		
		$data['tabla'] = $this->_tabla;
		$data['base_url'] = $this->base_url;
  	$data['selectpos'] = $select_pos;
  	echo Load::view('b-content'.DS.'modules'.DS.$this->base_root.'editar'.DS.'mod-posicion',$data);
  }
  
  public function sortable()
  {  
		$ids = $_POST['sortable'];
		$this->_model->updatePosiciones($ids);
		echo 'Las posiciones se ordenaron correctamente!';		
  }
	
}

?>