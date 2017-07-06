jQuery(document).ready(function ($) {
  "use strict";

  /* Navbar */
  function navbar_affix() {
    var navbar_height = $('#masthead').height();
    $('.site-header-affix-wrapper').css('min-height', navbar_height);
  }
  navbar_affix();

  $(window).scroll(function () {
    if ($(window).scrollTop() > 80) {
      $('.site-header').removeClass('header-dark').addClass('navbar-fixed');
      navbar_affix();
    } else {
      $('.site-header').addClass('header-dark');
      $('.site-header').removeClass('navbar-fixed');
    }
  });

  if ($(window).scrollTop() > 80) {
    $('.site-header').removeClass('header-dark').addClass('navbar-fixed');
  }

  /* carousel-slider */
  $('.carousel').carousel({
    interval: 5000,
    pause: 'hover'
  });

  /* wpadminbar */
  $(window).resize(function () {
    navbar_affix();
  })

  /* Masonry Blog Layout */
  var $container = $('.container-post');
  $container.imagesLoaded(function () {
    $container.masonry();
  });

  // Gallery with justified Gallery
  $(".gallery").justifiedGallery({
    rowHeight: 180,
    captions: true,
    lastRow: 'justify'
  });

  // Lightbox gallery with magnificPopup
  $('.tiled-gallery, .justified-gallery').each(function (i) {
    $(this).magnificPopup({
      delegate: 'a',
      type: 'image',
      gallery: {
        enabled: true
      }
    });
  });

  $(window).on('load', function () {

    /* Filtering Image */
    var $wrapper = $('.wrapper-portfolio');
    $wrapper.isotope({
      filter: '*',
      animationOptions: {
        duration: 750,
        easing: 'easeOutBounce',
        queue: false
      }
    });

    $('.portfolio-sort > li').on('click', function () {
      $('.portfolio-sort > li.active').removeClass('active');
      $(this).addClass('active');

      var selector = $(this).attr('data-filter');
      $wrapper.isotope({
        filter: selector,
        animationOptions: {
          duration: 750,
          easing: 'easeOutBounce',
          queue: false
        }
      });

      setProjects();

      return false;
    });

    /* Set Column Portfolio */
    function splitColumns() {
      var winWidth = $(window).width(), columnNumb = 1;
      if (winWidth > 1200) {
        columnNumb = 4;
      } else if (winWidth > 992 && winWidth < 1200) {
        columnNumb = 4;
      } else if (winWidth > 768 && winWidth < 992) {
        columnNumb = 2;
      } else if (winWidth > 662 && winWidth < 768) {
        columnNumb = 2;
      } else if (winWidth < 662 || winWidth < 480) {
        columnNumb = 1;
      }
      return columnNumb;
    }

    function setColumns() {
      var winWidth = $(window).width(), columnNumb = splitColumns(), postWidth = Math.floor(winWidth / columnNumb);
      $wrapper.find('.wrapper-portfolio li').each(function () {
        $(this).css({
          width: postWidth + 'px'
        });
      });
    }

    function setProjects() {
      setColumns();
      $wrapper.isotope('reLayout');
    }

    $wrapper.imagesLoaded(function () {
      setColumns();
    });

    $(window).bind('resize', function () {
      setProjects();
    });
  });

  $('.owl-carousel').owlCarousel({
    loop: true,
    margin: 10,
    responsiveClass: true,
    autoplay: true,
    autoplayTimeout: 5000,
    autoplayHoverPause: true,
    responsive: {
      0: {
        items: 1,
        nav: true
      },
      600: {
        items: 2,
        nav: false
      },
      1000: {
        items: 3,
        nav: true,
        loop: false
      }
    }
  });
});

