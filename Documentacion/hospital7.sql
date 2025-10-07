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
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.auth_permission: ~96 rows (aproximadamente)
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
	(41, 'Can add consultas', 11, 'add_consultas'),
	(42, 'Can change consultas', 11, 'change_consultas'),
	(43, 'Can delete consultas', 11, 'delete_consultas'),
	(44, 'Can view consultas', 11, 'view_consultas'),
	(45, 'Can add departamento', 12, 'add_departamento'),
	(46, 'Can change departamento', 12, 'change_departamento'),
	(47, 'Can delete departamento', 12, 'delete_departamento'),
	(48, 'Can view departamento', 12, 'view_departamento'),
	(49, 'Can add jorna_laboral', 13, 'add_jorna_laboral'),
	(50, 'Can change jorna_laboral', 13, 'change_jorna_laboral'),
	(51, 'Can delete jorna_laboral', 13, 'delete_jorna_laboral'),
	(52, 'Can view jorna_laboral', 13, 'view_jorna_laboral'),
	(53, 'Can add lugar', 14, 'add_lugar'),
	(54, 'Can change lugar', 14, 'change_lugar'),
	(55, 'Can delete lugar', 14, 'delete_lugar'),
	(56, 'Can view lugar', 14, 'view_lugar'),
	(57, 'Can add especialidades', 15, 'add_especialidades'),
	(58, 'Can change especialidades', 15, 'change_especialidades'),
	(59, 'Can delete especialidades', 15, 'delete_especialidades'),
	(60, 'Can view especialidades', 15, 'view_especialidades'),
	(61, 'Can add estudios diagnosticos', 16, 'add_estudiosdiagnosticos'),
	(62, 'Can change estudios diagnosticos', 16, 'change_estudiosdiagnosticos'),
	(63, 'Can delete estudios diagnosticos', 16, 'delete_estudiosdiagnosticos'),
	(64, 'Can view estudios diagnosticos', 16, 'view_estudiosdiagnosticos'),
	(65, 'Can add medicaciones', 17, 'add_medicaciones'),
	(66, 'Can change medicaciones', 17, 'change_medicaciones'),
	(67, 'Can delete medicaciones', 17, 'delete_medicaciones'),
	(68, 'Can view medicaciones', 17, 'view_medicaciones'),
	(69, 'Can add orden estudio', 18, 'add_ordenestudio'),
	(70, 'Can change orden estudio', 18, 'change_ordenestudio'),
	(71, 'Can delete orden estudio', 18, 'delete_ordenestudio'),
	(72, 'Can view orden estudio', 18, 'view_ordenestudio'),
	(73, 'Can add servicio diagnostico', 19, 'add_serviciodiagnostico'),
	(74, 'Can change servicio diagnostico', 19, 'change_serviciodiagnostico'),
	(75, 'Can delete servicio diagnostico', 19, 'delete_serviciodiagnostico'),
	(76, 'Can view servicio diagnostico', 19, 'view_serviciodiagnostico'),
	(77, 'Can add turno', 20, 'add_turno'),
	(78, 'Can change turno', 20, 'change_turno'),
	(79, 'Can delete turno', 20, 'delete_turno'),
	(80, 'Can view turno', 20, 'view_turno'),
	(81, 'Can add turno estudio', 21, 'add_turnoestudio'),
	(82, 'Can change turno estudio', 21, 'change_turnoestudio'),
	(83, 'Can delete turno estudio', 21, 'delete_turnoestudio'),
	(84, 'Can view turno estudio', 21, 'view_turnoestudio'),
	(85, 'Can add resultado estudio', 22, 'add_resultadoestudio'),
	(86, 'Can change resultado estudio', 22, 'change_resultadoestudio'),
	(87, 'Can delete resultado estudio', 22, 'delete_resultadoestudio'),
	(88, 'Can view resultado estudio', 22, 'view_resultadoestudio'),
	(89, 'Can add usuario x especialidad x servicio', 23, 'add_usuarioxespecialidadxservicio'),
	(90, 'Can change usuario x especialidad x servicio', 23, 'change_usuarioxespecialidadxservicio'),
	(91, 'Can delete usuario x especialidad x servicio', 23, 'delete_usuarioxespecialidadxservicio'),
	(92, 'Can view usuario x especialidad x servicio', 23, 'view_usuarioxespecialidadxservicio'),
	(93, 'Can add usuario x departamento x jornada x lugar', 24, 'add_usuarioxdepartamentoxjornadaxlugar'),
	(94, 'Can change usuario x departamento x jornada x lugar', 24, 'change_usuarioxdepartamentoxjornadaxlugar'),
	(95, 'Can delete usuario x departamento x jornada x lugar', 24, 'delete_usuarioxdepartamentoxjornadaxlugar'),
	(96, 'Can view usuario x departamento x jornada x lugar', 24, 'view_usuarioxdepartamentoxjornadaxlugar'),
	(97, 'Can add plantilla estudio', 25, 'add_plantillaestudio'),
	(98, 'Can change plantilla estudio', 25, 'change_plantillaestudio'),
	(99, 'Can delete plantilla estudio', 25, 'delete_plantillaestudio'),
	(100, 'Can view plantilla estudio', 25, 'view_plantillaestudio'),
	(101, 'Can add resultado imagen', 26, 'add_resultadoimagen'),
	(102, 'Can change resultado imagen', 26, 'change_resultadoimagen'),
	(103, 'Can delete resultado imagen', 26, 'delete_resultadoimagen'),
	(104, 'Can view resultado imagen', 26, 'view_resultadoimagen'),
	(105, 'Can add roles profesionales', 27, 'add_rolesprofesionales'),
	(106, 'Can change roles profesionales', 27, 'change_rolesprofesionales'),
	(107, 'Can delete roles profesionales', 27, 'delete_rolesprofesionales'),
	(108, 'Can view roles profesionales', 27, 'view_rolesprofesionales'),
	(109, 'Can add usuario x especialidad x servicio xroles profesionales', 28, 'add_usuarioxespecialidadxservicioxrolesprofesionales'),
	(110, 'Can change usuario x especialidad x servicio xroles profesionales', 28, 'change_usuarioxespecialidadxservicioxrolesprofesionales'),
	(111, 'Can delete usuario x especialidad x servicio xroles profesionales', 28, 'delete_usuarioxespecialidadxservicioxrolesprofesionales'),
	(112, 'Can view usuario x especialidad x servicio xroles profesionales', 28, 'view_usuarioxespecialidadxservicioxrolesprofesionales');

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
  UNIQUE KEY `login_id` (`login_id`),
  UNIQUE KEY `controlUsuario_persona_telefono_6418000c_uniq` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_persona: ~11 rows (aproximadamente)
INSERT INTO `controlusuario_persona` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `login_id`, `fecha_nacimiento`, `sexo`, `telefono`) VALUES
	(1, 'pbkdf2_sha256$870000$HXO7rp3EMdhsOoTl736PAa$By7RKIZKhHZ0ccY2fXct+pf0kV2EV0al05EN6odowXQ=', '2025-10-03 18:05:58.653030', 1, 'Jose', 'Perez', 'jperez@gmail.com', 1, 1, '2025-09-03 01:29:08.000000', '37567897', '1000', '1990-02-03', 'M', '25160879'),
	(2, 'pbkdf2_sha256$870000$e2RwIO8WEdn9PsgDg09LBP$lLTckgOmmw2Q5GrHIWenVvwgo58JZY7TBVzqytmYMdc=', '2025-09-13 21:16:59.497917', 0, 'Micaela', 'Lopez', 'micaela@gmail.com', 0, 1, '2025-09-03 21:49:57.590466', '37567866', '1005', '1995-01-01', 'F', '25160111'),
	(3, 'pbkdf2_sha256$870000$HnL6f1k5uZOaNAJylpKwX1$uXUnIq9vbQFpTWeN3VOBOfRuntLgbgGYoEPtoWyg94I=', '2025-10-03 19:15:34.738080', 0, 'Horacio', 'Gutiérrez', 'horacio@gmail.com', 0, 1, '2025-09-03 21:50:52.178745', '37534444', '1006', '1990-03-03', 'M', '23135467'),
	(4, 'pbkdf2_sha256$870000$1ObjydA2jhveHFe1VOVrgC$phaZFMF0rzssjmm39gy86HO43MqEp6ztvzBwoZJJV+4=', '2025-10-01 22:17:21.764087', 0, 'Maximiliano', 'Acuña', 'maxi@gmail.com', 0, 1, '2025-09-03 21:57:53.000000', '45912425', 'maxi@gmail.com', '2004-06-29', 'M', '21456722'),
	(5, '', NULL, 0, 'Lolo', 'Acuña', '', 0, 1, '2025-09-03 21:58:50.332276', '65321457', NULL, '2019-01-01', 'M', NULL),
	(6, '', NULL, 0, 'Natalia', 'Acuña', '', 0, 1, '2025-09-03 21:59:08.914313', '65321458', NULL, '2019-01-01', 'F', NULL),
	(7, 'pbkdf2_sha256$870000$SGGrdXQDUPx2UlmsLDrtxZ$fEmJX5z8S+ERBfebjiZxoE4fQny6OZmyvNaOgwgnJwY=', '2025-09-18 21:24:22.972306', 0, 'Pepe', 'Argento', 'pepe@gmail.com', 0, 1, '2025-09-08 18:27:23.288047', '23674455', '1007', '1980-04-04', 'M', '65778899'),
	(8, 'pbkdf2_sha256$870000$0hhZ5kttNS0rVioo64wli3$294AJTR8a+G46e/qo1hCjvJln5jzC4YfdWMA0Fu8R4k=', '2025-10-02 15:43:56.411109', 0, 'Maria', 'Becerra', 'maria@gmail.com', 0, 1, '2025-09-10 21:57:28.202790', '44890432', '1008', '2000-04-04', 'F', '33441245'),
	(9, 'pbkdf2_sha256$870000$vzj6ugiOXbBt8mlnVHD3Uu$cS9X9kLDYyHRtaM4eRvkBv14vKmQFXyF9wReneSTKlo=', '2025-10-02 15:46:27.879304', 0, 'Koko', 'Kokino', 'koko@gmail.com', 0, 1, '2025-09-11 00:07:53.586021', '33567321', '1009', '1997-01-01', 'M', '32321212'),
	(10, 'pbkdf2_sha256$870000$adIQTEoM7wGpDzld4yn0zP$paPoYKTpBQW4mQwRZXSEz/jxrcNwTdnX/erHrwEgeos=', '2025-09-29 22:01:21.985429', 0, 'Walter', 'Fernadez', 'walter@gmail.com', 0, 1, '2025-09-29 22:01:18.896471', '45678999', 'walter@gmail.com', '1999-07-07', 'M', '67112343'),
	(11, 'pbkdf2_sha256$870000$PZ58KOqKPnq0j7MJxvPZlu$wMNtWo3s9V5nVGU+KVFuBbe3Fy81bJVNqQV78JJ9KBA=', '2025-09-29 22:16:35.851207', 0, 'Fernando', 'Kokon', 'fernando@gmail.com', 0, 1, '2025-09-29 22:16:32.639353', '33567111', 'fernando@gmail.com', '2000-08-08', 'M', '44213213');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_roles: ~5 rows (aproximadamente)
INSERT INTO `controlusuario_roles` (`id`, `nombre_rol`) VALUES
	(1, 'Superadministrador'),
	(2, 'Médico'),
	(3, 'Cargador de Resultados'),
	(4, 'Enfermero'),
	(5, 'Apoyo en Diagnóstico y Tratamiento');

-- Volcando estructura para tabla hospitalbd.controlusuario_rolesprofesionales
CREATE TABLE IF NOT EXISTS `controlusuario_rolesprofesionales` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_rol_profesional` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rol_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `controlUsuario_roles_rol_id_4dc44ab1_fk_controlUs` (`rol_id`),
  CONSTRAINT `controlUsuario_roles_rol_id_4dc44ab1_fk_controlUs` FOREIGN KEY (`rol_id`) REFERENCES `controlusuario_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_rolesprofesionales: ~7 rows (aproximadamente)
INSERT INTO `controlusuario_rolesprofesionales` (`id`, `nombre_rol_profesional`, `rol_id`) VALUES
	(1, 'Dermatólogo', 2),
	(2, 'Endocrinólogo', 2),
	(3, 'Cardiólogo', 2),
	(4, 'Pediatra', 2),
	(5, 'Urólogo', 2),
	(6, 'Radiólogo', 2),
	(7, 'Técnico en radiología', 5),
	(8, 'General', 2);

-- Volcando estructura para tabla hospitalbd.controlusuario_usuario
CREATE TABLE IF NOT EXISTS `controlusuario_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero_matricula` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `debe_cambiar_contraseña` tinyint(1) NOT NULL,
  `persona_id` bigint NOT NULL,
  `rol_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  KEY `controlUsuario_usuar_rol_id_630f1eb0_fk_controlUs` (`rol_id`),
  CONSTRAINT `controlUsuario_usuar_persona_id_60479e85_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`),
  CONSTRAINT `controlUsuario_usuar_rol_id_630f1eb0_fk_controlUs` FOREIGN KEY (`rol_id`) REFERENCES `controlusuario_roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuario: ~6 rows (aproximadamente)
