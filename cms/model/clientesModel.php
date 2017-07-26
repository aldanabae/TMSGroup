<?php

class clientesModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getCliente($id) {
    return $this->where(array('table' => 'clientes', 'where' => "ID='" . $id . "'"));
  }

  public function updateCliente($fields) {
    $id = $this->save('clientes', $fields);
    return ($id) ? $id : false;
  }

  public function deleteClientes($ids) {
    return $this->delete('clientes', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function updateClientes($type, $ids) {
    return $this->update('clientes', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getSelectPos() {
    return $this->all(array('table' => 'clientes',
                'campo' => 'ID,Nombre,Posicion',
                'where' => "(Publico='1')",
                'order' => 'Posicion'
    ));
  }

  public function updatePosiciones($ids) {
    $pos = 1;
    foreach ($ids as $id) {
      if ($id != 0) {
        $this->save('clientes', array('ID' => $id, 'Posicion' => $pos));
      }
      $pos++;
    }
  }

}

?>
