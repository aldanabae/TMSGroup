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
          <a class="btn btn-primary" href="<?php echo URL_CMS . $data['base_url'] . 'insertar'; ?>">
            <i class="icon icon-plus icon-white"></i> Nuevo Registro                                            
          </a>
          <a class="btn btn-danger" onclick="validate('form-list', 'accion', 'delete');">
            <i class="icon icon-trash icon-white"></i> Eliminar
          </a>
        </div>        
        <form id="form-list" method="post" action="">
          <input type="hidden" name="listar" value="1" />
          <input type="hidden" id="accion" name="accion" />
          <?php include('listar/index.php'); ?>
        </form>
      </div>
    </div><!--/widget-->			
  </div><!--/col-md-12-->			
</div><!--/row-->
<script type="text/javascript">
  var asInitVals = new Array();
  var aTableName = 'list-table';
  var aUrlFilter = "<?php echo URL_CMS . $data['base_url'] . 'filter'; ?>";
  var aUrlEdit = "<?php echo URL_CMS . $data['base_url'] . 'editable'; ?>";

  $(document).ready(function () {
    getTableList(aTableName, asInitVals, aUrlFilter, aUrlEdit);
    $('.dataTables_filter').prepend($('.top-actions'));
  });
</script>