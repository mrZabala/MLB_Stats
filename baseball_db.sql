-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 07:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baseball_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipos`
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
-- Dumping data for table `equipos`
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
-- Table structure for table `estadisticas_equipos`
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
-- Dumping data for table `estadisticas_equipos`
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
-- Table structure for table `estadisticas_jugadores`
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
-- Dumping data for table `estadisticas_jugadores`
--

INSERT INTO `estadisticas_jugadores` (`id_estadistica`, `id_del_jugador`, `juegos_jugados`, `turnos_al_bate`, `carreras`, `hits`, `total_de_bases`, `dobles`, `triples`, `home_runs`, `carreas_impulsadas`, `bases_por_bola`, `pase_internacional`, `ponches`, `bases_robadas`, `atrapado_robando_base`, `promedio_de_bateo`, `promedio_de_enbasase`, `promedio_de_slugging`, `rollings_y_flyout`) VALUES
(267, 833853, 145, 550, 120, 165, 350, 28, 3, 52, 110, 95, 2, 125, 15, 3, 0.300, 0.415, 0.636, 260),
(268, 833854, 140, 520, 105, 170, 320, 30, 5, 35, 95, 80, 1, 110, 20, 5, 0.327, 0.410, 0.615, 240),
(269, 833855, 150, 560, 115, 175, 330, 35, 2, 40, 100, 110, 0, 120, 25, 6, 0.313, 0.425, 0.589, 265),
(270, 833856, 142, 530, 95, 160, 310, 32, 8, 34, 90, 65, 0, 130, 30, 8, 0.302, 0.375, 0.585, 240),
(271, 833857, 155, 580, 110, 190, 340, 40, 5, 30, 85, 75, 1, 100, 25, 5, 0.328, 0.405, 0.586, 290),
(272, 833858, 148, 550, 90, 180, 320, 35, 0, 35, 105, 70, 0, 110, 5, 2, 0.327, 0.395, 0.582, 260),
(273, 833859, 140, 520, 115, 165, 330, 25, 10, 40, 95, 60, 0, 125, 45, 10, 0.317, 0.380, 0.635, 230),
(274, 833860, 135, 500, 95, 155, 310, 30, 3, 40, 100, 80, 1, 110, 15, 5, 0.310, 0.395, 0.620, 235),
(275, 833861, 155, 580, 85, 190, 320, 45, 3, 25, 105, 90, 0, 95, 3, 1, 0.328, 0.415, 0.552, 295),
(276, 833862, 150, 560, 100, 175, 310, 35, 8, 28, 95, 75, 0, 90, 25, 6, 0.313, 0.385, 0.554, 295),
(277, 833863, 148, 550, 105, 165, 300, 30, 5, 30, 85, 60, 0, 125, 35, 8, 0.300, 0.360, 0.545, 260),
(278, 833864, 145, 540, 95, 155, 290, 25, 3, 35, 90, 65, 1, 135, 30, 7, 0.287, 0.350, 0.537, 250),
(279, 833865, 155, 580, 115, 180, 370, 35, 3, 45, 120, 100, 0, 140, 15, 3, 0.310, 0.410, 0.638, 260),
(280, 833866, 150, 560, 105, 170, 310, 30, 8, 30, 95, 75, 0, 110, 25, 6, 0.304, 0.385, 0.554, 280),
(281, 833867, 140, 520, 85, 145, 290, 25, 5, 35, 90, 55, 0, 150, 20, 5, 0.279, 0.335, 0.558, 225),
(282, 833868, 148, 550, 100, 165, 340, 30, 0, 45, 115, 80, 1, 135, 5, 2, 0.300, 0.375, 0.618, 250),
(283, 833869, 32, 65, 0, 8, 8, 0, 0, 0, 0, 3, 0, 40, 0, 0, 0.123, 0.162, 0.123, 25),
(284, 833870, 30, 60, 2, 10, 10, 0, 0, 0, 2, 0, 0, 35, 0, 0, 0.167, 0.167, 0.167, 25),
(285, 833871, 28, 50, 0, 5, 5, 0, 0, 0, 0, 3, 0, 30, 0, 0, 0.100, 0.151, 0.100, 20),
(286, 833872, 145, 540, 95, 155, 290, 28, 3, 35, 105, 65, 0, 130, 25, 6, 0.287, 0.345, 0.537, 255),
(287, 833873, 140, 520, 85, 145, 260, 30, 0, 25, 85, 75, 0, 110, 10, 3, 0.279, 0.355, 0.500, 265),
(288, 833874, 135, 500, 95, 140, 250, 25, 5, 20, 75, 65, 0, 120, 20, 5, 0.280, 0.345, 0.500, 240),
(289, 833875, 25, 55, 0, 7, 7, 0, 0, 0, 2, 0, 0, 30, 0, 0, 0.127, 0.127, 0.127, 25),
(290, 833876, 155, 580, 100, 165, 280, 35, 3, 20, 85, 80, 0, 110, 20, 4, 0.284, 0.365, 0.483, 305),
(291, 833877, 148, 550, 105, 175, 330, 30, 5, 35, 105, 75, 0, 115, 15, 5, 0.318, 0.385, 0.600, 260),
(292, 833878, 150, 560, 95, 155, 320, 25, 0, 45, 120, 65, 1, 150, 3, 0, 0.277, 0.335, 0.571, 255),
(293, 833879, 155, 580, 115, 180, 290, 35, 8, 15, 75, 60, 0, 90, 35, 8, 0.310, 0.370, 0.500, 310),
(294, 833880, 148, 550, 105, 175, 260, 30, 3, 15, 65, 65, 0, 75, 30, 7, 0.318, 0.380, 0.473, 310),
(295, 833881, 150, 560, 95, 165, 330, 35, 0, 40, 115, 80, 0, 130, 5, 2, 0.295, 0.365, 0.589, 265),
(296, 833882, 145, 540, 85, 145, 280, 30, 3, 30, 90, 55, 0, 140, 10, 3, 0.269, 0.320, 0.519, 255),
(297, 833883, 28, 60, 2, 7, 7, 0, 0, 0, 0, 3, 0, 35, 0, 0, 0.117, 0.159, 0.117, 25),
(298, 833884, 135, 500, 100, 140, 260, 25, 8, 20, 75, 45, 0, 135, 45, 12, 0.280, 0.325, 0.520, 225),
(299, 833885, 115, 420, 70, 105, 220, 20, 5, 25, 65, 35, 0, 150, 25, 8, 0.250, 0.300, 0.524, 165),
(300, 833886, 148, 550, 95, 165, 280, 35, 5, 20, 85, 75, 0, 110, 15, 5, 0.300, 0.370, 0.509, 275),
(301, 833887, 25, 50, 0, 5, 5, 0, 0, 0, 0, 0, 0, 28, 0, 0, 0.100, 0.100, 0.100, 22),
(302, 833888, 135, 500, 95, 140, 260, 22, 8, 25, 75, 55, 0, 135, 35, 8, 0.280, 0.335, 0.520, 225),
(303, 833889, 140, 520, 100, 145, 240, 25, 5, 15, 65, 65, 0, 120, 30, 7, 0.279, 0.345, 0.462, 255),
(304, 833890, 148, 550, 115, 175, 290, 30, 8, 20, 85, 75, 0, 105, 45, 10, 0.318, 0.385, 0.527, 270),
(305, 833891, 22, 40, 0, 4, 4, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0.100, 0.100, 0.100, 15),
(306, 833892, 145, 540, 95, 155, 260, 28, 0, 25, 90, 65, 0, 110, 15, 5, 0.287, 0.345, 0.481, 275),
(307, 833893, 148, 550, 100, 165, 290, 30, 5, 25, 95, 75, 0, 120, 25, 6, 0.300, 0.365, 0.527, 265),
(308, 833894, 140, 520, 85, 140, 240, 25, 3, 20, 85, 55, 0, 130, 20, 5, 0.269, 0.320, 0.462, 250),
(309, 833895, 150, 560, 105, 175, 330, 35, 3, 35, 105, 80, 0, 110, 30, 8, 0.313, 0.380, 0.589, 275),
(310, 833896, 145, 540, 95, 145, 260, 28, 0, 25, 90, 65, 0, 120, 15, 4, 0.269, 0.335, 0.481, 275),
(311, 833897, 135, 500, 85, 140, 240, 25, 3, 20, 75, 55, 0, 135, 25, 6, 0.280, 0.335, 0.480, 225),
(312, 833898, 148, 550, 100, 165, 290, 30, 5, 25, 95, 75, 0, 110, 20, 5, 0.300, 0.365, 0.527, 275),
(313, 833899, 140, 520, 95, 145, 260, 25, 3, 25, 85, 65, 0, 120, 22, 6, 0.279, 0.345, 0.500, 255),
(314, 833900, 150, 560, 105, 175, 310, 35, 0, 30, 105, 80, 0, 105, 15, 4, 0.313, 0.380, 0.554, 280);

-- --------------------------------------------------------

--
-- Table structure for table `historial_juegos`
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
-- Table structure for table `juegos`
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
-- Dumping data for table `juegos`
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
-- Table structure for table `jugadores`
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
  `lugar_de_nacimiento` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jugadores`
