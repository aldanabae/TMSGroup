<?php
$item = $data[$data['tabla']];
$image = URL_GAL . 'seccion/images/IM_' . $item['Imagen'];
?>
<div class="col-md-8">
  <article class="post format-standard hentry">    
    <header class="entry-header">
      <div class="heading-title">
        <h1 class="entry-title"><?php echo $item['Titulo']; ?></h1>
      </div>
    </header><!-- .entry-header -->
    <?php if (!empty($item['Imagen'])) : ?>
      <div class="featured-container">
        <div class="featured-img featured-img-avatar">
          <img src="<?php echo $image; ?>" alt="<?php echo $item['Titulo']; ?>">
        </div>
      </div>
    <?php endif; ?>
    <div class="entry-content">
      <?php echo $item['Detalle']; ?>
    </div><!-- .entry-content -->
  </article><!-- .post -->

  <?php
  if ($item['IsForm'] == 1) :
    include $_rutaFiles['plantillas'] . 'mod-formulario.php';
  endif;
  ?>
</div><!-- .col-md-8 -->