<div class="container">
    <div class="row">
        <div class="col-lg-8 col-md-7">
            <div class="card card-primary animated fadeInUp animation-delay-7">
                <div class="ms-hero-bg-primary ms-hero-img-mountain">
                  <h2 class="text-center no-m pt-4 pb-4 color-white index-1">¡Sumate a <strong>TMS</strong>Group!</h2>
                </div>
                <div class="card-block">
                  <!-- <div id="result"></div> -->
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
                      <div>  
                        <label for="adjuntar archivo" class="col-md-2 control-label color-tms" style="font-size:18px;">Subir curriculum</label>
                        <input type="hidden" name="MAX_FILE_SIZE" value="250000" />
                        <input type="file" name="cvitae" id="cvitae" >
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
                        Somos una empresa comprometida con el medio y en la constante búsqueda de la vanguardia tecnológica
                        es por ésto que tus conocimientos, tu experiencia y tus ganas de sumar y mejorar la vida de los personas
                        son intereses fundamentales para nosotros.
                      </p>
                    </br>
                      <p class="center-block color-tms mb-2 animated fadeInDown animation-delay-8">
                        Si tenes ganas de sumarte a un equipo de trabajo distendido y que siempre se apoya en el otro
                        como herramienta básica de progreso y aprendizaje, <strong> escribinos! </stong>
                      </p>
                    </address>
                </div>
            </div>

            <div class="card card-primary animated fadeInUp animation-delay-7">
                <div class="card-header">
                  <h3 class="card-title">
                    <i class="zmdi zmdi-map"></i>Ubicación</h3>
                </div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3347.662706696106!2d-68.8569629846902!3d-32.95991348091724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x967e0bad85709df5%3A0xe7458586d1fab31b!2sVidela+R.+8340%2C+Luj%C3%A1n+de+Cuyo%2C+Mendoza!5e0!3m2!1ses!2sar!4v1501703039666" width="100%" height="340" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>



 <script type="text/javascript">

// $(document).ready(function() {
//   $('#contactForm').submit(function() {
//     var user_name       = $('#nombre').val();
//     var user_apellido   = $('#apellido').val();
//     var user_dni        = $('#dni').val();
//     var user_celular    = $('#celular').val();
//     var user_email      = $('#email').val();
//     var user_asunto      = $('#asunto').val();
//     var user_message    = $('#mensaje').val();
    
//     var output = '<div class="error color-danger text-center">Complete los campos obligatorios!</div>';

//     var proceed = true;    

//     if(user_name == '') {
//       $('#nombre').focus();     
//       $("#result").hide().html(output).slideDown();
//       proceed = false;
//       return false;
//     }
//     if(user_apellido == '') {
//       $('#apellido').focus();     
//       $("#result").hide().html(output).slideDown();
//       proceed = false;
//       return false;
//     }
//     if(user_dni == '') {
//       $('#dni').focus();     
//       $("#result").hide().html(output).slideDown();
//       proceed = false;
//       return false;
//     }
//     if(user_celular == '') {
//       $('#celular').focus();     
//       $("#result").hide().html(output).slideDown();
//       proceed = false;
//       return false;
//     }
//     if(user_email == '') {
//       $('#email').focus();     
//       $("#result").hide().html(output).slideDown();
//       proceed = false;
//       return false;
//     }
//     if(user_asunto == '') {
//       $('#asunto').focus();     
//       $("#result").hide().html(output).slideDown();
//       proceed = false;
//       return false;
//     }    
//     if(user_message == '') {
//       $('#mensaje').focus();     
//       $("#result").hide().html(output).slideDown();
//       proceed = false;
//       return false;
//     }

//     if(proceed) {
//       $.ajax({
//         type: 'POST',
//         url: "<?php echo URL_WEB.'sendformSumate'; ?>",
//         data: $(this).serialize(),
//         success: function(response) {
//           var isJson = true;        
//           var clean = true; 

