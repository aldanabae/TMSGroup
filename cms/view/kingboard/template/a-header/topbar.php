<!-- TOP BAR -->
<div class="top-bar">
  <div class="container">
    <div class="row">
      <!-- logo -->
      <div class="col-md-2 col-sm-3 logo">
        <a href="<?php echo URL_CMS; ?>">
          <img src="<?php echo CMS_IMG; ?>webadmin-logo-white.png" alt="WebAdmin 3.0 - Administrador Web" />
        </a>
        <h1 class="sr-only">WebAdmin 3.0 - Administrador Web</h1>
      </div>
      <!-- end logo -->
      <div class="col-md-10 col-sm-9">
        <div class="row">
          <div class="col-md-3">
            <!-- search box -->
            <div class="input-group searchbox"></div>
            <!-- end search box -->
          </div>
          <div class="col-md-9">
            <div class="top-bar-right">
              <!-- responsive menu bar icon -->
              <a href="#" class="hidden-sm hidden-md hidden-lg main-nav-toggle"><i class="fa fa-bars"></i></a>
              <!-- end responsive menu bar icon -->
              <div class="notifications">
                <ul>
                  <!-- notification: inbox -->
                  <li class="notification-item inbox">
                    <?php include 'emails.php'; ?>
                  </li>
                  <!-- end notification: inbox -->
                  <!-- notification: general -->
                  <li class="notification-item general">
                    <?php include 'notifications.php'; ?>
                  </li>
                  <!-- end notification: general -->
                </ul>
              </div>
              <!-- logged user and the menu -->
              <div class="logged-user">
                <?php include 'perfil.php'; ?>
              </div>
              <!-- end logged user and the menu -->
            </div>
            <!-- /top-bar-right -->
          </div>
        </div>
        <!-- /row -->
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /topbar -->