<div class="container mt-6">
    <div class="row">
    	<?php 	foreach ($data['tabla_sec'] as $plan) {
    				$zoom = $plan['Destacado'] == 1 ? 'zoomInDown' : 'zoomInUp';
    				$prom = $plan['Destacado'] == 1 ? 'prominent' : '';
	    ?>
      	<div class="col-md-3 price-table price-table-<?php echo $plan['Estilo']; ?> wow 
      		<?php echo $prom.' '.$zoom; ?> animation-delay-2" style="visibility: visible; animation-name: <?php echo $zoom; ?>;">  
	        <header class="price-table-header">
	          <span class="price-table-category">Velocidad</span>
	          <h3><?php echo $plan['Titulo']; ?></h3>
	        </header>
	        <div class="price-table-body color-tms">
	          <?php echo $plan['Descripcion']; ?>
	          <div class="text-center">
	            <a href="<?php echo URL_WEB.'contacto'; ?>" class="btn btn-<?php echo $plan['Estilo']; ?> btn-raised">
	              <i class="mr-2 fa fa-envelope"></i> Consúltenos</a>
	          </div>
	        </div>
      	</div>
      	<?php 	} ?>
    </div>

    <div class="text-center mb-4">
      <p style="color: #000;">Planes sujetos a disponibilidad técnica y geográfica.</p>
      <p style="color: #000;">* Tarifas modificables por parte de TMS Group por variaciones en la economía nacional. ** Unidad de medida estimativa.</p>
    </div>
</div>