--

INSERT INTO `jugadores` (`id_del_jugador`, `nombre_del_jugador`, `edad_del_jugador`, `numero_del_jugador`, `id_del_equipo`, `id_de_la_liga`, `debut_del_jugador`, `genero_del_jugador`, `estatura_de_jugador`, `peso_del_jugador`, `fecha_nacimiento`, `posicion_del_jugador`, `mano_dominante_del_jugador`, `apodo_del_jugador`, `año_draft`, `lugar_de_nacimiento`) VALUES
(833853, 'Aaron Judge', 32, 99, 147, 1, '2016-08-13', 'M', 201.00, 128.00, '1992-04-26', 'OF', 'Derecho', 'The Judge', '2013', 'Estados Unidos'),
(833854, 'Shohei Ohtani', 30, 17, 119, 1, '2018-03-29', 'M', 193.00, 95.00, '1994-07-05', 'P/DH', 'Izquierdo', 'Showtime', '2018', 'Japon'),
(833855, 'Juan Soto', 26, 22, 120, 1, '2018-05-20', 'M', 188.00, 102.00, '1998-10-25', 'OF', 'Izquierdo', 'Childish Bambino', '2015', 'Republica Dominicana'),
(833856, 'Fernando Tatís Jr.', 25, 23, 135, 1, '2019-03-28', 'M', 191.00, 95.00, '1999-01-02', 'SS/OF', 'Derecho', 'El Niño', '2016', 'Republica Dominicana'),
(833857, 'Mookie Betts', 32, 50, 119, 1, '2014-06-29', 'M', 175.00, 82.00, '1992-10-07', 'OF/2B', 'Derecho', 'Cookie', '2011', 'Estados Unidos'),
(833858, 'Vladimir Guerrero Jr.', 26, 27, 141, 1, '2019-04-26', 'M', 188.00, 111.00, '1999-03-16', '1B', 'Derecho', 'Vladito', '2015', 'Republica Dominicana'),
(833859, 'Ronald Acuña Jr.', 26, 13, 144, 1, '2018-04-25', 'M', 183.00, 93.00, '1997-12-18', 'OF', 'Derecho', 'El Abusador', '2015', 'Venezuela'),
(833860, 'Mike Trout', 33, 27, 108, 1, '2011-07-08', 'M', 188.00, 106.00, '1991-08-07', 'OF', 'Derecho', 'The Millville Meteor', '2009', 'Estados Unidos'),
(833861, 'Freddie Freeman', 34, 5, 119, 1, '2010-09-01', 'M', 196.00, 102.00, '1989-09-12', '1B', 'Izquierdo', 'Free', '2007', 'Estados Unidos'),
(833862, 'José Ramírez', 31, 11, 114, 1, '2013-09-01', 'M', 175.00, 86.00, '1992-09-17', '3B', 'Ambidiestro', 'Enriquito', '2009', 'Republica Dominicana'),
(833863, 'Bobby Witt Jr.', 24, 7, 118, 1, '2022-04-07', 'M', 183.00, 90.00, '2000-06-14', 'SS', 'Derecho', 'B-Dub', '2019', 'Estados Unidos'),
(833864, 'Julio Rodríguez', 23, 44, 136, 1, '2022-04-08', 'M', 191.00, 97.00, '2000-12-29', 'OF', 'Derecho', 'J-Rod', '2017', 'Republica Dominicana'),
(833865, 'Bryce Harper', 31, 3, 143, 1, '2012-04-28', 'M', 191.00, 98.00, '1992-10-16', '1B/OF', 'Izquierdo', 'Bam Bam', '2010', 'Estados Unidos'),
(833866, 'Francisco Lindor', 30, 12, 121, 1, '2015-06-14', 'M', 178.00, 86.00, '1993-11-14', 'SS', 'Ambidiestro', 'Mr. Smile', '2011', 'Puerto Rico'),
(833867, 'Luis Robert Jr.', 26, 88, 145, 1, '2020-07-24', 'M', 190.00, 98.00, '1997-08-03', 'OF', 'Derecho', 'La Pantera', '2017', 'Cuba'),
(833868, 'Yordan Álvarez', 27, 44, 117, 1, '2019-06-09', 'M', 196.00, 102.00, '1997-06-27', 'OF/DH', 'Izquierdo', 'Air Yordan', '2016', 'Cuba'),
(833869, 'Gerrit Cole', 33, 45, 147, 1, '2013-06-11', 'M', 193.00, 99.00, '1990-09-08', 'P', 'Derecho', 'Cole Train', '2011', 'Estados Unidos'),
(833870, 'Corbin Burnes', 29, 39, 110, 1, '2018-07-10', 'M', 191.00, 93.00, '1994-10-22', 'P', 'Derecho', 'Burnesy', '2016', 'Estados Unidos'),
(833871, 'Zack Wheeler', 34, 45, 143, 1, '2013-06-18', 'M', 193.00, 97.00, '1990-05-30', 'P', 'Derecho', 'Wheels', '2009', 'Estados Unidos'),
(833872, 'Kyle Tucker', 27, 30, 117, 1, '2018-07-07', 'M', 193.00, 88.00, '1997-01-17', 'OF', 'Izquierdo', 'King Tuck', '2015', 'Estados Unidos'),
(833873, 'Adley Rutschman', 26, 35, 110, 1, '2022-05-21', 'M', 188.00, 100.00, '1998-02-06', 'C', 'Ambidiestro', 'Clutchman', '2019', 'Estados Unidos'),
(833874, 'Gunnar Henderson', 22, 2, 110, 1, '2022-08-31', 'M', 191.00, 96.00, '2001-06-29', 'SS/3B', 'Izquierdo', 'G-Money', '2019', 'Estados Unidos'),
(833875, 'Zac Gallen', 28, 23, 109, 1, '2019-06-20', 'M', 188.00, 86.00, '1995-08-03', 'P', 'Derecho', 'Milk Man', '2016', 'Estados Unidos'),
(833876, 'Marcus Semien', 34, 2, 140, 1, '2013-09-04', 'M', 183.00, 88.00, '1990-09-17', '2B', 'Derecho', 'Semi', '2011', 'Estados Unidos'),
(833877, 'Corey Seager', 30, 5, 140, 1, '2015-09-03', 'M', 193.00, 97.00, '1994-04-27', 'SS', 'Izquierdo', 'Seags', '2012', 'Estados Unidos'),
(833878, 'Pete Alonso', 29, 20, 121, 1, '2019-03-28', 'M', 191.00, 111.00, '1994-12-07', '1B', 'Derecho', 'Polar Bear', '2016', '1'),
(833879, 'Ozzie Albies', 27, 1, 144, 1, '2017-08-01', 'M', 173.00, 75.00, '1997-01-07', '2B', 'Ambidiestro', 'Wizard of Oz', '2013', '5'),
(833880, 'José Altuve', 34, 27, 117, 1, '2011-07-20', 'M', 168.00, 73.00, '1990-05-06', '2B', 'Derecho', 'Little Giant', '2006', '4'),
(833881, 'Matt Olson', 30, 28, 144, 1, '2016-09-12', 'M', 196.00, 102.00, '1994-03-29', '1B', 'Izquierdo', 'Oly', '2012', '1'),
(833882, 'Austin Riley', 27, 27, 144, 1, '2019-05-15', 'M', 191.00, 108.00, '1997-04-02', '3B', 'Derecho', 'Young Thicc', '2015', '1'),
(833883, 'Spencer Strider', 25, 99, 144, 1, '2021-10-01', 'M', 188.00, 88.00, '1998-10-28', 'P', 'Derecho', 'Strider Man', '2020', '1'),
(833884, 'Elly De La Cruz', 22, 44, 113, 1, '2023-06-06', 'M', 196.00, 91.00, '2002-01-11', 'SS/3B', 'Ambidiestro', 'La Tsunami', '2018', '3'),
(833885, 'Oneil Cruz', 25, 15, 134, 1, '2021-10-02', 'M', 201.00, 99.00, '1998-10-04', 'SS', 'Izquierdo', 'El Jefe', '2017', '3'),
(833886, 'Bryan Reynolds', 29, 10, 134, 1, '2019-04-20', 'M', 191.00, 93.00, '1995-01-27', 'OF', 'Ambidiestro', 'Bry', '2016', '1'),
(833887, 'Dylan Cease', 28, 84, 145, 1, '2019-07-03', 'M', 188.00, 97.00, '1995-12-28', 'P', 'Derecho', 'Cease and Desist', '2014', '1'),
(833888, 'Jazz Chisholm Jr.', 26, 2, 146, 1, '2020-09-01', 'M', 183.00, 84.00, '1998-02-01', 'OF', 'Izquierdo', 'Jazz', '2015', '5'),
(833889, 'CJ Abrams', 23, 5, 120, 1, '2022-04-08', 'M', 188.00, 86.00, '2000-10-03', 'SS', 'Izquierdo', 'CJ', '2019', '1'),
(833890, 'Trea Turner', 30, 7, 143, 1, '2015-08-21', 'M', 185.00, 84.00, '1993-06-30', 'SS', 'Derecho', 'Trea Bae', '2014', '1'),
(833891, 'Justin Verlander', 41, 35, 117, 1, '2005-07-04', 'M', 196.00, 102.00, '1983-02-20', 'P', 'Derecho', 'JV', '2004', '1'),
(833892, 'Xander Bogaerts', 31, 2, 135, 1, '2013-08-20', 'M', 185.00, 95.00, '1992-10-01', 'SS', 'Derecho', 'X-Man', '2009', '5'),
(833893, 'Ketel Marte', 30, 4, 109, 1, '2015-07-31', 'M', 188.00, 95.00, '1993-10-12', '2B', 'Ambidiestro', 'El Nino', '2010', '3'),
(833894, 'Bo Bichette', 26, 11, 141, 1, '2019-07-29', 'M', 183.00, 86.00, '1998-03-05', 'SS', 'Derecho', 'Bo Flow', '2016', '1'),
(833895, 'Wander Franco', 23, 5, 139, 1, '2021-06-22', 'M', 178.00, 86.00, '2001-03-01', 'SS', 'Ambidiestro', 'El Patron', '2017', '3'),
(833896, 'Randy Arozarena', 29, 56, 139, 1, '2019-08-14', 'M', 180.00, 84.00, '1995-02-28', 'OF', 'Derecho', 'The Cuban Missile', '2016', '3'),
(833897, 'Steven Kwan', 26, 38, 114, 1, '2022-04-08', 'M', 175.00, 77.00, '1997-09-05', 'OF', 'Izquierdo', 'Special K', '2018', '1'),
(833898, 'Emmanuel Clase', 26, 48, 114, 1, '2019-08-04', 'M', 188.00, 97.00, '1998-03-18', 'P', 'Derecho', 'Hot Cheese', '2015', '3'),
(833899, 'Hunter Greene', 24, 21, 113, 1, '2022-04-10', 'M', 198.00, 97.00, '1999-08-06', 'P', 'Derecho', 'The Real HG', '2017', '1'),
(833900, 'Alejandro Kirk', 25, 30, 141, 1, '2020-09-01', 'M', 173.00, 111.00, '1998-11-06', 'C', 'Derecho', 'Captain Kirk', '2016', '2'),
(833901, 'Paul Goldschmidt', 36, 46, 138, 1, '2011-08-01', 'M', 191.00, 100.00, '1987-09-10', '1B', 'Derecho', 'Goldy', '2009', '1'),
(833902, 'Nolan Arenado', 33, 28, 138, 1, '2013-04-28', 'M', 188.00, 97.00, '1991-04-16', '3B', 'Derecho', 'Nado', '2009', '1'),
(833903, 'Roki Sasaki', 22, 17, 108, 2, '2020-10-31', 'M', 190.00, 88.00, '2001-11-03', 'P', 'Derecho', 'The Monster', '2019', '2'),
(833904, 'Munetaka Murakami', 24, 55, 109, 2, '2018-09-05', 'M', 188.00, 100.00, '2000-02-02', '3B', 'Derecho', 'Muna', '2017', '2'),
(833905, 'Yoshinobu Yamamoto', 25, 18, 119, 1, '2017-10-02', 'M', 178.00, 79.00, '1998-08-17', 'P', 'Derecho', 'Yoshi', '2016', '2'),
(833906, 'Freddy Asiel Álvarez', 34, 51, 110, 2, '2011-12-08', 'M', 185.00, 88.00, '1990-04-25', 'P', 'Derecho', 'El Gigante', '2008', '3'),
(833907, 'Alfredo Despaigne', 38, 54, 111, 2, '2009-02-20', 'M', 175.00, 93.00, '1986-06-17', 'OF/DH', 'Derecho', 'El Caballo', '2003', '3'),
(833908, 'Yulieski Gurriel', 39, 10, 110, 2, '2005-03-15', 'M', 183.00, 86.00, '1984-06-09', '1B', 'Derecho', 'La Piña', '2001', '3'),
(833909, 'Seiya Suzuki', 29, 27, 112, 1, '2013-09-30', 'M', 182.00, 95.00, '1994-08-18', 'OF', 'Derecho', 'The Phenom', '2012', '2'),
(833910, 'Jung-hoo Lee', 25, 51, 113, 1, '2017-03-31', 'M', 183.00, 88.00, '1998-08-29', 'OF', 'Izquierdo', 'Grandson of Wind', '2016', '6'),
(833911, 'Hyun-jin Ryu', 37, 99, 141, 1, '2013-04-02', 'M', 190.00, 115.00, '1987-03-25', 'P', 'Izquierdo', 'Korean Monster', '2006', '6'),
(833912, 'Ha-seong Kim', 28, 7, 135, 1, '2021-04-01', 'M', 178.00, 82.00, '1995-10-17', 'IF', 'Derecho', 'The Fielding Wizard', '2014', '6'),
(833913, 'Masataka Yoshida', 30, 7, 111, 1, '2023-04-01', 'M', 175.00, 86.00, '1993-07-15', 'OF', 'Izquierdo', 'Big Boss', '2016', '2'),
(833914, 'Kodai Senga', 31, 34, 121, 1, '2023-04-02', 'M', 183.00, 86.00, '1993-01-30', 'P', 'Derecho', 'Ghost Fork', '2010', '2'),
(833915, 'José Adolis García', 31, 53, 140, 1, '2018-08-06', 'M', 188.00, 93.00, '1993-03-02', 'OF', 'Derecho', 'El Bombi', '2016', '3'),
(833916, 'Miguel Cabrera (Retirado)', 41, 24, 116, 2, '2003-06-20', 'M', 193.00, 113.00, '1983-04-18', '1B/DH', 'Derecho', 'Miggy', '1999', '4'),
(833917, 'Julio Teherán', 33, 27, 144, 2, '2011-05-07', 'M', 188.00, 88.00, '1991-01-27', 'P', 'Derecho', 'JT', '2007', '7'),
(833918, 'Joey Meneses', 32, 45, 120, 1, '2022-08-02', 'M', 190.00, 97.00, '1992-05-07', '1B/OF', 'Derecho', 'El Joey', '2011', '2'),
(833919, 'Jackson Holliday', 20, 1, 110, 3, '2023-09-10', 'M', 183.00, 84.00, '2003-12-04', 'SS', 'Izquierdo', 'J-Ho', '2022', '1'),
(833920, 'Paul Skenes', 22, 32, 134, 3, '2023-08-08', 'M', 198.00, 107.00, '2002-05-29', 'P', 'Derecho', 'Big Game', '2023', '1'),
(833921, 'Jasson Domínguez', 21, 98, 147, 3, '2023-09-01', 'M', 178.00, 88.00, '2003-02-07', 'OF', 'Ambidiestro', 'The Martian', '2019', '3'),
(833922, 'Wyatt Langford', 22, 24, 140, 3, '2023-09-12', 'M', 183.00, 93.00, '2001-10-27', 'OF', 'Derecho', 'Lang', '2023', '1'),
(833923, 'James Wood', 21, 15, 120, 3, '2024-05-02', 'M', 201.00, 107.00, '2002-09-17', 'OF', 'Izquierdo', 'Woody', '2021', '1'),
(833924, 'Junior Caminero', 20, 1, 139, 3, '2023-09-22', 'M', 183.00, 93.00, '2003-07-13', '3B', 'Derecho', 'El Junior', '2019', '3'),
(833925, 'Brooks Lee', 23, 11, 142, 3, '2023-09-01', 'M', 183.00, 91.00, '2001-02-14', 'SS', 'Ambidiestro', 'Brooksie', '2022', '1'),
(833926, 'Dylan Crews', 22, 15, 120, 3, '2024-04-01', 'M', 188.00, 93.00, '2002-02-01', 'OF', 'Derecho', 'Crewser', '2023', '1'),
(833927, 'Jackson Chourio', 20, 11, 158, 3, '2023-08-28', 'M', 183.00, 84.00, '2004-03-11', 'OF', 'Derecho', 'Chou', '2021', '4'),
(833928, 'Marcelo Mayer', 21, 10, 111, 3, '2023-08-01', 'M', 191.00, 86.00, '2002-12-12', 'SS', 'Izquierdo', 'Mayo', '2021', '1'),
(833929, 'Alexia Lacatena', 22, 11, 108, 4, '2022-06-15', 'F', 175.00, 70.00, '2002-08-31', 'P', 'Derecho', 'Lex', '2020', '8'),
(833930, 'Kelsie Whitmore', 25, 3, 109, 4, '2016-07-01', 'F', 170.00, 66.00, '1998-07-04', 'P/OF', 'Derecho', 'Kels', '2016', '1'),
(833931, 'Tamara Holmes', 34, 24, 108, 4, '2010-05-12', 'F', 168.00, 63.00, '1990-11-09', 'OF', 'Derecho', 'T-Bone', '2008', '1'),
(833932, 'Jade Gortarez', 26, 7, 109, 4, '2018-06-01', 'F', 165.00, 61.00, '1997-11-02', 'SS', 'Derecho', 'J.G.', '2016', '1'),
(833933, 'Ashton Lansdell', 23, 5, 108, 4, '2020-05-25', 'F', 172.00, 68.00, '2001-03-17', '2B/P', 'Derecho', 'Ash', '2019', '1'),
(833934, 'Luisa Gauci', 24, 14, 109, 4, '2019-04-10', 'F', 167.00, 64.00, '2000-09-10', 'C', 'Derecho', 'Lou', '2018', '9'),
(833935, 'Amanda Asay', 32, 19, 110, 4, '2012-06-08', 'F', 173.00, 72.00, '1992-09-28', '1B/P', 'Derecho', 'Double A', '2010', '10'),
(833936, 'Marika Lyszczyk', 23, 8, 110, 4, '2020-03-01', 'F', 168.00, 62.00, '2001-04-17', 'C', 'Derecho', 'Mari', '2019', '10'),
(833937, 'Kylee Lahners', 30, 17, 108, 4, '2015-06-10', 'F', 170.00, 67.00, '1994-07-22', '3B', 'Derecho', 'Ky', '2014', '1'),
(833938, 'Stacy Piagno', 33, 43, 109, 4, '2013-04-27', 'F', 175.00, 71.00, '1991-01-15', 'P', 'Derecho', 'Stace', '2012', '1'),
(833939, 'Chase Burns', 21, 33, 111, 5, '2023-02-17', 'M', 193.00, 95.00, '2003-07-04', 'P', 'Derecho', 'Burner', NULL, '1'),
(833940, 'Travis Bazzana', 21, 8, 112, 5, '2022-02-18', 'M', 183.00, 86.00, '2002-12-31', '2B', 'Izquierdo', 'Bazz', NULL, '9'),
(833941, 'Jac Caglianone', 21, 14, 113, 5, '2022-02-18', 'M', 196.00, 102.00, '2003-03-01', '1B/P', 'Izquierdo', 'Cags', NULL, '1'),
(833942, 'Charlie Condon', 21, 40, 114, 5, '2022-02-18', 'M', 196.00, 100.00, '2003-05-15', '1B/OF', 'Derecho', 'Chuck', NULL, '1'),
(833943, 'Carson Benge', 20, 15, 115, 5, '2022-02-18', 'M', 188.00, 91.00, '2003-05-02', 'OF/P', 'Izquierdo', 'C.B.', NULL, '1'),
(833944, 'Braden Montgomery', 21, 5, 116, 5, '2022-02-18', 'M', 188.00, 93.00, '2003-01-10', 'OF', 'Ambidiestro', 'Monty', NULL, '1'),
(833945, 'Vance Honeycutt', 21, 5, 117, 5, '2022-02-18', 'M', 191.00, 88.00, '2003-04-20', 'OF', 'Derecho', 'Honey', NULL, '1'),
(833946, 'Seaver King', 21, 7, 118, 5, '2023-02-17', 'M', 183.00, 84.00, '2003-07-10', '3B', 'Derecho', 'King S', NULL, '1'),
(833947, 'Nick Kurtz', 21, 12, 119, 5, '2022-02-18', 'M', 193.00, 100.00, '2003-10-17', '1B', 'Izquierdo', 'Kurtzy', NULL, '1'),
(833948, 'Kaelen Culpepper', 21, 6, 120, 5, '2022-02-18', 'M', 183.00, 84.00, '2003-09-09', 'SS', 'Derecho', 'Culp', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `ligas`
--

CREATE TABLE `ligas` (
  `id_de_la_liga` int(11) NOT NULL,
  `nombre_de_la_liga` varchar(100) NOT NULL,
  `id_equipo` int(11) DEFAULT NULL,
  `id_jugador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ligas`
--

INSERT INTO `ligas` (`id_de_la_liga`, `nombre_de_la_liga`, `id_equipo`, `id_jugador`) VALUES
(1, 'Liga Americana', NULL, NULL),
(2, 'Liga Nacional', NULL, NULL),
(3, 'Liga de Prospectos', NULL, NULL),
(4, 'Liga Femenina', NULL, NULL),
(5, 'Liga Universitaria', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sp_fixed`
--

CREATE TABLE `sp_fixed` (
  `sp_id` int(11) NOT NULL,
  `sp_name` varchar(255) NOT NULL,
  `sp_lastname` varchar(255) NOT NULL,
  `sp_avg` varchar(255) NOT NULL,
  `sp_hr` varchar(255) NOT NULL,
  `sp_rbi` varchar(255) NOT NULL,
  `sp_obp` varchar(255) NOT NULL,
  `sp_slg` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sp_fixed`
--

INSERT INTO `sp_fixed` (`sp_id`, `sp_name`, `sp_lastname`, `sp_avg`, `sp_hr`, `sp_rbi`, `sp_obp`, `sp_slg`) VALUES
(1, 'Fernando', 'Tatis Jr.', '.320', '10', '24', '.387', '.567'),
(2, 'Shohei', 'Ohtani', '.308', '12', '21', '.410', '.641'),
(3, 'Juan', 'Soto', '.308', '12', '21', '.410', '.641');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_del_equipo`),
  ADD KEY `id_de_la_liga` (`id_de_la_liga`);

--
-- Indexes for table `estadisticas_equipos`
--
ALTER TABLE `estadisticas_equipos`
  ADD PRIMARY KEY (`id_del_equipo`);

--
-- Indexes for table `estadisticas_jugadores`
--
ALTER TABLE `estadisticas_jugadores`
  ADD PRIMARY KEY (`id_estadistica`),
  ADD KEY `id_del_jugador` (`id_del_jugador`);

--
-- Indexes for table `historial_juegos`
--
ALTER TABLE `historial_juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id_del_juego`),
  ADD KEY `id_del_equipo` (`id_del_equipo`);

--
-- Indexes for table `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id_del_jugador`),
  ADD KEY `id_del_equipo` (`id_del_equipo`),
  ADD KEY `id_de_la_liga` (`id_de_la_liga`);

--
-- Indexes for table `ligas`
--
ALTER TABLE `ligas`
  ADD PRIMARY KEY (`id_de_la_liga`),
  ADD KEY `fk_ligas_equipos` (`id_equipo`),
  ADD KEY `fk_ligas_jugadores` (`id_jugador`);

--
-- Indexes for table `sp_fixed`
--
ALTER TABLE `sp_fixed`
  ADD PRIMARY KEY (`sp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_del_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT for table `estadisticas_jugadores`
--
ALTER TABLE `estadisticas_jugadores`
  MODIFY `id_estadistica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT for table `historial_juegos`
--
ALTER TABLE `historial_juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id_del_juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=720031;

--
-- AUTO_INCREMENT for table `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id_del_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=833949;

--
-- AUTO_INCREMENT for table `ligas`
--
ALTER TABLE `ligas`
  MODIFY `id_de_la_liga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sp_fixed`
--
ALTER TABLE `sp_fixed`
  MODIFY `sp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`id_de_la_liga`) REFERENCES `ligas` (`id_de_la_liga`);

--
-- Constraints for table `estadisticas_equipos`
--
ALTER TABLE `estadisticas_equipos`
  ADD CONSTRAINT `estadisticas_equipos_ibfk_1` FOREIGN KEY (`id_del_equipo`) REFERENCES `equipos` (`id_del_equipo`);

--
-- Constraints for table `estadisticas_jugadores`
--
ALTER TABLE `estadisticas_jugadores`
  ADD CONSTRAINT `estadisticas_jugadores_ibfk_1` FOREIGN KEY (`id_del_jugador`) REFERENCES `jugadores` (`id_del_jugador`);

--
-- Constraints for table `juegos`
--
ALTER TABLE `juegos`
  ADD CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`id_del_equipo`) REFERENCES `equipos` (`id_del_equipo`);

--
-- Constraints for table `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`id_del_equipo`) REFERENCES `equipos` (`id_del_equipo`),
  ADD CONSTRAINT `jugadores_ibfk_2` FOREIGN KEY (`id_de_la_liga`) REFERENCES `ligas` (`id_de_la_liga`);

--
-- Constraints for table `ligas`
--
ALTER TABLE `ligas`
  ADD CONSTRAINT `fk_ligas_equipos` FOREIGN KEY (`id_equipo`) REFERENCES `equipos` (`id_del_equipo`),
  ADD CONSTRAINT `fk_ligas_jugadores` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_del_jugador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
