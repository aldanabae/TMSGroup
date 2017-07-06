<?php

class cateventosModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getCategoria($id)
  {
  	return $this->where(array('table'=>'cateventos','where'=>"ID='".$id."'"));
  }

  public function updateCategoria($fields)
  {
		$id = $this->save('cateventos',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteCategorias($ids)
  {
  	return $this->delete('cateventos',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateCategorias($type,$ids)
  {  
  	return $this->update('cateventos',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
