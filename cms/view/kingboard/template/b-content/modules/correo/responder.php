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
          <a href="<?php echo URL_CMS . $data['base_url'] . 'enviar'; ?>" class="btn btn-primary">Enviar Correo</a>
          <a onclick="validate(2);" class="btn btn-info">Guardar Borrador</a>
          <a href="<?php echo URL_CMS . $data['base_url'] . 'listar/1'; ?>" class="btn btn-warning">Volver</a>
        </div>
        <div class="clear"></div>
        <!-- BEGIN TABS NAVS -->
        <form id="form" method="post">
          <input type="hidden" name="actualizar" value="1" />
          <div class="col-md-12 box-email">
            <?php include('responder/index.php'); ?>
          </div>
          <div class="top-actions">
            <a href="<?php echo URL_CMS . $data['base_url'] . 'enviar'; ?>" class="btn btn-primary">Enviar Correo</a>
            <a onclick="validate(2);" class="btn btn-info">Guardar Borrador</a>
            <a href="<?php echo URL_CMS . $data['base_url'] . 'listar/1'; ?>" class="btn btn-warning">Volver</a>
          </div>
          <div class="clear"></div>
        </form>
        <!-- END TABS NAVS -->
      </div>
    </div><!--/widget-->
  </div><!--/col-md-12-->
</div><!--/row-->
<script type="text/javascript">
<!--//
  function validate(id) {
    $('#publico').val(id);
    $('#form').submit();
  }
//-->
</script>
