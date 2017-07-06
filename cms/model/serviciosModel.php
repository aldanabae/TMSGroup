<?php

class serviciosModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getServicio($id)
  {
  	return $this->where(array('table'=>'servicios','where'=>"ID='".$id."'"));
  }
  
  public function getCategorias() {
    return $this->all(array('table' => 'cateventos', 'where' => "Publico='1'", 'order' => 'Nombre'));
  }

  public function updateServicio($fields)
  {
		$id = $this->save('servicios',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteServicios($ids)
  {
  	return $this->delete('servicios',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateServicios($type,$ids)
  {  
  	return $this->update('servicios',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
