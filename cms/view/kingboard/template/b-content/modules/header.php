<!-- content-wrapper -->
<div class="col-md-10 col-sm-9 content-wrapper">
  <div class="row">
    <div class="col-md-4">
      <?php if(isset($breadcrumb)) echo $breadcrumb; ?>
    </div>
    <?php if(isset($home)) : ?>
    <div class="col-md-8">
      <?php include 'stats.php'; ?>
    </div>
    <?php endif; ?>
  </div>
  