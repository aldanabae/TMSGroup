<?php $tabla = $data['tabla']; ?>
<div class="col-md-8">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Contenido</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label" for="nombre"><span class="obligatory">*</span> Nombre y Apellidos:</label>
        <div class="controls">
          <input type="text" class="form-control" id="nombre" name="<?php echo $tabla; ?>[Nombre]" value="<?php if (isset($data[$tabla]['Nombre'])) echo $data[$tabla]['Nombre']; ?>" />
          <p class="help-block"></p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="email">Email:</label>
        <div class="input-group searchbox">
          <input type="text" class="form-control" id="email" name="<?php echo $tabla; ?>[Email]" value="<?php if (isset($data[$tabla]['Email'])) echo $data[$tabla]['Email']; ?>" />
          <span class="input-group-btn">
            <button onclick="check_email('<?php echo URL_CMS . 'sys_user/check_email'; ?>');" class="btn btn-default" type="button">Verificar</button>
          </span>
        </div>
        <p class="help-block"></p>
      </div>
      <div class="form-group">
        <label class="control-label" for="usuario">Usuario:</label>
        <div class="input-group searchbox">
          <input type="text" class="form-control" id="usuario" name="<?php echo $tabla; ?>[Usuario]" value="<?php if (isset($data[$tabla]['Usuario'])) echo $data[$tabla]['Usuario']; ?>" />
          <span class="input-group-btn">
            <button onclick="check_user('<?php echo URL_CMS . 'sys_user/check_user'; ?>');" class="btn btn-default" type="button">Verificar</button>
          </span>
        </div>
        <p class="help-block"></p>
      </div>
      <div class="form-group">
        <label class="control-label" for="contrasenia">Nueva Contrase&ntilde;a:</label>
        <div class="controls">
          <input type="text" class="form-control" id="contrasenia" name="<?php echo $tabla; ?>[Contrasenia]" value="" />
          <p class="help-block">No se muestra la Contrase&ntilde;a para su propia seguridad.</p>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label" for="descripcion">Biograf&iacute;a:</label>
        <div class="controls">
          <textarea id="descripcion" name="<?php echo $tabla; ?>[Descripcion]" class="form-control" rows="4"><?php if (isset($data[$tabla]['Descripcion'])) echo $data[$tabla]['Descripcion']; ?></textarea>
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
      <h3><i class="fa fa-cog"></i> Datos</h3>
    </div>
    <div class="widget-content">
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
        </div>
      </div>
      <div class="form-group">
        <label class="control-label">Usuario creado el:</label>
        <?php
        if (isset($data[$tabla]['FechaCreacion'])) :
          $date = new DateTime($data[$tabla]['FechaCreacion']);
          $fecha_creacion = $date->format('d/m/Y');
          ?>
          <input type="hidden" name="<?php echo $tabla; ?>[FechaCreacion]" value="<?php echo $data[$tabla]['FechaCreacion']; ?>">
          <span><?php echo $fecha_creacion; ?></span>
          <?php
        endif;
        ?>
      </div>
      <div class="form-group">
        <label class="control-label">Accedi&oacute; por &uacute;ltima vez el:</label>
        <?php
        if (isset($data[$tabla]['UltimaVez'])) :
          $date = new DateTime($data[$tabla]['UltimaVez']);
          $ultima_vez = $date->format('d/m/Y - H:i:s');
          ?>
          <input type="hidden" name="<?php echo $tabla; ?>[UltimaVez]" value="<?php echo $data[$tabla]['UltimaVez']; ?>">
          <span><?php echo $ultima_vez; ?></span>
          <?php
        endif;
        ?>
      </div>
    </div>
  </div>
</div>

