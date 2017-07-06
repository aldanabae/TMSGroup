<?php

class planesModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getPlan($id)
  {
  	return $this->where(array('table'=>'planes','where'=>"ID='".$id."'"));
  }

  public function updatePlan($fields)
  {
		$id = $this->save('planes',$fields);
		return ($id) ? $id : false;
	}
  
  public function deletePlanes($ids)
  {
  	return $this->delete('planes',"ID IN (".implode(',',$ids).")");
  }
  
  public function updatePlanes($type,$ids)
  {  
  	return $this->update('planes',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
