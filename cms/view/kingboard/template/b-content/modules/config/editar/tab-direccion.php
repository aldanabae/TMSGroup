<?php $tabla = $data['tabla']; ?>
<div class="col-md-8">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Contenido</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label" for="direccion"><span class="obligatory">*</span> Direcci&oacute;n:</label>
        <div class="controls">
          <input type="text" class="form-control" id="direccion" name="<?php echo $tabla; ?>[Direccion]" value="<?php if (isset($data[$tabla]['Direccion'])) echo $data[$tabla]['Direccion']; ?>" />
          <p class="help-block">Calle / Nro. / Planta / Dpto.</p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="localidad">Localidad:</label>
        <div class="controls">
          <input type="text" class="form-control" id="localidad" name="<?php echo $tabla; ?>[Localidad]" value="<?php if (isset($data[$tabla]['Localidad'])) echo $data[$tabla]['Localidad']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="provincia">Provincia:</label>
        <div class="controls">
          <input type="text" class="form-control" id="provincia" name="<?php echo $tabla; ?>[Provincia]" value="<?php if (isset($data[$tabla]['Provincia'])) echo $data[$tabla]['Provincia']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="pais">Pa&iacute;s:</label>
        <div class="controls">
          <select id="pais" name="<?php echo $tabla; ?>[PaisID]" data-rel="chosen">
            <option value=""></option>
            <?php if (isset($data['selectpais']) && count($data['selectpais'])) : ?>
              <?php
              foreach ($data['selectpais'] as $selectpais):
                $selected = ($data[$tabla]['PaisID'] == $selectpais['ID']) ? 'selected="selected"' : '';
                ?>								
                <option value="<?php echo $selectpais['ID']; ?>" <?php echo $selected; ?>><?php echo $selectpais['Nombre']; ?></option>
              <?php endforeach; ?>
            <?php endif; ?>  	
          </select>
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
        <label class="control-label" for="postal">C&oacute;digo Postal:</label>
        <div class="controls">
          <input type="text" class="form-control" id="postal" name="<?php echo $tabla; ?>[CodigoPostal]" value="<?php if (isset($data[$tabla]['CodigoPostal'])) echo $data[$tabla]['CodigoPostal']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="latitud">Latitud:</label>
        <div class="controls">
          <input type="text" class="form-control" id="latitud" name="<?php echo $tabla; ?>[Latitud]" value="<?php if (isset($data[$tabla]['Latitud'])) echo $data[$tabla]['Latitud']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="longitud">Longitud:</label>
        <div class="controls">
          <input type="text" class="form-control" id="longitud" name="<?php echo $tabla; ?>[Longitud]" value="<?php if (isset($data[$tabla]['Longitud'])) echo $data[$tabla]['Longitud']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
    </div>
  </div>
</div>