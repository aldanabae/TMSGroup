<!-- featured -->
<?php if (isset($data['notas']) && count($data['notas']) > 0) : ?>
  <div id="featured" class="section-featured">
    <div class="container">
      <div class="owl-carousel row owl-theme">
        <?php
        foreach ($data['notas'] as $item) :
          $url = URL_WEB . 'post/' . $item['URL'];
          $image = URL_GAL . 'posts/images/IM_' . $item['Imagen'];
          ?>
          <div class="">
            <div class="featured-container">
              <div class="featured-img" style="background-image: url('<?php echo $image; ?>');">
                <h3><a href="<?php echo $url; ?>"><?php echo $item['Titulo']; ?></a></h3>
              </div><!-- .featured-img -->
            </div><!-- .featured-container -->
          </div><!-- .col-sm-4 -->
        <?php endforeach; ?>
      </div><!-- .row -->
    </div><!-- .container -->
  </div><!-- #featured -->
<?php endif; ?>
