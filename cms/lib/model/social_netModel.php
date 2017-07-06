<?php

class social_netModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getRed($id)
  {
  	return $this->where(array('table'=>'social_net','where'=>"ID='".$id."'"));
  }

  public function updateRed($fields)
  {
		$id = $this->save('social_net',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteRedes($ids)
  {
  	return $this->delete('social_net',"ID IN (".implode(',',$ids).")");
  }
  
  public function deleteItemGaleria($id)
  {
  	return $this->delete('archivo',"ID='".$id."'");
  }
  
  public function updateRedes($type,$ids)
  {  
  	return $this->update('social_net',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
