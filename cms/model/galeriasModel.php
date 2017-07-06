<?php

class galeriasModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getGaleria($id)
  {
  	return $this->where(array('table'=>'galerias','where'=>"ID='".$id."'"));
  }

  
  public function getArchivos($id)
  {
	  return $this->all(array('table'=>'archivo','where'=>"Tabla='galerias' AND TablaID='".$id."'",'order'=>'Posicion'));
  }

  public function updateGaleria($fields)
  {
		$id = $this->save('galerias',$fields);
		return ($id) ? $id : false;
	}
	
	public function updateArchivos($galeria,$id_tab)
  {
		$i=1;
    foreach($galeria as $gale) {
    	if($gale['ID'] == 0) {
	  		unset($gale['ID']);
	  		$gale['Tabla'] = 'galerias'; 
	  		$gale['TablaID'] = $id_tab;	  
	  		$gale['Posicion'] = $i;     			
	  	}
   		$this->save('archivo',$gale);
	  	$i++;
	  }
	}
  
  public function deleteGalerias($ids)
  {
  	return $this->delete('galerias',"ID IN (".implode(',',$ids).")");
  }
  
  public function deleteItemGaleria($id)
  {
  	return $this->delete('archivo',"ID='".$id."'");
  }
  
  public function updateGalerias($type,$ids)
  {  
  	return $this->update('galerias',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }

}

?>
