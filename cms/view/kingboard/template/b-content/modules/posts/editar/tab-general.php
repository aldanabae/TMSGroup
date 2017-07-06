<?php $tabla = $data['tabla']; ?>
<input type="hidden" name="<?php echo $tabla; ?>[Publico]" id="publico" value="<?php if (isset($data[$tabla]['Publico'])) echo $data[$tabla]['Publico']; ?>">
<div class="col-md-8">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Contenido</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label" for="titulo"><span class="obligatory">*</span> T&iacute;tulo:</label>
        <div class="controls">
          <input type="text" class="form-control" id="titulo" name="<?php echo $tabla; ?>[Titulo]" value="<?php if (isset($data[$tabla]['Titulo'])) echo $data[$tabla]['Titulo']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="meta-url"><span class="obligatory">*</span> Enlace Permanente:</label>
        <div class="controls">
          <input type="text" class="form-control" id="meta-url" name="<?php echo $tabla; ?>[URL]" value="<?php if (isset($data[$tabla]['URL'])) echo $data[$tabla]['URL']; ?>" />
          <p class="help-block">Su enlace se vera en: <?php echo URL_WEB . 'noticias/'; ?><strong id="friendly-url"><?php if (isset($data[$tabla]['URL'])) echo $data[$tabla]['URL']; ?></strong></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="sumario">Sumario:</label>
        <div class="controls">
          <textarea id="sumario" maxlength="200" name="<?php echo $tabla; ?>[Sumario]" class="form-control" rows="3"><?php if (isset($data[$tabla]['Sumario'])) echo $data[$tabla]['Sumario']; ?></textarea>
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="detalle">Contenido:</label>
        <div class="controls">
          <textarea id="detalle" name="<?php echo $tabla; ?>[Detalle]" class="form-control" rows="4"><?php if (isset($data[$tabla]['Detalle'])) echo $data[$tabla]['Detalle']; ?></textarea>
          <p class="help-block"></p>
        </div>
      </div>
      <div class="cont-hint">
        <span class="obligatory">*</span>
        <p class="help-block">Los campos son obligatorios</p>
      </div>				
    </div>
  </div>
