<!-- <div>
  <h3>CONTENIDO DEL HOME</h3> -->

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
					        <!-- ms-hero-material-text-container -->
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

<!-- </div> -->

