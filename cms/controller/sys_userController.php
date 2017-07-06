<?php

class sys_userController extends Controller {

  private $_model;
  private $_tabla;
  private $_wimage;
  private $_himage;
  private $_wthumb;
  private $_hthumb;

  public function __construct() {
    parent::__construct();
    // Cargamos Todos los Elementos del Panel de Control
    $this->initialize();
    $this->_tabla = $this->_route['controller'];
    $this->_model = Load::model($this->_tabla);
    $this->_wimage = 300;
    $this->_himage = 300;
    $this->_wthumb = 150;
    $this->_hthumb = 150;
  }

  public function index() {
    $this->listar();
  }

  public function listar() {
    $data['title'] = 'Listando Usuarios CMS';
    $data['tabla'] = $this->_tabla;

    $this->getBreadcrumb('Usuarios CMS', 'listar');

    $data['base_url'] = $this->base_url;
    $data['heads'][] = array('title' => 'Nombre', 'sort' => 'sisort', 'align' => 'left');
    $data['heads'][] = array('title' => 'Usuario', 'sort' => 'sisort', 'align' => 'left');
    $data['heads'][] = array('title' => 'Acceso', 'sort' => 'sisort', 'align' => 'center');
    $data['heads'][] = array('title' => 'Estado', 'sort' => 'sisort', 'align' => 'center');

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function insertar() {
    $data['title'] = 'Nuevo Registro';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Usuarios CMS', 'listar');

    if (Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $nombre = Validator::sanitizeString($fields['Nombre']);
      $email = Validator::sanitizeString($fields['Email']);
      $usuario = Validator::sanitizeString($fields['Usuario']);
      $contrasenia = Validator::sanitizeString($fields['Contrasenia']);

      if (empty($nombre)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar el Nombre del Usuario');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      if (empty($email)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar su Email');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      if (empty($usuario)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar su nombre de usuario');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      if (empty($contrasenia)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar la contrase&ntilde;a!');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      $this->_model->updateUser($fields);
      Url::redirect($this->base_url . 'listar');
    }
    $data['roles'] = $this->_model->getRoles();
    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function editar($id) {
    if (!Validator::validateInteger($id))
      Url::redirect();
    if (!$this->_model->getUser($id))
      Url::redirect();

    $data['title'] = 'Editar Registro';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Usuarios CMS', 'listar');

    if (Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $nombre = Validator::sanitizeString($fields['Nombre']);
      $email = Validator::sanitizeString($fields['Email']);
      $usuario = Validator::sanitizeString($fields['Usuario']);

      if (empty($nombre)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar el Nombre del Usuario');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      if (empty($email)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar su Email');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      if (empty($usuario)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar su nombre de usuario');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }
      $fields['ID'] = $id;
      $this->_model->updateUser($fields);
      Url::redirect($this->base_url . 'listar');
    }
    $data['roles'] = $this->_model->getRoles();
    $data[$this->_tabla] = $this->_model->getUser($id);

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function perfil() {
    if (Session::get('authorized')) {
      $id = Session::get('user_id');

      if (!Validator::validateInteger($id))
        Url::redirect();
      if (!$this->_model->getUser($id))
        Url::redirect();

      $data['title'] = 'Editar Registro';
      $data['tabla'] = $this->_tabla;
      $data['base_url'] = $this->base_url;
      $this->getBreadcrumb('Usuarios CMS', 'listar');

      if (Validator::validateInteger('actualizar', true) == 1) {
        $data[$this->_tabla] = $_POST[$this->_tabla];
        $fields = $_POST[$this->_tabla];

        $nombre = Validator::sanitizeString($fields['Nombre']);
        $email = Validator::sanitizeString($fields['Email']);
        $usuario = Validator::sanitizeString($fields['Usuario']);
        $contrasenia = Validator::sanitizeString($fields['Contrasenia']);

        if (empty($nombre)) {
          $data['alert'] = $this->alertMessage('danger', 'Debe ingresar el Nombre del Usuario');
          $this->_view->assign('data', $data);
          $this->_view->render();
          exit;
        }
        if (empty($email)) {
          $data['alert'] = $this->alertMessage('danger', 'Debe ingresar su Email');
          $this->_view->assign('data', $data);
          $this->_view->render();
          exit;
        }
        if (empty($usuario)) {
          $data['alert'] = $this->alertMessage('danger', 'Debe ingresar su nombre de usuario');
          $this->_view->assign('data', $data);
          $this->_view->render();
          exit;
        }
        $fields['ID'] = $id;
        $this->_model->updateUser($fields);
        Url::redirect();
      }
      $data['roles'] = $this->_model->getRoles();
      $data[$this->_tabla] = $this->_model->getUser($id);

      $this->_view->assign('data', $data);
      $this->_view->render();
    }
  }

  public function check_email() {
    $is_true = $this->_model->checkEmail();
    echo ($is_true) ? 'true' : 'false';
  }

  public function check_user() {
    $is_true = $this->_model->checkUser();
    echo ($is_true) ? 'true' : 'false';
  }

  public function filter() {
    $cols = array('ID', 'Nombre', 'Usuario', 'RolID', 'Publico');

    $grid = new DataTables($this->_tabla, $cols, "RolID!='0'", array($this, 'setRowsExtra'), array($this, 'addActions')
    );
    echo $grid->render();
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
      case 'RolID':
        $row = $this->_model->getRol($value);
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

  public function getimage() {
    if (isset($_POST['num'])) {
      $data['name'] = $_POST['name'];
      $data['thumb'] = $_POST['thumb'];
      $data['image'] = $_POST['image'];
      $data['num'] = (int) $_POST['num'];
      echo Load::view('b-content' . DS . 'modules' . DS . $this->base_root . 'editar' . DS . 'mod-image', $data);
    }
  }

  public function upload($crop = 0) {
    $crop = ($crop == 0) ? true : true;
    $result = $this->uploadImage($_FILES['userfile'], $this->_wimage, $this->_himage, $this->_wthumb, $this->_hthumb, $crop);
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

  public function delimage() {
    $id = (isset($_POST['id'])) ? $_POST['id'] : false;
    $imagen = (isset($_POST['img'])) ? $_POST['img'] : '';

    $dir_thumb = $this->ruta_image . 'thumbs' . DS;
    $dir_image = $this->ruta_image . 'images' . DS;

    @unlink($dir_image . 'IM_' . $imagen);
    @unlink($dir_thumb . 'TH_' . $imagen);

    if ($id)
      echo $this->_model->deleteItemGaleria($id);

    echo 'true';
  }

}

?>