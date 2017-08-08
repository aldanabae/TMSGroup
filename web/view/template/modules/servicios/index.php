<header class="ms-hero-page ms-hero-bg-dark-light ms-hero-img-city2 mb-4 ms-bg-fixed">
  <div class="container">
    <div class="text-center">
      <h1 class="color-tms mb-4 animated fadeInDown animation-delay-4">
        <strong>Servicios</strong>
      </h1>
      <div class="lead lead-xl mw-800 center-block color-medium mb-2 animated fadeInDown animation-delay-4"> 
        Mejorá los resultados de tu negocio
      </div>
    </div>
    <div class="container mt-4">
      <?php   foreach ($data['servicios'] as $serv) {       
      ?>
      <div class="ms-feature col-lg-2 col-md-6 col-sm-6 card wow flipInX animation-delay-<?php echo $serv['Delay']; ?>">
          <div class="text-center card-block">
            <span class="ms-icon ms-icon-circle ms-icon-xxlg color-<?php echo $serv['Estilo']; ?>">
              <i class="<?php echo $serv['Icono']; ?>"></i>
            </span>
            <h4 class="color-<?php echo $serv['Estilo']; ?>"><strong><?php echo $serv['Titulo']; ?></strong></h4>
            <p class=""><?php echo $serv['Descripcion']; ?></p>
            <a href="<?php echo URL_WEB.'seccion/'; ?><?php echo $serv['URL']; ?>" class="btn btn-<?php echo $serv['Estilo']; ?> btn-raised">Ver Más</a>
          </div>
      </div>
      <?php   }       
      ?>
    </div>
  </div>
</header>