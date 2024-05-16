-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2024 a las 01:38:53
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
-- Base de datos: `sige`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemsdescuentos`
--

CREATE TABLE `itemsdescuentos` (
  `id_itemsdescuentos` int(11) NOT NULL,
  `codconcepto` varchar(50) DEFAULT NULL,
  `valordto` varchar(50) DEFAULT NULL,
  `baseretd` varchar(50) DEFAULT NULL,
  `porcretd` varchar(50) DEFAULT NULL,
  `porivad` varchar(50) DEFAULT NULL,
  `centrocostos` varchar(50) DEFAULT NULL,
  `codarea` varchar(50) DEFAULT NULL,
  `venta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemsformapago`
--

CREATE TABLE `itemsformapago` (
  `id_itemsformapago` int(11) NOT NULL,
  `codFormaPago` varchar(50) DEFAULT NULL,
  `plazoDias` varchar(50) DEFAULT NULL,
  `fechaVencimiento` varchar(50) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  `venta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemspedido`
--

CREATE TABLE `itemspedido` (
  `id_itemspedido` int(11) NOT NULL,
  `codMat` varchar(50) DEFAULT NULL,
  `codBodega` varchar(50) DEFAULT NULL,
  `codTalla` varchar(50) DEFAULT NULL,
  `codColor` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `tipoUnidad` varchar(50) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `centrosCostos` varchar(50) DEFAULT NULL,
  `porcIva` int(11) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `impConsumo` int(11) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  `venta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `codPrefijo` varchar(50) DEFAULT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `fecha` varchar(50) DEFAULT NULL,
  `codTercero` varchar(50) DEFAULT NULL,
  `codVendedor` varchar(50) DEFAULT NULL,
  `codDespachar` varchar(50) DEFAULT NULL,
  `codFormaPago` varchar(50) DEFAULT NULL,
  `codBanco` varchar(50) DEFAULT NULL,
  `fechaVence` varchar(50) DEFAULT NULL,
  `plazoDias` int(11) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `itemsdescuentos`
--
ALTER TABLE `itemsdescuentos`
  ADD PRIMARY KEY (`id_itemsdescuentos`),
  ADD KEY `venta_id` (`venta_id`);

--
-- Indices de la tabla `itemsformapago`
--
ALTER TABLE `itemsformapago`
  ADD PRIMARY KEY (`id_itemsformapago`),
  ADD KEY `venta_id` (`venta_id`);

--
-- Indices de la tabla `itemspedido`
--
ALTER TABLE `itemspedido`
  ADD PRIMARY KEY (`id_itemspedido`),
  ADD KEY `venta_id` (`venta_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `itemsdescuentos`
--
ALTER TABLE `itemsdescuentos`
  MODIFY `id_itemsdescuentos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `itemsformapago`
--
ALTER TABLE `itemsformapago`
  MODIFY `id_itemsformapago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `itemspedido`
--
ALTER TABLE `itemspedido`
  MODIFY `id_itemspedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `itemsdescuentos`
--
ALTER TABLE `itemsdescuentos`
  ADD CONSTRAINT `itemsdescuentos_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id_venta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `itemsformapago`
--
ALTER TABLE `itemsformapago`
  ADD CONSTRAINT `itemsformapago_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id_venta`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `itemspedido`
--
ALTER TABLE `itemspedido`
  ADD CONSTRAINT `itemspedido_ibfk_1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id_venta`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
