-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-08-2024 a las 23:17:39
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
-- Base de datos: `mi_base_datos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `psicologo_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` enum('ansiedad','depresion','estres','relaciones','autoestima','trauma','adicciones','desarrollo','academico','salud_mental','otros') DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  `sede` varchar(255) DEFAULT NULL,
  `Nombre_Completo` varchar(40) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `Genero` enum('male','female','other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `estudiante_id`, `psicologo_id`, `fecha`, `hora`, `motivo`, `estado`, `sede`, `Nombre_Completo`, `Correo`, `Genero`) VALUES
(16, 1130267745, NULL, '2024-08-15', '15:00:00', 'ansiedad', 'pendiente', 'Soledad', 'Daniel Garcia', 'dmnauelgarcia@unibarranquilla.', 'male'),
(17, 1140837811, NULL, '2024-08-09', '16:00:00', 'relaciones', 'pendiente', 'Soledad', 'Vanesa Martinez', 'vmartinez@unibarranquilla.edu.', 'female'),
(18, 1130267745, NULL, '2024-08-23', '09:30:00', 'depresion', 'pendiente', 'Barranquilla', 'Daniel Garcia', 'dmnauelgarcia@unibarranquilla.', 'male'),
(19, 1140837811, NULL, '2024-08-23', '17:00:00', 'estres', 'pendiente', 'Barranquilla', 'Vanesa Martinez', 'vmartinez@unibarranquilla.edu.', 'female');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas_enfermeria`
--

