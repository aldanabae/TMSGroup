<?php $tabla = $data['tabla']; ?>
<input type="hidden" name="<?php echo $tabla; ?>[Publico]" id="publico" value="<?php if (isset($data[$tabla]['Publico'])) echo $data[$tabla]['Publico']; ?>">
<div class="col-md-8">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Contenido</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label" for="nombre"><span class="obligatory">*</span> T&iacute;tulo</label>
        <div class="controls">
          <input type="text" class="form-control" id="nombre" name="<?php echo $tabla; ?>[Titulo]" value="<?php if (isset($data[$tabla]['Titulo'])) echo $data[$tabla]['Titulo']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>	
      <div class="form-group">
        <label class="control-label" for="meta-url"><span class="obligatory">*</span> Enlace Permanente:</label>
        <div class="controls">
          <input type="text" class="form-control" id="meta-url" name="<?php echo $tabla; ?>[URL]" value="<?php if (isset($data[$tabla]['URL'])) echo $data[$tabla]['URL']; ?>" />
          <p class="help-block">Su enlace se vera en: <?php echo URL_WEB . $tabla . '/'; ?><strong id="friendly-url"><?php if (isset($data[$tabla]['URL'])) echo $data[$tabla]['URL']; ?></strong></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="descripcion">Descripci&oacute;n:</label>
        <div class="controls">
          <textarea id="descripcion" maxlength="200" name="<?php echo $tabla; ?>[Descripcion]" class="form-control" rows="3"><?php if (isset($data[$tabla]['Descripcion'])) echo $data[$tabla]['Descripcion']; ?></textarea>
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
        <label class="control-label" for="estilo">Estilo</label>
        <div class="controls">
          <input type="text" class="form-control" id="estilo" name="<?php echo $tabla; ?>[Estilo]" value="<?php if (isset($data[$tabla]['Estilo'])) echo $data[$tabla]['Estilo']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>	
      <div class="form-group">
        <div class="controls">
          <?php $checked = (isset($data[$tabla]['Destacado']) && $data[$tabla]['Destacado'] == 1) ? 'checked="checked"' : ''; ?>
          <label class="checkbox inline">
            <input type="checkbox" id="destacado" name="<?php echo $tabla; ?>[Destacado]" value="1" <?php echo $checked; ?>> Plan Destacado
          </label>
          <p class="help-block"></p>
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
<script type="text/javascript">
  setTimeout(function () {
    set_editor('descripcion');
  }, 1000);

  $('#nombre').keyup(function () {
    value = $(this).val();
    $('#meta-url').val(str2url(value));
    updateFriendlyURL('meta-url', 'friendly-url');
  });

  $('#meta-url').keyup(function () {
    $(this).val(str2url($(this).val()));
    updateFriendlyURL('meta-url', 'friendly-url');
  });
</script>