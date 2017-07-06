-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2017 a las 15:38:53
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

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
(52, 1, 'Cote D\'Ivoire', 'CI', 'CIV', 52),
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
(116, 1, 'Lao People\'s Democratic Republic', 'LA', 'LAO', 116),
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
  `Posicion` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
(1, 1, 'ComÃºn', 'comun.php'),
(2, 1, 'Contacto', 'contacto.php'),
(3, 1, 'CategorÃ­a', 'categoria.php');

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
  `Sumario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
  `PlantillaID` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(16, 1, 'Sociales', 'link', '0,1', 8, '0', '1', '', ''),
(17, 1, 'Redes Sociales', '', '0,1', 6, '16', '1', 'social_net', 'listar'),
(52, 1, 'Menu Principal', '', '0,1', 2, '51', '1', 'sys_menu_left', 'listar'),
(51, 1, 'Sistema', 'gear', '0,1', 9, '0', '1', '', ''),
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
(68, 1, 'Blog', 'edit', '0,1,2', 5, '0', '1', '', ''),
(67, 1, 'Plantillas', '', '0,1', 10, '51', '1', 'plantillas', 'listar');

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
(2, 1, 'categorias', 'CategorÃ­as');

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
(1, 1, 'Creator Owner', 'admin@gmail.com', 'admin', '09c133a7d8e9544350d4f1ba5d7686faee445d4a', '', '', '0', '2015-01-01 03:00:00', '2017-07-05 15:38:28', '939004184');

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
-- Indices de la tabla `aws_plantillas`
--
ALTER TABLE `aws_plantillas`
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
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
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
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
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
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_plantillas`
--
ALTER TABLE `aws_plantillas`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
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
  MODIFY `ID` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT de la tabla `aws_sys_tables`
--
ALTER TABLE `aws_sys_tables`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `aws_sys_tracking`
--
ALTER TABLE `aws_sys_tracking`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `aws_sys_user`
--
ALTER TABLE `aws_sys_user`
  MODIFY `ID` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
