<?php
$tabla = $data['tabla'];
$width = (isset($data['categoria'])) ? $data['categoria']['Width'] : 0;
$height = (isset($data['categoria'])) ? $data['categoria']['Height'] : 0;
?>
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
          <p class="help-block">S&oacute;lo para uso interno</p>
        </div>
      </div>	
      <div class="form-group">
        <label class="control-label" for="parent">Formato del Banner:</label>
        <div class="controls">
          <select id="formato" name="<?php echo $tabla; ?>[Formato]" data-rel="chosen">
            <?php
            $formatos = array('1' => 'Imagen', '2' => 'Archivo Flash', '3' => 'Codigo Google Adsense');
            foreach ($formatos as $key => $value):
              $selected = ($data[$tabla]['Formato'] == $key) ? 'selected="selected"' : '';
              ?>								
              <option value="<?php echo $key; ?>" <?php echo $selected; ?>><?php echo $value; ?></option>
            <?php endforeach; ?>
          </select>
        </div>
      </div>	
      <div id="control1" class="form-group disnone">
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
                <img src="<?php echo $thumb; ?>" id="img-imagen" />
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
        </div>
      </div>
      <div id="control2" class="form-group disnone">
        <label class="control-label" for="imagen">Archivo Flash:</label>
        <div class="controls">
          <div class="content-image">
            <div class="border-overflow">
              <?php
              $thumb = (!empty($data[$tabla]['Archivo'])) ? CMS_IMG . 'file_download.png' : CMS_IMG . 'file_upload.png';
              $archivo = (!empty($data[$tabla]['Archivo'])) ? URL_GAL . $data['tabla'] . '/files/SWF_' . $data[$tabla]['Archivo'] : '';
              $class = (!empty($data[$tabla]['Archivo'])) ? 'fancybox' : '';
              ?>
              <input type="hidden" name="<?php echo $tabla; ?>[Archivo]" id="archivo" value="<?php if (isset($data[$tabla]['Archivo'])) echo $data[$tabla]['Archivo']; ?>">
              <a id="gal-archivo" href="#popflash" class="<?php echo $class; ?>" data-swf="<?php echo $archivo; ?>">
                <img src="<?php echo $thumb; ?>" id="img-archivo" />
              </a>
            </div>
          </div>
          <div class="buttons-up">
            <a id="btn-archivo" class="btn btn-primary"><i class="icon icon-plus icon-white"></i> Cambiar</a>	
            <a id="del-archivo" onclick="deleteFile('archivo')" class="btn btn-danger"><i class="icon icon-trash icon-white"></i> Eliminar</a>
            <div id="ldr-archivo" class="loader">
              <img src="<?php echo CMS_IMG . 'loader.gif'; ?>"> <span>cargando archivo...</span>
            </div>
          </div>
          <div class="clear"></div>				
        </div>
      </div>
      <div id="enlace" class="form-group disnone">
        <label class="control-label" for="url"><span class="obligatory">*</span> Enlace:</label>
        <div class="controls">
          <input type="text" class="form-control" id="url" name="<?php echo $tabla; ?>[URL]" value="<?php if (isset($data[$tabla]['URL'])) echo $data[$tabla]['URL']; ?>" />
          <p class="help-block">Colocar la URL completa, por ejemplo: http://www.ejemplo.com</p>
        </div>
      </div>
      <div id="control3" class="form-group" style="display:none;">
        <label class="control-label" for="descripcion">C&oacute;digo Google Adsense:</label>
        <div class="controls">
          <textarea id="descripcion" name="<?php echo $tabla; ?>[Codigo]" class="form-control" rows="4"><?php if (isset($data[$tabla]['Codigo'])) echo $data[$tabla]['Codigo']; ?></textarea>
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
      <div class="form-group">
        <label class="control-label" for="parent">Categor&iacute;a:</label>
        <div class="controls">
          <select id="categoria" name="<?php echo $tabla; ?>[TipoID]" data-rel="chosen">
            <?php
            if (isset($data['selectcat']) && count($data['selectcat'])) :
              foreach ($data['selectcat'] as $select_cat):
                $selected = ($data[$tabla]['TipoID'] == $select_cat['ID']) ? 'selected="selected"' : '';
                ?>								
                <option value="<?php echo $select_cat['ID']; ?>" <?php echo $selected; ?>><?php echo $select_cat['Nombre']; ?></option>
                <?php
              endforeach;
            endif;
            ?>  	
          </select>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="posicion">Posici&oacute;n:</label>
        <div id="content-pos" class="controls">
          <?php include('mod-posicion.php'); ?>
        </div>
        <div class="clear"></div>
      </div>
    </div>
  </div>
</div>
<div id="popflash" class="flashline">Flash Video</div>
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

    getPopFlash('popflash',
            "<?php echo $archivo; ?>",
<?php echo $width; ?>,
<?php echo $height; ?>);

    var item = <?php echo (isset($data[$tabla]['Formato'])) ? $data[$tabla]['Formato'] : 1; ?>;

    $('#control' + item).show();
    if (item == 1 || item == 2)
      $('#enlace').show();
    else
      $('#enlace').hide();

  });

  $('#formato').change(function () {
    var id = $('#formato option:selected').val();
    $('#control1').hide();
    $('#control2').hide();
    $('#control3').hide();
    $('#enlace').hide();

    showhide('control' + id);
    if (id == 1 || id == 2)
      showhide('enlace');
  });

  function deleteImage(code) {
    delImage(code,
            "<?php echo CMS_IMG . 'no-foto-150x100.jpg'; ?>",
            "<?php echo URL_CMS . $data['base_url'] . 'delimage'; ?>");
  }

  function deleteFile(code) {
    delFile(code,
            "<?php echo CMS_IMG . 'file_upload.png'; ?>",
            "<?php echo URL_CMS . $data['base_url'] . 'delfile'; ?>");
  }

  var checkExt = new RegExp(/^(jpg|JPG|png)$/);
  uploadImage('imagen', checkExt,
          "<?php echo URL_CMS . $data['base_url'] . 'upload/'; ?>",
          "<?php echo URL_CMS . $data['base_url'] . 'jcrop'; ?>", 'categoria');

  var checkSwf = new RegExp(/^(swf)$/);
  uploadFile('archivo', checkSwf,
          "<?php echo URL_CMS . $data['base_url'] . 'moveup'; ?>",
          "<?php echo CMS_IMG . 'file_swf.png'; ?>", 'categoria');

//-->
</script>