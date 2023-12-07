-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2023 a las 04:48:55
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `codecampus`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_comentarios`
--

CREATE TABLE `t_comentarios` (
  `id_comentario` int(11) NOT NULL,
  `contenido` text DEFAULT NULL,
  `fecha_comentario` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_comentarios`
--

INSERT INTO `t_comentarios` (`id_comentario`, `contenido`, `fecha_comentario`, `user_id`, `post_id`) VALUES
(1, 'hahahah thats quite meme', '2023-12-07 00:45:28', 1, 1),
(2, 'Dang thats my favourite streamer too', '2023-12-07 00:45:28', 2, 4),
(3, 'OMG is this fr?', '2023-12-07 00:45:28', 3, 5),
(4, 'do not remind me that, ;(', '2023-12-07 00:45:28', 4, 7),
(5, 'hahahah thats quite meme', '2023-12-07 00:46:15', 1, 1),
(6, 'Dang thats my favourite streamer too', '2023-12-07 00:46:15', 2, 4),
(7, 'OMG is this fr?', '2023-12-07 00:46:15', 3, 5),
(8, 'do not remind me that, ;(', '2023-12-07 00:46:15', 4, 7);

--
-- Disparadores `t_comentarios`
--
DELIMITER $$
CREATE TRIGGER `insertar_comentario` AFTER INSERT ON `t_comentarios` FOR EACH ROW BEGIN
    INSERT INTO t_usuarios_comentarios (Accion, Fecha_hora)
    VALUES (
        CONCAT(
            'Comentario realizado: [ID: ', NEW.id_comentario, ', Usuario ID: ', NEW.user_id, ', Post ID: ', NEW.post_id, ', Contenido: ', NEW.contenido, ']'
        ),
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_imagenes`
--

CREATE TABLE `t_imagenes` (
  `id_imagen` int(11) NOT NULL,
  `nombre_archivo` varchar(100) DEFAULT NULL,
  `ruta_archivo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_imagenes`
--

INSERT INTO `t_imagenes` (`id_imagen`, `nombre_archivo`, `ruta_archivo`) VALUES
(1, 'pfp 1.jpeg', '/Downloads/pfp 1.jpeg'),
(2, 'pfp 2.jpeg', '/Downloads/pfp 2.jpeg'),
(3, 'pfp 3.jpeg', '/Downloads/pfp 3.jpeg'),
(4, 'pfp 4.jpeg', '/Downloads/pfp 4.jpeg'),
(5, 'post1.jpeg', '/Downloads/post1.jpeg'),
(6, 'post2.jpeg', '/Downloads/post2.jpeg'),
(7, 'post3.jpeg', '/Downloads/post3.jpeg'),
(8, 'post4.jpeg', '/Downloads/post4.jpeg'),
(9, 'postryan.jpeg', '/Downloads/postryan.jpeg'),
(10, 'postninja.jpeg', '/Downloads/postninja.jpeg'),
(11, 'postgwen.jpeg', '/Downloads/postgwen.jpeg'),
(12, 'postchicken.jpeg', '/Downloads/postchicken.jpeg'),
(13, 'pfp 1.jpeg', '/Downloads/pfp 1.jpeg'),
(14, 'pfp 2.jpeg', '/Downloads/pfp 2.jpeg'),
(15, 'pfp 3.jpeg', '/Downloads/pfp 3.jpeg'),
(16, 'pfp 4.jpeg', '/Downloads/pfp 4.jpeg'),
(17, 'post1.jpeg', '/Downloads/post1.jpeg'),
(18, 'post2.jpeg', '/Downloads/post2.jpeg'),
(19, 'post3.jpeg', '/Downloads/post3.jpeg'),
(20, 'post4.jpeg', '/Downloads/post4.jpeg'),
(21, 'postryan.jpeg', '/Downloads/postryan.jpeg'),
(22, 'postninja.jpeg', '/Downloads/postninja.jpeg'),
(23, 'postgwen.jpeg', '/Downloads/postgwen.jpeg'),
(24, 'postchicken.jpeg', '/Downloads/postchicken.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_likes`
--

CREATE TABLE `t_likes` (
  `id_like` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_likes`
--

INSERT INTO `t_likes` (`id_like`, `user_id`, `post_id`, `comment_id`) VALUES
(1, 1, 1, NULL),
(2, 2, 2, NULL),
(3, 3, 3, NULL),
(4, 4, 4, NULL),
(5, 4, 5, NULL),
(6, 3, 6, NULL),
(7, 2, 7, NULL),
(8, 1, 8, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_persona_seguidos`
--

CREATE TABLE `t_persona_seguidos` (
  `id_persona_seguidos` int(11) NOT NULL,
  `Accion` varchar(255) DEFAULT NULL,
  `Fecha_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_persona_seguidos`
--

INSERT INTO `t_persona_seguidos` (`id_persona_seguidos`, `Accion`, `Fecha_hora`) VALUES
(1, 'El usuario Usuario1 ha seguido a Usuario2', '2023-12-06 18:46:15'),
(2, 'El usuario Usuario2 ha seguido a Usuario3', '2023-12-06 18:46:15'),
(3, 'El usuario Usuario3 ha seguido a Usuario4', '2023-12-06 18:46:15'),
(4, 'El usuario Usuario4 ha seguido a Usuario1', '2023-12-06 18:46:15'),
(5, 'El usuario Usuario1 ha seguido a Usuario3', '2023-12-06 18:46:15'),
(6, 'El usuario Usuario1 ha seguido a Usuario4', '2023-12-06 18:46:15'),
(7, 'El usuario Usuario2 ha seguido a Usuario1', '2023-12-06 18:46:15'),
(8, 'El usuario Usuario2 ha seguido a Usuario4', '2023-12-06 18:46:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_publicaciones`
--

CREATE TABLE `t_publicaciones` (
  `id_publicacion` int(11) NOT NULL,
  `contenido_texto` text DEFAULT NULL,
  `fecha_publicacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `imagen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_publicaciones`
--

INSERT INTO `t_publicaciones` (`id_publicacion`, `contenido_texto`, `fecha_publicacion`, `user_id`, `imagen_id`) VALUES
(1, 'OMG look at this awesomely fortnite meme', '2023-12-07 00:45:28', 1, 5),
(2, 'this is literally me', '2023-12-07 00:45:28', 1, 9),
(3, 'Fortnite good im into!', '2023-12-07 00:45:28', 2, 6),
(4, 'My favourite streamer now on fortnite!!', '2023-12-07 00:45:28', 2, 10),
(5, 'Invencible in fortnite? i cant believe it', '2023-12-07 00:45:28', 3, 7),
(6, 'Gwen from spiderman? looking good', '2023-12-07 00:45:28', 3, 11),
(7, 'I miss this from fortnite', '2023-12-07 00:45:28', 4, 8),
(8, 'Gotta have hungry', '2023-12-07 00:45:28', 4, 12),
(9, 'OMG look at this awesomely fortnite meme', '2023-12-07 00:46:15', 1, 5),
(10, 'this is literally me', '2023-12-07 00:46:15', 1, 9),
(11, 'Fortnite good im into!', '2023-12-07 00:46:15', 2, 6),
(12, 'My favourite streamer now on fortnite!!', '2023-12-07 00:46:15', 2, 10),
(13, 'Invencible in fortnite? i cant believe it', '2023-12-07 00:46:15', 3, 7),
(14, 'Gwen from spiderman? looking good', '2023-12-07 00:46:15', 3, 11),
(15, 'I miss this from fortnite', '2023-12-07 00:46:15', 4, 8),
(16, 'Gotta have hungry', '2023-12-07 00:46:15', 4, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_seguidores`
--

CREATE TABLE `t_seguidores` (
  `id_seguidores` int(11) NOT NULL,
  `seguidor_id` int(11) NOT NULL,
  `usuario_seguido_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_seguidores`
--

INSERT INTO `t_seguidores` (`id_seguidores`, `seguidor_id`, `usuario_seguido_id`) VALUES
(1, 1, 2),
(5, 1, 3),
(6, 1, 4),
(7, 2, 1),
(2, 2, 3),
(8, 2, 4),
(3, 3, 4),
(4, 4, 1);

--
-- Disparadores `t_seguidores`
--
DELIMITER $$
CREATE TRIGGER `registrar_seguidor` AFTER INSERT ON `t_seguidores` FOR EACH ROW BEGIN
    DECLARE seguidor_nombre VARCHAR(100);
    DECLARE seguido_nombre VARCHAR(100);

    -- Obtener los nombres de las personas que están siguiendo y siendo seguidas
    SELECT nombre INTO seguidor_nombre FROM t_usuarios WHERE id_usuario = NEW.seguidor_id;
    SELECT nombre INTO seguido_nombre FROM t_usuarios WHERE id_usuario = NEW.usuario_seguido_id;

    -- Registrar la acción en la tabla t_persona_seguidos
    INSERT INTO t_persona_seguidos (Accion, Fecha_hora)
    VALUES (CONCAT('El usuario ', seguidor_nombre, ' ha seguido a ', seguido_nombre), NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuarios`
--

CREATE TABLE `t_usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `expediente` int(11) NOT NULL,
  `contrasenia` varchar(35) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  `url_foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_usuarios`
--

INSERT INTO `t_usuarios` (`id_usuario`, `nombre`, `correo`, `expediente`, `contrasenia`, `fecha_registro`, `url_foto`) VALUES
(1, 'Usuario1', 'usuario1@example.com', 12345, 'contrasenia1', '2023-12-07 00:45:28', 'pfp 1.jpeg'),
(2, 'Usuario2', 'usuario2@example.com', 67890, 'contrasenia2', '2023-12-07 00:45:28', 'pfp 2.jpeg'),
(3, 'Usuario3', 'usuario3@example.com', 54321, 'contrasenia3', '2023-12-07 00:45:28', 'pfp 3.jpeg'),
(4, 'Usuario4', 'usuario4@example.com', 98765, 'contrasenia4', '2023-12-07 00:45:28', 'pfp 4.jpeg'),
(5, 'Usuario1', 'usuario1@example.com', 12345, 'contrasenia1', '2023-12-07 00:46:15', 'pfp 1.jpeg'),
(6, 'Usuario2', 'usuario2@example.com', 67890, 'contrasenia2', '2023-12-07 00:46:15', 'pfp 2.jpeg'),
(7, 'Usuario3', 'usuario3@example.com', 54321, 'contrasenia3', '2023-12-07 00:46:15', 'pfp 3.jpeg'),
(8, 'Usuario4', 'usuario4@example.com', 98765, 'contrasenia4', '2023-12-07 00:46:15', 'pfp 4.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuarios_comentarios`
--

CREATE TABLE `t_usuarios_comentarios` (
  `id_usuarios_comentarios` int(11) NOT NULL,
  `Accion` varchar(80) DEFAULT NULL,
  `Fecha_hora` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_usuarios_comentarios`
--

INSERT INTO `t_usuarios_comentarios` (`id_usuarios_comentarios`, `Accion`, `Fecha_hora`) VALUES
(1, 'Comentario realizado: [ID: 1, Usuario ID: 1, Post ID: 1, Contenido: hahahah that', '2023-12-06 18:45:28'),
(2, 'Comentario realizado: [ID: 2, Usuario ID: 2, Post ID: 4, Contenido: Dang thats m', '2023-12-06 18:45:28'),
(3, 'Comentario realizado: [ID: 3, Usuario ID: 3, Post ID: 5, Contenido: OMG is this ', '2023-12-06 18:45:28'),
(4, 'Comentario realizado: [ID: 4, Usuario ID: 4, Post ID: 7, Contenido: do not remin', '2023-12-06 18:45:28'),
(5, 'Comentario realizado: [ID: 5, Usuario ID: 1, Post ID: 1, Contenido: hahahah that', '2023-12-06 18:46:15'),
(6, 'Comentario realizado: [ID: 6, Usuario ID: 2, Post ID: 4, Contenido: Dang thats m', '2023-12-06 18:46:15'),
(7, 'Comentario realizado: [ID: 7, Usuario ID: 3, Post ID: 5, Contenido: OMG is this ', '2023-12-06 18:46:15'),
(8, 'Comentario realizado: [ID: 8, Usuario ID: 4, Post ID: 7, Contenido: do not remin', '2023-12-06 18:46:15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_comentarios`
--
ALTER TABLE `t_comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indices de la tabla `t_imagenes`
--
ALTER TABLE `t_imagenes`
  ADD PRIMARY KEY (`id_imagen`);

--
-- Indices de la tabla `t_likes`
--
ALTER TABLE `t_likes`
  ADD PRIMARY KEY (`id_like`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indices de la tabla `t_persona_seguidos`
--
ALTER TABLE `t_persona_seguidos`
  ADD PRIMARY KEY (`id_persona_seguidos`);

--
-- Indices de la tabla `t_publicaciones`
--
ALTER TABLE `t_publicaciones`
  ADD PRIMARY KEY (`id_publicacion`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `imagen_id` (`imagen_id`);

--
-- Indices de la tabla `t_seguidores`
--
ALTER TABLE `t_seguidores`
  ADD PRIMARY KEY (`id_seguidores`),
  ADD UNIQUE KEY `seguidor_usuario_seguido` (`seguidor_id`,`usuario_seguido_id`),
  ADD KEY `usuario_seguido_id` (`usuario_seguido_id`);

--
-- Indices de la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `t_usuarios_comentarios`
--
ALTER TABLE `t_usuarios_comentarios`
  ADD PRIMARY KEY (`id_usuarios_comentarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_comentarios`
--
ALTER TABLE `t_comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `t_imagenes`
--
ALTER TABLE `t_imagenes`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `t_likes`
--
ALTER TABLE `t_likes`
  MODIFY `id_like` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `t_persona_seguidos`
--
ALTER TABLE `t_persona_seguidos`
  MODIFY `id_persona_seguidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `t_publicaciones`
--
ALTER TABLE `t_publicaciones`
  MODIFY `id_publicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `t_seguidores`
--
ALTER TABLE `t_seguidores`
  MODIFY `id_seguidores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `t_usuarios`
--
ALTER TABLE `t_usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `t_usuarios_comentarios`
--
ALTER TABLE `t_usuarios_comentarios`
  MODIFY `id_usuarios_comentarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_comentarios`
--
ALTER TABLE `t_comentarios`
  ADD CONSTRAINT `t_comentarios_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_usuarios` (`id_usuario`),
  ADD CONSTRAINT `t_comentarios_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `t_publicaciones` (`id_publicacion`);

--
-- Filtros para la tabla `t_likes`
--
ALTER TABLE `t_likes`
  ADD CONSTRAINT `fk_comentario_like` FOREIGN KEY (`comment_id`) REFERENCES `t_comentarios` (`id_comentario`),
  ADD CONSTRAINT `fk_publicacion_like` FOREIGN KEY (`post_id`) REFERENCES `t_publicaciones` (`id_publicacion`),
  ADD CONSTRAINT `fk_usuario_like` FOREIGN KEY (`user_id`) REFERENCES `t_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `t_publicaciones`
--
ALTER TABLE `t_publicaciones`
  ADD CONSTRAINT `fk_imagen_publicacion` FOREIGN KEY (`imagen_id`) REFERENCES `t_imagenes` (`id_imagen`),
  ADD CONSTRAINT `fk_user_publicacion` FOREIGN KEY (`user_id`) REFERENCES `t_usuarios` (`id_usuario`);

--
-- Filtros para la tabla `t_seguidores`
--
ALTER TABLE `t_seguidores`
  ADD CONSTRAINT `fk_seguidor_usuario` FOREIGN KEY (`seguidor_id`) REFERENCES `t_usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_usuario_seguido` FOREIGN KEY (`usuario_seguido_id`) REFERENCES `t_usuarios` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
