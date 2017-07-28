<?php

class homeModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getConfig() {
    return $this->find('config', 1);
  }

  public function getSeccionID($id) {
    return $this->where(array('table' => 'seccion', 'where' => "ID='" . $id . "'", 'limit' => 1));
  }


  public function getUser($id) {
    return $this->where(array('table' => 'sys_user', 'where' => "ID='" . $id . "'", 'limit' => 1));
  }

  public function getPost($url) {
    $t1 = DB_PREF . 'posts';
    $t2 = DB_PREF . 'sys_user';
    $t3 = DB_PREF . 'categorias';
    $query = "SELECT t1.*, t2.Nombre as Usuario, t3.Nombre as Categoria, t3.URL as UrlCat "
            . " FROM " . $t1 . " t1 "
            . " INNER JOIN " . $t2 . " t2 ON t1.UsuarioID=t2.ID "
            . " INNER JOIN " . $t3 . " t3 ON t1.CategoriaID=t3.ID "
            . " WHERE t1.URL='" . $url . "'";
    $row = $this->_db->query($query);
    return $row->fetch(PDO::FETCH_ASSOC);
  }

  public function getSeccion($url) {
    $t1 = DB_PREF . 'seccion';
    $t2 = DB_PREF . 'plantillas';
    $query = "SELECT t1.*, t2.Archivo FROM " . $t1 . " t1 "
            . " INNER JOIN " . $t2 . " t2 ON t1.PlantillaID=t2.ID "
            . " WHERE t1.URL='" . $url . "'";
    $row = $this->_db->query($query);
    $temp = $row->fetchAll(PDO::FETCH_ASSOC);

    return (count($temp) > 0) ? $temp[0] : false;
  }

  public function getSliders() {
    return $this->all(array('table' => 'banner_top', 'where' => "Publico='1'"));
  }

  public function getClientes() {
    return $this->all(array('table' => 'clientes', 'where' => "Publico='1'", 'order'=>'Posicion'));
  }

  public function getPlanes() {
    return $this->all(array('table' => 'planes', 'where' => "Publico='1'", 'order'=>'Posicion'));
  }

  public function getSecciones() {
    return $this->all(array('table' => 'seccion', 'where' => "Publico='1' AND PadreID='0'"));
  }

  public function getCategorias() {
    return $this->all(array('table' => 'categorias', 'where' => "Publico='1'", 'order' => 'Nombre ASC'));
  }

  public function getCategoriaID($url) {
    return $this->where(array('table' => 'categorias', 'where' => "URL='" . $url . "'", 'limit' => 1));
  }

  public function getUsuarioID($id) {
    return $this->where(array('table' => 'sys_user', 'where' => "ID='" . $id . "'", 'limit' => 1));
  }

  public function getCategoria($id) {
    return $this->where(array('table' => 'categorias', 'where' => "ID='" . $id . "'", 'limit' => 1));
  }

  public function search($key) {
    return $this->all(array('table' => 'posts',
                'where' => "Nombre LIKE '%" . $key . "%' OR Sumario LIKE '%" . $key . "%' OR Descripcion LIKE '%" . $key . "%'",
                'order' => 'Nombre'));
  }

  public function getRedes() {
    return $this->all(array('table' => 'social_net', 'where' => "Publico='1'", 'order' => 'ID ASC'));
  }

  public function getMenuTop() {
    return $this->all(array('table' => 'seccion', 'field' => 'ID, MenuTop, URL', 'where' => "Publico='1' AND IsTop='1'", 'order' => 'Posicion ASC'));
  }

  public function getMenuBot() {
    return $this->all(array('table' => 'seccion', 'field' => 'MenuBot, URL', 'where' => "Publico='1' AND IsBot='1'", 'order' => 'Posicion ASC'));
  }

  public function getMeta($tabla, $id) {
    return $this->where(array('table' => 'meta', 'where' => "Tabla='" . $tabla . "' AND TablaID='" . $id . "'", 'limit' => 1));
  }

  public function getParrafos($tabla, $id) {
    return $this->all(array('table' => 'paragraph', 'where' => "Tabla='" . $tabla . "' AND TablaID='" . $id . "'"));
  }

  public function getGaleria($tabla, $id) {
    return $this->all(array('table' => 'archivo', 'field' => 'Titulo, Imagen', 'where' => "Tabla='" . $tabla . "' AND TablaID='" . $id . "'"));
  }

  public function getTrackingIP($ip) {
    $fecha = date('Y-m-d');
    $temp = $this->where(array('table' => 'sys_tracking', 'where' => "IP='" . $ip . "' AND Fecha='" . $fecha . "'", 'limit' => 1));
    return is_array($temp) ? count($temp) : 0;
  }

  public function visitasPost($id) {
    $tabla = 'posts';
    $temp = $this->all(array('table' => 'sys_tracking', 'where' => "Tabla='" . $tabla . "' AND TablaID='" . $id . "'"));
    return count($temp);
  }

  public function savePost($fields) {
    $id = $this->save('posts', $fields);
    return ($id) ? $id : false;
  }

  public function saveTracking($fields) {
    $id = $this->save('sys_tracking', $fields);
    return ($id) ? $id : false;
  }

  public function saveRating($fields) {
    $id = $this->save('rating', $fields);
    return ($id) ? $id : false;
  }

  public function getVisitas() {
    $ips = $this->all(array('table' => 'sys_tracking', 'field' => 'IP', 'where' => "IP!='' GROUP BY IP"));
    return count($ips);
  }

  public function saveComentario($fields) {
    $id = $this->save('comments', $fields);
    return ($id) ? $id : false;
  }

  public function updateCountComments($table, $fields) {
    $id = $this->save($table, $fields);
    return ($id) ? $id : false;
  }

  public function getComentarios($id) {
    return $this->all(array('table' => 'comments', 'where' => "Publico='1' AND Tabla='posts' AND TablaID='" . $id . "'", 'order' => 'Fecha DESC'));
  }

  public function getArticulo($table, $id) {
    return $this->where(array('table' => $table, 'field' => 'Titulo,URL', 'where' => "ID='" . $id . "'"));
  }

  public function getCountComments($table, $id) {
    return $this->field($table, 'Comments', "ID='" . $id . "'");
  }

  public function getNotas($count = 20) {
    return $this->all(array('table' => 'posts', 'field' => 'Titulo,URL,Imagen,Video,Fecha', 'where' => "Publico='1' AND Portada='1'", 'order' => 'Fecha DESC', 'limit' => $count));
  }

  public function getBan300x250($count = 2) {
    return $this->all(array('table' => 'banner_wrap', 'where' => "Publico='1' AND TipoID='1'", 'order' => 'Posicion', 'limit' => $count));
  }

  public function getBan250x120($count = 6) {
    return $this->all(array('table' => 'banner_wrap', 'where' => "Publico='1' AND TipoID='4'", 'order' => 'Posicion', 'limit' => $count));
  }

  public function searchPosts1($key) {
    echo "Titulo LIKE '%" . $key . "%' OR Sumario LIKE '%" . $key . "%' OR Detalle LIKE '%" . $key . "%'";
    $data = $this->all(array('table' => 'posts',
        'where' => "Titulo LIKE '%" . $key . "%' OR Sumario LIKE '%" . $key . "%' OR Detalle LIKE '%" . $key . "%'",
        'order' => 'Titulo'));
    return $data;
  }

  public function searchPosts($page = 1, $key = '') {
    $temp = array();
    $t1 = DB_PREF . 'posts';
    $t2 = DB_PREF . 'sys_user';
    $t3 = DB_PREF . 'categorias';

    $query = "SELECT t1.*, t2.Nombre as Usuario, t3.Nombre as Categoria, t3.URL as UrlCat"
            . " FROM " . $t1 . " t1 "
            . " INNER JOIN " . $t2 . " t2 ON t1.UsuarioID=t2.ID "
            . " INNER JOIN " . $t3 . " t3 ON t1.CategoriaID=t3.ID "
            . " WHERE t1.Publico='1' AND t1.Titulo LIKE '%" . $key . "%' OR t1.Sumario LIKE '%" . $key . "%' OR t1.Detalle LIKE '%" . $key . "%' "
            . " ORDER BY Fecha DESC ";
    //echo $query;
    $paginator = new Paginator($page, $query);

    try {
      $rows = $paginator->paginate();
      $links = $paginator->getLinks();

      $temp['postsearch'] = $rows;
      $temp['links'] = $links;

      return $temp;
    } catch (Exception $e) {
      echo $e->getMessage();
    }
  }

  public function getPostsViews($count = 5) {
    $t1 = DB_PREF . 'posts';
    $t2 = DB_PREF . 'sys_user';
    $t3 = DB_PREF . 'categorias';
    $query = "SELECT t1.*, t2.Nombre as Usuario, t3.Nombre as Categoria, t3.URL as UrlCat FROM " . $t1 . " t1 "
            . " INNER JOIN " . $t2 . " t2 ON t1.UsuarioID=t2.ID "
            . " INNER JOIN " . $t3 . " t3 ON t1.CategoriaID=t3.ID "
            . " WHERE t1.Publico='1' "
            . " ORDER BY Views DESC LIMIT " . $count;
    $row = $this->_db->query($query);
    return $row->fetchAll(PDO::FETCH_ASSOC);
  }

  public function getPostRecents($count = 16) {
    $t1 = DB_PREF . 'posts';
    $t2 = DB_PREF . 'sys_user';
    $t3 = DB_PREF . 'categorias';
    $query = "SELECT t1.*, t2.Nombre as Usuario, t3.Nombre as Categoria, t3.URL as UrlCat FROM " . $t1 . " t1 "
            . " INNER JOIN " . $t2 . " t2 ON t1.UsuarioID=t2.ID "
            . " INNER JOIN " . $t3 . " t3 ON t1.CategoriaID=t3.ID "
            . " WHERE t1.Publico='1' "
            . " ORDER BY Fecha DESC LIMIT " . $count;
    $row = $this->_db->query($query);
    return $row->fetchAll(PDO::FETCH_ASSOC);
  }

  public function paginationRecents($page = 1) {
    $temp = array();
    $t1 = DB_PREF . 'posts';
    $t2 = DB_PREF . 'sys_user';
    $t3 = DB_PREF . 'categorias';

    $query = "SELECT t1.*, t2.Nombre as Usuario, t3.Nombre as Categoria, t3.URL as UrlCat FROM " . $t1 . " t1 "
            . " INNER JOIN " . $t2 . " t2 ON t1.UsuarioID=t2.ID "
            . " INNER JOIN " . $t3 . " t3 ON t1.CategoriaID=t3.ID "
            . " WHERE t1.Publico='1' "
            . " ORDER BY Fecha DESC ";
    $paginator = new Paginator($page, $query);

    try {
      $rows = $paginator->paginate();
      $links = $paginator->getLinks();

      $temp['posts_home'] = $rows;
      $temp['links'] = $links;

      return $temp;
    } catch (Exception $e) {
      echo $e->getMessage();
    }
  }

  public function paginationUser($page = 1, $iduser = 0) {
    $temp = array();
    $t1 = DB_PREF . 'posts';
    $t2 = DB_PREF . 'sys_user';
    $t3 = DB_PREF . 'categorias';

    $where = ($iduser != 0) ? " AND t1.UsuarioID='" . $iduser . "'" : '';
    $query = "SELECT t1.*, t2.Nombre as Usuario, t3.Nombre as Categoria, t3.URL as UrlCat FROM " . $t1 . " t1 "
            . " INNER JOIN " . $t2 . " t2 ON t1.UsuarioID=t2.ID "
            . " INNER JOIN " . $t3 . " t3 ON t1.CategoriaID=t3.ID "
            . " WHERE t1.Publico='1' " . $where
            . " ORDER BY Fecha DESC ";
    $paginator = new Paginator($page, $query);

    try {
      $rows = $paginator->paginate();
      $links = $paginator->getLinks();

      $temp['posts_user'] = $rows;
      $temp['links'] = $links;

      return $temp;
    } catch (Exception $e) {
      echo $e->getMessage();
    }
  }

  public function paginationCategorias($page = 1, $cat = 0) {
    $temp = array();
    $t1 = DB_PREF . 'posts';
    $t2 = DB_PREF . 'sys_user';
    $t3 = DB_PREF . 'categorias';

    $where = ($cat != 0) ? " AND t1.CategoriaID='" . $cat . "'" : '';
    $query = "SELECT t1.*, t2.Nombre as Usuario, t3.Nombre as Categoria, t3.URL as UrlCat FROM " . $t1 . " t1 "
            . " INNER JOIN " . $t2 . " t2 ON t1.UsuarioID=t2.ID "
            . " INNER JOIN " . $t3 . " t3 ON t1.CategoriaID=t3.ID "
            . " WHERE t1.Publico='1' " . $where
            . " ORDER BY Fecha DESC ";
    $paginator = new Paginator($page, $query);

    try {
      $rows = $paginator->paginate();
      $links = $paginator->getLinks();

      $temp['posts_cat'] = $rows;
      $temp['links'] = $links;

      return $temp;
    } catch (Exception $e) {
      echo $e->getMessage();
    }
  }

  public function getPostComments($count = 5) {
    return $this->all(array('table' => 'posts', 'field' => 'Titulo,URL,Imagen,Video,Fecha', 'where' => "Publico='1' AND Comments > 0", 'order' => 'Comments DESC', 'limit' => $count));
  }

  public function getArchivos($id) {
    return $this->all(array('table' => 'archivo', 'where' => "Tabla='empresas' AND TablaID='" . $id . "'", 'order' => 'Posicion'));
  }

  public function sendMail($data = array()) {
    $mail = new PHPMailer();

    $mail->From = $data['from_email'];
    $mail->FromName = $data['from_name'];
    $mail->Subject = $data['subject'];
    $mail->Body = $data['body'];
    $mail->AltBody = 'Su servidor de correo no soporta HTML';
    $mail->AddAddress($data['to_email']);

    if (isset($data['file_temp']))
      $mail->AddAttachment($data['file_temp'], $data['file_name']);

    if (!$mail->Send()) {
      $error = 'Error: ' . $mail->ErrorInfo;
      return false;
    } else {
      return true;
    }
  }

}

?>
