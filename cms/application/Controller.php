<?php

/*
 * -------------------------------------
 * www.desarrollowebline.com.ar | Oscar Castillo
 * CMS MVC
 * Controller.php
 * -------------------------------------
 */

abstract class Controller {

  protected $_registry;
  protected $_view;
  protected $_route;
  protected $base_url;
  protected $base_root;
  protected $ruta_temp;
  protected $ruta_image;
  private static $_item;

  abstract public function index();

  public function __construct() {
    $this->_registry = Registry::getInstance();
    $this->_request = $this->_registry->_request;

    $this->_route['controller'] = self::$_item = $this->_request->getController();
    $this->_route['method'] = $this->_request->getMethod();
    $this->_route['params'] = $this->_request->getArgs();

    $this->_view = new View;
    $this->_view->assign('route', $this->_route);
  }

  protected function initialize() {
    if (Session::get('authorized') == null)
      Url::redirect('login/login');

    $menu_left = new MenuLeft();
    $this->_view->assign('menu_left', $menu_left->render());

    $this->base_url = $this->_route['controller'] . '/';
    $this->base_root = $this->_route['controller'] . DS;
    $this->ruta_temp = ROOT . 'view' . DS . 'temp' . DS;
    $this->ruta_image = GAL_PATH . $this->_route['controller'] . DS;
  }

  protected function getBreadcrumb($title, $url = '') {
    $mainTitle = '';
    $breadcrumb = new Breadcrumb(self::getItem());
    $breadcrumb->add('#', $title);

    if (!empty($url)) {
      $breadcrumb->add($url);
      $mainTitle = $breadcrumb->getTitle($url);
    }
    $this->_view->assign('main_title', $mainTitle);
    $this->_view->assign('breadcrumb', $breadcrumb->render());
  }

  public function alertMessage($class = '', $message = '') {
    $alert_css = (isset($class)) ? $class : '';
    $alert_msg = (isset($message)) ? $message : '';

    if (!empty($alert_msg)) {
      return '
				<script>' .
              "alertMessage('" . $alert_css . "','" . $alert_msg . "');" .
              '</script>';
    } else {
      return '';
    }
  }

  public static function getItem() {
    return self::$_item;
  }

  public function generatePassword($length = 8) {
    $chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    for ($pass = '', $n = strlen($chars) - 1; strlen($pass) < $length;) {
      $x = rand(0, $n);
      $pass.= $chars[$x];
    }
    return $pass;
  }

  public function createImage($file, $folder, $new_name, $new_w, $new_h, $crop_x = -1, $crop_y = -1) {
    list($ancho, $alto, $tipo, $atributos) = getimagesize($file);
    $thumb_w = $new_w;
    $thumb_h = $new_h;

    switch ($tipo) {
      case IMAGETYPE_GIF:
        $src_img = imagecreatefromgif($file);
        break;
      case IMAGETYPE_JPEG:
        $src_img = imagecreatefromjpeg($file);
        break;
      case IMAGETYPE_PNG:
        $src_img = imagecreatefrompng($file);
        break;
    }

    // Si la Imagen se rota sola, el siguiente codigo lo arregla
    // Solo funciona para imagenes JPG
    if ($tipo == IMAGETYPE_JPEG && function_exists('exif_read_data')) {
      $exif = exif_read_data($file);

      if (!empty($exif['Orientation'])) {
        switch ($exif['Orientation']) {
          case 8:
            $src_img = imagerotate($src_img, 90, 0);
            break;
          case 3:
            $src_img = imagerotate($src_img, 180, 0);
            break;
          case 6:
            $src_img = imagerotate($src_img, -90, 0);
            break;
        }
      }
    }

    $old_x = imageSX($src_img);
    $old_y = imageSY($src_img);

    if ($crop_x == -1 && $crop_y == -1) {
      if (($old_x > $old_y) || ($old_x < $old_y)) {
        $thumb_w = $new_w;
        $percent = ($new_w * 100) / $old_x;
        $thumb_h = ceil(($percent * $old_y) / 100);
      }
      if ($thumb_h < $new_h) {
        $percent = ($new_h * 100) / $old_y;
        $thumb_w = ceil(($percent * $old_x) / 100);
        $thumb_h = $new_h;
      }
      if ($old_x == $old_y) {
        $thumb_w = $new_w;
        $thumb_h = $new_h;
      }
    }

    $dst_img = ImageCreateTrueColor($thumb_w, $thumb_h);

    if ($tipo == IMAGETYPE_GIF || $tipo == IMAGETYPE_PNG) {
      $trans_index = imagecolortransparent($src_img);

      if ($trans_index >= 0) {
        $trans_color = imagecolorsforindex($src_img, $trans_index);
        $trans_index = imagecolorallocate($dst_img, $trans_color['red'], $trans_color['green'], $trans_color['blue']);
        imagefill($dst_img, 0, 0, $trans_index);
        imagecolortransparent($dst_img, $trans_index);
      } elseif ($tipo == IMAGETYPE_PNG) {
        imagealphablending($dst_img, false);
        $color = imagecolorallocatealpha($dst_img, 0, 0, 0, 127);
        imagefill($dst_img, 0, 0, $color);
        imagesavealpha($dst_img, true);
      }
    }

    if ($crop_x == -1 && $crop_y == -1) {
      imagecopyresampled($dst_img, $src_img, 0, 0, 0, 0, $thumb_w, $thumb_h, $old_x, $old_y);
    } else {
      imagecopyresampled($dst_img, $src_img, 0, 0, $crop_x, $crop_y, $new_w, $new_h, $new_w, $new_h);
    }

    if (USE_MARCA != '') {
      if (($tipo == IMAGETYPE_JPEG || $tipo == IMAGETYPE_PNG) &&
              (USE_MARCA == $this->_route['controller']) && (substr($new_name, 0, 2) == 'IM')) {
        $marca = imagecreatefrompng(CMS_MARCA);
        $sx = imageSX($marca);
        $sy = imageSY($marca);
        $ix = imageSX($dst_img);
        $iy = imageSY($dst_img);

        $centerX = ($ix / 2) - ($sx / 2);
        $centerY = ($iy / 2) - ($sy / 2);

        imagecopy($dst_img, $marca, $centerX, $centerY, 0, 0, imagesx($marca), imagesy($marca));
      }
    }

    switch ($tipo) {
      case IMAGETYPE_GIF:
        $ext = '.gif';
        imagegif($dst_img, $folder . $new_name . $ext, 100); //soporta de 0 - 100
        break;
      case IMAGETYPE_JPEG:
        $ext = '.jpg';
        imagejpeg($dst_img, $folder . $new_name . $ext, 100); //soporta de 0 - 100
        break;
      case IMAGETYPE_PNG:
        $ext = '.png';
        imagepng($dst_img, $folder . $new_name . $ext, 9); //soporta de 0 - 9
        break;
    }

    imagedestroy($dst_img);
    imagedestroy($src_img);

    if (file_exists($folder . $new_name . $ext))
      return $new_name . $ext;
    else
      return false;
  }

