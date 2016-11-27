-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-11-2016 a las 09:19:06
-- Versión del servidor: 5.5.53-0ubuntu0.14.04.1
-- Versión de PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `softfly`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aeropuerto`
--

CREATE TABLE IF NOT EXISTS `aeropuerto` (
  `codigo` int(7) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET latin1 NOT NULL,
  `impuesto_aeroportuario` float NOT NULL,
  `costo_plataforma` float NOT NULL,
  `categoria` int(2) DEFAULT NULL,
  `ciudad` int(11) NOT NULL,
  `costo_gasolina` float DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `ciudad_to_aropuerto_idx` (`ciudad`),
  KEY `categoria_to_aeropuerto` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE TABLE IF NOT EXISTS `avion` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `estado` int(2) NOT NULL,
  `tipo_avion_id` int(4) NOT NULL,
  `capacidad_carga` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `estado` (`estado`),
  KEY `fk_avion_tipo_avion1_idx` (`tipo_avion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo_empleado`
--

CREATE TABLE IF NOT EXISTS `cargo_empleado` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `cargo_empleado`
--

INSERT INTO `cargo_empleado` (`id`, `nombre`) VALUES
(0, 'Piloto'),
(1, 'Copiloto'),
(2, 'Azafata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_aeropuerto`
--

CREATE TABLE IF NOT EXISTS `categoria_aeropuerto` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Volcado de datos para la tabla `categoria_aeropuerto`
--

INSERT INTO `categoria_aeropuerto` (`id`, `nombre`) VALUES
(5, 'Internacional'),
(10, 'Nacional'),
(26, 'Local');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `pais` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pais` (`pais`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=29 ;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `nombre`, `pais`) VALUES
(1, 'Medellín', 57),
(2, 'Bogotá', 57),
(3, 'Bucaramanga', 57),
(4, 'Cali', 57),
(5, 'Texas', 1),
(6, 'Massachussets', 1),
(7, 'Orlando', 1),
(8, 'Washington DC', 1),
(9, 'Paris', 33),
(10, 'Monaco', 33),
(11, 'Barcelona', 34),
(12, 'Madrid', 34),
(13, 'El cairo', 20),
(14, 'Ciudad del vaticano', 39),
(15, 'Amsterdam', 45),
(16, 'Sao Paulo', 55),
(17, 'La habana', 53),
(18, 'Brasilia', 55),
(19, 'Buenos Aires', 54),
(20, 'Rio de la plata', 54),
(21, 'Santiago', 56),
(22, 'Nueva Delhi', 91),
(23, 'Yakarta', 62),
(24, 'Sydney', 61),
(25, 'Pekin', 86),
(26, 'Shangai', 86),
(27, 'Yamoussoukro', 225),
(28, 'Barrancabermeja', 57);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion_vuelo`
--

CREATE TABLE IF NOT EXISTS `configuracion_vuelo` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(13) CHARACTER SET latin1 NOT NULL,
  `numero_pilotos` int(2) NOT NULL,
  `numero_copilotos` int(2) NOT NULL,
  `numero_azafatas` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `configuracion_vuelo`
--

