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
          <a onclick="validate(1);" class="btn btn-primary">Guardar</a>
          <a href="<?php echo URL_CMS; ?>" class="btn btn-warning">Cancelar</a>
        </div>
        <div class="clear"></div>
        <?php include('editar/perfil.php'); ?>
      </div>
    </div><!--/widget-->
  </div><!--/col-md-12-->
</div><!--/row-->
<script type="text/javascript">
  <!--//
$(document).ready(function () {
    $('.fancybox').fancybox();
    $('.fancybox-media').attr('rel', 'media-gallery').fancybox({
      openEffect: 'none',
      closeEffect: 'none',
      prevEffect: 'none',
      nextEffect: 'none',
      arrows: false,
      helpers: {
        media: {},
        buttons: {}
      }
    });
  });

  function deleteImage(code) {
    delImage(code,
            "<?php echo CMS_IMG . 'no-foto-150x100.jpg'; ?>",
            "<?php echo URL_CMS . $data['base_url'] . 'delimage'; ?>");
  }
  
  var checkExt = new RegExp(/^(jpg|JPG|png)$/);
  uploadImage('imagen', checkExt,
          "<?php echo URL_CMS . $data['base_url'] . 'upload'; ?>",
          "<?php echo URL_CMS . $data['base_url'] . 'jcrop'; ?>");
  //-->
</script>