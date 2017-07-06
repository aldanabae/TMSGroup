<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>:: Recortar Imagen ::</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="WebAdmin 3.0 - Administrador Web">
    <meta name="author" content="Oscar Castillo">
    <!-- CSS -->
    <link href="<?php echo CMS_CSS; ?>bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>main.css" rel="stylesheet" type="text/css">
    <link href="<?php echo CMS_CSS; ?>jcrop/jquery.Jcrop.css" rel="stylesheet" type="text/css">
    <!-- Javascript -->
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<?php echo CMS_JS; ?>jcrop/js/jquery.Jcrop.js"></script>
    <?php
    $animateTo = $data['wimage'] . ',' . $data['himage'];
    $url_image = CMS_TEMP . $data['image'];
    ?>
    <!-- The files externs -->
    <style>
      .hold-image {	
        margin-bottom: 10px;
        width:<?php echo (int) $data['new_w']; ?>px;
        height:<?php echo (int) $data['new_h']; ?>px;
      }
      .cont-hint {
        margin-bottom: 15px;
      }
      .f-right {
        float:right;
        margin-top: 15px;
      }
    </style>
    <script type="text/javascript">
      $(function () {
        $('#cropbox').Jcrop({
          allowSelect: false,
          allowResize: false,
          aspectRatio: 0,
          setSelect: [0, 0, <?php echo $animateTo; ?>]
          onSelect: updateCoords
        }, function () {
          this.animateTo([0, 0,<?php echo $animateTo; ?>]);
        });
      });

      function updateCoords(c) {
        $('#x').val(c.x);
        $('#y').val(c.y);
        $('#w').val(c.w);
        $('#h').val(c.h);
      }
    </script>
  </head>
  <body>
    <div class="box-crop col-md-12">
      <div class="widget">
        <div class="widget-header">
          <h3><i class="fa fa-info-circle"></i> Recortar Imagen</h3>
        </div>
        <div class="widget-content">
          <div class="cont-hint">
            <span class="help">
              <b>Importante:</b> Mueva el &aacute;rea de selecci&oacute;n seg&uacute;n su preferencia. Luego haga click en <strong>"Recortar"</strong>
            </span>
          </div>
          <div class="hold-image">
            <img src="<?php echo $url_image; ?>" id="cropbox" />
            <form action="<?php echo URL_CMS . $data['action']; ?>" method="post" id="form">
              <input type="hidden" name="code" value="<?php echo $data['code']; ?>" />
              <input type="hidden" name="img" value="<?php echo $data['image']; ?>" />
              <input type="hidden" name="category" value="<?php echo $data['category']; ?>" />
              <input type="hidden" id="x" name="x" value="0" />
              <input type="hidden" id="y" name="y" value="0" />
              <input type="hidden" id="w" name="w" value="<?php echo $data['new_w']; ?>" />
              <input type="hidden" id="h" name="h" value="<?php echo $data['new_h']; ?>" />
              <div class="f-right">
                <button type="button" class="btn btn-primary">Girar Recorte</button>
                <button type="submit" class="btn btn-primary">Recortar Imagen</button>
              </div>
              <div class="clear"></div>
            </form>
          </div>
          <div class="clear"></div>
        </div>
      </div>
    </div>
  </body>
</html>
