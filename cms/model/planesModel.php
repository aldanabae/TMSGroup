<?php

class planesModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getPlan($id) {
    return $this->where(array('table' => 'planes', 'where' => "ID='" . $id . "'"));
  }

  public function updatePlan($fields) {
    $id = $this->save('planes', $fields);
    return ($id) ? $id : false;
  }

  public function deletePlanes($ids) {
    return $this->delete('planes', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function updatePlanes($type, $ids) {
    return $this->update('planes', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getSelectPos() {
    return $this->all(array('table' => 'planes',
                'campo' => 'ID,Nombre,Posicion',
                'where' => "(Publico='1')",
                'order' => 'Posicion'
    ));
  }

  public function updatePosiciones($ids) {
    $pos = 1;
    foreach ($ids as $id) {
      if ($id != 0) {
        $this->save('planes', array('ID' => $id, 'Posicion' => $pos));
      }
      $pos++;
    }
  }

}

?>
