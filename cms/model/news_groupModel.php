<?php

class news_groupModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getCategoria($id)
  {
  	return $this->where(array('table'=>'news_group','where'=>"ID='".$id."'"));
  }

  public function updateCategoria($fields)
  {
		$id = $this->save('news_group',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteCategorias($ids)
  {
  	return $this->delete('news_group',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateCategorias($type,$ids)
  {  
  	return $this->update('news_group',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
