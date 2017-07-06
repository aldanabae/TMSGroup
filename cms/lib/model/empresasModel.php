<?php

class empresasModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getEmpresa($id) {
    return $this->where(array('table' => 'empresas', 'where' => "ID='" . $id . "'"));
  }

  public function getMeta($id) {
    return $this->where(array('table' => 'meta', 'where' => "(Tabla='empresas' AND TablaID='" . $id . "')"));
  }

  public function getImagenParrafo($id) {
    return $this->field('paragraph', 'Imagen', "ID='" . $id . "'");
  }

  public function getParrafos($id) {
    return $this->all(array('table' => 'paragraph', 'where' => "(Tabla='empresas' AND TablaID='" . $id . "')", 'order' => 'Posicion'));
  }

  public function getGaleria($id) {
    return $this->all(array('table' => 'archivo', 'where' => "(Tabla='empresas' AND TablaID='" . $id . "')", 'order' => 'Posicion'));
  }

  public function updateEmpresa($fields) {
    $id = $this->save('empresas', $fields);
    return ($id) ? $id : false;
  }

  public function updateMeta($meta, $id_sec) {
    if ($meta['ID'] == 0) {
      unset($meta['ID']);
      $meta['Tabla'] = 'empresas';
      $meta['TablaID'] = $id_sec;
    }
    $this->save('meta', $meta);
  }

  public function updateParrafos($parrafos, $id_sec) {
    $i = 1;
    foreach ($parrafos as $parrafo) {
      if ($parrafo['ID'] == 0) {
        unset($parrafo['ID']);
        $parrafo['Tabla'] = 'empresas';
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
        $gale['Tabla'] = 'empresas';
        $gale['TablaID'] = $id_sec;
        $gale['Posicion'] = $i;
      }
      $this->save('archivo', $gale);
      $i++;
    }
  }

  public function deleteEmpresas($ids) {
    return $this->delete('empresas', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function deleteParrafo($id) {
    return $this->delete('paragraph', "ID='" . $id . "'");
  }

  public function updateEmpresas($type, $ids) {
    return $this->update('empresas', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getSelectCategory() {
    return $this->all(array('table' => 'cateventos', 'where' => "(Publico='1')", 'order' => 'Nombre'));
  }

  public function getSelectDpto() {
    return $this->all(array('table' => 'departamentos', 'order' => 'Nombre'));
  }

  public function getSelectPlan() {
    return $this->all(array('table' => 'planes', 'where' => "(Publico='1')", 'order' => 'ID'));
  }

  public function getCategory($id) {
    $row = $this->where(array('table' => 'cateventos', 'field'=>'Nombre', 'where' => "ID='" . $id . "'"));    
    return ($row) ? $row['Nombre'] : '';
  }

  public function getDepartamento($id) {
    $row =  $this->where(array('table' => 'departamentos', 'where' => "ID='" . $id . "'"));
    return ($row) ? $row['Nombre'] : '';
  }

  public function getPlan($id) {
    $row =  $this->where(array('table' => 'planes', 'where' => "ID='" . $id . "'"));
    return ($row) ? $row['Nombre'] : '';
  }

}

?>
