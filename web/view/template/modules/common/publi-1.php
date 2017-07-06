<?php if (isset($data['ban300x250'][0])) : ?>
  <div class="widget-container video-widget">
    <?php
    $banner = $data['ban300x250'][0];
    $formato = (isset($banner['Formato'])) ? $banner['Formato'] : '';
    $codigo = (isset($banner['Codigo'])) ? html_entity_decode($banner['Codigo']) : '';
    $imagen = (isset($banner['Imagen'])) ? URL_GAL . 'banner_wrap/images/IM_' . $banner['Imagen'] : '';
    $url = (isset($banner['URL'])) ? $banner['URL'] : '#';
    $target = (isset($banner['Target'])) ? $banner['Target'] : '_self';
    
    switch ($formato) :
      case 1:
        ?>
        <a href="<?php echo $url; ?>" target="<?php echo $target; ?>">
          <img src="<?php echo $imagen; ?>" alt="<?php echo $banner['Titulo']; ?>" />
        </a>
        <?php
        break;
      case 3:
        echo $codigo;
        break;
    endswitch;
    ?>		    
  </div>
<?php endif; ?>