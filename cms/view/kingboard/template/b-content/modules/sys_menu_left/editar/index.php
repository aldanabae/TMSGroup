<!-- BEGIN TABS NAVS -->
<ul class="nav nav-tabs">
  <li class="active">
    <a href="#tab_general" data-toggle="tab">General</a>
  </li>
</ul>
<form id="form" method="post">
  <input type="hidden" name="actualizar" value="1" />
  <div class="tab-content">
    <div class="tab-pane fade in active" id="tab_general">
      <?php include('tab-general.php'); ?>
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
<!-- END TABS NAVS -->
<script type="text/javascript">
<!--//
  function validate(id) {
    $('#publico').val(id);
    $('#form').submit();
  }
//-->
</script>