<?php

class seccionController extends Controller {

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

  public function __construct() {
    parent::__construct();
    // Cargamos Todos los Elementos del Panel de Control
    $this->initialize();
    $this->_tabla = $this->_route['controller'];
    $this->_model = Load::model($this->_tabla);
    $this->_wimage = 720;
    $this->_himage = 450;
    $this->_wthumb = 200;
    $this->_hthumb = 150;
    $this->_gal_wimage = 800;
    $this->_gal_himage = 600;
    $this->_gal_wthumb = 200;
    $this->_gal_hthumb = 150;
  }

  public function index() {
    $this->listar();
  }

  public function listar($type = 1) {
    $data['title'] = 'Listando Secciones';
    $data['tabla'] = $this->_tabla;
    $data['type'] = $type;

    $this->getBreadcrumb('Secciones', 'listar/' . $type);

    if (Validator::validateInteger('listar', true) == 1) {
      $opt = Validator::sanitizeInteger('accion', true);
      $ids = $_POST['selected'];
      ($opt == 4) ? $this->_model->deleteSecciones($ids) : $this->_model->updateSecciones($opt, $ids);
    }

    $data['base_url'] = $this->base_url;

    $tree = new TreeTable($this->base_url, $type);
    $data['tree_table'] = $tree->render();
    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function insertar() {
    $data['title'] = 'Nuevo Registro';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Secciones', 'listar/1');

    if (Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $titulo = Validator::sanitizeString($fields['Titulo']);

      $data['meta'] = isset($_POST['meta']) ? $_POST['meta'] : array();
      $data['parrafo'] = isset($_POST['paragraph']) ? $_POST['paragraph'] : array();
      $data['galeria'] = isset($_POST['gallery']) ? $_POST['gallery'] : array();

      if (empty($titulo)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar el T&iacute;tulo de la Secci&oacute;n');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }

      $fields['IsForm'] = (isset($fields['IsForm'])) ? $fields['IsForm'] : 0;
      $fields['IsTop'] = (isset($fields['IsTop'])) ? $fields['IsTop'] : 0;
      $fields['IsBot'] = (isset($fields['IsBot'])) ? $fields['IsBot'] : 0;
      $id = $this->_model->updateSeccion($fields);
      $this->_model->updateMeta($data['meta'], $id);
      $this->_model->updateParrafos($data['parrafo'], $id);
      $this->_model->updateGaleria($data['galeria'], $id);

      Url::redirect($this->base_url . 'listar/1');
    }

    $select = new Select();
    $data['selectsec'] = $select->render();
    $data['selectpos'] = $this->recordSort($this->_model->getSelectPos(), 'Posicion');
    $data['selplantilla'] = $this->_model->selectPlantillas();
    $data['tablas'] = $this->_model->getTables();

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function editar($id) {
    if (!Validator::validateInteger($id))
      Url::redirect();
    if (!$this->_model->getSeccion($id))
      Url::redirect();

    $data['title'] = 'Editar Registro';
    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;
    $this->getBreadcrumb('Secciones', 'listar/1');

    if (Validator::validateInteger('actualizar', true) == 1) {
      $data[$this->_tabla] = $_POST[$this->_tabla];
      $fields = $_POST[$this->_tabla];
      $titulo = Validator::sanitizeString($fields['Titulo']);

      $data['meta'] = isset($_POST['meta']) ? $_POST['meta'] : array();
      $data['parrafo'] = isset($_POST['paragraph']) ? $_POST['paragraph'] : array();
      $data['galeria'] = isset($_POST['gallery']) ? $_POST['gallery'] : array();

      if (empty($titulo)) {
        $data['alert'] = $this->alertMessage('danger', 'Debe ingresar el T&iacute;tulo de la Secci&oacute;n');
        $this->_view->assign('data', $data);
        $this->_view->render();
        exit;
      }

      $this->_model->updateMeta($data['meta'], $id);
      $this->_model->updateParrafos($data['parrafo'], $id);
      $this->_model->updateGaleria($data['galeria'], $id);

      $fields['ID'] = $id;
      $fields['IsForm'] = (isset($fields['IsForm'])) ? $fields['IsForm'] : 0;
      $fields['IsTop'] = (isset($fields['IsTop'])) ? $fields['IsTop'] : 0;
      $fields['IsBot'] = (isset($fields['IsBot'])) ? $fields['IsBot'] : 0;
      $this->_model->updateSeccion($fields);

      Url::redirect($this->base_url . 'listar/1');
    }

    $data[$this->_tabla] = $this->_model->getSeccion($id);
    $data['meta'] = $this->_model->getMeta($id);
    $data['parrafo'] = $this->_model->getParrafos($id);
    $data['galeria'] = $this->_model->getGaleria($id);

    $select = new Select($data[$this->_tabla]['PadreID']);
    $data['selectsec'] = $select->render();
    $data['selectpos'] = $this->recordSort($this->_model->getSelectPos($data[$this->_tabla]), 'Posicion');
    $data['selplantilla'] = $this->_model->selectPlantillas();
    $data['tablas'] = $this->_model->getTables();

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function select($id = '') {
    $parent_id = (int) $_POST['parent'];
    $parent_ant = (int) $_POST['prev'];
    $select_pos = $this->_model->getSelectPosAct($parent_id);
    $count = count($select_pos) + 1;

    if ($id != 0) {
      $this->_model->reorderParentPrev($id, $parent_ant);
      $data[$this->_tabla] = $this->_model->updateParentPos($id, $parent_id, $count);
      $select_pos[] = $data[$this->_tabla];
    } else {
      $data[$this->_tabla] = array('ID' => $id,
          'Titulo' => 'Nueva Secci&oacute;n',
          'Posicion' => $count,
          'PadreID' => $parent_id,
      );

      if (is_array($select_pos)) {
        $select_pos[] = $data[$this->_tabla];
      } else {
        $select_pos = array($data[$this->_tabla]);
      }
    }

    $data['tabla'] = $this->_tabla;
    $data['base_url'] = $this->base_url;
    $data['selectpos'] = $select_pos;
    echo Load::view('b-content' . DS . 'modules' . DS . $this->base_root . 'editar' . DS . 'mod-posicion', $data);
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

  public function sortable() {
    $ids = $_POST['sortable'];
    $this->_model->updatePosiciones($ids);
    echo 'Las posiciones se ordenaron correctamente!';
  }

  public function clonar($id) {
    $data['base_url'] = $this->base_url;
    $data['tabla'] = $this->_tabla;
    $data['cur'] = $id;
    $data['route'] = $this->_route;

    echo Load::view('b-content' . DS . 'modules' . DS . $this->base_root . 'editar' . DS . 'mod-parrafo', $data);
  }

  public function deltab() {
    $id = (isset($_POST['id'])) ? $_POST['id'] : false;
    $imagen = $this->_model->getImagenParrafo($id);

    $dir_thumb = $this->ruta_image . 'thumbs' . DS;
    $dir_image = $this->ruta_image . 'images' . DS;

    @unlink($dir_image . 'IM_' . $imagen);
    @unlink($dir_thumb . 'TH_' . $imagen);

    if ($id)
      $this->_model->deleteParrafo($id);

    echo 'El p&aacute;rrafo fue eliminado correctamente!';
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

  public function galeria() {
    if (isset($_FILES['Filedata'])) {
      echo $this->uploadImage($_FILES['Filedata'], $this->_gal_wimage, $this->_gal_himage, $this->_gal_wthumb, $this->_gal_hthumb, true);
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