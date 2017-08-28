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
    $data['servicios'] = $this->_index->getServicios();
    $data['portfolio'] = $this->_index->getPortfolios();

    $data = array_merge($data, $this->getModules());
    $this->_view->assign('data', $data);
    $this->_view->render('index');
  }

  public function seccion($url = '') {
    $data['tabla'] = 'seccion';

    if (!empty($url)) {
      $data[$data['tabla']] = $this->_index->getSeccion($url);
      $info = $data[$data['tabla']];

      if(!$info){
         Url::redirect('error');
      }

      if(!empty($info['TablaSec'])) {
        $data['tabla_sec'] = $this->_index->getTablaSec($info['TablaSec']);
      }

      $data['title'] = $data[$data['tabla']]['Titulo'];
      $data['meta'] = $this->_index->getMeta($data['tabla'], $data[$data['tabla']]['ID']);
      $data['parrafos'] = $this->_index->getParrafos($data['tabla'], $data[$data['tabla']]['ID']);
    } else {
      Url::redirect('error');
    }

    $data = array_merge($data, $this->getModules());
    $this->_view->assign('data', $data);
    $this->_view->render($data['tabla']);
  }

  public function portfolio($url = '') {
    $data['tabla'] = 'portfolio';

    if (!empty($url)) {
      $data[$data['tabla']] = $this->_index->getPortfolio($url);
      $data['title'] = $data[$data['tabla']]['Titulo'];
      $data['galeria'] = $this->_index->getGaleria($data['tabla'], $data[$data['tabla']]['ID']);

    } else {
      Url::redirect('error');
    }

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
      Url::redirect('error');
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

  public function partners() {
    $data['tabla'] = 'partners';

    $data['partners'] = $this->_index->getPartners();
    $data['title'] = 'Partners';

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
      Url::redirect('error');
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

  public function sendformContacto() {
    $info['nombre'] = Validator::sanitizeString('nombre', true);
    $info['asunto'] = Validator::sanitizeString('asunto', true);
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

  public function sendformSumate() {
    if(isset($_POST['email'])) {    
        //Para y asunto del mensaje a enviar
        $email_to = "info@tmsgroup.com.ar"; 
        $email_subject = "Formulario Postulante - TMS Gruop WEB";

        //Validation expected data exists
        if(!isset($_POST['nombre']) ||
            !isset($_POST['apellido']) ||
            !isset($_POST['dni']) ||
            !isset($_POST['email']) ||
            !isset($_POST['celular']) ||
            !isset($_POST['asunto']) ||
            !isset($_POST['mensaje']) ||
            !isset($_FILES['cvitae']['name'])){
              $error = "Lo sentimos, pero hubo un error(es) encontrado en el formulario.";
              $this->died($error);       
        }
         
        //variables para los campos
        $nombre = $_POST['nombre']; // required
        $apellido = $_POST['apellido']; // required
        $dni = $_POST['dni']; // required
        $email_from = $_POST['email']; // required
        $celular = $_POST['celular']; // required
        $asunto = $_POST['asunto']; // not required
        $mensaje = $_POST['mensaje']; // not required
            
        $error_message = "";
        $email_exp = '/^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/';
        $string_exp = "/^[A-Za-z .'-]+$/";
        
        if(!preg_match($email_exp,$email_from)) {
          $error_message .= 'El email que ingresaste no parece ser válido. <br />';
        }
        if(!preg_match($string_exp,$nombre)) {
          $error_message .= 'El nombre que ingresaste no parece ser válido. <br />';
        }
        if(!preg_match($string_exp,$apellido)) {
          $error_message .= 'El apellido que ingresaste no parece ser válido. <br />';
        }
        if(strlen($mensaje) < 2) {
          $error_message .= 'El mensaje que ingresaste no parece ser válido<br />';
        }
        if(strlen($error_message) > 0) {
          $this->died($error_message);
        }

        //variables para los datos del archivo 
        $nombrearchivo = $_FILES['cvitae']['name'];
        $archivo = $_FILES['cvitae']['tmp_name'];
        // Leemos el archivo a adjuntar
        
        $archivo = file_get_contents($archivo);
        $archivo = chunk_split(base64_encode($archivo));
    
        // Cuerpo del Email
        $CuerpoMensaje  = "";
        $CuerpoMensaje .= "A continuación más detalles:\r\n\r\n";
        $CuerpoMensaje .= "Nombre: ".$this->clean_string($nombre)."\r\n";
        $CuerpoMensaje .= "Apellido: ".$this->clean_string($apellido)."\r\n";
        $CuerpoMensaje .= "DNI: ".$this->clean_string($dni)."\r\n";
        $CuerpoMensaje .= "Email: ".$this->clean_string($email_from)."\r\n";    
        $CuerpoMensaje .= "Celular: ".$this->clean_string($celular)."\r\n";
        $CuerpoMensaje .= "Asunto: ".$this->clean_string($asunto)."\r\n";
        $CuerpoMensaje .= "Mensaje: ".$this->clean_string($mensaje)."\r\n";
       
        
        //Cabecera del email (forma correcta de codificarla)
        $headers = "From: TMS Group WEB <" . $email_from . ">\r\n";
        //$header .= "Reply-To: " . $replyto . "\r\n";
        $headers .= "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: multipart/mixed; boundary=\"=A=G=R=O=\"\r\n\r\n";
        //Armando mensaje del email
        $email_message = "--=A=G=R=O=\r\n";
        $email_message .= "Content-type:text/plain; charset=utf-8\r\n";
        $email_message .= "Content-Transfer-Encoding: 7bit\r\n\r\n";
        $email_message .= $CuerpoMensaje . "\r\n\r\n";
        
        //Archivo adjunto  para email    
        $email_message .= "--=A=G=R=O=\r\n";
        $email_message .= "Content-Type: application/octet-stream; name=\"" . $nombrearchivo . "\"\r\n";
        $email_message .= "Content-Transfer-Encoding: base64\r\n";
        $email_message .= "Content-Disposition: attachment; filename=\"" . $nombrearchivo . "\"\r\n\r\n";
        $email_message .= $archivo . "\r\n\r\n";
        $email_message .= "--=A=G=R=O=--";
        
        //Enviamos el email   
        if(mail($email_to, $email_subject, $email_message, $headers)){
          Session::set('mensaje_ok', "Su mensaje fue enviado correctamente!");
          Url::redirect('sumate');
        }
    }
  }

  public function died($error) {
    Session::set('mensaje_ok', "<div style='color: #f44336;'>
                                Lo sentimos mucho, pero hubo un error(es) encontrado en el formulario.</br> 
                                Estos son los errores:</br>
                                $error</br>
                                Arregle el error.</div>");
    Url::redirect('sumate');
  }

  public function clean_string($string) {
    $bad = array("content-type","bcc:","to:","cc:","href");
    return str_replace($bad,"",$string);
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