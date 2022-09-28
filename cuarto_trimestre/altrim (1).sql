-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2022 a las 05:20:19
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `altrim`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barrio`
--

CREATE TABLE `barrio` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Localidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `barrio`
--

INSERT INTO `barrio` (`id`, `Descripcion`, `Localidad_id`) VALUES
(1, 'Piamonte', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos_rol`
--

CREATE TABLE `cargos_rol` (
  `id` int(11) NOT NULL,
  `Cargo_Rol` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargos_rol`
--

INSERT INTO `cargos_rol` (`id`, `Cargo_Rol`) VALUES
(1, 'Administrador'),
(2, 'Vendedor'),
(4, 'Mensajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id`, `Nombre`) VALUES
(1, 'Bogotá');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `Numero_Documento` varchar(45) DEFAULT NULL,
  `Nombres` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(60) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `Tipo_Documento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `Numero_Documento`, `Nombres`, `Apellidos`, `Telefono`, `correo`, `Tipo_Documento_id`) VALUES
(1, '1232424345', 'Erika', 'Ubaque', '453454', 'dsfsfasfsaf', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `Color` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`id`, `Color`) VALUES
(1, 'Negro'),
(2, 'Blanco'),
(3, 'Cafe'),
(4, 'Gris'),
(5, 'Verde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(120) NOT NULL,
  `Barrio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id`, `Descripcion`, `Barrio_id`) VALUES
(1, 'fefsdffsdfsdfdfds', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `Estado` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `Estado`) VALUES
(1, 'Terminado'),
(2, 'En proceso'),
(3, 'Garantia'),
(4, 'Vendido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_venta`
--

CREATE TABLE `estado_venta` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_venta`
--

INSERT INTO `estado_venta` (`id`, `Descripcion`) VALUES
(1, 'Entregado'),
(2, 'En proceso'),
(3, 'En punto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `cantidad_cm_und` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `Tipo_Insumo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id`, `nombre`, `cantidad_cm_und`, `precio`, `Tipo_Insumo_id`) VALUES
(1, 'Cuero caprino', 100, 1000000, 1),
(2, 'Cuero equino', 50, 500000, 1),
(3, 'Cuero nutria', 80, 800000, 1),
(4, 'Cuero chinchilla', 60, 600000, 1),
(5, ' Hilo Torzal', 100, 200000, 2),
(6, 'Hilo elástico', 10, 200000, 2),
(7, 'Hilo transparente', 50, 300000, 2),
(8, 'Hilo estándar de pol', 200, 750000, 2),
(9, 'Miel velez', 60, 600000, 3),
(10, 'Reversible', 30, 200000, 3),
(11, 'Bukle ajustable', 50, 300000, 3),
(12, 'Chaps', 200, 1000000, 3),
(13, 'Corredera2957', 60, 60000, 4),
(14, 'Corredera3180', 300, 200000, 4),
(15, 'Doble223', 700, 250000, 4),
(16, 'Doble223', 30, 80000, 4),
(17, 'Thotto', 500, 300000, 5),
(18, 'Adidas', 200, 750000, 5),
(19, 'Rebook', 100, 100000, 5),
(20, 'Altrim', 300, 20000, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos_productos`
--

