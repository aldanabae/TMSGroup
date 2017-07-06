<?php
$tabla = (isset($data['tabla'])) ? $data['tabla'] : '';
$tabla_id = (isset($data['tabla']) && isset($data[$data['tabla']])) ? $data[$data['tabla']]['ID'] : '';
$numero1 = rand(1, 20);
$numero2 = rand(1, 10);
$suma = $numero1 + $numero2;
?>
<div id="comments" class="comments-area post">
  <!-- #comment-nav-above -->
  <h2>Comentarios</h2>
  <?php if (isset($data['comments']) && count($data['comments'])) : ?>  	
    <ol class="comment-list">
      <?php
      $i = 0;
      foreach ($data['comments'] as $comentario):
        $class = ($i % 2 == 0) ? 'odd' : 'even';
        $id = $comentario['ID'];
        $nombre = $comentario['Nombre'];
        $email = $comentario['Email'];
        $mensaje = $comentario['Comentario'];
        $fecha = $comentario['Fecha'];

        if (!empty($fecha)) {
          $nueva_fecha = Helper::format_date(strtotime($fecha));
          $hora = date('H:i', strtotime($fecha));
        }
        ?>
        <li class="comment">
          <article class="comment-body">
            <footer class="comment-meta">
              <div class="comment-author vcard">
                <img src="<?php echo URL_IMG; ?>avatar.png" class="avatar avatar-65 photo" height="65" width="65" alt="<?php echo $nombre; ?>">
                <b class="fn"><?php echo $nombre; ?></b> <span class="says">coment&oacute;:</span>
              </div><!-- .comment-author -->

              <div class="comment-metadata">
                <a href="#">
                  <time datetime=""><?php echo $nueva_fecha; ?> a las <?php echo $hora; ?></time>
                </a>
              </div><!-- .comment-metadata -->
            </footer><!-- .comment-meta -->

            <div class="comment-content">
              <p><?php echo $mensaje; ?></p>
            </div><!-- .comment-content -->   
          </article><!-- .comment-body -->
        </li><!-- #comment-## -->
        <?php
        $i++;
      endforeach;
      ?>
    </ol>
  <?php else : ?>
    <p class="noexist">No existen comentarios para esta noticia. Se vos el primero!</p>
  <?php endif; ?>
</div>
<div id="respond" class="post">
  <h2>D&eacute;janos tu comentario:</h2>
  <form action="#" method="post" id="form-comment">
    <div id="rescomment"></div>
    <input type="hidden" name="savecom" id="savecom" value="1" />
    <input type="hidden" name="tabla" id="tabla" value="<?php echo $tabla; ?>" />
    <input type="hidden" name="tabla_id" id="tabla_id" value="<?php echo $tabla_id; ?>" />
    <input type="hidden" name="add_suma" id="add_suma" value="<?php echo $suma; ?>" />
    <div class="form-group">
      <label for="add_nombre"><span class="required">*</span> Nombre</label>
      <input class="form-control" type="text" name="add_nombre" id="add_nombre" />
    </div>
    <div class="form-group">
      <label for="add_email"><span class="required">*</span> Email (No se mostrar&aacute; en el comentario)</label>
      <input class="form-control" type="text" name="add_email" id="add_email" />
    </div>
    <div class="form-group">
      <label for="add_comment"><span class="required">*</span> Comentario</label>
      <textarea class="form-control" name="add_comment" id="add_comment" cols="100%" rows="7"></textarea>
    </div>
    <div class="form-group send">
      <span><strong>Sume: <?php echo $numero1 . ' + ' . $numero2; ?></strong></span>
      <input class="incap" type="text" name="add_captcha" id="add_captcha" />
      <button onclick="sendComment('<?php echo URL_WEB . 'comments'; ?>');" class="submit" id="sendcom" name="sendcom">Enviar</button>
    </div>
  </form>
</div>
<script>
<!--//
//-->
</script>