  public function createFolder($folder, $sep = '/') {
    $arrayDir = explode($sep, $folder);
    $string = '';

    $i = 0;
    foreach ($arrayDir as $dir) {
      $separ = ($i > 0) ? $sep : '';
      $string .= $separ . $dir;

      if (!is_dir($string)) {
        @mkdir($string, 0755);
        $error = 'Importante: Directorio creado correctamente!';
      } else
        $error = 'Error: Directorio ya existe!';
      $i++;
    }

    return $error;
  }

  public function uploadFile($source = null, $width = '', $height = '') {
    $json = array('success' => 0);
    $tabla = $this->_route['controller'];

    if (isset($source['name'])) {
      $dir_file = $this->ruta_image . 'files' . DS;
      $this->createFolder($dir_file, DS);

      $temp = $source['tmp_name'];
      $new_name = mt_rand(1, 99999999);

      if (is_uploaded_file($temp)) {
        $info = pathinfo($source['name']);
        $ext = $info['extension'];

        $new_upload = 'FIL_' . $new_name . '.' . $ext;

        if (move_uploaded_file($temp, $dir_file . $new_upload)) {
          $json = array('success' => 1,
              'code' => $new_name,
              'name' => $new_upload,
              'width' => $width,
              'height' => $height,
              'swf' => $new_upload,
              'url' => URL_CMS . $tabla . '/download/');
        }
      }
    }

    return json_encode($json);
  }

  public function uploadImage($source = null, $wimage = 0, $himage = 0, $wthumb = 0, $hthumb = 0, $auto = false) {
    $type = 0;
    $json = array('success' => $type);
    $tabla = $this->_route['controller'];

    if (isset($source['name'])) {
      $dir_thumb = $this->ruta_image . 'thumbs' . DS;
      $dir_image = $this->ruta_image . 'images' . DS;
      $temp = $source['tmp_name'];

      $new_name = mt_rand(1, 99999999);
      $new_upload = $this->createImage($temp, $this->ruta_temp, $new_name, $wimage, $himage);

      if ($new_upload) {
        list($ancho, $alto, $tipo, $atributos) = getimagesize($this->ruta_temp . $new_upload);
        $new_w = $ancho;
        $new_h = $alto;

        if ($new_h > $himage) {
          $type = 2;
        } elseif ($new_w > $wimage) {
          $type = 2;
        } elseif (($new_h == $himage && $new_w == $wimage)) {
          $type = 1;
        }

        if ($type == 1 || $auto) {
          $this->createFolder($dir_thumb, DS);
          $this->createFolder($dir_image, DS);

          $new_image = $this->createImage($this->ruta_temp . $new_upload, $dir_image, 'IM_' . $new_name, $wimage, $himage);
          $new_thumb = $this->createImage($this->ruta_temp . $new_upload, $dir_thumb, 'TH_' . $new_name, $wthumb, $hthumb);
          unlink($this->ruta_temp . $new_upload);
          $type = 1;
        }

        $json = array('success' => $type,
            'code' => $new_name,
            'name' => $new_upload,
            'width' => $new_w,
            'height' => $new_h,
            'image' => $new_upload,
            'url' => URL_GAL . $tabla . '/');
      }
    }
    return json_encode($json);
  }

