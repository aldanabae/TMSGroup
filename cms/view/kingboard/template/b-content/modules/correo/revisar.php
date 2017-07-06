<div class="main-header">
  <h2><?php echo $main_title; ?></h2>
  <em><?php echo $data['title']; ?></em>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="widget">
      <div class="widget-header">
        <h3><i class="fa fa-edit"></i> <?php echo $data['title']; ?></h3>    
      </div>
      <div class="widget-content">        
        <div class="top-actions">
          <a href="<?php echo URL_CMS . $data['base_url'] . 'responder/'.$data['id']; ?>" class="btn btn-primary">Responder</a>
          <a href="<?php echo URL_CMS . $data['base_url'] . 'reenviar/'.$data['id']; ?>" class="btn btn-info">Reenviar</a>
          <a href="<?php echo URL_CMS . $data['base_url'] . 'listar/1'; ?>" class="btn btn-warning">Volver</a>
        </div>
        <div class="clear"></div>
        <!-- BEGIN TABS NAVS -->
        <form id="form" method="post">
          <div class="col-md-12 box-email">
            <?php include('revisar/index.php'); ?>
          </div>
          <div class="top-actions">
            <a href="<?php echo URL_CMS . $data['base_url'] . 'responder/'.$data['id']; ?>" class="btn btn-primary">Responder</a>
            <a href="<?php echo URL_CMS . $data['base_url'] . 'reenviar/'.$data['id']; ?>" class="btn btn-info">Reenviar</a>
            <a href="<?php echo URL_CMS . $data['base_url'] . 'listar/1'; ?>" class="btn btn-warning">Volver</a>
          </div>
          <div class="clear"></div>
        </form>
        <!-- END TABS NAVS -->
      </div>
    </div><!--/widget-->
  </div><!--/col-md-12-->
</div><!--/row-->