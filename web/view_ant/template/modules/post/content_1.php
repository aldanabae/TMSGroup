<?php
$item = $data[$data['tabla']];
$url = URL_WEB . 'post/' . $item['URL'];
$url_cat = URL_WEB . 'categorias/' . $item['UrlCat'];
$image = URL_GAL . 'posts/images/IM_' . $item['Imagen'];
$fecha = Helper::format_date(strtotime($item['Fecha']));
$tiempo = Helper::diffDateTime($item['Fecha']);
$etiquetas = explode(',', $data['meta']['Keywords']);
?>
<div class="col-md-8">
  <article class="post format-standard hentry">    
    <header class="entry-header">
      <div class="heading-title">
        <h1 class="entry-title"><?php echo $item['Titulo']; ?></h1>
      </div>
      <div class="entry-meta">
        <span class="posted-on">Posteado el <?php echo $fecha; ?></span>
        <span class="byline"> por <span class="author vcard">
            <a class="url fn n" href="#"><?php echo $item['Usuario']; ?></a></span>
        </span>
        <span class="reading-estimation">Hace <?php echo $tiempo; ?></span>
        <span class="reading-estimation"><?php echo $item['Comments']; ?> Comentarios</span>
      </div><!-- .entry-meta -->
    </header><!-- .entry-header -->    
    <?php
    if (!empty($data['galeria']) && count($data['galeria']) > 0) :
      if ((!empty($item['Imagen']))) {
        $addImagen = array(
            'Titulo' => $item['TextImage'],
            'Imagen' => $item['Imagen']
        );
        array_unshift($data['galeria'], $addImagen);
      }
      ?>
      <div id="portfolio-gallery" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators" style="display:none;">
          <?php
          for ($i = 0; $i < count($data['galeria']); $i++) :
            $active = ($i == 0) ? 'active' : '';
            ?>
            <li data-target="#portfolio-gallery" data-slide-to="<?php echo $i; ?>" class="<?php echo $active; ?>"></li>
          <?php endfor; ?>
        </ol>
        <div class="carousel-inner" role="listbox">
          <?php
          $i = 0;
          foreach ($data['galeria'] as $gal) :
            $active = ($i == 0) ? 'active' : '';
            $url_image = URL_GAL . 'posts/images/IM_' . $gal['Imagen'];
            ?>
            <div class="item <?php echo $active; ?>">
              <img src="<?php echo $url_image; ?>" alt="<?php echo $gal['Titulo']; ?>" height="415">
            </div>
            <?php
            $i++;
          endforeach;
          ?>
        </div>
        <!-- Carousel controls -->
        <a class="carousel-control left" href="#portfolio-gallery" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="carousel-control right" href="#portfolio-gallery" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    <?php elseif (!empty($item['Imagen'])) : ?>
      <div class="featured-container">
        <div class="featured-img featured-img-avatar">
          <img src="<?php echo $image; ?>" alt="<?php echo $item['Titulo']; ?>">
        </div>
        <?php if (!empty($item['TextImage'])) : ?>
          <div class="text-description">
            <p><?php echo $item['TextImage']; ?></p>
          </div>
        <?php endif; ?>
      </div>
    <?php endif; ?>

    <div class="entry-content">
      <?php echo $item['Detalle']; ?>
    </div><!-- .entry-content -->

    <?php if (!empty($item['Video'])) : ?>
      <div class="featured-container">
        <div class="featured-img featured-img-avatar">
          <iframe height="340" src="//www.youtube.com/embed/<?php echo $item['Video']; ?>" frameborder="0" allowfullscreen></iframe>
        </div>
        <?php if (!empty($item['TextVideo'])) : ?>
          <div class="text-description">
            <p><?php echo $item['TextVideo']; ?></p>
          </div>
        <?php endif; ?>
      </div>
    <?php endif; ?>

    <!-- Inicio Parrafo -->
    <?php
    if (isset($data['parrafo']) && count($data['parrafo']) > 0) :
      foreach ($data['parrafo'] as $parrafo) :
        $image = URL_GAL . 'posts/images/IM_' . $parrafo['Imagen'];
        ?>
        <div class="heading-subtitle">
          <h2><?php echo $parrafo['Titulo']; ?></h2>
        </div>
        <?php if (!empty($parrafo['Imagen'])) : ?>
          <div class="featured-container">
            <div class="featured-img featured-img-avatar">
              <img src="<?php echo $image; ?>" alt="<?php echo $parrafo['Titulo']; ?>">
            </div>
            <?php if (!empty($parrafo['TextImage'])) : ?>
              <div class="text-description">
                <p><?php echo $parrafo['TextImage']; ?></p>
              </div>
            <?php endif; ?>
          </div>
        <?php endif; ?>

        <div class="entry-content">
          <?php echo $parrafo['Detalle']; ?>
        </div><!-- .entry-content -->

        <?php if (!empty($parrafo['Video'])) : ?>
          <div class="featured-container">
            <div class="featured-img featured-img-avatar">
              <iframe height="340" src="//www.youtube.com/embed/<?php echo $parrafo['Video']; ?>" frameborder="0" allowfullscreen></iframe>
            </div>
            <?php if (!empty($parrafo['TextVideo'])) : ?>
              <div class="text-description">
                <p><?php echo $parrafo['TextVideo']; ?></p>
              </div>
            <?php endif; ?>
          </div>

        <?php endif; ?>
        <?php
      endforeach;
    endif;
    ?>    
    <!-- Fin Parrafo -->

    <div class="share">
      <p>Compart&iacute; esta nota:</p>
    </div>
    <!-- Go to www.addthis.com/dashboard to customize your tools --> 
    <div class="addthis_inline_share_toolbox"></div>
    <footer class="entry-footer">
      <span class="cat-links">Posteado en 
        <a href="<?php echo $url_cat; ?>"><?php echo $item['Categoria']; ?></a>
        <span class="tags-links">Etiquetas 
          <?php
          $i = 0;
          foreach ($etiquetas as $tag) :
            ?>
            <form id="form<?php echo $i; ?>" method="post" action="<?php echo URL_WEB . 'busqueda'; ?>">
              <input type="hidden" name="search" value="<?php echo $tag; ?>">
              <a href="javascript:;" onclick="$('#form<?php echo $i; ?>').submit();"><?php echo $tag; ?></a> 
            </form>
            <?php
            if ($i < count($etiquetas) - 1)
              echo ',';
            $i++;
          endforeach;
          ?>
        </span>
    </footer><!-- .entry-footer -->
  </article><!-- .post -->

  <?php
  $user = $data['info_user'];
  $avatar = URL_GAL . 'sys_user/thumbs/TH_' . $user['Imagen'];
  ?>
  <div class="entry-author-bio">
    <div class="author-bio-avatar">
      <img alt="avatar" src="<?php echo $avatar; ?>" class="avatar avatar-80 photo" height="80" width="80">
    </div><!-- .author-bio-avatar -->
    <div class="author-bio-description">
      <h4><a href="archive.html" rel="author"><?php echo $user['Nombre']; ?></a></h4>
      <p><?php echo $user['Descripcion']; ?></p>
    </div><!-- .author-bio-description -->
  </div><!-- .entry-author-bio -->
  <?php
  include $_rutaFiles['plantillas'] . 'mod-comments.php';
  ?>
</div><!-- .col-md-8 -->