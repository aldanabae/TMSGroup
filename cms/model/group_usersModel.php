<?php

class categoriaModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getCategoria($id)
  {
  	return $this->where(array('table'=>'group_users','where'=>"ID='".$id."'"));
  }

  public function updateCategoria($fields)
  {
		$id = $this->save('group_users',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteCategorias($ids)
  {
  	return $this->delete('group_users',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateCategorias($type,$ids)
  {  
  	return $this->update('group_users',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
