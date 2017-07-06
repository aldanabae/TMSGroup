<?php

class indexModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getTotalVisitas() {
    $temp = $this->all(array('table' => 'sys_tracking', 'field' => 'ID'));
    return count($temp);
  }

  public function getVisitasSemana() {
    /*
     * CONSULTA SEMANA
     * ---------------
     * SELECT Fecha, COUNT(IP) as Cantidad 
     * FROM aws_sys_tracking 
     * WHERE Fecha BETWEEN SUBDATE(NOW(),WEEKDAY(NOW())) AND ADDDATE(NOW(),6-WEEKDAY(NOW())) 
     * GROUP BY Fecha
    */    
    return $this->all(array('table' => 'sys_tracking', 'field' => 'DAY(Fecha) as Dia, '
        . 'MONTH(Fecha) as Mes, YEAR(Fecha) as Anio, COUNT(IP) as Cantidad',
        'where' => 'Fecha BETWEEN SUBDATE(NOW(),WEEKDAY(NOW())) AND ADDDATE(NOW(),6-WEEKDAY(NOW()))',
        'group' => 'Fecha'));
  }
  
  public function getVisitasMes() {
    /*
     * CONSULTA MES
     * ---------------
     * SELECT Fecha, COUNT(IP) as Cantidad 
     * FROM aws_sys_tracking 
     * WHERE Fecha BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND LAST_DAY(CURDATE())
     * GROUP BY Fecha
    */    
    return $this->all(array('table' => 'sys_tracking', 'field' => 'DAY(Fecha) as Dia, '
        . 'MONTH(Fecha) as Mes, YEAR(Fecha) as Anio, COUNT(IP) as Cantidad',
        'where' => "Fecha BETWEEN DATE_FORMAT(CURDATE(), '%Y-%m-01') AND LAST_DAY(CURDATE())",
        'group' => 'Fecha'));
  }
  
  public function getVisitasAnio() {
    /*
     * CONSULTA MES
     * ---------------
     * SELECT Fecha, COUNT(IP) as Cantidad 
     * FROM aws_sys_tracking 
     * WHERE Fecha BETWEEN DATE_FORMAT(CURDATE(), '%Y-01-01') AND DATE_FORMAT(CURDATE(), '%Y-12-31')
     * GROUP BY MONTH(Fecha)
    */    
    return $this->all(array('table' => 'sys_tracking', 'field' => '1 as Dia, '
        . 'MONTH(Fecha) as Mes, YEAR(Fecha) as Anio, COUNT(IP) as Cantidad',
        'where' => "Fecha BETWEEN DATE_FORMAT(CURDATE(), '%Y-01-01') AND DATE_FORMAT(CURDATE(), '%Y-12-31')",
        'group' => 'MONTH(Fecha)'));
  }

  public function getTotalUsuarios() {
    $temp = $this->all(array('table' => 'usuarios', 'field' => 'ID'));
    return count($temp);
  }

  public function getTotalEmpresas() {
    $temp = $this->all(array('table' => 'empresas', 'field' => 'ID'));
    return count($temp);
  }

  public function recordSort($records, $field, $reverse = false) {
    $hash = array();
    foreach ($records as $record) {
      $hash[$record[$field]] = $record;
    }

    ($reverse) ? krsort($hash) : ksort($hash);
    $records = array();

    foreach ($hash as $record) {
      $records [] = $record;
    }

    return $records;
  }

}

?>
