<!-- <div>
  <h3>CONTENIDO DEL HOME</h3> -->

<!INICIO Slider-->

<?php if (isset($data['sliders']) && count($data['sliders']) > 0) : ?>
	<div class="ms-hero ms-hero-material">
		<span class="ms-hero-bg"></span>
		<div class="container">
			<div class="col-lg-6 col-md-7">
				<div id="carousel-hero" class="carousel slide carousel-fade" data-ride="carousel" data-interval="8000">
				  <!-- Wrapper for slides -->
				  	<div class="carousel-inner" role="listbox">

					<?php
					    $i = 1;
					    foreach ($data['sliders'] as $item) :
					        $active = $i == 1 ? 'active' : '';
					?>
					    <div class="item <?php echo $active; ?>">
					      	<div class="carousel-caption">
					        	<div class="ms-hero-material-text-container">
						          	<header class="ms-hero-material-title animated slideInLeft animation-delay-5">
						            	<?php echo $item['Descripcion']; ?>
						          	</header>
					        	</div>
					      	</div>
					    </div>
					<?php 
						$i++;
						endforeach; 
					?>
					    <div class="carousel-controls">
					      	<!-- Controls -->
					      	<a class="left carousel-control animated zoomIn animation-delay-30" href="#carousel-hero" role="button" data-slide="prev">
					        	<i class="zmdi zmdi-chevron-left"></i>
					        	<span class="sr-only">Previous</span>
					      	</a>
					      	<a class="right carousel-control animated zoomIn animation-delay-30" href="#carousel-hero" role="button" data-slide="next">
					       		<i class="zmdi zmdi-chevron-right"></i>
					        	<span class="sr-only">Next</span>
					      	</a>
					      	<!-- Indicators -->
					      	<ol class="carousel-indicators">
							<?php
							    foreach ($data['sliders'] as $item) :
							      	$active = $i == 27 ? 'active' : '';
							?>
					        	<li data-target="#carousel-hero" data-slide-to="0" class="animated fadeInUpBig animation-delay-27 <?php echo $active; ?>"></li>
							<?php 
								endforeach; 
							?>		        
					      	</ol>
					    </div>

				  	</div>
				</div>
			</div>

			<div class="col-lg-6 col-md-5">
				<div class="ms-hero-img animated zoomInUp animation-delay-30">
				  	<img src="<?php echo URL_IMG; ?>demo/mock-imac-material2.png" alt="" class="img-responsive">
				  	<div id="carousel-hero-img" class="carousel carousel-fade slide" data-ride="carousel" data-interval="3000">
				    	<!-- Indicators -->
					    <ol class="carousel-indicators carousel-indicators-hero-img">
						<?php
						    $i = 0;
						    foreach ($data['sliders'] as $item) :
						    $active = $i == 0 ? 'active' : '';
						?>
						    <li data-target="#carousel-hero-img" data-slide-to="<?php echo $i; ?>" class="<?php echo $active; ?>"></li>
						<?php 
							$i++;
							endforeach; 
						?>
					    </ol>
				   		<!-- Wrapper for slides -->
					    <div class="carousel-inner" role="listbox">

						<?php
							$i = 0;
						    foreach ($data['sliders'] as $item) :
						    $url = URL_GAL . 'banner_top/images/IM_' . $item['Imagen'];
							$active = $i == 0 ? 'active' : '';
						?>
					      	<div class="ms-hero-img-slider item <?php echo $active; ?>">
					        	<img src="<?php echo $url; ?>" alt="" class="img-responsive"> 
					    	</div>
						<?php
							$i++;
						 	endforeach;
						?>	      	
					    </div>
				  	</div>
				</div>
			</div>
		</div>
		<!-- container -->
	</div>
<?php endif; ?>

<!FIN Slider-->



<!INICIO Servicios-->

<div class="container mt-4">
    <h1 class="text-center color-tms mb-2 wow fadeInDown animation-delay-4">Nuestros Servicios</h1>
    <p class="lead text-center aco wow fadeInDown animation-delay-5 mw-800 center-block mb-4" style="color: #20B2AA;"> 
    Mejorá los resultados de tu negocio
    </p>
	</br>
    <?php 	foreach ($data['servicios'] as $serv) {				
	?>
    <div class="ms-feature col-lg-2 col-md-6 col-sm-6 card wow flipInX animation-delay-<?php echo $serv['Delay']; ?>">
      	<div class="text-center card-block">
	        <span class="ms-icon ms-icon-circle ms-icon-xxlg color-<?php echo $serv['Estilo']; ?>">
	          <i class="<?php echo $serv['Icono']; ?>"></i>
	        </span>
	        <h4 class="color-<?php echo $serv['Estilo']; ?>"><?php echo $serv['Titulo']; ?></h4>
	        <p class=""><?php echo $serv['Descripcion']; ?></p>
	        <a href="<?php echo $serv['URL']; ?>" class="btn btn-<?php echo $serv['Estilo']; ?> btn-raised">Ver Más</a>
      	</div>
    </div>
    <?php 	}				
	?>
