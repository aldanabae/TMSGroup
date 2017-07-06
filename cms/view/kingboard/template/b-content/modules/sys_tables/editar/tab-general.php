<?php $tabla = $data['tabla']; ?>
<div class="col-md-8">
	<div class="widget">
		<div class="widget-header">
			<h3><i class="fa fa-info-circle"></i> Contenido</h3>
		</div>
		<div class="widget-content">
			<div class="form-group">
				<label class="control-label" for="nombre"><span class="obligatory">*</span> Nombre de la Tabla:</label>
				<div class="controls">
					<input type="text" class="form-control" id="nombre" name="<?php echo $tabla; ?>[Nombre]" value="<?php if (isset($data[$tabla]['Nombre'])) echo $data[$tabla]['Nombre']; ?>" />
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label" for="titulo">T&iacute;tulo de la Tabla:</label>
				<div class="controls">
					<input type="text" class="form-control" id="titulo" name="<?php echo $tabla; ?>[Titulo]" value="<?php if (isset($data[$tabla]['Titulo'])) echo $data[$tabla]['Titulo']; ?>" />
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
				<label class="control-label" for="anchoimg">Ancho Imagen:</label>
				<div class="controls">
					<input type="text" class="form-control" id="anchoimg" name="<?php echo $tabla; ?>[AnchoImg]" value="<?php if (isset($data[$tabla]['AnchoImg'])) echo $data[$tabla]['AnchoImg']; ?>" />
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label" for="altoimg">Alto Imagen:</label>
				<div class="controls">
					<input type="text" class="form-control" id="altoimg" name="<?php echo $tabla; ?>[AltoImg]" value="<?php if (isset($data[$tabla]['AltoImg'])) echo $data[$tabla]['AltoImg']; ?>" />
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label" for="anchothu">Ancho Thumb:</label>
				<div class="controls">
					<input type="text" class="form-control" id="anchothu" name="<?php echo $tabla; ?>[AnchoThu]" value="<?php if (isset($data[$tabla]['AnchoThu'])) echo $data[$tabla]['AnchoThu']; ?>" />
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label" for="altothu">Alto Thumb:</label>
				<div class="controls">
					<input type="text" class="form-control" id="altothu" name="<?php echo $tabla; ?>[AltoThu]" value="<?php if (isset($data[$tabla]['AltoThu'])) echo $data[$tabla]['AltoThu']; ?>" />
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<?php $checked = (isset($data[$tabla]['Recortar']) && $data[$tabla]['Recortar'] == 1) ? 'checked="checked"' : ''; ?>
					<label class="checkbox inline">
						<input type="checkbox" id="recortar" name="<?php echo $tabla; ?>[Recortar]" value="1" <?php echo $checked; ?>> Recortar Imagen
					</label>
					<p class="help-block"></p>
				</div>
			</div>
			<div class="form-group">
				<div class="controls">
					<?php $checked = (isset($data[$tabla]['Reorder']) && $data[$tabla]['Reorder'] == 1) ? 'checked="checked"' : ''; ?>
					<label class="checkbox inline">
						<input type="checkbox" id="reorder" name="<?php echo $tabla; ?>[Reorder]" value="1" <?php echo $checked; ?>> Reordenar Registros
					</label>
					<p class="help-block"></p>
				</div>
			</div>
		</div>
	</div>
</div>