INSERT INTO `configuracion_vuelo` (`id`, `nombre`, `numero_pilotos`, `numero_copilotos`, `numero_azafatas`) VALUES
(1, 'Nacional', 1, 1, 3),
(2, 'Internacional', 2, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `identificacion` int(12) NOT NULL,
  `nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cargo` int(2) NOT NULL,
  `email` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `telefono` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `apellido` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`identificacion`),
  KEY `cargo` (`cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_vuelo`
--

CREATE TABLE IF NOT EXISTS `empleado_vuelo` (
  `vuelo_id` int(12) NOT NULL,
  `empleado_identificacion` int(12) NOT NULL,
  PRIMARY KEY (`vuelo_id`,`empleado_identificacion`),
  KEY `fk_vuelo_has_empleado_empleado1_idx` (`empleado_identificacion`),
  KEY `fk_vuelo_has_empleado_vuelo1_idx` (`vuelo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escala`
--

CREATE TABLE IF NOT EXISTS `escala` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `id_vuelo` int(12) NOT NULL,
  `id_vuelo_escala` int(12) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_vuelo` (`id_vuelo`),
  KEY `id_vuelo_escala` (`id_vuelo_escala`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_avion`
--

CREATE TABLE IF NOT EXISTS `estado_avion` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `justificacion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `estado_avion`
--

INSERT INTO `estado_avion` (`id`, `nombre`, `justificacion`) VALUES
(0, 'Disponible', 'El avion esta listo para operar'),
(1, 'Inutilizable', 'El avion presenta alguna falla que impide su normal funcionamiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_vuelo`
--

CREATE TABLE IF NOT EXISTS `estado_vuelo` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `estado_vuelo`
--

INSERT INTO `estado_vuelo` (`id`, `nombre`) VALUES
(0, 'Programado'),
(1, 'En vuelo'),
(2, 'Arribo'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=996 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id`, `nombre`) VALUES
(1, 'USA'),
(20, 'EGY'),
(30, 'GRC'),
(32, 'BEL'),
(33, 'FRA'),
(34, 'ESP'),
(36, 'HUN'),
(39, 'VAT'),
(43, 'AUT'),
(44, 'IMN'),
(45, 'DNK'),
(49, 'DEU'),
(53, 'CUB'),
(54, 'ARG'),
(55, 'BRA'),
(56, 'CHL'),
(57, 'COL'),
(61, 'AUS'),
(62, 'IDN'),
(63, 'PHL'),
(82, 'KOR'),
(86, 'CHN'),
(91, 'IND'),
(93, 'AFG'),
(95, 'MMR'),
(98, 'IRN'),
(213, 'DZA'),
(220, 'GMB'),
(224, 'GIN'),
(225, 'CIV'),
(226, 'BFA'),
(229, 'BEN'),
(233, 'GHA'),
(235, 'TCD'),
(237, 'CMR'),
(238, 'CPV'),
(240, 'GNQ'),
(241, 'GAB'),
(242, 'COG'),
(243, 'COD'),
(244, 'AGO'),
(245, 'GNB'),
(251, 'ETH'),
(257, 'BDI'),
(267, 'BWA'),
(269, 'COM'),
(291, 'ERI'),
(297, 'ABW'),
(298, 'FRO'),
(299, 'GRL'),
(350, 'GIB'),
(353, 'IRL'),
(354, 'ISL'),
(355, 'ALB'),
(357, 'CYP'),
(358, 'FIN'),
(359, 'BGR'),
(372, 'EST'),
(374, 'ARM'),
(375, 'BLR'),
(376, 'AND'),
(385, 'HRV'),
(386, 'SVN'),
(387, 'BIH'),
(421, 'SVK'),
(500, 'FLK'),
(501, 'BLZ'),
(502, 'GTM'),
(503, 'SLV'),
(504, 'HND'),
(506, 'CRI'),
(509, 'HTI'),
(591, 'BOL'),
(592, 'GUY'),
(593, 'ECU'),
(599, 'ANT'),
(672, 'ATA'),
(673, 'BRN'),
(677, 'SLB'),
(679, 'FJI'),
(682, 'COK'),
(692, 'MHL'),
(850, 'PRK'),
(852, 'HKG'),
(855, 'KHM'),
(870, 'PCN'),
(880, 'BGD'),
(960, 'MDV'),
(964, 'IRQ'),
(966, 'SAU'),
(971, 'ARE'),
(972, 'ISR'),
(973, 'BHR'),
(975, 'BTN'),
(994, 'AZE'),
(995, 'GEO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puerta`
--

CREATE TABLE IF NOT EXISTS `puerta` (
  `id` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL,
  `id_aeropuerto` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_sala`,`id_aeropuerto`),
  KEY `id_sala` (`id_sala`,`id_aeropuerto`),
  KEY `id_aeropuerto` (`id_aeropuerto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE IF NOT EXISTS `ruta` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `aeropuerto_origen` int(7) NOT NULL,
  `aeropuerto_destino` int(7) NOT NULL,
  `distancia` float DEFAULT NULL,
  `tiempo_promedio` time DEFAULT NULL,
  `tipo_ruta` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ciudad_origen_UNIQUE` (`aeropuerto_origen`),
  KEY `ciudad_origen` (`aeropuerto_origen`),
  KEY `ciudad_destino` (`aeropuerto_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE IF NOT EXISTS `sala` (
  `id` int(11) NOT NULL,
  `id_aeropuerto` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_aeropuerto`),
  KEY `id` (`id`,`id_aeropuerto`),
  KEY `id_aeropuerto` (`id_aeropuerto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_avion`
--

CREATE TABLE IF NOT EXISTS `tipo_avion` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `gasto_gasolina` float NOT NULL,
  `velocidad` float NOT NULL,
  `sillas_primera_clase` int(3) NOT NULL,
  `sillas_clase_turista` int(3) NOT NULL,
  `capacidad_tanque` float NOT NULL,
  `nombre` varchar(15) CHARACTER SET latin1 NOT NULL,
  `configuracion_vuelo_id` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_avion_configuracion_vuelo1_idx` (`configuracion_vuelo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE IF NOT EXISTS `vuelo` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `avion` int(4) DEFAULT NULL,
  `ruta` int(12) DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `peso_carga` float DEFAULT NULL,
  `pasajeros_embarcados` int(3) DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL,
  `estado` int(2) NOT NULL,
  `incidentes` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `costo_total` float NOT NULL,
  `hora_salida` time NOT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `puerta_salida_id` int(11) NOT NULL,
  `puerta_salida_id_sala` int(11) NOT NULL,
  `puerta_salida_id_aeropuerto` int(11) NOT NULL,
  `puerta_llegada_id` int(11) NOT NULL,
  `puerta_llegada_id_sala` int(11) NOT NULL,
  `puerta_llegada_id_aeropuerto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `avion` (`avion`),
  KEY `ruta` (`ruta`),
  KEY `estado` (`estado`),
  KEY `puerta_salida_id` (`puerta_salida_id`),
  KEY `puerta_salida_id_sala` (`puerta_salida_id_sala`),
  KEY `puerta_salida_id_aeropuerto` (`puerta_salida_id_aeropuerto`),
  KEY `puerta_llegada_id` (`puerta_llegada_id`),
  KEY `puerta_llegada_id_sala` (`puerta_llegada_id_sala`),
  KEY `puerta_llegada_id_aeropuerto` (`puerta_llegada_id_aeropuerto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aeropuerto`
--
ALTER TABLE `aeropuerto`
  ADD CONSTRAINT `categoria_to_aeropuerto` FOREIGN KEY (`categoria`) REFERENCES `categoria_aeropuerto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ciudad_to_aropuerto` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `estado_avion_to_avion` FOREIGN KEY (`estado`) REFERENCES `estado_avion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_avion_tipo_avion1` FOREIGN KEY (`tipo_avion_id`) REFERENCES `tipo_avion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `pais_to_ciudad` FOREIGN KEY (`pais`) REFERENCES `pais` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `cargo_empleado_to_empleado` FOREIGN KEY (`cargo`) REFERENCES `cargo_empleado` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado_vuelo`
--
ALTER TABLE `empleado_vuelo`
  ADD CONSTRAINT `fk_vuelo_has_empleado_empleado1` FOREIGN KEY (`empleado_identificacion`) REFERENCES `empleado` (`identificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vuelo_has_empleado_vuelo1` FOREIGN KEY (`vuelo_id`) REFERENCES `vuelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `escala`
--
ALTER TABLE `escala`
  ADD CONSTRAINT `vuelo_to_escala` FOREIGN KEY (`id_vuelo`) REFERENCES `vuelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelo_to_escala2` FOREIGN KEY (`id_vuelo_escala`) REFERENCES `vuelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `puerta`
--
ALTER TABLE `puerta`
  ADD CONSTRAINT `puerta_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `puerta_ibfk_2` FOREIGN KEY (`id_aeropuerto`) REFERENCES `sala` (`id_aeropuerto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ciudad_destino_to_ruta` FOREIGN KEY (`aeropuerto_destino`) REFERENCES `aeropuerto` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ciudad_origen_to_ruta` FOREIGN KEY (`aeropuerto_origen`) REFERENCES `aeropuerto` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`id_aeropuerto`) REFERENCES `aeropuerto` (`codigo`);

--
-- Filtros para la tabla `tipo_avion`
--
ALTER TABLE `tipo_avion`
  ADD CONSTRAINT `fk_tipo_avion_configuracion_vuelo1` FOREIGN KEY (`configuracion_vuelo_id`) REFERENCES `configuracion_vuelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `avion_to_vuelo` FOREIGN KEY (`avion`) REFERENCES `avion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estado_vuelo_to_vuelo` FOREIGN KEY (`estado`) REFERENCES `estado_vuelo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ruta_to_vuelo` FOREIGN KEY (`ruta`) REFERENCES `ruta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelo_ibfk_1` FOREIGN KEY (`puerta_salida_id`) REFERENCES `puerta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelo_ibfk_2` FOREIGN KEY (`puerta_salida_id_sala`) REFERENCES `puerta` (`id_sala`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelo_ibfk_3` FOREIGN KEY (`puerta_salida_id_aeropuerto`) REFERENCES `puerta` (`id_aeropuerto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelo_ibfk_4` FOREIGN KEY (`puerta_llegada_id`) REFERENCES `puerta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelo_ibfk_5` FOREIGN KEY (`puerta_llegada_id_sala`) REFERENCES `puerta` (`id_sala`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vuelo_ibfk_6` FOREIGN KEY (`puerta_llegada_id_aeropuerto`) REFERENCES `puerta` (`id_aeropuerto`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
