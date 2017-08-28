<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-7">
            <div class="card card-primary animated fadeInUp animation-delay-7">
                <div class="ms-hero-bg-primary ms-hero-img-mountain">
                  <h2 class="text-center no-m pt-4 pb-4 color-white index-1">&iquest;Sumate a <strong>TMS</strong>Group!</h2>
                </div>
                <div class="card-block">
                  <div id="result" class="text-center color-aqua">
                    <?php echo Session::get('mensaje_ok');?>
                  </div>
                  <form class="form-horizontal" id="contactForm" name="contactForm" enctype="multipart/form-data" action="<?php echo URL_WEB.'sendformSumate'; ?>" method="post">                  
                    <fieldset>
                      <div class="form-group is-empty">
                        <label for="inputNombre" class="col-md-2 control-label">Nombre</label>
                        <div class="col-md-9">
                          <input type="text" class="form-control" id="nombre" name= "nombre" placeholder="Nombre" > </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="inputNombre" class="col-md-2 control-label">Apellido</label>
                        <div class="col-md-9">
                          <input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" > </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="dni" class="col-md-2 control-label">DNI</label>
                        <div class="col-md-9">
                          <input type="number" class="form-control" id="dni" name="dni" placeholder="DNI" > </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="inputEmail" class="col-md-2 control-label">Email</label>
                        <div class="col-md-9">
                          <input type="email" class="form-control" id="email" name="email" placeholder="tu@correo.com" > </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="inputEmail" class="col-md-2 control-label">Celular</label>
                        <div class="col-md-9">
                          <input type="celular" class="form-control" id="celular" name="celular" placeholder="Celular" > </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="inputSubject" class="col-md-2 control-label">Asunto</label>
                        <div class="col-md-9">
                          <input type="text" class="form-control" id="asunto" name="asunto" placeholder="Asunto"> </div>
                      </div>
                      <div class="form-group is-empty">
                        <label for="textArea" class="col-md-2 control-label">Mensaje</label>
                        <div class="col-md-9">
                          <textarea class="form-control" rows="5" id="mensaje" name="mensaje" placeholder="Ingresa un mensaje...(opcional)"></textarea>
                        </div>
                      </div>

                      <div class="form-group is-empty">
                        <label class="col-md-2 control-label">Subir Curriculum</label>
                        <div class="col-md-9">
                          <input type="hidden" name="MAX_FILE_SIZE" value="250000">
                          <input type="file" id="cvitae" name="cvitae" class="file-loading" accept="application/pdf, application/msword">
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
                      <p class="center-block color-tms mb-2 animated fadeInDown animation-delay-6">
                        Somos una empresa comprometida con el medio y en la constante b&uacute;squeda de la vanguardia tecnol&oacute;gica
                        es por &eacute;sto que tus conocimientos, tu experiencia y tus ganas de sumar y mejorar la vida de los personas
                        son intereses fundamentales para nosotros.
                      </p>
                    </br>
                      <p class="center-block color-tms mb-2 animated fadeInDown animation-delay-8">
                        Si tenes ganas de sumarte a un equipo de trabajo distendido y que siempre se apoya en el otro
                        como herramienta b&aacute;sica de progreso y aprendizaje, <strong> escribinos! </strong>
                      </p>
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


<script>
$(document).on('ready', function() {
    $("#cvitae").fileinput({
        language: "es",
        browseLabel: 'Selecionar Archivo...',
        allowedFileExtensions: ["pdf", "doc", "docx"],
    });
});
</script>


