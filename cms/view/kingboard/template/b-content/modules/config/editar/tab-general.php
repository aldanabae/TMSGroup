<?php $tabla = $data['tabla']; ?>
<div class="col-md-8">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Contenido</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label" for="nombre"><span class="obligatory">*</span> Nombre Sitio Web:</label>
        <div class="controls">
          <input type="text" class="form-control" id="nombre" name="<?php echo $tabla; ?>[Nombre]" value="<?php if (isset($data[$tabla]['Nombre'])) echo $data[$tabla]['Nombre']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="slogan">Slogan:</label>
        <div class="controls">
          <input type="text" class="form-control" id="slogan" name="<?php echo $tabla; ?>[Slogan]" value="<?php if (isset($data[$tabla]['Slogan'])) echo $data[$tabla]['Slogan']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="url">Url Sitio Web:</label>
        <div class="controls">
          <input type="text" class="form-control" id="url" name="<?php echo $tabla; ?>[Website]" value="<?php if (isset($data[$tabla]['Website'])) echo $data[$tabla]['Website']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="email">Email de Contacto:</label>
        <div class="controls">
          <input type="text" class="form-control" id="email" name="<?php echo $tabla; ?>[Email]" value="<?php if (isset($data[$tabla]['Email'])) echo $data[$tabla]['Email']; ?>" />
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
        <label class="control-label" for="telefono">Tel&eacute;fono:</label>
        <div class="controls">
          <input type="text" class="form-control" id="telefono" name="<?php echo $tabla; ?>[Telefono]" value="<?php if (isset($data[$tabla]['Telefono'])) echo $data[$tabla]['Telefono']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="fax">Fax:</label>
        <div class="controls">
          <input type="text" class="form-control" id="fax" name="<?php echo $tabla; ?>[Fax]" value="<?php if (isset($data[$tabla]['Fax'])) echo $data[$tabla]['Fax']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="movil">M&oacute;vil:</label>
        <div class="controls">
          <input type="text" class="form-control" id="movil" name="<?php echo $tabla; ?>[Movil]" value="<?php if (isset($data[$tabla]['Movil'])) echo $data[$tabla]['Movil']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
<!--//
  $(document).ready(function () {
    $("#frase").charCount({
      allowed: 200,
      warning: 15,
      counterText: 'Quedan: '
    });
  });
  
  setTimeout(function(){
    set_minieditor('frase');
  },1000);
//-->
</script>
