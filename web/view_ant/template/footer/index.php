<!-- copyright -->
<section id="copyright" class="copyright">
  <div class="container">
    <div class="row">
      <div class="col-sm-6 copy-left">
        Copyright &copy; <a href="http://www.ideacreativa.tk/" target="_blank"><strong>Idea Creativa</strong></a>. Todos los derechos reservados.
      </div><!-- .col-sm-6 -->
      <?php if (isset($data['redes']) && count($data['redes']) > 0) : ?>
        <div class="col-sm-6 copy-right">
          <ul class="social-icon">
            <?php foreach ($data['redes'] as $item) : ?>
              <li><a href="<?php echo $item['URL']; ?>" target="_blank" class="icon-<?php echo $item['Icono']; ?>">
                  <i class="fa fa-<?php echo $item['Icono']; ?>"></i></a></li>
                <?php endforeach; ?>
          </ul>
        </div><!-- .col-sm-6 -->
      <?php endif; ?>
    </div><!-- .row -->
  </div><!-- .container -->
</section><!-- #copyright -->

</div><!-- #page -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<?php echo URL_JS; ?>plugins/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<?php echo URL_JS; ?>bootstrap/js/bootstrap.min.js"></script>
<script src="<?php echo URL_JS; ?>plugins/jquery.justifiedGallery.min.js"></script>
<script src="<?php echo URL_JS; ?>plugins/jquery.magnific-popup.min.js"></script>
<script src="<?php echo URL_JS; ?>plugins/imagesloaded.pkgd.min.js"></script>
<script src="<?php echo URL_JS; ?>plugins/jquery.isotope.min.js"></script>
<script src="<?php echo URL_JS; ?>plugins/masonry.pkgd.min.js"></script>
<script src="<?php echo URL_JS; ?>navigation.js"></script>
<script src="<?php echo URL_JS; ?>skip-link-focus-fix.js"></script>
<script src="<?php echo URL_JS; ?>owlcarousel/owl.carousel.js" type="text/javascript"></script>
<!-- Go to www.addthis.com/dashboard to customize your tools --> 
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-589684dd24526358"></script> 
<script src="<?php echo URL_JS; ?>script.js"></script>
<?php
$url_data = (!empty($data['tabla'])) ? '/' . $data['tabla'] : '';
$url_data .= (isset($data['tabla']) && !empty($data[$data['tabla']]['ID'])) ? '/' . $data[$data['tabla']]['ID'] : '';
?>
<script src="<?php echo URL_WEB . 'tracking' . $url_data; ?>" type="text/javascript"></script>
<?php
if (isset($data['config'])) {
  echo html_entity_decode($data['config']['Analytics']);
}
?>
</body>
</html>