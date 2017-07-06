<?php

class news_emailModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getEmail($id)
  {
  	return $this->where(array('table'=>'news_email','where'=>"ID='".$id."'"));
  }
  
  public function getCategoria($id)
  {
  	return $this->where(array('table'=>'news_group','where'=>"ID='".$id."'"));
  }

  public function updateEmail($fields)
  {
		$id = $this->save('news_email',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteEmails($ids)
  {
  	return $this->delete('news_email',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateEmails($type,$ids)
  {  
  	return $this->update('news_email',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }
  
  public function getSelectCategory()
  {
		return $this->all(array('table'=>'news_group','where'=>"(Publico='1')",'order'=>'Nombre'));
	}

}

?>
