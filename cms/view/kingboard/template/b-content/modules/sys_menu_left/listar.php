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
          <?php if ($data['type'] == 1) : ?>
            <a class="btn btn-primary" href="<?php echo URL_CMS . $data['base_url'] . 'insertar'; ?>">
              <i class="icon icon-plus icon-white"></i> Nueva Secci&oacute;n                                            
            </a>
            <a class="btn btn-info" onclick="validate('form-list', 'accion', 'archivar');">
              <i class="icon icon-pin icon-white"></i> Archivar                                            
            </a>				
          <?php endif; ?>
          <?php if ($data['type'] == 2 || $data['type'] == 3) : ?>
            <a class="btn btn-primary" onclick="validate('form-list', 'accion', 'publicar');">
              <i class="icon icon-pin icon-white"></i> Publicar                                            
            </a>
          <?php endif; ?>
          <a class="btn btn-danger" onclick="validate('form-list', 'accion', 'delete');">
            <i class="icon icon-trash icon-white"></i> Eliminar
          </a>
        </div>
        <div class="clear"></div>
        <form id="form-list" method="post" action="">
          <input type="hidden" name="listar" value="1" />
          <input type="hidden" id="accion" name="accion" />
          <?php include('listar/index.php'); ?>
        </form>
      </div>
  </div><!--/widget-->			
</div><!--/col-md-12-->			
</div><!--/row-->
