<div class="panel-body table-responsive">
  <?php if (isset($data['heads']) && count($data['heads'])) : ?>
    <table class="table table-bordered table-striped" id="list-table">
      <thead>
        <tr class="odd">
          <td><span class="search"><i class="fa fa-search"></i></span></td>
          <?php foreach ($data['heads'] as $head) : ?>
            <td><input type="text" class="table-control" /></td>
          <?php endforeach; ?>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <th width="1" class="nosort center" data-align="center">
            <input type="checkbox" id="check_all" onclick="checker(this);" />
          </th>
          <?php foreach ($data['heads'] as $head) : ?>
            <th class="<?php echo $head['sort']; ?>" data-align="<?php echo $head['align']; ?>"><?php echo $head['title']; ?></th>
          <?php endforeach; ?>
          <th class="nosort center" data-align="center" width="130">Acci&oacute;n</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td colspan="<?php echo count($data['heads']) + 2; ?>" class="dataTables_empty">Cargando datos del Servidor...</td>
        </tr>
      </tbody>
    </table>
  <?php endif; ?>
</div>