INSERT INTO `controlusuario_usuario` (`id`, `numero_matricula`, `debe_cambiar_contraseña`, `persona_id`, `rol_id`) VALUES
	(1, '', 0, 1, 1),
	(2, '10010', 1, 2, 2),
	(3, '10015', 0, 3, 2),
	(4, '12222', 1, 7, 2),
	(5, '22222', 1, 8, 2),
	(6, '', 1, 9, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_admin_log: ~110 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-09-03 21:48:34.124916', '1', 'Jose Perez (1000) - DNI: 37567897', 2, '[{"changed": {"fields": ["Email address", "Dni", "Fecha nacimiento", "Sexo", "Telefono"]}}]', 7, 1),
	(2, '2025-09-03 21:48:48.796464', '1', 'Usuario: 1 - Jose Perez - Legajo hospitalario: 1000', 1, '[{"added": {}}]', 8, 1),
	(3, '2025-09-03 21:52:35.299788', '1', 'Usuario: Micaela Lopez - N° Legajo: 1005 - Especialidad: Dermatología - N° Matricula: 10010', 1, '[{"added": {}}]', 23, 1),
	(4, '2025-09-03 21:52:57.565025', '2', 'Usuario: Horacio Gutiérrez - N° Legajo: 1006 - Especialidad: Endocrinología - N° Matricula: 10015', 1, '[{"added": {}}]', 23, 1),
	(5, '2025-09-03 21:53:31.698188', '1', 'El usuario 2 trabaja los dias lunes en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 24, 1),
	(6, '2025-09-03 21:53:56.487519', '2', 'El usuario 2 trabaja los dias martes en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 24, 1),
	(7, '2025-09-03 21:54:22.271414', '3', 'El usuario 2 trabaja los dias miercoles en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 24, 1),
	(8, '2025-09-03 21:55:21.711788', '4', 'El usuario 2 trabaja los dias jueves en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 24, 1),
	(9, '2025-09-03 21:56:03.211098', '5', 'El usuario 3 trabaja los dias lunes en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 24, 1),
	(10, '2025-09-03 21:56:31.244225', '6', 'El usuario 3 trabaja los dias martes en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 24, 1),
	(11, '2025-09-03 21:57:05.026982', '7', 'El usuario 3 trabaja los dias viernes en el Departamento: Consultas Externas (Consultorios) en el horario: tarde', 1, '[{"added": {}}]', 24, 1),
	(12, '2025-09-03 22:24:39.201254', '2', 'ID turno: 2, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(13, '2025-09-04 17:59:51.326986', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(14, '2025-09-04 20:15:28.656516', '4', 'Turno para Prueba de TSH el 2025-09-10 solicitado por el paciente: (Lolo Acuña - DNI: 65321457) ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(15, '2025-09-04 20:17:29.103290', '1', 'ID turno: 1, Estado: atendido', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(16, '2025-09-04 20:18:02.127390', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(17, '2025-09-05 19:40:59.387541', '2', 'Turno para Prueba de TSH el 2025-09-05 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Pendiente ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(18, '2025-09-05 19:41:21.959866', '2', 'Turno para Prueba de TSH el 2025-09-05 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Atendido ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(19, '2025-09-05 19:41:45.254434', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 20, 1),
	(20, '2025-09-05 19:42:08.076493', '3', 'ID turno: 3, Estado: atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 20, 1),
	(21, '2025-09-05 19:42:18.620603', '3', 'ID turno: 3, Estado: atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(22, '2025-09-05 22:46:01.474372', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(23, '2025-09-05 22:46:16.998619', '2', 'ID turno: 2, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(24, '2025-09-05 22:47:54.022641', '3', 'ID turno: 3, Estado: atendido', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(25, '2025-09-05 22:55:35.452191', '2', 'ID turno: 2, Estado: atendido', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(26, '2025-09-05 22:58:19.341499', '3', 'ID turno: 3, Estado: atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(27, '2025-09-05 23:01:48.260422', '5', 'Turno para Prueba de T4 libre el 2025-09-08 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Atendido ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(28, '2025-09-06 18:39:17.045893', '2', 'ID turno: 2, Estado: atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(29, '2025-09-06 18:39:36.945617', '2', 'ID turno: 2, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(30, '2025-09-06 18:39:59.380786', '2', 'ID turno: 2, Estado: atendido', 2, '[{"changed": {"fields": ["Estado", "Asistio"]}}]', 20, 1),
	(31, '2025-09-06 18:44:06.877888', '2', 'ID turno: 2, Estado: atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Asistio"]}}]', 20, 1),
	(32, '2025-09-07 22:57:16.211671', '1', 'El estudio \'Radiografía de tórax de urgencia\' se realiza en Rayos X de Emergencia', 2, '[{"changed": {"fields": ["Tipo resultado"]}}]', 16, 1),
	(33, '2025-09-08 00:41:06.594427', '1', 'El estudio \'Perfil lipídico\' tiene la estructura {\'Perfil_lipidico\': {\'Colesterol_total\': {\'valor\': \'\', \'unidad\': \'mg/dL\', \'referencia\': \'< 200 mg/dL\'}, \'Colesterol_HDL\': {\'valor\': \'\', \'unidad\': \'mg/d', 1, '[{"added": {}}]', 25, 1),
	(34, '2025-09-08 18:35:23.300324', '3', 'Usuario: Pepe Argento - N° Legajo: 1007 - Especialidad: Medicina General - N° Matricula: 12222', 1, '[{"added": {}}]', 23, 1),
	(35, '2025-09-08 18:36:06.288067', '8', 'El usuario 4 trabaja los dias miercoles en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 24, 1),
	(36, '2025-09-08 18:51:42.494810', '4', 'ID turno: 4, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(37, '2025-09-08 21:58:48.546205', '1', 'El estudio \'Perfil lipídico\' tiene la estructura {\'Perfil lipídico\': {\'Colesterol total\': {\'valor\': \'\', \'unidad\': \'mg/dL\', \'referencia\': \'< 200 mg/dL\'}, \'Colesterol HDL\': {\'valor\': \'\', \'unidad\': \'mg/d', 2, '[{"changed": {"fields": ["Estructura"]}}]', 25, 1),
	(38, '2025-09-09 21:29:31.826475', '5', 'ID turno: 5, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(39, '2025-09-09 21:35:50.761827', '271', 'El estudio \'Radiografía lumbosacra\' se realiza en Radiología General - Tipo Resultado: (Imagen)', 1, '[{"added": {}}]', 16, 1),
	(40, '2025-09-10 21:16:42.995711', '2', 'El estudio \'Prueba de TSH\' tiene la estructura {\'Prueba de TSH\': {\'TSH\': {\'valor\': \'\', \'unidad\': \'µIU/mL\', \'referencia\': \'0.4 – 4.0 µIU/mL\'}}}', 1, '[{"added": {}}]', 25, 1),
	(41, '2025-09-10 21:41:26.335808', '3', 'El estudio \'Prueba de T4 libre\' tiene la estructura {\'Prueba de T4 libre\': {\'T4 libre\': {\'valor\': \'\', \'unidad\': \'ng/dL\', \'referencia\': \'0.8 – 1.8 ng/dL\'}}}', 1, '[{"added": {}}]', 25, 1),
	(42, '2025-09-10 21:54:14.562498', '4', 'El estudio \'Electrocardiograma en reposo\' tiene la estructura {\'Electrocardiograma en reposo\': {\'Frecuencia cardíaca\': {\'valor\': \'\', \'unidad\': \'latidos/minuto\', \'referencia\': \'60 - 100\', \'interpretaci', 1, '[{"added": {}}]', 25, 1),
	(43, '2025-09-10 21:58:42.781781', '4', 'Usuario: Maria Becerra - N° Legajo: 1008 - Especialidad: Cardiología - N° Matricula: 22222', 1, '[{"added": {}}]', 23, 1),
	(44, '2025-09-10 22:05:02.177793', '12', '12 : Cardiología', 1, '[{"added": {}}]', 12, 1),
	(45, '2025-09-10 22:05:45.828872', '9', 'El usuario 5 trabaja los dias lunes en el Departamento: Cardiología en el horario: dia', 1, '[{"added": {}}]', 24, 1),
	(46, '2025-09-10 22:16:09.612486', '6', 'ID turno: 6, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(47, '2025-09-10 23:50:17.362526', '3', 'Cargador de Resultados', 1, '[{"added": {}}]', 6, 1),
	(48, '2025-09-11 00:13:57.601183', '6', 'Usuario: 6 - Koko Kokin - Legajo hospitalario: 1009', 2, '[{"changed": {"fields": ["Rol"]}}]', 8, 1),
	(49, '2025-09-11 20:05:24.384840', '8', 'Turno para Electrocardiograma en reposo el 2025-09-11 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Atendido ', 2, '[{"changed": {"fields": ["Asistio"]}}]', 21, 1),
	(50, '2025-09-11 20:05:29.673028', '7', 'Turno para Radiografía lumbosacra el 2025-09-10 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Atendido ', 2, '[{"changed": {"fields": ["Asistio"]}}]', 21, 1),
	(51, '2025-09-11 20:05:36.120525', '6', 'Turno para Perfil lipídico el 2025-09-09 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Atendido ', 2, '[{"changed": {"fields": ["Asistio"]}}]', 21, 1),
	(52, '2025-09-11 20:05:41.313554', '5', 'Turno para Prueba de T4 libre el 2025-09-08 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Atendido ', 2, '[{"changed": {"fields": ["Asistio"]}}]', 21, 1),
	(53, '2025-09-11 20:05:47.976008', '4', 'Turno para Prueba de TSH el 2025-09-10 solicitado por el paciente: (Lolo Acuña - DNI: 65321457) - Estado: Atendido ', 2, '[{"changed": {"fields": ["Asistio"]}}]', 21, 1),
	(54, '2025-09-11 20:05:52.708195', '2', 'Turno para Prueba de TSH el 2025-09-05 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Atendido ', 2, '[{"changed": {"fields": ["Asistio"]}}]', 21, 1),
	(55, '2025-09-13 17:52:41.105659', '5', 'Usuario: Horacio Gutiérrez - N° Legajo: 1006 - Especialidad: Dermatología - N° Matricula: 10015', 1, '[{"added": {}}]', 23, 1),
	(56, '2025-09-13 22:21:34.407554', '1', 'Usuario: 1 - Jose Perez - Legajo hospitalario: 1000', 2, '[{"changed": {"fields": ["Numero matricula"]}}]', 8, 1),
	(57, '2025-09-15 22:52:10.237180', '7', 'El usuario (3 - Horacio Gutiérrez )  trabaja los dias viernes en el Departamento: Consultas Externas (Consultorios) en el horario: tarde', 2, '[{"changed": {"fields": ["Lugar"]}}]', 24, 1),
	(58, '2025-09-16 01:36:04.554138', '1', 'Dermatólogo', 1, '[{"added": {}}]', 27, 1),
	(59, '2025-09-16 01:36:20.687093', '2', 'Endocrinólogo', 1, '[{"added": {}}]', 27, 1),
	(60, '2025-09-16 01:36:36.734238', '3', 'Cardiólogo', 1, '[{"added": {}}]', 27, 1),
	(61, '2025-09-16 01:57:47.030203', '1', 'Usuario: Micaela Lopez - N° Legajo: 1005 - Especialidad: Dermatología - N° Matricula: 10010', 1, '[{"added": {}}]', 28, 1),
	(62, '2025-09-16 01:58:11.425741', '2', 'Usuario: Horacio Gutiérrez - N° Legajo: 1006 - Especialidad: Endocrinología - N° Matricula: 10015', 1, '[{"added": {}}]', 28, 1),
	(63, '2025-09-16 01:58:38.494212', '3', 'Usuario: Maria Becerra - N° Legajo: 1008 - Especialidad: Cardiología - N° Matricula: 22222', 1, '[{"added": {}}]', 28, 1),
	(64, '2025-09-16 02:02:43.419547', '4', 'Pediatra', 1, '[{"added": {}}]', 27, 1),
	(65, '2025-09-16 02:03:03.642372', '5', 'Enfermero', 1, '[{"added": {}}]', 27, 1),
	(66, '2025-09-16 02:13:34.171670', '6', 'Radiólogo', 1, '[{"added": {}}]', 27, 1),
	(67, '2025-09-16 02:26:56.408557', '5', 'Apoyo en Diagnóstico y Tratamiento', 1, '[{"added": {}}]', 6, 1),
	(68, '2025-09-16 19:55:55.633832', '1', 'Dermatólogo', 2, '[{"changed": {"fields": ["Rol"]}}]', 27, 1),
	(69, '2025-09-16 19:55:59.555469', '2', 'Endocrinólogo', 2, '[{"changed": {"fields": ["Rol"]}}]', 27, 1),
	(70, '2025-09-16 19:56:03.716210', '3', 'Cardiólogo', 2, '[{"changed": {"fields": ["Rol"]}}]', 27, 1),
	(71, '2025-09-16 19:56:07.819709', '4', 'Pediatra', 2, '[{"changed": {"fields": ["Rol"]}}]', 27, 1),
	(72, '2025-09-16 19:56:12.319590', '6', 'Radiólogo', 2, '[{"changed": {"fields": ["Rol"]}}]', 27, 1),
	(73, '2025-09-16 19:57:07.305099', '5', 'Urólogo', 2, '[{"changed": {"fields": ["Nombre rol profesional", "Rol"]}}]', 27, 1),
	(74, '2025-09-16 19:59:01.401759', '7', 'Técnico en radiología', 1, '[{"added": {}}]', 27, 1),
	(75, '2025-09-17 23:08:30.379527', '8', 'General', 1, '[{"added": {}}]', 27, 1),
	(76, '2025-09-17 23:40:53.962653', '154', 'Oficina de Laboratorio (OFI-LAB-201) - Estado: disponible', 1, '[{"added": {}}]', 14, 1),
	(77, '2025-09-18 00:13:20.220201', '2', 'Turno para Prueba de TSH el 2025-09-05 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Realizado ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(78, '2025-09-18 00:13:25.602662', '4', 'Turno para Prueba de TSH el 2025-09-10 solicitado por el paciente: (Lolo Acuña - DNI: 65321457) - Estado: Realizado ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(79, '2025-09-18 00:13:30.968536', '5', 'Turno para Prueba de T4 libre el 2025-09-08 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Realizado ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(80, '2025-09-18 00:13:36.477239', '6', 'Turno para Perfil lipídico el 2025-09-09 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Realizado ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(81, '2025-09-18 00:13:43.140726', '7', 'Turno para Radiografía lumbosacra el 2025-09-10 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Realizado ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(82, '2025-09-18 00:13:49.988965', '8', 'Turno para Electrocardiograma en reposo el 2025-09-11 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Realizado ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(83, '2025-09-23 19:18:45.302738', '3', 'ID turno: 3, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(84, '2025-09-24 02:52:21.654162', '3', 'ID turno: 3, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(85, '2025-09-24 22:20:46.839760', '3', 'ID turno: 3, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(86, '2025-09-24 22:21:38.725184', '6', 'ID turno: 6, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(87, '2025-09-24 22:21:56.671399', '6', 'ID turno: 6, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(88, '2025-09-24 22:22:41.417126', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(89, '2025-09-24 22:39:10.003387', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(90, '2025-09-24 22:43:58.474594', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(91, '2025-09-25 00:01:40.352856', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(92, '2025-09-25 00:23:10.572532', '3', 'ID turno: 3, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(93, '2025-09-25 01:02:11.009855', '3', 'ID turno: 3, Estado: Cancelado', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(94, '2025-09-25 01:37:53.601560', '3', 'ID turno: 3, Estado: No asistio', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(95, '2025-09-25 01:38:49.378141', '3', 'ID turno: 3, Estado: Reprogramado', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(96, '2025-09-25 01:39:25.927989', '3', 'ID turno: 3, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(97, '2025-09-25 01:39:35.754721', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(98, '2025-09-25 17:37:04.357952', '2', 'ID turno: 2, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(99, '2025-09-25 17:37:56.694608', '2', 'ID turno: 2, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(100, '2025-09-25 19:00:24.872270', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(101, '2025-09-26 16:15:22.455899', '2', 'ID turno: 2, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(102, '2025-09-26 16:16:01.823576', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 20, 1),
	(103, '2025-09-26 16:16:06.974021', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Asistio"]}}]', 20, 1),
	(104, '2025-09-26 16:31:17.958331', '2', 'ID turno: 2, Estado: Pendiente', 2, '[{"changed": {"fields": ["Estado", "Asistio"]}}]', 20, 1),
	(105, '2025-09-26 16:43:37.457823', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(106, '2025-09-27 22:23:18.005829', '1', 'Solitud pedida en la consulta n°: 1 - N° de orden: 1 - Tipo Estudio: "Prueba de TSH" - Estado: pendiente - Paciente ID: 1', 2, '[{"changed": {"fields": ["Estado"]}}]', 18, 1),
	(107, '2025-09-28 20:46:06.793735', '1', 'Solitud pedida en la consulta n°: 1 - N° de orden: 1 - Tipo Estudio: "Prueba de TSH" - Estado: realizado - Paciente ID: 1', 2, '[{"changed": {"fields": ["Estado"]}}]', 18, 1),
	(108, '2025-09-28 21:09:05.471812', '5', 'Turno para Prueba de T4 libre el 2025-09-08 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Pendiente ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(109, '2025-09-28 21:09:20.855347', '5', 'Turno para Prueba de T4 libre el 2025-09-08 solicitado por el paciente: (Maximiliano Acuña - DNI: 45912425) - Estado: Realizado ', 2, '[{"changed": {"fields": ["Estado"]}}]', 21, 1),
	(110, '2025-09-29 16:47:38.655025', '2', 'Solitud pedida en la consulta n°: 1 - N° de orden: 2 - Tipo Estudio: "Prueba de T4 libre" - Estado: pendiente - Paciente ID: 1', 2, '[{"changed": {"fields": ["Estado"]}}]', 18, 1),
	(111, '2025-09-29 20:39:47.256918', '4', 'Maximilianoo Acuña (maxi@gmail.com) - DNI: 45912425', 2, '[{"changed": {"fields": ["Password"]}}]', 7, 1),
	(112, '2025-09-29 21:06:15.218905', '4', 'Maximilianoo Acuña (maxi@gmail.com) - DNI: 45912425', 2, '[{"changed": {"fields": ["password"]}}]', 7, 1),
	(113, '2025-09-29 21:42:43.972667', '4', 'Maximiliano Acuña (maxi@gmail.com) - DNI: 45912425', 2, '[{"changed": {"fields": ["password"]}}]', 7, 1),
	(114, '2025-09-29 23:07:07.094388', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(115, '2025-09-29 23:16:06.238018', '2', 'ID turno: 2, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(116, '2025-09-29 23:16:30.772177', '2', 'ID turno: 2, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(117, '2025-09-29 23:56:10.216920', '3', 'ID turno: 3, Estado: Pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(118, '2025-09-30 00:00:03.642576', '3', 'ID turno: 3, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1),
	(119, '2025-09-30 00:00:16.410571', '2', 'ID turno: 2, Estado: Atendido', 2, '[{"changed": {"fields": ["Fecha turno", "Estado", "Asistio"]}}]', 20, 1);

-- Volcando estructura para tabla hospitalbd.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_content_type: ~24 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(7, 'controlUsuario', 'persona'),
	(6, 'controlUsuario', 'roles'),
	(27, 'controlUsuario', 'rolesprofesionales'),
	(8, 'controlUsuario', 'usuario'),
	(10, 'hospital_pacientes', 'menoracargodepaciente'),
	(9, 'hospital_pacientes', 'paciente'),
	(11, 'hospital_personal', 'consultas'),
	(12, 'hospital_personal', 'departamento'),
	(15, 'hospital_personal', 'especialidades'),
	(16, 'hospital_personal', 'estudiosdiagnosticos'),
	(13, 'hospital_personal', 'jorna_laboral'),
	(14, 'hospital_personal', 'lugar'),
	(17, 'hospital_personal', 'medicaciones'),
	(18, 'hospital_personal', 'ordenestudio'),
	(25, 'hospital_personal', 'plantillaestudio'),
	(22, 'hospital_personal', 'resultadoestudio'),
	(26, 'hospital_personal', 'resultadoimagen'),
	(19, 'hospital_personal', 'serviciodiagnostico'),
	(20, 'hospital_personal', 'turno'),
	(21, 'hospital_personal', 'turnoestudio'),
	(24, 'hospital_personal', 'usuarioxdepartamentoxjornadaxlugar'),
	(23, 'hospital_personal', 'usuarioxespecialidadxservicio'),
	(28, 'hospital_personal', 'usuarioxespecialidadxservicioxrolesprofesionales'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla hospitalbd.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_migrations: ~34 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-09-03 01:27:49.497457'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2025-09-03 01:27:49.897205'),
	(3, 'auth', '0001_initial', '2025-09-03 01:27:50.777162'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2025-09-03 01:27:51.000120'),
	(5, 'auth', '0003_alter_user_email_max_length', '2025-09-03 01:27:51.019090'),
	(6, 'auth', '0004_alter_user_username_opts', '2025-09-03 01:27:51.042057'),
	(7, 'auth', '0005_alter_user_last_login_null', '2025-09-03 01:27:51.080992'),
	(8, 'auth', '0006_require_contenttypes_0002', '2025-09-03 01:27:51.091977'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2025-09-03 01:27:51.126929'),
	(10, 'auth', '0008_alter_user_username_max_length', '2025-09-03 01:27:51.167859'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2025-09-03 01:27:51.190821'),
	(12, 'auth', '0010_alter_group_name_max_length', '2025-09-03 01:27:51.262979'),
	(13, 'auth', '0011_update_proxy_permissions', '2025-09-03 01:27:51.294933'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2025-09-03 01:27:51.321892'),
	(15, 'controlUsuario', '0001_initial', '2025-09-03 01:27:53.003733'),
	(16, 'admin', '0001_initial', '2025-09-03 01:27:53.541008'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2025-09-03 01:27:53.573963'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-09-03 01:27:53.623881'),
	(19, 'hospital_pacientes', '0001_initial', '2025-09-03 01:27:54.563393'),
	(20, 'hospital_personal', '0001_initial', '2025-09-03 01:28:00.118499'),
	(21, 'sessions', '0001_initial', '2025-09-03 01:28:00.239641'),
	(22, 'hospital_personal', '0002_remove_serviciodiagnostico_lugar_and_more', '2025-09-03 18:48:14.420205'),
	(23, 'hospital_personal', '0003_alter_turno_paciente', '2025-09-03 22:13:20.452261'),
	(24, 'hospital_personal', '0004_turnoestudio_lugar', '2025-09-04 00:04:18.012683'),
	(25, 'hospital_personal', '0005_alter_turnoestudio_servicio_diagnostico', '2025-09-04 18:28:44.842118'),
	(26, 'hospital_personal', '0006_rename_turno_resultadoestudio_turno_estudio_and_more', '2025-09-04 21:41:49.052493'),
	(27, 'hospital_personal', '0007_alter_resultadoestudio_turno_estudio_and_more', '2025-09-05 21:41:54.266632'),
	(28, 'hospital_personal', '0008_alter_resultadoestudio_turno_estudio_and_more', '2025-09-06 18:06:21.067334'),
	(29, 'hospital_personal', '0009_plantillaestudio', '2025-09-07 21:38:17.751204'),
	(30, 'hospital_personal', '0010_estudiosdiagnosticos_tipo_resultado', '2025-09-07 22:54:17.756936'),
	(31, 'hospital_personal', '0011_alter_plantillaestudio_estudio', '2025-09-08 18:08:15.601992'),
	(32, 'hospital_personal', '0012_resultadoimagen_resultadoestudio_imagenes', '2025-09-09 20:57:33.156483'),
	(33, 'hospital_personal', '0013_turnoestudio_asistio_alter_turnoestudio_estado', '2025-09-11 20:01:35.473869'),
	(34, 'hospital_personal', '0014_alter_usuarioxespecialidadxservicio_usuario', '2025-09-12 21:27:20.323907'),
	(35, 'controlUsuario', '0002_rolesprofesionales', '2025-09-16 01:34:30.174032'),
	(36, 'hospital_personal', '0015_usuarioxespecialidadxservicioxrolesprofesionales_and_more', '2025-09-16 01:45:25.583735'),
	(37, 'controlUsuario', '0003_rolesprofesionales_rol', '2025-09-16 19:44:26.964595'),
	(38, 'hospital_personal', '0016_remove_usuarioxespecialidadxservicioxrolesprofesionales_nombre_profesion_and_more', '2025-09-16 19:44:27.108725'),
	(39, 'controlUsuario', '0004_alter_usuario_numero_matricula_and_more', '2025-09-22 21:53:20.567666'),
	(40, 'hospital_personal', '0017_alter_lugar_tipo', '2025-09-22 21:53:20.674593'),
	(41, 'controlUsuario', '0005_remove_usuario_unique_numero_matricula_no_vacio', '2025-09-22 22:06:53.327252'),
	(42, 'controlUsuario', '0006_alter_persona_telefono', '2025-09-29 22:08:17.372370');

-- Volcando estructura para tabla hospitalbd.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_session: ~34 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('0jcpzogy1cmtv96mz3ujcje9bigwdsyw', '.eJxVjDsOwjAQRO_iGll2_A0lPWewdtcLDiBbipMKcXcSKQVUI817M2-RYF1KWjvPacriLIw4_XYI9OS6g_yAem-SWl3mCeWuyIN2eW2ZX5fD_Tso0Mu2Bs16ABfs6IJhomAIIehwI3BRccSsvB0ies8wZmW29Mhks2IdtEPx-QLsJDgs:1v4kAX:KMTO5rUzJ7YekMSY0njP5Ee4ZKAkBIITTRfKLZQbGaY', '2025-10-17 18:06:13.950687'),
	('0t7decbyydt9wv10spe6sz4z43o6zqt2', '.eJxVjE0OgjAYRO_StWlaSltg6d4zNN-fUiVAKKyMdxcSFrqaZObNe6sE29qnrciSMqtOOXX57RDoJeMx8BPGx6RpGtcloz4Qfa5F3yaW4Xqyf4IeSr-_wYqtwMe69dEJUXSEEG28E_jGSINsQl01GIJAy8btGVCoZiM2Wo-7VMoslGHIDJyA1g0G1VXt5wvaakDy:1v4kHf:l5Ag-Kt09vk4i86VIm7jGCtmKwfRj5Q4uOd5_Dc98vU', '2025-10-17 18:13:35.189506'),
	('13zlu8ht27rs7om3f9cj3egflbt3k15e', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uubd6:AqP3sShHlGCuT1I5yB5y4XUVAl9iF6hMenO9FzkXzLc', '2025-09-19 18:57:48.192750'),
	('1x8ohy3j9k0vav919bccgc1xpxai7rcm', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v1psz:L-DxRhyMYHZjWX9b5mYfkmbs1GlkFaajb6XHR05g76k', '2025-10-09 17:36:05.935215'),
	('2pi5iezbxwavcwtwmxdy20jj6724n0cr', '.eJxVjDsOwjAQRO_iGll2_A0lPWewdtcLDiBbipMKcXcSKQVUI817M2-RYF1KWjvPacriLIw4_XYI9OS6g_yAem-SWl3mCeWuyIN2eW2ZX5fD_Tso0Mu2Bs16ABfs6IJhomAIIehwI3BRccSsvB0ies8wZmW29Mhks2IdtEPx-QLsJDgs:1v4kBK:SoePiWKFLaD5sBeFkUdmb0OM08UI304uDuHG_Hch7jk', '2025-10-17 18:07:02.604535'),
	('2z3qelfg95t8173uzcxlzmx6mlzp2h1q', '.eJxVjEEOwiAQRe_C2hAKtYJL9z0DmWFmpGogKe3KeHfbpAvd_vfef6sI65Lj2niOE6mr6tXpd0NITy47oAeUe9WplmWeUO-KPmjTYyV-3Q737yBDy1uNRJ3YC6N3AkGY-RzQJbDQD8kbsbIBdMI4JAHTsTXgiXxwyTGKV58vMrQ56Q:1uxYgC:kZE6ad_EiGPS0smOH9YF8AaoweaqqWATlLAJA1xND8c', '2025-09-27 22:25:12.909293'),
	('45zxp7wij3hhrn6fpjy90hzsilp9q835', '.eJxVjDkOwjAUBe_iGllesGNT0nOG6G_GAeRIWSrE3UmkFNC-mXlv1cO61H6dZeoHVhd1VqffDYGe0nbAD2j3UdPYlmlAvSv6oLO-jSyv6-H-HVSY61Y7soY7Mi4VnxIWjgG82AzkslD2EKNLUTpLzAkQAwA4NJtnQ_GC6vMF9kA46A:1v3jra:_UW_gV2QvknCXGbEHESl9VMprYYGa6bpjHCNBM6dWjU', '2025-10-14 23:34:30.071715'),
	('5rxf0ts73wl7pnjrcjk5sz16qfen5n3b', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v1Xpv:kPt24qzl-oAsX9hJUNR8E3tLuruZ_34x8-oMMfB3mmY', '2025-10-08 22:19:43.592326'),
	('64mjageq31vqd55udxj51t1yk3ovepdr', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uwS3D:sPlKnkS9fYPio5s1UMeV8bm7y4oEMG7l1JRiHW4d3TU', '2025-09-24 21:08:23.821988'),
	('6dfz2tma52m4gt8q7pdhijz0daubc438', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v44Xd:DQkZiI0Wfl3syzIQijyR1caMvgTjvO9KlruyxQ3RVoA', '2025-10-15 21:39:17.295339'),
	('71d09tygq9mycv1zufciuaznml0tsmq2', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v06RQ:Kfsczb2rhQndUJdBWYxEqCXkwVfMbvs04oE5C3Ex1Dk', '2025-10-04 22:52:28.252193'),
	('bmi45ne2kma3sxtv3q4xy2rcqie83jej', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v2B5b:t1VBtlrFcUXeavTtK3lOuKVCqsP769K0B1z9RSoFCZ4', '2025-10-10 16:14:31.109184'),
	('d4bv2jyarl7nq2ijvscqgsv7o01k12g7', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v3Mx6:2Vc3c_RDtY5c0ga_hPMyRE83U80n0czNyr7VE86CHr0', '2025-10-13 23:06:40.633347'),
	('dkj8x86zefz3ilqt94rvdj4hpfrj7zv2', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v18WB:IkoiWJYormB158yZgf6onDCTk_ghh2qvmwxedEsnfFo', '2025-10-07 19:17:39.583396'),
	('dmqehiaauaechcgchmdt6cjwp18aq96b', '.eJxVjDkOwjAUBe_iGllesGNT0nOG6G_GAeRIWSrE3UmkFNC-mXlv1cO61H6dZeoHVhd1VqffDYGe0nbAD2j3UdPYlmlAvSv6oLO-jSyv6-H-HVSY61Y7soY7Mi4VnxIWjgG82AzkslD2EKNLUTpLzAkQAwA4NJtnQ_GC6vMF9kA46A:1v3OYI:uEPvd6YpgYD0-BQhnpIXkr5nQsnBkgpzAvChP1ufoyY', '2025-10-14 00:49:10.382917'),
	('e2pggaeldszk3h4km76nanob1niuikxn', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uts9r:UX_UW9ZiLrmhsoXHgkrbhEglXnM8EXQx2qybHMYipvs', '2025-09-17 18:24:35.799085'),
	('e9rp37rqavbfgjuf6y05rafn09hup4rj', '.eJxVjE0OgjAYBe_StWlKLVhYuvcMzfcrVQKGwsp4dyFhods38-ZtEqxLn9Yic8psOnM2p98NgZ4y7oAfMN4nS9O4zBntrtiDFnubWIbr4f4Feij99m4vokIaHSkFYnWBQsVVDRgEAzsNWKk_u8YHFIy-VdZGQ1N7logRt6iUl1CGITNwAlpWGEzn288XLSFCGQ:1v4kLM:l_mBg6jziSJWVK563AB09SO-vITcJ-Zkm1B0PMBWFow', '2025-10-17 18:17:24.555025'),
	('eipnxnh6e26r97ptanyc99yeu9ssatlo', '.eJxVjE0OgjAYBe_StWlKLVhYuvcMzfcrVQKGwsp4dyFhods38-ZtEqxLn9Yic8psOnM2p98NgZ4y7oAfMN4nS9O4zBntrtiDFnubWIbr4f4Feij99m4vokIaHSkFYnWBQsVVDRgEAzsNWKk_u8YHFIy-VdZGQ1N7logRt6iUl1CGITNwAlpWGEzn288XLSFCGQ:1v4kJf:6bhf5VzvYuB2LvJvYzoyA-mwgzWrWWiI5T4ESd3iebk', '2025-10-17 18:15:39.504706'),
	('eyo6dzxlq74pfdu4uxncuq2pmli8yuqi', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uvfrK:A15wJqaKRzEeP2Xu-cSeR-ZL51SDPjNBIKt32jCzC88', '2025-09-22 17:40:54.552458'),
	('fzparyfclonfmutitsn12yhhla8d6oae', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uxUPT:swd3XSNAPs9498l0eAMXyvaAQ7VEiQvLXFLcz1f8KxE', '2025-09-27 17:51:39.420830'),
	('i6ktgze21ubbl6flymgf5mt6c7ip2mmk', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uwnXP:9nQ54lnCi9IOWducinPWnULqvH9j378gMSm2M25Rirk', '2025-09-25 20:04:59.937042'),
	('iysp62785i7twxm0rbdavg6npzo8ou4c', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v0Pi3:w_Un2x1NQEqEJNLO7Dxxz3YWCpQm2dublcXm9PqatfM', '2025-10-05 19:26:55.296375'),
	('jwdt3e91qqx2q2087rl1o6z5ao701ifn', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uwPAF:48nuYzB8CHoBGpNwCKnPAuTNo17reJb55idyBx4u2bY', '2025-09-24 18:03:27.205799'),
	('mklw96umk9p5rbkgylf0nont57x4kp2z', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uuxoM:da2IrTXEN6JU2HdhpcIMLaGRubka52I6LuYlfNeJCI8', '2025-09-20 18:38:54.795060'),
	('n9g5seh6jd864kaeys5y98jvb24olm25', '.eJxVjEEOwiAQRe_C2hAKtYJL9z0DmWFmpGogKe3KeHfbpAvd_vfef6sI65Lj2niOE6mr6tXpd0NITy47oAeUe9WplmWeUO-KPmjTYyV-3Q737yBDy1uNRJ3YC6N3AkGY-RzQJbDQD8kbsbIBdMI4JAHTsTXgiXxwyTGKV58vMrQ56Q:1uw63G:D5rBGHxgwasbZyn9jpJPYMZNyzb6oAY0jYko_GmAXy8', '2025-09-23 21:38:58.878628'),
	('nfwzbnwx9o50923h7269b53bu7chq41r', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uuEF8:HEYcFYynjHVfldGplRELu7kgvsh5hIa91Lqqlxkr_RU', '2025-09-18 17:59:30.975017'),
	('on7dcua5oplsd6zsmwz84ksw5zxt1ma3', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uxpGu:oQmTB6rzVD2YZqD-ARSv5XsYVCOcqHydS2-Zc7jKDFQ', '2025-09-28 16:08:12.998847'),
	('oz3j1jhdh2er02rjd797edc6ekeqz7ww', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v2dD4:l7JJpMoTHBXMXSXC70Hi1PwLIULHxt4N1avvy-N9auM', '2025-10-11 22:16:06.439802'),
	('pyp4b73ngezk3jppy5bj97k20j2fni7w', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uyCFU:TqqbMFYs1BDeywiIWULX3Y4js-Ga_1qe7fEVeo9iHtM', '2025-09-29 16:40:16.741624'),
	('qb32nsyq4c4v6pdtrbd7eck12hh7v1h9', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v4M44:4QUJUWMb8woFQDq8ZXXLGcf_FkdF960q-SNMBFfGEOw', '2025-10-16 16:21:56.770433'),
	('rhzx34cxw955luxo8dtf57tgs6jj59ax', 'e30:1utvKP:ZhuzOrBQaWrM-JehZxTxkGnjWowulDpz8ovtBC5ntIY', '2025-09-17 21:47:41.021273'),
	('rvskw5kyrdlutn1fprd88swpqpkk7xq5', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uyL2v:YyoptZ9xfnn07CPDhOaAoYqFWeTE-A4eNsNGMnfOsH0', '2025-09-30 02:03:53.085080'),
	('rz967sme2vjt9sf8tmjpepl39ztmsmnk', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v2Ivq:giwuai1-oi0fEqpaHP39tmWKw6eZz3L_IbGfZm5EkBs', '2025-10-11 00:36:58.289803'),
	('sblec55b2lh1ha2fi1ypl7qiwcc1d6va', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1v4iAQ:IyhRoBchHRvEqRVHrvYKIkVx7rDKW4OZfT5xENRXc4w', '2025-10-17 15:57:58.010411'),
	('u1vlbx4fnrqu8widta1ekbvs5n23llse', '.eJxVjE0OgjAYRO_StWlaSltg6d4zNN-fUiVAKKyMdxcSFrqaZObNe6sE29qnrciSMqtOOXX57RDoJeMx8BPGx6RpGtcloz4Qfa5F3yaW4Xqyf4IeSr-_wYqtwMe69dEJUXSEEG28E_jGSINsQl01GIJAy8btGVCoZiM2Wo-7VMoslGHIDJyA1g0G1VXt5wvaakDy:1v2B4n:Drw43iJTMdjMizpVkIGnsCjvlLQlTEt4iLsRjOUkSko', '2025-10-10 16:13:41.514958'),
	('wmxvx49x8j5g8vmqk5jeasljt7ow831b', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uyYUY:0X2uerNZhzIPfnk79f0M17bc5vHIMO3JzR8c8ls3YMw', '2025-09-30 16:25:18.390397'),
	('yx9suqrxoyr40bsxuc0v9o86auou4re4', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1utcNf:4uoI6NgdHiDQw5TOfA8pccjiHn__rB5Sw_gOFBOjQUQ', '2025-09-17 01:33:47.853305'),
	('zdzz7jcfkkgl45ja4zyillgv7g0alx2k', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uzLSU:SHFlxTLEjBKr09tTdeXCZCb4QOR1utGu7nYJFjoecjE', '2025-10-02 20:42:26.286022'),
	('zg1se9rx4r86g46mi9ys1r4iu9lx2xmm', '.eJxVjE0OgjAYRO_StWlaSltg6d4zNN-fUiVAKKyMdxcSFrqaZObNe6sE29qnrciSMqtOOXX57RDoJeMx8BPGx6RpGtcloz4Qfa5F3yaW4Xqyf4IeSr-_wYqtwMe69dEJUXSEEG28E_jGSINsQl01GIJAy8btGVCoZiM2Wo-7VMoslGHIDJyA1g0G1VXt5wvaakDy:1v1VZB:-l-rSYy6s7iin7creGl-Tkv8PRRqocEvgTLF80x9Su8', '2025-10-08 19:54:17.468672'),
	('zquoph2x41qztkcrus0b5qhqh2cg1kle', '.eJxVjDsOwjAQRO_iGll2_A0lPWewdtcLDiBbipMKcXcSKQVUI817M2-RYF1KWjvPacriLIw4_XYI9OS6g_yAem-SWl3mCeWuyIN2eW2ZX5fD_Tso0Mu2Bs16ABfs6IJhomAIIehwI3BRccSsvB0ies8wZmW29Mhks2IdtEPx-QLsJDgs:1v4kFV:nI8aLnWfggz8cgYFHtoSAj8X9oEifePo3SZ2T35Hl4o', '2025-10-17 18:11:21.389089'),
	('zydj1nzb67n6amsdwkyndictnasstg99', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uw471:DBbXIyO6y2eRCK5dHhzwznnwEF_NWpvuRsqv4CBgpU0', '2025-09-23 19:34:43.205545');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_menoracargodepaciente: ~2 rows (aproximadamente)
INSERT INTO `hospital_pacientes_menoracargodepaciente` (`id`, `parentesco`, `adulto_id`, `menor_id`) VALUES
	(1, 'HIJO', 1, 2),
	(2, 'HIJO', 1, 3);

-- Volcando estructura para tabla hospitalbd.hospital_pacientes_paciente
CREATE TABLE IF NOT EXISTS `hospital_pacientes_paciente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `persona_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  CONSTRAINT `hospital_pacientes_p_persona_id_bd0c2004_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_paciente: ~3 rows (aproximadamente)
INSERT INTO `hospital_pacientes_paciente` (`id`, `direccion`, `persona_id`) VALUES
	(1, 'Calle Falsa 123', 4),
	(2, '', 5),
	(3, '', 6),
	(4, 'Calle falsa 12345', 10),
	(5, 'Calle Falsa 7664', 11);

-- Volcando estructura para tabla hospitalbd.hospital_personal_consultas
CREATE TABLE IF NOT EXISTS `hospital_personal_consultas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `diagnostico` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `tratamiento` longtext COLLATE utf8mb4_general_ci,
  `observaciones` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `turno_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_co_turno_id_bd73b20a_fk_hospital_` (`turno_id`),
  CONSTRAINT `hospital_personal_co_turno_id_bd73b20a_fk_hospital_` FOREIGN KEY (`turno_id`) REFERENCES `hospital_personal_turno` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_consultas: ~4 rows (aproximadamente)
INSERT INTO `hospital_personal_consultas` (`id`, `diagnostico`, `tratamiento`, `observaciones`, `fecha`, `turno_id`) VALUES
	(1, 'Hipotiroidismo subclínico probable (a confirmar con estudios de laboratorio)', 'Inicio de terapia con levotiroxina si se confirma hipotiroidismo clínico.\r\nAjuste de dieta: rica en proteínas y yodo, control de déficit de hierro y vitamina D.', 'Paciente refiere caída de cabello difusa, principalmente en la zona frontal y coronilla\r\nFatiga leve, sensación de frío y aumento de peso reciente', '2025-09-03 22:34:36.968159', 2),
	(2, 'Retraso del crecimiento / Talla baja de causa a determinar (posible déficit de hormona de crecimiento, causas constitucionales o endocrinas).', 'Aún no se indica tratamiento. Se realizarán estudios para evaluar función hormonal y descartar causas patológicas de talla baja.', 'Paciente traído por sus padres por preocupación respecto al crecimiento. Al examen físico se observa talla por debajo del percentilo 3 para su edad. No se observan signos clínicos evidentes de pubertad adelantada o retrasada. Se solicita estudio completo antes de avanzar con diagnóstico definitivo.', '2025-09-04 18:06:27.095389', 3),
	(3, 'Dislipidemia sospechada. Paciente con antecedentes personales/familiares de enfermedades cardiovasculares y/o factores de riesgo como sedentarismo, dieta inadecuada o sobrepeso.', 'Por el momento, se indica control dietario y actividad física regular. No se inicia tratamiento farmacológico hasta contar con resultados de laboratorio.', 'El paciente refiere cansancio ocasional, leve cefalea y antecedentes familiares de hipercolesterolemia. No presenta síntomas cardiovasculares agudos al momento. Se realiza control de rutina. Se evalúa riesgo metabólico. Examen físico sin hallazgos patológicos relevantes.', '2025-09-08 19:11:46.496640', 4),
	(4, 'Lumbalgia mecánica aguda.', 'Reposo relativo, aplicación de calor local, corrección de postura, evitar cargas pesadas.', 'Paciente masculino de 21 años refiere dolor lumbar de 3 días de evolución, sin irradiación, que aumenta con esfuerzo físico y mejora con reposo. No signos de alarma (fiebre, pérdida de peso, incontinencia, debilidad en miembros inferiores). Se realiza exploración física con hallazgos compatibles con lumbalgia mecánica. Se indica manejo ambulatorio.', '2025-09-09 21:37:47.536736', 5),
	(5, 'Hipertensión arterial en evaluación inicial. Probable hipertensión esencial estadio 1.', 'Se inicia control ambulatorio de presión arterial. Se indica monitoreo domiciliario durante 7 días. Se recomiendan medidas higiénico-dietéticas (reducción de sal, ejercicio moderado, evitar alcohol y tabaco). No se indica tratamiento farmacológico por el momento.', 'Paciente de 21 años, sin antecedentes cardíacos conocidos, refiere cifras elevadas de presión arterial en controles ocasionales (promedio 145/95 mmHg). No presenta síntomas asociados (palpitaciones, disnea, dolor torácico). Se encuentra normotenso al examen físico en consultorio. Se solicita ECG en reposo como parte de la evaluación inicial.', '2025-09-10 22:21:05.857932', 6);

-- Volcando estructura para tabla hospitalbd.hospital_personal_departamento
CREATE TABLE IF NOT EXISTS `hospital_personal_departamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
	(11, 'Dermatología', 'Enfermedades de la piel.', 'Especializado en el diagnóstico y tratamiento de enfermedades de la piel, cabello y uñas, tales como acné, psoriasis, dermatitis, cáncer de piel, y trastornos estéticos.'),
	(12, 'Cardiología', 'Especialidad Clínica', 'El Departamento de Cardiología se encarga del diagnóstico, tratamiento y seguimiento de enfermedades cardiovasculares. Atiende pacientes con patologías como hipertensión, insuficiencia cardíaca, arritmias, cardiopatías congénitas y enfermedad coronaria, entre otras.\r\n\r\nOfrece estudios como electrocardiograma, ecocardiograma, monitoreo Holter, pruebas de esfuerzo (ergometría) y control de marcapasos. Brinda atención ambulatoria, internación en unidad coronaria y participa activamente en programas de prevención cardiovascular.');

-- Volcando estructura para tabla hospitalbd.hospital_personal_especialidades
CREATE TABLE IF NOT EXISTS `hospital_personal_especialidades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_especialidad` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `departamento_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_departamento_id_c964bc2b_fk_hospital_` (`departamento_id`),
  CONSTRAINT `hospital_personal_es_departamento_id_c964bc2b_fk_hospital_` FOREIGN KEY (`departamento_id`) REFERENCES `hospital_personal_departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_especialidades: ~40 rows (aproximadamente)
INSERT INTO `hospital_personal_especialidades` (`id`, `nombre_especialidad`, `descripcion`, `departamento_id`) VALUES
	(1, 'Medicina de Urgencias', 'Especialidad que se ocupa de la atención inmediata a pacientes en situaciones de emergencia y urgencias médicas, como accidentes o enfermedades repentinas.', 1),
	(2, 'Trauma y Cirugía de Urgencias', 'Especialidad centrada en el manejo de traumas y lesiones en situaciones de emergencia que requieren intervención quirúrgica urgente.', 1),
	(3, 'Medicina General', 'Especialidad que se encarga de la atención primaria de la salud, diagnóstico y tratamiento de enfermedades comunes y prevención.', 2),
	(4, 'Pediatría', 'Especialidad que se dedica a la atención médica de niños y adolescentes, desde el nacimiento hasta la adolescencia.', 2),
	(5, 'Ginecología y Obstetricia', 'Especialidad médica que atiende la salud reproductiva femenina, abarcando desde consultas ginecológicas hasta seguimiento prenatal y postnatal.', 2),
	(6, 'Dermatología', 'Especialidad que diagnostica y trata las enfermedades de la piel, cabello y uñas, incluyendo enfermedades dermatológicas comunes y estéticas.', 2),
	(7, 'Cirugía General', 'Especialidad que se enfoca en el tratamiento quirúrgico de diversas patologías, incluyendo intervenciones en órganos y tejidos internos.', 3),
	(8, 'Cirugía Oncológica', 'Especialidad quirúrgica que se dedica al diagnóstico y tratamiento quirúrgico del cáncer en diversas partes del cuerpo.', 3),
	(9, 'Cirugía Vascular', 'Especialidad que aborda las enfermedades de los vasos sanguíneos, mediante procedimientos quirúrgicos.', 3),
	(10, 'Medicina Crítica', 'Especialidad médica que se encarga del manejo de pacientes en estado crítico, incluyendo soporte vital y monitoreo intensivo.', 4),
	(11, 'Anestesiología', 'Especialidad médica que se ocupa de la administración de anestesia y el manejo del dolor en procedimientos quirúrgicos o críticos.', 4),
	(12, 'Radiología General', 'Especialidad que se enfoca en el uso de técnicas de imagen, como rayos X, para diagnóstico de diversas enfermedades y lesiones.', 5),
	(13, 'Radiología Pediátrica', 'Especialidad que se enfoca en realizar estudios de imagen para niños, adaptados a sus características físicas y patológicas.', 5),
	(14, 'Patología', 'Especialidad médica que se ocupa del diagnóstico de enfermedades a través de análisis de muestras biológicas.', 6),
	(15, 'Microbiología', 'Especialidad enfocada en el diagnóstico de infecciones mediante análisis microbiológicos de muestras de sangre, orina, etc.', 6),
	(16, 'Farmacia Clínica', 'Especialidad que se ocupa del uso racional de los medicamentos en pacientes hospitalizados o ambulatorios, para garantizar la seguridad y efectividad del tratamiento.', 7),
	(17, 'Oncología Médica', 'Especialidad que trata el cáncer mediante quimioterapia, terapias biológicas y seguimiento de pacientes con cáncer en todas sus fases.', 8),
	(18, 'Oncología Ginecológica', 'Especialidad médica que trata los cánceres relacionados con el aparato reproductivo femenino, como cáncer de ovario y de cuello uterino.', 8),
	(19, 'Neonatología', 'Especialidad médica que se ocupa del cuidado de recién nacidos, especialmente aquellos que nacen prematuramente o con enfermedades.', 9),
	(20, 'Pediatría General', 'Especialidad que proporciona atención médica general a niños y adolescentes, abarcando el tratamiento de enfermedades y el seguimiento del desarrollo.', 9),
	(21, 'Obstetricia', 'Especialidad que se ocupa del manejo del embarazo, el parto y el postparto, incluyendo la salud de la madre y el bebé.', 10),
	(22, 'Ginecología', 'Especialidad médica que se encarga del diagnóstico y tratamiento de enfermedades del aparato reproductivo femenino, incluyendo trastornos menstruales y cáncer ginecológico.', 10),
	(23, 'Dermatología Estética', 'Especialidad que trata las afecciones estéticas de la piel, cabello y uñas, como rejuvenecimiento facial, tratamientos contra la caída del cabello, etc.', 11),
	(24, 'Cirugía Dermatológica', 'Especialidad quirúrgica que se ocupa de realizar procedimientos en la piel, como la eliminación de tumores cutáneos, tratamiento de cicatrices, etc.', 11),
	(25, 'Medicina de Emergencias Pediátricas', 'Especialidad que se ocupa de la atención de emergencias médicas en niños, considerando sus necesidades específicas.', 1),
	(26, 'Medicina de Desastres', 'Especialidad que se encarga de la atención de emergencias y desastres masivos, como accidentes múltiples, desastres naturales, etc.', 1),
	(27, 'Cardiología', 'Especialidad que se dedica a diagnosticar y tratar enfermedades del corazón y del sistema circulatorio.', 2),
	(28, 'Neumología', 'Especialidad que se ocupa de las enfermedades respiratorias, como el asma, bronquitis crónica, neumonía, entre otras.', 2),
	(29, 'Endocrinología', 'Especialidad médica que trata trastornos hormonales y metabólicos, como diabetes, hipotiroidismo, etc.', 2),
	(30, 'Oftalmología', 'Especialidad que se dedica al diagnóstico y tratamiento de enfermedades y trastornos visuales.', 2),
	(31, 'Otorrinolaringología', 'Especialidad que se enfoca en el diagnóstico y tratamiento de enfermedades relacionadas con los oídos, nariz y garganta.', 2),
	(32, 'Urología', 'Especialidad que trata enfermedades del sistema urinario y los órganos reproductores masculinos, incluyendo problemas renales y de próstata.', 2),
	(33, 'Reumatología', 'Especialidad médica que diagnostica y trata enfermedades autoinmunes y enfermedades musculoesqueléticas como artritis y lupus.', 2),
	(34, 'Gastroenterología', 'Especialidad dedicada al diagnóstico y tratamiento de enfermedades del aparato digestivo, incluyendo el hígado, páncreas y colon.', 2),
	(35, 'Neurología', 'Especialidad médica que se ocupa de los trastornos del sistema nervioso central y periférico, como accidentes cerebrovasculares, esclerosis múltiple, etc.', 2),
	(36, 'Cirugía Torácica', 'Especialidad quirúrgica que se ocupa del tratamiento de enfermedades del tórax, incluidos los pulmones y el corazón.', 3),
	(37, 'Cirugía Plástica y Estética', 'Especialidad que se dedica a la reparación de tejidos y a los procedimientos estéticos reconstructivos.', 3),
	(38, 'Cirugía Ortopédica', 'Especialidad quirúrgica que trata problemas musculoesqueléticos, incluyendo fracturas, deformidades y trastornos articulares.', 3),
	(39, 'Neurocrítica', 'Especialidad que se ocupa del tratamiento de pacientes con trastornos neurológicos graves, como traumatismos craneoencefálicos o ACVs.', 4),
	(40, 'Cuidados Paliativos', 'Especialidad que se centra en el alivio del dolor y el sufrimiento de pacientes con enfermedades terminales o crónicas.', 4);

-- Volcando estructura para tabla hospitalbd.hospital_personal_estudiosdiagnosticos
CREATE TABLE IF NOT EXISTS `hospital_personal_estudiosdiagnosticos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_estudio` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `especialidad_id` bigint NOT NULL,
  `servicio_diagnostico_id` bigint NOT NULL,
  `tipo_resultado` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` (`servicio_diagnostico_id`),
  KEY `hospital_personal_es_especialidad_id_2069348a_fk_hospital_` (`especialidad_id`),
  CONSTRAINT `hospital_personal_es_especialidad_id_2069348a_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_estudiosdiagnosticos: ~270 rows (aproximadamente)
INSERT INTO `hospital_personal_estudiosdiagnosticos` (`id`, `nombre_estudio`, `especialidad_id`, `servicio_diagnostico_id`, `tipo_resultado`) VALUES
	(1, 'Radiografía de tórax de urgencia', 1, 1, 'img'),
	(2, 'Radiografía de abdomen de urgencia', 1, 1, 'img'),
	(3, 'Radiografía de pelvis', 1, 1, 'img'),
	(4, 'Ecografía FAST', 1, 2, 'img'),
	(5, 'Ecografía abdominal rápida', 1, 2, 'img'),
	(6, 'Ecocardiografía rápida', 1, 2, 'img'),
	(7, 'TAC de cráneo sin contraste', 1, 3, 'img'),
	(8, 'TAC de tórax de emergencia', 1, 3, 'img'),
	(9, 'TAC abdominal de urgencia', 1, 3, 'img'),
	(10, 'TAC de columna cervical', 1, 3, 'img'),
	(11, 'Radiografía de huesos largos', 2, 1, 'img'),
	(12, 'Radiografía de columna cervical', 2, 1, 'img'),
	(13, 'Radiografía de tórax post-trauma', 2, 1, 'img'),
	(14, 'Ecografía FAST extendido', 2, 2, 'img'),
	(15, 'Ecografía abdominal en trauma', 2, 2, 'img'),
	(16, 'TAC de tórax politrauma', 2, 3, 'img'),
	(17, 'TAC de abdomen politrauma', 2, 3, 'img'),
	(18, 'TAC de cráneo trauma cerrado', 2, 3, 'img'),
	(19, 'TAC de pelvis politrauma', 2, 3, 'img'),
	(20, 'TAC cuerpo entero (Whole Body CT)', 2, 3, 'img'),
	(21, 'Radiografía de tórax pediátrica', 25, 1, 'img'),
	(22, 'Radiografía de huesos largos pediátricos', 25, 1, 'img'),
	(23, 'Radiografía de abdomen pediátrico', 25, 1, 'img'),
	(24, 'Ecografía abdominal pediátrica', 25, 2, 'img'),
	(25, 'Ecografía cerebral neonatal', 25, 2, 'img'),
	(26, 'Ecografía renal pediátrica', 25, 2, 'img'),
	(27, 'TAC craneal pediátrico', 25, 3, 'img'),
	(28, 'TAC de tórax pediátrico', 25, 3, 'img'),
	(29, 'TAC abdominal pediátrico', 25, 3, 'img'),
	(30, 'TAC de columna pediátrica', 25, 3, 'img'),
	(31, 'Radiografía de tórax múltiples víctimas', 26, 1, 'img'),
	(32, 'Radiografía de pelvis múltiples víctimas', 26, 1, 'img'),
	(33, 'Radiografía de columna múltiples víctimas', 26, 1, 'img'),
	(34, 'Ecografía FAST en desastre', 26, 2, 'img'),
	(35, 'Ecografía abdominal rápida en desastre', 26, 2, 'img'),
	(36, 'Ecografía cardiaca rápida en desastre', 26, 2, 'img'),
	(37, 'TAC de cráneo en catástrofe', 26, 3, 'img'),
	(38, 'TAC de tórax en catástrofe', 26, 3, 'img'),
	(39, 'TAC de abdomen en catástrofe', 26, 3, 'img'),
	(40, 'TAC cuerpo entero en catástrofe', 26, 3, 'img'),
	(41, 'Hemograma completo', 3, 4, 'lab'),
	(42, 'Examen de orina completo', 3, 4, 'lab'),
	(43, 'Perfil lipídico', 3, 4, 'lab'),
	(44, 'Glucemia en ayunas', 3, 4, 'lab'),
	(45, 'Pruebas de función hepática', 3, 4, 'lab'),
	(46, 'Pruebas de función renal', 3, 4, 'lab'),
	(47, 'Electrocardiograma en reposo', 3, 5, 'fisio'),
	(48, 'Examen visual básico', 3, 10, 'eval'),
	(49, 'Examen auditivo básico', 3, 9, 'eval'),
	(50, 'Prueba de alergia general', 3, 11, 'lab'),
	(51, 'Hemograma pediátrico', 4, 4, 'lab'),
	(52, 'Examen de orina pediátrico', 4, 4, 'lab'),
	(53, 'Perfil metabólico pediátrico', 4, 4, 'lab'),
	(54, 'Prueba neonatal de hipotiroidismo', 4, 29, 'lab'),
	(55, 'Ecografía abdominal pediátrica', 4, 30, 'img'),
	(56, 'Ecografía cerebral pediátrica', 4, 30, 'img'),
	(57, 'Examen auditivo neonatal', 4, 29, 'eval'),
	(58, 'Examen visual pediátrico', 4, 10, 'eval'),
	(59, 'Pruebas de alergia pediátricas', 4, 11, 'lab'),
	(60, 'Cultivo de orina pediátrico', 4, 4, 'lab'),
	(61, 'Ecografía ginecológica transvaginal', 5, 31, 'img'),
	(62, 'Ecografía transabdominal', 5, 31, 'img'),
	(63, 'Ecografía de control de folículos', 5, 31, 'img'),
	(64, 'Perfil hormonal femenino', 5, 32, 'lab'),
	(65, 'Prueba de fertilidad básica', 5, 32, 'lab'),
	(66, 'Prueba de fertilidad avanzada', 5, 32, 'lab'),
	(67, 'Examen Papanicolaou', 5, 4, 'lab'),
	(68, 'Colposcopia', 5, 31, 'img'),
	(69, 'Biopsia endometrial', 5, 4, 'lab'),
	(70, 'Examen de orina en embarazo', 5, 4, 'lab'),
	(71, 'Dermatoscopia de lunares', 6, 33, 'img'),
	(72, 'Dermatoscopia de lesiones pigmentadas', 6, 33, 'img'),
	(73, 'Pruebas de alergia dermatológica', 6, 34, 'lab'),
	(74, 'Prueba del parche (epicutánea)', 6, 34, 'lab'),
	(75, 'Biopsia de piel', 6, 33, 'lab'),
	(76, 'Cultivo micológico', 6, 34, 'lab'),
	(77, 'Examen bacteriológico de piel', 6, 34, 'lab'),
	(78, 'Dermatoscopia digital', 6, 33, 'img'),
	(79, 'Examen capilar (tricograma)', 6, 34, 'eval'),
	(80, 'Examen de uñas (onicopatías)', 6, 34, 'eval'),
	(81, 'Electrocardiograma en reposo', 27, 5, 'fisio'),
	(82, 'Electrocardiograma de esfuerzo', 27, 5, 'fisio'),
	(83, 'Holter de 24 horas', 27, 5, 'fisio'),
	(84, 'Prueba de esfuerzo ergométrica', 27, 5, 'fisio'),
	(85, 'Ecocardiograma Doppler', 27, 6, 'img'),
	(86, 'Ecocardiograma transtorácico', 27, 6, 'img'),
	(87, 'Ecocardiograma transesofágico', 27, 6, 'img'),
	(88, 'Prueba de función cardíaca basal', 27, 5, 'fisio'),
	(89, 'Prueba de esfuerzo farmacológica', 27, 5, 'fisio'),
	(90, 'Prueba de variabilidad cardíaca', 27, 5, 'fisio'),
	(91, 'Espirometría simple', 28, 7, 'fisio'),
	(92, 'Espirometría forzada', 28, 7, 'fisio'),
	(93, 'Prueba broncodilatadora', 28, 7, 'fisio'),
	(94, 'Prueba de difusión pulmonar', 28, 7, 'fisio'),
	(95, 'Prueba de función pulmonar completa', 28, 7, 'fisio'),
	(96, 'Prueba de resistencia de vías aéreas', 28, 7, 'fisio'),
	(97, 'Test de marcha de 6 minutos', 28, 7, 'fisio'),
	(98, 'Radiografía de tórax control', 28, 18, 'img'),
	(99, 'TAC de tórax alta resolución', 28, 19, 'img'),
	(100, 'Resonancia pulmonar', 28, 20, 'img'),
	(101, 'Perfil tiroideo completo', 29, 23, 'lab'),
	(102, 'Prueba de TSH', 29, 23, 'lab'),
	(103, 'Prueba de T4 libre', 29, 23, 'lab'),
	(104, 'Prueba de T3', 29, 23, 'lab'),
	(105, 'Prueba de anticuerpos antitiroideos', 29, 23, 'lab'),
	(106, 'Perfil glucémico', 29, 23, 'lab'),
	(107, 'Prueba de tolerancia a la glucosa', 29, 23, 'lab'),
	(108, 'Prueba de insulina basal', 29, 23, 'lab'),
	(109, 'Prueba de hemoglobina glicosilada', 29, 23, 'lab'),
	(110, 'Perfil lipídico endocrinológico', 29, 23, 'lab'),
	(111, 'Examen de agudeza visual', 30, 10, 'eval'),
	(112, 'Campimetría visual', 30, 10, 'eval'),
	(113, 'Fondo de ojo', 30, 10, 'eval'),
	(114, 'Tonometría ocular', 30, 10, 'eval'),
	(115, 'Prueba de motilidad ocular', 30, 10, 'eval'),
	(116, 'Prueba de visión de colores', 30, 10, 'eval'),
	(117, 'Examen con lámpara de hendidura', 30, 10, 'eval'),
	(118, 'Retinografía', 30, 10, 'eval'),
	(119, 'OCT (Tomografía de coherencia óptica)', 30, 10, 'eval'),
	(120, 'Paquimetría corneal', 30, 10, 'eval'),
	(121, 'Audiometría tonal', 31, 9, 'eval'),
	(122, 'Audiometría impedanciométrica', 31, 9, 'eval'),
	(123, 'Videoendoscopía nasofaríngea', 31, 6, 'img'),
	(124, 'Timpanometría', 31, 9, 'eval'),
	(125, 'Pruebas de equilibrio vestibular', 31, 9, 'eval'),
	(126, 'Examen de laringe con fibra óptica', 31, 6, 'eval'),
	(127, 'Otoemisiones acústicas', 31, 9, 'eval'),
	(128, 'Cultivo de exudado faríngeo', 31, 6, 'eval'),
	(129, 'Prueba de olfato', 31, 6, 'eval'),
	(130, 'TAC de senos paranasales', 31, 19, 'img'),
	(131, 'Uroanálisis completo', 32, 24, 'lab'),
	(132, 'Ecografía renal y vesical', 32, 21, 'img'),
	(133, 'Uro-TAC', 32, 19, 'img'),
	(134, 'Cistoscopia', 32, 6, 'img'),
	(135, 'Pruebas de función renal', 32, 4, 'lab'),
	(136, 'Uro-RM (Resonancia Magnética)', 32, 20, 'img'),
	(137, 'Flujometría urinaria', 32, 24, 'fisio'),
	(138, 'Estudio de próstata (PSA)', 32, 23, 'lab'),
	(139, 'Cultivo de orina', 32, 24, 'lab'),
	(140, 'Urografía intravenosa', 32, 19, 'img'),
	(141, 'Perfil inflamatorio', 33, 4, 'lab'),
	(142, 'Factor reumatoide', 33, 4, 'lab'),
	(143, 'Anticuerpos anti-CCP', 33, 4, 'lab'),
	(144, 'Análisis de líquido sinovial', 33, 4, 'lab'),
	(145, 'Radiografía de articulaciones', 33, 18, 'img'),
	(146, 'Resonancia magnética de articulaciones', 33, 20, 'img'),
	(147, 'Ultrasonido musculoesquelético', 33, 21, 'img'),
	(148, 'Densitometría ósea', 33, 18, 'img'),
	(149, 'Pruebas HLA-B27', 33, 23, 'lab'),
	(150, 'Examen físico especializado en artritis', 33, 6, 'eval'),
	(151, 'Endoscopia digestiva alta', 34, 8, 'img'),
	(152, 'Colonoscopia', 34, 8, 'img'),
	(153, 'Ecografía abdominal', 34, 21, 'img'),
	(154, 'TAC abdominal', 34, 19, 'img'),
	(155, 'Pruebas de función hepática', 34, 4, 'lab'),
	(156, 'Test de Helicobacter pylori', 34, 24, 'lab'),
	(157, 'Biopsia gastrointestinal', 34, 27, 'lab'),
	(158, 'Resonancia magnética abdominal', 34, 20, 'img'),
	(159, 'Fibroscan hepático', 34, 20, 'img'),
	(160, 'pHmetría esofágica', 34, 7, 'fisio'),
	(161, 'Electroencefalograma (EEG)', 35, 17, 'fisio'),
	(162, 'Potenciales evocados', 35, 17, 'fisio'),
	(163, 'TAC craneal', 35, 19, 'img'),
	(164, 'RM cerebral', 35, 20, 'img'),
	(165, 'Estudio de conducción nerviosa', 35, 17, 'fisio'),
	(166, 'Electromiografía (EMG)', 35, 17, 'fisio'),
	(167, 'Monitorización ambulatoria de EEG', 35, 17, 'fisio'),
	(168, 'Examen neurológico completo', 35, 6, 'eval'),
	(169, 'Líquido cefalorraquídeo', 35, 23, 'lab'),
	(170, 'Ecografía Doppler de vasos cerebrales', 35, 6, 'img'),
	(171, 'Radiografía preoperatoria', 7, 12, 'img'),
	(172, 'TAC abdominal preoperatorio', 7, 19, 'img'),
	(173, 'RM de órganos internos', 7, 20, 'img'),
	(174, 'Ecografía preoperatoria', 7, 21, 'img'),
	(175, 'Marcadores tumorales', 7, 23, 'lab'),
	(176, 'Examen de laboratorio prequirúrgico', 7, 4, 'lab'),
	(177, 'Electrocardiograma prequirúrgico', 7, 5, 'fisio'),
	(178, 'Prueba de función pulmonar', 7, 7, 'fisio'),
	(179, 'Biopsia de tejidos', 7, 27, 'lab'),
	(180, 'Resonancia o TAC de planificación quirúrgica', 7, 20, 'img'),
	(181, 'Biopsia tumoral', 8, 27, 'lab'),
	(182, 'Marcadores tumorales', 8, 23, 'lab'),
	(183, 'TAC prequirúrgico de tumor', 8, 19, 'img'),
	(184, 'RM prequirúrgica de tumor', 8, 20, 'img'),
	(185, 'PET-CT', 8, 19, 'img'),
	(186, 'Ecografía abdominal en cáncer', 8, 21, 'img'),
	(187, 'Radiografía de tórax en oncología', 8, 18, 'img'),
	(188, 'Pruebas hematológicas', 8, 4, 'lab'),
	(189, 'Endoscopia oncológica', 8, 8, 'img'),
	(190, 'Estudios de función hepática y renal', 8, 4, 'lab'),
	(191, 'Doppler arterial', 9, 21, 'img'),
	(192, 'Doppler venoso', 9, 21, 'img'),
	(193, 'Angiografía por TAC', 9, 19, 'img'),
	(194, 'Angiografía por RM', 9, 20, 'img'),
	(195, 'Ecografía vascular', 9, 21, 'img'),
	(196, 'Pruebas de coagulación', 9, 4, 'lab'),
	(197, 'Examen físico vascular', 9, 6, 'eval'),
	(198, 'TAC de vasos periféricos', 9, 19, 'img'),
	(199, 'RM de vasos periféricos', 9, 20, 'img'),
	(200, 'Estudio de perfusión tisular', 9, 21, 'fisio'),
	(201, 'Radiografía de tórax preoperatoria', 36, 18, 'img'),
	(202, 'TAC torácico', 36, 19, 'img'),
	(203, 'RM torácica', 36, 20, 'img'),
	(204, 'Broncoscopia diagnóstica', 36, 8, 'img'),
	(205, 'Pruebas de función pulmonar', 36, 7, 'fisio'),
	(206, 'Ecografía torácica', 36, 21, 'img'),
	(207, 'Marcadores tumorales pulmonares', 36, 23, 'lab'),
	(208, 'Gammagrafía pulmonar', 36, 19, 'img'),
	(209, 'Examen preoperatorio general', 36, 4, 'lab'),
	(210, 'Biopsia pulmonar', 36, 27, 'lab'),
	(211, 'Evaluación prequirúrgica de piel', 37, 6, 'eval'),
	(212, 'Fotografía médica preoperatoria', 37, 6, 'eval'),
	(213, 'Ecografía de tejidos blandos', 37, 21, 'img'),
	(214, 'Biopsia cutánea', 37, 27, 'lab'),
	(215, 'Laboratorio preoperatorio', 37, 4, 'lab'),
	(216, 'Evaluación de coagulación', 37, 4, 'lab'),
	(217, 'TAC de área quirúrgica', 37, 19, 'img'),
	(218, 'RM de área quirúrgica', 37, 20, 'img'),
	(219, 'Evaluación vascular de colgajos', 37, 21, 'img'),
	(220, 'Estudio de función respiratoria', 37, 7, 'fisio'),
	(221, 'Radiografía de articulaciones', 38, 18, 'img'),
	(222, 'TAC de fracturas complejas', 38, 19, 'img'),
	(223, 'RM de articulaciones', 38, 20, 'img'),
	(224, 'Densitometría ósea', 38, 18, 'img'),
	(225, 'Ultrasonido musculoesquelético', 38, 21, 'img'),
	(226, 'Estudios de laboratorio prequirúrgicos', 38, 4, 'lab'),
	(227, 'Electrocardiograma preoperatorio', 38, 5, 'fisio'),
	(228, 'Pruebas de función pulmonar', 38, 7, 'fisio'),
	(229, 'Biopsia ósea', 38, 27, 'lab'),
	(230, 'Evaluación física ortopédica completa', 38, 6, 'eval'),
	(231, 'Monitoreo hemodinámico', 10, 15, 'fisio'),
	(232, 'Gasometría arterial', 10, 23, 'lab'),
	(233, 'Electrocardiograma continuo', 10, 5, 'fisio'),
	(234, 'Radiografía de tórax de UCI', 10, 18, 'img'),
	(235, 'Ecografía abdominal en UCI', 10, 21, 'img'),
	(236, 'TAC urgente en UCI', 10, 19, 'img'),
	(237, 'Resonancia magnética urgente', 10, 20, 'img'),
	(238, 'Laboratorio clínico completo', 10, 4, 'lab'),
	(239, 'Monitoreo de presión intracraneal', 10, 15, 'fisio'),
	(240, 'Pruebas de función renal y hepática', 10, 4, 'lab'),
	(241, 'Evaluación preanestésica', 11, 6, 'eval'),
	(242, 'Monitoreo intraoperatorio', 11, 15, 'fisio'),
	(243, 'Gasometría arterial', 11, 23, 'fisio'),
	(244, 'Electrocardiograma preanestésico', 11, 5, 'fisio'),
	(245, 'Pruebas de coagulación', 11, 4, 'lab'),
	(246, 'Ecografía para bloqueos nerviosos', 11, 21, 'img'),
	(247, 'Monitoreo de oxigenación y ventilación', 11, 15, 'fisio'),
	(248, 'Evaluación respiratoria preoperatoria', 11, 7, 'fisio'),
	(249, 'Laboratorio preoperatorio', 11, 4, 'lab'),
	(250, 'Pruebas de función hepática y renal', 11, 4, 'lab'),
	(251, 'Monitorización neurológica', 39, 17, 'fisio'),
	(252, 'Electroencefalograma en pacientes críticos', 39, 17, 'fisio'),
	(253, 'TAC de cráneo urgente', 39, 19, 'img'),
	(254, 'RM cerebral urgente', 39, 20, 'img'),
	(255, 'Evaluación laboratorio neurocrítico', 39, 4, 'lab'),
	(256, 'Monitoreo de presión intracraneal', 39, 15, 'fisio'),
	(257, 'Gasometría arterial', 39, 23, 'fisio'),
	(258, 'Evaluación neurológica completa', 39, 6, 'eval'),
	(259, 'Ultrasonido transcraneal', 39, 21, 'img'),
	(260, 'Ecografía Doppler cerebral', 39, 21, 'img'),
	(261, 'Evaluación clínica paliativa', 40, 6, 'eval'),
	(262, 'Monitoreo de signos vitales', 40, 15, 'fisio'),
	(263, 'Laboratorio básico', 40, 4, 'lab'),
	(264, 'Pruebas de función renal y hepática', 40, 4, 'lab'),
	(265, 'Electrocardiograma', 40, 5, 'fisio'),
	(266, 'Evaluación del dolor', 40, 6, 'eval'),
	(267, 'Exámenes de imagen según necesidad', 40, 18, 'img'),
	(268, 'Evaluación nutricional', 40, 4, 'lab'),
	(269, 'Pruebas de coagulación', 40, 4, 'lab'),
	(270, 'Ultrasonido general', 40, 21, 'img'),
	(271, 'Radiografía lumbosacra', 3, 18, 'img');

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

-- Volcando estructura para tabla hospitalbd.hospital_personal_lugar
CREATE TABLE IF NOT EXISTS `hospital_personal_lugar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `piso` int NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `capacidad` int NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci,
  `es_critico` tinyint(1) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_lugar: ~153 rows (aproximadamente)
INSERT INTO `hospital_personal_lugar` (`id`, `nombre`, `tipo`, `piso`, `codigo`, `estado`, `capacidad`, `descripcion`, `es_critico`, `activo`) VALUES
	(1, 'Sala de Urgencias 1', 'hab', 1, 'URG-101', 'ocupado', 4, 'Sala de atención inmediata para emergencias médicas.', 1, 1),
	(2, 'Sala de Urgencias 2', 'hab', 1, 'URG-102', 'disponible', 4, 'Sala equipada con camillas y monitores de emergencia.', 1, 1),
	(3, 'Consultorio de Urgencias 1', 'cons', 1, 'CONS-URG-103', 'disponible', 1, 'Consultorio de primera atención de emergencias.', 1, 1),
	(4, 'Quirófano de Trauma 1', 'qui', 2, 'QUI-TRA-201', 'ocupado', 1, 'Quirófano para intervenciones urgentes por trauma.', 1, 1),
	(5, 'Quirófano de Trauma 2', 'qui', 2, 'QUI-TRA-202', 'disponible', 1, 'Quirófano preparado para cirugía de urgencia.', 1, 1),
	(6, 'Sala de Reanimación 1', 'hab', 2, 'REA-203', 'disponible', 2, 'Sala para reanimación post-trauma y emergencias quirúrgicas.', 1, 1),
	(7, 'Consultorio de Medicina General 1', 'cons', 1, 'CONS-MG-101', 'disponible', 1, 'Consultorio para consultas generales.', 0, 1),
	(8, 'Consultorio de Medicina General 2', 'cons', 1, 'CONS-MG-102', 'ocupado', 1, 'Consultorio destinado a chequeos médicos básicos.', 0, 1),
	(9, 'Consultorio de Medicina General 3', 'cons', 1, 'CONS-MG-103', 'disponible', 1, 'Consultorio de diagnóstico y tratamiento general.', 0, 1),
	(10, 'Consultorio de Pediatría 1', 'cons', 2, 'CONS-PED-201', 'disponible', 1, 'Consultorio especializado en atención pediátrica.', 0, 1),
	(11, 'Consultorio de Pediatría 2', 'cons', 2, 'CONS-PED-202', 'ocupado', 1, 'Consultorio para seguimiento del crecimiento y vacunas.', 0, 1),
	(12, 'Sala de Internación Pediátrica 1', 'hab', 2, 'HAB-PED-203', 'disponible', 2, 'Habitación compartida para niños hospitalizados.', 1, 1),
	(13, 'Consultorio de Ginecología 1', 'cons', 2, 'CONS-GIN-201', 'disponible', 1, 'Consultorio de control ginecológico.', 0, 1),
	(14, 'Consultorio de Obstetricia 1', 'cons', 2, 'CONS-OBS-202', 'ocupado', 1, 'Consultorio de control prenatal.', 0, 1),
	(15, 'Sala de Partos 1', 'hab', 2, 'SAL-PAR-203', 'disponible', 1, 'Sala destinada a la atención del parto.', 1, 1),
	(16, 'Consultorio de Dermatología 1', 'cons', 3, 'CONS-DER-301', 'disponible', 1, 'Consultorio para diagnóstico de enfermedades cutáneas.', 0, 1),
	(17, 'Consultorio de Dermatología 2', 'cons', 3, 'CONS-DER-302', 'ocupado', 1, 'Consultorio para tratamientos dermatológicos.', 0, 1),
	(18, 'Consultorio de Dermatología Estética', 'cons', 3, 'CONS-DER-303', 'disponible', 1, 'Consultorio para tratamientos estéticos de la piel.', 0, 1),
	(19, 'Quirófano de Cirugía General 1', 'qui', 2, 'QUI-CG-201', 'disponible', 1, 'Quirófano para cirugías abdominales y generales.', 1, 1),
	(20, 'Quirófano de Cirugía General 2', 'qui', 2, 'QUI-CG-202', 'ocupado', 1, 'Quirófano para operaciones de rutina.', 1, 1),
	(21, 'Sala Preoperatoria Cirugía General', 'hab', 2, 'PRE-CG-203', 'disponible', 2, 'Sala para preparación de pacientes quirúrgicos.', 1, 1),
	(22, 'Quirófano Oncológico 1', 'qui', 2, 'QUI-ONC-204', 'disponible', 1, 'Quirófano para resección de tumores.', 1, 1),
	(23, 'Quirófano Oncológico 2', 'qui', 2, 'QUI-ONC-205', 'ocupado', 1, 'Quirófano para cirugía oncológica compleja.', 1, 1),
	(24, 'Sala de Recuperación Oncológica', 'hab', 2, 'REC-ONC-206', 'disponible', 2, 'Sala para postoperatorio oncológico.', 1, 1),
	(25, 'Quirófano Vascular 1', 'qui', 2, 'QUI-VAS-207', 'disponible', 1, 'Quirófano especializado en cirugía de vasos sanguíneos.', 1, 1),
	(26, 'Quirófano Vascular 2', 'qui', 2, 'QUI-VAS-208', 'ocupado', 1, 'Quirófano para bypass y reparaciones vasculares.', 1, 1),
	(27, 'Sala de Recuperación Vascular', 'hab', 2, 'REC-VAS-209', 'disponible', 2, 'Sala postoperatoria para pacientes de cirugía vascular.', 1, 1),
	(28, 'Unidad de Cuidados Intensivos 1', 'hab', 3, 'UCI-301', 'ocupado', 1, 'Habitación de monitoreo intensivo.', 1, 1),
	(29, 'Unidad de Cuidados Intensivos 2', 'hab', 3, 'UCI-302', 'disponible', 1, 'Habitación con soporte vital avanzado.', 1, 1),
	(30, 'Unidad de Cuidados Intensivos 3', 'hab', 3, 'UCI-303', 'disponible', 1, 'Habitación con monitoreo multiparámetro.', 1, 1),
	(31, 'Sala de Anestesia 1', 'lab', 2, 'ANE-201', 'disponible', 2, 'Sala de preparación anestésica previa a cirugía.', 1, 1),
	(32, 'Sala de Anestesia 2', 'lab', 2, 'ANE-202', 'ocupado', 2, 'Sala de recuperación anestésica postoperatoria.', 1, 1),
	(33, 'Consultorio de Manejo del Dolor', 'cons', 2, 'CONS-ANE-203', 'disponible', 1, 'Consultorio para control y manejo del dolor.', 0, 1),
	(34, 'Sala de Rayos X 1', 'lab', 1, 'RX-101', 'ocupado', 2, 'Sala de radiología para estudios generales.', 0, 1),
	(35, 'Sala de Rayos X 2', 'lab', 1, 'RX-102', 'disponible', 2, 'Sala de diagnóstico por imagen.', 0, 1),
	(36, 'Sala de Radiología de Emergencias', 'lab', 1, 'RX-103', 'disponible', 2, 'Radiología rápida para pacientes críticos.', 1, 1),
	(37, 'Sala de Radiología Pediátrica 1', 'lab', 2, 'RX-PED-201', 'disponible', 1, 'Sala de rayos X adaptada a niños.', 0, 1),
	(38, 'Sala de Radiología Pediátrica 2', 'lab', 2, 'RX-PED-202', 'ocupado', 1, 'Radiología infantil con equipos de baja radiación.', 0, 1),
	(39, 'Sala de Radiología Pediátrica 3', 'lab', 2, 'RX-PED-203', 'disponible', 1, 'Diagnóstico radiológico en pediatría.', 0, 1),
	(40, 'Laboratorio de Patología 1', 'lab', 1, 'LAB-PAT-101', 'disponible', 4, 'Laboratorio de anatomía patológica.', 0, 1),
	(41, 'Laboratorio de Patología 2', 'lab', 1, 'LAB-PAT-102', 'ocupado', 4, 'Sala de procesamiento de muestras patológicas.', 0, 1),
	(42, 'Laboratorio de Patología 3', 'lab', 1, 'LAB-PAT-103', 'disponible', 3, 'Laboratorio para análisis histológicos.', 0, 1),
	(43, 'Laboratorio de Microbiología 1', 'lab', 1, 'LAB-MIC-101', 'disponible', 5, 'Laboratorio para análisis de muestras bacteriológicas.', 0, 1),
	(44, 'Laboratorio de Microbiología 2', 'lab', 1, 'LAB-MIC-102', 'ocupado', 5, 'Sala para diagnóstico de infecciones.', 0, 1),
	(45, 'Laboratorio de Microbiología 3', 'lab', 1, 'LAB-MIC-103', 'disponible', 4, 'Laboratorio con cabinas de bioseguridad.', 0, 1),
	(46, 'Consultorio de Farmacia Clínica 1', 'cons', 1, 'CONS-FAR-101', 'disponible', 1, 'Consultorio para asesoría farmacéutica.', 0, 1),
	(47, 'Consultorio de Farmacia Clínica 2', 'cons', 1, 'CONS-FAR-102', 'ocupado', 1, 'Asesoramiento sobre uso de medicamentos.', 0, 1),
	(48, 'Laboratorio de Farmacia Clínica', 'lab', 1, 'LAB-FAR-103', 'disponible', 3, 'Laboratorio de control de medicamentos hospitalarios.', 0, 1),
	(49, 'Consultorio de Oncología Médica 1', 'cons', 2, 'CONS-ONC-201', 'ocupado', 1, 'Consultorio para control de pacientes con cáncer.', 0, 1),
	(50, 'Consultorio de Oncología Médica 2', 'cons', 2, 'CONS-ONC-202', 'disponible', 1, 'Atención y seguimiento de tratamientos oncológicos.', 0, 1),
	(51, 'Sala de Quimioterapia 1', 'hab', 2, 'QUI-ONC-203', 'disponible', 5, 'Sala de administración de quimioterapia.', 1, 1),
	(52, 'Consultorio de Oncología Ginecológica 1', 'cons', 2, 'CONS-ONG-201', 'disponible', 1, 'Consultorio para control de cáncer ginecológico.', 0, 1),
	(53, 'Consultorio de Oncología Ginecológica 2', 'cons', 2, 'CONS-ONG-202', 'ocupado', 1, 'Consultorio de diagnóstico oncológico femenino.', 0, 1),
	(54, 'Sala de Tratamientos Oncológicos Ginecológicos', 'hab', 2, 'SAL-ONG-203', 'disponible', 2, 'Sala para procedimientos oncológicos ginecológicos.', 1, 1),
	(55, 'Unidad Neonatal 1', 'hab', 3, 'NEO-301', 'ocupado', 2, 'Unidad para recién nacidos prematuros.', 1, 1),
	(56, 'Unidad Neonatal 2', 'hab', 3, 'NEO-302', 'disponible', 2, 'Habitación equipada con incubadoras.', 1, 1),
	(57, 'Unidad Neonatal 3', 'hab', 3, 'NEO-303', 'disponible', 2, 'Sala de cuidados intensivos neonatales.', 1, 1),
	(58, 'Consultorio de Pediatría General 1', 'cons', 2, 'CONS-PEDG-201', 'ocupado', 1, 'Consultorio de atención pediátrica ambulatoria.', 0, 1),
	(59, 'Consultorio de Pediatría General 2', 'cons', 2, 'CONS-PEDG-202', 'disponible', 1, 'Atención general para niños y adolescentes.', 0, 1),
	(60, 'Sala de Internación Pediátrica General', 'hab', 2, 'HAB-PEDG-203', 'disponible', 3, 'Habitación compartida para pacientes pediátricos.', 1, 1),
	(61, 'Consultorio de Cardiología 1', 'cons', 3, 'CONS-CAR-301', 'ocupado', 1, 'Consultorio especializado en enfermedades cardíacas.', 0, 1),
	(62, 'Consultorio de Cardiología 2', 'cons', 3, 'CONS-CAR-302', 'disponible', 1, 'Control y seguimiento de pacientes cardíacos.', 0, 1),
	(63, 'Sala de Electrocardiogramas', 'lab', 3, 'LAB-CAR-303', 'disponible', 2, 'Sala equipada para estudios de electrocardiograma.', 0, 1),
	(64, 'Consultorio de Neumología 1', 'cons', 3, 'CONS-NEU-301', 'ocupado', 1, 'Consultorio para diagnóstico de enfermedades respiratorias.', 0, 1),
	(65, 'Consultorio de Neumología 2', 'cons', 3, 'CONS-NEU-302', 'disponible', 1, 'Atención de pacientes con enfermedades pulmonares.', 0, 1),
	(66, 'Laboratorio de Función Pulmonar', 'lab', 3, 'LAB-NEU-303', 'disponible', 2, 'Sala equipada para espirometrías y estudios respiratorios.', 0, 1),
	(67, 'Consultorio de Nefrología 1', 'cons', 3, 'CONS-NEF-301', 'disponible', 1, 'Consultorio para enfermedades renales.', 0, 1),
	(68, 'Consultorio de Nefrología 2', 'cons', 3, 'CONS-NEF-302', 'ocupado', 1, 'Atención de pacientes con insuficiencia renal.', 0, 1),
	(69, 'Sala de Hemodiálisis 1', 'lab', 3, 'LAB-NEF-303', 'disponible', 4, 'Sala equipada con máquinas de hemodiálisis.', 1, 1),
	(70, 'Consultorio de Gastroenterología 1', 'cons', 3, 'CONS-GAS-301', 'ocupado', 1, 'Consultorio para enfermedades digestivas.', 0, 1),
	(71, 'Consultorio de Gastroenterología 2', 'cons', 3, 'CONS-GAS-302', 'disponible', 1, 'Atención de pacientes con patologías gastrointestinales.', 0, 1),
	(72, 'Sala de Endoscopia 1', 'lab', 3, 'LAB-GAS-303', 'disponible', 2, 'Sala equipada para endoscopias digestivas.', 1, 1),
	(73, 'Consultorio de Dermatología 1', 'cons', 2, 'CONS-DER-201', 'disponible', 1, 'Consultorio de diagnóstico de enfermedades de la piel.', 0, 1),
	(74, 'Consultorio de Dermatología 2', 'cons', 2, 'CONS-DER-202', 'ocupado', 1, 'Atención de tratamientos dermatológicos.', 0, 1),
	(75, 'Sala de Fototerapia', 'lab', 2, 'LAB-DER-203', 'disponible', 2, 'Sala equipada con lámparas UV para tratamientos.', 0, 1),
	(76, 'Consultorio de Reumatología 1', 'cons', 2, 'CONS-REU-201', 'ocupado', 1, 'Consultorio para enfermedades autoinmunes.', 0, 1),
	(77, 'Consultorio de Reumatología 2', 'cons', 2, 'CONS-REU-202', 'disponible', 1, 'Atención de pacientes con artritis y lupus.', 0, 1),
	(78, 'Sala de Infusión Reumatológica', 'hab', 2, 'HAB-REU-203', 'disponible', 3, 'Sala para administración de terapias intravenosas.', 0, 1),
	(79, 'Consultorio de Endocrinología 1', 'cons', 2, 'CONS-END-201', 'disponible', 1, 'Consultorio para enfermedades hormonales.', 0, 1),
	(80, 'Consultorio de Endocrinología 2', 'cons', 2, 'CONS-END-202', 'ocupado', 1, 'Control de pacientes con diabetes y tiroides.', 0, 1),
	(81, 'Sala de Educación Diabética', 'hab', 2, 'HAB-END-203', 'disponible', 5, 'Sala destinada a la enseñanza del autocontrol de la diabetes.', 0, 1),
	(82, 'Consultorio de Neurología 1', 'cons', 3, 'CONS-NRL-301', 'ocupado', 1, 'Consultorio para enfermedades neurológicas.', 0, 1),
	(83, 'Consultorio de Neurología 2', 'cons', 3, 'CONS-NRL-302', 'disponible', 1, 'Atención de pacientes con epilepsia y migraña.', 0, 1),
	(84, 'Sala de Electroencefalogramas', 'lab', 3, 'LAB-NRL-303', 'disponible', 2, 'Sala para estudios de actividad cerebral.', 0, 1),
	(85, 'Consultorio de Psiquiatría 1', 'cons', 2, 'CONS-PSQ-201', 'disponible', 1, 'Consultorio de evaluación psiquiátrica.', 0, 1),
	(86, 'Consultorio de Psiquiatría 2', 'cons', 2, 'CONS-PSQ-202', 'ocupado', 1, 'Seguimiento de pacientes con trastornos mentales.', 0, 1),
	(87, 'Sala de Terapias Grupales', 'hab', 2, 'HAB-PSQ-203', 'disponible', 8, 'Sala acondicionada para terapias grupales.', 0, 1),
	(88, 'Quirófano de Cirugía General 1', 'qui', 4, 'QUI-CG-401', 'ocupado', 1, 'Quirófano para procedimientos generales.', 1, 1),
	(89, 'Quirófano de Cirugía General 2', 'qui', 4, 'QUI-CG-402', 'disponible', 1, 'Quirófano equipado para cirugías abdominales.', 1, 1),
	(90, 'Sala de Recuperación Cirugía General', 'hab', 4, 'REC-CG-403', 'disponible', 4, 'Sala postoperatoria de pacientes de cirugía general.', 1, 1),
	(91, 'Quirófano de Oncología 1', 'qui', 4, 'QUI-ONC-401', 'ocupado', 1, 'Quirófano especializado en procedimientos oncológicos.', 1, 1),
	(92, 'Quirófano de Oncología 2', 'qui', 4, 'QUI-ONC-402', 'disponible', 1, 'Preparado para cirugía de tumores complejos.', 1, 1),
	(93, 'Sala de Recuperación Oncológica', 'hab', 4, 'REC-ONC-403', 'disponible', 3, 'Sala postoperatoria para pacientes oncológicos.', 1, 1),
	(94, 'Quirófano de Cirugía Vascular 1', 'qui', 4, 'QUI-CV-401', 'ocupado', 1, 'Quirófano para procedimientos en vasos sanguíneos.', 1, 1),
	(95, 'Quirófano de Cirugía Vascular 2', 'qui', 4, 'QUI-CV-402', 'disponible', 1, 'Preparado para bypass y aneurismas.', 1, 1),
	(96, 'Sala de Recuperación Vascular', 'hab', 4, 'REC-CV-403', 'disponible', 2, 'Área de recuperación postquirúrgica vascular.', 1, 1),
	(97, 'Quirófano de Cirugía Torácica 1', 'qui', 4, 'QUI-CT-401', 'ocupado', 1, 'Quirófano para operaciones de tórax y pulmones.', 1, 1),
	(98, 'Quirófano de Cirugía Torácica 2', 'qui', 4, 'QUI-CT-402', 'disponible', 1, 'Preparado para cirugía de pleura y pulmones.', 1, 1),
	(99, 'Sala de Cuidados Post-Torácicos', 'hab', 4, 'REC-CT-403', 'disponible', 3, 'Sala de recuperación para cirugía torácica.', 1, 1),
	(100, 'Quirófano de Cirugía Plástica 1', 'qui', 3, 'QUI-CP-301', 'ocupado', 1, 'Quirófano para cirugía reconstructiva y estética.', 1, 1),
	(101, 'Quirófano de Cirugía Plástica 2', 'qui', 3, 'QUI-CP-302', 'disponible', 1, 'Preparado para cirugías faciales y corporales.', 1, 1),
	(102, 'Sala de Recuperación Estética', 'hab', 3, 'REC-CP-303', 'disponible', 4, 'Área de cuidados postoperatorios en cirugía estética.', 0, 1),
	(103, 'Quirófano de Ortopedia 1', 'qui', 3, 'QUI-ORT-301', 'ocupado', 1, 'Quirófano para cirugía traumatológica y ortopédica.', 1, 1),
	(104, 'Quirófano de Ortopedia 2', 'qui', 3, 'QUI-ORT-302', 'disponible', 1, 'Preparado para implantes y prótesis.', 1, 1),
	(105, 'Sala de Rehabilitación Ortopédica', 'hab', 2, 'HAB-ORT-201', 'disponible', 6, 'Sala para recuperación de pacientes traumatológicos.', 0, 1),
	(106, 'Sala de Anestesia 1', 'lab', 4, 'LAB-ANE-401', 'ocupado', 2, 'Preparación anestésica para cirugías.', 1, 1),
	(107, 'Sala de Anestesia 2', 'lab', 4, 'LAB-ANE-402', 'disponible', 2, 'Área para control de anestesia intraoperatoria.', 1, 1),
	(108, 'Unidad de Recuperación Anestésica', 'hab', 4, 'REC-ANE-403', 'disponible', 4, 'Monitoreo postanestesia inmediato.', 1, 1),
	(109, 'Unidad de Cuidados Intensivos 1', 'hab', 5, 'UCI-MC-501', 'ocupado', 6, 'Área crítica para pacientes graves.', 1, 1),
	(110, 'Unidad de Cuidados Intensivos 2', 'hab', 5, 'UCI-MC-502', 'disponible', 6, 'Soporte vital avanzado.', 1, 1),
	(111, 'Unidad de Cuidados Intensivos 3', 'hab', 5, 'UCI-MC-503', 'disponible', 6, 'Atención 24h para pacientes críticos.', 1, 1),
	(112, 'Unidad de Cuidados Neurocríticos 1', 'hab', 5, 'UCN-NCR-501', 'ocupado', 4, 'Manejo de pacientes con patologías neurológicas críticas.', 1, 1),
	(113, 'Unidad de Cuidados Neurocríticos 2', 'hab', 5, 'UCN-NCR-502', 'disponible', 4, 'Atención a traumatismos craneoencefálicos.', 1, 1),
	(114, 'Sala de Monitoreo Neurológico', 'lab', 5, 'LAB-NCR-503', 'disponible', 2, 'Monitoreo avanzado de la actividad cerebral.', 1, 1),
	(115, 'Sala de Radiología 1', 'lab', 1, 'LAB-RAD-101', 'disponible', 2, 'Diagnóstico por rayos X y TAC.', 0, 1),
	(116, 'Sala de Radiología 2', 'lab', 1, 'LAB-RAD-102', 'ocupado', 2, 'Exámenes de radiografía y fluoroscopía.', 0, 1),
	(117, 'Sala de Resonancia Magnética', 'lab', 1, 'LAB-RAD-103', 'disponible', 1, 'Equipo de RMN de alto campo.', 0, 1),
	(118, 'Consultorio de Cuidados Paliativos 1', 'cons', 2, 'CONS-CPAL-201', 'ocupado', 1, 'Atención integral a pacientes terminales.', 0, 1),
	(119, 'Consultorio de Cuidados Paliativos 2', 'cons', 2, 'CONS-CPAL-202', 'disponible', 1, 'Apoyo clínico y psicológico.', 0, 1),
	(120, 'Sala de Cuidados Paliativos', 'hab', 2, 'HAB-CPAL-203', 'disponible', 3, 'Área para internación de pacientes en cuidados paliativos.', 0, 1),
	(121, 'Sala de Rayos X de Emergencia 1', 'lab', 1, 'LAB-RX-101', 'ocupado', 1, 'Radiología rápida para emergencias.', 1, 1),
	(122, 'Sala de Rayos X de Emergencia 2', 'lab', 1, 'LAB-RX-102', 'disponible', 1, 'Radiografía de tórax y huesos en urgencias.', 1, 1),
	(123, 'Sala de Ecografía de Emergencia', 'lab', 1, 'LAB-ECO-103', 'disponible', 1, 'Ultrasonido rápido en emergencias.', 1, 1),
	(124, 'Sala TAC de Emergencia', 'lab', 1, 'LAB-TAC-104', 'ocupado', 1, 'Tomógrafo para diagnóstico rápido en trauma.', 1, 1),
	(125, 'Laboratorio Clínico Central', 'lab', 2, 'LAB-CLI-201', 'ocupado', 10, 'Análisis de sangre, orina y bioquímica.', 0, 1),
	(126, 'Laboratorio Clínico Secundario', 'lab', 2, 'LAB-CLI-202', 'disponible', 6, 'Soporte para análisis de guardia.', 0, 1),
	(127, 'Sala de Electrocardiogramas', 'lab', 2, 'LAB-ECG-203', 'disponible', 2, 'Equipos para estudios de ritmo cardíaco.', 0, 1),
	(128, 'Sala de Espirometría', 'lab', 2, 'LAB-PUL-204', 'disponible', 2, 'Evaluación de la función respiratoria.', 0, 1),
	(129, 'Sala de Endoscopia 1', 'lab', 2, 'LAB-END-205', 'ocupado', 2, 'Examen de tubo digestivo superior e inferior.', 1, 1),
	(130, 'Sala de Audiometría', 'lab', 2, 'LAB-AUD-206', 'disponible', 1, 'Cabina insonorizada para exámenes auditivos.', 0, 1),
	(131, 'Sala de Exámenes Visuales', 'cons', 2, 'CONS-OFT-207', 'disponible', 1, 'Pruebas de visión y salud ocular.', 0, 1),
	(132, 'Sala de Pruebas de Alergia', 'cons', 2, 'CONS-ALR-208', 'ocupado', 2, 'Pruebas cutáneas y diagnósticos alérgicos.', 0, 1),
	(133, 'Radiología Quirúrgica 1', 'lab', 3, 'LAB-RQ-301', 'ocupado', 1, 'Imagenología en quirófano.', 1, 1),
	(134, 'Sala TAC Central', 'lab', 1, 'LAB-TAC-105', 'disponible', 1, 'Tomógrafo multicorte de alta resolución.', 1, 1),
	(135, 'Sala de Resonancia Magnética 1', 'lab', 1, 'LAB-RM-106', 'disponible', 1, 'Resonancia para neurología y ortopedia.', 1, 1),
	(136, 'Sala de Resonancia Magnética 2', 'lab', 1, 'LAB-RM-107', 'ocupado', 1, 'Resonancia de cuerpo completo.', 1, 1),
	(137, 'Unidad de Monitoreo Cardíaco', 'hab', 3, 'HAB-MON-301', 'disponible', 4, 'Monitoreo continuo de pacientes críticos.', 1, 1),
	(138, 'Sala de Oxigenoterapia', 'hab', 2, 'HAB-OXI-201', 'ocupado', 3, 'Aplicación terapéutica de oxígeno.', 1, 1),
	(139, 'Sala EEG 1', 'lab', 3, 'LAB-EEG-302', 'disponible', 1, 'Estudios de actividad eléctrica cerebral.', 0, 1),
	(140, 'Sala de Mamografía', 'lab', 1, 'LAB-MAM-108', 'ocupado', 1, 'Diagnóstico de cáncer de mama.', 0, 1),
	(141, 'Sala de Extracciones de Sangre', 'lab', 2, 'LAB-SANG-209', 'disponible', 5, 'Extracción y procesamiento de muestras.', 0, 1),
	(142, 'Sala de Análisis de Orina', 'lab', 2, 'LAB-ORI-210', 'disponible', 2, 'Procesamiento de muestras de orina.', 0, 1),
	(143, 'Laboratorio de Biología Molecular', 'lab', 2, 'LAB-BIO-211', 'ocupado', 3, 'PCR, genética y virología.', 1, 1),
	(144, 'Sala de Asesoría Farmacéutica', 'cons', 2, 'CONS-FAR-212', 'disponible', 1, 'Atención de pacientes sobre medicamentos.', 0, 1),
	(145, 'Sala de Biopsias', 'lab', 3, 'LAB-BIOP-304', 'ocupado', 1, 'Obtención de muestras para análisis oncológico.', 1, 1),
	(146, 'Sala de Radioterapia 1', 'lab', 3, 'LAB-RADT-305', 'ocupado', 1, 'Tratamiento con radiación contra tumores.', 1, 1),
	(147, 'Sala de Radioterapia 2', 'lab', 3, 'LAB-RADT-306', 'disponible', 1, 'Unidad de acelerador lineal.', 1, 1),
	(148, 'Sala de Exámenes Neonatales', 'lab', 2, 'LAB-NEO-213', 'disponible', 2, 'Pruebas metabólicas y cardíacas en neonatos.', 0, 1),
	(149, 'Sala de Ecografía Pediátrica', 'lab', 2, 'LAB-ECO-214', 'ocupado', 1, 'Ecografía adaptada para niños.', 0, 1),
	(150, 'Sala de Ecografía Ginecológica', 'lab', 2, 'LAB-ECO-215', 'disponible', 1, 'Ecografía transvaginal y obstétrica.', 0, 1),
	(151, 'Sala de Pruebas de Fertilidad', 'lab', 2, 'LAB-FER-216', 'disponible', 1, 'Estudios de fertilidad masculina y femenina.', 0, 1),
	(152, 'Sala de Dermatoscopia', 'cons', 2, 'CONS-DER-217', 'ocupado', 1, 'Estudio detallado de lesiones cutáneas.', 0, 1),
	(153, 'Sala de Pruebas de Alergia Dermatológica', 'cons', 2, 'CONS-DER-218', 'disponible', 1, 'Diagnóstico de dermatitis y eccemas.', 0, 1),
	(154, 'Oficina de Laboratorio', 'oficina_resultados', 2, 'OFI-LAB-201', 'disponible', 10, 'Oficina de carga de resultados sobre análisis de laboratorio', 0, 1);

-- Volcando estructura para tabla hospitalbd.hospital_personal_medicaciones
CREATE TABLE IF NOT EXISTS `hospital_personal_medicaciones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicamento` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dosis` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `frecuencia` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tiempo_uso` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consulta_id` bigint NOT NULL,
  `recetada_por_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_me_consulta_id_be122a02_fk_hospital_` (`consulta_id`),
  KEY `hospital_personal_me_recetada_por_id_4712be69_fk_controlUs` (`recetada_por_id`),
  CONSTRAINT `hospital_personal_me_consulta_id_be122a02_fk_hospital_` FOREIGN KEY (`consulta_id`) REFERENCES `hospital_personal_consultas` (`id`),
  CONSTRAINT `hospital_personal_me_recetada_por_id_4712be69_fk_controlUs` FOREIGN KEY (`recetada_por_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_medicaciones: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_medicaciones` (`id`, `medicamento`, `dosis`, `frecuencia`, `tiempo_uso`, `consulta_id`, `recetada_por_id`) VALUES
	(1, 'Levotiroxina sódica', '25 mcg', '1 vez al día', 'Próxima consulta', 1, 3),
	(2, 'Ibuprofeno 600 mg', '1 comprimido', 'Cada 8 horas', '5 días', 4, 4);

-- Volcando estructura para tabla hospitalbd.hospital_personal_ordenestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_ordenestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `motivo_estudio` longtext COLLATE utf8mb4_general_ci,
  `indicaciones` longtext COLLATE utf8mb4_general_ci,
  `fecha_solicitud` datetime(6) DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `consulta_id` bigint NOT NULL,
  `solicitado_por_id` bigint NOT NULL,
  `tipo_estudio_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_or_consulta_id_475aec1c_fk_hospital_` (`consulta_id`),
  KEY `hospital_personal_or_solicitado_por_id_af68595d_fk_controlUs` (`solicitado_por_id`),
  KEY `hospital_personal_or_tipo_estudio_id_cdd31875_fk_hospital_` (`tipo_estudio_id`),
  CONSTRAINT `hospital_personal_or_consulta_id_475aec1c_fk_hospital_` FOREIGN KEY (`consulta_id`) REFERENCES `hospital_personal_consultas` (`id`),
  CONSTRAINT `hospital_personal_or_solicitado_por_id_af68595d_fk_controlUs` FOREIGN KEY (`solicitado_por_id`) REFERENCES `controlusuario_usuario` (`id`),
  CONSTRAINT `hospital_personal_or_tipo_estudio_id_cdd31875_fk_hospital_` FOREIGN KEY (`tipo_estudio_id`) REFERENCES `hospital_personal_estudiosdiagnosticos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_ordenestudio: ~5 rows (aproximadamente)
INSERT INTO `hospital_personal_ordenestudio` (`id`, `motivo_estudio`, `indicaciones`, `fecha_solicitud`, `estado`, `consulta_id`, `solicitado_por_id`, `tipo_estudio_id`) VALUES
	(1, 'Detectar hipotiroidismo', 'Ayuno opcional, preferiblemente mañana', '2025-09-03 22:34:36.985330', 'realizado', 1, 3, 102),
	(2, 'Evaluar función tiroidea', 'Tomar con TSH para correlación', '2025-09-03 22:34:37.002859', 'pendiente', 1, 3, 103),
	(3, 'Evaluar causas endocrinas de talla baja, incluyendo función tiroidea y eje GH-IGF1.', 'Acudir en ayunas (8 horas)', '2025-09-04 18:06:27.142315', 'realizado', 2, 3, 102),
	(4, 'Evaluación de riesgo cardiovascular y detección de dislipidemia', 'Ayuno mínimo de 12 horas.\r\nHidratación adecuada (agua).\r\nEvitar ingesta de alcohol y comidas grasas el día previo.', '2025-09-08 19:11:46.513067', 'realizado', 3, 4, 43),
	(5, 'Dolor lumbar agudo sin mejoría, para descartar patología estructural (fractura, escoliosis, pinzamiento).', 'Acudir en ayuno de 6 horas.', '2025-09-09 21:37:47.557393', 'realizado', 4, 4, 271),
	(6, 'Evaluación inicial de hipertensión arterial', 'Reposar 10 minutos antes del estudio. Evitar consumo de cafeína el día del examen.', '2025-09-10 22:21:05.865000', 'realizado', 5, 5, 81);

-- Volcando estructura para tabla hospitalbd.hospital_personal_plantillaestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_plantillaestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estructura` json NOT NULL,
  `estudio_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_personal_plantillaestudio_estudio_id_f14531a1_uniq` (`estudio_id`),
  CONSTRAINT `hospital_personal_pl_estudio_id_f14531a1_fk_hospital_` FOREIGN KEY (`estudio_id`) REFERENCES `hospital_personal_estudiosdiagnosticos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_plantillaestudio: ~3 rows (aproximadamente)
INSERT INTO `hospital_personal_plantillaestudio` (`id`, `estructura`, `estudio_id`) VALUES
	(1, '{"Perfil lipídico": {"Colesterol HDL": {"valor": "", "unidad": "mg/dL", "referencia": "Hombres: > 40 mg/dL, Mujeres: > 50 mg/dL"}, "Colesterol LDL": {"valor": "", "unidad": "mg/dL", "referencia": "< 100 mg/dL"}, "Triglicéridos": {"valor": "", "unidad": "mg/dL", "referencia": "< 150 mg/dL"}, "Colesterol total": {"valor": "", "unidad": "mg/dL", "referencia": "< 200 mg/dL"}}}', 43),
	(2, '{"Prueba de TSH": {"TSH": {"valor": "", "unidad": "µIU/mL", "referencia": "0.4 – 4.0 µIU/mL"}}}', 102),
	(3, '{"Prueba de T4 libre": {"T4 libre": {"valor": "", "unidad": "ng/dL", "referencia": "0.8 – 1.8 ng/dL"}}}', 103),
	(4, '{"Electrocardiograma en reposo": {"Onda P": {"valor": "", "unidad": "descriptivo", "referencia": "Presente y normal", "interpretacion": ""}, "Onda Q": {"valor": "", "unidad": "descriptivo", "referencia": "Pequeña o ausente", "interpretacion": ""}, "Onda T": {"valor": "", "unidad": "descriptivo", "referencia": "Positiva en derivaciones normales", "interpretacion": ""}, "Bloqueos": {"valor": "", "unidad": "descriptivo", "referencia": "No presentes", "interpretacion": ""}, "Segmento ST": {"valor": "", "unidad": "descriptivo", "referencia": "Isoeléctrico", "interpretacion": ""}, "Intervalo PR": {"valor": "", "unidad": "segundos", "referencia": "0.12 - 0.20", "interpretacion": ""}, "Extrasístoles": {"valor": "", "unidad": "descriptivo", "referencia": "Ausentes", "interpretacion": ""}, "Ritmo cardíaco": {"valor": "", "unidad": "descriptivo", "referencia": "Ritmo sinusal regular", "interpretacion": ""}, "Diagnóstico ECG": {"valor": "", "unidad": "descriptivo", "referencia": "Normal o con hallazgos", "interpretacion": ""}, "Frecuencia cardíaca": {"valor": "", "unidad": "latidos/minuto", "referencia": "60 - 100", "interpretacion": ""}, "Duración del complejo QRS": {"valor": "", "unidad": "segundos", "referencia": "< 0.12", "interpretacion": ""}, "Eje eléctrico del corazón": {"valor": "", "unidad": "grados", "referencia": "-30° a +90°", "interpretacion": ""}, "Intervalo QT corregido (QTc)": {"valor": "", "unidad": "segundos", "referencia": "< 0.44", "interpretacion": ""}}}', 81);

-- Volcando estructura para tabla hospitalbd.hospital_personal_resultadoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_resultadoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `informe` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `archivo_pdf` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `turno_estudio_id` bigint NOT NULL,
  `datos_especificos` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turno_id` (`turno_estudio_id`),
  CONSTRAINT `hospital_personal_re_turno_estudio_id_7530c068_fk_hospital_` FOREIGN KEY (`turno_estudio_id`) REFERENCES `hospital_personal_turnoestudio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_resultadoestudio: ~6 rows (aproximadamente)
INSERT INTO `hospital_personal_resultadoestudio` (`id`, `informe`, `archivo_pdf`, `turno_estudio_id`, `datos_especificos`) VALUES
	(25, 'Se cargaron imágenes correspondientes a radiografía lumbosacra (proyecciones AP y lateral).\r\nEstudio realizado sin complicaciones. Imágenes de buena calidad diagnóstica.\r\nInforme médico pendiente.', 'resultados/resultado_estudio_25.pdf', 7, '{}'),
	(27, 'Estudio de TSH realizado en suero. El valor obtenido se encuentra dentro de los rangos de referencia para la edad y sexo del paciente. No se observan\r\nalteraciones compatibles con disfunción tiroidea. Se sugiere correlación clínica y, de ser necesario, ampliación con T3 libre y T4 libre. Valor de TSH: 2.50 µU/mL\r\n(Referencia: 0.4 – 4.0 µU/mL).', 'resultados/resultado_estudio_27.pdf', 2, '{"TSH": {"valor": "2.50", "unidad": "µIU/mL", "referencia": "0.4 – 4.0 µIU/mL"}}'),
	(31, 'El electrocardiograma realizado en reposo no muestra anormalidades. Los parámetros eléctricos cardíacos se encuentran dentro de los valores de referencia. El estudio es compatible con función eléctrica cardíaca normal.', 'resultados/resultado_estudio_31.pdf', 8, '{"Onda P": {"valor": "Presente y normal", "unidad": "descriptivo", "referencia": "Presente y normal", "interpretacion": "Actividad auricular normal"}, "Onda Q": {"valor": "Pequeña y fisiológica en DIII y aVF", "unidad": "descriptivo", "referencia": "Pequeña o ausente", "interpretacion": "Onda Q fisiológica, sin indicios de infarto previo"}, "Onda T": {"valor": "Positiva en DII, DIII, V4-V6", "unidad": "descriptivo", "referencia": "Positiva en derivaciones normales", "interpretacion": "Repolarización normal en derivaciones correspondientes"}, "Bloqueos": {"valor": "No presentes", "unidad": "descriptivo", "referencia": "No presentes", "interpretacion": "Conducción eléctrica sin alteraciones"}, "Segmento ST": {"valor": "Isoeléctrico", "unidad": "descriptivo", "referencia": "Isoeléctrico", "interpretacion": "No hay signos de isquemia o infarto agudo"}, "Intervalo PR": {"valor": "0.16", "unidad": "segundos", "referencia": "0.12 - 0.20", "interpretacion": "Conducción auriculoventricular normal"}, "Extrasístoles": {"valor": "No se observan", "unidad": "descriptivo", "referencia": "Ausentes", "interpretacion": "No se detectan arritmias en reposo"}, "Ritmo cardíaco": {"valor": "Ritmo sinusal regular", "unidad": "descriptivo", "referencia": "Ritmo sinusal regular", "interpretacion": "Ritmo normal originado en el nodo sinusal"}, "Diagnóstico ECG": {"valor": "Trazado electrocardiográfico dentro de límites normales", "unidad": "descriptivo", "referencia": "Normal o con hallazgos", "interpretacion": "Electrocardiograma normal en reposo"}, "Frecuencia cardíaca": {"valor": "76", "unidad": "latidos/minuto", "referencia": "60 - 100", "interpretacion": "Frecuencia cardíaca dentro de rango normal en reposo"}, "Duración del complejo QRS": {"valor": "0.08", "unidad": "segundos", "referencia": "< 0.12", "interpretacion": "Despolarización ventricular normal, sin bloqueos"}, "Eje eléctrico del corazón": {"valor": "+60", "unidad": "grados", "referencia": "-30° a +90°", "interpretacion": "Eje eléctrico normal"}, "Intervalo QT corregido (QTc)": {"valor": "0.42", "unidad": "segundos", "referencia": "< 0.44", "interpretacion": "Repolarización ventricular dentro de límites normales"}}'),
	(32, 'Estudio de TSH realizado mediante inmunoensayo en suero.  \r\nEl valor obtenido se encuentra dentro de los rangos de referencia para el paciente.  \r\nNo se evidencian alteraciones compatibles con disfunción tiroidea.\r\n\r\nValor obtenido: 2.53 µU/mL  \r\nValores de referencia: 0.4 - 4.0 µU/mL\r\n\r\nSe sugiere correlación clínica.', 'resultados/resultado_estudio_32.pdf', 4, '{"TSH": {"valor": "2.4", "unidad": "µIU/mL", "referencia": "0.4 – 4.0 µIU/mL"}}'),
	(33, 'Estudio de T4 libre realizado mediante inmunoensayo en suero. El valor obtenido se encuentra dentro de los rangos de referencia para el paciente. No se evidencian alteraciones compatibles con disfunción tiroidea.\r\nValor obtenido: 2.5 µU/mL.\r\nValores de referencia: 0.4 - 4.0 µU/mL.\r\nSe sugiere correlación clínica.', 'resultados/resultado_estudio_33.pdf', 5, '{"T4 libre": {"valor": "2.5", "unidad": "ng/dL", "referencia": "0.8 – 1.8 ng/dL"}}'),
	(35, 'El perfil lipídico muestra valores dentro de rango excepto el colesterol LDL que se encuentra elevado.', 'resultados/resultado_estudio_35.pdf', 6, '{"Colesterol HDL": {"valor": "45", "unidad": "mg/dL", "referencia": "Hombres: > 40 mg/dL, Mujeres: > 50 mg/dL"}, "Colesterol LDL": {"valor": "130", "unidad": "mg/dL", "referencia": "< 100 mg/dL"}, "Triglicéridos": {"valor": "160", "unidad": "mg/dL", "referencia": "< 150 mg/dL"}, "Colesterol total": {"valor": "190", "unidad": "mg/dL", "referencia": "< 200 mg/dL"}}');

-- Volcando estructura para tabla hospitalbd.hospital_personal_resultadoestudio_imagenes
CREATE TABLE IF NOT EXISTS `hospital_personal_resultadoestudio_imagenes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `resultadoestudio_id` bigint NOT NULL,
  `resultadoimagen_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_personal_result_resultadoestudio_id_resu_9e18dfbe_uniq` (`resultadoestudio_id`,`resultadoimagen_id`),
  KEY `hospital_personal_re_resultadoimagen_id_d4ac8bb0_fk_hospital_` (`resultadoimagen_id`),
  CONSTRAINT `hospital_personal_re_resultadoestudio_id_374b3dab_fk_hospital_` FOREIGN KEY (`resultadoestudio_id`) REFERENCES `hospital_personal_resultadoestudio` (`id`),
  CONSTRAINT `hospital_personal_re_resultadoimagen_id_d4ac8bb0_fk_hospital_` FOREIGN KEY (`resultadoimagen_id`) REFERENCES `hospital_personal_resultadoimagen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_resultadoestudio_imagenes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_resultadoimagen
CREATE TABLE IF NOT EXISTS `hospital_personal_resultadoimagen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_carga` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_resultadoimagen: ~9 rows (aproximadamente)
INSERT INTO `hospital_personal_resultadoimagen` (`id`, `imagen`, `fecha_carga`) VALUES
	(1, 'imagenes_temporales/radiografia-lumbar-1.jpg', '2025-09-09 22:06:49.826429'),
	(2, 'imagenes_temporales/radiografia-lumbar-2.jpg', '2025-09-09 22:06:49.852335'),
	(3, 'imagenes_temporales/radiografia-lumbar-1_pqdZPhR.jpg', '2025-09-09 22:10:08.211014'),
	(4, 'imagenes_temporales/radiografia-lumbar-2_Dcqfk2t.jpg', '2025-09-09 22:10:08.228985'),
	(5, 'imagenes_temporales/radiografia-lumbar-1_zjl54aI.jpg', '2025-09-09 22:15:58.684570'),
	(6, 'imagenes_temporales/radiografia-lumbar-2_znllTJy.jpg', '2025-09-09 22:15:58.696551'),
	(7, 'imagenes_temporales/radiografia-lumbar-1_5mcQwSW.jpg', '2025-09-09 22:17:37.532362'),
	(8, 'imagenes_temporales/radiografia-lumbar-2_qpFwPoU.jpg', '2025-09-09 22:17:37.560117');

-- Volcando estructura para tabla hospitalbd.hospital_personal_serviciodiagnostico
CREATE TABLE IF NOT EXISTS `hospital_personal_serviciodiagnostico` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `departamento_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_se_departamento_id_aee03b02_fk_hospital_` (`departamento_id`),
  CONSTRAINT `hospital_personal_se_departamento_id_aee03b02_fk_hospital_` FOREIGN KEY (`departamento_id`) REFERENCES `hospital_personal_departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_serviciodiagnostico: ~34 rows (aproximadamente)
INSERT INTO `hospital_personal_serviciodiagnostico` (`id`, `nombre_servicio`, `descripcion`, `departamento_id`) VALUES
	(1, 'Rayos X de Emergencia', 'Servicio encargado de realizar radiografías de emergencia para diagnóstico rápido de fracturas, hemorragias internas y otras condiciones.', 1),
	(2, 'Ecografía de Emergencia', 'Servicio que realiza ecografías para detectar patologías abdominales, hemorrágicas y otras urgencias médicas.', 1),
	(3, 'Tomografía Computarizada de Emergencia', 'Servicio de diagnóstico por imagen para obtener imágenes rápidas y precisas en situaciones críticas de urgencias.', 1),
	(4, 'Pruebas de Laboratorio Clínico', 'Servicio que realiza análisis de muestras biológicas (sangre, orina, etc.) para diagnóstico de diversas condiciones médicas.', 2),
	(5, 'Electrocardiograma (ECG)', 'Servicio de diagnóstico que utiliza un electrocardiograma para estudiar la actividad eléctrica del corazón y detectar arritmias u otras enfermedades.', 2),
	(6, 'Ecografía General', 'Servicio encargado de realizar ecografías abdominales, ginecológicas, musculoesqueléticas, entre otras, para diagnóstico no invasivo.', 2),
	(7, 'Pruebas de Función Pulmonar', 'Servicio que evalúa la función de los pulmones y el sistema respiratorio, usado en neumología y enfermedades respiratorias.', 2),
	(8, 'Endoscopia Digestiva', 'Servicio para examinar el tracto gastrointestinal mediante un endoscopio, útil en la diagnóstico de problemas gástricos y colonoscopia.', 2),
	(9, 'Audiometría', 'Prueba de diagnóstico utilizada para evaluar la capacidad auditiva del paciente.', 2),
	(10, 'Examen Visual', 'Exámenes oftalmológicos para evaluar la salud ocular, visión, y detectar enfermedades como cataratas o glaucoma.', 2),
	(11, 'Pruebas de Alergia', 'Servicios de diagnóstico para identificar alergias a alimentos, medicamentos, sustancias ambientales, entre otros.', 2),
	(12, 'Radiología Quirúrgica', 'Servicio de diagnóstico por imagen especializado para guiar intervenciones quirúrgicas y verificar lesiones antes y después de la cirugía.', 3),
	(13, 'Tomografía Axial Computarizada (TAC)', 'Servicio avanzado de diagnóstico por imagen que proporciona cortes transversales detallados de los órganos internos para planificar cirugías.', 3),
	(14, 'Resonancia Magnética (RM)', 'Servicio de diagnóstico por imagen que utiliza campos magnéticos para crear imágenes detalladas de los órganos y tejidos internos.', 3),
	(15, 'Monitoreo Cardíaco', 'Servicio de monitoreo continuo de la actividad cardíaca de los pacientes en estado crítico, como post-quirúrgicos o con afecciones graves.', 4),
	(16, 'Oxigenoterapia', 'Servicio que proporciona oxígeno de manera terapéutica a pacientes que lo requieren debido a problemas respiratorios graves.', 4),
	(17, 'Electroencefalograma (EEG)', 'Servicio para monitorear la actividad eléctrica del cerebro, utilizado en pacientes con trastornos neurológicos críticos.', 4),
	(18, 'Radiología General', 'Servicio encargado de realizar radiografías para el diagnóstico de fracturas, enfermedades pulmonares, y otros trastornos.', 5),
	(19, 'Tomografía Computarizada (TAC)', 'Servicio de diagnóstico por imagen que ofrece cortes transversales detallados de los órganos internos.', 5),
	(20, 'Resonancia Magnética', 'Servicio que utiliza campos magnéticos para realizar imágenes detalladas de los tejidos internos, útil para diagnóstico de enfermedades musculoesqueléticas, neurológicas, etc.', 5),
	(21, 'Ecografía General', 'Servicio de diagnóstico mediante ultrasonido para explorar órganos internos, embarazo, problemas musculares, etc.', 5),
	(22, 'Mamografía', 'Servicio especializado en el diagnóstico temprano del cáncer de mama mediante imágenes radiográficas.', 5),
	(23, 'Análisis de Sangre', 'Servicio que realiza análisis de sangre para diagnosticar una amplia variedad de condiciones médicas, desde infecciones hasta enfermedades crónicas.', 6),
	(24, 'Análisis de Orina', 'Servicio para analizar muestras de orina y diagnosticar enfermedades del tracto urinario, riñones, entre otros.', 6),
	(25, 'Pruebas de Biología Molecular', 'Servicio que realiza pruebas avanzadas para diagnosticar enfermedades infecciosas, genéticas y otras condiciones médicas mediante el análisis molecular.', 6),
	(26, 'Asesoría Farmacéutica', 'Servicio donde se asesora a los pacientes sobre la correcta administración de medicamentos y posibles interacciones.', 7),
	(27, 'Biopsias Oncológicas', 'Servicio para realizar biopsias de tejidos sospechosos para el diagnóstico de cáncer.', 8),
	(28, 'Radioterapia', 'Servicio especializado en la administración de radiación para el tratamiento de ciertos tipos de cáncer.', 8),
	(29, 'Exámenes Neonatales', 'Servicio para realizar pruebas a los recién nacidos con el fin de detectar posibles problemas de salud, como cardiopatías, enfermedades metabólicas, entre otros.', 9),
	(30, 'Ecografía Pediátrica', 'Servicio de diagnóstico por ultrasonido adaptado a niños, para el estudio de diversas condiciones pediátricas.', 9),
	(31, 'Ecografía Ginecológica', 'Servicio de diagnóstico por imagen utilizado para el estudio de la salud reproductiva femenina, incluido el seguimiento del embarazo.', 10),
	(32, 'Pruebas de Fertilidad', 'Servicio para realizar análisis y estudios relacionados con la fertilidad, tanto masculina como femenina.', 10),
	(33, 'Dermatoscopia', 'Servicio que permite examinar la piel de manera más detallada, para detectar signos de cáncer o afecciones dérmicas.', 11),
	(34, 'Pruebas de Alergia Dermatológica', 'Servicio que realiza pruebas para identificar reacciones alérgicas de la piel, como dermatitis alérgica, eccemas, entre otros.', 11);

-- Volcando estructura para tabla hospitalbd.hospital_personal_serviciodiagnostico_lugar
CREATE TABLE IF NOT EXISTS `hospital_personal_serviciodiagnostico_lugar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `serviciodiagnostico_id` bigint NOT NULL,
  `lugar_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_personal_servic_serviciodiagnostico_id_l_62eca530_uniq` (`serviciodiagnostico_id`,`lugar_id`),
  KEY `hospital_personal_se_lugar_id_69389de5_fk_hospital_` (`lugar_id`),
  CONSTRAINT `hospital_personal_se_lugar_id_69389de5_fk_hospital_` FOREIGN KEY (`lugar_id`) REFERENCES `hospital_personal_lugar` (`id`),
  CONSTRAINT `hospital_personal_se_serviciodiagnostico__0f875d40_fk_hospital_` FOREIGN KEY (`serviciodiagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_serviciodiagnostico_lugar: ~49 rows (aproximadamente)
INSERT INTO `hospital_personal_serviciodiagnostico_lugar` (`id`, `serviciodiagnostico_id`, `lugar_id`) VALUES
	(1, 1, 121),
	(2, 1, 122),
	(3, 2, 123),
	(4, 3, 124),
	(5, 4, 125),
	(6, 4, 126),
	(7, 5, 127),
	(8, 6, 150),
	(10, 7, 66),
	(9, 7, 128),
	(12, 8, 72),
	(11, 8, 129),
	(13, 9, 130),
	(14, 10, 131),
	(15, 11, 132),
	(16, 12, 133),
	(17, 13, 134),
	(18, 14, 135),
	(19, 14, 136),
	(20, 15, 137),
	(21, 16, 138),
	(23, 17, 84),
	(22, 17, 139),
	(24, 18, 34),
	(25, 18, 35),
	(26, 18, 36),
	(27, 18, 115),
	(28, 18, 116),
	(30, 19, 124),
	(29, 19, 134),
	(33, 20, 117),
	(31, 20, 135),
	(32, 20, 136),
	(34, 21, 149),
	(35, 21, 150),
	(36, 22, 140),
	(37, 23, 141),
	(38, 24, 142),
	(39, 25, 143),
	(40, 26, 144),
	(41, 27, 145),
	(42, 28, 146),
	(43, 28, 147),
	(44, 29, 148),
	(45, 30, 149),
	(46, 31, 150),
	(47, 32, 151),
	(48, 33, 152),
	(52, 34, 153);

-- Volcando estructura para tabla hospitalbd.hospital_personal_turno
CREATE TABLE IF NOT EXISTS `hospital_personal_turno` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_turno` date DEFAULT NULL,
  `horario_turno` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `motivo` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `asistio` tinyint(1) NOT NULL,
  `especialidad_id` bigint NOT NULL,
  `paciente_id` bigint NOT NULL,
  `profesional_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_tu_especialidad_id_8f04877d_fk_hospital_` (`especialidad_id`),
  KEY `hospital_personal_tu_paciente_id_2db2a483_fk_hospital_` (`paciente_id`),
  KEY `hospital_personal_tu_profesional_id_d103668c_fk_controlUs` (`profesional_id`),
  CONSTRAINT `hospital_personal_tu_especialidad_id_8f04877d_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_tu_paciente_id_2db2a483_fk_hospital_` FOREIGN KEY (`paciente_id`) REFERENCES `hospital_pacientes_paciente` (`id`),
  CONSTRAINT `hospital_personal_tu_profesional_id_d103668c_fk_controlUs` FOREIGN KEY (`profesional_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turno: ~5 rows (aproximadamente)
INSERT INTO `hospital_personal_turno` (`id`, `fecha_creacion`, `fecha_turno`, `horario_turno`, `estado`, `motivo`, `asistio`, `especialidad_id`, `paciente_id`, `profesional_id`) VALUES
	(1, '2025-09-04 19:22:38.997326', '2025-09-08', 'dia', 'noAsistio', 'Sarpullido en el rostro', 0, 6, 2, 2),
	(2, '2025-09-03 22:20:29.259152', '2025-09-03', 'tarde', 'atendido', 'Caída de pelo', 1, 29, 1, 3),
	(3, '2025-09-04 17:50:00.055716', '2025-09-04', 'dia', 'atendido', 'Quiero consultar porque mi hijo no está creciendo como otros chicos de su edad.', 1, 29, 2, 3),
	(4, '2025-09-08 18:50:44.523962', '2025-09-08', 'dia', 'atendido', 'a', 1, 3, 1, 4),
	(5, '2025-09-09 21:28:56.904478', '2025-09-09', 'dia', 'atendido', 'Dolor lumbar', 1, 3, 1, 4),
	(6, '2025-09-10 22:15:31.559612', '2025-09-10', 'dia', 'atendido', 'Ultimamente tengo la presión alta y quiero que me vea un especialista.', 1, 27, 1, 5);

-- Volcando estructura para tabla hospitalbd.hospital_personal_turnoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_turnoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_turno` date DEFAULT NULL,
  `horario_turno` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `orden_id` bigint NOT NULL,
  `servicio_diagnostico_id` bigint NOT NULL,
  `lugar_id` bigint NOT NULL,
  `asistio` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hospital_personal_turnoestudio_orden_id_dca8a0c5_uniq` (`orden_id`),
  KEY `hospital_personal_tu_lugar_id_971898ab_fk_hospital_` (`lugar_id`),
  KEY `hospital_personal_turnoestudio_servicio_diagnostico_id_a0645368` (`servicio_diagnostico_id`),
  CONSTRAINT `hospital_personal_tu_lugar_id_971898ab_fk_hospital_` FOREIGN KEY (`lugar_id`) REFERENCES `hospital_personal_lugar` (`id`),
  CONSTRAINT `hospital_personal_tu_orden_id_dca8a0c5_fk_hospital_` FOREIGN KEY (`orden_id`) REFERENCES `hospital_personal_ordenestudio` (`id`),
  CONSTRAINT `hospital_personal_tu_servicio_diagnostico_a0645368_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turnoestudio: ~6 rows (aproximadamente)
INSERT INTO `hospital_personal_turnoestudio` (`id`, `fecha_creacion`, `fecha_turno`, `horario_turno`, `estado`, `orden_id`, `servicio_diagnostico_id`, `lugar_id`, `asistio`) VALUES
	(2, '2025-09-04 00:11:59.031377', '2025-09-05', 'dia', 'realizado', 1, 23, 141, 1),
	(4, '2025-09-04 19:29:03.393051', '2025-09-10', 'dia', 'realizado', 3, 23, 141, 1),
	(5, '2025-09-05 22:28:24.197001', '2025-09-08', 'dia', 'realizado', 2, 23, 141, 1),
	(6, '2025-09-08 20:17:40.187766', '2025-09-09', 'dia', 'realizado', 4, 4, 126, 1),
	(7, '2025-09-09 21:39:22.207083', '2025-09-10', 'dia', 'realizado', 5, 18, 35, 1),
	(8, '2025-09-10 22:23:15.860339', '2025-09-11', 'dia', 'realizado', 6, 5, 127, 1);

-- Volcando estructura para tabla hospitalbd.hospital_personal_usuarioxdepartamentoxjornadaxlugar
CREATE TABLE IF NOT EXISTS `hospital_personal_usuarioxdepartamentoxjornadaxlugar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `departamento_id` bigint NOT NULL,
  `jornada_id` bigint NOT NULL,
  `lugar_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usuario_jornada` (`usuario_id`,`jornada_id`),
  KEY `hospital_personal_us_departamento_id_eb7624ec_fk_hospital_` (`departamento_id`),
  KEY `hospital_personal_us_jornada_id_3c32d77d_fk_hospital_` (`jornada_id`),
  KEY `hospital_personal_us_lugar_id_2427d845_fk_hospital_` (`lugar_id`),
  CONSTRAINT `hospital_personal_us_departamento_id_eb7624ec_fk_hospital_` FOREIGN KEY (`departamento_id`) REFERENCES `hospital_personal_departamento` (`id`),
  CONSTRAINT `hospital_personal_us_jornada_id_3c32d77d_fk_hospital_` FOREIGN KEY (`jornada_id`) REFERENCES `hospital_personal_jorna_laboral` (`id`),
  CONSTRAINT `hospital_personal_us_lugar_id_2427d845_fk_hospital_` FOREIGN KEY (`lugar_id`) REFERENCES `hospital_personal_lugar` (`id`),
  CONSTRAINT `hospital_personal_us_usuario_id_4eb948f1_fk_controlUs` FOREIGN KEY (`usuario_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxdepartamentoxjornadaxlugar: ~9 rows (aproximadamente)
INSERT INTO `hospital_personal_usuarioxdepartamentoxjornadaxlugar` (`id`, `departamento_id`, `jornada_id`, `lugar_id`, `usuario_id`) VALUES
	(1, 11, 1, 16, 2),
	(2, 11, 2, 16, 2),
	(3, 11, 3, 16, 2),
	(4, 11, 4, 16, 2),
	(5, 2, 1, 79, 3),
	(6, 2, 2, 79, 3),
	(7, 2, 12, 79, 3),
	(8, 2, 3, 7, 4),
	(9, 12, 1, 62, 5),
	(10, 6, 1, 154, 6);

-- Volcando estructura para tabla hospitalbd.hospital_personal_usuarioxespecialidadxservicioxrolesprofesi3bec
CREATE TABLE IF NOT EXISTS `hospital_personal_usuarioxespecialidadxservicioxrolesprofesi3bec` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `especialidad_id` bigint NOT NULL,
  `rol_profesional_id` bigint DEFAULT NULL,
  `servicio_diagnostico_id` bigint DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_us_especialidad_id_e97298d0_fk_hospital_` (`especialidad_id`),
  KEY `hospital_personal_us_rol_profesional_id_4cc21d2e_fk_controlUs` (`rol_profesional_id`),
  KEY `hospital_personal_us_servicio_diagnostico_d248087a_fk_hospital_` (`servicio_diagnostico_id`),
  KEY `hospital_personal_us_usuario_id_4792cd45_fk_controlUs` (`usuario_id`),
  CONSTRAINT `hospital_personal_us_especialidad_id_e97298d0_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_us_rol_profesional_id_4cc21d2e_fk_controlUs` FOREIGN KEY (`rol_profesional_id`) REFERENCES `controlusuario_rolesprofesionales` (`id`),
  CONSTRAINT `hospital_personal_us_servicio_diagnostico_d248087a_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`),
  CONSTRAINT `hospital_personal_us_usuario_id_4792cd45_fk_controlUs` FOREIGN KEY (`usuario_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxespecialidadxservicioxrolesprofesi3bec: ~3 rows (aproximadamente)
INSERT INTO `hospital_personal_usuarioxespecialidadxservicioxrolesprofesi3bec` (`id`, `especialidad_id`, `rol_profesional_id`, `servicio_diagnostico_id`, `usuario_id`) VALUES
	(1, 6, 1, NULL, 2),
	(2, 29, 2, NULL, 3),
	(3, 27, 3, NULL, 5),
	(4, 3, 8, NULL, 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
