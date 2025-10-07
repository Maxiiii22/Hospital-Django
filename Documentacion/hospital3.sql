-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.43 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para hospitalbd
CREATE DATABASE IF NOT EXISTS `hospitalbd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospitalbd`;

-- Volcando estructura para tabla hospitalbd.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.auth_group: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.auth_group_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.auth_permission: ~76 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add content type', 4, 'add_contenttype'),
	(14, 'Can change content type', 4, 'change_contenttype'),
	(15, 'Can delete content type', 4, 'delete_contenttype'),
	(16, 'Can view content type', 4, 'view_contenttype'),
	(17, 'Can add session', 5, 'add_session'),
	(18, 'Can change session', 5, 'change_session'),
	(19, 'Can delete session', 5, 'delete_session'),
	(20, 'Can view session', 5, 'view_session'),
	(21, 'Can add roles', 6, 'add_roles'),
	(22, 'Can change roles', 6, 'change_roles'),
	(23, 'Can delete roles', 6, 'delete_roles'),
	(24, 'Can view roles', 6, 'view_roles'),
	(25, 'Can add user', 7, 'add_persona'),
	(26, 'Can change user', 7, 'change_persona'),
	(27, 'Can delete user', 7, 'delete_persona'),
	(28, 'Can view user', 7, 'view_persona'),
	(29, 'Can add usuario', 8, 'add_usuario'),
	(30, 'Can change usuario', 8, 'change_usuario'),
	(31, 'Can delete usuario', 8, 'delete_usuario'),
	(32, 'Can view usuario', 8, 'view_usuario'),
	(33, 'Can add paciente', 9, 'add_paciente'),
	(34, 'Can change paciente', 9, 'change_paciente'),
	(35, 'Can delete paciente', 9, 'delete_paciente'),
	(36, 'Can view paciente', 9, 'view_paciente'),
	(37, 'Can add menor a cargo de paciente', 10, 'add_menoracargodepaciente'),
	(38, 'Can change menor a cargo de paciente', 10, 'change_menoracargodepaciente'),
	(39, 'Can delete menor a cargo de paciente', 10, 'delete_menoracargodepaciente'),
	(40, 'Can view menor a cargo de paciente', 10, 'view_menoracargodepaciente'),
	(41, 'Can add departamento', 11, 'add_departamento'),
	(42, 'Can change departamento', 11, 'change_departamento'),
	(43, 'Can delete departamento', 11, 'delete_departamento'),
	(44, 'Can view departamento', 11, 'view_departamento'),
	(45, 'Can add jorna_laboral', 12, 'add_jorna_laboral'),
	(46, 'Can change jorna_laboral', 12, 'change_jorna_laboral'),
	(47, 'Can delete jorna_laboral', 12, 'delete_jorna_laboral'),
	(48, 'Can view jorna_laboral', 12, 'view_jorna_laboral'),
	(49, 'Can add especialidades', 13, 'add_especialidades'),
	(50, 'Can change especialidades', 13, 'change_especialidades'),
	(51, 'Can delete especialidades', 13, 'delete_especialidades'),
	(52, 'Can view especialidades', 13, 'view_especialidades'),
	(53, 'Can add usuario x especialidad', 14, 'add_usuarioxespecialidad'),
	(54, 'Can change usuario x especialidad', 14, 'change_usuarioxespecialidad'),
	(55, 'Can delete usuario x especialidad', 14, 'delete_usuarioxespecialidad'),
	(56, 'Can view usuario x especialidad', 14, 'view_usuarioxespecialidad'),
	(57, 'Can add usuario x departamento x jornada', 15, 'add_usuarioxdepartamentoxjornada'),
	(58, 'Can change usuario x departamento x jornada', 15, 'change_usuarioxdepartamentoxjornada'),
	(59, 'Can delete usuario x departamento x jornada', 15, 'delete_usuarioxdepartamentoxjornada'),
	(60, 'Can view usuario x departamento x jornada', 15, 'view_usuarioxdepartamentoxjornada'),
	(61, 'Can add turno', 16, 'add_turno'),
	(62, 'Can change turno', 16, 'change_turno'),
	(63, 'Can delete turno', 16, 'delete_turno'),
	(64, 'Can view turno', 16, 'view_turno'),
	(65, 'Can add consultas', 17, 'add_consultas'),
	(66, 'Can change consultas', 17, 'change_consultas'),
	(67, 'Can delete consultas', 17, 'delete_consultas'),
	(68, 'Can view consultas', 17, 'view_consultas'),
	(69, 'Can add estudios', 18, 'add_estudios'),
	(70, 'Can change estudios', 18, 'change_estudios'),
	(71, 'Can delete estudios', 18, 'delete_estudios'),
	(72, 'Can view estudios', 18, 'view_estudios'),
	(73, 'Can add medicaciones', 19, 'add_medicaciones'),
	(74, 'Can change medicaciones', 19, 'change_medicaciones'),
	(75, 'Can delete medicaciones', 19, 'delete_medicaciones'),
	(76, 'Can view medicaciones', 19, 'view_medicaciones'),
	(77, 'Can add turno estudio', 20, 'add_turnoestudio'),
	(78, 'Can change turno estudio', 20, 'change_turnoestudio'),
	(79, 'Can delete turno estudio', 20, 'delete_turnoestudio'),
	(80, 'Can view turno estudio', 20, 'view_turnoestudio'),
	(81, 'Can add resultado estudio', 21, 'add_resultadoestudio'),
	(82, 'Can change resultado estudio', 21, 'change_resultadoestudio'),
	(83, 'Can delete resultado estudio', 21, 'delete_resultadoestudio'),
	(84, 'Can view resultado estudio', 21, 'view_resultadoestudio'),
	(85, 'Can add orden estudio', 22, 'add_ordenestudio'),
	(86, 'Can change orden estudio', 22, 'change_ordenestudio'),
	(87, 'Can delete orden estudio', 22, 'delete_ordenestudio'),
	(88, 'Can view orden estudio', 22, 'view_ordenestudio');

