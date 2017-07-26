<?php

class clientesController extends Controller {

  private $_wimage;
  private $_himage;
  private $_wthumb;
  private $_hthumb;
  private $_model;
  private $_tabla;
  private $_val;

  public function __construct() {
    parent::__construct();

    $this->initialize();
    $this->_tabla = $this->_route['controller'];
    $this->_model = Load::model($this->_tabla);
    $this->_wimage = 360;
    $this->_himage = 150;
    $this->_wthumb = 150;
    $this->_hthumb = 100;
  }

  public function index() {
    $this->listar();
  }

  public function listar($type = 1) {
    $data['title'] = 'Listando Clientes';
    $data['tabla'] = $this->_tabla;
    $data['type'] = $type;

    $this->getBreadcrumb('Clientes', 'listar');

    if (Validator::validateInteger('listar', true) == 1) {
      $opt = Validator::sanitizeInteger('accion', true);
      $ids = $_POST['selected'];

      ($opt == 4) ? $this->_model->deleteClientes($ids) : $this->_model->updateClientes($opt, $ids);
    }

    $data['base_url'] = $this->base_url;
    $data['heads'][] = array('title' => 'Titulo', 'sort' => 'sisort', 'align' => 'center');
    $data['heads'][] = array('title' => 'Website', 'sort' => 'sisort', 'align' => 'left');
    $data['heads'][] = array('title' => 'Estado', 'sort' => 'nosort center', 'align' => 'center');

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function insertar() {
    $data['title'] = 'Nuevo Registro';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;

    $this->getBreadcrumb('Clientes', 'listar');

    if (Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $titulo = Validator::sanitizeString($fields['Nombre']);

      if (empty($titulo)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar el Nombre del Cliente');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }

      $id = $this->_model->updateCliente($fields);
      Url::redirect($this->base_url . 'listar');
    }

    $data['selectpos'] = $this->_model->getSelectPos();
    
    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function editar($id) {
    if (!Validator::validateInteger($id)) {
      Url::redirect();
    }
    if (!$this->_model->getCliente($id)) {
      Url::redirect();
    }

    $this->getBreadcrumb('Clientes', 'listar');

    $data['title'] = 'Editar Registro';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;

    if (Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $titulo = Validator::sanitizeString($fields['Nombre']);

      if (empty($titulo)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar el Nombre del Cliente');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }

      $fields['ID'] = $id;
      $this->_model->updateCliente($fields);

      Url::redirect($this->base_url . 'listar');
    }

    $data[$this->_tabla] = $this->_model->getCliente($id);
    $data['selectpos'] = $this->_model->getSelectPos($data[$this->_tabla]);
    
    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function filter($type = '') {
    $type = (!empty($type)) ? "Publico='" . $type . "'" : '';
    $cols = array('ID', 'Nombre', 'Website', 'Publico');

    $grid = new DataTables($this->_tabla, $cols, $type, array($this, 'setRowsExtra'), array($this, 'addActions'), 'Posicion'
    );
    echo $grid->render();
  }

  public function setRowsExtra($key = '', $value = null) {
    switch ($key) {
      case 'version':
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
      default :
        /* General output */
        $row = $value;
    }

    return $row;
  }

  public function addActions($row) {
    $url_edit = URL_CMS . Controller::getItem() . '/editar/';

    $icon = Helper::tag2('i', '', array('class' => 'fa fa-edit'));
    $link = Helper::tag2('a', $icon . ' Editar', array('class' => 'btn btn-info btn-sm', 'href' => $url_edit . $row['ID']));
    return $link;
  }

  public function upload() {
    $recortar = false;
    $result = $this->uploadImage($_FILES['userfile'], $this->_wimage, $this->_himage, $this->_wthumb, $this->_hthumb, $recortar);
    echo $result;
  }

  public function jcrop($code = '', $file = '', $ext = '') {
    if (isset($_POST['img'])) {
      $this->cropImage($this->_wthumb, $this->_hthumb);
    } else {
      $imagen = $file . '.' . $ext;
      $this->displayCrop($code, $imagen, $this->_wimage, $this->_himage);
    }
  }

  public function sortable() {
    $ids = $_POST['sortable'];
    $this->_model->updatePosiciones($ids);
    echo 'Las posiciones se ordenaron correctamente!';
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