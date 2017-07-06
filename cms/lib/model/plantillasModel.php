<?php

class plantillasModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getPlantilla($id)
  {
  	return $this->where(array('table'=>'plantillas','where'=>"ID='".$id."'"));
  }

  public function updatePlantilla($fields)
  {
		$id = $this->save('plantillas',$fields);
		return ($id) ? $id : false;
	}
  
  public function deletePlantillas($ids)
  {
  	return $this->delete('plantillas',"ID IN (".implode(',',$ids).")");
  }
  
  public function updatePlantillas($type,$ids)
  {  
  	return $this->update('plantillas',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