</div>

<!FIN Servicios-->



<!INICIO Desarrollo-->

<div class="wrap wrap-mountain mt-6">
    <div class="container">
      	<h2 class="text-center text-light mb-6 wow fadeInDown animation-delay-5" style="visibility: visible; animation-name: fadeInDown;">Desarrollamos 
        	<strong>Software a MEDIDA</strong></h2>
      	<div class="row">
        	<div class="col-md-6 col-md-push-6 mb-4  center-block">
	          	<img src="<?php echo URL_IMG.'dispositivos.png'; ?>" alt="" class="img-responsive center-block wow zoomIn animation-delay-12" style="visibility: visible; animation-name: zoomIn;"> 
	        </div>

        	<div class="col-md-6 col-md-pull-6 pr-6">
          		<p class="wow fadeInLeft animation-delay-6" style="visibility: visible; animation-name: fadeInLeft;">
	          		Creamos herramientas informáticas cuando tu negocio, empresa o entidad tiene una necesidad y 
	          		no existe en el mercado un producto que se adecúe a ella.
          		</p>
	          	<p class="wow fadeInLeft animation-delay-7" style="visibility: visible; animation-name: fadeInLeft;">
	          		Desarrollamos diferentes tipos de software con multiples lenguajes de programación como aplicaciones de escritorio, aplicaciones web, plataformas de gestión de entidades.
	          	</p>
	          	<p class="wow fadeInLeft animation-delay-8" style="visibility: visible; animation-name: fadeInLeft;">
		          	Creemos en los nuevos conceptos de aplicaciones a medida, conscientes de que el 80% del tiempo que pasamos con 
		          	nuestros smartphones lo dedicamos a las aplicaciones móviles. Es por ellos que nos dedicamos a adaptar tus necesidades, tambien al mundo de las apps.
        		</p>
	          	<div class="text-center">
	            	<a href="javascript:void(0)" class="btn btn-success btn-raised wow flipInX animation-delay-16" style="visibility: visible; animation-name: flipInX;">
	              		<i class="zmdi zmdi-case"></i>Saber más
	              	</a>
	          	</div>
        	</div>
      	</div>
    </div>
</div>

<!FIN Desarrollo-->



<!INICIO Planes-->

<div class="container mt-6">
    <div class="text-center mb-4">
      <h2 class="uppercase color-tms">Nuestros Planes de Internet de Alta Velocidad</h2>
      <p class="lead uppercase" style="color: #20B2AA;">Consultanos por planes para tu empresa</p>
    </div>

    <div class="row">
    	<?php 	foreach ($data['planes'] as $plan) {
    				$zoom = $plan['Destacado'] == 1 ? 'zoomInDown' : 'zoomInUp';
    				$prom = $plan['Destacado'] == 1 ? 'prominent' : '';
	    ?>
      	<div class="col-md-3 price-table price-table-<?php echo $plan['Estilo']; ?> wow 
      		<?php echo $prom.' '.$zoom; ?> animation-delay-2" style="visibility: visible; animation-name: <?php echo $zoom; ?>;">  
	        <header class="price-table-header">
	          <span class="price-table-category">Velocidad</span>
	          <h3><?php echo $plan['Titulo']; ?></h3>
	        </header>
	        <div class="price-table-body">
	          <?php echo $plan['Descripcion']; ?>
	          <div class="text-center">
	            <a href="javascript:void(0)" class="btn btn-<?php echo $plan['Estilo']; ?> btn-raised">
	              <i class="mr-2 fa fa-envelope"></i> Consúltenos</a>
	          </div>
	        </div>
      	</div>
      	<?php 	} ?>
    </div>

    <div class="text-center mb-4">
      <p style="color: #757575;">Planes sujetos a disponibilidad técnica y geográfica.</p>
      <p style="color: #757575;">* Tarifas modificables por parte de TMS Group por variaciones en la economía nacional. ** Unidad de medida estimativa.</p>
    </div>
</div>

<!FIN Planes-->

<!-- </div> -->

