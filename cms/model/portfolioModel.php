<?php

class portfolioModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getProyecto($id) {
    return $this->where(array('table' => 'portfolio', 'where' => "ID='" . $id . "'"));
  }

  public function updateProyecto($fields) {
    $id = $this->save('portfolio', $fields);
    return ($id) ? $id : false;
  }

  public function deleteProyectos($ids) {
    return $this->delete('portfolio', "ID IN (" . implode(',', $ids) . ")");
  }

  public function updateProyectos($type, $ids) {
    return $this->update('portfolio', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

  public function getSelectPos() {
    return $this->all(array('table' => 'portfolio',
                'campo' => 'ID,Titulo,Posicion',
                'where' => "(Publico='1')",
                'order' => 'Posicion'
    ));
  }

  public function updatePosiciones($ids) {
    $pos = 1;
    foreach ($ids as $id) {
      if ($id != 0) {
        $this->save('portfolio', array('ID' => $id, 'Posicion' => $pos));
      }
      $pos++;
    }
  }
  
  public function getGaleria($id) {
    return $this->all(array('table' => 'archivo', 'where' => "Tabla='portfolio' AND TablaID='" . $id . "'", 'order' => 'Posicion'));
  }
  
  public function updateGaleria($galeria, $id_tab) {
    $i = 1;
    foreach ($galeria as $gale) {
      if ($gale['ID'] == 0) {
        unset($gale['ID']);
        $gale['Tabla'] = 'portfolio';
        $gale['TablaID'] = $id_tab;
        $gale['Posicion'] = $i;
      }
      $this->save('archivo', $gale);
      $i++;
    }
  }
  
  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

}

