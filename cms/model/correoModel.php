<?php

class correoModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getCorreo($id)
  {
  	return $this->where(array('table'=>'correo','where'=>"ID='".$id."'"));
  }
  
  public function searchCorreos($search)
  {
    $values = array();
  	$data = $this->all(array('table'=>'users',
        //'field'=>"CONCAT(Nombre, ' ', Apellidos, ' (', Email, ')') as Persona",
        'field'=>'Email',
        'where'=>"Nombre LIKE '%".$search."%' OR Apellidos LIKE '%".$search."%' OR Email LIKE '%".$search."%'"));
    
    foreach ($data as $item) {
      //$values[] = $item['Persona'];
      $values[] = $item['Email'];
    }
    return $values;
  }

  public function updateCorreo($fields)
  {
		$id = $this->save('correo',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteCorreos($ids)
  {
  	return $this->delete('correo',"ID IN (".implode(',',$ids).")");
  }
  
  public function deleteItemGaleria($id)
  {
  	return $this->delete('archivo',"ID='".$id."'");
  }
  
  public function updateCorreos($type,$ids)
  {  
  	return $this->update('correo',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }
  
  public function countCorreos()
  {
  	return $this->rowCount('correo');
	}

}

?>
