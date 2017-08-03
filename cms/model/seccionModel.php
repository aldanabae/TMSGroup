<?php

class seccionModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getSeccion($id) {
    return $this->where(array('table' => 'seccion', 'where' => "ID='" . $id . "'"));
  }

  public function getMeta($id) {
    return $this->where(array('table' => 'meta', 'where' => "(Tabla='seccion' AND TablaID='" . $id . "')"));
  }

  public function getImagenParrafo($id) {
    return $this->field('paragraph', 'Imagen', "ID='" . $id . "'");
  }

  public function getParrafos($id) {
    return $this->all(array('table' => 'paragraph', 'where' => "(Tabla='seccion' AND TablaID='" . $id . "')", 'order' => 'Posicion'));
  }

  public function getGaleria($id) {
    return $this->all(array('table' => 'archivo', 'where' => "Tabla='seccion' AND TablaID='" . $id . "'", 'order' => 'Posicion'));
  }

  public function updateSeccion($fields) {
    $id = $this->save('seccion', $fields);
    return ($id) ? $id : false;
  }

  public function updateMeta($meta, $id_sec) {
    if ($meta['ID'] == 0) {
      unset($meta['ID']);
      $meta['Tabla'] = 'seccion';
      $meta['TablaID'] = $id_sec;
    }
    $this->save('meta', $meta);
  }

  public function updateParrafos($parrafos, $id_sec) {
    $i = 1;
    foreach ($parrafos as $parrafo) {
      if ($parrafo['ID'] == 0) {
        unset($parrafo['ID']);
        $parrafo['Tabla'] = 'seccion';
        $parrafo['TablaID'] = $id_sec;
        $parrafo['Posicion'] = $i;
      }
      $this->save('paragraph', $parrafo);
      $i++;
    }
  }

  public function updateGaleria($galeria, $id_tab) {
    $i = 1;
    foreach ($galeria as $gale) {
      if ($gale['ID'] == 0) {
        unset($gale['ID']);
        $gale['Tabla'] = 'seccion';
        $gale['TablaID'] = $id_tab;
        $gale['Posicion'] = $i;
      }
      $this->save('archivo', $gale);
      $i++;
    }
  }

  public function deleteSecciones($ids) {
    return $this->delete('seccion', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function deleteParrafo($id) {
    return $this->delete('paragraph', "ID='" . $id . "'");
  }

  public function updateSecciones($type, $ids) {
    return $this->update('seccion', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getNivelSeccion($type, $parent) {
    return $this->all(array('table' => 'seccion', 'where' => "(Publico='" . $type . "') AND (PadreID='" . $parent . "')"));
  }

  public function getSelectPos($seccion = null) {
    $where = (is_array($seccion)) ? "AND (ID!='" . $seccion['ID'] . "') AND (PadreID='" . $seccion['PadreID'] . "')" : "AND (PadreID='0')";

    $select = $this->all(array('table' => 'seccion',
        'campo' => 'ID,Titulo,Posicion,PadreID',
        'where' => "(Publico='1') " . $where,
        'order' => 'Posicion'
    ));

    if (is_array($seccion))
      $select[] = array('ID' => $seccion['ID'], 'Titulo' => $seccion['Titulo'],
          'Posicion' => $seccion['Posicion'], 'PadreID' => $seccion['PadreID']);

    return $select;
  }

  public function getSelectSec() {
    return $this->all(array('table' => 'seccion', 'where' => "(Publico='1') AND (PadreID='0')", 'order' => 'Posicion'));
  }
  
  public function getTables() {
    return $this->all(array('table' => 'sys_tables', 'order' => 'Nombre'));
  }

  public function selectPlantillas() {
    return $this->all(array('table' => 'plantillas', 'where' => "(Publico='1')"));
  }

  public function reorderParentPrev($id, $parent_ant) {
    $select_id = $this->all(array('table' => 'seccion', 'field' => 'ID',
        'where' => "(Publico='1') AND (ID!='" . $id . "') AND (PadreID='" . $parent_ant . "')", 'order' => 'Posicion'));

    $pos = 1;
    foreach ($select_id as $select) {
      $this->save('seccion', array('ID' => $select['ID'], 'Posicion' => $pos));
      $pos++;
    }
  }

  public function getSelectPosAct($parent_id) {
    return $this->all(array('table' => 'seccion', 'field' => 'ID,Titulo,Posicion,PadreID',
                'where' => "(Publico='1') AND (PadreID='" . $parent_id . "')", 'order' => 'Posicion'));
  }

  public function updateParentPos($id, $parent_id, $count) {
    $this->save('seccion', array('ID' => $id, 'PadreID' => $parent_id, 'Posicion' => $count));
    return $this->where(array('table' => 'seccion', 'field' => 'ID,Titulo,PadreID,Posicion', 'where' => "ID='" . $id . "'"));
  }

  public function updatePosiciones($ids) {
    $pos = 1;
    foreach ($ids as $id) {
      if ($id != 0) {
        $this->save('seccion', array('ID' => $id, 'Posicion' => $pos));
      }
      $pos++;
    }
  }

}

?>