//           try {
//             data = $.parseJSON(response); 
//           } catch(e) {
//             isJson = false;
//             output = '<div class="error color-danger text-center">No se pudo enviar el correo. Por favor, int&eacute;ntelo m&aacute;s tarde!</div>';
//           }       
//           if(isJson) {
//             if(data.type == 'error') {
//               output = '<div class="error">'+data.text+'</div>';
//               clean = false;
//             } else {
//               output = '<div class="success">'+data.text+'</div>';
//             }
//           }
//           if(clean) {
//             $('input').val('');    
//             $('textarea').val('');          
//           }
//           $("#result").hide().html(output).slideDown();
//         }
//       });     
//     }
//     return false;
//   });

//   $('#contactForm input, #contactForm textarea').keyup(function() {
//     $('#contactForm input, #contactForm textarea').css('border-color','');
//     if($('#result').is(':visible')) $('#result').slideUp();
//   });
// });

 </script>



<?php 
    // function form_mail($sPara, $sAsunto, $sTexto, $sDe){
    //     $bHayFicheros = 0; 
    //     $sCabeceraTexto = ""; 
    //     $sAdjuntos = ""; 

    //     if ($sDe)$sCabeceras = "From:".$sDe."n"; 
    //     else $sCabeceras = ""; 
    //     $sCabeceras .= "MIME-version: 1.0n"; 
    //     foreach ($_POST as $sNombre => $sValor) 
    //     $sTexto = $sTexto."n".$sNombre." = ".$sValor; 

    //     foreach ($_FILES as $vAdjunto) 
    //     { 
    //     if ($bHayFicheros == 0) 
    //     { 
    //     $bHayFicheros = 1; 
    //     $sCabeceras .= "Content-type: multipart/mixed;"; 
    //     $sCabeceras .= "boundary="--_Separador-de-mensajes_--"n"; 

    //     $sCabeceraTexto = "----_Separador-de-mensajes_--n"; 
    //     $sCabeceraTexto .= "Content-type: text/plain;charset=iso-8859-1n"; 
    //     $sCabeceraTexto .= "Content-transfer-encoding: 7BITn"; 

    //     $sTexto = $sCabeceraTexto.$sTexto; 
    //     } 
    //     if ($vAdjunto["size"] > 0) 
    //     { 
    //     $sAdjuntos .= "nn----_Separador-de-mensajes_--n"; 
    //     $sAdjuntos .= "Content-type: ".$vAdjunto["type"].";name="".$vAdjunto["name"].""n";; 
    //     $sAdjuntos .= "Content-Transfer-Encoding: BASE64n"; 
    //     $sAdjuntos .= "Content-disposition: attachment;filename="".$vAdjunto["name"].""nn"; 

    //     $oFichero = fopen($vAdjunto["tmp_name"], 'r'); 
    //     $sContenido = fread($oFichero, filesize($vAdjunto["tmp_name"])); 
    //     $sAdjuntos .= chunk_split(base64_encode($sContenido)); 
    //     fclose($oFichero); 
    //     } 
    //     } 

    //     if ($bHayFicheros) 
    //     $sTexto .= $sAdjuntos."nn----_Separador-de-mensajes_----n"; 
    //     return(mail($sPara, $sAsunto, $sTexto, $sCabeceras)); 
    //     } 

    //     //cambiar aqui el email 
    //     if (form_mail("poner_email@deDestino.com", $_POST[asunto], 
    //     "Los datos introducidos en el formulario son:nn", $_POST[email])) 
    //     echo "Su formulario ha sido enviado con exito"; 
    // }

?>


<?php

// //public function sendformSumate() {
//     if(isset($_POST['email'])) {    
//         //Para y asunto del mensaje a enviar
//         $email_to = "info@tmsgroup.com.ar"; 
//         $email_subject = "Email desde pagina Web";
          
//         // validation expected data exists
//         if(!isset($_POST['nombre']) ||
//             !isset($_POST['apellido']) ||
//             !isset($_POST['dni']) ||
//             !isset($_POST['email']) ||
//             !isset($_POST['celular']) ||
//             !isset($_POST['asunto']) ||
//             !isset($_POST['mensaje']) ||
//             !isset($_FILES['cvitae']['name'])){
//             died('Lo sentimos, pero hubo un error(es) encontrado en el formulario.');       
//         }
         
