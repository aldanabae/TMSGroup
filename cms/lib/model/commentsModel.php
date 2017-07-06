<?php

class commentsModel extends Model {

  public function __construct() {
    parent::__construct();
  }

  public function getComment($id) {
    return $this->where(array('table' => 'comments', 'where' => "ID='" . $id . "'"));
  }
  
  public function getPost($id) {
    return $this->where(array('table' => 'posts', 'where' => "ID='" . $id . "'"));
  }

  public function updateComment($fields) {
    $id = $this->save('comments', $fields);
    return ($id) ? $id : false;
  }

  public function deleteComments($ids) {
    return $this->delete('comments', "ID IN (" . implode(',', $ids) . ")");
  }

  public function deleteItemGaleria($id) {
    return $this->delete('archivo', "ID='" . $id . "'");
  }

  public function updateComments($type, $ids) {
    return $this->update('comments', array('Publico' => $type), "ID IN (" . implode(',', $ids) . ")");
  }

}

?>
