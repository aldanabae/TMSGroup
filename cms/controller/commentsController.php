<?php

class commentsController extends Controller {

  private $_model;
  private $_tabla;

  public function __construct() {
    parent::__construct();
    // Cargamos Todos los Elementos del Panel de Control
    $this->initialize();
    $this->_tabla = $this->_route['controller'];
    $this->_model = Load::model($this->_tabla);
  }

  public function index() {
    $this->listar();
  }

  public function listar($type = 1) {
    $data['title'] = 'Listando Comentarios';
    $data['tabla'] = $this->_tabla;
    $data['type'] = $type;

    $this->getBreadcrumb('Comentarios', 'listar');

    if (Validator::validateInteger('listar', true) == 1) {
      $opt = Validator::sanitizeInteger('accion', true);
      $ids = $_POST['selected'];
      ($opt == 4) ? $this->_model->deleteComments($ids) : $this->_model->updateComments($opt, $ids);
    }

    $data['base_url'] = $this->base_url;
    $data['heads'][] = array('title' => 'Nombre', 'sort' => 'sisort', 'align' => 'left');
    $data['heads'][] = array('title' => 'Comentario', 'sort' => 'sisort', 'align' => 'left');
    $data['heads'][] = array('title' => 'Post', 'sort' => 'sisort', 'align' => 'left');
    $data['heads'][] = array('title' => 'Estado', 'sort' => 'nosort center', 'align' => 'center');

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function publicar($id) {
    if (!Validator::validateInteger($id))
      Url::redirect();
    if (!$this->_model->getComment($id))
      Url::redirect();

    $fields['ID'] = $id;
    $fields['Publico'] = 1;
    $this->_model->updateComment($fields);
    Url::redirect($this->base_url . 'listar');
  }

  public function filter($type = '') {
    $type = (!empty($type)) ? "Publico='" . $type . "'" : '';
    $cols = array('ID', 'Nombre', 'Comentario', 'TablaID', 'Publico');

    $grid = new DataTables($this->_tabla, $cols, $type, array($this, 'setRowsExtra'), array($this, 'addActions')
    );
    echo $grid->render();
  }

  public function setRowsExtra($key = '', $value = null) {
    $row = $value;
    
    switch ($key) {
      case 'version':
        /* Special output formatting for 'version' column */
        $row = ($value == "0") ? '-' : $value;
        break;
      case 'ID':
        $row = Helper::input(array('type' => 'checkbox', 'value' => $value, 'name' => 'selected[]'));
        break;
      case 'TablaID':
        $data = $this->_model->getPost($value);
        $row = $data['Titulo'];
        break;
      case 'Publico':
        switch ($value) {
          case 1:
            $row = Helper::tag2('span', 'P&uacute;blico', array('class' => 'label label-success'));
            break;
          case 0:
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
    $url_ver = URL_WEB . 'post/';
    $url_edit = URL_CMS . Controller::getItem() . '/publicar/';
    $data = $this->_model->getPost($row['TablaID']);

    $icon1 = Helper::tag2('i', '', array('class' => 'fa fa-external-link'));
    $icon2 = Helper::tag2('i', '', array('class' => 'fa fa-edit'));
    $link1 = Helper::tag2('a', $icon1 . ' Ver Post', array('class' => 'btn btn-success btn-sm', 'href' => $url_ver . $data['URL'], 'target' => '_blank'));
    $link2 = Helper::tag2('a', $icon2 . ' Publicar', array('class' => 'btn btn-info btn-sm', 'href' => $url_edit . $row['ID']));
    return $link1 . '  ' . $link2;
  }

}

?>