$(document).ready(function () {
  $('#form-contact').submit(function () {
    var user_name = $('#nombre').val();
    var user_email = $('#email').val();
    var user_phone = $('#telefono').val();
    var user_message = $('#consulta').val();
    var output = '<p class="error">Complete los campos obligatorios!</p>';
    var proceed = true;

    if (user_name == '') {
      $('#nombre').css('border-color', 'red');
      $("#alert-msg").hide().html(output).slideDown();
      proceed = false;
    }
    if (user_phone == '') {
      $('#telefono').css('border-color', 'red');
      $("#alert-msg").hide().html(output).slideDown();
      proceed = false;
    }
    if (user_email == '') {
      $('#email').css('border-color', 'red');
      $("#alert-msg").hide().html(output).slideDown();
      proceed = false;
    }
    if (user_message == '') {
      $('#consulta').css('border-color', 'red');
      $("#alert-msg").hide().html(output).slideDown();
      proceed = false;
    }

    if (proceed) {
      $.ajax({
        type: 'POST',
        url: "<?php echo URL_WEB . 'enviar_mail'; ?>",
        data: $(this).serialize(),
        success: function (response) {
          var isJson = true;
          var clean = true;

          try {
            data = $.parseJSON(response);
          } catch (e) {
            isJson = false;
            output = '<p class="error">No se pudo enviar el correo. Por favor, int&eacute;ntelo m&aacute;s tarde!</p>';
          }
          if (isJson) {
            if (data.type == 'error') {
              output = '<p class="error">' + data.text + '</p>';
              clean = false;
            } else {
              output = '<p class="success">' + data.text + '</p>';
            }
          }
          if (clean) {
            $('#form-contact input[type="text"]').val('');
            $('#form-contact input[type="email"]').val('');
            $('#form-contact textarea').val('');
          }
          $('#alert-msg').hide().html(output).slideDown();
        }
      });
    }
    return false;
  });

  $('#form-contact input, #form-contact textarea').keyup(function () {
    $('#form-contact input, #form-contact textarea').css('border-color', '');
    if ($('#alert-msg').is(':visible')) {
      $('#alert-msg').slideUp();
    }
  });
});

function getCaptcha() {
  num1 = Math.floor((Math.random() * 20) + 1);
  num2 = Math.floor((Math.random() * 10) + 1);
  suma = num1 + num2;

  $('#form-comment #add_suma').val(suma);
  $('#form-comment .send').find('span').html('<strong>Sume: ' + num1 + ' + ' + num2 + '</strong>');
}

function sendComment(url_comment) {
  $('#form-comment').submit(function () {
    var user_name = $('#add_nombre').val();
    var user_email = $('#add_email').val();
    var user_message = $('#add_comment').val();
    var user_captcha = $('#add_captcha').val();

    var output = '<div class="error">Complete los campos obligatorios!</div>';

    var proceed = true;

    if (user_name == '') {
      $('#add_nombre').css('border-color', 'red');
      $("#rescomment").hide().html(output).slideDown();
      proceed = false;
    }
    if (user_email == '') {
      $('#add_email').css('border-color', 'red');
      $("#rescomment").hide().html(output).slideDown();
      proceed = false;
    }
    if (user_message == '') {
      $('#add_comment').css('border-color', 'red');
      $("#rescomment").hide().html(output).slideDown();
      proceed = false;
    }
    if (user_captcha == '') {
      $('#add_captcha').css('border-color', 'red');
      $("#rescomment").hide().html(output).slideDown();
      proceed = false;
    }

    if (proceed) {
      $.ajax({
        type: 'POST',
        url: url_comment,
        data: $(this).serialize(),
        success: function (response) {
          var isJson = true;
          var clean = true;

          try {
            data = $.parseJSON(response);
          } catch (e) {
            isJson = false;
            output = '<div class="error">No se pudo enviar su comentario. Por favor, int&eacute;ntelo m&aacute;s tarde!</div>';
          }
          if (isJson) {
            if (data.type == 'error') {
              output = '<div class="error">' + data.text + '</div>';
              clean = false;
            } else {
              output = '<div class="success">' + data.text + '</div>';
            }
          }
          if (clean) {
            getCaptcha();
            $('#form-comment input.comentar').val('');
            $('#form-comment input.incap').val('');
            $('#form-comment textarea').val('');
          }
          $("#rescomment").hide().html(output).slideDown();
        }
      });
    }
    return false;
  });

  $('#form-comment input, #form-comment textarea').keyup(function () {
    $('#form-comment input, #form-comment textarea').css('border-color', '');
    if ($('#rescomment').is(':visible'))
      $('#rescomment').slideUp();
  });
}

function paginar(page) {  
  $('#page1').val(page);
  $('#paginator1').submit();
}