//         //variables para los campos
//         $nombre = $_POST['nombre']; // required
//         $apellido = $_POST['apellido']; // required
//         $dni = $_POST['dni']; // required
//         $email_from = $_POST['email']; // required
//         $celular = $_POST['celular']; // required
//         $asunto = $_POST['asunto']; // not required
//         $mensaje = $_POST['mensaje']; // not required
            
//         $error_message = "";
//         $email_exp = '/^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/';
//         $string_exp = "/^[A-Za-z .'-]+$/";
        
//         if(!preg_match($email_exp,$email_from)) {
//           $error_message .= 'El email que ingresaste no parece ser válido. <br />';
//         }
//         if(!preg_match($string_exp,$nombre)) {
//           $error_message .= 'El nombre que ingresaste no parece ser válido. <br />';
//         }
//         if(!preg_match($string_exp,$apellido)) {
//           $error_message .= 'El apellido que ingresaste no parece ser válido. <br />';
//         }
//         if(strlen($mensaje) < 2) {
//           $error_message .= 'El mensaje que ingresaste no parece ser válido<br />';
//         }
//         if(strlen($error_message) > 0) {
//           died($error_message);
//         }
//         //variables para los datos del archivo 
//         $nombrearchivo = $_FILES['cvitae']['name'];
//         $archivo = $_FILES['cvitae']['tmp_name'];
//         // Leemos el archivo a adjuntar
        
//         $archivo = file_get_contents($archivo);
//         $archivo = chunk_split(base64_encode($archivo));
         
//         // Cuerpo del Email
//         $CuerpoMensaje .= "A continuación más detalles:\r\n\r\n";
//         $CuerpoMensaje .= "<b>Nombre:</b> ".clean_string($nombre)."\r\n";
//         $CuerpoMensaje .= "<b>Aellido:</b> ".clean_string($apellido)."\r\n";
//         $CuerpoMensaje .= "<b>DNI:</b> ".clean_string($dni)."\r\n";
//         $CuerpoMensaje .= "<b>Email:</b> ".clean_string($email_from)."\r\n";    
//         $CuerpoMensaje .= "<b>Celular:</b> ".clean_string($celular)."\r\n";
//         $CuerpoMensaje .= "<b>Asunto:</b> ".clean_string($asunto)."\r\n";
//         $CuerpoMensaje .= "<b>Mensaje:</b> ".clean_string($mensaje)."\r\n";
          
        
//         //cabecera del email (forma correcta de codificarla)
//         $headers = "From: TMS Group WEB <" . $email_from . ">\r\n";
//         //$header .= "Reply-To: " . $replyto . "\r\n";
//         $headers .= "MIME-Version: 1.0\r\n";
//         $headers .= "Content-Type: multipart/mixed; boundary=\"=A=G=R=O=\"\r\n\r\n";
//         //armando mensaje del email
//         $email_message = "--=A=G=R=O=\r\n";
//         $email_message .= "Content-type:text/plain; charset=utf-8\r\n";
//         $email_message .= "Content-Transfer-Encoding: 7bit\r\n\r\n";
//         $email_message .= $CuerpoMensaje . "\r\n\r\n";
        
//         //archivo adjunto  para email    
//         $email_message .= "--=A=G=R=O=\r\n";
//         $email_message .= "Content-Type: application/octet-stream; name=\"" . $nombrearchivo . "\"\r\n";
//         $email_message .= "Content-Transfer-Encoding: base64\r\n";
//         $email_message .= "Content-Disposition: attachment; filename=\"" . $nombrearchivo . "\"\r\n\r\n";
//         $email_message .= $archivo . "\r\n\r\n";
//         $email_message .= "--=A=G=R=O=--";
        
//         //enviamos el email
//         mail($email_to, $email_subject, $email_message, $headers);

//     }else{
//         echo "Lo sentimos mucho, pero hubo un error(es) encontrado en el formulario. ";
//         echo "Estos son los errores:<br /><br />";
//         echo $error."<br /><br />";
//         echo "Retroceda y arregle el error.<br /><br />";
//         die();
//     }
// }


?>





















  ?>