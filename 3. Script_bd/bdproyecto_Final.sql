-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 11-05-2017 a las 07:16:27
-- Versión del servidor: 5.6.13
-- Versión de PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdproyecto`
--
CREATE DATABASE IF NOT EXISTS `bdproyecto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bdproyecto`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE IF NOT EXISTS `acceso` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(30) NOT NULL,
  `pass` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`idUsuario`, `usuario`, `pass`) VALUES
(1, 'PSanz', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviso`
--

CREATE TABLE IF NOT EXISTS `aviso` (
  `idAviso` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `solucionado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idAviso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aviso_has_trabajador`
--

CREATE TABLE IF NOT EXISTS `aviso_has_trabajador` (
  `Aviso_idAviso` int(11) NOT NULL,
  `Trabajadores_idTrabajador` int(11) NOT NULL,
  PRIMARY KEY (`Aviso_idAviso`,`Trabajadores_idTrabajador`),
  KEY `fk_Aviso_has_Trabajadores_Trabajadores1_idx` (`Trabajadores_idTrabajador`),
  KEY `fk_Aviso_has_Trabajadores_Aviso1_idx` (`Aviso_idAviso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro`
--

CREATE TABLE IF NOT EXISTS `centro` (
  `idCentro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `cp` varchar(6) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `tlf` varchar(9) NOT NULL,
  PRIMARY KEY (`idCentro`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `centro`
--

INSERT INTO `centro` (`idCentro`, `nombre`, `calle`, `numero`, `cp`, `ciudad`, `provincia`, `tlf`) VALUES
(1, 'Himevico', 'c/falsa 123', '23', '01003', 'Vitoria', 'Álava', '905293402');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parte`
--

CREATE TABLE IF NOT EXISTS `parte` (
  `idParte` int(11) NOT NULL AUTO_INCREMENT,
  `kmInicio` int(11) DEFAULT NULL,
  `kmFin` int(11) DEFAULT NULL,
  `gasto` double DEFAULT NULL,
  `incidencia` varchar(45) DEFAULT NULL,
  `estado` varchar(7) NOT NULL,
  `Trabajadores_idTrabajador` int(11) NOT NULL,
  `Vehiculo_idVehiculo` int(11) NOT NULL,
  PRIMARY KEY (`idParte`,`Vehiculo_idVehiculo`),
  KEY `fk_Partes_Trabajadores1_idx` (`Trabajadores_idTrabajador`),
  KEY `fk_Parte_Vehiculo1_idx` (`Vehiculo_idVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajador`
--

CREATE TABLE IF NOT EXISTS `trabajador` (
  `idTrabajador` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `ape1` varchar(45) NOT NULL,
  `ape2` varchar(45) NOT NULL,
  `dir` varchar(45) DEFAULT NULL,
  `tlfpers` varchar(9) DEFAULT NULL,
  `tlfempr` varchar(9) NOT NULL,
  `salario` varchar(5) NOT NULL,
  `fnac` varchar(20) DEFAULT NULL,
  `categoria` varchar(45) NOT NULL,
  `Accesos_idUsuario` int(11) NOT NULL,
  `Centros_idCentro` int(11) NOT NULL,
  PRIMARY KEY (`idTrabajador`,`Accesos_idUsuario`,`Centros_idCentro`),
  UNIQUE KEY `dni` (`dni`),
  KEY `fk_Trabajadores_Accesos_idx` (`Accesos_idUsuario`),
  KEY `fk_Trabajadores_Centros1_idx` (`Centros_idCentro`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `trabajador`
--

INSERT INTO `trabajador` (`idTrabajador`, `dni`, `nombre`, `ape1`, `ape2`, `dir`, `tlfpers`, `tlfempr`, `salario`, `fnac`, `categoria`, `Accesos_idUsuario`, `Centros_idCentro`) VALUES
(1, '87654321Q', 'Pedro', 'Sanz', 'Alonso', NULL, NULL, '905203293', '1200', NULL, 'Administración', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE IF NOT EXISTS `vehiculo` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(8) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `kilometraje` varchar(45) NOT NULL,
  `anyo` varchar(4) NOT NULL,
  PRIMARY KEY (`idVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE IF NOT EXISTS `viaje` (
  `idViajes` int(11) NOT NULL AUTO_INCREMENT,
  `horaInicio` varchar(8) NOT NULL,
  `horaFin` varchar(8) NOT NULL,
  `albaran` int(7) NOT NULL,
  `Partes_idParte` int(11) NOT NULL,
  PRIMARY KEY (`idViajes`,`Partes_idParte`),
  KEY `fk_Viajes_Partes1_idx` (`Partes_idParte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aviso_has_trabajador`
--
ALTER TABLE `aviso_has_trabajador`
  ADD CONSTRAINT `fk_Aviso_has_Trabajadores_Aviso1` FOREIGN KEY (`Aviso_idAviso`) REFERENCES `aviso` (`idAviso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Aviso_has_Trabajadores_Trabajadores1` FOREIGN KEY (`Trabajadores_idTrabajador`) REFERENCES `trabajador` (`idTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `parte`
--
ALTER TABLE `parte`
  ADD CONSTRAINT `fk_Partes_Trabajadores1` FOREIGN KEY (`Trabajadores_idTrabajador`) REFERENCES `trabajador` (`idTrabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Parte_Vehiculo1` FOREIGN KEY (`Vehiculo_idVehiculo`) REFERENCES `vehiculo` (`idVehiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `trabajador`
--
ALTER TABLE `trabajador`
  ADD CONSTRAINT `fk_Trabajadores_Accesos` FOREIGN KEY (`Accesos_idUsuario`) REFERENCES `acceso` (`idUsuario`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Trabajadores_Centros1` FOREIGN KEY (`Centros_idCentro`) REFERENCES `centro` (`idCentro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `fk_Viajes_Partes1` FOREIGN KEY (`Partes_idParte`) REFERENCES `parte` (`idParte`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
