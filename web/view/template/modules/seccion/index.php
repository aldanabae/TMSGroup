<!--Contendio Seccion -->
<?php
$item = $data[$data['tabla']];

$archivo = !empty($item['Archivo']) ? $item['Archivo'] : '';
$imagen = !empty($item['Imagen']) ? URL_GAL . $data['tabla'] . '/images/IM_' . $item['Imagen'] : '';

$sumario = !empty($item['Sumario']) ?
        str_replace('<strong>', '<strong class="colorStar animation-delay-10">', $item['Sumario']) : '';
?>
<header class="ms-hero-page ms-hero-bg-dark-light ms-hero-img-city2 mb-4 ms-bg-fixed">
  <div class="container">
    <div class="text-center">
      <h1 class="color-tms mb-4 animated fadeInDown animation-delay-4">
        <strong><?php echo $item['Titulo']; ?></strong>
      </h1>
      <?php if (!empty($sumario)) : ?>
        <div class="lead lead-xl mw-800 center-block color-medium mb-2 animated fadeInDown animation-delay-4"> 
          <?php echo $sumario; ?>
        </div>
      <?php endif; ?>
    </div>
    </br>
    <?php if (!empty($imagen)) : ?>
      <div class="col-md-push-3 center-block">
        <img src="<?php echo $imagen; ?>" class="img-responsive center-block wow zoomIn animation-delay-12" style="visibility: visible; animation-name: zoomIn;"> 
      </div>
    <?php endif; ?>
    <div class="row mt-4">
      <?php
      if (isset($data['parrafos']) && count($data['parrafos']) > 0) :
        foreach ($data['parrafos'] as $para):
          if(!empty($para['Titulo'])) :
          ?>
          <div class="col-md-4 col-sm-6">
            <div class="ms-icon-feature wow flipInX animation-delay-4" style="visibility: visible; animation-name: flipInX;">
              <div class="ms-icon-feature-icon">
                <span class="ms-icon ms-icon-lg ms-icon-inverse ms-icon-aqua">
                  <i class="<?php echo $para['Icono']; ?>"></i>
                </span>
              </div>
              <div class="ms-icon-feature-content color-white">
                <h4 class="color-aqua"><?php echo $para['Titulo']; ?></h4>
                <p><?php echo $para['Detalle']; ?></p>
              </div>
            </div>
          </div>
          <?php
          endif;
        endforeach;
      endif;
      ?>
    </div>
    <div>
      <?php 
          if(!empty($archivo)) {
            include($_rutaFiles['plantillas'].$archivo);
          }
      ?>
    </div>
    <div class="text-center">
      <a href="<?php echo URL_WEB.'contacto'; ?>" class="btn btn-raised btn-royal animated fadeInUp animation-delay-10">
        <i class="zmdi zmdi-email"></i> Contáctenos</a>
    </div>
  </div>
</header>
<!--Contendio Seccion -->
