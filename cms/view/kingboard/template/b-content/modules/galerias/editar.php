<div class="main-header">
  <h2><?php echo $main_title; ?></h2>
  <em><?php echo $data['title']; ?></em>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="widget">
      <div class="widget-header">
        <h3><i class="fa fa-edit"></i> <?php echo $data['title']; ?></h3>    
      </div>
      <div class="widget-content">        
        <div class="top-actions">
          <a onclick="validate(1);" class="btn btn-primary">Guardar y Publicar</a>
          <a onclick="validate(2);" class="btn btn-info">Guardar Borrador</a>
          <a href="<?php echo URL_CMS . $data['base_url'] . 'listar/'.$data['type']; ?>" class="btn btn-warning">Cancelar</a>
        </div>
        <div class="clear"></div>
        <?php include('editar/index.php'); ?>
      </div>
    </div><!--/widget-->
  </div><!--/col-md-12-->
</div><!--/row-->