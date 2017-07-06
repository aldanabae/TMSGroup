<?php

class homeController extends Controller {

  public function __construct() {
    parent::__construct();
    // Cargamos Todos los Elementos del Panel de Control
    $this->initialize();
    $this->_index = Load::model('index');
  }

  public function index() {
    $this->getBreadcrumb('Escritorio');
    $data['title'] = 'Bienvenido al Administrador Web';
    $data['tabla'] = $this->_route['controller'];
    $data['visitas'] = $this->_index->getTotalVisitas();
    $data['visit_wek'] = $this->formatStats($this->_index->getVisitasSemana());
    $data['visit_month'] = $this->formatStats($this->_index->getVisitasMes());
    $data['visit_year'] = $this->formatStats($this->_index->getVisitasAnio());
    $data['usuarios'] = $this->_index->getTotalUsuarios();
    $data['empresas'] = $this->_index->getTotalEmpresas();

    $this->_view->assign('data', $data);
    $this->_view->render();
  }

  public function formatStats($data = array()) {
    $temp = '';

    if (is_array($data) && count($data) > 0) {
      foreach ($data as $item) {
        $temp.= '[gt(' . $item['Anio'] . ', ' . $item['Mes'] . ', ' . $item['Dia'] . '), ' . $item['Cantidad'] . '],';
      }
    }
    return $temp;
  }

}

?>