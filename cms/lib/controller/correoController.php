<?php

class correoController extends Controller {

  private $_wimage;
  private $_himage;
  private $_wthumb;
  private $_hthumb;
  private $_model;
  private $_tabla;

  public function __construct() {
    parent::__construct();
    // Cargamos Todos los Elementos del Panel de Control
  	$this->initialize();
    $this->_tabla = $this->_route['controller'];
    $this->_model = Load::model($this->_tabla);
    $this->_wimage = 960;
    $this->_himage = 345;
    $this->_wthumb = 480;
    $this->_hthumb = 173;
  }

  public function index() {
    $this->listar();
  }

  public function listar($type = 1) {
    $data['title'] = 'Listando Correos';
    $data['tabla'] = $this->_tabla;
    $data['type'] = $type;
    $data['base_url'] = $this->base_url;

    $this->getBreadcrumb('Correo Electr&oacute;nico', 'listar/' . $type);

    if(Validator::validateInteger('listar', true) == 1) {
      $opt = $this->getInt('accion');
      $ids = $_POST['selected'];

      ($opt == 7) ? $this->_model->deleteCorreos($ids) : $this->_model->updateCorreos($opt, $ids);
    }
    
    if ($type != 2 && $type != 5) { //cuando no es correo borrador o enviado
      $data['heads'][] = array('title' => 'Remitente', 'sort' => 'sisort', 'align' => 'left');
    }
    $data['heads'][] = array('title' => 'Asunto', 'sort' => 'sisort', 'align' => 'left');
    $data['heads'][] = array('title' => 'Fecha - Hora', 'sort' => 'sisort', 'align' => 'center');
    
    if ($type == 1)
      $data['heads'][] = array('title' => 'Estado', 'sort' => 'sisort', 'align' => 'center');

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function insertar() {
    $data['title'] = 'Nuevo Correo';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;

    $num = ($this->_model->countCorreos() > 0) ? ($this->_model->countCorreos() + 1) : 1;
    $this->getBreadcrumb('Correo Electr&oacute;nico', 'listar/1');

    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $asunto = Validator::sanitizeString($fields['Asunto']);

		  if(empty($asunto)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Asunto del Correo');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
			
			if($fields['Publico'] == 5) {
      	$this->sentmail($fields);
      }
      $fields['Leido'] = 1;
      $id = $this->_model->updateCorreo($fields);
      
      Url::redirect($this->base_url . 'listar/1');
    }

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function editar($id) {
    if(!Validator::validateInteger($id)) Url::redirect();    
    if (!$this->_model->getCorreo($id)) Url::redirect();

    $data['title'] = 'Editar Correo';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Correo Electr&oacute;nico', 'listar/2');

    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $asunto = Validator::sanitizeString($fields['Asunto']);

		  if(empty($asunto)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Asunto del Correo');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      
      if($fields['Publico'] == 5) {
      	$this->sentmail($fields);
      }
      $fields['ID'] = $id;
      $fields['Leido'] = 1;
      $id = $this->_model->updateCorreo($fields);

      Url::redirect($this->base_url . 'listar/1');
    }
    $data[$this->_tabla] = $this->_model->getCorreo($id);

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function responder($id) {
    if(!Validator::validateInteger($id)) Url::redirect();  
    if (!$this->_model->getCorreo($id)) Url::redirect();

    $data['title'] = 'Editar Correo';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Correo Electr&oacute;nico', 'listar/1');

    if(Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $asunto = Validator::sanitizeString($fields['Asunto']);

		  if(empty($asunto)) { 
		  	$data['alert'] = $this->alertMessage('danger','Debe ingresar el Asunto del Correo');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      $fields['Leido'] = 1;
      $this->_model->updateCorreo($fields);

      Url::redirect($this->base_url . 'listar/1');
    }
    $data[$this->_tabla] = $this->_model->getCorreo($id);

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function sentmail($fields) {
    $destinatarios = explode(',', $fields['Destinatario']);

    $data = array('from_name' => WEB_NAME,
        'from_email' => EMAIL_WEBMASTER,
        'to_email' => $destinatarios,
        'subject' => $fields['Asunto'],
        'body' => $fields['Contenido'],
        'attach' => $fields['Archivo']);

    return $this->sendMail($data);
  }

  public function reenviar($id) {
    $this->responder($id);
  }

  public function revisar($id) {
    if(!Validator::validateInteger($id)) Url::redirect();  
    if (!$this->_model->getCorreo($id)) Url::redirect();

    $data['title'] = 'Revisar Correo';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Correo Electr&oacute;nico', 'listar/1');

    $fields['ID'] = $id;
    $fields['Leido'] = 1;
    $this->_model->updateCorreo($fields);

    $data[$this->_tabla] = $this->_model->getCorreo($id);
    $data['id'] = $id;

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function filter($type = '') 
  {
    $tipo = (!empty($type)) ? "Publico='" . $type . "'" : '';
    $cols = array('ID','Remitente','Asunto','Fecha');  
    
    if ($type == 2 || $type == 5) unset($cols[1]);    
    if ($type == 1) $cols[] = 'Leido';

    $funcion = ($type == 2) ? 'addActionsEdit' : 'addActions';
    $grid = new DataTables($this->_tabla, $cols, $tipo, 
            array($this, 'setRowsExtra'), 
            array($this, $funcion), 'Fecha DESC');
    
    echo $grid->render();
  }

  public function autocomplete() {
    $search = $_GET['term'];
    $data = $this->_model->searchCorreos($search);

    if (count($data) > 0) {
      echo json_encode($data);
    }
  }

  public function setRowsExtra($key = '', $value = null) {
    switch ($key) {
      case 'version':
        /* Special output formatting for 'version' column */
        $row = ($value == "0") ? '-' : $value;
        break;
      case 'ID':
        $row = Helper::input(array('type' => 'checkbox', 'value' => $value, 'name' => 'selected[]'));
        break;
      case 'Publico':
        switch ($value) {
          case 1:
            $row = Helper::tag2('span', 'P&uacute;blico', array('class' => 'label label-success'));
            break;
          case 2:
            $row = Helper::tag2('span', 'Borrador', array('class' => 'label label-warning'));
            break;
          case 3:
            $row = Helper::tag2('span', 'Archivado', array('class' => 'label label-danger'));
            break;
        }
        break;
      case 'Leido':
        switch ($value) {
          case 0:
            $row = Helper::tag2('span', 'No Leido', array('class' => 'label label-warning'));
            break;
          case 1:
            $row = Helper::tag2('span', 'Leido', array('class' => 'label label-success'));
            break;
          case 2:
            $row = Helper::tag2('span', 'Borrador', array('class' => 'label label-info'));
            break;
        }
        break;
      case 'Fecha':
        $date = date_create($value);
        $row = date_format($date, 'd/m/Y - H:i:s');
        break;
      default :
        /* General output */
        $row = $value;
    }

    return $row;
  }

  public function addActions($row) {
    $url_ver = URL_CMS . Controller::getItem() . '/revisar/';
    $url_resp = URL_CMS . Controller::getItem() . '/responder/';
    $url_reen = URL_CMS . Controller::getItem() . '/reenviar/';

    $icon1 = Helper::tag2('i', '', array('class' => 'fa fa-search'));
    $icon2 = Helper::tag2('i', '', array('class' => 'fa fa-mail-reply'));
    $icon3 = Helper::tag2('i', '', array('class' => 'fa fa-reply-all'));
    $link1 = Helper::tag2('a', $icon1, array(
                'class' => 'btn btn-success btn-sm',
                'href' => $url_ver . $row['ID'],
                'data-toggle' => 'tooltip',
                'data-placement' => 'bottom',
                'data-original-title' => 'Revisar Correo',
    ));
    $link2 = Helper::tag2('a', $icon2, array(
                'class' => 'btn btn-info btn-sm',
                'href' => $url_resp . $row['ID'],
                'data-toggle' => 'tooltip',
                'data-placement' => 'bottom',
                'data-original-title' => 'Responder',
    ));
    $link3 = Helper::tag2('a', $icon3, array(
                'class' => 'btn btn-primary btn-sm',
                'href' => $url_reen . $row['ID'],
                'data-toggle' => 'tooltip',
                'data-placement' => 'bottom',
                'data-original-title' => 'Reenviar',
    ));

    return $link1 . '  ' . $link2 . '  ' . $link3;
  }

  public function addActionsEdit($row) {
    $url_editar = URL_CMS . Controller::getItem() . '/editar/';

    $icon1 = Helper::tag2('i', '', array('class' => 'fa fa-edit'));
    $link1 = Helper::tag2('a', $icon1, array(
                'class' => 'btn btn-info btn-sm',
                'href' => $url_editar . $row['ID'],
                'data-toggle' => 'tooltip',
                'data-placement' => 'bottom',
                'data-original-title' => 'Editar Correo',
    ));

    return $link1;
  }

  public function upload() {
    $result = $this->uploadImage($_FILES['userfile'], $this->_wimage, $this->_himage, $this->_wthumb, $this->_hthumb);
    echo $result;
  }

  public function moveup() {
    $result = $this->uploadFile($_FILES['userfile']);
    echo $result;
  }

  public function download($file = '') {
    if (!empty($file)) {
      $this->downloadFile($file);
    }
  }

  public function jcrop($code = '', $file = '', $ext = '') {
    if (isset($_POST['img'])) {
      $this->cropImage($this->_wthumb, $this->_hthumb);
    } else {
      $imagen = $file . '.' . $ext;
      $this->displayCrop($code, $imagen, $this->_wimage, $this->_himage);
    }
  }

  public function delimage() {
    $id = (isset($_POST['id'])) ? $_POST['id'] : false;
    $imagen = (isset($_POST['img'])) ? $_POST['img'] : '';

    $dir_thumb = $this->ruta_image . 'thumbs' . DS;
    $dir_image = $this->ruta_image . 'images' . DS;

    @unlink($dir_image . 'IM_' . $imagen);
    @unlink($dir_thumb . 'TH_' . $imagen);

    if ($id)
      $this->_model->deleteItemGaleria($id);

    echo 'true';
  }

}

?>