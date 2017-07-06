<?php

class newsletterModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getNewsletter($id)
  {
  	return $this->where(array('table'=>'newsletter','where'=>"ID='".$id."'"));
  }

  public function updateNewsletter($fields)
  {
		$id = $this->save('newsletter',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteNewsletters($ids)
  {
  	return $this->delete('newsletter',"ID IN (".implode(',',$ids).")");
  }
  
  public function updateNewsletters($type,$ids)
  {  
  	return $this->update('newsletter',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }
  
  public function getSelectCategory()
  {
		return $this->all(array('table'=>'news_group','where'=>"(Publico='1')",'order'=>'Nombre'));
	}

  public function getSelectEmails($categoria = null)
  {
  	$where = ($categoria) ? " AND GroupID='".$categoria."'" : '';
		return $this->all(array('table'=>'news_email','where'=>"(Publico='1')".$where,'order'=>'Nombre'));
	}

}

?>