CREATE TABLE `citas_enfermeria` (
  `id` int(11) NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `enfermero_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `sede` varchar(40) DEFAULT NULL,
  `Nombre_Completo` varchar(50) NOT NULL,
  `Correo` varchar(40) NOT NULL,
  `Genero` enum('male','female','other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas_enfermeria`
--

INSERT INTO `citas_enfermeria` (`id`, `estudiante_id`, `enfermero_id`, `fecha`, `hora`, `motivo`, `estado`, `sede`, `Nombre_Completo`, `Correo`, `Genero`) VALUES
(4, 1130267745, NULL, '2024-08-14', '16:00:00', 'hola', NULL, 'Soledad', 'Daniel Garcia', 'dmnauelgarcia@unibarranquilla.', 'male'),
(5, 1140837811, NULL, '2024-08-14', '16:00:00', 'hola', NULL, 'Soledad', 'Vanesa Martinez', 'vmartinez@unibarranquilla.edu.', 'female'),
(6, 1130267745, NULL, '2024-08-15', '10:00:00', 'dolor de estomago', NULL, 'Barranquilla', 'Daniel Garcia', 'dmnauelgarcia@unibarranquilla.', 'male'),
(10, 1130267745, NULL, '2024-08-22', '08:00:00', 'Gripa', NULL, 'Barranquilla', 'Daniel Garcia', 'dmnauelgarcia@unibarranquilla.', 'male'),
(11, 1140837811, NULL, '2024-08-22', '16:00:00', 'Mareos', NULL, 'Soledad', 'Vanesa Martinez', 'vmartinez@unibarranquilla.edu.', 'female');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermero`
--

CREATE TABLE `enfermero` (
  `id_user` int(11) NOT NULL,
  `correo_institucional` varchar(50) NOT NULL,
  `identificacion` int(13) NOT NULL,
  `telefono` int(15) DEFAULT NULL,
  `Nombre_Completo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `enfermero`
--

INSERT INTO `enfermero` (`id_user`, `correo_institucional`, `identificacion`, `telefono`, `Nombre_Completo`) VALUES
(1, 'mjovanegas@unibarranquilla.edu.co', 32874150, NULL, 'Maria Jose Vanegas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `tipo_documento` enum('cc','ti') NOT NULL,
  `identificacion` int(13) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `historial_clinico` varchar(100) DEFAULT NULL,
  `Nombre_Completo` varchar(40) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `Genero` enum('male','female','other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`tipo_documento`, `identificacion`, `telefono`, `historial_clinico`, `Nombre_Completo`, `Correo`, `Genero`) VALUES
('', 1130267745, '3003729941', NULL, 'Daniel Garcia', 'dmnauelgarcia@unibarranquilla.', 'male'),
('cc', 1140837811, '300000', NULL, 'Vanesa Martinez', 'vmartinez@unibarranquilla.edu.', 'female');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `psicologo`
--

CREATE TABLE `psicologo` (
  `id_user` int(11) NOT NULL,
  `correo_institucional` varchar(50) NOT NULL,
  `Identificacion` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `Nombre_completo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `psicologo`
--

INSERT INTO `psicologo` (`id_user`, `correo_institucional`, `Identificacion`, `telefono`, `Nombre_completo`) VALUES
(1, 'pcastro@unibarraqnuilla.edu.co', 8778987, 30000000, 'pablo Castro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendaciones_enfermeria`
--

CREATE TABLE `recomendaciones_enfermeria` (
  `id_recomendacion` int(11) NOT NULL,
  `id_enfermero` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `fecha_recomendacion` date NOT NULL,
  `recomendacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recomendaciones_enfermeria`
--

INSERT INTO `recomendaciones_enfermeria` (`id_recomendacion`, `id_enfermero`, `id_estudiante`, `fecha_recomendacion`, `recomendacion`) VALUES
(2, 32874150, 1130267745, '2024-08-06', 'Advil ultra cada 8 horas'),
(3, 32874150, 1140837811, '2024-08-16', 'Acetaminofen cada 3 horas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomendaciones_psicologia`
--

CREATE TABLE `recomendaciones_psicologia` (
  `id` int(11) NOT NULL,
  `id_psicologo` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `recomendacion` text NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recomendaciones_psicologia`
--

INSERT INTO `recomendaciones_psicologia` (`id`, `id_psicologo`, `id_estudiante`, `recomendacion`, `fecha`) VALUES
(1, 8778987, 1130267745, 'volver entre 15 dias para una nueva consulta', '2024-08-07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `identificacion` varchar(15) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `identificacion`, `correo`, `telefono`, `username`, `password`, `rol`) VALUES
(1, 'David bastos', '12345678', 'davidmrambal@unibarranquilla.edu.co', '321 5620376', 'admin', 'admin', 'admin'),
(2, 'Julian Garcia', '987654321', 'juliancgarcia@unibarranquilla.edu.co', '320 1234567', 'admin', 'admin321', 'admin'),
(3, 'Maria Jose Vanegas', '32874150 	', 'mjovanegas@unibarranquilla.edu.co', '200000', 'enfermeria', 'enfermera123', 'enfermera1'),
(4, 'pablo Castro', '879648', 'pcastro@unibarraqnuilla.edu.co', '30000000', 'psicologo', 'psicologo1', 'psicologo1'),
(5, 'Daniel Garcia', '1130267875', 'dmanbuelgarcia@unibarraqnuilla.edu.co', '3456789', 'estudiante', 'estuiante1', 'estudiante1'),
(6, 'Vanesa Martinez', '1140837811', 'vmartinez@unibarranquilla.edu.co', '3000000', 'Estudiante2', 'estudiante123', 'estudiante2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `Nombre_Completo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `role`, `Nombre_Completo`) VALUES
(1, 'admin', 'admin123', 'admin', 'David Bastos'),
(2, 'estudiante', 'estudiante123', ' estudiante', 'Daniel Garcia'),
(3, 'enfermera', 'enfermera123', 'enfermeria', 'Maria Jose Vanegas'),
(4, 'psicologo', 'psicologo123', 'psicologo', 'Pablo Castro'),
(5, 'Estudiante2', 'Estudiante1234\r\n', 'estudiante2', 'Vanesa Martinez');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_id` (`estudiante_id`),
  ADD KEY `psicologo_id` (`psicologo_id`);

--
-- Indices de la tabla `citas_enfermeria`
--
ALTER TABLE `citas_enfermeria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `estudiante_id` (`estudiante_id`,`enfermero_id`),
  ADD KEY `enfermero_id` (`enfermero_id`);

--
-- Indices de la tabla `enfermero`
--
ALTER TABLE `enfermero`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`identificacion`),
  ADD UNIQUE KEY `identificacion` (`identificacion`);

--
-- Indices de la tabla `psicologo`
--
ALTER TABLE `psicologo`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `Identificacion` (`Identificacion`);

--
-- Indices de la tabla `recomendaciones_enfermeria`
--
ALTER TABLE `recomendaciones_enfermeria`
  ADD PRIMARY KEY (`id_recomendacion`),
  ADD KEY `id_enfermero` (`id_enfermero`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `recomendaciones_psicologia`
--
ALTER TABLE `recomendaciones_psicologia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_psicologo` (`id_psicologo`),
  ADD KEY `id_estudiante` (`id_estudiante`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `citas_enfermeria`
--
ALTER TABLE `citas_enfermeria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `enfermero`
--
ALTER TABLE `enfermero`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `psicologo`
--
ALTER TABLE `psicologo`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `recomendaciones_enfermeria`
--
ALTER TABLE `recomendaciones_enfermeria`
  MODIFY `id_recomendacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `recomendaciones_psicologia`
--
ALTER TABLE `recomendaciones_psicologia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`identificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`psicologo_id`) REFERENCES `psicologo` (`Identificacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `citas_enfermeria`
--
ALTER TABLE `citas_enfermeria`
  ADD CONSTRAINT `citas_enfermeria_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`identificacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recomendaciones_enfermeria`
--
ALTER TABLE `recomendaciones_enfermeria`
  ADD CONSTRAINT `recomendaciones_enfermeria_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`identificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recomendaciones_enfermeria_ibfk_2` FOREIGN KEY (`id_enfermero`) REFERENCES `enfermero` (`identificacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recomendaciones_psicologia`
--
ALTER TABLE `recomendaciones_psicologia`
  ADD CONSTRAINT `recomendaciones_psicologia_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`identificacion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recomendaciones_psicologia_ibfk_2` FOREIGN KEY (`id_psicologo`) REFERENCES `psicologo` (`Identificacion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
