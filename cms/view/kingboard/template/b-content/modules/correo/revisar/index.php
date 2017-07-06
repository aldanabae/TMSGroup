<?php $tabla = $data['tabla']; ?>
<div class="col-md-8">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Contenido</h3>
    </div>
    <div class="widget-content">
      <div class="form-group">
        <label class="control-label">Asunto:</label>
        <div class="box-text">
          <?php if (isset($data[$tabla]['Asunto'])) echo $data[$tabla]['Asunto']; ?>
        </div>
      </div>		
      <div class="form-group">
        <label class="control-label">Archivo Adjunto:</label>
        <div class="box-text">
          <?php
          $imagen = (!empty($data[$tabla]['Imagen'])) ? URL_GAL . $data['tabla'] . '/images/IM_' . $data[$tabla]['Imagen'] : '';
          $class = (!empty($data[$tabla]['Imagen'])) ? 'fancybox' : '';

          if (!empty($imagen)) :
            ?>
            <a id="gal-imagen" href="<?php echo $imagen; ?>" class="<?php echo $class; ?>">
              <img src="<?php echo CMS_IMG . 'attach.png'; ?>" alt="<?php if (isset($data[$tabla]['Imagen'])) echo $data[$tabla]['Imagen']; ?>" />
            </a>
          <?php else : ?>
            <img src="<?php echo CMS_IMG . 'attach.png'; ?>" alt="No existen archivos adjuntos" />
            <span>No existen Archivos Adjuntos</span>
          <?php endif; ?>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label">Contenido:</label>
        <div class="box-text">          
          <?php if (isset($data[$tabla]['Contenido'])) echo $data[$tabla]['Contenido']; ?>
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
        <label class="control-label">Enviado:</label>
        <div class="box-text">          
          <?php
          if (isset($data[$tabla]['Fecha'])) {
            $fecha_comp = (!empty($data[$tabla]['Fecha'])) ? $data[$tabla]['Fecha'] : '';

            if (!empty($fecha_comp)) {
              $nueva_fecha = Helper::format_date(strtotime($fecha_comp));
              $hora = date('H:i', strtotime($fecha_comp));
            }
            echo $nueva_fecha.' a las '.$hora;
          }
          ?>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label">De:</label>
        <div class="box-text">
          <?php if (isset($data[$tabla]['Remitente'])) echo $data[$tabla]['Remitente']; ?>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label">Para:</label>
        <div class="box-text">
          <?php if (isset($data[$tabla]['Destinatario'])) echo $data[$tabla]['Destinatario']; ?>
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
  });
  //-->
</script>