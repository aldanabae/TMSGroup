<?php   $port = $data[$data['tabla']];
        $imagen = !empty($port['Imagen']) ? URL_GAL . $data['tabla'] . '/images/IM_' . $port['Imagen'] : '';       
?>
<div class="ms-hero-page mb-6 ms-hero2-bg-primary ms-hero-img-coffee">
    <h1 class="text-center no-m pt-4 pb-4 color-tms index-1"><?php echo $port['Titulo']; ?></h1>
    <p class="lead color-white index-1 text-center"><?php echo $port['Subtitulo']; ?></p>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="">
                    <div id="carousel-example-generic" class="ms-carousel carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                        <?php   $i = 0;
                                foreach ($data['galeria'] as $gal):
                                    $active = $i == 0 ? 'active' : '';
                        ?>
                            <li data-target="#carousel-example-generic" data-slide-to="<?php echo $i; ?>" class="<?php echo $active; ?>"></li>
                        <?php 
                                    $i++;
                                endforeach; 
                        ?>   
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                        <?php   if (isset($data['galeria']) && count($data['galeria']) > 0) :
                                    $i = 0;
                                    foreach ($data['galeria'] as $gal):
                                        $imagen = !empty($gal['Imagen']) ? URL_GAL . $data['tabla'] . '/images/IM_' . $gal['Imagen'] : '';
                                        $active = $i == 0 ? 'active' : '';
                        ?>
                            <div class="item <?php echo $active; ?>">
                                <img src="<?php echo $imagen ;?>" alt="...">
                                <div class="carousel-caption">
                                  <h3 class="color-aqua"><?php echo $gal['Titulo'] ;?></h3>
                                  <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p> -->
                                </div>
                            </div>
                        <?php           $i++; 
                                    endforeach;
                                endif;
                        ?>
                        </div>
                        <!-- Controls -->
                        <a href="#carousel-example-generic" class="btn-circle btn-circle-xs btn-circle-raised btn-circle-tms left carousel-control" role="button" data-slide="prev">
                          <i class="zmdi zmdi-chevron-left"></i>
                        </a>
                        <a href="#carousel-example-generic" class="btn-circle btn-circle-xs btn-circle-raised btn-circle-tms right carousel-control" role="button" data-slide="next">
                          <i class="zmdi zmdi-chevron-right"></i>
                        </a>              
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="ms-hero-bg-primary ms-hero-img-mountain">
                  <h2 class="text-center no-m pt-4 pb-4 color-white index-1"><?php echo $port['Titulo']; ?></h2>
                </div>
                <div class="card-block">
                    <h3 class="color-aqua no-mt">Datos</h3>
                    <ul class="list-unstyled">
                      <li>
                        <strong>T&iacute;tulo:</strong> <?php echo $port['Titulo']; ?>
                      </li>
                      <li>
                        <strong>Categor&iacute;a:</strong> <?php echo $port['Categoria']; ?>
                      </li>
                      <li>
                        <strong>A&ntilde;o:</strong> <?php echo $port['Anio']; ?>
                      </li>
                    </ul>
                    <h3 class="color-aqua">Descripci&oacute;n</h3>
                    <p><?php echo $port['Descripcion']; ?></p>
                </div>
            </div>
        </div>
    </div>
</div>
