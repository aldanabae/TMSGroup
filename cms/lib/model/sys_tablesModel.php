<?php

class sys_tablesModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getTable($id)
  {
  	return $this->where(array('table'=>'sys_tables','where'=>"ID='".$id."'"));
  }

  public function updateTable($fields)
  {
		$id = $this->save('sys_tables',$fields);
		return ($id) ? $id : false;
	}

}

?>