CREATE TABLE `insumos_productos` (
  `id` int(11) NOT NULL,
  `insumos_id` int(11) NOT NULL,
  `Productos_id` int(11) NOT NULL,
  `Cantidad insumo` float DEFAULT NULL,
  `Fecha_salida_insumo` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `insumos_productos`
--

INSERT INTO `insumos_productos` (`id`, `insumos_id`, `Productos_id`, `Cantidad insumo`, `Fecha_salida_insumo`) VALUES
(1, 19, 1, 5, '2022-09-01'),
(2, 1, 1, 3, '2022-09-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Ciudad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `Nombre`, `Ciudad_id`) VALUES
(1, 'Bosa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `Marca` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `Marca`) VALUES
(1, 'Adidas'),
(2, 'Totto'),
(3, 'Rebook'),
(4, 'Altrim');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `Fecha_creación` date DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Tipo_producto_id` int(11) NOT NULL,
  `Estados_id` int(11) NOT NULL,
  `Marca_id` int(11) NOT NULL,
  `Color_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `Fecha_creación`, `Precio`, `Tipo_producto_id`, `Estados_id`, `Marca_id`, `Color_id`) VALUES
(1, 'Carriel cruzado Femenino', '2022-09-01', 80000, 1, 1, 4, 2),
(2, 'Carriel cruzado  Masculino', '2022-09-01', 80000, 1, 2, 2, 4),
(3, 'Adidas predator Femenino', '2022-09-01', 120000, 4, 1, 1, 2),
(4, 'Adidas preator', '2022-09-01', 120000, 4, 4, 1, 5),
(5, 'Rebook kids', '2022-09-01', 90000, 5, 3, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `nit` varchar(20) DEFAULT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `empresa`, `nit`, `direccion`, `telefono`) VALUES
(1, 'Pcueros', '22222', 'calle 20 # 40 60', '56978447'),
(2, 'Philos', '3243435', 'Cll 20 # 50 87', '3674958'),
(3, 'Pchapas', '232435432', 'clla 80 # 30 47', '2343543'),
(4, 'Phebillas', '23435', 'Cl 234 # 140 90', '234689'),
(5, 'Petiquetas', '3425435', 'Cll 80 # 20 93', '24357655');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_insumos`
--

CREATE TABLE `proveedores_insumos` (
  `id` int(11) NOT NULL,
  `proveedores_id` int(11) NOT NULL,
  `insumos_id` int(11) NOT NULL,
  `Fecha_transaccion` date DEFAULT NULL,
  `Cantidad_Insumo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores_insumos`
--

INSERT INTO `proveedores_insumos` (`id`, `proveedores_id`, `insumos_id`, `Fecha_transaccion`, `Cantidad_Insumo`) VALUES
(1, 1, 1, '2022-09-14', '10'),
(2, 1, 2, '2022-09-30', '30'),
(3, 1, 3, '2022-09-23', '30'),
(4, 1, 4, '2022-09-21', '60'),
(5, 2, 5, '2022-09-23', '35'),
(6, 2, 6, '2022-09-14', '10'),
(7, 2, 7, '2022-09-14', '30'),
(8, 2, 8, '2022-09-06', '70'),
(9, 3, 10, '2022-09-07', '60'),
(10, 3, 10, '2022-09-01', '35'),
(11, 3, 11, '2022-09-02', '60'),
(12, 3, 12, '2022-09-06', '80'),
(13, 4, 13, '2022-09-19', '60'),
(14, 4, 14, '2022-09-08', '30'),
(15, 4, 15, '2022-09-14', '30'),
(16, 4, 16, '2022-09-14', '10'),
(17, 5, 17, '2022-09-19', '30'),
(18, 5, 18, '2022-09-14', '30'),
(19, 5, 19, '2022-09-14', '60'),
(20, 5, 20, '2022-09-13', '35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `Descripcion`) VALUES
(1, 'Cédula de ciudadanía'),
(2, 'Cédula de Extranjería'),
(4, 'Pasaporte'),
(5, 'Permiso de Permanencia'),
(3, 'Tarjeta de identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_entrega`
--

CREATE TABLE `tipo_entrega` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_entrega`
--

INSERT INTO `tipo_entrega` (`id`, `nombre`) VALUES
(1, 'Punto físico'),
(2, 'Pedido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_insumo`
--

CREATE TABLE `tipo_insumo` (
  `id` int(11) NOT NULL,
  `Tipo_insumo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_insumo`
--

INSERT INTO `tipo_insumo` (`id`, `Tipo_insumo`) VALUES
(1, 'Cueros'),
(2, 'Hilos'),
(3, 'Chapas'),
(4, 'Hebillas'),
(5, 'Etiquetas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `id` int(11) NOT NULL,
  `Tipo_producto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`id`, `Tipo_producto`) VALUES
(1, 'Bolso Carriel'),
(2, 'Correa'),
(3, 'Canguro'),
(4, 'Bolso deportivo'),
(5, 'Bolso niños');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Numero_documento` int(11) NOT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `user_name` varchar(25) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `Tipo_Documento_id` int(11) NOT NULL,
  `cargos_Rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Numero_documento`, `nombres`, `apellidos`, `user_name`, `contrasena`, `correo`, `telefono`, `Tipo_Documento_id`, `cargos_Rol_id`) VALUES
(1, 'Diego alexander', 'Triviño ', 'Diedotrivi1', 'Altrim2022*', 'Triviño@hotmail.com', '54354', 1, 1),
(2, 'Hector ', 'Castellanos', 'Kste123', 'Altrim2022*', 'Kste123@gmail.com', '234536', 1, 2),
(3, 'Carlos', 'Rodriguez', 'Carliños10', 'Altrim2022', 'Carliños10@gmail.com', '24357655', 2, 4),
(4, 'Erica', 'Pedraza', 'Erick000', 'Altrim2022', 'Erick000@gmail.com', '24234234', 4, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `Fecha_Venta` datetime(6) DEFAULT NULL,
  `cantidad` int(30) DEFAULT NULL,
  `Descripción` varchar(405) DEFAULT NULL,
  `Fecha_Entrega_pedido` datetime(6) DEFAULT NULL,
  `Productos_id` int(11) NOT NULL,
  `Cliente_id` int(11) NOT NULL,
  `usuarios_Numero_documento` int(11) NOT NULL,
  `usuarios_Tipo_Documento_id` int(11) NOT NULL,
  `Direccion_id` int(11) DEFAULT NULL,
  `Tipo_entrega_id` int(11) NOT NULL,
  `Estado_Venta_id` int(11) NOT NULL,
  `id_Factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `Fecha_Venta`, `cantidad`, `Descripción`, `Fecha_Entrega_pedido`, `Productos_id`, `Cliente_id`, `usuarios_Numero_documento`, `usuarios_Tipo_Documento_id`, `Direccion_id`, `Tipo_entrega_id`, `Estado_Venta_id`, `id_Factura`) VALUES
(1, '2022-09-20 10:56:24.327684', 1, NULL, '2022-09-22 07:15:22.374374', 4, 1, 2, 1, 1, 2, 1, 1),
(2, '2022-09-20 10:56:24.000000', 2, 'Venta recibida por el cliente', '2022-09-22 07:15:22.000000', 5, 1, 2, 1, 1, 2, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Barrio_Localidad1_idx` (`Localidad_id`);

--
-- Indices de la tabla `cargos_rol`
--
ALTER TABLE `cargos_rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`,`Tipo_Documento_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `id_idx` (`id`),
  ADD KEY `fk_Cliente_Tipo_Documento1_idx` (`Tipo_Documento_id`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `Descripcion_UNIQUE` (`Descripcion`),
  ADD KEY `fk_Direccion_Barrio1_idx` (`Barrio_id`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_idx` (`id`),
  ADD KEY `fk_insumos_Tipo_Insumo1` (`Tipo_Insumo_id`);

--
-- Indices de la tabla `insumos_productos`
--
ALTER TABLE `insumos_productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Insumos_Productos_insumos1_idx` (`insumos_id`),
  ADD KEY `fk_Insumos_Productos_Productos1_idx` (`Productos_id`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `Localidad_UNIQUE` (`Nombre`),
  ADD KEY `fk_Localidad_Ciudad1_idx` (`Ciudad_id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_idx` (`id`),
  ADD KEY `fk_Productos_Estados1_idx` (`Estados_id`),
  ADD KEY `fk_Productos_Marca1_idx` (`Marca_id`),
  ADD KEY `fk_Productos_Color1_idx` (`Color_id`),
  ADD KEY `fk_Productos_Tipo_producto1` (`Tipo_producto_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveedores_insumos`
--
ALTER TABLE `proveedores_insumos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Proveedores_Insumos_proveedores1_idx` (`proveedores_id`),
  ADD KEY `fk_Proveedores_Insumos_insumos1_idx` (`insumos_id`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `Descripcion_UNIQUE` (`Descripcion`);

--
-- Indices de la tabla `tipo_entrega`
--
ALTER TABLE `tipo_entrega`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `tipo_insumo`
--
ALTER TABLE `tipo_insumo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Numero_documento`,`Tipo_Documento_id`),
  ADD KEY `fk_usuarios_Tipo_Documento_idx` (`Tipo_Documento_id`),
  ADD KEY `fk_usuarios_cargos_Rol1_idx` (`cargos_Rol_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Ventas_Productos1_idx` (`Productos_id`),
  ADD KEY `fk_Ventas_Cliente1_idx` (`Cliente_id`),
  ADD KEY `fk_Ventas_usuarios1_idx` (`usuarios_Numero_documento`,`usuarios_Tipo_Documento_id`),
  ADD KEY `fk_Ventas_Direccion1_idx` (`Direccion_id`),
  ADD KEY `fk_Ventas_Tipo_entrega1_idx` (`Tipo_entrega_id`),
  ADD KEY `fk_Ventas_Estado_Venta1_idx` (`Estado_Venta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barrio`
--
ALTER TABLE `barrio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estado_venta`
--
ALTER TABLE `estado_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `insumos_productos`
--
ALTER TABLE `insumos_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_entrega`
--
ALTER TABLE `tipo_entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `barrio`
--
ALTER TABLE `barrio`
  ADD CONSTRAINT `fk_Barrio_Localidad1` FOREIGN KEY (`Localidad_id`) REFERENCES `localidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_Cliente_Tipo_Documento1` FOREIGN KEY (`Tipo_Documento_id`) REFERENCES `tipo_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_Direccion_Barrio1` FOREIGN KEY (`Barrio_id`) REFERENCES `barrio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD CONSTRAINT `fk_insumos_Tipo_Insumo1` FOREIGN KEY (`Tipo_Insumo_id`) REFERENCES `tipo_insumo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `insumos_productos`
--
ALTER TABLE `insumos_productos`
  ADD CONSTRAINT `fk_Insumos_Productos_Productos1` FOREIGN KEY (`Productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Insumos_Productos_insumos1` FOREIGN KEY (`insumos_id`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `fk_Localidad_Ciudad1` FOREIGN KEY (`Ciudad_id`) REFERENCES `ciudad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Productos_Color1` FOREIGN KEY (`Color_id`) REFERENCES `color` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Estados1` FOREIGN KEY (`Estados_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Marca1` FOREIGN KEY (`Marca_id`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Productos_Tipo_producto1` FOREIGN KEY (`Tipo_producto_id`) REFERENCES `tipo_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedores_insumos`
--
ALTER TABLE `proveedores_insumos`
  ADD CONSTRAINT `fk_Proveedores_Insumos_insumos1` FOREIGN KEY (`insumos_id`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Proveedores_Insumos_proveedores1` FOREIGN KEY (`proveedores_id`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_Tipo_Documento` FOREIGN KEY (`Tipo_Documento_id`) REFERENCES `tipo_documento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuarios_cargos_Rol1` FOREIGN KEY (`cargos_Rol_id`) REFERENCES `cargos_rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_Ventas_Cliente1` FOREIGN KEY (`Cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ventas_Direccion1` FOREIGN KEY (`Direccion_id`) REFERENCES `direccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ventas_Estado_Venta1` FOREIGN KEY (`Estado_Venta_id`) REFERENCES `estado_venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ventas_Productos1` FOREIGN KEY (`Productos_id`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ventas_Tipo_entrega1` FOREIGN KEY (`Tipo_entrega_id`) REFERENCES `tipo_entrega` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Ventas_usuarios1` FOREIGN KEY (`usuarios_Numero_documento`,`usuarios_Tipo_Documento_id`) REFERENCES `usuarios` (`Numero_documento`, `Tipo_Documento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
