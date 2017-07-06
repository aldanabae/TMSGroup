<?php
$posts = $data['postcat'];
$links = $posts['links'];
?>
<form id="paginator" method="post">
  <input type="hidden" id="page" name="page" value="1" />
  <div class="col-md-8">
    <div class="row container-post">
      <?php
      if (isset($posts['posts_cat']) && count($posts['posts_cat']) > 0) :
        foreach ($posts['posts_cat'] as $item) :
          $url = URL_WEB . 'post/' . $item['URL'];
          $url_cat = URL_WEB . 'categorias/' . $item['UrlCat'];
          $url_user = URL_WEB . 'autor/' . $item['UsuarioID'];
          $image = URL_GAL . 'posts/images/IM_' . $item['Imagen'];
          $fecha = Helper::format_date(strtotime($item['Fecha']));
          $tiempo = Helper::diffDateTime($item['Fecha']);
          ?>
          <article class="post format-standard hentry entry-list">
            <div class="row">
              <div class="col-sm-6 home-image">
                <a href="<?php echo $url; ?>">
                  <img src="<?php echo $image; ?>" class="img-responsive" alt="<?php echo $item['Titulo']; ?>">
                </a>                
              </div><!-- .col-sm-6 -->
              <div class="col-sm-6">
                <div class="entry-list-title">
                  <h6 class="entry-cat"><a href="<?php echo $url_cat; ?>"><?php echo $item['Categoria']; ?></a> </h6>
                  <h2 class="entry-title"><a href="<?php echo $url; ?>" rel="bookmark"><?php echo $item['Titulo']; ?></a></h2>
                </div><!-- .entry-list-title -->                

                <div class="entry-summary">
                  <p>
                    <a href="<?php echo $url; ?>" class="more-link">
                      <span class="moretext">Continuar leyendo</span> <span class="screen-reader-text"><?php echo $item['Sumario']; ?></span>
                    </a>
                  </p>
                </div><!-- .entry-summary -->
              </div><!-- .col-# -->
              <div class="col-sm-12">
                <div class="entry-meta">
                  <span class="posted-on">Posteado el <a href="#" rel="bookmark"><time class="entry-date published updated" datetime=""><?php echo $fecha; ?></time></a></span>
                  <span class="byline"> por <span class="author vcard"><a class="url fn n" href="<?php echo $url_user; ?>"><?php echo $item['Usuario']; ?></a></span></span>
                  <span class="reading-estimation"><?php echo $tiempo; ?></span>
                </div><!-- .entry-meta -->
              </div>
            </div><!-- .entry-list -->
          </article><!-- .post -->
          <?php
        endforeach;
      else :
        ?>
        <p class="no-result">Ups! No se encontraron resultados.</p>
      <?php endif; ?> 
      <!-- navigation -->
      <div class="col-sm-12">      
        <nav class="navigation posts-navigation" role="navigation">
          <h2 class="screen-reader-text">Posts navigation</h2>
          <div class="nav-links">
            <div class="pagination"><?php echo $links; ?></div>
            <div class="clear"></div>
          </div>
        </nav><!-- .navigation -->
      </div><!-- .col-sm-12 -->

    </div><!-- .container-post -->
  </div><!-- .col-md-8 -->
</form>
<script>
  function paginar(page) {
    $('#page').val(page);
    $('#paginator').submit();
  }
</script>