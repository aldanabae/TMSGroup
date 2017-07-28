<?php

class homeController extends Controller {

  public function __construct() {
    parent::__construct();
    $this->initialize();
    $this->_index = Load::model('home');
  }

  public function index() {
    $data['title'] = 'Home';
    $data['sliders'] = $this->_index->getSliders(); 
    $data['planes'] = $this->_index->getPlanes();  

    $data = array_merge($data, $this->getModules()); 
    $this->_view->assign('data', $data);
    $this->_view->render('index');
  }

  //public function seccion($url = '') {
  public function seccion() {
    $data['tabla'] = 'seccion';

    // if (!empty($url)) {
    //   $data[$data['tabla']] = $this->_index->getSeccion($url);
    //   $data['title'] = $data[$data['tabla']]['Titulo'];
    //   $data['meta'] = $this->_index->getMeta($data['tabla'], $data[$data['tabla']]['ID']);
    //   $data['parrafo'] = $this->_index->getParrafos($data['tabla'], $data[$data['tabla']]['ID']);
    // } else {
    //   die('Error 404: Página no encontrada');
    // }

    $data = array_merge($data, $this->getModules());
    $this->_view->assign('data', $data);
    $this->_view->render($data['tabla']);
  }

  public function categorias($url = '') {
    $data['tabla'] = 'categorias';

    if (!empty($url)) {
      $data['info_cat'] = $this->_index->getCategoriaID($url);
      $data['title'] = $data['info_cat']['Titulo'];

      $page = (isset($_POST['page'])) ? $_POST['page'] : 1;
      $data['postcat'] = $this->_index->paginationCategorias($page, $data['info_cat']['ID']);
    } else {
      die('Error 404: Página no encontrada');
    }

    $data = array_merge($data, $this->getModules());
    $this->_view->assign('data', $data);
    $this->_view->render($data['tabla']);
  }

  public function clientes() {
    $data['tabla'] = 'clientes';

    $data['clientes'] = $this->_index->getClientes();
    $data['title'] = 'Clientes';

    $data = array_merge($data, $this->getModules());
    $this->_view->assign('data', $data);
    $this->_view->render($data['tabla']);
  }

  public function autor($id = '') {
    $data['tabla'] = 'sys_user';

    if (!empty($id)) {
      $data['info_user'] = $this->_index->getUsuarioID($id);
      $data['title'] = $data['info_user']['Nombre'];

      $page = (isset($_POST['page'])) ? $_POST['page'] : 1;
      $data['postuser'] = $this->_index->paginationUser($page, $id);
    } else {
      die('Error 404: Página no encontrada');
    }

    $data = array_merge($data, $this->getModules());
    $this->_view->assign('data', $data);
    $this->_view->render($data['tabla']);
  }

  public function post($url = '') {
    $data['tabla'] = 'posts';

    if (!empty($url)) {
      $data[$data['tabla']] = $this->_index->getPost($url);
      $data['title'] = $data[$data['tabla']]['Titulo'];

      $data['meta'] = $this->_index->getMeta($data['tabla'], $data[$data['tabla']]['ID']);
      $data['parrafo'] = $this->_index->getParrafos($data['tabla'], $data[$data['tabla']]['ID']);
      $data['galeria'] = $this->_index->getGaleria($data['tabla'], $data[$data['tabla']]['ID']);
      $data['comments'] = $this->_index->getComentarios($data[$data['tabla']]['ID']);
    }

    $data = array_merge($data, $this->getModules());
    $this->_view->assign('data', $data);
    $this->_view->render($data['tabla']);
  }

  public function busqueda() {
    $data['tabla'] = 'posts';
    $data['title'] = 'Resultados de la Búsqueda';

    $key = (isset($_POST['search'])) ? $_POST['search'] : '';

    if (!empty($key) && strlen($key) > 3) {
      $page = (isset($_POST['page'])) ? $_POST['page'] : 1;
      $data['busqueda'] = $this->_index->searchPosts($page, $key);
    } else {
      die('Error: No ingresó los criterios de búsqueda correctamente!');
    }

    $data = array_merge($data, $this->getModules());
    $this->_view->assign('data', $data);
    $this->_view->render($data['tabla']);
  }

  public function getModules() {
    $data['config'] = $this->_index->getConfig();
    $data['redes'] = $this->_index->getRedes();

    return $data;
  }

