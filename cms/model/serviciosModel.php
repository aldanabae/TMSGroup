<?php

class serviciosModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getServicio($id) {
    return $this->where(array('table' => 'servicios', 'where' => "ID='" . $id . "'"));
  }

  public function updateServicio($fields) {
    $id = $this->save('servicios', $fields);
    return ($id) ? $id : false;
  }

  public function deleteServicios($ids) {
    return $this->delete('servicios', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function updateServicios($type, $ids) {
    return $this->update('servicios', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getSelectPos() {
    return $this->all(array('table' => 'servicios',
                'campo' => 'ID, Titulo, Posicion',
                'where' => "Publico='1'",
                'order' => 'Posicion'
    ));
  }

  public function updatePosiciones($ids) {
    $pos = 1;
    foreach ($ids as $id) {
      if ($id != 0) {
        $this->save('servicios', array('ID' => $id, 'Posicion' => $pos));
      }
      $pos++;
    }
  }

}

?>
