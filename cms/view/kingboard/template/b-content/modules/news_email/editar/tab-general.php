<?php
$tabla = $data['tabla'];
?>
<input type="hidden" name="<?php echo $tabla; ?>[Publico]" id="publico" value="<?php if (isset($data[$tabla]['Publico'])) echo $data[$tabla]['Publico']; ?>">
<div class="col-md-8">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Contenido</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label" for="email"><span class="obligatory">*</span> Correo Electr&oacute;nico:</label>
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
        <label class="control-label" for="parent">Categor&iacute;a:</label>
        <div class="controls">
          <select id="categoria" name="<?php echo $tabla; ?>[GroupID]" data-rel="chosen">
            <?php
            if (isset($data['selectcat']) && count($data['selectcat'])) :
              foreach ($data['selectcat'] as $select_cat):
                $selected = ($data[$tabla]['GroupID'] == $select_cat['ID']) ? 'selected="selected"' : '';
                ?>								
                <option value="<?php echo $select_cat['ID']; ?>" <?php echo $selected; ?>><?php echo $select_cat['Nombre']; ?></option>
                <?php
              endforeach;
            endif;
            ?>  	
          </select>
        </div>
      </div>	
    </div>
  </div>
</div>