  public function comments() {
    $info['nombre'] = Validator::sanitizeString('add_nombre', true);
    $info['email'] = Validator::sanitizeString('add_email', true);
    $email_valido = Validator::validateEmail('add_email', true);
    $info['comentario'] = Validator::sanitizeString('add_comment', true);
    $captcha = Validator::sanitizeString('add_captcha', true);
    $suma = Validator::sanitizeString('add_suma', true);
    $tabla = Validator::sanitizeString('tabla', true);
    $tabla_id = Validator::sanitizeString('tabla_id', true);

    if (Validator::validateInteger('savecom', true) == 1) {
      if (!$info['nombre']) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar su Nombre!'));
        die($output);
      }
      if (strlen($info['nombre']) < 4) {
        $output = json_encode(array('type' => 'error', 'text' => 'El Nombre ingresado es muy corto!'));
        die($output);
      }
      if (!$info['email']) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar su Email!'));
        die($output);
      }
      if (!$email_valido) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar un email v&aacute;lido!'));
        die($output);
      }
      if (!$info['comentario']) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar su comentario!'));
        die($output);
      }
      if ($captcha != $suma) {
        $output = json_encode(array('type' => 'error', 'text' => 'La suma no es correcta!'));
        die($output);
      }

      $data['Publico'] = 0;
      $data['Nombre'] = $info['nombre'];
      $data['Email'] = $info['email'];
      $data['Comentario'] = $info['comentario'];
      $data['Tabla'] = $tabla;
      $data['TablaID'] = $tabla_id;

      $update = $this->_index->saveComentario($data);

      if ($update) {
        $count = $this->_index->getCountComments($data['Tabla'], $data['TablaID']);

        $fields['ID'] = $data['TablaID'];
        $fields['Comments'] = (int) $count + 1;
        $this->_index->updateCountComments($data['Tabla'], $fields);

        $articulo = $this->_index->getArticulo($data['Tabla'], $data['TablaID']);

        $output = $this->formaSendComment($info, $articulo);

        die($output);
      }
    }
  }

  public function sendform() {
    $info['nombre'] = Validator::sanitizeString('nombre', true);
    $info['telefono'] = Validator::sanitizeString('telefono', true);
    $info['email'] = Validator::sanitizeString('email', true);
    $email_valido = Validator::validateEmail('email', true);
    $info['consulta'] = Validator::sanitizeString('consulta', true);

    if (Validator::validateInteger('enviar', true) == 1) {
      if (!$info['nombre']) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar su Nombre!'));
        die($output);
      }
      if (strlen($info['nombre']) < 4) {
        $output = json_encode(array('type' => 'error', 'text' => 'El Nombre ingresado es muy corto!'));
        die($output);
      }
      if (!$info['telefono']) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar su tel&eacute;fono!'));
        die($output);
      }
      if (!$info['email']) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar su Email!'));
        die($output);
      }
      if (!$email_valido) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar un email v&aacute;lido!'));
        die($output);
      }
      if (!$info['consulta']) {
        $output = json_encode(array('type' => 'error', 'text' => 'Debe ingresar su consulta!'));
        die($output);
      }

      $output = $this->formatSendMail($info);

      die($output);
    }
  }

  public function tracking($tabla = '', $id = '') {
    $fields['IP'] = $_SERVER['REMOTE_ADDR'];

    $bro = new Browser;
    $navegador = ucfirst($bro->Name) . ' / ' . $bro->Version;
    $fields['IsHome'] = (($tabla == 'seccion') && empty($id)) ? 1 : 0;
    $fields['Tabla'] = $tabla;
    $fields['TablaID'] = (!empty($id)) ? $id : 0;
    $fields['Filename'] = $_SERVER['SCRIPT_NAME'];
    $fields['UrlVisited'] = $_SERVER['HTTP_REFERER'];
    $fields['Host'] = gethostbyaddr($_SERVER['REMOTE_ADDR']);
    $fields['Navegador'] = $navegador;
    $fields['Fecha'] = date('Y-m-d');
    $fields['Hora'] = date('H:i:s');

    $this->_index->saveTracking($fields);

    if ($tabla == 'posts') {
      $total = $this->_index->visitasPost($id);

      $emp['ID'] = $id;
      $emp['Views'] = $total;
      $res = $this->_index->savePost($emp);
    }
  }

}

?>