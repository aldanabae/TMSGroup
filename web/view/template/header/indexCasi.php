<?php
//configuracion de Metatags
$config = $data['config'];
$nombre_sitio = $config['Nombre'];

if (isset($data['meta']) && count($data['meta']) > 0) {
  $info = $data['meta'];
  $titulo = $info['Titulo'] . ' - ' . $nombre_sitio;
  $descripcion = $info['Descripcion'] . ' - ' . $nombre_sitio;
} else {
  $titulo = $config['Titulo'];
  $descripcion = $config['Descripcion'] . ' - ' . $nombre_sitio;
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="<?php echo $descripcion; ?>, Mendoza Argentina">
    <meta name="author" content="<?php echo $nombre_sitio; ?>">
    <title><?php echo $titulo; ?></title>

    <!-- BEGIN FONTS FILES -->
    <!-- END FONTS FILES -->
    <script src="<?php echo URL_JS; ?>jquery.js"></script>
    <!-- BEGIN CSS FILES -->
    <link rel="shortcut icon" href="<?php echo URL_IMG; ?>favicon.ico">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="<?php echo URL_CSS; ?>preload.min.css" />
    <link rel="stylesheet" href="<?php echo URL_CSS; ?>plugins.min.css" />
    <link rel="stylesheet" href="<?php echo URL_CSS; ?>style.light-blue-500.min.css" />
    <link rel="stylesheet" href="<?php echo URL_CSS; ?>width-boxed.min.css" id="ms-boxed" disabled="">
    <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- END CSS FILES -->
  </head>
  <body>
    <div id="ms-preload" class="ms-preload">
      <div id="status">
        <div class="spinner">
          <div class="dot1"></div>
          <div class="dot2"></div>
        </div>
      </div>
    </div>
    
    <div class="sb-site-container">
      <header class="ms-header ms-header-primary">
        <div class="container container-full">
          <div class="ms-title">
            <a href="<?php echo URL_WEB; ?>" title="TMS Group" rel="home">
							<img class="img-responsive" src="<?php echo URL_IMG; ?>logo_azul.png">
						</a>
          </div>
          <div class="header-right">
            <div class="share-menu">
              <ul class="share-menu-list">
                <li class="animated fadeInRight animation-delay-3">
                  <a href="https://www.facebook.com/tmsgroupsa/" class="btn-circle btn-facebook">
                    <i class="zmdi zmdi-facebook"></i>
                  </a>
                </li>

                <li class="animated fadeInRight animation-delay-2">
                  <a href="https://twitter.com/tmsgroup_sa" class="btn-circle btn-twitter">
                    <i class="zmdi zmdi-twitter"></i>
                  </a>
                </li>

                <li class="animated fadeInRight animation-delay-1">
                  <a href="https://www.linkedin.com/company-beta/1679521/" class="btn-circle btn-linkedin">
                    <i class="zmdi zmdi-linkedin"></i>
                  </a>
                </li>
              </ul>
              <a href="javascript:void(0)" class="btn-circle btn-circle-tms animated zoomInDown animation-delay-7">
                <i class="zmdi zmdi-share"></i>
              </a>
            </div>
            
            <form class="search-form animated zoomInDown animation-delay-9">
              <input id="search-box" type="text" class="search-input" placeholder="Buscar..." name="q" />
              <label for="search-box">
                <i class="zmdi zmdi-search"></i>
              </label>
            </form>
          </div>
        </div>
      </header>
      <nav class="navbar navbar-static-top yamm ms-navbar ms-navbar-primary">
        <div class="container container-full">
          <div class="navbar-header">
            <a class="navbar-brand" href="<?php echo URL_WEB; ?>">
               <img src="<?php echo URL_IMG; ?>logo_blanco.png"> 
              <!-- <span class="ms-title"><strong>TMS</strong>Group</span> -->
            </a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="dropdown active">
                <a href="<?php echo URL_WEB; ?>" class="dropdown-toggle animated fadeIn animation-delay-4" data-name="home">Home
                </a>
              </li>

              <li class="dropdown">
                <a href="#" class="dropdown-toggle animated fadeIn animation-delay-7" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false" data-name="empresa">Empresa
                  <i class="zmdi zmdi-chevron-down"></i>
                </a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="<?php echo URL_WEB.'empresa'; ?>">
                      <i class="mr-2 fa fa-bookmark"></i> Quienes Somos</a>
                  </li>
                  <li>
                    <a href="<?php echo URL_WEB.'sumate'; ?>">
                      <i class="mr-2 fa fa-user-plus"></i>Trabaja con Nosotros</a>
                  </li>  
                </ul>
              </li>

              <li class="dropdown">
                <a href="#" class="dropdown-toggle animated fadeIn animation-delay-8" data-toggle="dropdown" data-hover="dropdown" role="button" aria-haspopup="true" aria-expanded="false" data-name="servicios">Servicios
                  <i class="zmdi zmdi-chevron-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-left animated-2x animated fadeIn">
                  <li>
                    <a href="<?php echo URL_WEB.'seccion/outsourcing-it'; ?>">
                      <i class="mr-1 zmdi zmdi-accounts zmdi-hc-fw"></i>Outsourcing IT</a>
                  </li>
                  <li>
                    <a href="<?php echo URL_WEB.'seccion/software-factoring'; ?>">
                      <i class="mr-1 zmdi zmdi-laptop-chromebook zmdi-hc-fw"></i>Desarrollo</a>
                  </li>
                  <li>
                    <a href="<?php echo URL_WEB.'seccion/software-factoring'; ?>">
                      <i class="mr-1 zmdi zmdi-smartphone-android zmdi-hc-fw"></i>APPS</a>
                  </li>
                  
                  <li>
                    <a href="<?php echo URL_WEB.'seccion/consultoria-capacitacion'; ?>">
                      <i class="mr-2 fa fa-briefcase"></i> Consultor&iacute;a</a>
                  </li>
                  <li>
                    <a href="<?php echo URL_WEB.'seccion/internet-service-provider'; ?>">
                      <i class="mr-1 zmdi zmdi-wifi-alt zmdi-hc-fw"></i>ISP</a>
                  </li>
                  <li>
                    <a href="<?php echo URL_WEB.'seccion/soporte-tecnologico'; ?>">
                      <i class="mr-1 zmdi zmdi-wrench zmdi-hc-fw"></i>Soporte Tecnol&oacute;gico</a>
                  </li>
                  <li class="dropdown-submenu"><!Submenu-->
                    <a href="javascript:void(0)" class="has_children">
                      <i class="mr-2 fa fa-cloud"></i> Cloud Solutions
                    </a>
                    <ul class="dropdown-menu dropdown-menu-left" style="display: none;">
                      <li>
                        <a href="<?php echo URL_WEB.'seccion/cloud-solutions'; ?>"><strong>SaaS</strong> - Software as a Service</a>
                      </li>
                      <li>
                        <a href="<?php echo URL_WEB.'seccion/cloud-solutions'; ?>"><strong>IaaS</strong> - Infrastructure as a Service</a>
                      </li>
                      <li>
                        <a href="<?php echo URL_WEB.'seccion/cloud-solutions'; ?>"><strong>PaaS</strong> - Platform as a Service</a>
                      </li>
                    </ul>
                  </li>
                  <li class="dropdown-submenu"><!Submenu-->
                    <a href="javascript:void(0)" class="has_children">
                      <i class="mr-2 fa fa-plug"></i> Networking Solutions
                    </a>
                    <ul class="dropdown-menu dropdown-menu-left" style="display: none;">
                      <li>
                        <a href="<?php echo URL_WEB.'seccion/networking-solutions'; ?>">Cableados Estructurados</a>
                      </li>
                      <li>
                        <a href="<?php echo URL_WEB.'seccion/networking-solutions'; ?>">Telefon&iacute;a VoIP</a>
                      </li>
                    </ul>
                </ul>
              </li>

              <li class="dropdown">
                <a href="<?php echo URL_WEB."clientes"; ?>" class="dropdown-toggle animated fadeIn animation-delay-9"  data-name="clientes">Clientes
                </a>
              </li>

              <li class="dropdown">
                <a href="<?php echo URL_WEB.'partners'; ?>" class="dropdown-toggle animated fadeIn animation-delay-10" data-name="partners">Partners
                </a>
              </li>

              <li class="dropdown">
                <a href="<?php echo URL_WEB.'portfolios'; ?>" class="dropdown-toggle animated fadeIn animation-delay-11" data-name="partners">Portfolio
                </a>
              </li>

              <li class="dropdown">
                <a href="<?php echo URL_WEB.'contacto'; ?>" class="dropdown-toggle animated fadeIn animation-delay-12" data-name="contacto">Contacto
                </a>
              </li>
               <!-- <li class="btn-navbar-menu"><a href="javascript:void(0)" class="sb-toggle-left"><i class="zmdi zmdi-menu"></i></a></li>  -->
            </ul>
          </div>
          <!-- navbar-collapse collapse -->
          <!-- <a href="javascript:void(0)" class="sb-toggle-left btn-navbar-menu">
            <i class="zmdi zmdi-menu"></i>
          </a> -->
        </div>
        <!-- container -->
      </nav>
