<?php $url_temp = URL_CMS . 'galerias/getvideo'; ?>
<div class="col-md-12">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-cog"></i> Agregar Videos</h3>
    </div>
    <div class="widget-content">	
      <p class="text-video">
        Ingrese la direcci&oacute;n de su video de Youtube, por ejemplo:
        <span>http://www.youtube.com/watch?v=oeZtenPCLVg</span>
      </p>
      <div class="col-md-7 input-group">
        <input type="text" class="form-control" id="url-video" name="url-video">
        <span class="input-group-btn">
          <button onclick="setVideoYoutube('url-video','<?php echo $url_temp; ?>');" class="btn btn-primary" type="button">Agregar</button>
        </span>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>
<div class="col-md-12">
  <div class="widget">
    <div class="widget-header">
      <h3><i class="fa fa-info-circle"></i> Galeria de Videos</h3>
    </div>
    <div class="widget-content">
      <div id="box-gallery" class="row list-group king-gallery">
        <?php include('mod-galvideo.php'); ?>
      </div>
    </div>
  </div>
</div>
