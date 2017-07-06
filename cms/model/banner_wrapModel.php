<?php

class banner_wrapModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getBanner($id)
  {
  	return $this->where(array('table'=>'banner_wrap','where'=>"ID='".$id."'"));
  }
  
  public function getCategoria($id)
  {
  	return $this->where(array('table'=>'banner_type','where'=>"ID='".$id."'"));
  }

  public function updateBanner($fields)
  {
		$id = $this->save('banner_wrap',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteBanners($ids)
  {
  	return $this->delete('banner_wrap',"ID IN (".implode(',',$ids).")");
  }
  
  public function deleteItemGaleria($id)
  {
  	return $this->delete('archivo',"ID='".$id."'");
  }
  
  public function updateBanners($type,$ids)
  {  
  	return $this->update('banner_wrap',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }
  
  public function countBanners()
  {
  	return $this->rowCount('banner_wrap');
	}
	
	public function getSelectCategory()
  {
		return $this->all(array('table'=>'banner_type','where'=>"(Publico='1')"));
	}
  
  public function getSelectPos($banner = null)
  { 
  	$where =  (is_array($banner)) ? "AND (ID!='".$banner['ID']."')" : "";
  	
  	$select = $this->all(array('table'=>'banner_wrap',
																		'campo'=>'ID,Titulo,Posicion',
																		'where'=>"(Publico='1') ".$where,
																		'order'=>'Posicion'
																	));

		if(is_array($banner)) $select[] = array('ID'=> $banner['ID'],'Titulo'=> $banner['Titulo'],
			'Posicion'=> $banner['Posicion']);		
		
		return $select;																
	}
  
  public function updatePosiciones($ids)
	{
		$pos = 1;
		foreach($ids as $id) {
			if($id != 0) {
				$this->save('banner_wrap',array('ID'=>$id,'Posicion'=>$pos));
			}
			$pos++;
		}		
	}

}

?>
