<article class="post format-standard hentry">
  <div class="row">
    <div class="col-sm-12">
      <div id="alert-msg"></div>
      <form id="form-contact" class="comment-form" method="post">
        <input type="hidden" id="enviar" name="enviar" value="1" />
        <div class="row">
          <div class="col-md-12 col-sm-12">
            <div class="form-group">
              <label for="nombre">Nombre y Apellido <span class="required">*</span></label>
              <input type="text" id="nombre" name="nombre" class="form-control" placeholder="Ingrese su nombre">
            </div>
            <div class="form-group">
              <label for="email">Correo Electr&oacute;nico <span class="required">*</span></label>
              <input type="email" id="email" name="email" class="form-control" placeholder="Ingrese su email">
            </div>
            <div class="form-group">
              <label for="telefono">Tel&eacute;fono <span class="required">*</span></label>
              <input type="text" id="telefono" class="form-control" placeholder="Ingrese su tel&eacute;fono">          
            </div>
            <div class="form-group">
              <label for="consulta">Consulta <span class="required">*</span></label>
              <textarea id="consulta" class="form-control" rows="5" placeholder="Ingrese su consulta"></textarea>
            </div>
            <div class="form-group text-right">
              <input type="submit" class="btn btn-danish btn-lg btn-block">
            </div>
          </div><!-- .col-md-12 -->
        </div><!-- .row -->
      </form><!-- .comment-form -->
    </div><!-- .col-sm-9 -->
  </div><!-- .row -->
</article>
