<?php

class postsModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getPost($id) {
    return $this->where(array('table' => 'posts', 'where' => "ID='" . $id . "'"));
  }

  public function getMeta($id) {
    return $this->where(array('table' => 'meta', 'where' => "(Tabla='posts' AND TablaID='" . $id . "')"));
  }

  public function getImagenParrafo($id) {
    return $this->field('paragraph', 'Imagen', "ID='" . $id . "'");
  }

  public function getParrafos($id) {
    return $this->all(array('table' => 'paragraph', 'where' => "(Tabla='posts' AND TablaID='" . $id . "')", 'order' => 'Posicion'));
  }

  public function getGaleria($id) {
    return $this->all(array('table' => 'archivo', 'where' => "(Tabla='posts' AND TablaID='" . $id . "')", 'order' => 'Posicion'));
  }

  public function updatePost($fields) {
    $id = $this->save('posts', $fields);
    return ($id) ? $id : false;
  }

  public function updateMeta($meta, $id_sec) {
    if ($meta['ID'] == 0) {
      unset($meta['ID']);
      $meta['Tabla'] = 'posts';
      $meta['TablaID'] = $id_sec;
    }
    $this->save('meta', $meta);
  }

  public function updateParrafos($parrafos, $id_sec) {
    $i = 1;
    foreach ($parrafos as $parrafo) {
      if ($parrafo['ID'] == 0) {
        unset($parrafo['ID']);
        $parrafo['Tabla'] = 'posts';
        $parrafo['TablaID'] = $id_sec;
        $parrafo['Posicion'] = $i;
      }
      $this->save('paragraph', $parrafo);
      $i++;
    }
  }

  public function updateGaleria($galeria, $id_sec) {
    $i = 1;
    foreach ($galeria as $gale) {
      if ($gale['ID'] == 0) {
        unset($gale['ID']);
        $gale['Tabla'] = 'posts';
        $gale['TablaID'] = $id_sec;
        $gale['Posicion'] = $i;
      }
      $this->save('archivo', $gale);
      $i++;
    }
  }

  public function deletePosts($ids) {
    return $this->delete('posts', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function deleteParrafo($id) {
    return $this->delete('paragraph', "ID='" . $id . "'");
  }

  public function updatePosts($type, $ids) {
    return $this->update('posts', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getSelectCategory() {
    return $this->all(array('table' => 'categorias', 'where' => "(Publico='1')", 'order' => 'Nombre'));
  }

}

?>