</div>
<div class="col-md-4">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-cog"></i> Configuraci&oacute;n</h3>
    </div>
    <div class="widget-content">
      <ul class="nav nav-tabs">
        <li class="active">
          <a href="#image" data-toggle="tab">Media</a>
        </li>
        <li>
          <a href="#info">Categor&iacute;a</a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane fade in active" id="image">
          <div class="form-group">
            <label class="control-label" for="imagen">Imagen:</label>
            <div class="controls">
              <div class="content-image">
                <div class="border-overflow">
                  <?php
                  $thumb = (!empty($data[$tabla]['Imagen'])) ? URL_GAL . $data['tabla'] . '/thumbs/TH_' . $data[$tabla]['Imagen'] : CMS_IMG . 'no-foto-150x100.jpg';
                  $imagen = (!empty($data[$tabla]['Imagen'])) ? URL_GAL . $data['tabla'] . '/images/IM_' . $data[$tabla]['Imagen'] : '#';
                  $class = (!empty($data[$tabla]['Imagen'])) ? 'fancybox' : '';
                  ?>
                  <input type="hidden" name="<?php echo $tabla; ?>[Imagen]" id="imagen" value="<?php if (isset($data[$tabla]['Imagen'])) echo $data[$tabla]['Imagen']; ?>">
                  <a id="gal-imagen" href="<?php echo $imagen; ?>" class="<?php echo $class; ?>">
                    <img src="<?php echo $thumb; ?>" id="img-imagen" width="150">
                  </a>
                </div>
              </div>
              <div class="buttons-up">
                <a id="btn-imagen" class="btn btn-primary"><i class="icon icon-plus icon-white"></i> Cambiar</a>	
                <a id="del-imagen" onclick="deleteImage('imagen')" class="btn btn-danger"><i class="icon icon-trash icon-white"></i> Eliminar</a>
                <div id="ldr-imagen" class="loader">
                  <img src="<?php echo CMS_IMG . 'loader.gif'; ?>"> <span>cargando imagen...</span>
                </div>
              </div>
              <div class="clear"></div>
              <p>&nbsp;</p>				
              <label class="control-label">Alineaci&oacute;n:</label>
              <select name="<?php echo $tabla; ?>[AlineaImg]" data-rel="chosen">
                <?php
                $alinea = array('center' => 'Centro', 'right' => 'Derecha', 'left' => 'Izquierda');
                foreach ($alinea as $key => $value):
                  $selected = ($data[$tabla]['AlineaImg'] == $key) ? 'selected="selected"' : '';
                  ?>								
                  <option value="<?php echo $key; ?>" <?php echo $selected; ?>><?php echo $value; ?></option>
                <?php endforeach; ?>
              </select>		
              <p>&nbsp;</p>
              <label class="control-label">Descripci&oacute;n:</label>
              <textarea rows="1" class="form-control autogrow" name="<?php echo $tabla; ?>[TextImage]"><?php if (isset($data[$tabla]['TextImage'])) echo $data[$tabla]['TextImage']; ?></textarea>
              <p class="help-block"></p>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label" for="video">Video Youtube:</label>
            <div class="controls">
              <div class="content-image">
                <div class="border-overflow">
                  <?php
                  $thumb = (!empty($data[$tabla]['Video'])) ? 'http://img.youtube.com/vi/' . $data[$tabla]['Video'] . '/0.jpg' :
                          CMS_IMG . 'no-foto-150x100.jpg';
                  $video = (!empty($data[$tabla]['Video'])) ? 'http://www.youtube.com/watch?v=' . $data[$tabla]['Video'] : '#';
                  $class = (!empty($data[$tabla]['Video'])) ? 'fancybox-media' : '';
                  ?>
                  <input type="hidden" name="<?php echo $tabla; ?>[Video]" id="video" value="<?php if (isset($data[$tabla]['Video'])) echo $data[$tabla]['Video']; ?>">
                  <a id="gal-video" href="<?php echo $video; ?>" class="<?php echo $class; ?>">
                    <img src="<?php echo $thumb; ?>" id="img-video" width="150">
                  </a>
                </div>
              </div>
              <div class="buttons-up">
                <a id="btn-video" href="#pop-video" class="fancybox btn btn-primary"><i class="icon icon-plus icon-white"></i> Cambiar</a>	
                <a id="del-video" onclick="deleteVideo('video')" class="btn btn-danger"><i class="icon icon-trash icon-white"></i> Eliminar</a>
                <div id="ldr-video" class="loader">
                  <img src="<?php echo CMS_IMG . 'loader.gif'; ?>"> <span>cargando imagen...</span>
                </div>
              </div>
              <div class="clear"></div>
              <p>&nbsp;</p>
              <label class="control-label">Descripci&oacute;n:</label>
              <textarea rows="1" class="form-control autogrow" name="<?php echo $tabla; ?>[TextVideo]"><?php if (isset($data[$tabla]['TextVideo'])) echo $data[$tabla]['TextVideo']; ?></textarea>
              <p class="help-block"></p>
            </div>
          </div>									
        </div>    
        <div class="clear"></div>         
        <div class="tab-pane fade in" id="info">
          <div class="form-group">
            <label class="control-label" for="parent">Categor&iacute;a:</label>
            <div class="controls">
              <input type="hidden" id="parent_ant" value="<?php if (isset($data[$tabla]['CategoriaID'])) echo $data[$tabla]['CategoriaID']; ?>">
              <select id="parent" name="<?php echo $tabla; ?>[CategoriaID]" data-rel="chosen">
                <option value=""></option>
                <?php if (isset($data['selectcat']) && count($data['selectcat'])) : ?>
                  <?php
                  foreach ($data['selectcat'] as $select_cat):
                    $selected = ($data[$tabla]['CategoriaID'] == $select_cat['ID']) ? 'selected="selected"' : '';
                    ?>								
                    <option value="<?php echo $select_cat['ID']; ?>" <?php echo $selected; ?>><?php echo $select_cat['Nombre']; ?></option>
                  <?php endforeach; ?>
                <?php endif; ?>  	
              </select>
            </div>
          </div>		
          <div class="form-group">
            <div class="controls">
              <?php $checkedCon = (isset($data[$tabla]['Portada']) && $data[$tabla]['Portada'] == 1) ? 'checked="checked"' : ''; ?>
              <label class="checkbox inline">
                <input type="checkbox" id="portada" name="<?php echo $tabla; ?>[Portada]" value="1" <?php echo $checkedCon; ?>> 
                <span class="checkbox-span">Añadir en Carrusel de Notas</span>
              </label>
              <p class="help-block"></p>
            </div>
          </div>
        </div>
        <div class="clear"></div>    
      </div>
    </div>
  </div>
</div>
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

    $("#sumario").charCount({
      allowed: 200,
      warning: 15,
      counterText: 'Quedan: '
    });

    $('#titulo').keyup(function () {
      value = $(this).val();
      $('#meta-url').val(str2url(value));
      $('#meta-titulo').val(value);
      $('#meta-descripcion').val(value);
      updateFriendlyURL('meta-url', 'friendly-url');
    });

    $('#meta-url').keyup(function () {
      $(this).val(str2url($(this).val()));
      updateFriendlyURL('meta-url', 'friendly-url');
    });
  });

  function deleteImage(code) {
    delImage(code,
            "<?php echo CMS_IMG . 'no-foto-150x100.jpg'; ?>",
            "<?php echo URL_CMS . $data['base_url'] . 'delimage'; ?>");
  }
  
  function deleteVideo(code) {
    delVideo(code,"<?php echo CMS_IMG . 'no-foto-150x100.jpg'; ?>");
  }

  function deleteGallery(code, id) {
    delGallery(code, id,
            "<?php echo URL_CMS . $data['base_url'] . 'delimage'; ?>");
  }

  var checkExt = new RegExp(/^(jpg|JPG|png)$/);
  uploadImage('imagen', checkExt,
          "<?php echo URL_CMS . $data['base_url'] . 'upload'; ?>",
          "<?php echo URL_CMS . $data['base_url'] . 'jcrop'; ?>");

  setTimeout(function () {
    set_editor('detalle');
  }, 1000);
//-->
</script>