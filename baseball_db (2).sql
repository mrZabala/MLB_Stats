-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2025 a las 05:47:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `baseball_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_del_equipo` int(11) NOT NULL,
  `nombre_del_equipo` varchar(100) NOT NULL,
  `abreviacion_del_equipo` varchar(10) NOT NULL,
  `id_de_la_liga` int(11) NOT NULL,
  `ubicacion_de_origen_del_equipo` varchar(100) DEFAULT NULL,
  `fecha_del_primer_juego_del_equipo` date DEFAULT NULL,
  `juegos_ganados` int(11) DEFAULT 0,
  `juegos_perdidos` int(11) DEFAULT 0,
  `campeonato_ganados` int(11) DEFAULT 0,
  `ciudad_del_equipo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_del_equipo`, `nombre_del_equipo`, `abreviacion_del_equipo`, `id_de_la_liga`, `ubicacion_de_origen_del_equipo`, `fecha_del_primer_juego_del_equipo`, `juegos_ganados`, `juegos_perdidos`, `campeonato_ganados`, `ciudad_del_equipo`) VALUES
(1, 'New York Yankees', 'NYY', 1, 'New York', '1903-04-22', 10846, 8270, 27, NULL),
(2, 'Boston Red Sox', 'BOS', 1, 'Boston', '1901-04-26', 9727, 9060, 9, NULL),
(3, 'Los Angeles Dodgers', 'LAD', 2, 'Los Angeles', '1884-05-01', 11123, 9891, 7, NULL),
(4, 'Chicago Cubs', 'CHC', 2, 'Chicago', '1876-04-25', 11093, 10537, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadisticas_equipos`
--

CREATE TABLE `estadisticas_equipos` (
  `id_del_equipo` int(11) NOT NULL,
  `juegos_jugados` int(11) DEFAULT 0,
  `turnos_al_bate` int(11) DEFAULT 0,
  `carreras` int(11) DEFAULT 0,
  `hits` int(11) DEFAULT 0,
  `dobles` int(11) DEFAULT 0,
  `triples` int(11) DEFAULT 0,
  `home_runs` int(11) DEFAULT 0,
  `carreras_impulsadas` int(11) DEFAULT 0,
  `bases_por_bola` int(11) DEFAULT 0,
  `ponches` int(11) DEFAULT 0,
  `bases_robadas` int(11) DEFAULT 0,
  `atrapado_robando` int(11) DEFAULT 0,
  `promedios_al_bate` decimal(4,3) DEFAULT 0.000,
  `Promedio_de_alcanzar_base` decimal(4,3) DEFAULT 0.000,
  `promedio_de_slugging` decimal(4,3) DEFAULT 0.000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadisticas_jugadores`
--

CREATE TABLE `estadisticas_jugadores` (
  `id_estadistica` int(11) NOT NULL,
  `id_del_jugador` int(11) NOT NULL,
  `juegos_jugados` int(11) DEFAULT 0,
  `turnos_al_bate` int(11) DEFAULT 0,
  `carreras` int(11) DEFAULT 0,
  `hits` int(11) DEFAULT 0,
  `total_de_bases` int(11) DEFAULT 0,
  `dobles` int(11) DEFAULT 0,
  `triples` int(11) DEFAULT 0,
  `home_runs` int(11) DEFAULT 0,
  `carreras_impulsadas` int(11) DEFAULT 0,
  `bases_por_bola` int(11) DEFAULT 0,
  `pase_internacional` int(11) DEFAULT 0,
  `ponches` int(11) DEFAULT 0,
  `bases_robadas` int(11) DEFAULT 0,
  `atrapado_robando_base` int(11) DEFAULT 0,
  `promedio_de_bateo` decimal(4,3) DEFAULT 0.000,
  `promedio_de_enbasase` decimal(4,3) DEFAULT 0.000,
  `promedio_de_slugging` decimal(4,3) DEFAULT 0.000,
  `rollings_y_flyout` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadisticas_jugadores`
--

INSERT INTO `estadisticas_jugadores` (`id_estadistica`, `id_del_jugador`, `juegos_jugados`, `turnos_al_bate`, `carreras`, `hits`, `total_de_bases`, `dobles`, `triples`, `home_runs`, `carreras_impulsadas`, `bases_por_bola`, `pase_internacional`, `ponches`, `bases_robadas`, `atrapado_robando_base`, `promedio_de_bateo`, `promedio_de_enbasase`, `promedio_de_slugging`, `rollings_y_flyout`) VALUES
(1, 1, 148, 535, 106, 155, 329, 30, 0, 48, 123, 88, 6, 190, 10, 1, 0.290, 0.395, 0.615, 190),
(2, 2, 143, 568, 117, 176, 362, 26, 8, 48, 99, 52, 2, 143, 20, 3, 0.310, 0.390, 0.637, 247),
(3, 3, 153, 614, 91, 172, 289, 37, 1, 26, 96, 45, 0, 133, 5, 3, 0.280, 0.338, 0.471, 264),
(4, 4, 159, 592, 83, 155, 236, 32, 2, 15, 70, 49, 0, 167, 9, 2, 0.262, 0.330, 0.399, 270);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_juegos`
--

CREATE TABLE `historial_juegos` (
  `id` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `fecha_del_juego` date NOT NULL,
  `equipo_contrario` varchar(100) DEFAULT NULL,
  `resultado` varchar(10) DEFAULT NULL,
  `id_del_jugador` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT 0,
  `carreras` int(11) DEFAULT 0,
  `home_runs` int(11) DEFAULT 0,
  `ponches` int(11) DEFAULT 0,
  `veces_al_bate` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id_del_juego` int(11) NOT NULL,
  `id_del_equipo` int(11) NOT NULL,
  `estadio_donde_se_jugara` varchar(100) NOT NULL,
  `fecha_del_juego` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `pitcher_abridor` varchar(100) DEFAULT NULL,
  `temporada` varchar(20) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id_del_jugador` int(11) NOT NULL,
  `nombre_del_jugador` varchar(100) NOT NULL,
  `edad_del_jugador` int(11) DEFAULT NULL,
  `numero_del_jugador` int(11) DEFAULT NULL,
  `id_del_equipo` int(11) DEFAULT NULL,
  `id_de_la_liga` int(11) DEFAULT NULL,
  `debut_del_jugador` date DEFAULT NULL,
  `genero_del_jugador` enum('M','F','Otro') DEFAULT NULL,
  `estatura_de_jugador` decimal(5,2) DEFAULT NULL,
  `peso_del_jugador` decimal(5,2) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `posicion_del_jugador` varchar(50) DEFAULT NULL,
  `mano_dominante_del_jugador` enum('Derecho','Izquierdo','Ambidiestro') DEFAULT NULL,
  `apodo_del_jugador` varchar(100) DEFAULT NULL,
  `año_draft` year(4) DEFAULT NULL,
  `lugar_de_nacimiento` int(11) DEFAULT 0,
  `veces_al_bate` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_del_jugador`, `nombre_del_jugador`, `edad_del_jugador`, `numero_del_jugador`, `id_del_equipo`, `id_de_la_liga`, `debut_del_jugador`, `genero_del_jugador`, `estatura_de_jugador`, `peso_del_jugador`, `fecha_nacimiento`, `posicion_del_jugador`, `mano_dominante_del_jugador`, `apodo_del_jugador`, `año_draft`, `lugar_de_nacimiento`, `veces_al_bate`) VALUES
(1, 'Aaron Judge', 32, 99, 1, 1, '2016-08-13', 'M', 201.00, 128.00, '1992-04-26', 'Jardinero derecho', 'Derecho', 'The Judge', '2013', 0, 0),
(2, 'Shohei Ohtani', 30, 17, 3, 2, '2018-03-29', 'M', 193.00, 95.00, '1994-07-05', 'Bateador designado/Lanzador', 'Ambidiestro', 'Showtime', '2018', 0, 0),
(3, 'Rafael Devers', 27, 11, 2, 1, '2017-07-25', 'M', 183.00, 108.00, '1996-10-24', 'Tercera base', 'Izquierdo', 'Carita', '2013', 0, 0),
(4, 'Dansby Swanson', 30, 7, 4, 2, '2016-08-17', 'M', 185.00, 86.00, '1994-02-11', 'Campocorto', 'Derecho', 'Dans', '2015', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ligas`
--

CREATE TABLE `ligas` (
  `id_de_la_liga` int(11) NOT NULL,
  `nombre_de_la_liga` varchar(100) NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `id_jugador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ligas`
--

INSERT INTO `ligas` (`id_de_la_liga`, `nombre_de_la_liga`, `id_equipo`, `id_jugador`) VALUES
(1, 'Liga Americana', NULL, NULL),
(2, 'Liga Nacional', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_del_equipo`),
  ADD KEY `id_de_la_liga` (`id_de_la_liga`);

--
-- Indices de la tabla `estadisticas_equipos`
--
ALTER TABLE `estadisticas_equipos`
  ADD PRIMARY KEY (`id_del_equipo`);

--
-- Indices de la tabla `estadisticas_jugadores`
--
ALTER TABLE `estadisticas_jugadores`
  ADD PRIMARY KEY (`id_estadistica`),
  ADD KEY `id_del_jugador` (`id_del_jugador`);

--
-- Indices de la tabla `historial_juegos`
--
ALTER TABLE `historial_juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id_del_juego`),
  ADD KEY `id_del_equipo` (`id_del_equipo`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id_del_jugador`),
  ADD KEY `id_del_equipo` (`id_del_equipo`),
  ADD KEY `id_de_la_liga` (`id_de_la_liga`);

--
-- Indices de la tabla `ligas`
--
ALTER TABLE `ligas`
  ADD PRIMARY KEY (`id_de_la_liga`),
  ADD KEY `fk_ligas_equipos` (`id_equipo`),
  ADD KEY `fk_ligas_jugadores` (`id_jugador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_del_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estadisticas_jugadores`
--
ALTER TABLE `estadisticas_jugadores`
  MODIFY `id_estadistica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial_juegos`
--
ALTER TABLE `historial_juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id_del_juego` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id_del_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ligas`
--
ALTER TABLE `ligas`
  MODIFY `id_de_la_liga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_de_la_liga`) REFERENCES `ligas` (`id_de_la_liga`);

--
-- Filtros para la tabla `estadisticas_equipos`
--
ALTER TABLE `estadisticas_equipos`
  ADD CONSTRAINT `estadisticas_equipos_ibfk_1` FOREIGN KEY (`id_del_equipo`) REFERENCES `equipos` (`id_del_equipo`);

--
-- Filtros para la tabla `estadisticas_jugadores`
--
ALTER TABLE `estadisticas_jugadores`
  ADD CONSTRAINT `estadisticas_jugadores_ibfk_1` FOREIGN KEY (`id_del_jugador`) REFERENCES `jugadores` (`id_del_jugador`);

--
-- Filtros para la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`id_del_equipo`) REFERENCES `equipos` (`id_del_equipo`);

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_del_equipo`) REFERENCES `equipos` (`id_del_equipo`),
  ADD CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`id_de_la_liga`) REFERENCES `ligas` (`id_de_la_liga`);

--
-- Filtros para la tabla `ligas`
--
ALTER TABLE `ligas`
  ADD CONSTRAINT `fk_ligas_equipos` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_del_equipo`),
  ADD CONSTRAINT `fk_ligas_jugadores` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_del_jugador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