-- Volcando estructura para tabla hospitalbd.controlusuario_persona
CREATE TABLE IF NOT EXISTS `controlusuario_persona` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `dni` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `login_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `login_id` (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_persona: ~9 rows (aproximadamente)
INSERT INTO `controlusuario_persona` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `login_id`, `fecha_nacimiento`, `sexo`, `telefono`) VALUES
	(1, 'pbkdf2_sha256$870000$GGbCB1mymQJbwaVZXchTHy$LXGMcF8sov9o8Eh05sQrpFyX23/SkSw18vv8pB6sczI=', '2025-08-28 18:33:43.144325', 1, 'Jose', 'Perez', 'jperez@gmail.com', 1, 1, '2025-08-19 22:52:59.000000', '37567897', '1000', '1992-05-10', 'M', '25160870'),
	(2, 'pbkdf2_sha256$870000$NsosCrqR9ww5ZbsEs7eTz6$ToHmdzq0t5O5qoqmn9HYcQtw+/UFKdWYEskHXtRmDno=', '2025-08-28 18:31:44.357223', 0, 'Micaela', 'Garcia', 'micaela@gmail.com', 0, 1, '2025-08-19 23:08:06.577081', '45912425', '1005', '2000-02-01', 'F', '25160875'),
	(3, 'pbkdf2_sha256$870000$3TBe6lY1gM4Vir7ltj5NZe$YDWjYc/eOa0ehi7QoqpnfX8iFZUKRWPkcri9HKlZ+18=', '2025-08-29 19:17:51.031444', 0, 'Maximiliano', 'Acuña', 'maxi@gmail.com', 0, 1, '2025-08-19 23:11:35.373129', '45912350', 'maxi@gmail.com', '2004-06-29', 'M', '25162249'),
	(4, '', NULL, 0, 'Pepe', 'Acuña', '', 0, 1, '2025-08-19 23:12:35.737969', '65321456', NULL, '2015-02-02', 'M', NULL),
	(5, '', NULL, 0, 'Natalia', 'Acuña', '', 0, 1, '2025-08-19 23:13:25.891577', '65321457', NULL, '2015-02-02', 'F', NULL),
	(6, 'pbkdf2_sha256$870000$HrgM5bFx5m6z9LSRNAp6cw$zlBioy/+hpNBj/A+/TzwWJa77f2jhfnH8E8WZzsrCAI=', NULL, 0, 'Roberto', 'Lopez', 'roberto@gmail.com', 0, 1, '2025-08-21 02:43:55.662151', '37567341', '1006', '1990-05-05', 'M', '25243555'),
	(7, '', NULL, 0, 'Lola', 'Acuña', '', 0, 1, '2025-08-22 22:12:12.074198', '65321458', NULL, '2015-02-02', 'F', NULL),
	(8, '', NULL, 0, 'Lolo', 'Acuña', '', 0, 1, '2025-08-22 22:46:20.819708', '65321459', NULL, '2015-02-02', 'M', NULL),
	(9, 'pbkdf2_sha256$870000$kFk3w2D2TVaeemc0BAR9Or$fy0VxeYIXRTsNWfJkaH6M0WzAeZcp9svSF06tAid60g=', '2025-08-29 18:28:18.423756', 0, 'Horacio', 'Gutiérrez', 'horacio@gmail.com', 0, 1, '2025-08-28 18:35:40.780210', '37567231', '1007', '1997-05-07', 'M', '34466776');

-- Volcando estructura para tabla hospitalbd.controlusuario_persona_groups
CREATE TABLE IF NOT EXISTS `controlusuario_persona_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `persona_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `controlUsuario_persona_groups_persona_id_group_id_63136a5a_uniq` (`persona_id`,`group_id`),
  KEY `controlUsuario_persona_groups_group_id_d8f5f8fd_fk_auth_group_id` (`group_id`),
  CONSTRAINT `controlUsuario_perso_persona_id_9653895e_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`),
  CONSTRAINT `controlUsuario_persona_groups_group_id_d8f5f8fd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_persona_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.controlusuario_persona_user_permissions
CREATE TABLE IF NOT EXISTS `controlusuario_persona_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `persona_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `controlUsuario_persona_u_persona_id_permission_id_680a1b3d_uniq` (`persona_id`,`permission_id`),
  KEY `controlUsuario_perso_permission_id_4f00a6b1_fk_auth_perm` (`permission_id`),
  CONSTRAINT `controlUsuario_perso_permission_id_4f00a6b1_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `controlUsuario_perso_persona_id_67a51105_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_persona_user_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.controlusuario_roles
