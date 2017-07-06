<?php

class eventosModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getEvento($id) {
    return $this->where(array('table' => 'eventos', 'where' => "ID='" . $id . "'"));
  }

  public function getMeta($id) {
    return $this->where(array('table' => 'meta', 'where' => "(Tabla='eventos' AND TablaID='" . $id . "')"));
  }

  public function getImagenParrafo($id) {
    return $this->field('paragraph', 'Imagen', "ID='" . $id . "'");
  }

  public function getParrafos($id) {
    return $this->all(array('table' => 'paragraph', 'where' => "(Tabla='eventos' AND TablaID='" . $id . "')", 'order' => 'Posicion'));
  }

  public function getGaleria($id) {
    return $this->all(array('table' => 'archivo', 'where' => "(Tabla='eventos' AND TablaID='" . $id . "')", 'order' => 'Posicion'));
  }

  public function updateEvento($fields) {
    $id = $this->save('eventos', $fields);
    return ($id) ? $id : false;
  }

  public function updateMeta($meta, $id_sec) {
    if ($meta['ID'] == 0) {
      unset($meta['ID']);
      $meta['Tabla'] = 'eventos';
      $meta['TablaID'] = $id_sec;
    }
    $this->save('meta', $meta);
  }

  public function updateParrafos($parrafos, $id_sec) {
    $i = 1;
    foreach ($parrafos as $parrafo) {
      if ($parrafo['ID'] == 0) {
        unset($parrafo['ID']);
        $parrafo['Tabla'] = 'eventos';
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
        $gale['Tabla'] = 'eventos';
        $gale['TablaID'] = $id_sec;
        $gale['Posicion'] = $i;
      }
      $this->save('archivo', $gale);
      $i++;
    }
  }

  public function deleteEventos($ids) {
    return $this->delete('eventos', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function deleteParrafo($id) {
    return $this->delete('paragraph', "ID='" . $id . "'");
  }

  public function updateEventos($type, $ids) {
    return $this->update('eventos', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getSelectCategory() {
    return $this->all(array('table' => 'cateventos', 'where' => "(Publico='1')", 'order' => 'Nombre'));
  }

  public function getSelectDpto() {
    return $this->all(array('table' => 'departamentos', 'order' => 'Nombre'));
  }

  public function getSelectUsers() {
    return $this->all(array('table' => 'usuarios', 'where' => "Publico='1'", 'order' => 'Nombre'));
  }

  public function getCategory($id) {
    $row = $this->where(array('table' => 'cateventos', 'field'=>'Nombre', 'where' => "ID='" . $id . "'"));    
    return ($row) ? $row['Nombre'] : '';
  }

  public function getDepartamento($id) {
    $row =  $this->where(array('table' => 'departamentos', 'where' => "ID='" . $id . "'"));
    return ($row) ? $row['Nombre'] : '';
  }

  public function getUsuario($id) {
    $row =  $this->where(array('table' => 'usuarios', 'where' => "ID='" . $id . "'"));
    return ($row) ? $row['Nombre'] : '';
  }

}

?>
