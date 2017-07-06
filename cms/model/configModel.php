<?php

class configModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getConfig($id)
  {
  	return $this->where(array('table'=>'config','where'=>"ID='".$id."'"));
  }

  public function updateConfig($fields)
  {
		$id = $this->save('config',$fields);
		return ($id) ? $id : false;
	}
	
	public function countConfig()
  {
		return $this->rowCount('config');
	}
	
	public function getSelectPais()
  {
		return $this->all(array('table'=>'country','where'=>"(Publico='1')",'order'=>'Nombre'));
	}

}

?>
