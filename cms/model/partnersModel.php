<?php

class partnersModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getPartner($id) {
    return $this->where(array('table' => 'partners', 'where' => "ID='" . $id . "'"));
  }

  public function updatePartner($fields) {
    $id = $this->save('partners', $fields);
    return ($id) ? $id : false;
  }

  public function deletePartners($ids) {
    return $this->delete('partners', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function updatePartners($type, $ids) {
    return $this->update('partners', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getSelectPos() {
    return $this->all(array('table' => 'partners',
                'campo' => 'ID,Nombre,Posicion',
                'where' => "(Publico='1')",
                'order' => 'Posicion'
    ));
  }

  public function updatePosiciones($ids) {
    $pos = 1;
    foreach ($ids as $id) {
      if ($id != 0) {
        $this->save('partners', array('ID' => $id, 'Posicion' => $pos));
      }
      $pos++;
    }
  }

}

?>
