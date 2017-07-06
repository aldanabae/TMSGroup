<!-- BEGIN TABS NAVS -->
<ul class="nav nav-tabs">
  <li class="active">
    <a href="#tab_general" data-toggle="tab">General</a>
  </li>
  <li>
    <a href="#tab_galeria">Galer&iacute;a</a>
  </li>
</ul>
<form id="form" method="post">
  <input type="hidden" name="actualizar" value="1" />
  <div class="tab-content">
    <div class="tab-pane fade in active" id="tab_general">
      <?php include('tab-general.php'); ?>
    </div>    
    <div class="clear"></div>   					
    <div class="tab-pane fade in" id="tab_galeria">
      <?php if($data['type'] == 1) : ?>
      <?php include('tab-image.php'); ?>	
      <?php else : ?>
      <?php include('tab-video.php'); ?>
      <?php endif; ?>
    </div>    
    <div class="clear"></div>    
  </div>
  <div class="top-actions">
    <a onclick="validate(1);" class="btn btn-primary">Guardar y Publicar</a>
    <a onclick="validate(2);" class="btn btn-info">Guardar Borrador</a>
    <a href="<?php echo URL_CMS . $data['base_url'] . 'listar/1'; ?>" class="btn btn-warning">Cancelar</a>
  </div>
  <div class="clear"></div>	
</form>
<script type="text/javascript">
<!--//
  function validate(id) {
    $('#publico').val(id);
    $('#form').submit();
  }
//-->
</script>
