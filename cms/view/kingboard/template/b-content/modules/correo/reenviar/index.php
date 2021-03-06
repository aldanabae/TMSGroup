<?php $tabla = $data['tabla']; ?>
<?php
if (isset($data[$tabla]['Fecha'])) {
  $fecha_comp = (!empty($data[$tabla]['Fecha'])) ? $data[$tabla]['Fecha'] : '';

  if (!empty($fecha_comp)) {
    $nueva_fecha = Helper::format_date(strtotime($fecha_comp));
    $hora = date('H:i', strtotime($fecha_comp));
  }
  $fecha_resp = $nueva_fecha . ' a las ' . $hora;
}
?>
<input type="hidden" name="<?php echo $tabla; ?>[Publico]" id="publico" value="<?php if (isset($data[$tabla]['Publico'])) echo $data[$tabla]['Publico']; ?>">
<div class="col-md-8">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Contenido</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label">Asunto:</label>
        <div class="controls">
          <input type="text" class="form-control" id="asunto" name="<?php echo $tabla; ?>[Asunto]" value="RW: <?php if (isset($data[$tabla]['Asunto'])) echo $data[$tabla]['Asunto']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>		
      <div class="form-group">
        <label class="control-label">Contenido:</label>
        <div class="controls">        
          <textarea id="contenido" name="<?php echo $tabla; ?>[Contenido]" class="form-control" rows="5">            
            <?php
            echo '<br /><hr />' .
            '<strong>De:</strong> ' . $data[$tabla]['Remitente'] . '<br />' .
            '<strong>Para:</strong> ' . $data[$tabla]['Destinatario'] . '<br />' .
            '<strong>Asunto:</strong> ' . $data[$tabla]['Asunto'] . '<br />' .
            '<strong>Fecha:</strong> ' . $fecha_resp . '<br /><br />';

            if (isset($data[$tabla]['Contenido']))
              echo $data[$tabla]['Contenido'];
            ?>
          </textarea>
          <p class="help-block"></p>          
        </div>
      </div>
    </div>
  </div>
</div>
<div class="col-md-4">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-cog"></i> Informaci&oacute;n</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label">Para:</label>
        <div class="controls">
          <div class="tag-email">
            <input id="tag-input" type="text" name="tags" placeholder="Ej. correo@empresa.com" class="tm-input" />
            <input type="hidden" id="destinatario" name="<?php echo $tabla; ?>[Destinatario]" value="" />
          </div>
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="imagen">Archivo Adjunto:</label>
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

    $('.tm-input').tagsManager({
      hiddenTagListId: 'destinatario'
    });

    $("#tag-input").autocomplete({
      source: "<?php echo URL_CMS . $data['base_url'] . 'autocomplete'; ?>",
      minLength: 2,
    });
  });

  function deleteFile(code) {
    delFile(code,
            "<?php echo CMS_IMG . 'file_upload.png'; ?>",
            "<?php echo URL_CMS . $data['base_url'] . 'delfile'; ?>");
  }

  uploadFile('archivo', '',
          "<?php echo URL_CMS . $data['base_url'] . 'moveup'; ?>",
          "<?php echo CMS_IMG . 'file_swf.png'; ?>", 'categoria');


  setTimeout(function () {
    set_editor('contenido');
  }, 1000);
  
  //-->
</script>