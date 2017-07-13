<!-- BEGIN FOOTER PAGE -->
<aside class="ms-footbar">
  <div class="container">
    <div class="row">

      <div class="col-md-4 ms-footer-col" style="height: 442px;">
        <div class="ms-footbar-block">
          <h3 class="ms-footbar-title">Mapa del Sitio</h3>
          <ul class="list-unstyled ms-icon-list three_cols">
            <li>
              <a href="index-2.html">
                <i class="zmdi zmdi-home"></i> Home</a>
            </li>
            <!-- <li>
              <a href="page-blog.html">
                <i class="zmdi zmdi-edit"></i> Blog</a>
            </li>
            <li>
              <a href="page-blog.html">
                <i class="zmdi zmdi-image-o"></i> Portafolio</a>
            </li> -->
            <li>
              <a href="portfolio-filters_sidebar.html">
                <i class="zmdi zmdi-case"></i> Clientes</a>
            </li>
            <!-- <li>
              <a href="page-timeline_left2.html">
                <i class="zmdi zmdi-time"></i> Timeline</a>
            </li>
            <li>
              <a href="page-pricing.html">
                <i class="zmdi zmdi-money"></i> Pricing</a>
            </li> -->
            <li>
              <a href="page-about.html">
                <i class="zmdi zmdi-favorite-outline"></i> Nosotros</a>
            </li>
            <li>
              <a href="page-team2.html">
                <i class="zmdi zmdi-accounts"></i> Equipo</a>
            </li>
            <li>
              <a href="page-services.html">
                <i class="zmdi zmdi-face"></i> Servicios</a>
            </li>
            <!-- <li>
              <a href="page-faq2.html">
                <i class="zmdi zmdi-help"></i> FAQ</a>
            </li>
            <li>
              <a href="page-login2.html">
                <i class="zmdi zmdi-lock"></i> Login</a>
            </li> -->
            <li>
              <a href="page-contact.html">
                <i class="zmdi zmdi-email"></i> Contacto</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="col-md-5 col-sm-7 ms-footer-col ms-footer-alt-color">
        <div class="ms-footbar-block">
          <div class="ms-footbar-block">
            <div class="ms-footbar-title">
              <h3 class="ms-footbar-title text-center mb-2">
                <strong>TMS</strong>Group
              </h3>
            </div>
            
            <div class="ms-footer-media text-center">
              <address class="no-mb">
              <p>
                <i class="color-danger-light zmdi zmdi-pin mr-1"></i> Ricardo Videla 8340, La Puntilla</p>
              <p>
                <i class="color-warning-light zmdi zmdi-map mr-1"></i> Luján de Cuyo, CP 5505</p>
              <p>
                <i class="color-info-light zmdi zmdi-email mr-1"></i>
                <a href="mailto:info@tmsgroup.com.ar">info@tmsgroup.com.ar</a>
              </p>
              <p>
                <i class="color-royal-light zmdi zmdi-phone mr-1"></i>+54 261  </p>
              <p>
              </address>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-3 col-sm-5 ms-footer-col ms-footer-text-right">      
        <div class="ms-footbar-block">
          <h3 class="ms-footbar-title">Redes Sociales</h3>
          <div class="ms-footbar-social">
            <a href="https://www.facebook.com/tmsgroupsa/" class="btn-circle btn-facebook">
              <i class="zmdi zmdi-facebook"></i>
            </a>
            <a href="https://twitter.com/tmsgroup_sa" class="btn-circle btn-twitter">
              <i class="zmdi zmdi-twitter"></i>
            </a>
            <a href="https://www.linkedin.com/company-beta/1679521/" class="btn-circle btn-linkedin">
              <i class="zmdi zmdi-linkedin"></i>
            </a>
          </div>
        </div>
      </div>

    </div>
  </div>
</aside>
<footer class="ms-footer">
  <div class="container">
    <p><strong>Copyright &copy; TMS Group 2017</strong></p>
  </div>
</footer>
<div class="btn-back-top">
  <a href="#" data-scroll id="back-top" class="btn-circle btn-circle-primary btn-circle-sm btn-circle-raised ">
    <i class="zmdi zmdi-long-arrow-up"></i>
  </a>
</div>
</div>


<script src="<?php echo URL_JS; ?>plugins.min.js"></script>
<script src="<?php echo URL_JS; ?>app.min.js"></script>
<script src="<?php echo URL_JS; ?>configurator.min.js"></script>
<script src="<?php echo URL_JS; ?>index.js"></script>
<!-- END FOOTER PAGE -->

<!-- BEGIN JAVASCRIPT FILES -->

<!-- END JAVASCRIPT FILES -->

<!-- BEGIN ADDTHIS --> 
<script type="text/javascript" src="https://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-589684dd24526358"></script> 
<!-- END ADDTHIS --> 
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