  public function cropImage($width, $height) {
    $tabla = $this->_route['controller'];
    $dir_thumb = $this->ruta_image . 'thumbs' . DS;
    $dir_image = $this->ruta_image . 'images' . DS;

    $this->createFolder($dir_thumb, DS);
    $this->createFolder($dir_image, DS);

    $code = $_POST['code'];
    $name = explode('.', $_POST['img']);
    $image = $_POST['img'];
    $new_name = $name[0];
    $new_image = $this->createImage($this->ruta_temp . $image, $dir_image, 'IM_' . $new_name, $_POST['w'], $_POST['h'], $_POST['x'], $_POST['y']);

    if ($new_image) {
      unlink($this->ruta_temp . $image);
      $new_thumb = $this->createImage($dir_image . $new_image, $dir_thumb, 'TH_' . $new_name, $width, $height);

      if ($new_thumb) {
        echo "<script>
				parent.setImage('" . $code . "','" . $image . "','" . URL_GAL . $tabla . '/' . "');
				parent.jQuery.fancybox.close();
				</script>";
      }
    } else {
      echo 'Error: No se pudo recortar la imagen!';
    }
  }

  public function originalImage($code, $image, $wimage = 0, $himage = 0, $wthumb = 0, $hthumb = 0) {
    $tabla = $this->_route['controller'];
    $dir_thumb = $this->ruta_image . 'thumbs' . DS;
    $dir_image = $this->ruta_image . 'images' . DS;
    $nameimg = explode('.', $image);

    $this->createFolder($dir_thumb, DS);
    $this->createFolder($dir_image, DS);

    $new_image = $this->createImage($this->ruta_temp . $image, $dir_image, 'IM_' . $nameimg[0], $wimage, $himage);
    $new_thumb = $this->createImage($this->ruta_temp . $image, $dir_thumb, 'TH_' . $nameimg[0], $wthumb, $hthumb);

    unlink($this->ruta_temp . $image);

    return "<script>
				parent.setImage('" . $code . "','" . $image . "','" . URL_GAL . $tabla . '/' . "');
				parent.jQuery.fancybox.close();
				</script>";
  }

  public function displayCrop($code = '', $imagen = '', $width = 0, $height = 0, $categoria = '') {
    list($ancho, $alto, $tipo, $atributos) = getimagesize($this->ruta_temp . $imagen);

    $data['action'] = $this->base_url . 'jcrop';
    $data['category'] = $categoria;
    $data['code'] = $code;
    $data['image'] = $imagen;
    $data['new_w'] = $ancho;
    $data['new_h'] = $alto;
    $data['wimage'] = $width;
    $data['himage'] = $height;
    $data['tabla'] = $this->_route['controller'];
    echo Load::view('jcrop' . DS . 'index', $data);
  }

  public function recordSort($records, $field, $reverse = false) {
    $hash = array();
    foreach ($records as $record) {
      $hash[$record[$field]] = $record;
    }

    ($reverse) ? krsort($hash) : ksort($hash);
    $records = array();

    foreach ($hash as $record) {
      $records [] = $record;
    }

    return $records;
  }

  public function downloadFile($file = '') {
    if (!isset($file) || empty($file)) {
      exit();
    }

    $root = $this->ruta_image . 'files' . DS;
    $file = basename($file);
    $path = $root . $file;
    $type = '';

    if (is_file($path)) {
      $size = filesize($path);
      if (function_exists('mime_content_type')) {
        $type = mime_content_type($path);
      } else if (function_exists('finfo_file')) {
        $info = finfo_open(FILEINFO_MIME);
        $type = finfo_file($info, $path);
        finfo_close($info);
      }
      if ($type == '') {
        $type = "application/force-download";
      }
      // Definir headers
      header("Content-Type: $type");
      header("Content-Disposition: attachment; filename=$file");
      header("Content-Transfer-Encoding: binary");
      header("Content-Length: " . $size);
      // Descargar archivo
      readfile($path);
    } else {
      echo "Error: El archivo no existe.";
    }
  }

  public static function trace($var) {
    var_dump($var);
    die();
  }

  /*
   * CONFIGURATION:
   * -------------
   * array(
    'from_name' => '',
    'from_email' => '',
    'to_email' => array(),
    'subject' => '',
    'body' => '',
    'attach' => ''
    );
   *
   * $mail->addAddress($email,$nombre_usuario):
   * $mail->AddAttachment($ruta_archivo,$nombre_archivo);
   */

  public function sendMail($data = array()) {
    Load::library('phpmailer/class.phpmailer');
    $mail = new PHPMailer();

    $mail->From = $data['from_email'];
    $mail->FromName = $data['from_name'];
    $mail->Subject = $data['subject'];
    $mail->Body = $data['body'];
    $mail->AltBody = 'Su servidor de correo no soporta HTML';
    $mail->AddAddress($data['to_email']);

    if (!$mail->Send()) {
      $error = 'Error: ' . $mail->ErrorInfo;
      return false;
    } else {
      return true;
    }
  }

}

?>
