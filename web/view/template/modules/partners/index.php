
<div class="ms-hero-page-override ms-hero-img-coffee ms-hero-bg-tms-light">
    <div class="container">
        <div class="text-center">
            <h1 class="no-m ms-site-title color-tms center-block ms-site-title-lg mt-2 animated zoomInDown animation-delay-5">Partners</h1>
            <p class="lead lead-lg color-light text-center color-white center-block mt-2 mw-800 text-uppercase fw-300 animated fadeInUp animation-delay-7">Nuestros aliados tecnol&oacute;gicos y comerciales</p>
        </div>
    </div>
</div>


<div class="container">
    <div class="card card-hero card-flat bg-transparent">
        <div class="row"> 
            <?php foreach ($data['partners'] as $part) {
                      $url_imagen = URL_GAL.'partners/images/IM_'.$part['Imagen']; 
            ?>        
            <div class="col-lg-3 col-sm-6">
            	<div class="text-center mt-2">
            		<img src="<?php echo $url_imagen; ?>" alt="..." class="ms-avatar-hero animated zoomIn animation-delay-7">
            		<h2 class="color-tms mt-4 animated fadeInUp animation-delay-10"><?php echo $part['Nombre']; ?></h2>          
          		</div>   
            </div>	
            <?php }
            ?>		
        </div>
    </div>
</div>

