-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-06-2024 a las 04:23:57
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `netflix-gt-`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_actor`
--

CREATE TABLE `tbl_actor` (
  `IdActor` int(11) NOT NULL,
  `Nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Edad` int(11) NOT NULL,
  `Biografia` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `Peliculas` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `Pais` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_detallepelicula`
--

CREATE TABLE `tbl_detallepelicula` (
  `IdDetallePelicula` int(11) NOT NULL,
  `Categoria` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Duracion` int(11) NOT NULL,
  `Director` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Sipnosis` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `IdSerie` int(11) NOT NULL,
  `IdActor` int(11) NOT NULL,
  `IdPelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_encpelicula`
--

CREATE TABLE `tbl_encpelicula` (
  `IdEncabezadoPelicula` int(11) NOT NULL,
  `Titulo` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaDeLanzamiento` int(11) NOT NULL,
  `calificacion` longblob NOT NULL,
  `IdPerfil` int(11) NOT NULL,
  `IdSerie` int(11) NOT NULL,
  `IdPelicula` int(11) NOT NULL,
  `IdDetallePelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pelicula`
--

CREATE TABLE `tbl_pelicula` (
  `IdPelicula` int(11) NOT NULL,
  `Nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaEstreno` int(11) NOT NULL,
  `Genero` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(30) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_perfil`
--

CREATE TABLE `tbl_perfil` (
  `IdPerfil` int(11) NOT NULL,
  `NombrePerfil` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Password` varchar(10) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_serie`
--

CREATE TABLE `tbl_serie` (
  `IdSerie` int(11) NOT NULL,
  `Nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Descripcion` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `NumeroDeTemporada` int(11) NOT NULL,
  `NumeroDeSerie` int(11) NOT NULL,
  `FechaDeEstreno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(25) COLLATE utf8_spanish2_ci NOT NULL,
  `Correo` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `Pais` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `IdPerfil` int(11) NOT NULL,
  `IdDetallePelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_actor`
--
ALTER TABLE `tbl_actor`
  ADD PRIMARY KEY (`IdActor`);

--
-- Indices de la tabla `tbl_detallepelicula`
--
ALTER TABLE `tbl_detallepelicula`
  ADD PRIMARY KEY (`IdDetallePelicula`),
  ADD KEY `tbl_actor_tbl_detallepelicula_fk` (`IdActor`),
  ADD KEY `tbl_serie_tbl_detallepelicula_fk` (`IdSerie`),
  ADD KEY `tbl_pelicula_tbl_detallepelicula_fk` (`IdPelicula`);

--
-- Indices de la tabla `tbl_encpelicula`
--
ALTER TABLE `tbl_encpelicula`
  ADD PRIMARY KEY (`IdEncabezadoPelicula`),
  ADD KEY `tbl_serie_tbl_encpelicula_fk` (`IdSerie`),
  ADD KEY `tbl_pelicula_tbl_encpelicula_fk` (`IdPelicula`),
  ADD KEY `tbl_detallepelicula_tbl_encpelicula_fk` (`IdDetallePelicula`),
  ADD KEY `tbl_perfil_tbl_encpelicula_fk` (`IdPerfil`);

--
-- Indices de la tabla `tbl_pelicula`
--
ALTER TABLE `tbl_pelicula`
  ADD PRIMARY KEY (`IdPelicula`);

--
-- Indices de la tabla `tbl_perfil`
--
ALTER TABLE `tbl_perfil`
  ADD PRIMARY KEY (`IdPerfil`);

--
-- Indices de la tabla `tbl_serie`
--
ALTER TABLE `tbl_serie`
  ADD PRIMARY KEY (`IdSerie`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`IdUsuario`),
  ADD KEY `tbl_detallepelicula_tbl_usuario_fk` (`IdDetallePelicula`),
  ADD KEY `tbl_perfil_tbl_usuario_fk` (`IdPerfil`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_detallepelicula`
--
ALTER TABLE `tbl_detallepelicula`
  ADD CONSTRAINT `tbl_actor_tbl_detallepelicula_fk` FOREIGN KEY (`IdActor`) REFERENCES `tbl_actor` (`IdActor`),
  ADD CONSTRAINT `tbl_pelicula_tbl_detallepelicula_fk` FOREIGN KEY (`IdPelicula`) REFERENCES `tbl_pelicula` (`IdPelicula`),
  ADD CONSTRAINT `tbl_serie_tbl_detallepelicula_fk` FOREIGN KEY (`IdSerie`) REFERENCES `tbl_serie` (`IdSerie`);

--
-- Filtros para la tabla `tbl_encpelicula`
--
ALTER TABLE `tbl_encpelicula`
  ADD CONSTRAINT `tbl_detallepelicula_tbl_encpelicula_fk` FOREIGN KEY (`IdDetallePelicula`) REFERENCES `tbl_detallepelicula` (`IdDetallePelicula`),
  ADD CONSTRAINT `tbl_pelicula_tbl_encpelicula_fk` FOREIGN KEY (`IdPelicula`) REFERENCES `tbl_pelicula` (`IdPelicula`),
  ADD CONSTRAINT `tbl_perfil_tbl_encpelicula_fk` FOREIGN KEY (`IdPerfil`) REFERENCES `tbl_perfil` (`IdPerfil`),
  ADD CONSTRAINT `tbl_serie_tbl_encpelicula_fk` FOREIGN KEY (`IdSerie`) REFERENCES `tbl_serie` (`IdSerie`);

--
-- Filtros para la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `tbl_detallepelicula_tbl_usuario_fk` FOREIGN KEY (`IdDetallePelicula`) REFERENCES `tbl_detallepelicula` (`IdDetallePelicula`),
  ADD CONSTRAINT `tbl_perfil_tbl_usuario_fk` FOREIGN KEY (`IdPerfil`) REFERENCES `tbl_perfil` (`IdPerfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
