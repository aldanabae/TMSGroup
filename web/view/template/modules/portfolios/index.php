<div class="material-background"></div>
<div class="container">
    <div class="text-center mb-6">
      <h1 class="no-m ms-site-title color-white center-block ms-site-title-lg mt-2 animated zoomInDown animation-delay-5">Portfolio</h1>
      <p class="lead lead-lg color-white text-center center-block mt-2 mb-4 mw-800 text-uppercase fw-300 animated fadeInUp animation-delay-7">
        Descubre nuestros proyectos y su 
        <span class="colorStar">riguroso proceso</span> de creaci&oacute;n</p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="row text-center">
                <?php   foreach ($data['portfolio'] as $port) {
                          $url_imagen = URL_GAL.'portfolio/images/IM_'.$port['Imagen'];       
                ?>
                <div class="col-md-4 col-sm-6">
                  <div class="card width-auto">
                    <figure class="ms-thumbnail ms-thumbnail-horizontal">
                      <img src="<?php echo $url_imagen; ?>" alt="" class="img-responsive">
                      <figcaption class="ms-thumbnail-caption text-center">
                        <div class="ms-thumbnail-caption-content">
                          <h4 class="ms-thumbnail-caption-title mb-2"><?php echo $port['Titulo']; ?></h4>
                          <a href="<?php echo URL_WEB.'portfolios/'; ?><?php echo $port['URL']; ?>" class="btn-circle btn-circle-raised btn-circle-xs ml-1 btn-circle-white btn-circle-<?php echo $port['Color']; ?>">
                            <i class="zmdi zmdi-share"></i>
                          </a>
                        </div>
                      </figcaption>
                    </figure>
                    <div class="card-block text-center">
                      <a href="javascript:void(0)" class="btn-circle btn-circle-<?php echo $port['Color']; ?> btn-circle-raised btn-card-float right wow zoomInDown index-2">
                        <i class="zmdi zmdi-star"></i>
                      </a>
                      <h4 class="color-<?php echo $port['Color']; ?>"><?php echo $port['Titulo']; ?></h4>
                      <p><?php echo $port['Descripcion']; ?></p>
                      <!-- Ocultar antes de subir fichas de protfolio -->
                       <a href="<?php echo URL_WEB.'portfolio/'; ?><?php echo $port['URL']; ?>" class="btn btn-<?php echo $port['Color']; ?> btn-raised">
                        <i class="zmdi zmdi-star"></i> Ver M&aacute;s</a> 
                      <!-- Ocultar antes de subir fichas de protfolio -->
                    </div>
                  </div>
                </div>
                <?php   }       
                ?>
            </div>
        </div>
    </div>
</div>