-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2025 a las 21:07:55
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
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id_del_juego`, `id_del_equipo`, `estadio_donde_se_jugara`, `fecha_del_juego`, `hora_inicio`, `pitcher_abridor`, `temporada`, `descripcion`) VALUES
(720001, 108, 'Angel Stadium', '2025-05-15', '19:07:00', 'Reid Detmers', '2025', 'Partido de temporada regular contra Seattle Mariners'),
(720002, 109, 'Chase Field', '2025-05-15', '18:40:00', 'Zac Gallen', '2025', 'Partido interligas contra Kansas City Royals'),
(720003, 110, 'Oriole Park at Camden Yards', '2025-05-16', '19:05:00', 'Corbin Burnes', '2025', 'Serie divisional contra Boston Red Sox'),
(720004, 111, 'Fenway Park', '2025-05-16', '19:10:00', 'Brayan Bello', '2025', 'Clásico rival contra New York Yankees'),
(720005, 112, 'Wrigley Field', '2025-05-17', '13:20:00', 'Justin Steele', '2025', 'Partido de sábado por la tarde contra St. Louis Cardinals'),
(720006, 113, 'Great American Ball Park', '2025-05-17', '18:40:00', 'Hunter Greene', '2025', 'Enfrentamiento contra Los Angeles Dodgers'),
(720007, 114, 'Progressive Field', '2025-05-18', '13:10:00', 'Shane Bieber', '2025', 'Juego dominical contra Minnesota Twins'),
(720008, 115, 'Coors Field', '2025-05-18', '13:10:00', 'Kyle Freeland', '2025', 'Partido en casa contra San Francisco Giants'),
(720009, 116, 'Comerica Park', '2025-05-19', '18:40:00', 'Tarik Skubal', '2025', 'Serie contra Toronto Blue Jays'),
(720010, 117, 'Minute Maid Park', '2025-05-19', '19:10:00', 'Framber Valdez', '2025', 'Duelo texano contra Texas Rangers'),
(720011, 118, 'Kauffman Stadium', '2025-05-20', '19:10:00', 'Cole Ragans', '2025', 'Partido contra Chicago White Sox'),
(720012, 119, 'Dodger Stadium', '2025-05-20', '19:10:00', 'Yoshinobu Yamamoto', '2025', 'Serie contra Arizona Diamondbacks'),
(720013, 120, 'Nationals Park', '2025-05-21', '19:05:00', 'Josiah Gray', '2025', 'Enfrentamiento con New York Mets'),
(720014, 121, 'Citi Field', '2025-05-21', '19:10:00', 'Kodai Senga', '2025', 'Juego contra Philadelphia Phillies'),
(720015, 133, 'Oakland Coliseum', '2025-05-22', '18:40:00', 'Paul Blackburn', '2025', 'Partido contra Houston Astros'),
(720016, 134, 'PNC Park', '2025-05-22', '18:35:00', 'Mitch Keller', '2025', 'Serie contra Chicago Cubs'),
(720017, 135, 'Petco Park', '2025-05-23', '18:40:00', 'Yu Darvish', '2025', 'Duelo californiano contra Los Angeles Dodgers'),
(720018, 136, 'T-Mobile Park', '2025-05-23', '19:10:00', 'Luis Castillo', '2025', 'Partido contra Oakland Athletics'),
(720019, 137, 'Oracle Park', '2025-05-24', '13:05:00', 'Logan Webb', '2025', 'Juego de día contra Colorado Rockies'),
(720020, 138, 'Busch Stadium', '2025-05-24', '18:15:00', 'Sonny Gray', '2025', 'Rivalidad histórica contra Chicago Cubs'),
(720021, 139, 'Tropicana Field', '2025-05-25', '13:10:00', 'Zach Eflin', '2025', 'Partido contra Kansas City Royals'),
(720022, 140, 'Globe Life Field', '2025-05-25', '13:35:00', 'Nathan Eovaldi', '2025', 'Serie contra Houston Astros'),
(720023, 141, 'Rogers Centre', '2025-05-26', '15:07:00', 'Kevin Gausman', '2025', 'Juego feriado contra Detroit Tigers'),
(720024, 142, 'Target Field', '2025-05-26', '13:10:00', 'Pablo López', '2025', 'Enfrentamiento con Cleveland Guardians'),
(720025, 143, 'Citizens Bank Park', '2025-05-27', '18:40:00', 'Zack Wheeler', '2025', 'Partido contra Atlanta Braves'),
(720026, 144, 'Truist Park', '2025-05-27', '19:20:00', 'Spencer Strider', '2025', 'Duelo divisional contra Philadelphia Phillies'),
(720027, 145, 'Guaranteed Rate Field', '2025-05-28', '19:10:00', 'Dylan Cease', '2025', 'Serie contra Baltimore Orioles'),
(720028, 146, 'loanDepot park', '2025-05-28', '18:40:00', 'Jesús Luzardo', '2025', 'Partido contra Washington Nationals'),
(720029, 147, 'Yankee Stadium', '2025-05-29', '19:05:00', 'Gerrit Cole', '2025', 'Clásico contra Boston Red Sox'),
(720030, 158, 'American Family Field', '2025-05-29', '18:40:00', 'Freddy Peralta', '2025', 'Serie contra St. Louis Cardinals');

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_del_equipo`, `nombre_del_equipo`, `abreviacion_del_equipo`, `id_de_la_liga`, `ubicacion_de_origen_del_equipo`, `fecha_del_primer_juego_del_equipo`, `juegos_ganados`, `juegos_perdidos`, `campeonato_ganados`, `ciudad_del_equipo`) VALUES
(108, 'Los Angeles Angels', 'LAA', 1, 'Anaheim', '1961-04-01', 16, 23, 0, ''),
(109, 'Arizona Diamondbacks', 'AZ', 2, 'Phoenix', '1996-04-01', 21, 20, 0, ''),
(110, 'Baltimore Orioles', 'BAL', 1, 'Baltimore', '1901-04-01', 15, 24, 0, ''),
(111, 'Boston Red Sox', 'BOS', 1, 'Boston', '1901-04-01', 22, 20, 9, ''),
(112, 'Chicago Cubs', 'CHC', 2, 'Chicago', '1874-04-01', 23, 18, 0, ''),
(113, 'Cincinnati Reds', 'CIN', 2, 'Cincinnati', '1882-04-01', 20, 22, 0, ''),
(114, 'Cleveland Guardians', 'CLE', 1, 'Cleveland', '1901-04-01', 23, 17, 0, ''),
(115, 'Colorado Rockies', 'COL', 2, 'Denver', '1992-04-01', 7, 33, 0, ''),
(116, 'Detroit Tigers', 'DET', 1, 'Detroit', '1901-04-01', 26, 15, 0, ''),
(117, 'Houston Astros', 'HOU', 1, 'Houston', '1962-04-01', 20, 19, 0, ''),
(118, 'Kansas City Royals', 'KC', 1, 'Kansas City', '1968-04-01', 24, 18, 0, ''),
(119, 'Los Angeles Dodgers', 'LAD', 2, 'Los Angeles', '1884-04-01', 27, 14, 7, ''),
(120, 'Washington Nationals', 'WSH', 2, 'Washington', '1968-04-01', 17, 24, 0, ''),
(121, 'New York Mets', 'NYM', 2, 'Flushing', '1962-04-01', 26, 15, 0, ''),
(133, 'Athletics', 'ATH', 1, 'Sacramento', '1901-04-01', 21, 20, 0, ''),
(134, 'Pittsburgh Pirates', 'PIT', 2, 'Pittsburgh', '1882-04-01', 14, 27, 0, ''),
(135, 'San Diego Padres', 'SD', 2, 'San Diego', '1968-04-01', 25, 14, 0, ''),
(136, 'Seattle Mariners', 'SEA', 1, 'Seattle', '1977-04-01', 22, 17, 0, ''),
(137, 'San Francisco Giants', 'SF', 2, 'San Francisco', '1883-04-01', 24, 17, 0, ''),
(138, 'St. Louis Cardinals', 'STL', 2, 'St. Louis', '1892-04-01', 22, 19, 11, ''),
(139, 'Tampa Bay Rays', 'TB', 1, 'Tampa', '1996-04-01', 18, 22, 0, ''),
(140, 'Texas Rangers', 'TEX', 1, 'Arlington', '1961-04-01', 20, 21, 0, ''),
(141, 'Toronto Blue Jays', 'TOR', 1, 'Toronto', '1977-04-01', 20, 20, 0, ''),
(142, 'Minnesota Twins', 'MIN', 1, 'Minneapolis', '1901-04-01', 21, 20, 0, ''),
(143, 'Philadelphia Phillies', 'PHI', 2, 'Philadelphia', '1883-04-01', 24, 16, 0, ''),
(144, 'Atlanta Braves', 'ATL', 2, 'Atlanta', '1871-04-01', 19, 21, 0, ''),
(145, 'Chicago White Sox', 'CWS', 1, 'Chicago', '1901-04-01', 12, 29, 0, ''),
(146, 'Miami Marlins', 'MIA', 2, 'Miami', '1991-04-01', 15, 24, 0, ''),
(147, 'New York Yankees', 'NYY', 1, 'Bronx', '1903-04-01', 23, 17, 27, ''),
(158, 'Milwaukee Brewers', 'MIL', 2, 'Milwaukee', '1968-04-01', 20, 21, 0, '');

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

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id_del_juego`, `id_del_equipo`, `estadio_donde_se_jugara`, `fecha_del_juego`, `hora_inicio`, `pitcher_abridor`, `temporada`, `descripcion`) VALUES
(720001, 108, 'Angel Stadium', '2025-05-15', '19:07:00', 'Reid Detmers', '2025', 'Partido de temporada regular contra Seattle Mariners'),
(720002, 109, 'Chase Field', '2025-05-15', '18:40:00', 'Zac Gallen', '2025', 'Partido interligas contra Kansas City Royals'),
(720003, 110, 'Oriole Park at Camden Yards', '2025-05-16', '19:05:00', 'Corbin Burnes', '2025', 'Serie divisional contra Boston Red Sox'),
(720004, 111, 'Fenway Park', '2025-05-16', '19:10:00', 'Brayan Bello', '2025', 'Clásico rival contra New York Yankees'),
(720005, 112, 'Wrigley Field', '2025-05-17', '13:20:00', 'Justin Steele', '2025', 'Partido de sábado por la tarde contra St. Louis Cardinals'),
(720006, 113, 'Great American Ball Park', '2025-05-17', '18:40:00', 'Hunter Greene', '2025', 'Enfrentamiento contra Los Angeles Dodgers'),
(720007, 114, 'Progressive Field', '2025-05-18', '13:10:00', 'Shane Bieber', '2025', 'Juego dominical contra Minnesota Twins'),
(720008, 115, 'Coors Field', '2025-05-18', '13:10:00', 'Kyle Freeland', '2025', 'Partido en casa contra San Francisco Giants'),
(720009, 116, 'Comerica Park', '2025-05-19', '18:40:00', 'Tarik Skubal', '2025', 'Serie contra Toronto Blue Jays'),
(720010, 117, 'Minute Maid Park', '2025-05-19', '19:10:00', 'Framber Valdez', '2025', 'Duelo texano contra Texas Rangers'),
(720011, 118, 'Kauffman Stadium', '2025-05-20', '19:10:00', 'Cole Ragans', '2025', 'Partido contra Chicago White Sox'),
(720012, 119, 'Dodger Stadium', '2025-05-20', '19:10:00', 'Yoshinobu Yamamoto', '2025', 'Serie contra Arizona Diamondbacks'),
(720013, 120, 'Nationals Park', '2025-05-21', '19:05:00', 'Josiah Gray', '2025', 'Enfrentamiento con New York Mets'),
(720014, 121, 'Citi Field', '2025-05-21', '19:10:00', 'Kodai Senga', '2025', 'Juego contra Philadelphia Phillies'),
(720015, 133, 'Oakland Coliseum', '2025-05-22', '18:40:00', 'Paul Blackburn', '2025', 'Partido contra Houston Astros'),
(720016, 134, 'PNC Park', '2025-05-22', '18:35:00', 'Mitch Keller', '2025', 'Serie contra Chicago Cubs'),
(720017, 135, 'Petco Park', '2025-05-23', '18:40:00', 'Yu Darvish', '2025', 'Duelo californiano contra Los Angeles Dodgers'),
(720018, 136, 'T-Mobile Park', '2025-05-23', '19:10:00', 'Luis Castillo', '2025', 'Partido contra Oakland Athletics'),
(720019, 137, 'Oracle Park', '2025-05-24', '13:05:00', 'Logan Webb', '2025', 'Juego de día contra Colorado Rockies'),
(720020, 138, 'Busch Stadium', '2025-05-24', '18:15:00', 'Sonny Gray', '2025', 'Rivalidad histórica contra Chicago Cubs'),
(720021, 139, 'Tropicana Field', '2025-05-25', '13:10:00', 'Zach Eflin', '2025', 'Partido contra Kansas City Royals'),
(720022, 140, 'Globe Life Field', '2025-05-25', '13:35:00', 'Nathan Eovaldi', '2025', 'Serie contra Houston Astros'),
(720023, 141, 'Rogers Centre', '2025-05-26', '15:07:00', 'Kevin Gausman', '2025', 'Juego feriado contra Detroit Tigers'),
(720024, 142, 'Target Field', '2025-05-26', '13:10:00', 'Pablo López', '2025', 'Enfrentamiento con Cleveland Guardians'),
(720025, 143, 'Citizens Bank Park', '2025-05-27', '18:40:00', 'Zack Wheeler', '2025', 'Partido contra Atlanta Braves'),
(720026, 144, 'Truist Park', '2025-05-27', '19:20:00', 'Spencer Strider', '2025', 'Duelo divisional contra Philadelphia Phillies'),
(720027, 145, 'Guaranteed Rate Field', '2025-05-28', '19:10:00', 'Dylan Cease', '2025', 'Serie contra Baltimore Orioles'),
(720028, 146, 'loanDepot park', '2025-05-28', '18:40:00', 'Jesús Luzardo', '2025', 'Partido contra Washington Nationals'),
(720029, 147, 'Yankee Stadium', '2025-05-29', '19:05:00', 'Gerrit Cole', '2025', 'Clásico contra Boston Red Sox'),
(720030, 158, 'American Family Field', '2025-05-29', '18:40:00', 'Freddy Peralta', '2025', 'Serie contra St. Louis Cardinals');

--
-- Volcado de datos para la tabla `estadisticas_equipos`
--

INSERT INTO `estadisticas_equipos` (`id_del_equipo`, `juegos_jugados`, `turnos_al_bate`, `carreras`, `hits`, `dobles`, `triples`, `home_runs`, `carreras_impulsadas`, `bases_por_bola`, `ponches`, `bases_robadas`, `atrapado_robando`, `promedios_al_bate`, `Promedio_de_alcanzar_base`, `promedio_de_slugging`) VALUES
(108, 39, 1279, 144, 276, 48, 5, 53, 140, 91, 377, 19, 6, 0.216, 0.274, 0.385),
(109, 41, 1375, 206, 341, 82, 7, 54, 201, 162, 312, 34, 9, 0.248, 0.331, 0.436),
(110, 39, 1271, 147, 289, 51, 6, 46, 138, 111, 343, 20, 7, 0.227, 0.296, 0.386),
(111, 42, 1459, 205, 370, 79, 6, 50, 195, 144, 378, 45, 9, 0.254, 0.326, 0.419),
(112, 41, 1430, 233, 361, 71, 9, 59, 229, 160, 335, 49, 9, 0.252, 0.330, 0.438),
(113, 42, 1411, 198, 336, 65, 3, 42, 191, 159, 380, 47, 13, 0.238, 0.321, 0.378),
(114, 40, 1300, 164, 304, 54, 2, 45, 153, 129, 315, 30, 10, 0.234, 0.306, 0.382),
(115, 40, 1321, 133, 289, 62, 11, 34, 132, 113, 389, 18, 7, 0.219, 0.286, 0.360),
(116, 41, 1387, 214, 354, 57, 7, 50, 207, 144, 364, 17, 3, 0.255, 0.330, 0.415),
(117, 39, 1297, 163, 322, 56, 5, 33, 155, 129, 309, 22, 7, 0.248, 0.322, 0.375),
(118, 42, 1399, 143, 338, 71, 6, 27, 142, 109, 294, 37, 14, 0.242, 0.300, 0.359),
(119, 41, 1395, 228, 370, 70, 9, 64, 219, 150, 348, 30, 9, 0.265, 0.339, 0.466),
(120, 41, 1360, 171, 325, 59, 6, 40, 162, 125, 328, 43, 11, 0.239, 0.309, 0.379),
(121, 41, 1375, 199, 350, 73, 11, 51, 191, 146, 309, 30, 5, 0.255, 0.334, 0.435),
(133, 41, 1408, 180, 364, 64, 6, 51, 173, 122, 307, 18, 5, 0.259, 0.318, 0.421),
(134, 41, 1355, 127, 298, 47, 6, 28, 124, 145, 353, 45, 10, 0.220, 0.301, 0.325),
(135, 39, 1301, 180, 346, 62, 4, 36, 166, 125, 265, 33, 9, 0.266, 0.332, 0.403),
(136, 39, 1322, 192, 321, 53, 2, 53, 184, 161, 334, 43, 13, 0.243, 0.333, 0.406),
(137, 41, 1356, 191, 314, 65, 5, 42, 182, 139, 353, 24, 9, 0.232, 0.306, 0.380),
(138, 41, 1395, 194, 364, 82, 1, 38, 183, 150, 314, 28, 9, 0.261, 0.338, 0.403),
(139, 40, 1331, 150, 321, 57, 3, 32, 143, 128, 341, 47, 10, 0.241, 0.308, 0.361),
(140, 41, 1333, 140, 310, 54, 4, 41, 137, 101, 321, 33, 10, 0.233, 0.291, 0.371),
(141, 40, 1350, 156, 338, 69, 1, 30, 150, 129, 296, 26, 9, 0.250, 0.320, 0.370),
(142, 41, 1354, 164, 322, 68, 5, 35, 157, 115, 335, 24, 9, 0.238, 0.306, 0.373),
(143, 40, 1367, 191, 352, 61, 6, 42, 181, 154, 321, 37, 8, 0.257, 0.336, 0.403),
(144, 40, 1353, 157, 320, 58, 5, 42, 150, 136, 341, 25, 6, 0.237, 0.310, 0.380),
(145, 41, 1318, 139, 282, 52, 1, 29, 134, 137, 352, 32, 7, 0.214, 0.291, 0.321),
(146, 39, 1336, 164, 329, 65, 4, 34, 156, 120, 340, 38, 14, 0.246, 0.312, 0.377),
(147, 40, 1363, 235, 359, 74, 6, 70, 227, 162, 358, 29, 10, 0.263, 0.348, 0.481),
(158, 41, 1354, 184, 316, 52, 4, 35, 165, 139, 326, 51, 12, 0.233, 0.311, 0.355);

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
  `carreas_impulsadas` int(11) DEFAULT 0,
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
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id_del_juego`, `id_del_equipo`, `estadio_donde_se_jugara`, `fecha_del_juego`, `hora_inicio`, `pitcher_abridor`, `temporada`, `descripcion`) VALUES
(720001, 108, 'Angel Stadium', '2025-05-15', '19:07:00', 'Reid Detmers', '2025', 'Partido de temporada regular contra Seattle Mariners'),
(720002, 109, 'Chase Field', '2025-05-15', '18:40:00', 'Zac Gallen', '2025', 'Partido interligas contra Kansas City Royals'),
(720003, 110, 'Oriole Park at Camden Yards', '2025-05-16', '19:05:00', 'Corbin Burnes', '2025', 'Serie divisional contra Boston Red Sox'),
(720004, 111, 'Fenway Park', '2025-05-16', '19:10:00', 'Brayan Bello', '2025', 'Clásico rival contra New York Yankees'),
(720005, 112, 'Wrigley Field', '2025-05-17', '13:20:00', 'Justin Steele', '2025', 'Partido de sábado por la tarde contra St. Louis Cardinals'),
(720006, 113, 'Great American Ball Park', '2025-05-17', '18:40:00', 'Hunter Greene', '2025', 'Enfrentamiento contra Los Angeles Dodgers'),
(720007, 114, 'Progressive Field', '2025-05-18', '13:10:00', 'Shane Bieber', '2025', 'Juego dominical contra Minnesota Twins'),
(720008, 115, 'Coors Field', '2025-05-18', '13:10:00', 'Kyle Freeland', '2025', 'Partido en casa contra San Francisco Giants'),
(720009, 116, 'Comerica Park', '2025-05-19', '18:40:00', 'Tarik Skubal', '2025', 'Serie contra Toronto Blue Jays'),
(720010, 117, 'Minute Maid Park', '2025-05-19', '19:10:00', 'Framber Valdez', '2025', 'Duelo texano contra Texas Rangers'),
(720011, 118, 'Kauffman Stadium', '2025-05-20', '19:10:00', 'Cole Ragans', '2025', 'Partido contra Chicago White Sox'),
(720012, 119, 'Dodger Stadium', '2025-05-20', '19:10:00', 'Yoshinobu Yamamoto', '2025', 'Serie contra Arizona Diamondbacks'),
(720013, 120, 'Nationals Park', '2025-05-21', '19:05:00', 'Josiah Gray', '2025', 'Enfrentamiento con New York Mets'),
(720014, 121, 'Citi Field', '2025-05-21', '19:10:00', 'Kodai Senga', '2025', 'Juego contra Philadelphia Phillies'),
(720015, 133, 'Oakland Coliseum', '2025-05-22', '18:40:00', 'Paul Blackburn', '2025', 'Partido contra Houston Astros'),
(720016, 134, 'PNC Park', '2025-05-22', '18:35:00', 'Mitch Keller', '2025', 'Serie contra Chicago Cubs'),
(720017, 135, 'Petco Park', '2025-05-23', '18:40:00', 'Yu Darvish', '2025', 'Duelo californiano contra Los Angeles Dodgers'),
(720018, 136, 'T-Mobile Park', '2025-05-23', '19:10:00', 'Luis Castillo', '2025', 'Partido contra Oakland Athletics'),
(720019, 137, 'Oracle Park', '2025-05-24', '13:05:00', 'Logan Webb', '2025', 'Juego de día contra Colorado Rockies'),
(720020, 138, 'Busch Stadium', '2025-05-24', '18:15:00', 'Sonny Gray', '2025', 'Rivalidad histórica contra Chicago Cubs'),
(720021, 139, 'Tropicana Field', '2025-05-25', '13:10:00', 'Zach Eflin', '2025', 'Partido contra Kansas City Royals'),
(720022, 140, 'Globe Life Field', '2025-05-25', '13:35:00', 'Nathan Eovaldi', '2025', 'Serie contra Houston Astros'),
(720023, 141, 'Rogers Centre', '2025-05-26', '15:07:00', 'Kevin Gausman', '2025', 'Juego feriado contra Detroit Tigers'),
(720024, 142, 'Target Field', '2025-05-26', '13:10:00', 'Pablo López', '2025', 'Enfrentamiento con Cleveland Guardians'),
(720025, 143, 'Citizens Bank Park', '2025-05-27', '18:40:00', 'Zack Wheeler', '2025', 'Partido contra Atlanta Braves'),
(720026, 144, 'Truist Park', '2025-05-27', '19:20:00', 'Spencer Strider', '2025', 'Duelo divisional contra Philadelphia Phillies'),
(720027, 145, 'Guaranteed Rate Field', '2025-05-28', '19:10:00', 'Dylan Cease', '2025', 'Serie contra Baltimore Orioles'),
(720028, 146, 'loanDepot park', '2025-05-28', '18:40:00', 'Jesús Luzardo', '2025', 'Partido contra Washington Nationals'),
(720029, 147, 'Yankee Stadium', '2025-05-29', '19:05:00', 'Gerrit Cole', '2025', 'Clásico contra Boston Red Sox'),
(720030, 158, 'American Family Field', '2025-05-29', '18:40:00', 'Freddy Peralta', '2025', 'Serie contra St. Louis Cardinals');

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

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id_del_juego`, `id_del_equipo`, `estadio_donde_se_jugara`, `fecha_del_juego`, `hora_inicio`, `pitcher_abridor`, `temporada`, `descripcion`) VALUES
(720001, 108, 'Angel Stadium', '2025-05-15', '19:07:00', 'Reid Detmers', '2025', 'Partido de temporada regular contra Seattle Mariners'),
(720002, 109, 'Chase Field', '2025-05-15', '18:40:00', 'Zac Gallen', '2025', 'Partido interligas contra Kansas City Royals'),
(720003, 110, 'Oriole Park at Camden Yards', '2025-05-16', '19:05:00', 'Corbin Burnes', '2025', 'Serie divisional contra Boston Red Sox'),
(720004, 111, 'Fenway Park', '2025-05-16', '19:10:00', 'Brayan Bello', '2025', 'Clásico rival contra New York Yankees'),
(720005, 112, 'Wrigley Field', '2025-05-17', '13:20:00', 'Justin Steele', '2025', 'Partido de sábado por la tarde contra St. Louis Cardinals'),
(720006, 113, 'Great American Ball Park', '2025-05-17', '18:40:00', 'Hunter Greene', '2025', 'Enfrentamiento contra Los Angeles Dodgers'),
(720007, 114, 'Progressive Field', '2025-05-18', '13:10:00', 'Shane Bieber', '2025', 'Juego dominical contra Minnesota Twins'),
(720008, 115, 'Coors Field', '2025-05-18', '13:10:00', 'Kyle Freeland', '2025', 'Partido en casa contra San Francisco Giants'),
(720009, 116, 'Comerica Park', '2025-05-19', '18:40:00', 'Tarik Skubal', '2025', 'Serie contra Toronto Blue Jays'),
(720010, 117, 'Minute Maid Park', '2025-05-19', '19:10:00', 'Framber Valdez', '2025', 'Duelo texano contra Texas Rangers'),
(720011, 118, 'Kauffman Stadium', '2025-05-20', '19:10:00', 'Cole Ragans', '2025', 'Partido contra Chicago White Sox'),
(720012, 119, 'Dodger Stadium', '2025-05-20', '19:10:00', 'Yoshinobu Yamamoto', '2025', 'Serie contra Arizona Diamondbacks'),
(720013, 120, 'Nationals Park', '2025-05-21', '19:05:00', 'Josiah Gray', '2025', 'Enfrentamiento con New York Mets'),
(720014, 121, 'Citi Field', '2025-05-21', '19:10:00', 'Kodai Senga', '2025', 'Juego contra Philadelphia Phillies'),
(720015, 133, 'Oakland Coliseum', '2025-05-22', '18:40:00', 'Paul Blackburn', '2025', 'Partido contra Houston Astros'),
(720016, 134, 'PNC Park', '2025-05-22', '18:35:00', 'Mitch Keller', '2025', 'Serie contra Chicago Cubs'),
(720017, 135, 'Petco Park', '2025-05-23', '18:40:00', 'Yu Darvish', '2025', 'Duelo californiano contra Los Angeles Dodgers'),
(720018, 136, 'T-Mobile Park', '2025-05-23', '19:10:00', 'Luis Castillo', '2025', 'Partido contra Oakland Athletics'),
(720019, 137, 'Oracle Park', '2025-05-24', '13:05:00', 'Logan Webb', '2025', 'Juego de día contra Colorado Rockies'),
(720020, 138, 'Busch Stadium', '2025-05-24', '18:15:00', 'Sonny Gray', '2025', 'Rivalidad histórica contra Chicago Cubs'),
(720021, 139, 'Tropicana Field', '2025-05-25', '13:10:00', 'Zach Eflin', '2025', 'Partido contra Kansas City Royals'),
(720022, 140, 'Globe Life Field', '2025-05-25', '13:35:00', 'Nathan Eovaldi', '2025', 'Serie contra Houston Astros'),
(720023, 141, 'Rogers Centre', '2025-05-26', '15:07:00', 'Kevin Gausman', '2025', 'Juego feriado contra Detroit Tigers'),
(720024, 142, 'Target Field', '2025-05-26', '13:10:00', 'Pablo López', '2025', 'Enfrentamiento con Cleveland Guardians'),
(720025, 143, 'Citizens Bank Park', '2025-05-27', '18:40:00', 'Zack Wheeler', '2025', 'Partido contra Atlanta Braves'),
(720026, 144, 'Truist Park', '2025-05-27', '19:20:00', 'Spencer Strider', '2025', 'Duelo divisional contra Philadelphia Phillies'),
(720027, 145, 'Guaranteed Rate Field', '2025-05-28', '19:10:00', 'Dylan Cease', '2025', 'Serie contra Baltimore Orioles'),
(720028, 146, 'loanDepot park', '2025-05-28', '18:40:00', 'Jesús Luzardo', '2025', 'Partido contra Washington Nationals'),
(720029, 147, 'Yankee Stadium', '2025-05-29', '19:05:00', 'Gerrit Cole', '2025', 'Clásico contra Boston Red Sox'),
(720030, 158, 'American Family Field', '2025-05-29', '18:40:00', 'Freddy Peralta', '2025', 'Serie contra St. Louis Cardinals');

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

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id_del_juego`, `id_del_equipo`, `estadio_donde_se_jugara`, `fecha_del_juego`, `hora_inicio`, `pitcher_abridor`, `temporada`, `descripcion`) VALUES
(720001, 108, 'Angel Stadium', '2025-05-15', '19:07:00', 'Reid Detmers', '2025', 'Partido de temporada regular contra Seattle Mariners'),
(720002, 109, 'Chase Field', '2025-05-15', '18:40:00', 'Zac Gallen', '2025', 'Partido interligas contra Kansas City Royals'),
(720003, 110, 'Oriole Park at Camden Yards', '2025-05-16', '19:05:00', 'Corbin Burnes', '2025', 'Serie divisional contra Boston Red Sox'),
(720004, 111, 'Fenway Park', '2025-05-16', '19:10:00', 'Brayan Bello', '2025', 'Clásico rival contra New York Yankees'),
(720005, 112, 'Wrigley Field', '2025-05-17', '13:20:00', 'Justin Steele', '2025', 'Partido de sábado por la tarde contra St. Louis Cardinals'),
(720006, 113, 'Great American Ball Park', '2025-05-17', '18:40:00', 'Hunter Greene', '2025', 'Enfrentamiento contra Los Angeles Dodgers'),
(720007, 114, 'Progressive Field', '2025-05-18', '13:10:00', 'Shane Bieber', '2025', 'Juego dominical contra Minnesota Twins'),
(720008, 115, 'Coors Field', '2025-05-18', '13:10:00', 'Kyle Freeland', '2025', 'Partido en casa contra San Francisco Giants'),
(720009, 116, 'Comerica Park', '2025-05-19', '18:40:00', 'Tarik Skubal', '2025', 'Serie contra Toronto Blue Jays'),
(720010, 117, 'Minute Maid Park', '2025-05-19', '19:10:00', 'Framber Valdez', '2025', 'Duelo texano contra Texas Rangers'),
(720011, 118, 'Kauffman Stadium', '2025-05-20', '19:10:00', 'Cole Ragans', '2025', 'Partido contra Chicago White Sox'),
(720012, 119, 'Dodger Stadium', '2025-05-20', '19:10:00', 'Yoshinobu Yamamoto', '2025', 'Serie contra Arizona Diamondbacks'),
(720013, 120, 'Nationals Park', '2025-05-21', '19:05:00', 'Josiah Gray', '2025', 'Enfrentamiento con New York Mets'),
(720014, 121, 'Citi Field', '2025-05-21', '19:10:00', 'Kodai Senga', '2025', 'Juego contra Philadelphia Phillies'),
(720015, 133, 'Oakland Coliseum', '2025-05-22', '18:40:00', 'Paul Blackburn', '2025', 'Partido contra Houston Astros'),
(720016, 134, 'PNC Park', '2025-05-22', '18:35:00', 'Mitch Keller', '2025', 'Serie contra Chicago Cubs'),
(720017, 135, 'Petco Park', '2025-05-23', '18:40:00', 'Yu Darvish', '2025', 'Duelo californiano contra Los Angeles Dodgers'),
(720018, 136, 'T-Mobile Park', '2025-05-23', '19:10:00', 'Luis Castillo', '2025', 'Partido contra Oakland Athletics'),
(720019, 137, 'Oracle Park', '2025-05-24', '13:05:00', 'Logan Webb', '2025', 'Juego de día contra Colorado Rockies'),
(720020, 138, 'Busch Stadium', '2025-05-24', '18:15:00', 'Sonny Gray', '2025', 'Rivalidad histórica contra Chicago Cubs'),
(720021, 139, 'Tropicana Field', '2025-05-25', '13:10:00', 'Zach Eflin', '2025', 'Partido contra Kansas City Royals'),
(720022, 140, 'Globe Life Field', '2025-05-25', '13:35:00', 'Nathan Eovaldi', '2025', 'Serie contra Houston Astros'),
(720023, 141, 'Rogers Centre', '2025-05-26', '15:07:00', 'Kevin Gausman', '2025', 'Juego feriado contra Detroit Tigers'),
(720024, 142, 'Target Field', '2025-05-26', '13:10:00', 'Pablo López', '2025', 'Enfrentamiento con Cleveland Guardians'),
(720025, 143, 'Citizens Bank Park', '2025-05-27', '18:40:00', 'Zack Wheeler', '2025', 'Partido contra Atlanta Braves'),
(720026, 144, 'Truist Park', '2025-05-27', '19:20:00', 'Spencer Strider', '2025', 'Duelo divisional contra Philadelphia Phillies'),
(720027, 145, 'Guaranteed Rate Field', '2025-05-28', '19:10:00', 'Dylan Cease', '2025', 'Serie contra Baltimore Orioles'),
(720028, 146, 'loanDepot park', '2025-05-28', '18:40:00', 'Jesús Luzardo', '2025', 'Partido contra Washington Nationals'),
(720029, 147, 'Yankee Stadium', '2025-05-29', '19:05:00', 'Gerrit Cole', '2025', 'Clásico contra Boston Red Sox'),
(720030, 158, 'American Family Field', '2025-05-29', '18:40:00', 'Freddy Peralta', '2025', 'Serie contra St. Louis Cardinals');

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
  `lugar_de_nacimiento` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id_del_juego`, `id_del_equipo`, `estadio_donde_se_jugara`, `fecha_del_juego`, `hora_inicio`, `pitcher_abridor`, `temporada`, `descripcion`) VALUES
(720001, 108, 'Angel Stadium', '2025-05-15', '19:07:00', 'Reid Detmers', '2025', 'Partido de temporada regular contra Seattle Mariners'),
(720002, 109, 'Chase Field', '2025-05-15', '18:40:00', 'Zac Gallen', '2025', 'Partido interligas contra Kansas City Royals'),
(720003, 110, 'Oriole Park at Camden Yards', '2025-05-16', '19:05:00', 'Corbin Burnes', '2025', 'Serie divisional contra Boston Red Sox'),
(720004, 111, 'Fenway Park', '2025-05-16', '19:10:00', 'Brayan Bello', '2025', 'Clásico rival contra New York Yankees'),
(720005, 112, 'Wrigley Field', '2025-05-17', '13:20:00', 'Justin Steele', '2025', 'Partido de sábado por la tarde contra St. Louis Cardinals'),
(720006, 113, 'Great American Ball Park', '2025-05-17', '18:40:00', 'Hunter Greene', '2025', 'Enfrentamiento contra Los Angeles Dodgers'),
(720007, 114, 'Progressive Field', '2025-05-18', '13:10:00', 'Shane Bieber', '2025', 'Juego dominical contra Minnesota Twins'),
(720008, 115, 'Coors Field', '2025-05-18', '13:10:00', 'Kyle Freeland', '2025', 'Partido en casa contra San Francisco Giants'),
(720009, 116, 'Comerica Park', '2025-05-19', '18:40:00', 'Tarik Skubal', '2025', 'Serie contra Toronto Blue Jays'),
(720010, 117, 'Minute Maid Park', '2025-05-19', '19:10:00', 'Framber Valdez', '2025', 'Duelo texano contra Texas Rangers'),
(720011, 118, 'Kauffman Stadium', '2025-05-20', '19:10:00', 'Cole Ragans', '2025', 'Partido contra Chicago White Sox'),
(720012, 119, 'Dodger Stadium', '2025-05-20', '19:10:00', 'Yoshinobu Yamamoto', '2025', 'Serie contra Arizona Diamondbacks'),
(720013, 120, 'Nationals Park', '2025-05-21', '19:05:00', 'Josiah Gray', '2025', 'Enfrentamiento con New York Mets'),
(720014, 121, 'Citi Field', '2025-05-21', '19:10:00', 'Kodai Senga', '2025', 'Juego contra Philadelphia Phillies'),
(720015, 133, 'Oakland Coliseum', '2025-05-22', '18:40:00', 'Paul Blackburn', '2025', 'Partido contra Houston Astros'),
(720016, 134, 'PNC Park', '2025-05-22', '18:35:00', 'Mitch Keller', '2025', 'Serie contra Chicago Cubs'),
(720017, 135, 'Petco Park', '2025-05-23', '18:40:00', 'Yu Darvish', '2025', 'Duelo californiano contra Los Angeles Dodgers'),
(720018, 136, 'T-Mobile Park', '2025-05-23', '19:10:00', 'Luis Castillo', '2025', 'Partido contra Oakland Athletics'),
(720019, 137, 'Oracle Park', '2025-05-24', '13:05:00', 'Logan Webb', '2025', 'Juego de día contra Colorado Rockies'),
(720020, 138, 'Busch Stadium', '2025-05-24', '18:15:00', 'Sonny Gray', '2025', 'Rivalidad histórica contra Chicago Cubs'),
(720021, 139, 'Tropicana Field', '2025-05-25', '13:10:00', 'Zach Eflin', '2025', 'Partido contra Kansas City Royals'),
(720022, 140, 'Globe Life Field', '2025-05-25', '13:35:00', 'Nathan Eovaldi', '2025', 'Serie contra Houston Astros'),
(720023, 141, 'Rogers Centre', '2025-05-26', '15:07:00', 'Kevin Gausman', '2025', 'Juego feriado contra Detroit Tigers'),
(720024, 142, 'Target Field', '2025-05-26', '13:10:00', 'Pablo López', '2025', 'Enfrentamiento con Cleveland Guardians'),
(720025, 143, 'Citizens Bank Park', '2025-05-27', '18:40:00', 'Zack Wheeler', '2025', 'Partido contra Atlanta Braves'),
(720026, 144, 'Truist Park', '2025-05-27', '19:20:00', 'Spencer Strider', '2025', 'Duelo divisional contra Philadelphia Phillies'),
(720027, 145, 'Guaranteed Rate Field', '2025-05-28', '19:10:00', 'Dylan Cease', '2025', 'Serie contra Baltimore Orioles'),
(720028, 146, 'loanDepot park', '2025-05-28', '18:40:00', 'Jesús Luzardo', '2025', 'Partido contra Washington Nationals'),
(720029, 147, 'Yankee Stadium', '2025-05-29', '19:05:00', 'Gerrit Cole', '2025', 'Clásico contra Boston Red Sox'),
(720030, 158, 'American Family Field', '2025-05-29', '18:40:00', 'Freddy Peralta', '2025', 'Serie contra St. Louis Cardinals');

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
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id_del_juego`, `id_del_equipo`, `estadio_donde_se_jugara`, `fecha_del_juego`, `hora_inicio`, `pitcher_abridor`, `temporada`, `descripcion`) VALUES
(720001, 108, 'Angel Stadium', '2025-05-15', '19:07:00', 'Reid Detmers', '2025', 'Partido de temporada regular contra Seattle Mariners'),
(720002, 109, 'Chase Field', '2025-05-15', '18:40:00', 'Zac Gallen', '2025', 'Partido interligas contra Kansas City Royals'),
(720003, 110, 'Oriole Park at Camden Yards', '2025-05-16', '19:05:00', 'Corbin Burnes', '2025', 'Serie divisional contra Boston Red Sox'),
(720004, 111, 'Fenway Park', '2025-05-16', '19:10:00', 'Brayan Bello', '2025', 'Clásico rival contra New York Yankees'),
(720005, 112, 'Wrigley Field', '2025-05-17', '13:20:00', 'Justin Steele', '2025', 'Partido de sábado por la tarde contra St. Louis Cardinals'),
(720006, 113, 'Great American Ball Park', '2025-05-17', '18:40:00', 'Hunter Greene', '2025', 'Enfrentamiento contra Los Angeles Dodgers'),
(720007, 114, 'Progressive Field', '2025-05-18', '13:10:00', 'Shane Bieber', '2025', 'Juego dominical contra Minnesota Twins'),
(720008, 115, 'Coors Field', '2025-05-18', '13:10:00', 'Kyle Freeland', '2025', 'Partido en casa contra San Francisco Giants'),
(720009, 116, 'Comerica Park', '2025-05-19', '18:40:00', 'Tarik Skubal', '2025', 'Serie contra Toronto Blue Jays'),
(720010, 117, 'Minute Maid Park', '2025-05-19', '19:10:00', 'Framber Valdez', '2025', 'Duelo texano contra Texas Rangers'),
(720011, 118, 'Kauffman Stadium', '2025-05-20', '19:10:00', 'Cole Ragans', '2025', 'Partido contra Chicago White Sox'),
(720012, 119, 'Dodger Stadium', '2025-05-20', '19:10:00', 'Yoshinobu Yamamoto', '2025', 'Serie contra Arizona Diamondbacks'),
(720013, 120, 'Nationals Park', '2025-05-21', '19:05:00', 'Josiah Gray', '2025', 'Enfrentamiento con New York Mets'),
(720014, 121, 'Citi Field', '2025-05-21', '19:10:00', 'Kodai Senga', '2025', 'Juego contra Philadelphia Phillies'),
(720015, 133, 'Oakland Coliseum', '2025-05-22', '18:40:00', 'Paul Blackburn', '2025', 'Partido contra Houston Astros'),
(720016, 134, 'PNC Park', '2025-05-22', '18:35:00', 'Mitch Keller', '2025', 'Serie contra Chicago Cubs'),
(720017, 135, 'Petco Park', '2025-05-23', '18:40:00', 'Yu Darvish', '2025', 'Duelo californiano contra Los Angeles Dodgers'),
(720018, 136, 'T-Mobile Park', '2025-05-23', '19:10:00', 'Luis Castillo', '2025', 'Partido contra Oakland Athletics'),
(720019, 137, 'Oracle Park', '2025-05-24', '13:05:00', 'Logan Webb', '2025', 'Juego de día contra Colorado Rockies'),
(720020, 138, 'Busch Stadium', '2025-05-24', '18:15:00', 'Sonny Gray', '2025', 'Rivalidad histórica contra Chicago Cubs'),
(720021, 139, 'Tropicana Field', '2025-05-25', '13:10:00', 'Zach Eflin', '2025', 'Partido contra Kansas City Royals'),
(720022, 140, 'Globe Life Field', '2025-05-25', '13:35:00', 'Nathan Eovaldi', '2025', 'Serie contra Houston Astros'),
(720023, 141, 'Rogers Centre', '2025-05-26', '15:07:00', 'Kevin Gausman', '2025', 'Juego feriado contra Detroit Tigers'),
(720024, 142, 'Target Field', '2025-05-26', '13:10:00', 'Pablo López', '2025', 'Enfrentamiento con Cleveland Guardians'),
(720025, 143, 'Citizens Bank Park', '2025-05-27', '18:40:00', 'Zack Wheeler', '2025', 'Partido contra Atlanta Braves'),
(720026, 144, 'Truist Park', '2025-05-27', '19:20:00', 'Spencer Strider', '2025', 'Duelo divisional contra Philadelphia Phillies'),
(720027, 145, 'Guaranteed Rate Field', '2025-05-28', '19:10:00', 'Dylan Cease', '2025', 'Serie contra Baltimore Orioles'),
(720028, 146, 'loanDepot park', '2025-05-28', '18:40:00', 'Jesús Luzardo', '2025', 'Partido contra Washington Nationals'),
(720029, 147, 'Yankee Stadium', '2025-05-29', '19:05:00', 'Gerrit Cole', '2025', 'Clásico contra Boston Red Sox'),
(720030, 158, 'American Family Field', '2025-05-29', '18:40:00', 'Freddy Peralta', '2025', 'Serie contra St. Louis Cardinals');

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
  MODIFY `id_del_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de la tabla `estadisticas_jugadores`
--
ALTER TABLE `estadisticas_jugadores`
  MODIFY `id_estadistica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT de la tabla `historial_juegos`
--
ALTER TABLE `historial_juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id_del_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=719328;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id_del_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=833661;

--
-- AUTO_INCREMENT de la tabla `ligas`
--
ALTER TABLE `ligas`
  MODIFY `id_de_la_liga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
