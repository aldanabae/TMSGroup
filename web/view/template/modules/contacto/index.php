<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-7">
            <div class="card card-primary animated fadeInUp animation-delay-7">
                <div class="ms-hero-bg-primary ms-hero-img-mountain">
                  <h2 class="text-center no-m pt-4 pb-4 color-white index-1">Consulta</h2>
                </div>
                <div class="card-block">
                  <div id="result"></div>
                  <form id="contactForm" class="form-horizontal" name="contactForm" action="<?php echo URL_WEB.'sendformContacto'; ?>" method="post">
                    <input type="hidden" name="enviar" value="1">
                    <fieldset>
                      <div class="form-group is-empty">
                        <label for="inputNombre" class="col-md-2 control-label">Nombre</label>
                        <div class="col-md-9">
                          <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre"> </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="inputEmail" class="col-md-2 control-label">Email</label>
                        <div class="col-md-9">
                          <input type="email" class="form-control" id="email" name="email" placeholder="Email"> </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="inputSubject" class="col-md-2 control-label">Asunto</label>
                        <div class="col-md-9">
                          <input type="text" class="form-control" id="asunto" name="asunto" placeholder="Asunto"> </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="textArea" class="col-md-2 control-label">Consulta</label>
                        <div class="col-md-9">
                          <textarea class="form-control" rows="5" id="consulta" name="consulta" placeholder="Tu mensaje..."></textarea>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-md-9 col-md-offset-2">
                          <button type="submit" class="btn btn-raised btn-aqua">Enviar</button>
                          <button type="button" class="btn btn-danger">Cancelar</button>
                        </div>
                      </div>
                    </fieldset>
                  </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-5">
            <div class="card card-primary animated fadeInUp animation-delay-7">
                <div class="card-block">
                    <div class="text-center mb-2">
                      <h3 class="ms-footbar-title text-center mb-2">
                      <strong>TMS</strong>Group
                      </h3>
                    </div>
                    <address class="no-mb">
                      <p>
                        <i class="color-danger-light zmdi zmdi-pin mr-1"></i> Ricardo Videla 8340, La Puntilla</p>
                      <p>
                        <i class="color-warning-light zmdi zmdi-map mr-1"></i> Luj&aacute;n de Cuyo, CP 5505</p>
                      <p>
                        <i class="color-info-light zmdi zmdi-email mr-1"></i>
                        <a href="mailto:info@tmsgroup.com.ar">info@tmsgroup.com.ar</a>
                      </p>
                      <p>
                        <i class="color-royal-light zmdi zmdi-phone mr-1"></i>+54 261 5244759 </p>
                    </address>
                </div>
            </div>
            <div class="card card-primary animated fadeInUp animation-delay-7">
                <div class="card-header">
                  <h3 class="card-title">
                    <i class="zmdi zmdi-map"></i>Ubicaci&oacute;n</h3>
                </div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3347.662706696106!2d-68.8569629846902!3d-32.95991348091724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x967e0bad85709df5%3A0xe7458586d1fab31b!2sVidela+R.+8340%2C+Luj%C3%A1n+de+Cuyo%2C+Mendoza!5e0!3m2!1ses!2sar!4v1501703039666" width="100%" height="340" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
<!--//
$(document).ready(function() {
  $('#contactForm').submit(function() {
    var user_name       = $('#nombre').val();
    var user_email      = $('#email').val();
    var user_phone      = $('#asunto').val();
    var user_message    = $('#consulta').val();
    
    var output = '<div class="error color-danger text-center">Complete los campos obligatorios!</div>';

    var proceed = true;    

    if(user_name == '') {
      $('#nombre').focus();     
      $("#result").hide().html(output).slideDown();
      proceed = false;
      return false;
    }
    if(user_email == '') {
      $('#email').focus();     
      $("#result").hide().html(output).slideDown();
      proceed = false;
      return false;
    }
    if(user_phone == '') {
      $('#asunto').focus();     
      $("#result").hide().html(output).slideDown();
      proceed = false;
      return false;
    }    
    if(user_message == '') {
      $('#consulta').focus();     
      $("#result").hide().html(output).slideDown();
      proceed = false;
      return false;
    }

    if(proceed) {
      $.ajax({
        type: 'POST',
        url: "<?php echo URL_WEB.'sendformContacto'; ?>",
        data: $(this).serialize(),
        success: function(response) {
          var isJson = true;        
          var clean = true; 

          try {
            data = $.parseJSON(response); 
          } catch(e) {
            isJson = false;
            output = '<div class="error color-danger text-center">No se pudo enviar el correo. Por favor, int&eacute;ntelo m&aacute;s tarde!</div>';
          }       
          if(isJson) {
            if(data.type == 'error') {
              output = '<div class="error">'+data.text+'</div>';
              clean = false;
            } else {
              output = '<div class="success">'+data.text+'</div>';
            }
          }
          if(clean) {
            $('input').val('');    
            $('textarea').val('');          
          }
          $("#result").hide().html(output).slideDown();
        }
      });     
    }
    return false;
  });

  $('#contactForm input, #contactForm textarea').keyup(function() {
    $('#contactForm input, #contactForm textarea').css('border-color','');
    if($('#result').is(':visible')) $('#result').slideUp();
  });
});
//-->
</script>