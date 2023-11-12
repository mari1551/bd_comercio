-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2023 a las 20:27:12
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comercio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellidos`) VALUES
('12121233', 'Samanta', 'Gonzalez'),
('12341234', 'Caterina', 'Valentino'),
('12345345', 'Jorge', 'Garcia'),
('12345643', 'Sacha', 'Barboza'),
('12345667', 'Ana', 'Pardeiro'),
('12345674', 'Esteban', 'Granados'),
('12345675', 'Marcos', 'Maldonado'),
('12345677', 'Luna', 'Leung'),
('12345678', 'Maria', 'Garcia'),
('12345679', 'Oscar', 'Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(20) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `clientes_dni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `clientes_dni`) VALUES
(1, 'Compras nuevas', '12121233'),
(2, 'Compras 2', '12341234'),
(3, 'Compras 3', '12345345'),
(4, 'Compras 4', '12345643'),
(5, 'Compras 5', '12345674'),
(6, 'Compras', '12345675'),
(7, 'Compras', '12345677'),
(8, 'Compras', '12121233'),
(9, 'Compras', '12345679'),
(10, 'Compras 10', '12345679');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `numero` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 1, 'Pan', 10000),
(2, 2, 'Harina de Maiz', 50000),
(3, 3, 'Harina de Trigo', 20000),
(4, 4, 'Chocolate en barra', 70000),
(5, 5, 'Huevos x 30', 30000),
(6, 6, 'Azucar x Kg', 70000),
(7, 7, 'Vainilla', 10000),
(8, 8, 'Margarina', 50000),
(9, 9, 'Frosting', 10000),
(10, 10, 'Canela en polvo', 20000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  MODIFY `numero` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD CONSTRAINT `lineascompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
