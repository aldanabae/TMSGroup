<!DOCTYPE html>
<html lang="es" class="no-js">
  <head>
    <title>Escritorio | WebAdmin 3.0 - Administrador Web</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="description" content="Kingboard - Bootstrap Admin Dashboard Theme">
    <meta name="author" content="Oscar Castillo - Desarrollo Webline">
    <!-- CSS -->
    <link href="<?php echo CMS_CSS; ?>bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>chosen/chosen.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>chosen/chosen.bootstrap.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>fancybox/jquery.fancybox.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>treetable/css/jquery.treetable.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>jqueryui/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <link href="<?php echo CMS_CSS; ?>jquery.tagmanager.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>bootstrap-timepicker.css" rel="stylesheet" type="text/css"/>
    <link href="<?php echo CMS_CSS; ?>main.css" rel="stylesheet" type="text/css">
    <!-- Fav and touch icons -->
    <link href="<?php echo CMS_IMG; ?>ico/webadmin-favicon144x144.png" rel="apple-touch-icon-precomposed" sizes="144x144">
    <link href="<?php echo CMS_IMG; ?>ico/webadmin-favicon114x114.png" rel="apple-touch-icon-precomposed" sizes="114x114">
    <link href="<?php echo CMS_IMG; ?>ico/webadmin-favicon72x72.png" rel="apple-touch-icon-precomposed" sizes="72x72">
    <link href="<?php echo CMS_IMG; ?>ico/webadmin-favicon57x57.png" rel="apple-touch-icon-precomposed" sizes="57x57">
    <link href="<?php echo CMS_IMG; ?>ico/favicon.png" rel="shortcut icon">
    <!-- Javascript -->
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>bootstrap.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>modernizr.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>king-common.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>stat/jquery.easypiechart.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>raphael-2.1.0.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>stat/flot/jquery.flot.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>stat/flot/jquery.flot.resize.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>stat/flot/jquery.flot.time.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>stat/flot/jquery.flot.pie.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>stat/flot/jquery.flot.tooltip.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>datatable/jquery.dataTables.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>datatable/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery.mapael.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>maps/usa_states.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>king-chart-stat.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>king-table.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>king-components.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>ajaxupload/js/AjaxUpload.2.0.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery.chosen.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>fancybox/source/jquery.fancybox.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>fancybox/source/helpers/jquery.fancybox-media.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery.swfobject.1-1-1.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>dropzone.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery.charcount.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery.treetable.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery-ui-1.8.16.custom.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>bootstrap-timepicker.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery.tabs.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>tablednd/js/jquery.tablednd.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>tagmanager/jquery.tagmanager.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>main.js"></script>
  </head>
  <?php if ($route['controller'] != 'login') : ?>
    <body class="dashboard">
      <!-- WRAPPER -->
      <div class="wrapper">
        <?php
        include 'alerts.php';
        include 'topbar.php';
      else :
        ?>
        <body>
          <!-- WRAPPER -->
          <div class="full-page-wrapper page-login text-center">
          <?php endif; ?>