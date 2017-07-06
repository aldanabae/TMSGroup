<!-- TOP GENERAL ALERT -->
<div id="message" class="alert alert-info top-general-alert alert-dismissable">
  <span></span>
  <a type="button" class="close">&times;</a>
</div>
<!-- END TOP GENERAL ALERT -->
<?php if(isset($data['alert']) && !empty($data['alert'])) echo $data['alert']; ?>