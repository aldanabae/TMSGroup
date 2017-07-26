
<div class="ms-hero-page-override ms-hero-img-meeting ms-hero-bg-dark-light">
    <div class="container">
        <div class="text-center">
            <h1 class="no-m ms-site-title center-block ms-site-title-lg mt-2 animated zoomInDown animation-delay-5">Nuestros Clientes</h1>
            <p class="lead lead-lg color-light text-center center-block mt-2 mw-800 text-uppercase fw-300 animated fadeInUp animation-delay-7">Quienes confiaron en nosotros.</p>
        </div>
    </div>
</div>


<div class="container">
    <div class="card card-hero card-flat bg-transparent">
        <div class="row">
            <?php   foreach ($data['clientes'] as $value) {
                      $url_imagen = URL_GAL.'clientes/images/IM_'.$value['Imagen'];
            ?>
            <div class="col-lg-4 col-sm-6">
                <div class="card card-warning wow zoomInUp animation-delay-5" style="visibility: visible; animation-name: zoomInUp;">
                    <div class="text-center bg-warning">
                      <a href="javascript:void()" class="">
                        <img src="<?php echo $url_imagen?>" alt="..." class="">
                      </a>
                    </div>
                    <div class="card-block text-center">
                      <h3 class="color-warning"><?php echo $value['Nombre']; ?></h3>
                      <?php echo $value['Descripcion']; ?>
                      <a href="<?php echo $value['Website']; ?>" class="btn btn-warning">
                        <i class="zmdi zmdi-link"></i> Sitio WEB
                      </a>
                    </div>
                </div>
            </div>
            <?php
                    }
            ?>
        </div>
    </div>
</div>
