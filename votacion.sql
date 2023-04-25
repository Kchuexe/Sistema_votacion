-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-04-2023 a las 00:20:43
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

CREATE TABLE `candidatos` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`ID`, `NOMBRE`) VALUES
(1, 'Nancy Silva Guerrero (PS)'),
(2, 'Alejandro Kohler Vargas (Ind.-PS)'),
(3, 'Valeria Amanda Ochoa Hinrichsen (CS)'),
(4, 'Oscar Eduardo Mendoza Uriarte (Ind.-PC)'),
(5, 'Marila Loreto Barrientos Triviños (PPD)'),
(6, 'Miguel Barriga Parra (Ind.-PPD)'),
(7, 'Madelin Yosette Jau Jaramillo (PR)'),
(8, 'Miguel David Ramírez Carvajal (Ind.-PPD)'),
(9, 'Lorena Gallardo Cárdenas (Ind.-RN)'),
(10, 'José Antonio Urrutia Riesco (Ind.-RN)'),
(11, 'Carola Cabeza Fuentes (Ind.-UDI)'),
(12, 'Pedro Lamas Gutiérrez (UDI)'),
(13, 'Emma Patricia Cifuentes Barrientos'),
(14, 'Francisco Isidoro Henríquez Muñoz'),
(15, 'María Sonia Aguilef Gallegos'),
(16, 'Gustavo Eduardo Dávila Sepúlveda'),
(17, 'Paola Francesca Claverol Martínez'),
(18, 'Daniel Andrés Arzola Garrido'),
(19, 'Patricia Liliana Ayora Cavour'),
(20, 'Jorge De La Maza Schleyer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunas`
--

CREATE TABLE `comunas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `region_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comunas`
--

INSERT INTO `comunas` (`id`, `nombre`, `region_id`) VALUES
(1, 'Arica', 1),
(2, 'Camarones', 1),
(3, 'Putre', 1),
(4, 'General Lagos', 1),
(5, 'Iquique', 2),
(6, 'Alto Hospicio', 2),
(7, 'Pozo Almonte', 2),
(8, 'Camiña', 2),
(9, 'Colchane', 2),
(10, 'Huara', 2),
(11, 'Pica', 2),
(12, 'Antofagasta', 3),
(13, 'Mejillones', 3),
(14, 'Sierra Gorda', 3),
(15, 'Taltal', 3),
(16, 'Calama', 3),
(17, 'Ollagüe', 3),
(18, 'San Pedro de Atacama', 3),
(19, 'Tocopilla', 3),
(20, 'María Elena', 3),
(21, 'Copiapó', 4),
(22, 'Caldera', 4),
(23, 'Tierra Amarilla', 4),
(24, 'Chañaral', 4),
(25, 'Diego de Almagro', 4),
(26, 'Vallenar', 4),
(27, 'Alto del Carmen', 4),
(28, 'Freirina', 4),
(29, 'Huasco', 4),
(30, 'La Serena', 5),
(31, 'Coquimbo', 5),
(32, 'Andacollo', 5),
(33, 'La Higuera', 5),
(34, 'Paihuano', 5),
(35, 'Vicuña', 5),
(36, 'Illapel', 5),
(37, 'Canela', 5),
(38, 'Los Vilos', 5),
(39, 'Salamanca', 5),
(40, 'Ovalle', 5),
(41, 'Combarbalá', 5),
(42, 'Monte Patria', 5),
(43, 'Punitaqui', 5),
(44, 'Río Hurtado', 5),
(45, 'Valparaíso', 6),
(46, 'Casablanca', 6),
(47, 'Concón', 6),
(48, 'Juan Fernández', 6),
(49, 'Puchuncaví', 6),
(50, 'Quintero', 6),
(51, 'Viña del Mar', 6),
(52, 'Isla de Pascua', 6),
(53, 'Los Andes', 6),
(54, 'Calle Larga', 6),
(55, 'Rinconada', 6),
(56, 'San Esteban', 6),
(57, 'La Ligua', 6),
(58, 'Cabildo', 6),
(59, 'Papudo', 6),
(60, 'Petorca', 6),
(61, 'Zapallar', 6),
(62, 'Quillota', 6),
(63, 'La Calera', 6),
(64, 'Hijuelas', 6),
(65, 'La Cruz', 6),
(66, 'Nogales', 6),
(67, 'San Antonio', 6),
(68, 'Algarrobo', 6),
(69, 'Cartagena', 6),
(70, 'El Quisco', 6),
(71, 'El Tabo', 6),
(72, 'Santo Domingo', 6),
(73, 'San Felipe', 6),
(74, 'Catemu', 6),
(75, 'Llay-Llay', 6),
(76, 'Panquehue', 6),
(77, 'Putaendo', 6),
(78, 'Santa María', 6),
(79, 'Quilpué', 6),
(80, 'Limache', 6),
(81, 'Olmué', 6),
(82, 'Villa Alemana', 6),
(83, 'Rancagua', 8),
(84, 'Codegua', 8),
(85, 'Coinco', 8),
(86, 'Coltauco', 8),
(87, 'Doñihue', 8),
(88, 'Graneros', 8),
(89, 'Las Cabras', 8),
(90, 'Machalí', 8),
(91, 'Malloa', 8),
(92, 'Mostazal', 8),
(93, 'Olivar', 8),
(94, 'Peumo', 8),
(95, 'Pichidegua', 8),
(96, 'Quinta de Tilcoco', 8),
(97, 'Rengo', 8),
(98, 'Requínoa', 8),
(99, 'San Vicente', 8),
(100, 'Pichilemu', 8),
(101, 'La Estrella', 8),
(102, 'Litueche', 8),
(103, 'Marchihue', 8),
(104, 'Navidad', 8),
(105, 'Paredones', 8),
(106, 'San Fernando', 8),
(107, 'Chépica', 8),
(108, 'Chimbarongo', 8),
(109, 'Lolol', 8),
(110, 'Nancagua', 8),
(111, 'Palmilla', 8),
(112, 'Peralillo', 8),
(113, 'Placilla', 8),
(114, 'Pumanque', 8),
(115, 'Santa Cruz', 8),
(116, 'Talca', 9),
(117, 'Constitución', 9),
(118, 'Curepto', 9),
(119, 'Empedrado', 9),
(120, 'Maule', 9),
(121, 'Pelarco', 9),
(122, 'Pencahue', 9),
(123, 'Río Claro', 9),
(124, 'San Clemente', 9),
(125, 'San Rafael', 9),
(126, 'Cauquenes', 9),
(127, 'Chanco', 9),
(128, 'Pelluhue', 9),
(129, 'Curicó', 9),
(130, 'Hualañé', 9),
(131, 'Licantén', 9),
(132, 'Molina', 9),
(133, 'Rauco', 9),
(134, 'Romeral', 9),
(135, 'Sagrada Familia', 9),
(136, 'Teno', 9),
(137, 'Vichuquén', 9),
(138, 'Linares', 9),
(139, 'Colbún', 9),
(140, 'Longaví', 9),
(141, 'Parral', 9),
(142, 'Retiro', 9),
(143, 'San Javier', 9),
(144, 'Villa Alegre', 9),
(145, 'Yerbas Buenas', 9),
(146, 'Chillán', 10),
(147, 'Bulnes', 10),
(148, 'Chillán Viejo', 10),
(149, 'El Carmen', 10),
(150, 'Pemuco', 10),
(151, 'Pinto', 10),
(152, 'Quillón', 10),
(153, 'San Ignacio', 10),
(154, 'Yungay', 10),
(155, 'Quirihue', 10),
(156, 'Cobquecura', 10),
(157, 'Coelemu', 10),
(158, 'Ninhue', 10),
(159, 'Portezuelo', 10),
(160, 'Ránquil', 10),
(161, 'Treguaco', 10),
(162, 'San Carlos', 10),
(163, 'Coihueco', 10),
(164, 'Ñiquén', 10),
(165, 'San Fabián', 10),
(166, 'San Nicolás', 10),
(167, 'Concepción', 11),
(168, 'Coronel', 11),
(169, 'Chiguayante', 11),
(170, 'Florida', 11),
(171, 'Hualqui', 11),
(172, 'Lota', 11),
(173, 'Penco', 11),
(174, 'San Pedro de La Paz', 11),
(175, 'Santa Juana', 11),
(176, 'Talcahuano', 11),
(177, 'Tomé', 11),
(178, 'Hualpén', 11),
(179, 'Lebu', 11),
(180, 'Arauco', 11),
(181, 'Cañete', 11),
(182, 'Contulmo', 11),
(183, 'Curanilahue', 11),
(184, 'Los Álamos', 11),
(185, 'Tirúa', 11),
(186, 'Los Ángeles', 11),
(187, 'Antuco', 11),
(188, 'Cabrero', 11),
(189, 'Laja', 11),
(190, 'Mulchén', 11),
(191, 'Nacimiento', 11),
(192, 'Negrete', 11),
(193, 'Quilaco', 11),
(194, 'Quilleco', 11),
(195, 'San Rosendo', 11),
(196, 'Santa Bárbara', 11),
(197, 'Tucapel', 11),
(198, 'Yumbel', 11),
(199, 'Alto Biobío', 11),
(200, 'Temuco', 12),
(201, 'Carahue', 12),
(202, 'Cunco', 12),
(203, 'Curarrehue', 12),
(204, 'Freire', 12),
(205, 'Galvarino', 12),
(206, 'Gorbea', 12),
(207, 'Lautaro', 12),
(208, 'Loncoche', 12),
(209, 'Melipeuco', 12),
(210, 'Nueva Imperial', 12),
(211, 'Padre Las Casas', 12),
(212, 'Perquenco', 12),
(213, 'Pitrufquén', 12),
(214, 'Pucón', 12),
(215, 'Saavedra', 12),
(216, 'Teodoro Schmidt', 12),
(217, 'Toltén', 12),
(218, 'Vilcún', 12),
(219, 'Villarrica', 12),
(220, 'Cholchol', 12),
(221, 'Angol', 12),
(222, 'Collipulli', 12),
(223, 'Curacautín', 12),
(224, 'Ercilla', 12),
(225, 'Lonquimay', 12),
(226, 'Los Sauces', 12),
(227, 'Lumaco', 12),
(228, 'Purén', 12),
(229, 'Renaico', 12),
(230, 'Traiguén', 12),
(231, 'Victoria', 12),
(232, 'Valdivia', 13),
(233, 'Corral', 13),
(234, 'Lanco', 13),
(235, 'Los Lagos', 13),
(236, 'Máfil', 13),
(237, 'Mariquina', 13),
(238, 'Paillaco', 13),
(239, 'Panguipulli', 13),
(240, 'La Unión', 13),
(241, 'Futrono', 13),
(242, 'Lago Ranco', 13),
(243, 'Río Bueno', 13),
(244, 'Puerto Montt', 14),
(245, 'Calbuco', 14),
(246, 'Cochamó', 14),
(247, 'Fresia', 14),
(248, 'Frutillar', 14),
(249, 'Los Muermos', 14),
(250, 'Llanquihue', 14),
(251, 'Maullín', 14),
(252, 'Puerto Varas', 14),
(253, 'Castro', 14),
(254, 'Ancud', 14),
(255, 'Chonchi', 14),
(256, 'Curaco de Vélez', 14),
(257, 'Dalcahue', 14),
(258, 'Puqueldón', 14),
(259, 'Queilén', 14),
(260, 'Quellón', 14),
(261, 'Quemchi', 14),
(262, 'Quinchao', 14),
(263, 'Osorno', 14),
(264, 'Puerto Octay', 14),
(265, 'Purranque', 14),
(266, 'Puyehue', 14),
(267, 'Río Negro', 14),
(268, 'San Juan de la Costa', 14),
(269, 'San Pablo', 14),
(270, 'Chaitén', 14),
(271, 'Futaleufú', 14),
(272, 'Hualaihué', 14),
(273, 'Palena', 14),
(274, 'Coyhaique', 15),
(275, 'Lago Verde', 15),
(276, 'Aysén', 15),
(277, 'Cisnes', 15),
(278, 'Guaitecas', 15),
(279, 'Cochrane', 15),
(280, 'O\'Higgins', 15),
(281, 'Tortel', 15),
(282, 'Chile Chico', 15),
(283, 'Río Ibáñez', 15),
(284, 'Punta Arenas', 16),
(285, 'Laguna Blanca', 16),
(286, 'Río Verde', 16),
(287, 'San Gregorio', 16),
(288, 'Cabo de Hornos', 16),
(289, 'Antártica', 16),
(290, 'Porvenir', 16),
(291, 'Primavera', 16),
(292, 'Timaukel', 16),
(293, 'Natales', 16),
(294, 'Torres del Paine', 16),
(295, 'Santiago', 7),
(296, 'Cerrillos', 7),
(297, 'Cerro Navia', 7),
(298, 'Conchalí', 7),
(299, 'El Bosque', 7),
(300, 'Estación Central', 7),
(301, 'Huechuraba', 7),
(302, 'Independencia', 7),
(303, 'La Cisterna', 7),
(304, 'La Florida', 7),
(305, 'La Granja', 7),
(306, 'La Pintana', 7),
(307, 'La Reina', 7),
(308, 'Las Condes', 7),
(309, 'Lo Barnechea', 7),
(310, 'Lo Espejo', 7),
(311, 'Lo Prado', 7),
(312, 'Macul', 7),
(313, 'Maipú', 7),
(314, 'Ñuñoa', 7),
(315, 'Pedro Aguirre Cerda', 7),
(316, 'Peñalolén', 7),
(317, 'Providencia', 7),
(318, 'Pudahuel', 7),
(319, 'Quilicura', 7),
(320, 'Quinta Normal', 7),
(321, 'Recoleta', 7),
(322, 'Renca', 7),
(323, 'San Joaquín', 7),
(324, 'San Miguel', 7),
(325, 'San Ramón', 7),
(326, 'Vitacura', 7),
(327, 'Puente Alto', 7),
(328, 'Pirque', 7),
(329, 'San José de Maipo', 7),
(330, 'Colina', 7),
(331, 'Lampa', 7),
(332, 'Til Til', 7),
(333, 'San Bernardo', 7),
(334, 'Buin', 7),
(335, 'Calera de Tango', 7),
(336, 'Paine', 7),
(337, 'Melipilla', 7),
(338, 'Alhué', 7),
(339, 'Curacaví', 7),
(340, 'María Pinto', 7),
(341, 'San Pedro', 7),
(342, 'Talagante', 7),
(343, 'El Monte', 7),
(344, 'Isla de Maipo', 7),
(345, 'Padre Hurtado', 7),
(346, 'Peñaflor', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regiones`
--

CREATE TABLE `regiones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `regiones`
--

INSERT INTO `regiones` (`id`, `nombre`) VALUES
(1, 'Región de Arica y Parinacota'),
(2, 'Región de Tarapacá'),
(3, 'Región de Antofagasta'),
(4, 'Región de Atacama'),
(5, 'Región de Coquimbo'),
(6, 'Región de Valparaíso'),
(7, 'Región Metropolitana de Santiago'),
(8, 'Región del Libertador General Bernardo O\'Higgins'),
(9, 'Región del Maule'),
(10, 'Región de Ñuble'),
(11, 'Región del Biobío'),
(12, 'Región de La Araucanía'),
(13, 'Región de Los Ríos'),
(14, 'Región de Los Lagos'),
(15, 'Región Aysén del General Carlos Ibáñez del Campo'),
(16, 'Región de Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `votantes`
--

CREATE TABLE `votantes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `Alias` varchar(50) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `region_id` int(11) NOT NULL,
  `comuna_id` int(11) NOT NULL,
  `candidato_id` int(11) NOT NULL,
  `comentario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `votantes`
--

INSERT INTO `votantes` (`id`, `nombre`, `Alias`, `rut`, `email`, `region_id`, `comuna_id`, `candidato_id`, `comentario`) VALUES
(1, 'Manuel Pizarro', 'Manue1', '19.934.823-k', 'manuel.pizarro98@gmail.com', 13, 234, 8, 'TV, Amigos'),
(2, 'Manuel Pizarro', 'Manue2', '11.421.122-2', 'manuel.pizarro98@gmail.com', 13, 234, 8, 'Web, Redes Sociales'),
(3, 'Ignacio Gutierrez', 'Nacho1', '19.345.216-7', 'manuel.pizarro26@inacapmail.cl', 13, 232, 6, 'Web, TV'),
(4, 'Manuel Pizarro', 'repuesto1', '9.753.813-1', 'manuel.pizarro26@inacapmail.cl', 13, 234, 2, 'Web, Redes Sociales'),
(5, 'perez guitierrerz', 'repuesto2', '12.235.465-0', 'manuel.pizarro98@gmail.com', 3, 13, 4, 'Web, Redes Sociales, Amigos'),
(6, 'Manuel Pizarro', 'Nicole1', '19.934.823-2', 'manuel.pizarro98@gmail.com', 2, 6, 4, 'Web, Redes Sociales');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

--
-- Indices de la tabla `regiones`
--
ALTER TABLE `regiones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `votantes`
--
ALTER TABLE `votantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `comuna_id` (`comuna_id`),
  ADD KEY `candidato_id` (`candidato_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `comunas`
--
ALTER TABLE `comunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;

--
-- AUTO_INCREMENT de la tabla `regiones`
--
ALTER TABLE `regiones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `votantes`
--
ALTER TABLE `votantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comunas`
--
ALTER TABLE `comunas`
  ADD CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`);

--
-- Filtros para la tabla `votantes`
--
ALTER TABLE `votantes`
  ADD CONSTRAINT `votantes_ibfk_1` FOREIGN KEY (`candidato_id`) REFERENCES `candidatos` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `votantes_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `regiones` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `votantes_ibfk_3` FOREIGN KEY (`comuna_id`) REFERENCES `comunas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
