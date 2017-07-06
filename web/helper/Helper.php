<?php

class Helper {

  public static function format_date($date, $anio = true) {
    $days = array('Domingo', 'Lunes', 'Martes', 'Mi&eacute;rcoles', 'Jueves', 'Viernes', 'S&aacute;bado');
    $months = array('', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre');
    $year = date('Y', $date);
    $month = date('n', $date);
    $day = date('j', $date);
    $week = date('w', $date);
    $text_year = ($anio) ? ' ' . $year : '';
    $new_date = $days[$week] . ', ' . $day . ' de ' . $months[$month] . ' de ' . $text_year;

    return $new_date;
  }

  public static function text_limit($string, $limit = 50, $break = ' ', $pad = '...') {
    /* $break = '.' */
    if (strlen($string) <= $limit)
      return $string;
    $breakpoint = strpos($string, $break, $limit);
    if ($breakpoint !== false) {
      if ($breakpoint < (strlen($string) - 1)) {
        $string = substr($string, 0, $breakpoint) . $pad;
      }
    }
    return $string;
  }

  public static function image_youtube($code, $num = 0) {
    return "http://img.youtube.com/vi/" . $code . "/" . $num . ".jpg";
  }

  public static function seoUrl($string) {
    $string = strtolower($string);
    $string = utf8_decode($string);
    $string = str_replace(' ', '-', $string);
    $string = str_replace('?', '', $string);
    $string = str_replace('+', '', $string);
    $string = str_replace(':', '', $string);
    $string = str_replace('??', '', $string);
    $string = str_replace('`', '', $string);
    $string = str_replace('!', '', $string);
    $string = str_replace('¿', '', $string);
    $originales = 'ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûýýþÿ??';
    $modificadas = 'aaaaaaaceeeeiiiidnoooooouuuuybsaaaaaaaceeeeiiiidnoooooouuuyybyRr';
    $string = strtr($string, utf8_decode($originales), $modificadas);

    return $string;
  }

  public static function diffDateTime($dateTime) {
    $fecha1 = new DateTime($dateTime);
    $fecha2 = new DateTime('now');
    $fecha = $fecha1->diff($fecha2);
    
    if($fecha->y > 0) {
      return $fecha->y . ' a&ntilde;os';
    }
    if($fecha->m > 0) {
      return $fecha->m . ' meses';
    }
    if($fecha->d > 0) {
      return $fecha->d . ' d&iacute;as';
    }
    if($fecha->h > 0) {
      return $fecha->h . ' horas';
    }
    if($fecha->i > 0) {
      return $fecha->i . ' minutos';
    }
    if($fecha->s > 0) {
      return $fecha->s . ' segundos';
    }
  }

}