CREATE TABLE IF NOT EXISTS `controlusuario_roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_roles: ~2 rows (aproximadamente)
INSERT INTO `controlusuario_roles` (`id`, `nombre_rol`) VALUES
	(1, 'Superadministrador'),
	(2, 'Médico');

-- Volcando estructura para tabla hospitalbd.controlusuario_usuario
CREATE TABLE IF NOT EXISTS `controlusuario_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero_matricula` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `debe_cambiar_contraseña` tinyint(1) NOT NULL,
  `persona_id` bigint NOT NULL,
  `rol_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  UNIQUE KEY `numero_matricula` (`numero_matricula`),
  KEY `controlUsuario_usuar_rol_id_630f1eb0_fk_controlUs` (`rol_id`),
  CONSTRAINT `controlUsuario_usuar_persona_id_60479e85_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`),
  CONSTRAINT `controlUsuario_usuar_rol_id_630f1eb0_fk_controlUs` FOREIGN KEY (`rol_id`) REFERENCES `controlusuario_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuario: ~4 rows (aproximadamente)
INSERT INTO `controlusuario_usuario` (`id`, `numero_matricula`, `debe_cambiar_contraseña`, `persona_id`, `rol_id`) VALUES
	(1, NULL, 0, 1, 1),
	(2, '10000', 1, 2, 2),
	(3, '10015', 1, 6, 2),
	(4, '10100', 1, 9, 2);

-- Volcando estructura para tabla hospitalbd.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_controlUsuario_persona_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_controlUsuario_persona_id` FOREIGN KEY (`user_id`) REFERENCES `controlusuario_persona` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_admin_log: ~39 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-08-19 22:54:31.589739', '1', 'Jose Perez (1000)', 2, '[{"changed": {"fields": ["Email address", "Dni", "Fecha nacimiento", "Sexo", "Telefono"]}}]', 7, 1),
	(2, '2025-08-19 22:56:24.461564', '1', 'Usuario: 1 - Jose Perez - Legajo hospitalario: 1000', 1, '[{"added": {}}]', 8, 1),
	(3, '2025-08-19 23:09:41.046019', '1', 'Usuario: Micaela Garcia - N° Legajo: 1005 - Especialidad: Dermatología Estética - N° Matricula: 10000', 1, '[{"added": {}}]', 14, 1),
	(4, '2025-08-19 23:09:54.411342', '1', 'Departamento: Dermatología', 1, '[{"added": {}}]', 15, 1),
	(5, '2025-08-19 23:10:02.537562', '2', 'Departamento: Dermatología', 1, '[{"added": {}}]', 15, 1),
	(6, '2025-08-21 02:46:08.734072', '2', 'Usuario: Roberto Lopez - N° Legajo: 1006 - Especialidad: Dermatología Estética - N° Matricula: 10015', 1, '[{"added": {}}]', 14, 1),
	(7, '2025-08-21 02:46:34.248126', '3', 'Departamento: Dermatología', 1, '[{"added": {}}]', 15, 1),
	(8, '2025-08-23 18:50:15.082275', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 16, 1),
	(9, '2025-08-23 18:50:57.461290', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(10, '2025-08-23 18:53:35.982918', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 16, 1),
	(11, '2025-08-23 19:16:26.510302', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(12, '2025-08-23 19:25:43.342976', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(13, '2025-08-23 21:10:18.340272', '1', 'ID turno: 1, Estado: atendido', 2, '[{"changed": {"fields": ["Estado"]}}]', 16, 1),
	(14, '2025-08-23 21:13:27.438037', '1', 'ID turno: 1, Estado: atendido', 2, '[{"changed": {"fields": ["Asistio"]}}]', 16, 1),
	(15, '2025-08-25 23:55:15.344261', '2', 'ID turno: 2, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 16, 1),
	(16, '2025-08-25 23:57:01.748865', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 16, 1),
	(17, '2025-08-26 00:30:29.296892', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 16, 1),
	(18, '2025-08-26 00:32:17.032153', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 16, 1),
	(19, '2025-08-26 00:32:44.524932', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 16, 1),
	(20, '2025-08-26 00:33:11.149282', '4', 'ID turno: 4, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 16, 1),
	(21, '2025-08-26 20:37:29.890734', '2', 'ID turno: 2, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(22, '2025-08-26 20:38:21.318792', '2', 'ID turno: 2, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(23, '2025-08-26 20:38:28.951246', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(24, '2025-08-26 21:28:08.202433', '1', 'ID turno: 1, Estado: atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(25, '2025-08-26 21:28:20.897336', '2', 'ID turno: 2, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(26, '2025-08-26 21:28:35.432730', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(27, '2025-08-26 21:28:52.401191', '4', 'ID turno: 4, Estado: cancelado', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(28, '2025-08-26 21:29:55.830110', '4', 'ID turno: 4, Estado: cancelado', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(29, '2025-08-26 21:30:49.105793', '4', 'ID turno: 4, Estado: cancelado', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(30, '2025-08-27 21:59:42.808477', '4', 'El usuario 3 trabaja los dias viernes en el Departamento: Dermatología', 1, '[{"added": {}}]', 15, 1),
	(31, '2025-08-28 18:48:10.663825', '3', 'Usuario: Horacio Gutiérrez - N° Legajo: 1007 - Especialidad: Endocrinología - N° Matricula: 10100', 1, '[{"added": {}}]', 14, 1),
	(32, '2025-08-28 18:49:12.781458', '5', 'El usuario 4 trabaja los dias lunes en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 15, 1),
	(33, '2025-08-28 18:56:07.633479', '5', 'ID turno: 5, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 16, 1),
	(34, '2025-08-28 20:21:07.189038', '1', 'Medicamento: Hidrocortisona 1% crema', 2, '[{"changed": {"fields": ["Recetada por"]}}]', 19, 1),
	(35, '2025-08-28 22:11:33.229429', '4', 'Consulta del turno 5 - 2025-08-28 22:09:42.957464+00:00', 3, '', 17, 1),
	(36, '2025-08-28 22:11:33.229429', '3', 'Consulta del turno 5 - 2025-08-28 22:07:37.497893+00:00', 3, '', 17, 1),
	(37, '2025-08-28 22:12:22.167206', '5', 'Consulta del turno 5 - 2025-08-28 22:11:41.762302+00:00', 3, '', 17, 1),
	(38, '2025-08-28 23:59:40.377100', '6', 'ID turno: 6, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 16, 1),
	(39, '2025-08-29 00:08:01.427448', '6', 'ID turno: 6, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 16, 1),
	(40, '2025-08-29 20:26:10.234638', '13', 'ID especialidad 13 - Nombre: Radiología General - Departamento: Radiología y Diagnóstico por Imagen', 2, '[{"changed": {"fields": ["Tipo atencion"]}}]', 13, 1),
	(41, '2025-08-29 20:26:21.721472', '14', 'ID especialidad 14 - Nombre: Resonancia Magnética (RM) - Departamento: Radiología y Diagnóstico por Imagen', 2, '[{"changed": {"fields": ["Tipo atencion"]}}]', 13, 1),
	(42, '2025-08-29 20:26:32.257323', '15', 'ID especialidad 15 - Nombre: Ecografía/Doppler - Departamento: Radiología y Diagnóstico por Imagen', 2, '[{"changed": {"fields": ["Tipo atencion"]}}]', 13, 1),
	(43, '2025-08-29 20:26:41.860919', '16', 'ID especialidad 16 - Nombre: Mamografía - Departamento: Radiología y Diagnóstico por Imagen', 2, '[{"changed": {"fields": ["Tipo atencion"]}}]', 13, 1),
	(44, '2025-08-29 20:26:51.777891', '17', 'ID especialidad 17 - Nombre: Bioquímica Clínica - Departamento: Laboratorio Clínico', 2, '[{"changed": {"fields": ["Tipo atencion"]}}]', 13, 1),
	(45, '2025-08-29 20:27:00.883600', '18', 'ID especialidad 18 - Nombre: Microbiología - Departamento: Laboratorio Clínico', 2, '[{"changed": {"fields": ["Tipo atencion"]}}]', 13, 1),
	(46, '2025-08-29 20:27:08.259048', '19', 'ID especialidad 19 - Nombre: Inmunología - Departamento: Laboratorio Clínico', 2, '[{"changed": {"fields": ["Tipo atencion"]}}]', 13, 1),
	(47, '2025-08-29 20:27:21.188740', '21', 'ID especialidad 21 - Nombre: Farmacia Hospitalaria - Departamento: Farmacia', 2, '[{"changed": {"fields": ["Tipo atencion"]}}]', 13, 1);

-- Volcando estructura para tabla hospitalbd.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_content_type: ~19 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(7, 'controlUsuario', 'persona'),
	(6, 'controlUsuario', 'roles'),
	(8, 'controlUsuario', 'usuario'),
	(10, 'hospital_pacientes', 'menoracargodepaciente'),
	(9, 'hospital_pacientes', 'paciente'),
	(17, 'hospital_personal', 'consultas'),
	(11, 'hospital_personal', 'departamento'),
	(13, 'hospital_personal', 'especialidades'),
	(18, 'hospital_personal', 'estudios'),
	(12, 'hospital_personal', 'jorna_laboral'),
	(19, 'hospital_personal', 'medicaciones'),
	(22, 'hospital_personal', 'ordenestudio'),
	(21, 'hospital_personal', 'resultadoestudio'),
	(16, 'hospital_personal', 'turno'),
	(20, 'hospital_personal', 'turnoestudio'),
	(15, 'hospital_personal', 'usuarioxdepartamentoxjornada'),
	(14, 'hospital_personal', 'usuarioxespecialidad'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla hospitalbd.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_migrations: ~33 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-08-19 22:50:39.366502'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2025-08-19 22:50:39.772810'),
	(3, 'auth', '0001_initial', '2025-08-19 22:50:40.632283'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2025-08-19 22:50:40.838564'),
	(5, 'auth', '0003_alter_user_email_max_length', '2025-08-19 22:50:40.925429'),
	(6, 'auth', '0004_alter_user_username_opts', '2025-08-19 22:50:40.953423'),
	(7, 'auth', '0005_alter_user_last_login_null', '2025-08-19 22:50:40.978382'),
	(8, 'auth', '0006_require_contenttypes_0002', '2025-08-19 22:50:40.999499'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2025-08-19 22:50:41.032446'),
	(10, 'auth', '0008_alter_user_username_max_length', '2025-08-19 22:50:41.080372'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2025-08-19 22:50:41.113321'),
	(12, 'auth', '0010_alter_group_name_max_length', '2025-08-19 22:50:41.186207'),
	(13, 'auth', '0011_update_proxy_permissions', '2025-08-19 22:50:41.230138'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2025-08-19 22:50:41.262089'),
	(15, 'controlUsuario', '0001_initial', '2025-08-19 22:50:42.745673'),
	(16, 'admin', '0001_initial', '2025-08-19 22:50:43.157185'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2025-08-19 22:50:43.183094'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-19 22:50:43.232011'),
	(19, 'hospital_pacientes', '0001_initial', '2025-08-19 22:50:43.992202'),
	(20, 'hospital_personal', '0001_initial', '2025-08-19 22:50:45.302280'),
	(21, 'sessions', '0001_initial', '2025-08-19 22:50:45.658950'),
	(22, 'hospital_personal', '0002_turno', '2025-08-19 23:39:47.972254'),
	(23, 'hospital_personal', '0003_alter_turno_fecha_turno', '2025-08-21 20:36:25.305693'),
	(24, 'hospital_personal', '0004_alter_turno_asistio_alter_turno_estado_and_more', '2025-08-21 20:41:43.569102'),
	(25, 'hospital_personal', '0005_alter_turno_fecha_creacion', '2025-08-21 20:48:57.270662'),
	(26, 'hospital_personal', '0006_alter_turno_estado_consultas_estudios_medicaciones', '2025-08-23 03:00:59.960198'),
	(27, 'hospital_personal', '0007_alter_estudios_consulta_alter_medicaciones_consulta', '2025-08-25 20:20:53.691763'),
	(28, 'hospital_personal', '0008_remove_turno_fecha_creacion_remove_turno_fecha_turno_and_more', '2025-08-26 21:13:42.353147'),
	(29, 'hospital_personal', '0009_remove_turno_tiempo_uso_turno_fecha_creacion_and_more', '2025-08-26 21:27:10.414431'),
	(30, 'hospital_personal', '0010_remove_medicaciones_fecha_fin_and_more', '2025-08-26 21:32:41.911454'),
	(31, 'hospital_personal', '0011_alter_consultas_turno', '2025-08-26 23:36:01.983762'),
	(32, 'hospital_personal', '0012_remove_estudios_fecha_estudios_indicaciones_and_more', '2025-08-28 20:20:26.670810'),
	(33, 'hospital_personal', '0013_alter_estudios_solicitado_por_and_more', '2025-08-28 20:22:54.040458'),
	(34, 'hospital_personal', '0014_ordenestudio_resultadoestudio_turnoestudio_and_more', '2025-08-29 18:25:07.925214'),
	(35, 'hospital_personal', '0015_especialidades_tipo_atencion', '2025-08-29 20:25:16.133273'),
	(36, 'hospital_personal', '0016_turnoestudio_especialidad', '2025-08-29 21:10:10.109441'),
	(37, 'hospital_personal', '0017_alter_turnoestudio_fecha_turno', '2025-08-29 21:29:44.637622');

-- Volcando estructura para tabla hospitalbd.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_session: ~8 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('c68ff75mgmf4sgltlmr32f9o1z01it5n', '.eJxVjEEOwiAQRe_C2hCgWMCl-56BzAyDVA0kpV0Z765NutDtf-_9l4iwrSVunZc4J3ERWpx-NwR6cN1BukO9NUmtrsuMclfkQbucWuLn9XD_Dgr08q0VWZUzJURn1UCIxpqgEzIbd87GBQ_oeABN3o-GrXHAo7JIOZBDG8T7AwIYOI4:1uonml:FoNUGqnMUN0h30figF7ieNPFujBq6Z_MU5IE4bXtLwY', '2025-09-03 18:43:47.315228'),
	('cd0o8b2dems08qnc0o045kr3a4fmankt', '.eJxVjEEOwiAQRe_C2hCgWMCl-56BzAyDVA0kpV0Z765NutDtf-_9l4iwrSVunZc4J3ERWpx-NwR6cN1BukO9NUmtrsuMclfkQbucWuLn9XD_Dgr08q0VWZUzJURn1UCIxpqgEzIbd87GBQ_oeABN3o-GrXHAo7JIOZBDG8T7AwIYOI4:1urNHr:g7-5eD-qEuNVKoJGz6b3D4AzYWPAToWI6ZucdNvQK04', '2025-09-10 21:02:31.464932'),
	('f1ferkck5honeuk8mv7h792yfcr6iipp', '.eJxVjEEOwiAQRe_C2hCgWMCl-56BzAyDVA0kpV0Z765NutDtf-_9l4iwrSVunZc4J3ERWpx-NwR6cN1BukO9NUmtrsuMclfkQbucWuLn9XD_Dgr08q0VWZUzJURn1UCIxpqgEzIbd87GBQ_oeABN3o-GrXHAo7JIOZBDG8T7AwIYOI4:1upZQZ:iG0ldfo6WHCgLicv62hWtpnmTiJbc8JTGUQX98QHYhI', '2025-09-05 21:36:03.909333'),
	('ijts4bwwxlleoxcbp8x232mgy00kom1y', '.eJxVjEEOwiAQRe_C2hCgWMCl-56BzAyDVA0kpV0Z765NutDtf-_9l4iwrSVunZc4J3ERWpx-NwR6cN1BukO9NUmtrsuMclfkQbucWuLn9XD_Dgr08q0VWZUzJURn1UCIxpqgEzIbd87GBQ_oeABN3o-GrXHAo7JIOZBDG8T7AwIYOI4:1uqc7X:LbBeiLJ_kgkVWA5LWj_58D9XbXVOGGoTXHtO4ALiasE', '2025-09-08 18:40:43.863597'),
	('pk0492sw1z9hm1e0w6ajs8piwxyo9l1i', '.eJxVjEEOwiAQRe_C2hCgWMCl-56BzAyDVA0kpV0Z765NutDtf-_9l4iwrSVunZc4J3ERWpx-NwR6cN1BukO9NUmtrsuMclfkQbucWuLn9XD_Dgr08q0VWZUzJURn1UCIxpqgEzIbd87GBQ_oeABN3o-GrXHAo7JIOZBDG8T7AwIYOI4:1uoVCj:T6hIP5D6seni3LGA-bWnLP536nKzTjNwsC_SlzSrjJU', '2025-09-02 22:53:21.672766'),
	('qwc5c4bvm7sprd2mlvsu49zwn60i0lj7', '.eJxVjEEOwiAQRe_C2hCgWMCl-56BzAyDVA0kpV0Z765NutDtf-_9l4iwrSVunZc4J3ERWpx-NwR6cN1BukO9NUmtrsuMclfkQbucWuLn9XD_Dgr08q0VWZUzJURn1UCIxpqgEzIbd87GBQ_oeABN3o-GrXHAo7JIOZBDG8T7AwIYOI4:1urhQV:g9n8TsEzBfpEWKOhs_8HKi7gZoqSxwxM_IAuwX3uLf0', '2025-09-11 18:32:47.969396'),
	('w9mkblp2x4vdlkjy6b1pji1g0sz5dbw7', '.eJxVjEEOwiAQRe_C2hCgWMCl-56BzAyDVA0kpV0Z765NutDtf-_9l4iwrSVunZc4J3ERWpx-NwR6cN1BukO9NUmtrsuMclfkQbucWuLn9XD_Dgr08q0VWZUzJURn1UCIxpqgEzIbd87GBQ_oeABN3o-GrXHAo7JIOZBDG8T7AwIYOI4:1ur0P7:Qf__MvmKloNjKbOQvl81FZfPjm5w2C56TGsFNXD_DJg', '2025-09-09 20:36:29.464585'),
	('zc9efcdutw7e5ch8eydus7xh294am4rf', '.eJxVjMsOwiAQRf-FtSFAebp07zeQgRmkaiAp7cr479qkC93ec859sQjbWuM2aIkzsjOb2Ol3S5Af1HaAd2i3znNv6zInviv8oINfO9Lzcrh_BxVG_daOFCaXJigBhLRKW0uOkig-26BEllLpYghp0ugNeJlyIR2McDJrBMveH_BvODA:1us4bf:UNMg07Z-ZFaFv8GkBuhHpwW-YSCzka-xzA1cifCc1js', '2025-09-12 19:17:51.057405');

-- Volcando estructura para tabla hospitalbd.hospital_pacientes_menoracargodepaciente
CREATE TABLE IF NOT EXISTS `hospital_pacientes_menoracargodepaciente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parentesco` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `adulto_id` bigint NOT NULL,
  `menor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menor_id` (`menor_id`),
  KEY `hospital_pacientes_m_adulto_id_20e76e46_fk_hospital_` (`adulto_id`),
  CONSTRAINT `hospital_pacientes_m_adulto_id_20e76e46_fk_hospital_` FOREIGN KEY (`adulto_id`) REFERENCES `hospital_pacientes_paciente` (`id`),
  CONSTRAINT `hospital_pacientes_m_menor_id_b631c279_fk_hospital_` FOREIGN KEY (`menor_id`) REFERENCES `hospital_pacientes_paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_menoracargodepaciente: ~4 rows (aproximadamente)
INSERT INTO `hospital_pacientes_menoracargodepaciente` (`id`, `parentesco`, `adulto_id`, `menor_id`) VALUES
	(1, 'HIJO', 1, 2),
	(2, 'HIJO', 1, 3),
	(5, 'HIJO', 1, 5),
	(6, 'HIJO', 1, 6);

-- Volcando estructura para tabla hospitalbd.hospital_pacientes_paciente
CREATE TABLE IF NOT EXISTS `hospital_pacientes_paciente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `persona_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  CONSTRAINT `hospital_pacientes_p_persona_id_bd0c2004_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_paciente: ~5 rows (aproximadamente)
INSERT INTO `hospital_pacientes_paciente` (`id`, `direccion`, `persona_id`) VALUES
	(1, 'Calle Falsa 1234', 3),
	(2, '', 4),
	(3, '', 5),
	(5, '', 7),
	(6, '', 8);

-- Volcando estructura para tabla hospitalbd.hospital_personal_consultas
CREATE TABLE IF NOT EXISTS `hospital_personal_consultas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `diagnostico` longtext COLLATE utf8mb4_general_ci,
  `tratamiento` longtext COLLATE utf8mb4_general_ci,
  `observaciones` longtext COLLATE utf8mb4_general_ci,
  `fecha` datetime(6) NOT NULL,
  `turno_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_co_turno_id_bd73b20a_fk_hospital_` (`turno_id`),
  CONSTRAINT `hospital_personal_co_turno_id_bd73b20a_fk_hospital_` FOREIGN KEY (`turno_id`) REFERENCES `hospital_personal_turno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_consultas: ~3 rows (aproximadamente)
INSERT INTO `hospital_personal_consultas` (`id`, `diagnostico`, `tratamiento`, `observaciones`, `fecha`, `turno_id`) VALUES
	(1, 'Acné vulgar moderado con inflamación localizada en la zona T del rostro.', 'Evitar productos comedogénicos y exposición prolongada al sol.', 'Paciente debe evitar manipular los granos para prevenir cicatrices.', '2025-08-23 20:42:46.070315', 1),
	(2, 'Dermatitis de contacto irritativa localizada en región facial (mejillas y frente).', 'Suspensión inmediata de productos cosméticos actuales.', 'Paciente refiere inicio del sarpullido luego de aplicar una nueva crema facial adquirida hace 3 días.', '2025-08-26 22:46:29.907475', 3),
	(6, 'Hipotiroidismo clínico.\r\nEl paciente refiere síntomas compatibles con disfunción tiroidea (astenia, alopecia, xerosis). Se sospecha origen hormonal, a confirmar por estudios de función tiroidea.', 'Recomendaciones generales mientras se confirma el diagnóstico:\r\nMantener una dieta equilibrada rica en yodo (pescados, mariscos, huevos).\r\nEvitar el consumo excesivo de soja y alimentos bociógenos crudos (brócoli, coliflor).\r\nReposo adecuado.\r\nSe evaluará iniciar tratamiento sustitutivo con levotiroxina tras confirmación diagnóstica.', 'sin antecedentes tiroideos conocidos.\r\nConsulta por síntomas inespecíficos de 3-4 meses de evolución.\r\nExamen físico: bradicardia leve, piel seca, reflejos lentos.\r\nSe solicita laboratorio para confirmar sospecha clínica de hipotiroidismo.', '2025-08-28 22:12:26.430983', 5),
	(7, 'Hipotiroidismo clínico (probable infratratamiento). Persistencia de síntomas y signos compatibles con disfunción tiroidea. Se solicita nuevo control de función tiroidea y evaluación de autoinmunidad tiroidea.', 'Aumentar dosis de levotiroxina sódica a 50 mcg/día, por la mañana, en ayunas.\r\n\r\nEducación sobre correcta administración del fármaco (30-60 minutos antes del desayuno, sin otras medicaciones concomitantes).\r\n\r\nDieta equilibrada, rica en yodo (pescados, mariscos, huevos).\r\n\r\nEvitar alimentos bociógenos crudos (coliflor, brócoli, repollo).\r\n\r\nReposo adecuado.\r\n\r\nControl clínico y de laboratorio en 6-8 semanas para ajustar dosis según evolución.', 'Paciente sin mejoría clínica significativa desde la última consulta (28/08/2025).\r\nRefiere astenia, alopecia, xerosis, aumento leve de peso, intolerancia al frío y bradicardia persistente.\r\nExamen físico: piel seca y fría, bradicardia (FC 54 lpm), reflejos lentos, edema leve.\r\nSe sospecha hipotiroidismo mal controlado; se solicita evaluación completa de función tiroidea y autoinmunidad.', '2025-08-29 19:17:06.847140', 6);

-- Volcando estructura para tabla hospitalbd.hospital_personal_departamento
CREATE TABLE IF NOT EXISTS `hospital_personal_departamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_departamento: ~11 rows (aproximadamente)
INSERT INTO `hospital_personal_departamento` (`id`, `nombre_departamento`, `tipo`, `descripcion`) VALUES
	(1, 'Urgencias (Emergencias)', 'Atención de urgencias médicas.', 'Este departamento se encarga de la atención inmediata a pacientes que presentan situaciones críticas o repentinas, como accidentes, dolor agudo, hemorragias, problemas respiratorios, etc. Funciona las 24 horas del día.'),
	(2, 'Consultas Externas (Consultorios)', 'Atención ambulatoria.', 'Es el departamento donde los pacientes reciben atención médica de manera ambulatoria, sin necesidad de ser hospitalizados. Se realizan consultas generales y especializadas para diagnóstico y seguimiento de enfermedades.'),
	(3, 'Cirugía', 'Atención quirúrgica.', 'Departamento especializado en realizar intervenciones quirúrgicas tanto programadas como de emergencia. Aquí se operan una variedad de condiciones, desde procedimientos menores hasta cirugías mayores.'),
	(4, 'Unidad de Cuidados Intensivos (UCI)', 'Cuidados críticos.', 'Este departamento se encarga de la atención de pacientes en estado crítico o grave que requieren monitoreo constante y tratamientos especializados, como ventilación mecánica, apoyo cardiovascular, etc.'),
	(5, 'Radiología y Diagnóstico por Imagen', 'Diagnóstico por imagen.', 'Departamento encargado de realizar estudios de diagnóstico como radiografías, tomografías, resonancias magnéticas, ecografías y otros, para ayudar en la detección y diagnóstico de enfermedades y lesiones.'),
	(6, 'Laboratorio Clínico', 'Análisis clínicos.', 'Aquí se realizan análisis de muestras biológicas (sangre, orina, tejidos, etc.) para obtener diagnósticos precisos de diversas condiciones médicas. Incluye pruebas de laboratorio para infecciones, enfermedades metabólicas, y más.'),
	(7, 'Farmacia', 'Dispensa de medicamentos.', 'En este departamento se gestionan y distribuyen los medicamentos tanto para pacientes hospitalizados como ambulatorios. Los farmacéuticos asesoran sobre el uso adecuado de medicamentos y gestionan el inventario.'),
	(8, 'Oncología', 'Tratamiento del cáncer.', 'Especializado en el diagnóstico, tratamiento y seguimiento de pacientes con cáncer. Este departamento maneja quimioterapia, radioterapia, cirugía oncológica, y cuidado paliativo, entre otros.'),
	(9, 'Pediatría', 'Medicina infantil.', 'En este departamento se ofrece atención médica a niños, desde recién nacidos hasta adolescentes. Se tratan enfermedades específicas de la infancia, seguimiento del crecimiento y desarrollo, y vacunación.'),
	(10, 'Ginecología y Obstetricia', 'Salud reproductiva femenina.', 'Se enfoca en el cuidado de la salud reproductiva de la mujer, incluyendo la atención durante el embarazo, el parto, la posparto, así como la prevención y tratamiento de enfermedades ginecológicas.'),
	(11, 'Dermatología', 'Enfermedades de la piel.', 'Especializado en el diagnóstico y tratamiento de enfermedades de la piel, cabello y uñas, tales como acné, psoriasis, dermatitis, cáncer de piel, y trastornos estéticos.');

-- Volcando estructura para tabla hospitalbd.hospital_personal_especialidades
CREATE TABLE IF NOT EXISTS `hospital_personal_especialidades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_especialidad` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `departamento_id` bigint NOT NULL,
  `tipo_atencion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_departamento_id_c964bc2b_fk_hospital_` (`departamento_id`),
  CONSTRAINT `hospital_personal_es_departamento_id_c964bc2b_fk_hospital_` FOREIGN KEY (`departamento_id`) REFERENCES `hospital_personal_departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_especialidades: ~31 rows (aproximadamente)
INSERT INTO `hospital_personal_especialidades` (`id`, `nombre_especialidad`, `descripcion`, `departamento_id`, `tipo_atencion`) VALUES
	(1, 'Medicina de Urgencias', 'Se ocupa del diagnóstico y tratamiento de enfermedades o lesiones que requieren atención médica inmediata.', 1, 'consulta'),
	(2, 'Trauma y Cirugía de Urgencias', 'Atiende lesiones graves, como fracturas o heridas profundas, que requieren intervención quirúrgica urgente.', 1, 'consulta'),
	(3, 'Medicina Crítica', 'Atención intensiva para pacientes graves o que requieren soporte vital.', 1, 'consulta'),
	(4, 'Medicina General', 'Atención primaria para pacientes de todas las edades, con diagnóstico y tratamiento de enfermedades comunes.', 2, 'consulta'),
	(5, 'Endocrinología', 'Trata enfermedades relacionadas con el sistema endocrino, como diabetes, trastornos de tiroides y problemas hormonales.', 2, 'consulta'),
	(6, 'Oftalmología', 'Diagnóstico y tratamiento de enfermedades y trastornos oculares.', 2, 'consulta'),
	(7, 'Otorrinolaringología', 'Enfoque en trastornos de los oídos, nariz y garganta.', 2, 'consulta'),
	(8, 'Cirugía General', 'Realización de procedimientos quirúrgicos para tratar diversas condiciones médicas, como apendicitis o hernias.', 3, 'consulta'),
	(9, 'Cirugía Plástica y Reconstructiva', 'Procedimientos para restaurar la apariencia física después de accidentes o enfermedades, incluyendo cirugías estéticas.', 3, 'consulta'),
	(10, 'Medicina Intensiva', 'Manejo de pacientes en estado crítico que requieren monitoreo constante y tratamiento especializado.', 4, 'consulta'),
	(11, 'UCI Cardiovascular', 'Cuidados intensivos para pacientes con insuficiencia cardíaca, infartos o cirugía cardíaca reciente.', 4, 'consulta'),
	(12, 'UCI Respiratoria', 'Tratamiento especializado para pacientes con fallos respiratorios graves, como aquellos con insuficiencia respiratoria o neumonía severa.', 4, 'consulta'),
	(13, 'Radiología General', 'Uso de rayos X para obtener imágenes del cuerpo y ayudar en el diagnóstico de enfermedades como fracturas o infecciones.', 5, 'servicios_diagnosticos'),
	(14, 'Resonancia Magnética (RM)', 'Técnica que utiliza imanes y ondas de radio para obtener imágenes detalladas de los órganos y tejidos internos.', 5, 'servicios_diagnosticos'),
	(15, 'Ecografía/Doppler', 'Uso de ondas sonoras para crear imágenes del cuerpo y evaluar la circulación sanguínea, a menudo utilizada en el embarazo.', 5, 'servicios_diagnosticos'),
	(16, 'Mamografía', 'Examen de imágenes de la mama para detectar cáncer de mama en etapas tempranas.', 5, 'servicios_diagnosticos'),
	(17, 'Bioquímica Clínica', 'Análisis de muestras biológicas, como sangre o orina, para evaluar las funciones metabólicas y diagnosticar enfermedades.', 6, 'servicios_diagnosticos'),
	(18, 'Microbiología', 'Análisis de muestras para detectar infecciones bacterianas, virales y fúngicas.', 6, 'servicios_diagnosticos'),
	(19, 'Inmunología', 'Estudio del sistema inmunológico y su respuesta a infecciones, alergias y enfermedades autoinmunes.', 6, 'servicios_diagnosticos'),
	(20, 'Farmacia Clínica', 'Uso adecuado de medicamentos para tratar enfermedades y mejorar la calidad de vida de los pacientes.', 7, 'consulta'),
	(21, 'Farmacia Hospitalaria', 'Gestión de los medicamentos dentro del hospital, asegurando su correcta distribución y administración.', 7, 'servicios_diagnosticos'),
	(22, 'Oncología Médica', 'Tratamiento del cáncer utilizando medicamentos como quimioterapia, inmunoterapia y terapias dirigidas.', 8, 'consulta'),
	(23, 'Oncología Radioterápica', 'Tratamiento del cáncer mediante radiación, con el fin de destruir células tumorales.', 8, 'consulta'),
	(24, 'Cirugía Oncológica', 'Intervención quirúrgica para extirpar tumores cancerosos y tejidos afectados.', 8, 'consulta'),
	(25, 'Pediatría General', 'Atención integral para niños y adolescentes, desde la prevención hasta el tratamiento de enfermedades comunes.', 9, 'consulta'),
	(26, 'Ginecología General', 'Diagnóstico y tratamiento de afecciones ginecológicas, como infecciones, fibromas y cáncer.', 10, 'consulta'),
	(27, 'Obstetricia', 'Atención médica a mujeres durante el embarazo, el parto y el postparto.', 10, 'consulta'),
	(28, 'Perinatología', 'Atención médica especializada para embarazos de alto riesgo.', 10, 'consulta'),
	(29, 'Dermatología General', 'Tratamiento de afecciones comunes de la piel, como acné, eczema y psoriasis.', 11, 'consulta'),
	(30, 'Dermatología Estética', 'Procedimientos cosméticos para mejorar la apariencia de la piel, como láser o Botox.', 11, 'consulta'),
	(31, 'Venereología', 'Diagnóstico y tratamiento de enfermedades de transmisión sexual.', 11, 'consulta');

-- Volcando estructura para tabla hospitalbd.hospital_personal_estudiosdiagnosticos
CREATE TABLE IF NOT EXISTS `hospital_personal_estudiosdiagnosticos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_estudio` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `servicio_diagnostico_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_estudiosdiagnosticos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_jorna_laboral
CREATE TABLE IF NOT EXISTS `hospital_personal_jorna_laboral` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dia` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `turno` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_jorna_laboral: ~28 rows (aproximadamente)
INSERT INTO `hospital_personal_jorna_laboral` (`id`, `dia`, `turno`) VALUES
	(1, 'lunes', 'dia'),
	(2, 'martes', 'dia'),
	(3, 'miercoles', 'dia'),
	(4, 'jueves', 'dia'),
	(5, 'viernes', 'dia'),
	(6, 'sabado', 'dia'),
	(7, 'domingo', 'dia'),
	(8, 'lunes', 'tarde'),
	(9, 'martes', 'tarde'),
	(10, 'miercoles', 'tarde'),
	(11, 'jueves', 'tarde'),
	(12, 'viernes', 'tarde'),
	(13, 'sabado', 'tarde'),
	(14, 'domingo', 'tarde'),
	(15, 'lunes', 'noche'),
	(16, 'martes', 'noche'),
	(17, 'miercoles', 'noche'),
	(18, 'jueves', 'noche'),
	(19, 'viernes', 'noche'),
	(20, 'sabado', 'noche'),
	(21, 'domingo', 'noche'),
	(22, 'lunes', 'on-call'),
	(23, 'martes', 'on-call'),
	(24, 'miercoles', 'on-call'),
	(25, 'jueves', 'on-call'),
	(26, 'viernes', 'on-call'),
	(27, 'sabado', 'on-call'),
	(28, 'domingo', 'on-call');

-- Volcando estructura para tabla hospitalbd.hospital_personal_medicaciones
CREATE TABLE IF NOT EXISTS `hospital_personal_medicaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dosis` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `frecuencia` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `recetada_por_id` bigint NOT NULL,
  `consulta_id` bigint NOT NULL,
  `tiempo_uso` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_me_consulta_id_be122a02_fk_hospital_` (`consulta_id`),
  KEY `hospital_personal_medicaciones_recetada_por_id_4712be69` (`recetada_por_id`),
  CONSTRAINT `hospital_personal_me_consulta_id_be122a02_fk_hospital_` FOREIGN KEY (`consulta_id`) REFERENCES `hospital_personal_consultas` (`id`),
  CONSTRAINT `hospital_personal_me_recetada_por_id_4712be69_fk_controlUs` FOREIGN KEY (`recetada_por_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_medicaciones: ~2 rows (aproximadamente)
INSERT INTO `hospital_personal_medicaciones` (`id`, `medicamento`, `dosis`, `frecuencia`, `recetada_por_id`, `consulta_id`, `tiempo_uso`) VALUES
	(1, 'Hidrocortisona 1% crema', 'Aplicación tópica 2 veces al día', 'Cada 12 horas', 2, 2, '1 semana'),
	(2, 'Levotiroxina sódica', '25 mcg', 'Una vez al día, por la mañana en ayunas', 4, 6, 'Temporal hasta resultados de laboratorio'),
	(3, 'Levotiroxina sódica', '50 mcg', '1 vez al día, en ayunas', 4, 7, 'Hasta nuevo control');

-- Volcando estructura para tabla hospitalbd.hospital_personal_ordenestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_ordenestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo_estudio_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `motivo_estudio` longtext COLLATE utf8mb4_general_ci,
  `indicaciones` longtext COLLATE utf8mb4_general_ci,
  `fecha_solicitud` datetime(6) DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `consulta_id` bigint NOT NULL,
  `solicitado_por_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_or_consulta_id_475aec1c_fk_hospital_` (`consulta_id`),
  KEY `hospital_personal_or_solicitado_por_id_af68595d_fk_controlUs` (`solicitado_por_id`),
  CONSTRAINT `hospital_personal_or_consulta_id_475aec1c_fk_hospital_` FOREIGN KEY (`consulta_id`) REFERENCES `hospital_personal_consultas` (`id`),
  CONSTRAINT `hospital_personal_or_solicitado_por_id_af68595d_fk_controlUs` FOREIGN KEY (`solicitado_por_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_ordenestudio: ~1 rows (aproximadamente)
INSERT INTO `hospital_personal_ordenestudio` (`id`, `tipo_estudio_id`, `motivo_estudio`, `indicaciones`, `fecha_solicitud`, `estado`, `consulta_id`, `solicitado_por_id`) VALUES
	(1, 'TSH', 'Evaluación de función tiroidea', 'Ayuno 8 h, extracción matutina', '2025-08-29 19:17:06.899055', 'pendiente', 7, 4);

-- Volcando estructura para tabla hospitalbd.hospital_personal_resultadoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_resultadoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_realizacion` datetime(6) NOT NULL,
  `informe` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `archivo_pdf` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `orden_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orden_id` (`orden_id`),
  CONSTRAINT `hospital_personal_re_orden_id_6f56d637_fk_hospital_` FOREIGN KEY (`orden_id`) REFERENCES `hospital_personal_ordenestudio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_resultadoestudio: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_turno
CREATE TABLE IF NOT EXISTS `hospital_personal_turno` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `motivo` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `asistio` tinyint(1) NOT NULL,
  `especialidad_id` bigint NOT NULL,
  `paciente_id` bigint NOT NULL,
  `profesional_id` bigint NOT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_turno` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_tu_especialidad_id_8f04877d_fk_hospital_` (`especialidad_id`),
  KEY `hospital_personal_tu_paciente_id_2db2a483_fk_hospital_` (`paciente_id`),
  KEY `hospital_personal_tu_profesional_id_d103668c_fk_controlUs` (`profesional_id`),
  CONSTRAINT `hospital_personal_tu_especialidad_id_8f04877d_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_tu_paciente_id_2db2a483_fk_hospital_` FOREIGN KEY (`paciente_id`) REFERENCES `hospital_pacientes_paciente` (`id`),
  CONSTRAINT `hospital_personal_tu_profesional_id_d103668c_fk_controlUs` FOREIGN KEY (`profesional_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turno: ~6 rows (aproximadamente)
INSERT INTO `hospital_personal_turno` (`id`, `estado`, `motivo`, `asistio`, `especialidad_id`, `paciente_id`, `profesional_id`, `fecha_creacion`, `fecha_turno`) VALUES
	(1, 'atendido', 'Granos', 1, 30, 1, 2, '2025-08-26 21:27:10.161082', '2025-08-25'),
	(2, 'pendiente', 'Acné (manchas postinflamatorias)', 0, 30, 3, 3, '2025-08-26 21:27:10.161082', '2025-09-09'),
	(3, 'atendido', 'Sarpullido en el rostro', 1, 30, 3, 2, '2025-08-26 21:27:10.161082', '2025-08-26'),
	(4, 'cancelado', 'Piel seca', 0, 30, 1, 2, '2025-08-26 21:27:10.161082', '2025-09-09'),
	(5, 'atendido', 'Cansancio extremo, caída de cabello, piel seca', 1, 5, 1, 4, '2025-08-28 18:53:27.447371', '2025-08-28'),
	(6, 'atendido', '', 1, 5, 1, 4, '2025-08-28 23:54:14.715737', '2025-08-29');

-- Volcando estructura para tabla hospitalbd.hospital_personal_turnoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_turnoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_turno` date NOT NULL,
  `lugar` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `orden_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orden_id` (`orden_id`),
  CONSTRAINT `hospital_personal_tu_orden_id_dca8a0c5_fk_hospital_` FOREIGN KEY (`orden_id`) REFERENCES `hospital_personal_ordenestudio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turnoestudio: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_usuarioxdepartamentoxjornada
CREATE TABLE IF NOT EXISTS `hospital_personal_usuarioxdepartamentoxjornada` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `departamento_id` bigint NOT NULL,
  `jornada_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usuario_jornada` (`usuario_id`,`jornada_id`),
  KEY `hospital_personal_us_departamento_id_13e22b2d_fk_hospital_` (`departamento_id`),
  KEY `hospital_personal_us_jornada_id_35947f47_fk_hospital_` (`jornada_id`),
  CONSTRAINT `hospital_personal_us_departamento_id_13e22b2d_fk_hospital_` FOREIGN KEY (`departamento_id`) REFERENCES `hospital_personal_departamento` (`id`),
  CONSTRAINT `hospital_personal_us_jornada_id_35947f47_fk_hospital_` FOREIGN KEY (`jornada_id`) REFERENCES `hospital_personal_jorna_laboral` (`id`),
  CONSTRAINT `hospital_personal_us_usuario_id_eb345e19_fk_controlUs` FOREIGN KEY (`usuario_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxdepartamentoxjornada: ~5 rows (aproximadamente)
INSERT INTO `hospital_personal_usuarioxdepartamentoxjornada` (`id`, `departamento_id`, `jornada_id`, `usuario_id`) VALUES
	(1, 11, 1, 2),
	(2, 11, 2, 2),
	(3, 11, 3, 3),
	(4, 11, 12, 3),
	(5, 2, 1, 4);

-- Volcando estructura para tabla hospitalbd.hospital_personal_usuarioxespecialidad
CREATE TABLE IF NOT EXISTS `hospital_personal_usuarioxespecialidad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_profesion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `especialidad_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_us_especialidad_id_eb86e586_fk_hospital_` (`especialidad_id`),
  KEY `hospital_personal_us_usuario_id_3e389344_fk_controlUs` (`usuario_id`),
  CONSTRAINT `hospital_personal_us_especialidad_id_eb86e586_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_us_usuario_id_3e389344_fk_controlUs` FOREIGN KEY (`usuario_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxespecialidad: ~3 rows (aproximadamente)
INSERT INTO `hospital_personal_usuarioxespecialidad` (`id`, `nombre_profesion`, `especialidad_id`, `usuario_id`) VALUES
	(1, 'Dermatólogo', 30, 2),
	(2, 'Dermatólogo', 30, 3),
	(3, 'Endocrinólogo', 5, 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
