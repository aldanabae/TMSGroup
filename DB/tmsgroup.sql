-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-08-2017 a las 22:10:33
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tmsgroup`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_archivo`
--

CREATE TABLE `aws_archivo` (
  `ID` bigint(10) UNSIGNED NOT NULL,
  `Tabla` varchar(60) NOT NULL,
  `TablaID` varchar(10) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Imagen` varchar(60) NOT NULL,
  `Posicion` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_banner_top`
--

CREATE TABLE `aws_banner_top` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(255) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Posicion` int(3) NOT NULL,
  `Imagen` varchar(60) NOT NULL,
  `AlineaText` varchar(10) NOT NULL DEFAULT 'left',
  `IsCrop` tinyint(1) NOT NULL DEFAULT '1',
  `TextButton` varchar(60) NOT NULL,
  `URL` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_banner_top`
--

INSERT INTO `aws_banner_top` (`ID`, `Publico`, `Titulo`, `Descripcion`, `Posicion`, `Imagen`, `AlineaText`, `IsCrop`, `TextButton`, `URL`) VALUES
(1, 1, 'Banner1', '<h1>Desarrollos Web y M&oacute;vil a medida</h1>\r\n\r\n<h2>Ideamos soluciones integrales a partir de tus necesidades para crear el software ideal para tu negocio.</h2>\r\n', 1, '48814863.png', 'left', 1, '', ''),
(2, 1, 'Banner2', '<h1>Internet de Alta Velocidad</h1>\r\n\r\n<h2>Proveemos el servicio de internet mas confiable del mercado las 24 horas, sin necesidad&nbsp;de telefon&iacute;a ni cable, con planes que se ajustan a tus necesidades.</h2>\r\n', 2, '21675336.png', 'left', 1, '', ''),
(3, 1, 'Banner3', '<h1>Soporte y Consultor&iacute;a OnSite</h1>\r\n\r\n<h2>Somos especialistas en soporte IT&nbsp;y ofrecemos consultoria especializada en tecnolog&iacute;a y sistemas inform&aacute;ticos para tu empresa.</h2>\r\n\r\n<p>&nbsp;</p>\r\n', 3, '47062711.png', 'left', 1, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_banner_type`
--

CREATE TABLE `aws_banner_type` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Nombre` varchar(60) NOT NULL,
  `Descripcion` text NOT NULL,
  `Width` int(10) NOT NULL,
  `Height` int(10) NOT NULL,
  `Posicion` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_banner_type`
--

INSERT INTO `aws_banner_type` (`ID`, `Publico`, `Nombre`, `Descripcion`, `Width`, `Height`, `Posicion`) VALUES
(1, 1, 'Banner 300x250', 'Banner 300x250', 300, 250, 1),
(2, 1, 'Banner 468x232', 'Banner 468x60', 468, 232, 2),
(3, 1, 'Banner 625x90', 'Banner 625x90', 625, 90, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_banner_wrap`
--

CREATE TABLE `aws_banner_wrap` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(255) NOT NULL,
  `Imagen` varchar(60) NOT NULL,
  `Archivo` varchar(150) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `TipoID` varchar(10) NOT NULL,
  `Formato` tinyint(1) NOT NULL DEFAULT '1',
  `Codigo` text NOT NULL,
  `Posicion` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_categorias`
--

CREATE TABLE `aws_categorias` (
  `ID` int(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Nombre` varchar(150) NOT NULL,
  `URL` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_clientes`
--

CREATE TABLE `aws_clientes` (
  `ID` int(10) NOT NULL,
  `Publico` tinyint(11) NOT NULL DEFAULT '1',
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Imagen` varchar(60) DEFAULT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `URL` varchar(150) DEFAULT NULL,
  `Posicion` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aws_clientes`
--

INSERT INTO `aws_clientes` (`ID`, `Publico`, `Nombre`, `Descripcion`, `Imagen`, `Website`, `URL`, `Posicion`) VALUES
(1, 1, 'Triunfo Seguros', '', '95653799.jpg', 'https://www.triunfoseguros.com/', 'triunfo-seguros', 1),
(3, 1, 'HCD MaipÃº', '', '85025255.png', 'http://www.hcdmaipu.gob.ar/', 'hcd-maipu', 2),
(4, 1, 'Amena', '', '90155701.png', 'http://www.amena.org.ar/', 'amena', 3),
(5, 1, 'OSEP', '', '15671745.jpg', 'http://osepmendoza.com.ar/', 'osep', 4),
(6, 1, 'Hotel Diplomatic', '', '52685663.jpg', 'http://www.diplomatichotel.com.ar/', 'hotel-diplomatic', 5),
(7, 1, 'Mendoza Vineyards', '', '88463675.jpg', 'http://www.mendozavineyards.com/', 'mendoza-vineyards', 6),
(8, 1, 'Heinz Loos S.R.L.', '', '52562428.jpg', 'http://www.hloos.com.ar/', 'heinz-loos-srl', 7),
(9, 1, 'Simona Espacio', '', '32298414.png', 'https://www.facebook.com/simona.multiespacio.3', 'simona-espacio', 8),
(10, 1, 'Genco', '', '44240248.jpg', 'http://www.grupogenco.com.ar/', 'genco', 9),
(11, 1, 'Eco Holding', '', '94585185.jpg', 'http://www.ecoholding.com.ar/', 'eco-holding', 10),
(15, 1, 'Durox EnologÃ­a S.R.L.', '', '34317448.jpg', 'http://www.durox.com.ar/', 'durox-enologia-srl', 11),
(16, 1, 'Boston Seguros', '', '29604961.jpg', 'http://www.boston.com.ar/', 'boston-seguros', 12),
(17, 1, 'Obra Social Petroleros', '', '31579220.jpg', 'http://www.ospesalud.com.ar/', 'obra-social-petroleros', 13),
(18, 1, 'Hotel Carollo', '', '99220419.jpg', 'http://www.hotelcarollo.com.ar', 'hotel-carollo', 14),
(19, 1, 'Bodega Renaissance', '', '67068919.png', 'https://www.facebook.com/Bodega-Renaissance-282571778482435/', 'bodega-renaissance', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_comments`
--

CREATE TABLE `aws_comments` (
  `ID` bigint(10) UNSIGNED NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '0',
  `Nombre` varchar(60) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Comentario` text NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Likes` int(5) DEFAULT '0',
  `Unlikes` int(5) DEFAULT '0',
  `Tabla` varchar(60) NOT NULL,
  `TablaID` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_config`
--

CREATE TABLE `aws_config` (
  `ID` bigint(10) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Slogan` varchar(255) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Movil` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Localidad` varchar(255) DEFAULT NULL,
  `Provincia` varchar(255) DEFAULT NULL,
  `PaisID` varchar(10) DEFAULT NULL,
  `CodigoPostal` varchar(10) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  `Latitud` varchar(100) DEFAULT NULL,
  `Longitud` varchar(100) DEFAULT NULL,
  `Titulo` varchar(150) DEFAULT NULL,
  `Descripcion` text,
  `Robots` varchar(60) DEFAULT NULL,
  `Analytics` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_config`
--

INSERT INTO `aws_config` (`ID`, `Nombre`, `Slogan`, `Email`, `Telefono`, `Movil`, `Fax`, `Direccion`, `Localidad`, `Provincia`, `PaisID`, `CodigoPostal`, `Website`, `Latitud`, `Longitud`, `Titulo`, `Descripcion`, `Robots`, `Analytics`) VALUES
(1, 'TMS Group', '', 'admin@gmail.com', '', '', '', '', '', '', '10', '55001', 'http://www.tmsgroup.com.ar', '', '', 'TMS Group', 'TMS Group', 'index, follow', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_country`
--

CREATE TABLE `aws_country` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ISO1` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ISO2` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Posicion` bigint(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aws_country`
--

INSERT INTO `aws_country` (`ID`, `Publico`, `Nombre`, `ISO1`, `ISO2`, `Posicion`) VALUES
(1, 1, 'Afghanistan', 'AF', 'AFG', 1),
(2, 1, 'Albania', 'AL', 'ALB', 2),
(3, 1, 'Algeria', 'DZ', 'DZA', 3),
(4, 1, 'American Samoa', 'AS', 'ASM', 4),
(5, 1, 'Andorra', 'AD', 'AND', 5),
(6, 1, 'Angola', 'AO', 'AGO', 6),
(7, 1, 'Anguilla', 'AI', 'AIA', 7),
(8, 1, 'Antarctica', 'AQ', 'ATA', 8),
(9, 1, 'Antigua and Barbuda', 'AG', 'ATG', 9),
(10, 1, 'Argentina', 'AR', 'ARG', 10),
(11, 1, 'Armenia', 'AM', 'ARM', 11),
(12, 1, 'Aruba', 'AW', 'ABW', 12),
(13, 1, 'Australia', 'AU', 'AUS', 13),
(14, 1, 'Austria', 'AT', 'AUT', 14),
(15, 1, 'Azerbaijan', 'AZ', 'AZE', 15),
(16, 1, 'Bahamas', 'BS', 'BHS', 16),
(17, 1, 'Bahrain', 'BH', 'BHR', 17),
(18, 1, 'Bangladesh', 'BD', 'BGD', 18),
(19, 1, 'Barbados', 'BB', 'BRB', 19),
(20, 1, 'Belarus', 'BY', 'BLR', 20),
(21, 1, 'Belgium', 'BE', 'BEL', 21),
(22, 1, 'Belize', 'BZ', 'BLZ', 22),
(23, 1, 'Benin', 'BJ', 'BEN', 23),
(24, 1, 'Bermuda', 'BM', 'BMU', 24),
(25, 1, 'Bhutan', 'BT', 'BTN', 25),
(26, 1, 'Bolivia', 'BO', 'BOL', 26),
(27, 1, 'Bosnia and Herzegowina', 'BA', 'BIH', 27),
(28, 1, 'Botswana', 'BW', 'BWA', 28),
(29, 1, 'Bouvet Island', 'BV', 'BVT', 29),
(30, 1, 'Brazil', 'BR', 'BRA', 30),
(31, 1, 'British Indian Ocean Territory', 'IO', 'IOT', 31),
(32, 1, 'Brunei Darussalam', 'BN', 'BRN', 32),
(33, 1, 'Bulgaria', 'BG', 'BGR', 33),
(34, 1, 'Burkina Faso', 'BF', 'BFA', 34),
(35, 1, 'Burundi', 'BI', 'BDI', 35),
(36, 1, 'Cambodia', 'KH', 'KHM', 36),
(37, 1, 'Cameroon', 'CM', 'CMR', 37),
(38, 1, 'Canada', 'CA', 'CAN', 38),
(39, 1, 'Cape Verde', 'CV', 'CPV', 39),
(40, 1, 'Cayman Islands', 'KY', 'CYM', 40),
(41, 1, 'Central African Republic', 'CF', 'CAF', 41),
(42, 1, 'Chad', 'TD', 'TCD', 42),
(43, 1, 'Chile', 'CL', 'CHL', 43),
(44, 1, 'China', 'CN', 'CHN', 44),
(45, 1, 'Christmas Island', 'CX', 'CXR', 45),
(46, 1, 'Cocos (Keeling) Islands', 'CC', 'CCK', 46),
(47, 1, 'Colombia', 'CO', 'COL', 47),
(48, 1, 'Comoros', 'KM', 'COM', 48),
(49, 1, 'Congo', 'CG', 'COG', 49),
(50, 1, 'Cook Islands', 'CK', 'COK', 50),
(51, 1, 'Costa Rica', 'CR', 'CRI', 51),
(52, 1, 'Cote D''Ivoire', 'CI', 'CIV', 52),
(53, 1, 'Croatia', 'HR', 'HRV', 53),
(54, 1, 'Cuba', 'CU', 'CUB', 54),
(55, 1, 'Cyprus', 'CY', 'CYP', 55),
(56, 1, 'Czech Republic', 'CZ', 'CZE', 56),
(57, 1, 'Denmark', 'DK', 'DNK', 57),
(58, 1, 'Djibouti', 'DJ', 'DJI', 58),
(59, 1, 'Dominica', 'DM', 'DMA', 59),
(60, 1, 'Dominican Republic', 'DO', 'DOM', 60),
(61, 1, 'East Timor', 'TP', 'TMP', 61),
(62, 1, 'Ecuador', 'EC', 'ECU', 62),
(63, 1, 'Egypt', 'EG', 'EGY', 63),
(64, 1, 'El Salvador', 'SV', 'SLV', 64),
(65, 1, 'Equatorial Guinea', 'GQ', 'GNQ', 65),
(66, 1, 'Eritrea', 'ER', 'ERI', 66),
(67, 1, 'Estonia', 'EE', 'EST', 67),
(68, 1, 'Ethiopia', 'ET', 'ETH', 68),
(69, 1, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 69),
(70, 1, 'Faroe Islands', 'FO', 'FRO', 70),
(71, 1, 'Fiji', 'FJ', 'FJI', 71),
(72, 1, 'Finland', 'FI', 'FIN', 72),
(73, 1, 'France', 'FR', 'FRA', 73),
(74, 1, 'France, Metropolitan', 'FX', 'FXX', 74),
(75, 1, 'French Guiana', 'GF', 'GUF', 75),
(76, 1, 'French Polynesia', 'PF', 'PYF', 76),
(77, 1, 'French Southern Territories', 'TF', 'ATF', 77),
(78, 1, 'Gabon', 'GA', 'GAB', 78),
(79, 1, 'Gambia', 'GM', 'GMB', 79),
(80, 1, 'Georgia', 'GE', 'GEO', 80),
(81, 1, 'Germany', 'DE', 'DEU', 81),
(82, 1, 'Ghana', 'GH', 'GHA', 82),
(83, 1, 'Gibraltar', 'GI', 'GIB', 83),
(84, 1, 'Greece', 'GR', 'GRC', 84),
(85, 1, 'Greenland', 'GL', 'GRL', 85),
(86, 1, 'Grenada', 'GD', 'GRD', 86),
(87, 1, 'Guadeloupe', 'GP', 'GLP', 87),
(88, 1, 'Guam', 'GU', 'GUM', 88),
(89, 1, 'Guatemala', 'GT', 'GTM', 89),
(90, 1, 'Guinea', 'GN', 'GIN', 90),
(91, 1, 'Guinea-bissau', 'GW', 'GNB', 91),
(92, 1, 'Guyana', 'GY', 'GUY', 92),
(93, 1, 'Haiti', 'HT', 'HTI', 93),
(94, 1, 'Heard and Mc Donald Islands', 'HM', 'HMD', 94),
(95, 1, 'Honduras', 'HN', 'HND', 95),
(96, 1, 'Hong Kong', 'HK', 'HKG', 96),
(97, 1, 'Hungary', 'HU', 'HUN', 97),
(98, 1, 'Iceland', 'IS', 'ISL', 98),
(99, 1, 'India', 'IN', 'IND', 99),
(100, 1, 'Indonesia', 'ID', 'IDN', 100),
(101, 1, 'Iran (Islamic Republic of)', 'IR', 'IRN', 101),
(102, 1, 'Iraq', 'IQ', 'IRQ', 102),
(103, 1, 'Ireland', 'IE', 'IRL', 103),
(104, 1, 'Israel', 'IL', 'ISR', 104),
(105, 1, 'Italy', 'IT', 'ITA', 105),
(106, 1, 'Jamaica', 'JM', 'JAM', 106),
(107, 1, 'Japan', 'JP', 'JPN', 107),
(108, 1, 'Jordan', 'JO', 'JOR', 108),
(109, 1, 'Kazakhstan', 'KZ', 'KAZ', 109),
(110, 1, 'Kenya', 'KE', 'KEN', 110),
(111, 1, 'Kiribati', 'KI', 'KIR', 111),
(112, 1, 'North Korea', 'KP', 'PRK', 112),
(113, 1, 'Korea, Republic of', 'KR', 'KOR', 113),
(114, 1, 'Kuwait', 'KW', 'KWT', 114),
(115, 1, 'Kyrgyzstan', 'KG', 'KGZ', 115),
(116, 1, 'Lao People''s Democratic Republic', 'LA', 'LAO', 116),
(117, 1, 'Latvia', 'LV', 'LVA', 117),
(118, 1, 'Lebanon', 'LB', 'LBN', 118),
(119, 1, 'Lesotho', 'LS', 'LSO', 119),
(120, 1, 'Liberia', 'LR', 'LBR', 120),
(121, 1, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 121),
(122, 1, 'Liechtenstein', 'LI', 'LIE', 122),
(123, 1, 'Lithuania', 'LT', 'LTU', 123),
(124, 1, 'Luxembourg', 'LU', 'LUX', 124),
(125, 1, 'Macau', 'MO', 'MAC', 125),
(126, 1, 'Macedonia', 'MK', 'MKD', 126),
(127, 1, 'Madagascar', 'MG', 'MDG', 127),
(128, 1, 'Malawi', 'MW', 'MWI', 128),
(129, 1, 'Malaysia', 'MY', 'MYS', 129),
(130, 1, 'Maldives', 'MV', 'MDV', 130),
(131, 1, 'Mali', 'ML', 'MLI', 131),
(132, 1, 'Malta', 'MT', 'MLT', 132),
(133, 1, 'Marshall Islands', 'MH', 'MHL', 133),
(134, 1, 'Martinique', 'MQ', 'MTQ', 134),
(135, 1, 'Mauritania', 'MR', 'MRT', 135),
(136, 1, 'Mauritius', 'MU', 'MUS', 136),
(137, 1, 'Mayotte', 'YT', 'MYT', 137),
(138, 1, 'Mexico', 'MX', 'MEX', 138),
(139, 1, 'Micronesia, Federated States of', 'FM', 'FSM', 139),
(140, 1, 'Moldova, Republic of', 'MD', 'MDA', 140),
(141, 1, 'Monaco', 'MC', 'MCO', 141),
(142, 1, 'Mongolia', 'MN', 'MNG', 142),
(143, 1, 'Montserrat', 'MS', 'MSR', 143),
(144, 1, 'Morocco', 'MA', 'MAR', 144),
(145, 1, 'Mozambique', 'MZ', 'MOZ', 145),
(146, 1, 'Myanmar', 'MM', 'MMR', 146),
(147, 1, 'Namibia', 'NA', 'NAM', 147),
(148, 1, 'Nauru', 'NR', 'NRU', 148),
(149, 1, 'Nepal', 'NP', 'NPL', 149),
(150, 1, 'Netherlands', 'NL', 'NLD', 150),
(151, 1, 'Netherlands Antilles', 'AN', 'ANT', 151),
(152, 1, 'New Caledonia', 'NC', 'NCL', 152),
(153, 1, 'New Zealand', 'NZ', 'NZL', 153),
(154, 1, 'Nicaragua', 'NI', 'NIC', 154),
(155, 1, 'Niger', 'NE', 'NER', 155),
(156, 1, 'Nigeria', 'NG', 'NGA', 156),
(157, 1, 'Niue', 'NU', 'NIU', 157),
(158, 1, 'Norfolk Island', 'NF', 'NFK', 158),
(159, 1, 'Northern Mariana Islands', 'MP', 'MNP', 159),
(160, 1, 'Norway', 'NO', 'NOR', 160),
(161, 1, 'Oman', 'OM', 'OMN', 161),
(162, 1, 'Pakistan', 'PK', 'PAK', 162),
(163, 1, 'Palau', 'PW', 'PLW', 163),
(164, 1, 'Panama', 'PA', 'PAN', 164),
(165, 1, 'Papua New Guinea', 'PG', 'PNG', 165),
(166, 1, 'Paraguay', 'PY', 'PRY', 166),
(167, 1, 'Peru', 'PE', 'PER', 167),
(168, 1, 'Philippines', 'PH', 'PHL', 168),
(169, 1, 'Pitcairn', 'PN', 'PCN', 169),
(170, 1, 'Poland', 'PL', 'POL', 170),
(171, 1, 'Portugal', 'PT', 'PRT', 171),
(172, 1, 'Puerto Rico', 'PR', 'PRI', 172),
(173, 1, 'Qatar', 'QA', 'QAT', 173),
(174, 1, 'Reunion', 'RE', 'REU', 174),
(175, 1, 'Romania', 'RO', 'ROM', 175),
(176, 1, 'Russian Federation', 'RU', 'RUS', 176),
(177, 1, 'Rwanda', 'RW', 'RWA', 177),
(178, 1, 'Saint Kitts and Nevis', 'KN', 'KNA', 178),
(179, 1, 'Saint Lucia', 'LC', 'LCA', 179),
(180, 1, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 180),
(181, 1, 'Samoa', 'WS', 'WSM', 181),
(182, 1, 'San Marino', 'SM', 'SMR', 182),
(183, 1, 'Sao Tome and Principe', 'ST', 'STP', 183),
(184, 1, 'Saudi Arabia', 'SA', 'SAU', 184),
(185, 1, 'Senegal', 'SN', 'SEN', 185),
(186, 1, 'Seychelles', 'SC', 'SYC', 186),
(187, 1, 'Sierra Leone', 'SL', 'SLE', 187),
(188, 1, 'Singapore', 'SG', 'SGP', 188),
(189, 1, 'Slovak Republic', 'SK', 'SVK', 189),
(190, 1, 'Slovenia', 'SI', 'SVN', 190),
(191, 1, 'Solomon Islands', 'SB', 'SLB', 191),
(192, 1, 'Somalia', 'SO', 'SOM', 192),
(193, 1, 'South Africa', 'ZA', 'ZAF', 193),
(194, 1, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', 194),
(195, 1, 'Spain', 'ES', 'ESP', 195),
(196, 1, 'Sri Lanka', 'LK', 'LKA', 196),
(197, 1, 'St. Helena', 'SH', 'SHN', 197),
(198, 1, 'St. Pierre and Miquelon', 'PM', 'SPM', 198),
(199, 1, 'Sudan', 'SD', 'SDN', 199),
(200, 1, 'Suriname', 'SR', 'SUR', 200),
(201, 1, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 201),
(202, 1, 'Swaziland', 'SZ', 'SWZ', 202),
(203, 1, 'Sweden', 'SE', 'SWE', 203),
(204, 1, 'Switzerland', 'CH', 'CHE', 204),
(205, 1, 'Syrian Arab Republic', 'SY', 'SYR', 205),
(206, 1, 'Taiwan', 'TW', 'TWN', 206),
(207, 1, 'Tajikistan', 'TJ', 'TJK', 207),
(208, 1, 'Tanzania, United Republic of', 'TZ', 'TZA', 208),
(209, 1, 'Thailand', 'TH', 'THA', 209),
(210, 1, 'Togo', 'TG', 'TGO', 210),
(211, 1, 'Tokelau', 'TK', 'TKL', 211),
(212, 1, 'Tonga', 'TO', 'TON', 212),
(213, 1, 'Trinidad and Tobago', 'TT', 'TTO', 213),
(214, 1, 'Tunisia', 'TN', 'TUN', 214),
(215, 1, 'Turkey', 'TR', 'TUR', 215),
(216, 1, 'Turkmenistan', 'TM', 'TKM', 216),
(217, 1, 'Turks and Caicos Islands', 'TC', 'TCA', 217),
(218, 1, 'Tuvalu', 'TV', 'TUV', 218),
(219, 1, 'Uganda', 'UG', 'UGA', 219),
(220, 1, 'Ukraine', 'UA', 'UKR', 220),
(221, 1, 'United Arab Emirates', 'AE', 'ARE', 221),
(222, 1, 'United Kingdom', 'GB', 'GBR', 222),
(223, 1, 'United States', 'US', 'USA', 223),
(224, 1, 'United States Minor Outlying Islands', 'UM', 'UMI', 224),
(225, 1, 'Uruguay', 'UY', 'URY', 225),
(226, 1, 'Uzbekistan', 'UZ', 'UZB', 226),
(227, 1, 'Vanuatu', 'VU', 'VUT', 227),
(228, 1, 'Vatican City State (Holy See)', 'VA', 'VAT', 228),
(229, 1, 'Venezuela', 'VE', 'VEN', 229),
(230, 1, 'Viet Nam', 'VN', 'VNM', 230),
(231, 1, 'Virgin Islands (British)', 'VG', 'VGB', 231),
(232, 1, 'Virgin Islands (U.S.)', 'VI', 'VIR', 232),
(233, 1, 'Wallis and Futuna Islands', 'WF', 'WLF', 233),
(234, 1, 'Western Sahara', 'EH', 'ESH', 234),
(235, 1, 'Yemen', 'YE', 'YEM', 235),
(236, 1, 'Yugoslavia', 'YU', 'YUG', 236),
(237, 1, 'Democratic Republic of Congo', 'CD', 'COD', 237),
(238, 1, 'Zambia', 'ZM', 'ZMB', 238),
(239, 1, 'Zimbabwe', 'ZW', 'ZWE', 239);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_departamentos`
--

CREATE TABLE `aws_departamentos` (
  `ID` int(3) NOT NULL,
  `ProvinciaID` int(2) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_departamentos`
--

INSERT INTO `aws_departamentos` (`ID`, `ProvinciaID`, `Nombre`) VALUES
(1, 12, 'SAN RAFAEL'),
(2, 12, 'MALARGUE'),
(3, 12, 'GUAYMALLEN'),
(4, 12, 'LAVALLE'),
(5, 12, 'JUNIN'),
(6, 12, 'TUPUNGATO'),
(7, 12, 'RIVADAVIA'),
(8, 12, 'MAIPU'),
(9, 12, 'GODOY CRUZ'),
(10, 12, 'GENERAL ALVEAR'),
(11, 12, 'LA PAZ'),
(12, 12, 'TUNUYAN'),
(13, 12, 'SAN CARLOS'),
(14, 12, 'LAS HERAS'),
(15, 12, 'LUJAN DE CUYO'),
(16, 12, 'SAN MARTIN'),
(17, 12, 'SANTA ROSA'),
(18, 12, 'CAPITAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_galerias`
--

CREATE TABLE `aws_galerias` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(200) NOT NULL,
  `Descripcion` text NOT NULL,
  `Imagen` varchar(60) NOT NULL,
  `Tipo` tinyint(1) NOT NULL DEFAULT '1',
  `Fecha` varchar(15) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `Portada` tinyint(1) NOT NULL DEFAULT '0',
  `Posicion` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_lng_keyword`
--

CREATE TABLE `aws_lng_keyword` (
  `ID` bigint(10) NOT NULL,
  `Public` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `Keyword` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LangCode` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Translate` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_lng_language`
--

CREATE TABLE `aws_lng_language` (
  `ID` bigint(10) UNSIGNED NOT NULL,
  `Public` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `Name` varchar(60) NOT NULL DEFAULT '',
  `Code` varchar(5) NOT NULL DEFAULT '',
  `Image` varchar(60) NOT NULL DEFAULT '',
  `Position` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_lng_language`
--

INSERT INTO `aws_lng_language` (`ID`, `Public`, `Name`, `Code`, `Image`, `Position`) VALUES
(1, 1, 'Espa&ntilde;ol', 'es', 'es.png', 1),
(2, 1, 'English', 'en', 'en.png', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_lng_translate`
--

CREATE TABLE `aws_lng_translate` (
  `ID` bigint(10) NOT NULL,
  `TableID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `RowID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Field` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `LangCode` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `Translate` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_meta`
--

CREATE TABLE `aws_meta` (
  `ID` bigint(10) NOT NULL,
  `Tabla` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `TablaID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `Keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `Robots` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aws_meta`
--

INSERT INTO `aws_meta` (`ID`, `Tabla`, `TablaID`, `Titulo`, `Descripcion`, `Keywords`, `Robots`) VALUES
(1, 'seccion', '1', 'home', 'home', '', 'index, follow'),
(2, 'seccion', '2', 'servicios', 'servicios', '', 'index, follow'),
(3, 'seccion', '3', 'serv1', 'serv1', '', 'index, follow'),
(4, 'seccion', '4', 'Outsourcing IT', 'Outsourcing IT', '', 'index, follow'),
(5, 'seccion', '5', 'Software Factoring', 'Software Factoring', '', 'index, follow'),
(6, 'seccion', '6', 'ConsultorÃ­a y CapacitaciÃ³n', 'ConsultorÃ­a y CapacitaciÃ³n', '', 'index, follow'),
(7, 'seccion', '7', 'Cloud Solutions', 'Cloud Solutions', '', 'index, follow'),
(8, 'seccion', '8', 'Internet Service Provider', 'Internet Service Provider', '', 'index, follow'),
(9, 'seccion', '9', 'Networking Solutions', 'Networking Solutions', '', 'index, follow'),
(10, 'seccion', '10', 'Soporte TecnolÃ³gico', 'Soporte TecnolÃ³gico', '', 'index, follow'),
(11, 'seccion', '11', 'Contacto ', 'Contacto ', '', 'index, follow');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_newsletter`
--

CREATE TABLE `aws_newsletter` (
  `ID` bigint(10) UNSIGNED NOT NULL,
  `Publico` tinyint(1) UNSIGNED NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Asunto` varchar(60) NOT NULL,
  `Contenido` text NOT NULL,
  `Adjunto` varchar(60) NOT NULL,
  `Destinatario` text NOT NULL,
  `URL` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_news_email`
--

CREATE TABLE `aws_news_email` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `GroupID` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_news_group`
--

CREATE TABLE `aws_news_group` (
  `ID` bigint(10) UNSIGNED NOT NULL,
  `Publico` tinyint(1) UNSIGNED NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Posicion` tinyint(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_news_group`
--

INSERT INTO `aws_news_group` (`ID`, `Publico`, `Nombre`, `Posicion`) VALUES
(1, 1, 'General', 0),
(2, 1, 'Usuarios Registrados', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_paragraph`
--

CREATE TABLE `aws_paragraph` (
  `ID` bigint(10) NOT NULL,
  `Tabla` varchar(60) NOT NULL,
  `TablaID` varchar(10) NOT NULL,
  `Titulo` varchar(255) DEFAULT NULL,
  `Detalle` text NOT NULL,
  `Imagen` varchar(60) DEFAULT NULL,
  `TextImage` text,
  `AlineaImg` varchar(10) DEFAULT NULL,
  `Video` varchar(20) DEFAULT NULL,
  `TextVideo` text,
  `IsLink` tinyint(1) DEFAULT '0',
  `Link` varchar(250) DEFAULT NULL,
  `Icono` varchar(60) DEFAULT NULL,
  `Posicion` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_paragraph`
--

INSERT INTO `aws_paragraph` (`ID`, `Tabla`, `TablaID`, `Titulo`, `Detalle`, `Imagen`, `TextImage`, `AlineaImg`, `Video`, `TextVideo`, `IsLink`, `Link`, `Icono`, `Posicion`) VALUES
(1, 'seccion', '1', '', '', '', '', 'right', '', '', 0, '', NULL, 1),
(2, 'seccion', '2', '', '', '', '', 'right', '', '', 0, '', NULL, 1),
(3, 'seccion', '3', '', '', '', '', 'right', '', '', 0, '', NULL, 1),
(4, 'seccion', '4', 'Monitoreo/AdministraciÃ³n Plataforma Midrange', '<p>Manejamos ambientes Linux y Windows, Virtualizaciones&nbsp;(VMWare &ndash; Hypervisor),&nbsp;Storage Area Network (SAN),&nbsp;Bases de Datos (Oracle, SQL, MySQL, Sysbase) y&nbsp;SAP.</p>\r\n', '', '', 'right', '', '', 0, '', 'fa fa-eye', 1),
(5, 'seccion', '4', 'Help Desk â€“ End User Support', '', '', '', 'right', '', '', 0, '', 'fa fa-question', 2),
(11, 'seccion', '4', 'Monitoreo/AdministraciÃ³n WAN - LAN', '', '', '', 'right', '', '', 0, '', 'fa fa-code-fork', 3),
(6, 'seccion', '5', 'ERP, CRM', '', '', '', 'right', '', '', 0, '', 'fa fa-briefcase', 1),
(7, 'seccion', '6', 'Comunicaciones ( Voz y Datos)', '', '', '', 'right', '', '', 0, '', 'fa fa-phone', 1),
(8, 'seccion', '7', 'Hosting - Housing', '', '', '', 'right', '', '', 0, '', 'fa fa-server', 1),
(9, 'seccion', '8', '', '', '', '', 'right', '', '', 0, '', '', 1),
(10, 'seccion', '9', 'Cableados Estructurados', '', '', '', 'right', '', '', 0, '', 'fa fa-code-fork', 1),
(12, 'seccion', '4', 'Monitoreo/AdministraciÃ³n Seguridad LÃ³gica y FÃ­sica', '', '', '', 'right', '', '', 0, '', 'fa fa-shield', 4),
(13, 'seccion', '4', 'PMO â€“ Modelo de Gobierno', '', '', '', 'right', '', '', 0, '', 'fa fa-cogs', 5),
(14, 'seccion', '5', 'Soluciones de Backup Automatizadas', '', '', '', 'right', '', '', 0, '', 'fa fa-archive', 2),
(15, 'seccion', '5', 'SoluciÃ³n de DigitalizaciÃ³n de Documentos', '', '', '', 'right', '', '', 0, '', 'fa fa-file-text', 3),
(16, 'seccion', '5', 'Desarrollos B2B', '', '', '', 'right', '', '', 0, '', 'fa fa-building-o', 4),
(17, 'seccion', '5', 'Soluciones de GestiÃ³n', '', '', '', 'right', '', '', 0, '', 'fa fa-line-chart', 5),
(18, 'seccion', '5', 'Desarrollo de Apps MÃ³viles a Medida', '', '', '', 'right', '', '', 0, '', 'fa fa-mobile', 6),
(19, 'seccion', '5', 'Desarrollo de Apps Web a Medida', '', '', '', 'right', '', '', 0, '', 'fa fa-desktop', 7),
(20, 'seccion', '5', 'Soluciones Open Source', '', '', '', 'right', '', '', 0, '', 'fa fa-check', 8),
(21, 'seccion', '5', 'ProgramaciÃ³n (JAVA, PHP, ASP, Scripting, Android, otros)', '', '', '', 'right', '', '', 0, '', 'fa fa-code', 9),
(22, 'seccion', '5', 'Biblioteca Digital â€“ Aula Digital', '', '', '', 'right', '', '', 0, '', 'fa fa-graduation-cap', 10),
(23, 'seccion', '6', 'AuditorÃ­as de Seguridad', '', '', '', 'right', '', '', 0, '', 'fa fa-user-secret', 2),
(24, 'seccion', '6', 'Assessment TecnolÃ³gico', '', '', '', 'right', '', '', 0, '', 'fa fa-check-circle-o', 3),
(25, 'seccion', '6', 'Desarrollo Plan EstratÃ©gico de Sistemas', '', '', '', 'right', '', '', 0, '', 'fa fa-paper-plane', 4),
(26, 'seccion', '6', 'Desarrollo de Disaster Recovery - BCP', '', '', '', 'right', '', '', 0, '', 'fa fa-line-chart', 5),
(27, 'seccion', '6', 'Risk Management Assessment', '', '', '', 'right', '', '', 0, '', 'fa fa-suitcase', 6),
(28, 'seccion', '6', 'Planes EstratÃ©gicos de IT', '', '', '', 'right', '', '', 0, '', 'fa fa-road', 7),
(29, 'seccion', '7', 'Cloud Computing', '', '', '', 'right', '', '', 0, '', 'fa fa-cloud', 2),
(30, 'seccion', '7', 'IaaS (Infrastructure as a Services)', '', '', '', 'right', '', '', 0, '', 'fa fa-cloud-upload', 3),
(31, 'seccion', '7', 'SaaS (Software as a Services)', '', '', '', 'right', '', '', 0, '', 'fa fa-cloud-upload', 4),
(32, 'seccion', '7', 'PaaS (Platform as a Service)', '', '', '', 'right', '', '', 0, '', 'fa fa-cloud-upload', 5),
(43, 'seccion', '11', '', '', '', '', 'right', '', '', 0, '', '', 1),
(34, 'seccion', '9', 'TelefonÃ­a VoIP', '', '', '', 'right', '', '', 0, '', 'fa fa-phone', 2),
(35, 'seccion', '9', 'NOC (Network Operation Center)', '', '', '', 'right', '', '', 0, '', 'fa fa-bolt', 3),
(36, 'seccion', '9', 'Sistemas de vigilancia por CCTV', '', '', '', 'right', '', '', 0, '', 'fa fa-video-camera', 4),
(37, 'seccion', '9', 'Servicio TÃ©cnico Especializado', '', '', '', 'right', '', '', 0, '', 'fa fa-wrench', 5),
(38, 'seccion', '10', 'GestiÃ³n los Recursos InformÃ¡ticos ', '', '', '', 'right', '', '', 0, '', 'fa fa-print', 1),
(39, 'seccion', '10', 'Mantenimiento y Seguridad InformÃ¡tica', '', '', '', 'right', '', '', 0, '', 'fa fa-lock', 2),
(40, 'seccion', '10', 'Soporte de Software EspecÃ­fico', '', '', '', 'right', '', '', 0, '', 'fa fa-thumbs-up', 3),
(41, 'seccion', '10', 'Proveer Recursos TecnolÃ³gicos', '', '', '', 'right', '', '', 0, '', 'fa fa-shopping-basket', 4),
(42, 'seccion', '10', 'CapacitaciÃ³n a Usuarios Finales', '', '', '', 'right', '', '', 0, '', 'fa fa-users', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_partners`
--

CREATE TABLE `aws_partners` (
  `ID` int(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text NOT NULL,
  `Imagen` varchar(60) NOT NULL,
  `URL` varchar(150) NOT NULL,
  `Posicion` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aws_partners`
--

INSERT INTO `aws_partners` (`ID`, `Publico`, `Nombre`, `Descripcion`, `Imagen`, `URL`, `Posicion`) VALUES
(2, 1, 'Kaspersky', '', '31678586.png', 'kaspersky', 1),
(3, 1, 'Windows', '', '26098262.png', 'windows', 2),
(4, 1, 'Linux', '', '51068476.jpg', 'linux', 3),
(5, 1, 'Polo TIC Mendoza', '', '78917108.png', 'polo-tic-mendoza', 4),
(6, 1, 'PostgreSQL', '', '2481411.png', 'postgresql', 5),
(7, 1, 'SQLServer', '', '47226504.png', 'sqlserver', 6),
(8, 1, 'Unify', '', '5598490.png', 'unify', 7),
(9, 1, 'Siemens', '', '81486742.png', 'siemens', 8),
(10, 1, 'Asterisk', '', '81401263.png', 'asterisk', 9),
(11, 1, 'Grandstream', '', '86016341.jpg', 'grandstream', 10),
(12, 1, 'MikroTik', '', '72882617.png', 'mikrotik', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_planes`
--

CREATE TABLE `aws_planes` (
  `ID` int(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(100) NOT NULL,
  `Descripcion` text,
  `Estilo` varchar(60) DEFAULT NULL,
  `Destacado` tinyint(1) NOT NULL DEFAULT '0',
  `URL` varchar(150) DEFAULT NULL,
  `Posicion` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aws_planes`
--

INSERT INTO `aws_planes` (`ID`, `Publico`, `Titulo`, `Descripcion`, `Estilo`, `Destacado`, `URL`, `Posicion`) VALUES
(1, 1, '3 MB', '<ul>\r\n	<li>Downstream <strong>3</strong>&nbsp;<strong>Mbps</strong></li>\r\n	<li>Upstream&nbsp;<strong>1.5 Mbps</strong></li>\r\n	<li>Soporte<strong> telef&oacute;nico</strong></li>\r\n	<li>Incluye<strong> antena</strong> en comodato</li>\r\n	<li>Uso<strong> ilimitado y </strong>tarifa<strong> plana*</strong></li>\r\n	<li>2 a 3 dispositivos conectados simultaneamente**</li>\r\n	<li>No&nbsp;acosejable para&nbsp;NETFLIX&trade;</li>\r\n</ul>\r\n', 'warning', 0, '3-mb', 1),
(2, 1, '6 MB', '<ul>\r\n	<li>Downstream&nbsp;<strong>6 Mbps</strong></li>\r\n	<li>Upstream&nbsp;<strong>3 Mbps</strong></li>\r\n	<li>Soporte<strong>&nbsp;telef&oacute;nico</strong></li>\r\n	<li>Incluye<strong>&nbsp;antena</strong>&nbsp;en comodato</li>\r\n	<li>Uso<strong>&nbsp;ilimitado y&nbsp;</strong>tarifa<strong>&nbsp;plana*</strong></li>\r\n	<li>3 a 4 dispositivos conectados simultaneamente**</li>\r\n	<li>Soporta NETFLIX&trade;</li>\r\n</ul>\r\n', 'success', 0, '6-mb', 2),
(3, 1, '9 MB', '<ul>\r\n	<li>Downstream 9<strong>&nbsp;Mbps</strong></li>\r\n	<li>Upstream 4.5 <strong>Mbps</strong></li>\r\n	<li>Soporte<strong>&nbsp;telef&oacute;nico</strong></li>\r\n	<li>Incluye<strong>&nbsp;antena</strong>&nbsp;en comodato</li>\r\n	<li>Uso<strong>&nbsp;ilimitado y&nbsp;</strong>tarifa<strong>&nbsp;plana*</strong></li>\r\n	<li>5 a 6 dispositivos conectados simultaneamente**</li>\r\n	<li>Soporta NETFLIX&trade; HD</li>\r\n</ul>\r\n', 'info', 0, '9-mb', 3),
(4, 1, '12 MB', '<ul>\r\n	<li>Downstream 12<strong>&nbsp;Mbps</strong></li>\r\n	<li>Upstream 6&nbsp;<strong>Mbps</strong></li>\r\n	<li>Soporte<strong>&nbsp;telef&oacute;nico</strong></li>\r\n	<li>Incluye<strong>&nbsp;antena</strong>&nbsp;en comodato</li>\r\n	<li>Uso<strong>&nbsp;ilimitado y&nbsp;</strong>tarifa<strong>&nbsp;plana*</strong></li>\r\n	<li>Hasta 10 dispositivos conectados simultaneamente**</li>\r\n	<li>NETFLIX&trade; en 2 dispositivos**</li>\r\n</ul>\r\n', 'danger', 1, '12-mb', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_plantillas`
--

CREATE TABLE `aws_plantillas` (
  `ID` bigint(20) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Nombre` varchar(100) NOT NULL,
  `Archivo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_plantillas`
--

INSERT INTO `aws_plantillas` (`ID`, `Publico`, `Nombre`, `Archivo`) VALUES
(2, 1, 'Contacto', 'contacto.php'),
(4, 1, 'Planes', 'planes.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_portfolio`
--

CREATE TABLE `aws_portfolio` (
  `ID` int(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(100) NOT NULL,
  `Descripcion` text,
  `Imagen` varchar(60) DEFAULT NULL,
  `URL` varchar(150) DEFAULT NULL,
  `Website` varchar(150) DEFAULT NULL,
  `Estilo` varchar(60) DEFAULT NULL,
  `Delay` int(3) NOT NULL DEFAULT '0',
  `Color` varchar(20) DEFAULT NULL,
  `Posicion` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aws_portfolio`
--

INSERT INTO `aws_portfolio` (`ID`, `Publico`, `Titulo`, `Descripcion`, `Imagen`, `URL`, `Website`, `Estilo`, `Delay`, `Color`, `Posicion`) VALUES
(1, 1, 'AutÃ³dromo Termas de RÃ­o Hondo', '<p>Se realiz&oacute;&nbsp;la instalaci&oacute;n completa de m&aacute;s de 10 kms de Fibra &Oacute;ptica subterranea a lo largo de todo el circuito, siguiendo estrictas normas de seguridad y controlando su correcto funcionamiento, con el fin de monitorear y visualizar con mas de 30 c&aacute;maras el transcurso de cada carrera en la oficina de Race Control.&nbsp;</p>\r\n', '19376212.jpg', 'autodromo-termas-de-rio-hondo', '', 'card card-dark-inverse', 6, 'success', 1),
(2, 1, 'Estadio Fiscal de Talca - Chile', '<p>El proyecto incluy&oacute;&nbsp;el relevamiento de las condiciones previo a la instalaci&oacute;n, la situaci&oacute;n de los elementos de IT reutilizables, el presupuesto, puesta en marcha de la instalaci&oacute;n, cableado, testeo y mantenimiento inicial de la infraestructura realizada. Se bas&oacute; en los principios operativos est&aacute;ndares del mercado,&nbsp;bajo recomendaciones ITIL v3 para los ISO/IEC 200001.</p>\r\n', '83713947.jpg', 'estadio-fiscal-de-talca-chile', '', 'card ', 8, 'royal', 2),
(4, 1, 'Durox EnologÃ­a S.R.L.', '<p>Sistema integral de gestion, en plataformas web y m&oacute;vil, creado a medida para la empresa Durox Enolog&iacute;a S.R.L., el mismo se encarga de la gesti&oacute;n de clientes, registro de visitas, generaci&oacute;n y seguimiento de presupuestos y posteriores pedidos, manejo de vendedores, productos y generaci&oacute;n de estadisticas en base a par&aacute;metros de inter&eacute;s de la organizaci&oacute;n.&nbsp;</p>\r\n', '74709332.jpg', 'durox-enologia-srl', '', 'card card-dark-inverse', 10, 'warning', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_posts`
--

CREATE TABLE `aws_posts` (
  `ID` bigint(10) UNSIGNED NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Sumario` text NOT NULL,
  `Detalle` text NOT NULL,
  `Imagen` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `TextImage` varchar(150) NOT NULL,
  `AlineaImg` varchar(10) NOT NULL,
  `Video` varchar(20) NOT NULL,
  `TextVideo` varchar(150) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Portada` tinyint(1) NOT NULL DEFAULT '0',
  `Destacada` tinyint(1) NOT NULL DEFAULT '0',
  `CategoriaID` varchar(10) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `AddComment` tinyint(1) NOT NULL DEFAULT '1',
  `Views` int(20) NOT NULL DEFAULT '0',
  `Shared` int(20) NOT NULL DEFAULT '0',
  `Comments` int(20) NOT NULL DEFAULT '0',
  `UsuarioID` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_provincias`
--

CREATE TABLE `aws_provincias` (
  `ID` int(2) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_provincias`
--

INSERT INTO `aws_provincias` (`ID`, `Nombre`) VALUES
(1, 'BUENOS AIRES'),
(2, 'CATAMARCA'),
(3, 'CHACO'),
(4, 'CHUBUT'),
(5, 'CORDOBA'),
(6, 'CORRIENTES'),
(7, 'ENTRE RIOS'),
(8, 'FORMOSA'),
(9, 'JUJUY'),
(10, 'LA PAMPA'),
(11, 'LA RIOJA'),
(12, 'MENDOZA'),
(13, 'MISIONES'),
(14, 'NEUQUEN'),
(15, 'RIO NEGRO'),
(16, 'SALTA'),
(17, 'SAN JUAN'),
(18, 'SAN LUIS'),
(19, 'SANTA CRUZ'),
(20, 'SANTA FE'),
(21, 'SANTIAGO DEL ESTERO'),
(22, 'TIERRA DEL FUEGO'),
(23, 'TUCUMAN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_rating`
--

CREATE TABLE `aws_rating` (
  `ID` bigint(10) NOT NULL,
  `EmpresaID` varchar(10) NOT NULL,
  `UsuarioID` varchar(10) NOT NULL,
  `EventoID` varchar(10) NOT NULL,
  `Tipo` tinyint(1) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_seccion`
--

CREATE TABLE `aws_seccion` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Sumario` text COLLATE utf8_unicode_ci NOT NULL,
  `Detalle` text COLLATE utf8_unicode_ci NOT NULL,
  `Imagen` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `TextImage` text COLLATE utf8_unicode_ci NOT NULL,
  `AlineaImg` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Video` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `TextVideo` text COLLATE utf8_unicode_ci NOT NULL,
  `IsTop` tinyint(1) NOT NULL DEFAULT '0',
  `IsBot` tinyint(1) NOT NULL DEFAULT '1',
  `MenuTop` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `MenuBot` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `IsForm` tinyint(1) NOT NULL DEFAULT '0',
  `Posicion` int(5) NOT NULL,
  `PadreID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PlantillaID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TablaSec` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Icono` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aws_seccion`
--

INSERT INTO `aws_seccion` (`ID`, `Publico`, `Titulo`, `Sumario`, `Detalle`, `Imagen`, `TextImage`, `AlineaImg`, `Video`, `TextVideo`, `IsTop`, `IsBot`, `MenuTop`, `MenuBot`, `IsForm`, `Posicion`, `PadreID`, `URL`, `PlantillaID`, `TablaSec`, `Icono`) VALUES
(4, 1, 'Outsourcing IT', '<p>Somos especialistas en el manejo de esas actividades que tu firma&nbsp;<strong>debe externalizar estrat&eacute;gicamente</strong>&nbsp;para las cuales no tiene ni una&nbsp;<strong>necesidad cr&iacute;tica ni capacidades especiales</strong>.</p>\r\n', '', '9619875.jpg', '', 'right', '', '', 0, 0, '', '', 0, 1, '0', 'outsourcing-it', '0', NULL, NULL),
(5, 1, 'Software Factoring', '<p>Nuestro objetivo es asistir a nuestros clientes en la obtenci&oacute;n de soluciones pr&aacute;cticas en tiempo y calidad, fundamentadas en las&nbsp;<strong>necesidades reales de su organizaci&oacute;n</strong>.</p>\r\n\r\n<p>La integraci&oacute;n de tecno</p>\r\n', '', '', '', 'right', '', '', 0, 0, '', '', 0, 2, '0', 'software-factoring', '0', NULL, NULL),
(6, 1, 'ConsultorÃ­a y CapacitaciÃ³n', '<p>Estudiamos el funcionamiento , la seguridad de los procesos, los procedimientos y aplicaciones inform&aacute;ticas&nbsp;<strong>definiendo el nivel de madurez de acuerdo a los est&aacute;ndares del mercado</strong>.</p>\r\n\r\n<p>El continuo cambio en las</p>\r\n', '', '', '', 'right', '', '', 0, 0, '', '', 0, 3, '0', 'consultoria-capacitacion', '0', NULL, NULL),
(7, 1, 'Cloud Solutions', '<p>Somos&nbsp;<strong>proveedores de servicios en la nube (CSP)</strong>&nbsp;ya que ofrecemos a las organizaciones recursos de servicios p&uacute;blicos, como m&aacute;quinas virtuales, redes y capacidad de almacenamiento.</p>\r\n\r\n<p>La plataformas en la nube son estructuras de soporte que facilitan los entornos de desarrollo mediante&nbsp;<strong>recursos agrupados y escalables</strong>.Tambi&eacute;n hay servicios de software que ofrecen aplicaciones que utilizan una arquitectura multitenant.</p>\r\n\r\n<p>Los recursos de la nube pueden vivir tanto dentro como fuera de las instalaciones, o una combinaci&oacute;n de ambos, empleando un&nbsp;<strong>modelo de nube h&iacute;brido</strong>.</p>\r\n', '', '', '', 'right', '', '', 0, 0, '', '', 0, 4, '0', 'cloud-solutions', '0', NULL, NULL),
(8, 1, 'Internet Service Provider', '<p>Proveemos el servicio de internet wireless mas confiable del mercado&nbsp;<strong>las 24 horas, sin necesidad de telefon&iacute;a ni cable</strong>,&nbsp;con planes que se&nbsp;<strong>ajustan a tus necesidades</strong>.</p>\r\n', '', '', '', 'right', '', '', 0, 0, '', '', 0, 5, '0', 'internet-service-provider', '4', 'planes', NULL),
(9, 1, 'Networking Solutions', '<p>Somos&nbsp;<strong>especialistas en proyectos de despliegue&nbsp;</strong>de redes inal&aacute;mbricas, redes de datos, VoIP y seguridad, siguiendo los&nbsp;<strong>m&aacute;s altos est&aacute;ndares de calidad&nbsp;</strong>y adaptados a las necesidad</p>\r\n', '', '', '', 'right', '', '', 0, 0, '', '', 0, 6, '0', 'networking-solutions', '0', NULL, NULL),
(10, 1, 'Soporte TecnolÃ³gico', '<p>Brindamos soluciones profesionales para el servicio de soporte t&eacute;cnico para empresas <strong>integrando la tecnolog&iacute;a a sus procesos de negocios</strong> para ayudarlo a reducir costos y descentralizar la<strong> gestion de todos sus&nbsp;recursos inform&aacute;ticos.</strong></p>\r\n', '', '', '', 'right', '', '', 0, 0, '', '', 0, 7, '0', 'soporte-tecnologico', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_servicios`
--

CREATE TABLE `aws_servicios` (
  `ID` int(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(150) NOT NULL,
  `Descripcion` text,
  `Icono` varchar(60) DEFAULT NULL,
  `URL` varchar(150) DEFAULT NULL,
  `Estilo` varchar(60) DEFAULT NULL,
  `Delay` int(3) NOT NULL DEFAULT '0',
  `Posicion` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_servicios`
--

INSERT INTO `aws_servicios` (`ID`, `Publico`, `Titulo`, `Descripcion`, `Icono`, `URL`, `Estilo`, `Delay`, `Posicion`) VALUES
(1, 1, 'Outsourcing</br>IT', '', 'zmdi zmdi-accounts ', 'outsourcing-it', 'blue', 4, 1),
(2, 1, 'Software Factoring', '', 'zmdi zmdi-laptop-chromebook ', 'software-factoring', 'warning', 8, 2),
(3, 1, 'ConsultorÃ­a y CapacitaciÃ³n', '', 'fa fa-briefcase', 'consultoria-capacitacion', 'success', 10, 3),
(4, 1, 'Cloud Solutions', '', 'fa fa-cloud', 'cloud-solutions', 'royal', 6, 4),
(5, 1, '</br> ISP', '', 'zmdi zmdi-wifi-alt', 'internet-service-provider', 'primary', 2, 5),
(6, 1, 'Networking Solutions', '', 'fa fa-plug', 'networking-solutions', 'danger', 8, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_social_net`
--

CREATE TABLE `aws_social_net` (
  `ID` bigint(20) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Titulo` varchar(100) NOT NULL,
  `URL` varchar(255) NOT NULL,
  `Imagen` varchar(100) NOT NULL,
  `Icono` varchar(30) NOT NULL,
  `Posicion` tinyint(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_social_net`
--

INSERT INTO `aws_social_net` (`ID`, `Publico`, `Titulo`, `URL`, `Imagen`, `Icono`, `Posicion`) VALUES
(1, 1, 'Facebook', 'https://www.facebook.com/', '', 'facebook', 0),
(2, 1, 'Twitter', 'https://www.twitter.com/', '', 'twitter', 0),
(3, 1, 'Instagram', 'https://www.instagram.com/', '', 'instagram', 0),
(4, 1, 'Youtube', 'https://www.youtube.com', '', 'youtube', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_sys_group_user`
--

CREATE TABLE `aws_sys_group_user` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Nombre` varchar(60) NOT NULL,
  `Posicion` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_sys_group_user`
--

INSERT INTO `aws_sys_group_user` (`ID`, `Publico`, `Nombre`, `Posicion`) VALUES
(1, 1, 'Administrador', 1),
(2, 1, 'Gestor', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_sys_menu_left`
--

CREATE TABLE `aws_sys_menu_left` (
  `ID` bigint(10) UNSIGNED NOT NULL,
  `Publico` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `Titulo` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Imagen` varchar(150) NOT NULL,
  `Role` varchar(10) NOT NULL DEFAULT '0,1',
  `Posicion` tinyint(2) NOT NULL DEFAULT '0',
  `PadreID` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `MenuID` varchar(10) NOT NULL DEFAULT '1',
  `Tabla` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Url` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_sys_menu_left`
--

INSERT INTO `aws_sys_menu_left` (`ID`, `Publico`, `Titulo`, `Imagen`, `Role`, `Posicion`, `PadreID`, `MenuID`, `Tabla`, `Url`) VALUES
(1, 1, 'Home', 'home', '0,1', 1, '0', '1', '', ''),
(3, 1, 'Configuraci&oacute;n', '', '0,1', 2, '51', '1', 'config', 'listar'),
(4, 1, 'Banners', 'puzzle-piece', '0,1', 1, '0', '1', '', ''),
(5, 1, 'Slider Principal', '', '0,1', 1, '4', '1', 'banner_top', 'listar'),
(6, 2, 'Banners Home', '', '0,1', 2, '4', '1', 'banner_wrap', 'listar'),
(7, 1, 'Secciones', 'edit', '0,1', 2, '0', '1', '', ''),
(8, 1, 'Publicas', '', '0,1', 1, '7', '1', 'seccion', 'listar/1'),
(9, 1, 'Borradores', '', '0,1', 2, '7', '1', 'seccion', 'listar/2'),
(10, 1, 'Archivadas', '', '0,1', 3, '7', '1', 'seccion', 'listar/3'),
(11, 2, 'Blog', 'list-alt', '0,1,2', 7, '0', '1', '', ''),
(12, 1, 'Categor&iacute;as', '', '0,1', 4, '11', '1', 'categoria', 'listar'),
(13, 1, 'Publicadas', '', '0,1', 1, '11', '1', 'noticia', 'listar/1'),
(14, 1, 'Borradores', '', '0,1', 2, '11', '1', 'noticia', 'listar/2'),
(15, 1, 'Archivadas', '', '0,1', 3, '11', '1', 'noticia', 'listar/3'),
(16, 1, 'Sociales', 'link', '0,1', 9, '0', '1', '', ''),
(17, 1, 'Redes Sociales', '', '0,1', 6, '16', '1', 'social_net', 'listar'),
(52, 1, 'Menu Principal', '', '0,1', 2, '51', '1', 'sys_menu_left', 'listar'),
(51, 1, 'Sistema', 'gear', '0,1', 10, '0', '1', '', ''),
(50, 1, 'No Deseado', '', '0,1', 5, '35', '1', 'correo', 'listar/6'),
(49, 1, 'Enviados', '', '0,1', 4, '35', '1', 'correo', 'listar/5'),
(26, 2, 'Newsletter', 'clipboard', '0,1', 5, '0', '1', '', ''),
(27, 1, 'Enviados', '', '0,1', 1, '26', '1', 'newsletter', 'listar/1'),
(28, 1, 'Borradores', '', '0,1', 2, '26', '1', 'newsletter', 'listar/2'),
(29, 1, 'Categor&iacute;as', '', '0,1', 3, '26', '1', 'news_group', 'listar'),
(30, 1, 'Emails', '', '0,1', 4, '26', '1', 'news_email', 'listar'),
(31, 2, 'Tipos de Banner', '', '0,1', 3, '4', '1', 'banner_type', 'listar'),
(32, 2, 'GalerÃ­as', 'table', '0,1', 7, '0', '1', '', ''),
(33, 1, 'Fotos', '', '0,1', 1, '32', '1', 'galerias', 'listar/1'),
(34, 1, 'Videos', '', '0,1', 2, '32', '1', 'galerias', 'listar/2'),
(35, 2, 'Correo ElectrÃ³nico', 'font', '0,1', 10, '0', '1', '', ''),
(36, 1, 'Bandeja de Entrada', '', '0,1', 1, '35', '1', 'correo', 'listar/1'),
(37, 1, 'Borradores', '', '0,1', 2, '35', '1', 'correo', 'listar/2'),
(38, 1, 'Archivados', '', '0,1', 3, '35', '1', 'correo', 'listar/3'),
(39, 1, 'Eliminados', '', '0,1', 6, '35', '1', 'correo', 'listar/4'),
(41, 2, 'Grupos de Usuarios', '', '0,1', 4, '40', '1', 'group_users', 'listar'),
(45, 0, 'Encuestas', 'bar-chart-o', '0,1', 9, '0', '1', '', ''),
(46, 1, 'Publicadas', '', '0,1', 1, '45', '1', 'encuesta', 'listar/1'),
(47, 1, 'Borradores', '', '0,1', 2, '45', '1', 'encuesta', 'listar/2'),
(48, 1, 'Archivadas', '', '0,1', 3, '45', '1', 'encuesta', 'listar/3'),
(53, 1, 'Usuarios', '', '0,1', 3, '51', '1', 'sys_user', 'listar'),
(54, 1, 'Tablas', '', '0,1', 4, '51', '1', 'sys_tables', 'listar'),
(55, 0, 'Formularios', '', '0,1', 5, '51', '1', 'sys_form', 'listar'),
(72, 1, 'CategorÃ­as', '', '0,1,2', 4, '68', '1', 'categorias', 'listar/1'),
(71, 1, 'Archivadas', '', '0,1,2', 3, '68', '1', 'posts', 'listar/3'),
(70, 1, 'Borradores', '', '0,1,2', 2, '68', '1', 'posts', 'listar/2'),
(69, 1, 'PÃºblicas', '', '0,1,2', 1, '68', '1', 'posts', 'listar/1'),
(68, 1, 'Blog', 'edit', '0,1,2', 8, '0', '1', '', ''),
(67, 1, 'Plantillas', '', '0,1', 10, '51', '1', 'plantillas', 'listar'),
(73, 1, 'Clientes', 'user', '0,1', 3, '0', '1', 'clientes', 'listar'),
(74, 1, 'Planes', 'list', '0,1', 7, '0', '1', 'planes', 'listar'),
(75, 1, 'Servicios', 'calendar', '0,1', 4, '0', '1', 'servicios', 'listar'),
(76, 1, 'Partners', 'edit', '0,1', 6, '0', '1', 'partners', 'listar'),
(77, 1, 'Portfolio', 'calendar', '0,1', 5, '0', '1', 'portfolio', 'listar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_sys_tables`
--

CREATE TABLE `aws_sys_tables` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `Titulo` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aws_sys_tables`
--

INSERT INTO `aws_sys_tables` (`ID`, `Publico`, `Nombre`, `Titulo`) VALUES
(1, 1, 'posts', 'Entradas'),
(2, 1, 'categorias', 'CategorÃ­as'),
(3, 1, 'clientes', 'Clientes'),
(4, 1, 'planes', 'Planes'),
(5, 1, 'servicios', 'Servicios'),
(6, 1, 'partners', 'Partners'),
(7, 1, 'portfolio', 'Portfolio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_sys_tracking`
--

CREATE TABLE `aws_sys_tracking` (
  `ID` bigint(10) NOT NULL,
  `Tabla` varchar(60) NOT NULL,
  `TablaID` varchar(10) NOT NULL,
  `Filename` varchar(255) NOT NULL,
  `UrlVisited` varchar(255) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `Host` varchar(255) NOT NULL,
  `Navegador` varchar(255) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` time NOT NULL,
  `IsHome` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aws_sys_tracking`
--

INSERT INTO `aws_sys_tracking` (`ID`, `Tabla`, `TablaID`, `Filename`, `UrlVisited`, `IP`, `Host`, `Navegador`, `Fecha`, `Hora`, `IsHome`) VALUES
(1, '', '0', '/pagina/index.php', 'http://localhost/pagina/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-05', '12:46:44', 0),
(2, '', '0', '/pagina/index.php', 'http://localhost/pagina/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-05', '12:56:23', 0),
(3, '', '0', '/pagina/index.php', 'http://localhost/pagina/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-05', '16:53:12', 0),
(4, '', '0', '/pagina/index.php', 'http://localhost/pagina/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-05', '16:54:38', 0),
(5, '', '0', '/pagina/index.php', 'http://localhost/pagina/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-05', '16:55:15', 0),
(6, '', '0', '/pagina/index.php', 'http://localhost/pagina/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-05', '16:55:54', 0),
(7, '', '0', '/pagina/index.php', 'http://localhost/pagina/index.php', '::1', 'Dell-PC', 'Firefox / 53.0', '2017-07-06', '15:01:11', 0),
(8, '', '0', '/pagina/index.php', 'http://localhost/pagina/index.php', '::1', 'Dell-PC', 'Firefox / 53.0', '2017-07-06', '15:09:39', 0),
(9, '', '0', '/pagina/index.php', 'http://localhost/pagina/index.php', '::1', 'Dell-PC', 'Firefox / 53.0', '2017-07-06', '15:12:06', 0),
(10, '', '0', '/pagina/index.php', 'http://localhost/pagina/index.php', '::1', 'Dell-PC', 'Firefox / 53.0', '2017-07-06', '15:13:09', 0),
(11, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '15:29:04', 0),
(12, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '15:40:47', 0),
(13, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:21:47', 0),
(14, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:32:10', 0),
(15, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:32:27', 0),
(16, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:32:40', 0),
(17, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:32:54', 0),
(18, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:33:06', 0),
(19, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:33:21', 0),
(20, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:34:49', 0),
(21, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:53:37', 0),
(22, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:54:33', 0),
(23, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:56:23', 0),
(24, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '16:56:57', 0),
(25, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:01:22', 0),
(26, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:01:55', 0),
(27, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:02:36', 0),
(28, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/index.php', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '17:18:48', 0),
(29, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:21:54', 0),
(30, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:22:18', 0),
(31, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:23:16', 0),
(32, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:23:25', 0),
(33, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:24:08', 0),
(34, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:27:30', 0),
(35, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:29:34', 0),
(36, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:41:23', 0),
(37, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:41:55', 0),
(38, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:46:01', 0),
(39, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:58:25', 0),
(40, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-06', '17:58:42', 0),
(41, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:05:47', 0),
(42, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:07:02', 0),
(43, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:07:48', 0),
(44, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:08:53', 0),
(45, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/servicios', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:09:01', 1),
(46, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:09:02', 0),
(47, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:09:37', 0),
(48, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:10:16', 0),
(49, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Firefox / 54.0', '2017-07-06', '18:11:09', 0),
(50, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '15:02:41', 0),
(51, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:41:15', 0),
(52, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:41:29', 0),
(53, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:41:51', 0),
(54, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:42:35', 0),
(55, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:42:58', 0),
(56, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:43:53', 0),
(57, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:44:06', 0),
(58, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:52:33', 0),
(59, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:55:52', 0),
(60, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '16:56:58', 0),
(61, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:15:34', 0),
(62, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:16:34', 0),
(63, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:17:28', 0),
(64, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:23:05', 0),
(65, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:23:25', 0),
(66, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:23:37', 0),
(67, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:24:31', 0),
(68, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:24:54', 0),
(69, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:28:39', 0),
(70, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:29:59', 0),
(71, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:31:04', 0),
(72, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:31:18', 0),
(73, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:35:28', 0),
(74, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '17:36:54', 0),
(75, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:06:34', 0),
(76, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:06:58', 0),
(77, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:09:30', 0),
(78, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/servicios', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:09:33', 1),
(79, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/servicios', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:10:16', 1),
(80, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/servicios', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:10:20', 1),
(81, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/servicios', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:10:32', 1),
(82, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/servicios', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:11:45', 1),
(83, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/servicios', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-07', '18:12:09', 1),
(84, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '10:52:04', 0),
(85, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '10:52:24', 0),
(86, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '10:53:19', 0),
(87, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '10:58:23', 0),
(88, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:00:06', 0),
(89, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:00:47', 0),
(90, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:01:04', 0),
(91, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:01:15', 0),
(92, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:13:19', 0),
(93, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:15:49', 0),
(94, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:41:27', 0),
(95, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:48:16', 0),
(96, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:48:37', 0),
(97, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:50:47', 0),
(98, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:50:58', 0),
(99, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:53:05', 0),
(100, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:53:15', 0),
(101, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:56:42', 0),
(102, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:56:49', 0),
(103, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '11:58:03', 0),
(104, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:29:13', 0),
(105, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:30:02', 0),
(106, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:31:15', 0),
(107, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:32:47', 0),
(108, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:36:48', 0),
(109, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:37:06', 0),
(110, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:42:37', 0),
(111, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:43:02', 0),
(112, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:43:29', 0),
(113, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:43:51', 0),
(114, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:50:36', 0),
(115, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:56:07', 0),
(116, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '12:58:08', 0),
(117, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:01:53', 0),
(118, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:02:30', 0),
(119, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:07:52', 0),
(120, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:09:01', 0),
(121, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:15:32', 0),
(122, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:17:14', 0),
(123, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:19:41', 0),
(124, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:20:08', 0),
(125, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:20:41', 0),
(126, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:24:24', 0),
(127, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:25:31', 0),
(128, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:31:36', 0),
(129, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:33:33', 0),
(130, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '13:39:07', 0),
(131, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:04:07', 0),
(132, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:06:57', 0),
(133, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:07:17', 0),
(134, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:07:35', 0),
(135, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:08:20', 0),
(136, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:56:41', 0),
(137, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:57:15', 0),
(138, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:58:51', 0),
(139, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '14:59:02', 0),
(140, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:14:25', 0),
(141, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:17:26', 0),
(142, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:21:53', 0),
(143, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:22:30', 0),
(144, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:27:06', 0),
(145, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:27:46', 0),
(146, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:40:23', 0),
(147, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:41:15', 0),
(148, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:42:38', 0),
(149, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:42:56', 0),
(150, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:43:27', 0),
(151, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:45:32', 0),
(152, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:46:14', 0),
(153, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:46:35', 0),
(154, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:48:44', 0),
(155, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:49:07', 0),
(156, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:49:43', 0),
(157, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '15:50:40', 0),
(158, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:05:30', 0),
(159, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:05:49', 0),
(160, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:06:24', 0),
(161, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:06:44', 0),
(162, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:08:26', 0),
(163, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:09:27', 0),
(164, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:09:33', 0),
(165, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:15:19', 0),
(166, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:15:57', 0),
(167, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:16:18', 0),
(168, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:27:18', 0),
(169, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:45:26', 0),
(170, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '16:48:02', 0),
(171, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:01:34', 0),
(172, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:02:35', 0),
(173, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:02:54', 0),
(174, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:09:48', 0),
(175, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=la+puntilla', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:37:10', 0),
(176, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:37:19', 0),
(177, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:46:05', 0),
(178, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:47:58', 0),
(179, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:48:32', 0),
(180, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-10', '17:49:24', 0),
(181, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '15:22:59', 0),
(182, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '16:29:11', 0),
(183, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '16:34:31', 0),
(184, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '16:35:20', 0),
(185, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '16:35:47', 0),
(186, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '16:37:39', 0),
(187, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '16:37:58', 0),
(188, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '16:39:37', 0),
(189, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:18:47', 0),
(190, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:19:02', 0),
(191, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:20:35', 0),
(192, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:20:43', 0),
(193, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:21:53', 0),
(194, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:22:13', 0),
(195, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:22:24', 0),
(196, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:22:37', 0),
(197, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:25:44', 0),
(198, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '17:46:16', 0),
(199, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-11', '18:00:47', 0),
(200, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '10:31:26', 0),
(201, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '10:39:13', 0),
(202, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '10:39:48', 0),
(203, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '10:41:43', 0),
(204, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '10:41:59', 0),
(205, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '10:42:05', 0),
(206, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '10:42:15', 0),
(207, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:05:08', 0),
(208, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:09:39', 0),
(209, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:20:28', 0),
(210, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:25:33', 0),
(211, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:26:17', 0),
(212, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:26:28', 0),
(213, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:28:31', 0),
(214, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:29:08', 0),
(215, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:30:19', 0),
(216, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '11:31:18', 0),
(217, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:01:52', 0),
(218, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:03:09', 0),
(219, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:06:11', 0),
(220, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:07:19', 0),
(221, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:08:02', 0),
(222, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:08:19', 0),
(223, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:09:28', 0),
(224, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:56:15', 0),
(225, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:57:19', 0),
(226, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '13:58:43', 0),
(227, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:02:30', 0),
(228, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:08:53', 0),
(229, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:09:24', 0),
(230, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:12:05', 0),
(231, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:12:27', 0),
(232, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:13:05', 0),
(233, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:16:00', 0),
(234, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:16:56', 0),
(235, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:18:02', 0),
(236, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:18:12', 0),
(237, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:18:37', 0),
(238, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:19:19', 0),
(239, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:20:49', 0),
(240, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:27:19', 0),
(241, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:31:04', 0),
(242, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:40:37', 0),
(243, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '16:49:05', 0),
(244, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:15:53', 0),
(245, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:17:37', 0),
(246, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:20:03', 0),
(247, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:20:29', 0),
(248, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:25:01', 0),
(249, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:26:43', 0),
(250, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:29:52', 0),
(251, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:35:45', 0),
(252, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:35:56', 0),
(253, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:36:13', 0),
(254, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:36:26', 0),
(255, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:36:41', 0),
(256, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:36:48', 0),
(257, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:37:16', 0),
(258, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:40:01', 0),
(259, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:40:10', 0),
(260, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-12', '17:40:21', 0),
(261, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '09:52:37', 0),
(262, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '11:54:12', 0),
(263, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '11:57:17', 0),
(264, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:01:06', 0),
(265, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:05:04', 0),
(266, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:07:15', 0),
(267, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:08:13', 0),
(268, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:08:34', 0),
(269, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:09:25', 0),
(270, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:10:37', 0),
(271, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:11:06', 0),
(272, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:12:22', 0),
(273, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:12:37', 0),
(274, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:13:12', 0),
(275, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:19:38', 0),
(276, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:21:16', 0),
(277, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:22:05', 0),
(278, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:22:56', 0),
(279, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:25:03', 0),
(280, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:25:46', 0),
(281, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '::1', 'Dell-PC', 'Chrome / 59.0.3071.115', '2017-07-13', '12:28:26', 0),
(282, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-13', '13:10:45', 0),
(283, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:12:49', 0),
(284, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:14:08', 0),
(285, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:16:38', 0),
(286, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:21:06', 0),
(287, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:30:23', 0),
(288, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:30:35', 0),
(289, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:30:54', 0),
(290, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:31:08', 0),
(291, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:31:33', 0),
(292, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:32:05', 0),
(293, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:32:59', 0),
(294, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '13:35:45', 0),
(295, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-13', '13:39:29', 0),
(296, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '14:28:49', 0),
(297, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '14:33:54', 0),
(298, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '14:36:33', 0),
(299, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '14:45:46', 0),
(300, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '14:51:19', 0),
(301, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '14:59:16', 0),
(302, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:01:46', 0),
(303, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:02:30', 0),
(304, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:02:45', 0),
(305, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:08:31', 0),
(306, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:09:04', 0),
(307, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:10:29', 0),
(308, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:15:13', 0),
(309, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:17:54', 0),
(310, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:20:09', 0),
(311, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:22:19', 0),
(312, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:23:17', 0),
(313, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:35:59', 0),
(314, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:38:05', 0),
(315, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:38:40', 0),
(316, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:42:42', 0),
(317, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:51:20', 0),
(318, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:52:02', 0),
(319, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-13', '15:53:32', 0),
(320, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:53:36', 0),
(321, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:54:22', 0),
(322, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:54:35', 0),
(323, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:54:59', 0),
(324, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:57:27', 0),
(325, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '15:58:41', 0),
(326, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:01:15', 0),
(327, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:01:39', 0),
(328, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:02:26', 0),
(329, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:03:34', 0),
(330, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:06:42', 0),
(331, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-13', '16:12:01', 0),
(332, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-13', '16:12:02', 0),
(333, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-13', '16:13:03', 0),
(334, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-13', '16:13:18', 0),
(335, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:21:47', 0),
(336, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:23:47', 0),
(337, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:24:27', 0),
(338, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:24:42', 0),
(339, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:24:49', 0),
(340, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:25:50', 0),
(341, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:26:40', 0),
(342, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:32:17', 0),
(343, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:34:40', 0),
(344, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:35:31', 0);
INSERT INTO `aws_sys_tracking` (`ID`, `Tabla`, `TablaID`, `Filename`, `UrlVisited`, `IP`, `Host`, `Navegador`, `Fecha`, `Hora`, `IsHome`) VALUES
(345, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:39:44', 0),
(346, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:40:04', 0),
(347, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:40:37', 0),
(348, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:41:13', 0),
(349, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:41:42', 0),
(350, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:42:03', 0),
(351, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:42:22', 0),
(352, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:43:03', 0),
(353, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:45:05', 0),
(354, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:46:22', 0),
(355, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:46:59', 0),
(356, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:47:09', 0),
(357, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:47:18', 0),
(358, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:47:56', 0),
(359, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '16:49:49', 0),
(360, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:20:07', 0),
(361, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:20:22', 0),
(362, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/?q=IT', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:20:39', 0),
(363, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:22:13', 0),
(364, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:27:26', 0),
(365, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:28:45', 0),
(366, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:29:02', 0),
(367, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:29:11', 0),
(368, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:29:38', 0),
(369, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:30:11', 0),
(370, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:30:30', 0),
(371, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:31:03', 0),
(372, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:31:30', 0),
(373, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:32:02', 0),
(374, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:33:19', 0),
(375, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:38:04', 0),
(376, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:39:45', 0),
(377, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:40:05', 0),
(378, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:41:15', 0),
(379, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:42:17', 0),
(380, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:43:41', 0),
(381, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:44:07', 0),
(382, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:44:43', 0),
(383, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:45:16', 0),
(384, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:46:20', 0),
(385, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:46:40', 0),
(386, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:46:56', 0),
(387, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:47:14', 0),
(388, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-13', '17:47:57', 0),
(389, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:38:29', 0),
(390, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:40:18', 0),
(391, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:40:40', 0),
(392, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:41:09', 0),
(393, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:41:40', 0),
(394, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:42:34', 0),
(395, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:48:29', 0),
(396, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:48:54', 0),
(397, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:49:02', 0),
(398, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:49:10', 0),
(399, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:51:43', 0),
(400, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:52:04', 0),
(401, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '16:52:20', 0),
(402, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-14', '18:08:18', 0),
(403, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-17', '10:53:13', 0),
(404, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-17', '10:55:18', 0),
(405, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-17', '10:55:48', 0),
(406, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-17', '10:56:07', 0),
(407, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-17', '18:06:07', 0),
(408, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-19', '12:24:52', 0),
(409, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-19', '12:25:26', 0),
(410, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '10:34:41', 0),
(411, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '10:43:50', 0),
(412, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '10:45:00', 0),
(413, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '10:45:15', 0),
(414, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '10:48:46', 0),
(415, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '10:49:32', 0),
(416, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:19:54', 0),
(417, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:20:22', 0),
(418, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:23:00', 0),
(419, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:23:41', 0),
(420, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:26:01', 0),
(421, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:26:12', 0),
(422, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:30:50', 0),
(423, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:31:22', 0),
(424, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:31:50', 0),
(425, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:32:38', 0),
(426, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:32:57', 0),
(427, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:34:28', 0),
(428, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '13:34:49', 0),
(429, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '16:40:11', 0),
(430, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '16:48:07', 0),
(431, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '16:49:29', 0),
(432, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-24', '16:50:29', 0),
(433, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '10:29:09', 0),
(434, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '10:34:37', 0),
(435, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '10:35:48', 0),
(436, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '10:42:12', 0),
(437, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '11:24:19', 0),
(438, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '11:27:18', 0),
(439, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '11:31:46', 0),
(440, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '11:32:22', 0),
(441, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '11:44:14', 0),
(442, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '11:59:53', 0),
(443, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '12:42:11', 0),
(444, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '12:44:33', 0),
(445, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '12:45:12', 0),
(446, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '12:48:56', 0),
(447, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '12:53:32', 0),
(448, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:06:23', 0),
(449, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:07:13', 0),
(450, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:07:45', 0),
(451, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:12:14', 0),
(452, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:14:27', 0),
(453, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:15:00', 0),
(454, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:16:26', 0),
(455, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:26:22', 0),
(456, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:30:13', 0),
(457, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:35:07', 0),
(458, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:36:08', 0),
(459, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:36:29', 0),
(460, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:37:31', 0),
(461, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:37:49', 0),
(462, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:41:28', 0),
(463, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:44:20', 0),
(464, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:46:11', 0),
(465, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:46:58', 0),
(466, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:47:44', 0),
(467, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:48:35', 0),
(468, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:49:50', 0),
(469, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:55:29', 0),
(470, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '13:59:53', 0),
(471, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:02:47', 0),
(472, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:12:33', 0),
(473, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:19:23', 0),
(474, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup//clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:19:25', 0),
(475, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:19:39', 0),
(476, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:19:46', 0),
(477, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:21:00', 0),
(478, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:21:52', 0),
(479, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:23:27', 0),
(480, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:23:32', 0),
(481, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:23:49', 0),
(482, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:23:52', 0),
(483, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:24:38', 0),
(484, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:24:50', 0),
(485, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:29:36', 0),
(486, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:29:40', 0),
(487, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:29:45', 0),
(488, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:30:07', 0),
(489, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:31:16', 0),
(490, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:32:00', 0),
(491, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '14:32:15', 0),
(492, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '15:46:03', 0),
(493, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '15:46:08', 0),
(494, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '15:55:31', 0),
(495, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '15:57:07', 0),
(496, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '15:59:34', 0),
(497, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:09:36', 0),
(498, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:19:25', 0),
(499, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:23:50', 0),
(500, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:24:50', 0),
(501, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:27:53', 0),
(502, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:53:23', 0),
(503, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:54:12', 0),
(504, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:57:20', 0),
(505, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '16:58:04', 0),
(506, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:04:36', 0),
(507, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:15:23', 0),
(508, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:16:29', 0),
(509, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:17:15', 0),
(510, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:18:31', 0),
(511, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:18:47', 0),
(512, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:21:49', 0),
(513, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:22:49', 0),
(514, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:25:14', 0),
(515, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:25:51', 0),
(516, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:26:14', 0),
(517, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:31:22', 0),
(518, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:31:45', 0),
(519, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:32:27', 0),
(520, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:32:46', 0),
(521, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:33:59', 0),
(522, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:34:01', 0),
(523, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:35:20', 0),
(524, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:45:39', 0),
(525, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:46:23', 0),
(526, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '17:47:32', 0),
(527, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '18:02:37', 0),
(528, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '18:05:23', 0),
(529, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '18:06:37', 0),
(530, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-26', '18:07:35', 0),
(531, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '10:52:27', 0),
(532, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-27', '11:25:20', 0),
(533, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-27', '11:26:18', 0),
(534, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-27', '11:26:22', 0),
(535, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-27', '11:33:13', 0),
(536, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:01:41', 0),
(537, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:03:45', 0),
(538, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:04:52', 0),
(539, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:06:49', 0),
(540, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:07:12', 0),
(541, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:09:04', 0),
(542, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:41:30', 0),
(543, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:45:20', 0),
(544, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:50:00', 0),
(545, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:52:02', 0),
(546, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:52:45', 0),
(547, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:52:53', 0),
(548, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:53:42', 0),
(549, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:55:30', 0),
(550, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:55:39', 0),
(551, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:56:07', 0),
(552, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:56:45', 0),
(553, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:56:53', 0),
(554, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:57:32', 0),
(555, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:57:48', 0),
(556, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:58:33', 0),
(557, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:58:50', 0),
(558, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:59:15', 0),
(559, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:59:20', 0),
(560, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '13:59:30', 0),
(561, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '14:02:11', 0),
(562, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '14:06:16', 0),
(563, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '14:07:23', 0),
(564, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '14:08:40', 0),
(565, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '14:09:04', 0),
(566, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '14:09:30', 0),
(567, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:09:13', 0),
(568, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:09:29', 0),
(569, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:11:12', 0),
(570, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:12:09', 0),
(571, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:14:30', 0),
(572, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:14:41', 0),
(573, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:16:31', 0),
(574, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:17:12', 0),
(575, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:19:56', 0),
(576, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:24:48', 0),
(577, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:25:40', 0),
(578, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-27', '15:26:41', 0),
(579, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:27:44', 0),
(580, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:28:16', 0),
(581, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:29:19', 0),
(582, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:32:54', 0),
(583, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:34:56', 0),
(584, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:35:04', 0),
(585, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:36:18', 0),
(586, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:38:27', 0),
(587, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:38:54', 0),
(588, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:40:28', 0),
(589, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:40:50', 0),
(590, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:40:59', 0),
(591, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '15:41:52', 0),
(592, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:15:11', 0),
(593, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:16:25', 0),
(594, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:18:29', 0),
(595, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:20:06', 0),
(596, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:20:49', 0),
(597, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:21:09', 0),
(598, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:21:51', 0),
(599, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:22:28', 0),
(600, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:23:09', 0),
(601, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:24:37', 0),
(602, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:26:33', 0),
(603, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:27:11', 0),
(604, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:27:49', 0),
(605, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:31:33', 0),
(606, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:48:53', 0),
(607, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:49:17', 0),
(608, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:49:58', 0),
(609, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:50:02', 0),
(610, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:50:13', 0),
(611, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:50:19', 0),
(612, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:51:34', 0),
(613, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:51:38', 0),
(614, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:51:49', 0),
(615, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:52:01', 0),
(616, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:52:12', 0),
(617, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:52:15', 0),
(618, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:52:17', 0),
(619, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:52:48', 0),
(620, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:53:08', 0),
(621, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:53:29', 0),
(622, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:56:07', 0),
(623, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:56:19', 0),
(624, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '16:56:33', 0),
(625, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '17:37:22', 0),
(626, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '17:45:45', 0),
(627, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '18:03:38', 0),
(628, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '18:03:41', 0),
(629, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '18:04:45', 0),
(630, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-27', '18:13:20', 0),
(631, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '10:33:05', 0),
(632, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '12:52:24', 0),
(633, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '12:56:23', 0),
(634, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '12:56:38', 0),
(635, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '12:56:52', 0),
(636, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '12:57:12', 0),
(637, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '12:57:38', 0),
(638, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '12:57:51', 0),
(639, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '12:59:58', 0),
(640, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '13:02:09', 0);
INSERT INTO `aws_sys_tracking` (`ID`, `Tabla`, `TablaID`, `Filename`, `UrlVisited`, `IP`, `Host`, `Navegador`, `Fecha`, `Hora`, `IsHome`) VALUES
(641, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '13:03:18', 0),
(642, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '13:04:03', 0),
(643, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '13:18:45', 0),
(644, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '13:19:23', 0),
(645, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '13:19:58', 0),
(646, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '13:23:00', 0),
(647, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '13:27:39', 0),
(648, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '14:59:44', 0),
(649, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '14:59:48', 0),
(650, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '14:59:54', 0),
(651, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:00:09', 0),
(652, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:27:20', 1),
(653, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:27:24', 0),
(654, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:28:14', 1),
(655, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:28:43', 1),
(656, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:32:45', 1),
(657, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:33:58', 0),
(658, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:35:00', 1),
(659, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:36:23', 1),
(660, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:36:56', 1),
(661, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:37:44', 1),
(662, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:38:47', 1),
(663, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:39:07', 1),
(664, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:39:40', 1),
(665, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:39:51', 1),
(666, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:40:02', 1),
(667, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:40:27', 1),
(668, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:43:24', 1),
(669, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:43:36', 1),
(670, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:44:03', 1),
(671, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:45:07', 1),
(672, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:45:21', 1),
(673, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '15:59:45', 1),
(674, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:00:12', 1),
(675, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:03:17', 1),
(676, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:08:38', 1),
(677, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:08:47', 1),
(678, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:10:26', 1),
(679, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:12:06', 1),
(680, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:13:07', 1),
(681, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:13:25', 1),
(682, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:13:31', 1),
(683, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:14:29', 1),
(684, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:14:50', 1),
(685, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:15:33', 1),
(686, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:15:43', 1),
(687, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:16:09', 1),
(688, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:16:29', 1),
(689, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:16:57', 1),
(690, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:17:07', 1),
(691, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:20:34', 0),
(692, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:22:18', 1),
(693, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:25:31', 1),
(694, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:28:52', 1),
(695, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:34:03', 1),
(696, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:35:31', 1),
(697, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:36:15', 1),
(698, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '16:36:19', 1),
(699, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '16:36:58', 1),
(700, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:37:53', 1),
(701, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:42:08', 0),
(702, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '16:54:24', 1),
(703, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '16:59:49', 1),
(704, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '17:02:33', 1),
(705, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '17:06:36', 1),
(706, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:06:55', 1),
(707, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:07:15', 1),
(708, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:07:26', 1),
(709, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:08:08', 1),
(710, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '17:08:27', 1),
(711, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '17:08:43', 1),
(712, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '17:08:55', 1),
(713, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-28', '17:18:27', 1),
(714, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:20:08', 1),
(715, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:20:59', 1),
(716, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:21:45', 1),
(717, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:27:52', 0),
(718, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:29:36', 1),
(719, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:30:10', 1),
(720, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:31:03', 1),
(721, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:54:46', 1),
(722, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:55:15', 1),
(723, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:57:31', 1),
(724, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:58:43', 1),
(725, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '17:58:58', 1),
(726, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '18:01:33', 1),
(727, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '18:01:38', 0),
(728, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-28', '18:03:07', 0),
(729, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:38:22', 0),
(730, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:40:29', 0),
(731, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:40:32', 0),
(732, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:42:06', 0),
(733, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:42:08', 0),
(734, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:46:10', 0),
(735, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:46:24', 0),
(736, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:46:38', 0),
(737, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:50:50', 0),
(738, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:52:17', 0),
(739, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '11:52:33', 0),
(740, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:00:12', 0),
(741, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:21:37', 0),
(742, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:22:50', 0),
(743, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:23:30', 0),
(744, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:24:10', 0),
(745, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:24:59', 0),
(746, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:25:38', 0),
(747, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:28:26', 0),
(748, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:37:11', 0),
(749, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:37:48', 0),
(750, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:38:37', 0),
(751, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:39:25', 0),
(752, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:40:23', 0),
(753, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:41:07', 0),
(754, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:46:23', 0),
(755, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:48:34', 0),
(756, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:49:36', 0),
(757, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:50:19', 0),
(758, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:51:26', 0),
(759, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:52:59', 0),
(760, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:53:30', 0),
(761, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:55:24', 0),
(762, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:56:19', 0),
(763, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:56:30', 0),
(764, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:57:09', 0),
(765, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:57:30', 0),
(766, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:57:53', 0),
(767, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:58:13', 0),
(768, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '12:58:52', 0),
(769, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:00:03', 0),
(770, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:00:14', 0),
(771, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:01:40', 0),
(772, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:03:24', 0),
(773, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:03:34', 0),
(774, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:04:38', 0),
(775, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:04:55', 0),
(776, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:05:22', 0),
(777, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:06:01', 0),
(778, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:11:21', 0),
(779, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:11:27', 0),
(780, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:15:03', 0),
(781, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:15:13', 0),
(782, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:19:10', 0),
(783, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:23:38', 0),
(784, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:27:27', 0),
(785, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:29:56', 0),
(786, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:31:12', 0),
(787, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:31:33', 0),
(788, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:32:05', 0),
(789, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:32:20', 0),
(790, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:33:12', 0),
(791, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:50:45', 0),
(792, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:54:58', 0),
(793, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:56:25', 0),
(794, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:56:36', 0),
(795, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:56:52', 0),
(796, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:57:08', 0),
(797, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:57:16', 0),
(798, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:58:01', 0),
(799, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:58:43', 0),
(800, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:59:02', 0),
(801, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:59:36', 0),
(802, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '13:59:44', 0),
(803, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:00:00', 0),
(804, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:00:19', 0),
(805, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:00:29', 0),
(806, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:01:13', 0),
(807, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-31', '14:07:56', 0),
(808, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:47:11', 0),
(809, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:49:35', 0),
(810, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:49:39', 0),
(811, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:49:44', 0),
(812, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/outcourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:58:44', 1),
(813, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:58:54', 1),
(814, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '14:59:06', 0),
(815, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:00:07', 1),
(816, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/outsourcing.php', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:00:19', 1),
(817, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:01:35', 1),
(818, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:02:03', 1),
(819, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:04:17', 1),
(820, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:04:35', 1),
(821, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:21:50', 1),
(822, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:22:38', 1),
(823, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:22:52', 1),
(824, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:23:43', 1),
(825, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:24:02', 1),
(826, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:24:54', 1),
(827, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:25:28', 1),
(828, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:25:39', 1),
(829, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:28:36', 1),
(830, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:34:23', 1),
(831, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:34:46', 1),
(832, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:36:43', 0),
(833, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:42:29', 1),
(834, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:42:41', 1),
(835, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:42:59', 1),
(836, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:43:06', 1),
(837, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:43:26', 1),
(838, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:43:44', 1),
(839, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:43:58', 1),
(840, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:44:10', 1),
(841, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:44:46', 1),
(842, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '15:45:01', 1),
(843, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:00:37', 1),
(844, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:00:48', 1),
(845, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:01:11', 1),
(846, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:02:52', 1),
(847, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:02:59', 1),
(848, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/index-2.html', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:03:09', 1),
(849, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:03:13', 0),
(850, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:03:51', 0),
(851, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:03:55', 1),
(852, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:05:48', 1),
(853, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:06:11', 1),
(854, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:06:46', 1),
(855, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:06:59', 1),
(856, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:07:33', 1),
(857, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:09:22', 1),
(858, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:11:48', 1),
(859, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:12:20', 1),
(860, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:12:39', 1),
(861, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:13:47', 1),
(862, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:14:07', 1),
(863, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:15:06', 1),
(864, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:16:44', 1),
(865, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:25:49', 0),
(866, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:26:08', 0),
(867, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:27:00', 0),
(868, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:27:19', 0),
(869, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:27:34', 0),
(870, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:27:52', 0),
(871, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:29:08', 0),
(872, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:29:18', 0),
(873, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:31:36', 0),
(874, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:32:13', 0),
(875, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:32:44', 1),
(876, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:33:06', 1),
(877, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:33:17', 1),
(878, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:33:32', 1),
(879, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:39:30', 1),
(880, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:39:36', 1),
(881, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:40:07', 1),
(882, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:41:31', 1),
(883, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:42:06', 1),
(884, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:42:14', 1),
(885, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:44:46', 1),
(886, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:44:54', 1),
(887, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:45:07', 1),
(888, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:45:14', 1),
(889, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:45:42', 1),
(890, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:46:23', 1),
(891, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:46:45', 1),
(892, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:47:29', 1),
(893, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:48:00', 0),
(894, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:48:42', 1),
(895, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:50:00', 1),
(896, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:50:14', 1),
(897, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:50:30', 1),
(898, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:51:01', 1),
(899, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:52:26', 1),
(900, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:52:35', 1),
(901, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:54:22', 1),
(902, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:54:33', 1),
(903, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:55:06', 1),
(904, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:56:14', 1),
(905, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:56:42', 0),
(906, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:57:36', 1),
(907, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '16:58:36', 0),
(908, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:03:29', 1),
(909, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:04:23', 1),
(910, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:05:20', 1),
(911, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:06:23', 1),
(912, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:07:21', 1),
(913, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:07:33', 1),
(914, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:08:00', 1),
(915, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:08:11', 0),
(916, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:08:23', 1),
(917, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:09:23', 1),
(918, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:09:30', 1),
(919, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:12:25', 1),
(920, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:12:59', 1),
(921, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:13:12', 1),
(922, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-31', '17:13:14', 0),
(923, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:13:25', 1),
(924, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-31', '17:15:46', 0),
(925, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:15:50', 1),
(926, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-31', '17:16:12', 0),
(927, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-31', '17:16:19', 0);
INSERT INTO `aws_sys_tracking` (`ID`, `Tabla`, `TablaID`, `Filename`, `UrlVisited`, `IP`, `Host`, `Navegador`, `Fecha`, `Hora`, `IsHome`) VALUES
(928, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-31', '17:16:23', 0),
(929, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:17:14', 1),
(930, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:17:25', 1),
(931, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-31', '17:17:37', 0),
(932, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-07-31', '17:17:47', 1),
(933, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:19:28', 1),
(934, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:19:52', 1),
(935, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:20:19', 1),
(936, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:21:48', 1),
(937, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:22:50', 1),
(938, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:26:14', 1),
(939, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:26:24', 1),
(940, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:28:05', 1),
(941, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:28:18', 1),
(942, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:28:44', 1),
(943, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:29:00', 1),
(944, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:29:19', 1),
(945, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:30:28', 1),
(946, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:30:44', 1),
(947, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:30:54', 1),
(948, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:31:43', 1),
(949, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:34:10', 1),
(950, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:35:17', 1),
(951, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:36:05', 1),
(952, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:42:59', 1),
(953, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '17:43:19', 1),
(954, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:02:05', 1),
(955, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:05:56', 1),
(956, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:06:47', 1),
(957, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:06:55', 1),
(958, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:08:29', 1),
(959, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:09:25', 1),
(960, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:09:37', 1),
(961, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:10:35', 1),
(962, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:10:48', 1),
(963, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:11:53', 1),
(964, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:12:29', 1),
(965, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:13:06', 1),
(966, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:13:14', 1),
(967, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:13:25', 1),
(968, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:13:31', 0),
(969, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-07-31', '18:14:05', 0),
(970, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:09:44', 0),
(971, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:09:53', 0),
(972, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:11:20', 0),
(973, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:12:26', 0),
(974, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:12:43', 0),
(975, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:13:42', 0),
(976, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:14:03', 0),
(977, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:14:31', 0),
(978, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:16:22', 0),
(979, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:19:20', 0),
(980, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:22:12', 0),
(981, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:22:27', 0),
(982, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:28:09', 1),
(983, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:28:28', 0),
(984, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:32:17', 0),
(985, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:32:39', 1),
(986, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:34:57', 0),
(987, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:38:44', 0),
(988, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:39:18', 0),
(989, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:39:33', 0),
(990, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:39:53', 0),
(991, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:40:35', 0),
(992, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:40:51', 0),
(993, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:41:00', 0),
(994, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:41:19', 1),
(995, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:41:57', 0),
(996, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:42:06', 0),
(997, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '10:56:38', 1),
(998, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:05:08', 0),
(999, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:06:16', 1),
(1000, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:06:55', 1),
(1001, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:21:44', 1),
(1002, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:22:01', 1),
(1003, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:22:23', 1),
(1004, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:22:39', 1),
(1005, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:26:33', 1),
(1006, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:26:59', 1),
(1007, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:30:19', 1),
(1008, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:31:32', 1),
(1009, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:45:07', 1),
(1010, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:45:28', 1),
(1011, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:45:41', 0),
(1012, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:45:45', 0),
(1013, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:45:53', 1),
(1014, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:46:19', 0),
(1015, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:47:17', 1),
(1016, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:47:34', 1),
(1017, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:48:12', 1),
(1018, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:48:16', 1),
(1019, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:53:55', 1),
(1020, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '11:54:19', 1),
(1021, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:00:28', 0),
(1022, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:11:43', 1),
(1023, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:16:24', 1),
(1024, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:31:40', 1),
(1025, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:32:40', 1),
(1026, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:32:56', 1),
(1027, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:34:35', 0),
(1028, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:39:25', 1),
(1029, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:41:32', 1),
(1030, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:42:06', 1),
(1031, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:56:21', 0),
(1032, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:56:26', 1),
(1033, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '12:56:41', 0),
(1034, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:04:22', 0),
(1035, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:04:31', 0),
(1036, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:04:50', 0),
(1037, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:04:54', 0),
(1038, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:05:15', 0),
(1039, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:07:17', 0),
(1040, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:09:41', 0),
(1041, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:09:49', 0),
(1042, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:10:56', 0),
(1043, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:13:06', 0),
(1044, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:13:15', 0),
(1045, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:13:58', 0),
(1046, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:14:06', 0),
(1047, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:14:45', 0),
(1048, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:15:40', 0),
(1049, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:15:47', 0),
(1050, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:15:50', 0),
(1051, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:16:10', 0),
(1052, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:16:39', 0),
(1053, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:16:48', 0),
(1054, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:17:01', 0),
(1055, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:17:15', 0),
(1056, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:18:40', 0),
(1057, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:18:48', 0),
(1058, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:22:13', 0),
(1059, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:24:33', 0),
(1060, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:26:04', 0),
(1061, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:28:15', 0),
(1062, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:28:23', 0),
(1063, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:28:52', 0),
(1064, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:29:00', 0),
(1065, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:29:50', 0),
(1066, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:29:57', 0),
(1067, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:30:22', 0),
(1068, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:31:11', 0),
(1069, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:31:18', 0),
(1070, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:32:09', 0),
(1071, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:32:43', 0),
(1072, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:34:23', 0),
(1073, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:34:36', 0),
(1074, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '13:45:53', 1),
(1075, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '14:01:10', 1),
(1076, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '14:01:39', 1),
(1077, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:19:01', 1),
(1078, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:19:31', 1),
(1079, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:20:19', 0),
(1080, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:20:25', 0),
(1081, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:20:37', 0),
(1082, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:21:03', 0),
(1083, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:22:37', 0),
(1084, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:22:45', 0),
(1085, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:23:19', 0),
(1086, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:24:48', 0),
(1087, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:25:01', 0),
(1088, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:26:12', 0),
(1089, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:26:18', 0),
(1090, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:26:29', 0),
(1091, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:26:52', 0),
(1092, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:27:10', 0),
(1093, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:27:23', 0),
(1094, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:28:16', 0),
(1095, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:29:23', 0),
(1096, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:29:29', 0),
(1097, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:30:32', 0),
(1098, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:30:57', 0),
(1099, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:31:23', 0),
(1100, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:31:42', 0),
(1101, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:32:14', 0),
(1102, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:32:37', 0),
(1103, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:33:29', 0),
(1104, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:35:21', 0),
(1105, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:56:01', 0),
(1106, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:56:55', 1),
(1107, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:56:58', 1),
(1108, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:57:01', 1),
(1109, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:57:11', 1),
(1110, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:57:56', 1),
(1111, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:58:01', 1),
(1112, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:58:04', 1),
(1113, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:58:07', 1),
(1114, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:58:10', 1),
(1115, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:58:26', 1),
(1116, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:58:29', 1),
(1117, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:59:06', 1),
(1118, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:59:13', 0),
(1119, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:59:34', 0),
(1120, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '15:59:44', 0),
(1121, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:00:35', 0),
(1122, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:00:49', 0),
(1123, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:01:27', 0),
(1124, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:05:51', 0),
(1125, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:05:59', 0),
(1126, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:06:47', 0),
(1127, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:08:20', 0),
(1128, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:08:29', 0),
(1129, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:08:31', 0),
(1130, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:08:39', 0),
(1131, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:10:14', 0),
(1132, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:10:18', 0),
(1133, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:10:33', 0),
(1134, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:10:38', 0),
(1135, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:10:59', 0),
(1136, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:11:03', 0),
(1137, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:11:05', 0),
(1138, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:11:10', 0),
(1139, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:12:09', 0),
(1140, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:12:12', 0),
(1141, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:12:16', 0),
(1142, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:12:51', 0),
(1143, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:12:54', 0),
(1144, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:38:35', 0),
(1145, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:40:36', 0),
(1146, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:40:47', 0),
(1147, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:42:42', 0),
(1148, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:43:00', 0),
(1149, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '16:43:04', 0),
(1150, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/index.php', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '16:55:26', 0),
(1151, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/index.php', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:00:20', 0),
(1152, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/SECCION', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:00:44', 1),
(1153, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:00:50', 1),
(1154, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:02:27', 0),
(1155, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:03:31', 0),
(1156, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '17:07:22', 1),
(1157, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:18:55', 0),
(1158, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:19:01', 1),
(1159, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:19:11', 1),
(1160, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:34:17', 1),
(1161, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:40:12', 0),
(1162, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:40:35', 0),
(1163, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:40:53', 0),
(1164, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:40:53', 0),
(1165, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-01', '17:43:12', 0),
(1166, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:09:43', 0),
(1167, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:16:38', 1),
(1168, 'seccion', '4', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:16:52', 0),
(1169, 'seccion', '4', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:19:14', 0),
(1170, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:19:20', 0),
(1171, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:22:18', 0),
(1172, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:22:22', 0),
(1173, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:22:32', 0),
(1174, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:22:38', 0),
(1175, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:22:46', 0),
(1176, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:22:52', 0),
(1177, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:23:07', 0),
(1178, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:25:14', 0),
(1179, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:26:14', 0),
(1180, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:27:00', 0),
(1181, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:30:57', 0),
(1182, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:32:50', 0),
(1183, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-01', '18:33:09', 0),
(1184, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '10:32:44', 0),
(1185, 'seccion', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/seccion/specific-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:32:38', 1),
(1186, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:33:02', 0),
(1187, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:33:23', 0),
(1188, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:39:10', 0),
(1189, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:39:40', 0),
(1190, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:40:09', 0),
(1191, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:40:13', 0),
(1192, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:41:07', 0),
(1193, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:46:32', 0),
(1194, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:46:53', 0),
(1195, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:47:26', 0),
(1196, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-y-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:47:32', 1),
(1197, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:47:35', 0),
(1198, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:48:01', 0),
(1199, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:48:04', 0),
(1200, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:48:09', 0),
(1201, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/-br-isp', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:48:17', 1),
(1202, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:48:43', 0),
(1203, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:48:46', 0),
(1204, 'seccion', '9', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/networking-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:48:54', 0),
(1205, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:53:59', 0),
(1206, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '11:54:05', 0),
(1207, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '12:03:52', 0);
INSERT INTO `aws_sys_tracking` (`ID`, `Tabla`, `TablaID`, `Filename`, `UrlVisited`, `IP`, `Host`, `Navegador`, `Fecha`, `Hora`, `IsHome`) VALUES
(1208, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '12:08:30', 0),
(1209, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '12:09:15', 0),
(1210, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '12:09:57', 0),
(1211, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '12:10:02', 0),
(1212, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '12:37:06', 0),
(1213, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '13:25:35', 0),
(1214, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '13:25:38', 0),
(1215, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '13:26:06', 0),
(1216, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '13:27:32', 0),
(1217, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '13:27:57', 0),
(1218, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:05:34', 0),
(1219, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:20:25', 0),
(1220, 'seccion', '9', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/networking-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:20:30', 0),
(1221, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:22:26', 0),
(1222, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:23:07', 0),
(1223, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:23:31', 0),
(1224, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:23:41', 0),
(1225, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:23:57', 0),
(1226, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:24:20', 0),
(1227, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:24:41', 0),
(1228, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:24:57', 0),
(1229, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:27:19', 0),
(1230, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:27:32', 0),
(1231, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:30:46', 0),
(1232, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:31:36', 0),
(1233, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:32:00', 0),
(1234, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:32:15', 0),
(1235, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:32:31', 0),
(1236, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:32:44', 0),
(1237, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:33:00', 0),
(1238, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:49:18', 0),
(1239, 'seccion', '10', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/soporte-tecnologico', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:49:23', 0),
(1240, 'seccion', '10', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/soporte-tecnologico', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:51:49', 0),
(1241, 'seccion', '10', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/soporte-tecnologico', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:52:01', 0),
(1242, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:57:26', 0),
(1243, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/strategic-outsourcing', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:57:33', 0),
(1244, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:57:43', 0),
(1245, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:57:46', 0),
(1246, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:57:53', 0),
(1247, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:57:57', 0),
(1248, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:58:01', 0),
(1249, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:58:05', 0),
(1250, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:58:10', 0),
(1251, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:58:15', 0),
(1252, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:59:11', 0),
(1253, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:59:23', 0),
(1254, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:59:26', 0),
(1255, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:59:32', 0),
(1256, 'seccion', '9', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/networking-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:59:35', 0),
(1257, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '15:59:58', 0),
(1258, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:00:01', 0),
(1259, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:01:18', 0),
(1260, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:01:40', 0),
(1261, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:01:57', 0),
(1262, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:02:16', 0),
(1263, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:02:36', 0),
(1264, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:02:39', 0),
(1265, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:03:16', 0),
(1266, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:03:24', 0),
(1267, 'seccion', '9', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/networking-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:03:34', 0),
(1268, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:03:40', 0),
(1269, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:03:54', 0),
(1270, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:04:14', 0),
(1271, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:04:17', 0),
(1272, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:04:21', 0),
(1273, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:04:25', 0),
(1274, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:09:03', 0),
(1275, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:12:43', 0),
(1276, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:16:55', 0),
(1277, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:20:00', 0),
(1278, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:20:08', 0),
(1279, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:21:37', 0),
(1280, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:22:31', 0),
(1281, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:23:33', 0),
(1282, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:24:07', 0),
(1283, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:24:18', 0),
(1284, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:30:56', 0),
(1285, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:31:21', 0),
(1286, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:32:28', 0),
(1287, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:32:49', 0),
(1288, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:33:04', 0),
(1289, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:33:39', 0),
(1290, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:34:01', 0),
(1291, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:34:36', 0),
(1292, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:35:32', 0),
(1293, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:35:48', 0),
(1294, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:37:29', 0),
(1295, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:37:55', 0),
(1296, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:39:12', 0),
(1297, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:39:39', 0),
(1298, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:40:33', 0),
(1299, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:41:28', 0),
(1300, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:41:38', 0),
(1301, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:41:56', 0),
(1302, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:45:00', 0),
(1303, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:46:31', 0),
(1304, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:46:48', 0),
(1305, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:52:57', 0),
(1306, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:53:19', 0),
(1307, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:53:23', 0),
(1308, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:53:28', 0),
(1309, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:54:12', 0),
(1310, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:54:20', 0),
(1311, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:55:08', 0),
(1312, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:55:48', 0),
(1313, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:55:50', 0),
(1314, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:58:09', 0),
(1315, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:58:13', 0),
(1316, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:58:51', 0),
(1317, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '16:58:59', 0),
(1318, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:03:47', 0),
(1319, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:03:49', 0),
(1320, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:05:04', 0),
(1321, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:05:24', 0),
(1322, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:06:19', 0),
(1323, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:10:10', 0),
(1324, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:12:30', 0),
(1325, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:12:57', 0),
(1326, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:15:39', 0),
(1327, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:16:08', 0),
(1328, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:19:05', 0),
(1329, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:19:38', 0),
(1330, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:19:46', 0),
(1331, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:20:43', 0),
(1332, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:21:45', 0),
(1333, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:22:02', 0),
(1334, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:23:38', 0),
(1335, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:23:47', 0),
(1336, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:24:42', 0),
(1337, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:24:52', 0),
(1338, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:25:22', 0),
(1339, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:26:06', 0),
(1340, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:26:47', 0),
(1341, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:27:51', 0),
(1342, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:28:24', 0),
(1343, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:28:55', 0),
(1344, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:29:37', 0),
(1345, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:29:52', 0),
(1346, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:38:39', 0),
(1347, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '17:46:40', 0),
(1348, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:01:24', 0),
(1349, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:03:04', 0),
(1350, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:03:31', 0),
(1351, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:03:41', 0),
(1352, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:03:51', 0),
(1353, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:04:12', 0),
(1354, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:04:16', 0),
(1355, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:05:27', 0),
(1356, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:05:48', 0),
(1357, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:06:02', 0),
(1358, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:06:17', 0),
(1359, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-02', '18:07:05', 0),
(1360, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:16:46', 0),
(1361, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:18:10', 0),
(1362, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:18:18', 0),
(1363, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:20:57', 0),
(1364, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:21:03', 0),
(1365, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:21:18', 0),
(1366, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:21:47', 0),
(1367, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:21:56', 0),
(1368, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:22:10', 0),
(1369, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:23:19', 0),
(1370, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:23:47', 0),
(1371, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:24:28', 0),
(1372, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:24:53', 0),
(1373, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:24:58', 0),
(1374, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:29:56', 0),
(1375, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:32:11', 0),
(1376, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:32:41', 0),
(1377, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:33:51', 0),
(1378, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:34:42', 0),
(1379, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:35:00', 0),
(1380, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:36:01', 0),
(1381, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:36:13', 0),
(1382, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:37:16', 0),
(1383, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:37:23', 0),
(1384, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:39:51', 0),
(1385, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:40:31', 0),
(1386, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:41:35', 0),
(1387, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:45:21', 0),
(1388, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '10:45:27', 0),
(1389, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:11:34', 0),
(1390, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:42:03', 0),
(1391, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:42:16', 0),
(1392, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:42:48', 0),
(1393, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:43:05', 0),
(1394, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:47:03', 0),
(1395, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:48:23', 0),
(1396, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:49:49', 0),
(1397, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:50:58', 0),
(1398, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:52:41', 0),
(1399, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:55:09', 0),
(1400, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:55:39', 0),
(1401, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:57:02', 0),
(1402, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:57:53', 0),
(1403, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:58:01', 0),
(1404, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:58:07', 0),
(1405, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '11:58:55', 0),
(1406, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:11:57', 0),
(1407, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:12:53', 0),
(1408, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:13:04', 0),
(1409, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:13:24', 0),
(1410, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:13:48', 0),
(1411, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:14:08', 0),
(1412, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:14:17', 0),
(1413, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:14:36', 0),
(1414, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:14:56', 0),
(1415, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:15:10', 0),
(1416, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:15:38', 0),
(1417, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '12:32:59', 0),
(1418, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:24:30', 0),
(1419, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:31:26', 0),
(1420, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:35:10', 0),
(1421, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:36:02', 0),
(1422, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:40:30', 0),
(1423, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:42:34', 0),
(1424, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:43:21', 0),
(1425, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:43:41', 0),
(1426, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:44:23', 0),
(1427, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:44:50', 0),
(1428, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:45:58', 0),
(1429, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:46:33', 0),
(1430, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:47:15', 0),
(1431, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:47:41', 0),
(1432, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:48:03', 0),
(1433, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:48:21', 0),
(1434, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:48:32', 0),
(1435, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:48:58', 0),
(1436, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:49:29', 0),
(1437, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:49:40', 0),
(1438, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:50:10', 0),
(1439, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:50:27', 0),
(1440, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:50:52', 0),
(1441, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:51:33', 0),
(1442, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:51:47', 0),
(1443, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:52:26', 0),
(1444, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:53:14', 0),
(1445, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:53:42', 0),
(1446, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '13:59:54', 0),
(1447, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '14:04:06', 0),
(1448, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '14:04:19', 0),
(1449, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '14:07:19', 0),
(1450, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:53:32', 0),
(1451, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:53:44', 0),
(1452, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:53:51', 0),
(1453, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:54:00', 0),
(1454, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:54:58', 0),
(1455, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:55:42', 0),
(1456, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:56:23', 0),
(1457, 'clientes', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:56:55', 0),
(1458, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '15:57:29', 0),
(1459, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:00:26', 0),
(1460, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:00:48', 0),
(1461, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:01:30', 0),
(1462, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:01:41', 0),
(1463, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:02:04', 0),
(1464, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:02:38', 0),
(1465, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:02:56', 0),
(1466, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:03:27', 0),
(1467, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:03:50', 0),
(1468, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:04:23', 0),
(1469, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:04:58', 0),
(1470, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:05:21', 0),
(1471, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:05:44', 0),
(1472, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:06:23', 0),
(1473, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:06:38', 0),
(1474, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:07:32', 0),
(1475, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:09:33', 0),
(1476, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:09:55', 0),
(1477, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:10:04', 0),
(1478, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:10:18', 0),
(1479, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:10:37', 0),
(1480, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:10:53', 0),
(1481, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:11:21', 0),
(1482, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:11:30', 0),
(1483, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:12:00', 0),
(1484, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:12:14', 0),
(1485, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:12:26', 0),
(1486, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:13:16', 0),
(1487, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:13:35', 0),
(1488, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:32:12', 0),
(1489, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:38:27', 0),
(1490, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:39:02', 0);
INSERT INTO `aws_sys_tracking` (`ID`, `Tabla`, `TablaID`, `Filename`, `UrlVisited`, `IP`, `Host`, `Navegador`, `Fecha`, `Hora`, `IsHome`) VALUES
(1491, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:39:18', 0),
(1492, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:39:44', 0),
(1493, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:40:01', 0),
(1494, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:42:50', 0),
(1495, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:42:55', 0),
(1496, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:43:03', 0),
(1497, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:45:30', 0),
(1498, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:45:32', 0),
(1499, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:47:08', 0),
(1500, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:47:50', 0),
(1501, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:51:43', 0),
(1502, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:52:50', 0),
(1503, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:53:07', 0),
(1504, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:53:53', 0),
(1505, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:54:22', 0),
(1506, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:54:59', 0),
(1507, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:55:32', 0),
(1508, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:55:46', 0),
(1509, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:56:29', 0),
(1510, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:56:39', 0),
(1511, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:56:57', 0),
(1512, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:57:59', 0),
(1513, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:59:07', 0),
(1514, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '16:59:55', 0),
(1515, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:04:34', 0),
(1516, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:11:17', 0),
(1517, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:11:30', 0),
(1518, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:14:21', 0),
(1519, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:14:25', 0),
(1520, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:18:39', 0),
(1521, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:20:03', 0),
(1522, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:20:10', 0),
(1523, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:20:33', 0),
(1524, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:22:04', 0),
(1525, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:22:50', 0),
(1526, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:23:20', 0),
(1527, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:23:31', 0),
(1528, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:23:35', 0),
(1529, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:23:55', 0),
(1530, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:27:56', 0),
(1531, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:30:44', 0),
(1532, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:31:07', 0),
(1533, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:31:20', 0),
(1534, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:33:31', 0),
(1535, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:34:56', 0),
(1536, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:35:53', 0),
(1537, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:36:36', 0),
(1538, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:36:44', 0),
(1539, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:39:44', 0),
(1540, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:40:05', 0),
(1541, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:40:12', 0),
(1542, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:40:23', 0),
(1543, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:40:31', 0),
(1544, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:40:38', 0),
(1545, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:40:52', 0),
(1546, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:41:02', 0),
(1547, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:41:12', 0),
(1548, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:41:56', 0),
(1549, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:50:27', 0),
(1550, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:50:35', 0),
(1551, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:50:59', 0),
(1552, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:51:07', 0),
(1553, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:55:43', 0),
(1554, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:55:54', 0),
(1555, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '17:56:06', 0),
(1556, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '18:06:28', 0),
(1557, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '18:08:08', 0),
(1558, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '18:08:26', 0),
(1559, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '18:08:34', 0),
(1560, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '18:08:42', 0),
(1561, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/pruebas', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-03', '18:09:06', 0),
(1562, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:05:42', 0),
(1563, 'partners', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:15:28', 0),
(1564, 'partners', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:16:38', 0),
(1565, 'partners', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:20:43', 0),
(1566, 'partners', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:21:57', 0),
(1567, 'partners', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:23:47', 0),
(1568, 'partners', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:28:45', 0),
(1569, 'partners', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:32:47', 0),
(1570, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:38:41', 0),
(1571, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:38:45', 0),
(1572, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:39:31', 0),
(1573, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:39:41', 0),
(1574, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:41:08', 0),
(1575, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:41:16', 0),
(1576, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:41:19', 0),
(1577, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:41:23', 0),
(1578, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:41:28', 0),
(1579, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:41:32', 0),
(1580, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:41:36', 0),
(1581, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:41:41', 0),
(1582, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:42:17', 0),
(1583, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:43:00', 0),
(1584, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:44:12', 0),
(1585, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:44:26', 0),
(1586, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:44:32', 0),
(1587, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:44:45', 0),
(1588, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:44:52', 0),
(1589, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:44:59', 0),
(1590, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:45:13', 0),
(1591, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:45:19', 0),
(1592, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:45:30', 0),
(1593, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:45:42', 0),
(1594, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Firefox / 54.0', '2017-08-04', '12:45:54', 0),
(1595, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '12:50:48', 0),
(1596, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '12:53:36', 0),
(1597, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '12:54:32', 0),
(1598, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '12:54:53', 0),
(1599, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '12:55:31', 0),
(1600, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '12:56:06', 0),
(1601, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '12:56:10', 0),
(1602, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '12:56:28', 0),
(1603, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '12:58:04', 0),
(1604, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:36:02', 0),
(1605, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:38:02', 0),
(1606, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:39:03', 0),
(1607, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:39:07', 0),
(1608, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:39:35', 0),
(1609, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:40:25', 0),
(1610, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:43:02', 0),
(1611, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:44:00', 0),
(1612, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:44:31', 0),
(1613, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:57:13', 0),
(1614, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:57:36', 0),
(1615, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:58:07', 0),
(1616, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '13:58:20', 0),
(1617, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:10:16', 0),
(1618, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:11:48', 0),
(1619, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:12:04', 0),
(1620, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:12:25', 0),
(1621, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:12:57', 0),
(1622, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:13:09', 0),
(1623, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:13:27', 0),
(1624, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:13:51', 0),
(1625, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:18:31', 0),
(1626, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:19:55', 0),
(1627, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:20:56', 0),
(1628, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:21:20', 0),
(1629, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:21:34', 0),
(1630, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:22:00', 0),
(1631, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:28:09', 0),
(1632, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '14:29:26', 0),
(1633, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '14:30:09', 0),
(1634, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-04', '14:30:20', 0),
(1635, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '15:23:00', 0),
(1636, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '15:27:18', 1),
(1637, 'seccion', '11', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '15:27:58', 0),
(1638, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '15:28:52', 0),
(1639, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:06:23', 0),
(1640, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:06:47', 0),
(1641, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:07:19', 0),
(1642, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:07:47', 0),
(1643, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:08:57', 0),
(1644, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:09:07', 0),
(1645, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:09:20', 0),
(1646, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:09:30', 0),
(1647, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:09:58', 0),
(1648, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:10:07', 0),
(1649, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:11:35', 0),
(1650, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:11:39', 0),
(1651, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:11:48', 0),
(1652, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:12:12', 0),
(1653, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:12:20', 0),
(1654, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:14:41', 0),
(1655, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:14:49', 0),
(1656, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:18:04', 0),
(1657, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:18:25', 0),
(1658, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:23:09', 0),
(1659, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:25:46', 0),
(1660, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:34:06', 0),
(1661, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:34:19', 0),
(1662, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:34:29', 0),
(1663, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:35:46', 0),
(1664, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto?', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:39:00', 0),
(1665, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:39:21', 0),
(1666, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:48:44', 0),
(1667, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:48:52', 0),
(1668, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:50:17', 0),
(1669, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:54:19', 0),
(1670, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:54:28', 0),
(1671, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:54:48', 0),
(1672, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:55:29', 0),
(1673, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:55:51', 0),
(1674, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:56:53', 0),
(1675, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:57:42', 0),
(1676, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:58:48', 0),
(1677, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:59:19', 0),
(1678, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:59:35', 0),
(1679, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '16:59:57', 0),
(1680, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:01:42', 0),
(1681, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:02:10', 0),
(1682, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:02:48', 0),
(1683, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:04:16', 0),
(1684, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:05:04', 0),
(1685, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:43:07', 0),
(1686, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:43:31', 0),
(1687, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:44:34', 0),
(1688, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:46:00', 0),
(1689, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:46:20', 0),
(1690, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:46:43', 0),
(1691, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:47:15', 0),
(1692, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:48:03', 0),
(1693, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:48:13', 0),
(1694, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:48:26', 0),
(1695, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-04', '17:51:49', 0),
(1696, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '11:22:59', 0),
(1697, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '11:49:03', 0),
(1698, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '11:50:06', 0),
(1699, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '11:50:21', 0),
(1700, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '11:50:37', 0),
(1701, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '12:43:28', 0),
(1702, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '12:58:11', 0),
(1703, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:01:42', 0),
(1704, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:03:15', 0),
(1705, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:04:33', 0),
(1706, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:04:51', 0),
(1707, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:05:22', 0),
(1708, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:13:05', 0),
(1709, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:13:49', 0),
(1710, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:15:13', 0),
(1711, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:18:30', 0),
(1712, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:27:13', 0),
(1713, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:28:51', 0),
(1714, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:40:30', 0),
(1715, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:41:14', 0),
(1716, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:41:50', 0),
(1717, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:42:16', 0),
(1718, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:42:33', 0),
(1719, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:42:54', 0),
(1720, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:43:20', 0),
(1721, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:43:34', 0),
(1722, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:43:43', 0),
(1723, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:44:12', 0),
(1724, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:44:30', 0),
(1725, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:44:42', 0),
(1726, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:46:05', 0),
(1727, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:47:03', 0),
(1728, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:48:33', 0),
(1729, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:48:42', 0),
(1730, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:48:52', 0),
(1731, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:52:06', 0),
(1732, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:54:23', 0),
(1733, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '13:54:57', 0),
(1734, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.215', 'ta01wstec01.tecapli', 'Chrome / 58.0.3029.83', '2017-08-07', '14:46:44', 0),
(1735, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '15:10:12', 0),
(1736, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '15:11:36', 0),
(1737, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '15:15:33', 0),
(1738, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '15:15:58', 0),
(1739, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '15:18:06', 0),
(1740, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '15:18:09', 0),
(1741, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '16:55:59', 0),
(1742, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:17:32', 0),
(1743, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:17:42', 0),
(1744, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:34:52', 0),
(1745, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:35:00', 0),
(1746, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:35:07', 0),
(1747, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:35:11', 0),
(1748, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:36:35', 0),
(1749, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:36:39', 0),
(1750, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:36:42', 0),
(1751, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:36:46', 0),
(1752, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:36:48', 0),
(1753, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:36:51', 0),
(1754, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:37:39', 0),
(1755, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:37:41', 0),
(1756, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:39:52', 0),
(1757, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:40:00', 0),
(1758, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:42:18', 0),
(1759, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-07', '17:42:26', 0),
(1760, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:14:26', 0),
(1761, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:24:57', 0),
(1762, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:26:21', 0),
(1763, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:28:07', 0),
(1764, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:28:22', 0),
(1765, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:31:28', 0),
(1766, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:31:47', 0),
(1767, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:32:02', 0),
(1768, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:34:25', 0),
(1769, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:49:30', 0),
(1770, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:50:31', 0);
INSERT INTO `aws_sys_tracking` (`ID`, `Tabla`, `TablaID`, `Filename`, `UrlVisited`, `IP`, `Host`, `Navegador`, `Fecha`, `Hora`, `IsHome`) VALUES
(1771, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:51:06', 0),
(1772, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:51:21', 0),
(1773, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:51:56', 0),
(1774, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:53:08', 0),
(1775, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:53:44', 0),
(1776, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:54:02', 0),
(1777, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:54:27', 0),
(1778, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:54:30', 0),
(1779, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:54:37', 0),
(1780, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:54:41', 0),
(1781, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:55:11', 0),
(1782, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:55:27', 0),
(1783, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:55:34', 0),
(1784, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:55:38', 0),
(1785, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:56:22', 0),
(1786, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:57:23', 0),
(1787, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '15:58:40', 0),
(1788, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:00:43', 0),
(1789, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:00:59', 0),
(1790, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:01:34', 0),
(1791, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:01:42', 0),
(1792, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:01:49', 0),
(1793, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:02:14', 0),
(1794, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:02:23', 0),
(1795, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:02:51', 0),
(1796, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:04:14', 0),
(1797, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:06:53', 0),
(1798, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:11:12', 0),
(1799, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:11:20', 0),
(1800, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:12:16', 0),
(1801, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:12:33', 0),
(1802, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:12:51', 0),
(1803, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:13:21', 0),
(1804, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:15:53', 0),
(1805, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:16:21', 0),
(1806, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:17:03', 0),
(1807, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:17:22', 0),
(1808, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:17:38', 0),
(1809, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:17:43', 0),
(1810, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:18:45', 0),
(1811, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:19:13', 0),
(1812, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:20:04', 0),
(1813, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:21:24', 0),
(1814, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:21:35', 0),
(1815, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:22:30', 0),
(1816, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:23:03', 0),
(1817, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:23:15', 0),
(1818, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:23:26', 0),
(1819, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:23:31', 0),
(1820, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:24:24', 0),
(1821, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:30:26', 0),
(1822, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:30:35', 0),
(1823, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:31:21', 0),
(1824, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:32:32', 0),
(1825, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:33:21', 0),
(1826, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:34:26', 0),
(1827, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:34:31', 0),
(1828, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:35:27', 0),
(1829, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:35:53', 0),
(1830, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:38:39', 0),
(1831, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:39:01', 0),
(1832, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:39:25', 0),
(1833, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:40:45', 0),
(1834, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:40:59', 0),
(1835, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:41:13', 0),
(1836, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:41:59', 0),
(1837, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:42:09', 0),
(1838, 'seccion', '7', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/cloud-solutions', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:42:17', 0),
(1839, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/servicios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:42:49', 0),
(1840, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:42:53', 0),
(1841, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:43:49', 0),
(1842, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '16:44:14', 0),
(1843, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '17:52:50', 0),
(1844, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '17:54:42', 0),
(1845, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '17:54:47', 0),
(1846, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '17:55:00', 0),
(1847, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '17:55:06', 0),
(1848, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '17:55:10', 0),
(1849, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '17:55:13', 0),
(1850, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 59.0.3071.115', '2017-08-08', '17:55:32', 0),
(1851, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '10:35:29', 0),
(1852, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:40:31', 0),
(1853, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:42:08', 0),
(1854, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:42:24', 0),
(1855, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:42:54', 0),
(1856, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:45:30', 0),
(1857, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:45:55', 0),
(1858, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:46:05', 0),
(1859, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:46:18', 0),
(1860, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:46:28', 0),
(1861, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:47:41', 0),
(1862, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '11:48:15', 0),
(1863, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '12:31:16', 0),
(1864, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '12:33:53', 0),
(1865, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '12:36:29', 0),
(1866, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '12:47:32', 0),
(1867, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '12:48:42', 0),
(1868, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '12:50:40', 0),
(1869, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '12:50:57', 0),
(1870, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '12:51:54', 0),
(1871, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:02:29', 0),
(1872, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:03:46', 0),
(1873, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:04:46', 0),
(1874, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:05:22', 0),
(1875, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:13:37', 0),
(1876, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:14:23', 0),
(1877, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:14:37', 0),
(1878, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:16:29', 0),
(1879, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:29:21', 0),
(1880, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:29:45', 0),
(1881, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:33:04', 0),
(1882, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:33:19', 0),
(1883, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:34:11', 0),
(1884, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '13:37:15', 0),
(1885, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '13:37:27', 0),
(1886, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '13:38:56', 0),
(1887, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/empresa', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '13:40:21', 0),
(1888, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '13:40:27', 0),
(1889, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '13:40:44', 0),
(1890, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '13:44:40', 0),
(1891, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '13:54:13', 0),
(1892, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:07:59', 0),
(1893, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:08:19', 0),
(1894, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:08:36', 0),
(1895, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:09:24', 0),
(1896, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:09:31', 0),
(1897, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:09:55', 0),
(1898, 'seccion', '10', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/soporte-tecnologico', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:10:44', 0),
(1899, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:10:48', 0),
(1900, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.201', 'Dell-PC.tmsgroup.lan', 'Firefox / 55.0', '2017-08-09', '14:14:39', 0),
(1901, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '15:25:59', 0),
(1902, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '15:27:23', 0),
(1903, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '15:27:42', 0),
(1904, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '15:30:17', 0),
(1905, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '15:49:51', 0),
(1906, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '15:56:10', 0),
(1907, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '15:57:36', 0),
(1908, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '16:08:59', 0),
(1909, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '16:09:22', 0),
(1910, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '16:09:47', 0),
(1911, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '16:10:17', 0),
(1912, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '16:10:36', 0),
(1913, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '16:27:43', 0),
(1914, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '16:28:58', 0),
(1915, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:08:24', 0),
(1916, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:09:31', 0),
(1917, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:11:23', 0),
(1918, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:12:10', 0),
(1919, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:16:10', 0),
(1920, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:17:04', 0),
(1921, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:18:28', 0),
(1922, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:18:49', 0),
(1923, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:19:10', 0),
(1924, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:19:32', 0),
(1925, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:19:41', 0),
(1926, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:20:51', 0),
(1927, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:22:15', 0),
(1928, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:22:21', 0),
(1929, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:29:01', 0),
(1930, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:30:36', 0),
(1931, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:31:48', 0),
(1932, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:32:13', 0),
(1933, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:32:34', 0),
(1934, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:35:26', 0),
(1935, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:41:34', 0),
(1936, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:42:38', 0),
(1937, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:48:51', 0),
(1938, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '17:49:45', 0),
(1939, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '18:08:22', 0),
(1940, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-09', '18:08:58', 0),
(1941, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '10:52:24', 0),
(1942, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '10:53:02', 0),
(1943, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '10:54:49', 0),
(1944, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '10:54:51', 0),
(1945, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:06:02', 0),
(1946, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:06:26', 0),
(1947, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:11:21', 0),
(1948, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:11:31', 0),
(1949, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:13:04', 0),
(1950, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:13:41', 0),
(1951, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:14:00', 0),
(1952, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:15:41', 0),
(1953, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:16:14', 0),
(1954, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:18:54', 0),
(1955, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:19:10', 0),
(1956, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:19:20', 0),
(1957, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:19:56', 0),
(1958, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:20:08', 0),
(1959, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:20:17', 0),
(1960, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:20:42', 0),
(1961, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:20:57', 0),
(1962, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:21:07', 0),
(1963, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:22:47', 0),
(1964, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:26:27', 0),
(1965, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:26:46', 0),
(1966, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:27:02', 0),
(1967, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:27:26', 0),
(1968, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:28:47', 0),
(1969, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:28:58', 0),
(1970, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:29:59', 0),
(1971, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:37:54', 0),
(1972, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:52:47', 0),
(1973, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/vdv', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:53:27', 0),
(1974, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/vdvdwdwdwq', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:53:35', 0),
(1975, 'seccion', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/dwdw', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '11:57:01', 1),
(1976, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:01:27', 0),
(1977, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:02:51', 0),
(1978, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:04:24', 0),
(1979, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:04:40', 0),
(1980, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:07:25', 0),
(1981, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:07:34', 0),
(1982, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:08:43', 0),
(1983, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:09:36', 0),
(1984, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:10:40', 0),
(1985, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:11:22', 0),
(1986, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:13:27', 0),
(1987, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:13:32', 0),
(1988, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:13:35', 0),
(1989, 'clientes', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/clientes', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:13:41', 0),
(1990, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:13:45', 0),
(1991, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:13:55', 0),
(1992, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:14:07', 0),
(1993, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:14:14', 0),
(1994, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:15:06', 0),
(1995, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:15:33', 0),
(1996, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:15:45', 0),
(1997, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:15:58', 0),
(1998, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:16:16', 0),
(1999, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:17:20', 0),
(2000, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:17:46', 0),
(2001, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:17:53', 0),
(2002, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:18:19', 0),
(2003, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:18:34', 0),
(2004, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:19:22', 0),
(2005, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:19:36', 0),
(2006, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:19:51', 0),
(2007, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:24:16', 0),
(2008, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:24:41', 0),
(2009, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:24:51', 0),
(2010, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:26:03', 0),
(2011, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/error', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:27:19', 0),
(2012, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:27:40', 0),
(2013, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:48:02', 0),
(2014, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:56:42', 0),
(2015, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:57:11', 0),
(2016, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:57:51', 0),
(2017, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:58:29', 0),
(2018, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:58:39', 0),
(2019, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:58:53', 0),
(2020, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:59:19', 0),
(2021, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '12:59:43', 0),
(2022, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:01:11', 0),
(2023, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:02:37', 0),
(2024, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:03:57', 0),
(2025, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:06:32', 0),
(2026, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:07:31', 0),
(2027, '', '0', '/TMSGroup/index.php', 'http://localhost/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:17:05', 0),
(2028, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:42:18', 0),
(2029, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:42:35', 0),
(2030, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:42:55', 0),
(2031, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:43:19', 0),
(2032, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:44:17', 0),
(2033, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:44:27', 0),
(2034, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:45:24', 0),
(2035, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:45:46', 0),
(2036, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:46:24', 0),
(2037, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:47:59', 0),
(2038, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:48:22', 0),
(2039, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:49:22', 0),
(2040, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:49:47', 0),
(2041, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:50:28', 0),
(2042, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:51:03', 0),
(2043, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/autodromo-termas-de-rio-hondo', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:53:24', 0),
(2044, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '13:55:15', 0),
(2045, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '14:03:52', 0),
(2046, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '14:03:54', 0),
(2047, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '14:04:51', 0),
(2048, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:05:12', 0),
(2049, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/estadio-fiscal-de-talca-chile', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:05:25', 0),
(2050, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/sistema-de-gestion-durox', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:05:30', 0),
(2051, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:06:17', 0),
(2052, 'seccion', '4', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/outsourcing-it', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:06:53', 0),
(2053, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:07:02', 0);
INSERT INTO `aws_sys_tracking` (`ID`, `Tabla`, `TablaID`, `Filename`, `UrlVisited`, `IP`, `Host`, `Navegador`, `Fecha`, `Hora`, `IsHome`) VALUES
(2054, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:08:41', 0),
(2055, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:08:53', 0),
(2056, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:09:15', 0),
(2057, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:09:27', 0),
(2058, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:09:51', 0),
(2059, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:10:21', 0),
(2060, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:10:49', 0),
(2061, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:11:08', 0),
(2062, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:11:20', 0),
(2063, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:11:33', 0),
(2064, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:11:43', 0),
(2065, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:14:09', 0),
(2066, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:16:51', 0),
(2067, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:16:59', 0),
(2068, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:18:33', 0),
(2069, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:18:52', 0),
(2070, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:19:46', 0),
(2071, 'seccion', '6', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/consultoria-capacitacion', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:20:07', 0),
(2072, 'seccion', '8', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/internet-service-provider', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:20:15', 0),
(2073, 'seccion', '5', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/seccion/software-factoring', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:20:29', 0),
(2074, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:20:58', 0),
(2075, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:32:39', 0),
(2076, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:33:09', 0),
(2077, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:33:15', 0),
(2078, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:35:10', 0),
(2079, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:35:46', 0),
(2080, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:45:20', 0),
(2081, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:45:31', 0),
(2082, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/contacto', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:46:14', 0),
(2083, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:46:25', 0),
(2084, 'partners', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/partners', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:47:47', 0),
(2085, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/sumate', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '15:49:51', 0),
(2086, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:08:11', 0),
(2087, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:11:58', 0),
(2088, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:12:52', 0),
(2089, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:14:22', 0),
(2090, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:29:17', 0),
(2091, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:30:05', 0),
(2092, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:30:42', 0),
(2093, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:31:20', 0),
(2094, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:32:13', 0),
(2095, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:33:19', 0),
(2096, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:33:34', 0),
(2097, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:35:44', 0),
(2098, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:35:55', 0),
(2099, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:36:20', 0),
(2100, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:36:35', 0),
(2101, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:37:52', 0),
(2102, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:38:37', 0),
(2103, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:38:57', 0),
(2104, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:39:22', 0),
(2105, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:39:34', 0),
(2106, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:39:50', 0),
(2107, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/durox-enologia-srl', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:40:13', 0),
(2108, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/portfolios/durox-enologia-srl', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:41:15', 0),
(2109, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:44:15', 0),
(2110, '', '0', '/TMSGroup/index.php', 'http://192.168.1.236/TMSGroup/', '192.168.1.236', 'Dell-PC.tmsgroup.lan', 'Chrome / 60.0.3112.90', '2017-08-10', '16:54:46', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aws_sys_user`
--

CREATE TABLE `aws_sys_user` (
  `ID` bigint(10) NOT NULL,
  `Publico` tinyint(1) NOT NULL DEFAULT '1',
  `Nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Usuario` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `Contrasenia` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Imagen` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Descripcion` text COLLATE utf8_unicode_ci,
  `RolID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UltimaVez` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `KeyCookie` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `aws_sys_user`
--

INSERT INTO `aws_sys_user` (`ID`, `Publico`, `Nombre`, `Email`, `Usuario`, `Contrasenia`, `Imagen`, `Descripcion`, `RolID`, `FechaCreacion`, `UltimaVez`, `KeyCookie`) VALUES
(1, 1, 'Creator Owner', 'admin@gmail.com', 'admin', '09c133a7d8e9544350d4f1ba5d7686faee445d4a', '', '', '0', '2015-01-01 03:00:00', '2017-08-10 14:52:31', '436467687');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aws_archivo`
--
ALTER TABLE `aws_archivo`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_banner_top`
--
ALTER TABLE `aws_banner_top`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_banner_type`
--
ALTER TABLE `aws_banner_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_banner_wrap`
--
ALTER TABLE `aws_banner_wrap`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_categorias`
--
ALTER TABLE `aws_categorias`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `aws_categorias` ADD FULLTEXT KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `aws_clientes`
--
ALTER TABLE `aws_clientes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_comments`
--
ALTER TABLE `aws_comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_config`
--
ALTER TABLE `aws_config`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_country`
--
ALTER TABLE `aws_country`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_departamentos`
--
ALTER TABLE `aws_departamentos`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `aws_departamentos` ADD FULLTEXT KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `aws_galerias`
--
ALTER TABLE `aws_galerias`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_lng_keyword`
--
ALTER TABLE `aws_lng_keyword`
  ADD KEY `ID` (`ID`);

--
-- Indices de la tabla `aws_lng_language`
--
ALTER TABLE `aws_lng_language`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_lng_translate`
--
ALTER TABLE `aws_lng_translate`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_meta`
--
ALTER TABLE `aws_meta`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_newsletter`
--
ALTER TABLE `aws_newsletter`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_news_email`
--
ALTER TABLE `aws_news_email`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_news_group`
--
ALTER TABLE `aws_news_group`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_paragraph`
--
ALTER TABLE `aws_paragraph`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_partners`
--
ALTER TABLE `aws_partners`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_planes`
--
ALTER TABLE `aws_planes`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_plantillas`
--
ALTER TABLE `aws_plantillas`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_portfolio`
--
ALTER TABLE `aws_portfolio`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_posts`
--
ALTER TABLE `aws_posts`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `aws_posts` ADD FULLTEXT KEY `Titulo` (`Titulo`);
ALTER TABLE `aws_posts` ADD FULLTEXT KEY `Titulo_2` (`Titulo`);
ALTER TABLE `aws_posts` ADD FULLTEXT KEY `Sumario` (`Sumario`);
ALTER TABLE `aws_posts` ADD FULLTEXT KEY `Detalle` (`Detalle`);

--
-- Indices de la tabla `aws_provincias`
--
ALTER TABLE `aws_provincias`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_rating`
--
ALTER TABLE `aws_rating`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_seccion`
--
ALTER TABLE `aws_seccion`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_servicios`
--
ALTER TABLE `aws_servicios`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_social_net`
--
ALTER TABLE `aws_social_net`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_sys_group_user`
--
ALTER TABLE `aws_sys_group_user`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_sys_menu_left`
--
ALTER TABLE `aws_sys_menu_left`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_sys_tables`
--
ALTER TABLE `aws_sys_tables`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_sys_tracking`
--
ALTER TABLE `aws_sys_tracking`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `aws_sys_user`
--
ALTER TABLE `aws_sys_user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aws_archivo`
--
ALTER TABLE `aws_archivo`
  MODIFY `ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_banner_top`
--
ALTER TABLE `aws_banner_top`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `aws_banner_type`
--
ALTER TABLE `aws_banner_type`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `aws_banner_wrap`
--
ALTER TABLE `aws_banner_wrap`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_categorias`
--
ALTER TABLE `aws_categorias`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_clientes`
--
ALTER TABLE `aws_clientes`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `aws_comments`
--
ALTER TABLE `aws_comments`
  MODIFY `ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_config`
--
ALTER TABLE `aws_config`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `aws_country`
--
ALTER TABLE `aws_country`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT de la tabla `aws_departamentos`
--
ALTER TABLE `aws_departamentos`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `aws_galerias`
--
ALTER TABLE `aws_galerias`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_lng_keyword`
--
ALTER TABLE `aws_lng_keyword`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_lng_language`
--
ALTER TABLE `aws_lng_language`
  MODIFY `ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `aws_lng_translate`
--
ALTER TABLE `aws_lng_translate`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_meta`
--
ALTER TABLE `aws_meta`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `aws_newsletter`
--
ALTER TABLE `aws_newsletter`
  MODIFY `ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_news_email`
--
ALTER TABLE `aws_news_email`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_news_group`
--
ALTER TABLE `aws_news_group`
  MODIFY `ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `aws_paragraph`
--
ALTER TABLE `aws_paragraph`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT de la tabla `aws_partners`
--
ALTER TABLE `aws_partners`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `aws_planes`
--
ALTER TABLE `aws_planes`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `aws_plantillas`
--
ALTER TABLE `aws_plantillas`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `aws_portfolio`
--
ALTER TABLE `aws_portfolio`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `aws_posts`
--
ALTER TABLE `aws_posts`
  MODIFY `ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_provincias`
--
ALTER TABLE `aws_provincias`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `aws_rating`
--
ALTER TABLE `aws_rating`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_seccion`
--
ALTER TABLE `aws_seccion`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `aws_servicios`
--
ALTER TABLE `aws_servicios`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `aws_social_net`
--
ALTER TABLE `aws_social_net`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `aws_sys_group_user`
--
ALTER TABLE `aws_sys_group_user`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `aws_sys_menu_left`
--
ALTER TABLE `aws_sys_menu_left`
  MODIFY `ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT de la tabla `aws_sys_tables`
--
ALTER TABLE `aws_sys_tables`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `aws_sys_tracking`
--
ALTER TABLE `aws_sys_tracking`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2111;
--
-- AUTO_INCREMENT de la tabla `aws_sys_user`
--
ALTER TABLE `aws_sys_user`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
