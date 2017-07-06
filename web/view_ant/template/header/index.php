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
    <meta name="keywords" content="Anime y Manga, Entrevistas, Videojuegos, Comics, Series y Peliculas">
    <meta name="author" content="<?php echo $nombre_sitio; ?>">
    <title><?php echo $titulo; ?></title>

    <!-- Bootstrap -->
    <link href="<?php echo URL_JS; ?>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Noto+Serif:400italic,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,600' rel='stylesheet' type='text/css'>
    <link href="<?php echo URL_CSS; ?>font-awesome.min.css" rel="stylesheet">
    <link href="<?php echo URL_CSS; ?>magnific-popup.css" rel="stylesheet">
    <link href="<?php echo URL_CSS; ?>style.min.css" rel="stylesheet">
    <link href="<?php echo URL_CSS; ?>skin/skin-skyblue.min.css" rel="stylesheet">
    <link href="<?php echo URL_JS; ?>owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" type="text/css"/>
    <link href="<?php echo URL_JS; ?>owlcarousel/assets/owl.theme.default.css" rel="stylesheet" type="text/css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="<?php echo URL_JS; ?>html5shiv.min.js"></script>
      <script src="<?php echo URL_JS; ?>respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="home blog">
    <div id="page" class="site">
      <a class="skip-link screen-reader-text" href="#content">Skip to content</a>

      <div class="site-header-affix-wrapper">
        <header id="masthead" class="site-header header-dark" role="banner">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="site-branding">
                  <!-- //site-title when you use logo image.
                  <h1 class="site-title title-image"><a href="index.html" rel="home"><img src="assets/img/danish-image-logo.png" alt="Danish."></a></h1>
                  -->
                  <h1 class="site-title">
                    <a href="<?php echo URL_WEB; ?>" rel="home">
                      <img src="<?php echo URL_IMG; ?>logo.png" alt=""/>
                    </a>
                  </h1>
                  <!-- //site-description if you wanna use it.
                  <p class="site-description">Traveler and Young Designer //</p>
                  -->
                </div><!-- .site-branding -->
              </div><!-- .col-sm-4 -->

              <div class="col-sm-9">
                <nav id="site-navigation" class="main-navigation" role="navigation">
                  <button class="menu-toggle" aria-controls="primary-menu" aria-expanded="false"><i class="fa fa-align-left"></i><span class="sr-only">Primary Menu</span></button>

                  <div class="menu-testing-menu-container">
                    <ul id="primary-menu" class="menu nav-menu" aria-expanded="false">
                      <?php
                      foreach ($data['menu_top'] as $item) :
                        $url = URL_WEB . 'seccion/' . $item['URL'];
                        if ($item['ID'] != 2) :
                          ?>
                          <li class="menu-item"><a href="<?php echo $url; ?>"><?php echo $item['MenuTop']; ?></a></li>
                        <?php else : ?>
                          <li class="menu-item menu-item-has-children" aria-haspopup="true"><a href="#"><?php echo $item['MenuTop']; ?></a>
                            <?php if (isset($data['categorias']) && count($data['categorias']) > 0) : ?>
                              <ul class="sub-menu">
                                <?php
                                foreach ($data['categorias'] as $submenu) :
                                  $url_cat = URL_WEB . 'categorias/' . $submenu['URL'];
                                  ?>
                                  <li class="menu-item"><a href="<?php echo $url_cat; ?>"><?php echo $submenu['Nombre']; ?></a></li>
                                <?php endforeach; ?>
                              </ul>
                            <?php endif; ?>
                          </li>
                        <?php endif; ?>
                      <?php endforeach; ?>
                    </ul>
                  </div>
                </nav><!-- #site-navigation -->
              </div><!-- .col-sm-8 -->
            </div><!-- .row -->
          </div><!-- .container -->
        </header><!-- #masthead -->
      </div><!-- .site-header-affix-wrapper -->
      <?php
      $cat = (isset($data['info_cat'])) ? $data['info_cat'] : false;
      ?>      
      <!-- #header -->
      <section id="header" class="heading" style="background-image: url('<?php echo URL_IMG; ?>backlogo.jpg');">
        <?php if($cat) : ?>
        <div class="container">
          <div class="row">
            <div class="col-md-8 col-md-offset-2">
              <div class="title-desc">
                <h2><?php echo $cat['Nombre']; ?></h2>
              </div>
            </div>
          </div>
        </div>
        <?php endif; ?>
        <div class="overlay"></div>        
      </section><!-- #header -->
