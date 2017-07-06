<?php

class usuariosModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getUser($id)
  {
  	return $this->where(array('table'=>'usuarios','where'=>"ID='".$id."'"));
  }
  
  public function getPaises()
  {
  	return $this->all(array('table'=>'country','where'=>"Publico='1'"));
  }
  
  public function getAccesos()
  {
  	return $this->all(array('table'=>'group_users'));
  }

  public function updateUser($fields)
  {
		$id = $this->save('usuarios',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteUsers($ids)
  {
  	return $this->delete('usuarios',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateUsers($type,$ids)
  {  
  	return $this->update('usuarios',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }
  
  public function getSelectDpto() {
    return $this->all(array('table' => 'departamentos', 'order' => 'Nombre'));
  }

}

?>
