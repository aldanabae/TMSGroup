<?php if (isset($data['ban250x120']) && count($data['ban250x120']) > 0) : ?>
  <!-- partner -->
  <section id="partner" class="section-partner">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <ul class="list-unstyled brand-img">
            <?php
            foreach ($data['ban250x120'] as $item) :
              $url_image = URL_GAL . 'banner_wrap/images/IM_' . $item['Imagen'];
              ?>
              <li>
                <div class="brand-container">
                  <h4><?php echo $item['Titulo']; ?></h4>
                  <a href="<?php echo $item['URL']; ?>" target="_blank">
                    <img src="<?php echo $url_image; ?>" alt="<?php echo $url_image; ?>">
                  </a>
                </div>
              </li>   
              <?php
            endforeach;
            ?>
          </ul>
        </div><!-- .col-md-12 -->
      </div><!-- .row -->
    </div><!-- .container -->
  </section><!-- #partner -->
<?php endif; ?>