<?php

class banner_topModel extends Model
{
  public function __construct()
  {
    parent::__construct();
  }
  
  public function getBanner($id)
  {
  	return $this->where(array('table'=>'banner_top','where'=>"ID='".$id."'"));
  }

  public function updateBanner($fields)
  {
		$id = $this->save('banner_top',$fields);
		return ($id) ? $id : false;
	}
  
  public function deleteBanners($ids)
  {
  	return $this->delete('banner_top',"ID IN (".implode(',',$ids).")");
  }
  
  public function deleteItemGaleria($id)
  {
  	return $this->delete('archivo',"ID='".$id."'");
  }
  
  public function updateBanners($type,$ids)
  {  
  	return $this->update('banner_top',array('Publico'=>$type),"ID IN (".implode(',',$ids).")");
  }
  
  public function countBanners()
  {
  	return $this->rowCount('banner_top');
	}
  
  public function getSelectPos($banner = null)
  {   	
  	return $this->all(array('table'=>'banner_top',
																		'campo'=>'ID,Titulo,Posicion',
																		'where'=>"(Publico='1')",
																		'order'=>'Posicion'
																	));															
	}
  
  public function updatePosiciones($ids)
	{
		$pos = 1;
		foreach($ids as $id) {
			if($id != 0) {
				$this->save('banner_top',array('ID'=>$id,'Posicion'=>$pos));
			}
			$pos++;
		}		
	}

}

?>
