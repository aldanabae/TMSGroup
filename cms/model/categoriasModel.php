<?php

class categoriasModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getCategoria($id)
  {
  	return $this->where(array('table'=>'categorias','where'=>"ID='".$id."'"));
  }

  public function updateCategoria($fields)
  {
		$id = $this->save('categorias',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteCategorias($ids)
  {
  	return $this->delete('categorias',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateCategorias($type,$ids)
  {  
  	return $this->update('categorias',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
