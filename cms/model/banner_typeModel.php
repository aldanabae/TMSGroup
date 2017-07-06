<?php

class banner_typeModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getCategoria($id)
  {
  	return $this->where(array('table'=>'banner_type','where'=>"ID='".$id."'"));
  }

  public function updateCategoria($fields)
  {
		$id = $this->save('banner_type',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteCategorias($ids)
  {
  	return $this->delete('banner_type',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateCategorias($type,$ids)
  {  
  	return $this->update('banner_type',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
