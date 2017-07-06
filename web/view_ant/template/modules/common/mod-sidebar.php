<div class="col-md-4">
  <?php if (isset($data['redes']) && count($data['redes']) > 0) : ?>
    <div class="box-social">
      <ul class="social-icon">
        <?php foreach ($data['redes'] as $item) : ?>
          <li><a href="<?php echo $item['URL']; ?>" target="_blank" class="icon-<?php echo $item['Icono']; ?>">
              <i class="fa fa-<?php echo $item['Icono']; ?>"></i></a></li>
        <?php endforeach; ?>
      </ul>
    </div><!-- .col-sm-6 -->
  <?php endif; ?>
  <section class="widget widget_search">
    <form role="search" method="post" class="search-form" action="<?php echo URL_WEB . 'busqueda'; ?>">
      <label>
        <span class="screen-reader-text">B&uacute;squeda:</span>
        <input type="search" class="search-field" placeholder="B&uacute;squeda…" name="search" title="B&uacute;squeda:">
      </label>
      <input type="submit" class="search-submit" value="Buscar">
    </form><!-- search-form -->
  </section><!-- .widget_search -->

  <section class="widget danish_widget_about">
    <iframe src="https://www.youtube.com/embed/DHzG76txJHU?ecver=2" height="300" frameborder="0" allowfullscreen></iframe>
  </section><!-- .danish_widget_about -->

  <section class="widget widget_archive">
    <?php include 'publi-1.php'; ?>
  </section><!-- .widget_archive -->
  
  <section class="widget widget_categories">
    <?php include 'mod-facebook.php'; ?>
    </ul>
  </section><!-- .widget_categories -->
  
  <section class="widget widget_archive">
    <?php include 'publi-2.php'; ?>
  </section><!-- .widget_archive -->

  <section class="widget danish_widget_popular_entries side">
    <h2 class="widget-title">Posts Populares</h2>
    <?php if (isset($data['postspopu']) && count($data['postspopu'])) : ?>
      <ul>
        <?php
        foreach ($data['postspopu'] as $item) :
          $url = URL_WEB . 'post/' . $item['URL'];
          $image = URL_GAL . 'posts/thumbs/TH_' . $item['Imagen'];
          $fecha = Helper::format_date(strtotime($item['Fecha']));
          ?>
          <li>
            <div class="popular-entry-container">
              <div class="entry-image">
                <img src="<?php echo $image; ?>" alt="<?php echo $item['Titulo']; ?>">
              </div><!-- .entry-image -->
              <div class="entry-content">
                <h4 class="entry-title">
                  <a href="<?php echo $url; ?>" rel="bookmark"><?php echo $item['Titulo']; ?></a>
                </h4>
                <span class="entry-category">
                  <a href="<?php echo $url_cat; ?>"><?php echo $item['Categoria']; ?></a>
                </span>
                <span class="entry-datetime"><?php echo $fecha; ?></span>
              </div><!-- .entry-content -->
            </div><!-- .popular-entry-container -->
          </li>
        <?php endforeach; ?>
      </ul>
    <?php endif; ?>
  </section><!-- .danish_widget_popular_entries -->  

  <section class="widget widget_archive">
    <?php include 'publi-3.php'; ?>
  </section><!-- .widget_archive -->
  
  <section class="widget widget_archive">
    <?php include 'publi-4.php'; ?>
  </section><!-- .widget_archive -->
  
  <section class="widget widget_archive">
    <?php include 'publi-5.php'; ?>
  </section><!-- .widget_archive -->

</div><!-- .col-md-4 -->