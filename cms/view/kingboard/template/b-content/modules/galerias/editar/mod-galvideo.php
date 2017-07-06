<!-- king gallery -->
<?php if (isset($data['galeria']) && count($data['galeria'])) : ?>
  <?php
  for ($i = 1; $i < (count($data['galeria']) + 1); $i++) :
    if (isset($data['galeria'][$i - 1]['Imagen']) && !empty($data['galeria'][$i - 1]['Imagen'])) :
      $thumb = Helper::image_youtube($data['galeria'][$i - 1]['Imagen']);
      $url_video = 'http://www.youtube.com/watch?v=' . $data['galeria'][$i - 1]['Imagen'];
      ?>					
      <div id="galeria_<?php echo $i; ?>" class="gal-item">
        <div class="gal-image">
          <a id="gale_<?php echo $i; ?>" href="<?php echo $url_video; ?>" data-fancybox-group="gallery" class="fancybox-media">
            <img class="list-group-image" id="img-galeria_<?php echo $i; ?>" src="<?php echo $thumb; ?>" width="260" />
            <input type="hidden" value="<?php echo $data['galeria'][$i - 1]['ID']; ?>" name="gallery[<?php echo $i - 1; ?>][ID]">
            <input type="hidden" value="<?php echo $data['galeria'][$i - 1]['Imagen']; ?>" name="gallery[<?php echo $i - 1; ?>][Imagen]">
          </a>
        </div>
        <div class="gal-caption">
          <h3 class="inner list-group-item-heading"><?php echo $data['galeria'][$i - 1]['Imagen']; ?></h3>
          <ul class="list-unstyled">          
            <li class="list-desc"><?php echo $data['galeria'][$i - 1]['Titulo']; ?></li>
            <li class="list-edit">
              <textarea rows="2" name="gallery[<?php echo $i - 1; ?>][Titulo]"><?php echo $data['galeria'][$i - 1]['Titulo']; ?></textarea>
            </li>
          </ul>
        </div>
        <div class="action-buttons">
          <a href="javascript:editGallery('galeria_<?php echo $i; ?>');" class="btn btn-primary btn-xs">
            <i class="fa fa-pencil"></i> <span class="bt-edit">Editar</span>
          </a>
          <a href="javascript:deleteGallery('galeria_<?php echo $i; ?>', 0)" class="btn btn-danger btn-xs">
            <i class="fa fa-trash-o"></i> Eliminar
          </a>
        </div>
      </div>
    <?php endif; ?>
  <?php endfor; ?>
<?php else : ?>	
  <p class="center">Lo sentimos, no se encontr&oacute; ningún video en la galeria!</p>
<?php endif; ?>	
<!-- end king gallery -->
<script type="text/javascript">
<!--//
  $(document).ready(function () {
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

    showControls();
  });
//-->
</script>

