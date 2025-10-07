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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.auth_permission: ~108 rows (aproximadamente)
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
	(21, 'Can add tipos usuarios', 6, 'add_tiposusuarios'),
	(22, 'Can change tipos usuarios', 6, 'change_tiposusuarios'),
	(23, 'Can delete tipos usuarios', 6, 'delete_tiposusuarios'),
	(24, 'Can view tipos usuarios', 6, 'view_tiposusuarios'),
	(25, 'Can add user', 7, 'add_persona'),
	(26, 'Can change user', 7, 'change_persona'),
	(27, 'Can delete user', 7, 'delete_persona'),
	(28, 'Can view user', 7, 'view_persona'),
	(29, 'Can add roles profesionales', 8, 'add_rolesprofesionales'),
	(30, 'Can change roles profesionales', 8, 'change_rolesprofesionales'),
	(31, 'Can delete roles profesionales', 8, 'delete_rolesprofesionales'),
	(32, 'Can view roles profesionales', 8, 'view_rolesprofesionales'),
	(33, 'Can add usuario', 9, 'add_usuario'),
	(34, 'Can change usuario', 9, 'change_usuario'),
	(35, 'Can delete usuario', 9, 'delete_usuario'),
	(36, 'Can view usuario', 9, 'view_usuario'),
	(37, 'Can add paciente', 10, 'add_paciente'),
	(38, 'Can change paciente', 10, 'change_paciente'),
	(39, 'Can delete paciente', 10, 'delete_paciente'),
	(40, 'Can view paciente', 10, 'view_paciente'),
	(41, 'Can add menor a cargo de paciente', 11, 'add_menoracargodepaciente'),
	(42, 'Can change menor a cargo de paciente', 11, 'change_menoracargodepaciente'),
	(43, 'Can delete menor a cargo de paciente', 11, 'delete_menoracargodepaciente'),
	(44, 'Can view menor a cargo de paciente', 11, 'view_menoracargodepaciente'),
	(45, 'Can add consultas', 12, 'add_consultas'),
	(46, 'Can change consultas', 12, 'change_consultas'),
	(47, 'Can delete consultas', 12, 'delete_consultas'),
	(48, 'Can view consultas', 12, 'view_consultas'),
	(49, 'Can add departamento', 13, 'add_departamento'),
	(50, 'Can change departamento', 13, 'change_departamento'),
	(51, 'Can delete departamento', 13, 'delete_departamento'),
	(52, 'Can view departamento', 13, 'view_departamento'),
	(53, 'Can add jorna_laboral', 14, 'add_jorna_laboral'),
	(54, 'Can change jorna_laboral', 14, 'change_jorna_laboral'),
	(55, 'Can delete jorna_laboral', 14, 'delete_jorna_laboral'),
	(56, 'Can view jorna_laboral', 14, 'view_jorna_laboral'),
	(57, 'Can add lugar', 15, 'add_lugar'),
	(58, 'Can change lugar', 15, 'change_lugar'),
	(59, 'Can delete lugar', 15, 'delete_lugar'),
	(60, 'Can view lugar', 15, 'view_lugar'),
	(61, 'Can add resultado imagen', 16, 'add_resultadoimagen'),
	(62, 'Can change resultado imagen', 16, 'change_resultadoimagen'),
	(63, 'Can delete resultado imagen', 16, 'delete_resultadoimagen'),
	(64, 'Can view resultado imagen', 16, 'view_resultadoimagen'),
	(65, 'Can add especialidades', 17, 'add_especialidades'),
	(66, 'Can change especialidades', 17, 'change_especialidades'),
	(67, 'Can delete especialidades', 17, 'delete_especialidades'),
	(68, 'Can view especialidades', 17, 'view_especialidades'),
	(69, 'Can add estudios diagnosticos', 18, 'add_estudiosdiagnosticos'),
	(70, 'Can change estudios diagnosticos', 18, 'change_estudiosdiagnosticos'),
	(71, 'Can delete estudios diagnosticos', 18, 'delete_estudiosdiagnosticos'),
	(72, 'Can view estudios diagnosticos', 18, 'view_estudiosdiagnosticos'),
	(73, 'Can add medicaciones', 19, 'add_medicaciones'),
	(74, 'Can change medicaciones', 19, 'change_medicaciones'),
	(75, 'Can delete medicaciones', 19, 'delete_medicaciones'),
	(76, 'Can view medicaciones', 19, 'view_medicaciones'),
	(77, 'Can add orden estudio', 20, 'add_ordenestudio'),
	(78, 'Can change orden estudio', 20, 'change_ordenestudio'),
	(79, 'Can delete orden estudio', 20, 'delete_ordenestudio'),
	(80, 'Can view orden estudio', 20, 'view_ordenestudio'),
	(81, 'Can add plantilla estudio', 21, 'add_plantillaestudio'),
	(82, 'Can change plantilla estudio', 21, 'change_plantillaestudio'),
	(83, 'Can delete plantilla estudio', 21, 'delete_plantillaestudio'),
	(84, 'Can view plantilla estudio', 21, 'view_plantillaestudio'),
	(85, 'Can add servicio diagnostico', 22, 'add_serviciodiagnostico'),
	(86, 'Can change servicio diagnostico', 22, 'change_serviciodiagnostico'),
	(87, 'Can delete servicio diagnostico', 22, 'delete_serviciodiagnostico'),
	(88, 'Can view servicio diagnostico', 22, 'view_serviciodiagnostico'),
	(89, 'Can add turno', 23, 'add_turno'),
	(90, 'Can change turno', 23, 'change_turno'),
	(91, 'Can delete turno', 23, 'delete_turno'),
	(92, 'Can view turno', 23, 'view_turno'),
	(93, 'Can add turno estudio', 24, 'add_turnoestudio'),
	(94, 'Can change turno estudio', 24, 'change_turnoestudio'),
	(95, 'Can delete turno estudio', 24, 'delete_turnoestudio'),
	(96, 'Can view turno estudio', 24, 'view_turnoestudio'),
	(97, 'Can add resultado estudio', 25, 'add_resultadoestudio'),
	(98, 'Can change resultado estudio', 25, 'change_resultadoestudio'),
	(99, 'Can delete resultado estudio', 25, 'delete_resultadoestudio'),
	(100, 'Can view resultado estudio', 25, 'view_resultadoestudio'),
	(101, 'Can add usuario x especialidad x servicio xroles profesionales', 26, 'add_usuarioxespecialidadxservicioxrolesprofesionales'),
	(102, 'Can change usuario x especialidad x servicio xroles profesionales', 26, 'change_usuarioxespecialidadxservicioxrolesprofesionales'),
	(103, 'Can delete usuario x especialidad x servicio xroles profesionales', 26, 'delete_usuarioxespecialidadxservicioxrolesprofesionales'),
	(104, 'Can view usuario x especialidad x servicio xroles profesionales', 26, 'view_usuarioxespecialidadxservicioxrolesprofesionales'),
	(105, 'Can add usuario x departamento x jornada x lugar', 27, 'add_usuarioxdepartamentoxjornadaxlugar'),
	(106, 'Can change usuario x departamento x jornada x lugar', 27, 'change_usuarioxdepartamentoxjornadaxlugar'),
	(107, 'Can delete usuario x departamento x jornada x lugar', 27, 'delete_usuarioxdepartamentoxjornadaxlugar'),
	(108, 'Can view usuario x departamento x jornada x lugar', 27, 'view_usuarioxdepartamentoxjornadaxlugar');

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
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `login_id` (`login_id`),
  UNIQUE KEY `telefono` (`telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_persona: ~2 rows (aproximadamente)
INSERT INTO `controlusuario_persona` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `login_id`, `fecha_nacimiento`, `sexo`, `telefono`) VALUES
	(1, 'pbkdf2_sha256$870000$p98ZHWaJWJyI2PgrfafkO2$6MNKbJM4MiWzjgWq9upEwBno7w1sbfCkSBMfWA2+Rpc=', '2025-10-04 21:21:54.987805', 1, 'Jose', 'Perez', '', 1, 1, '2025-10-03 22:08:00.000000', '33567321', '1000', '1990-05-10', 'M', '32321212'),
	(2, 'pbkdf2_sha256$870000$6X3KPOsO0FqfgTsRtGb7ym$ui/S3kROALDLZIhuBU0PVUJ0smiZQgiI0pXfkC0Z/3s=', '2025-10-04 21:11:58.329204', 0, 'Maximiliano', 'Acuña', 'maxi@gmail.com', 0, 1, '2025-10-03 22:10:31.259562', '45912425', 'maxi@gmail.com', '2004-06-29', 'M', '25160879'),
	(3, 'pbkdf2_sha256$870000$seOAB4vfXHz4EhKlNHNZZC$Z8RirNqBPWWo16vBLl1pY0tLGriXrEXiGYbXzp3I4lI=', NULL, 0, 'Koko', 'Kokino', 'koko@gmail.com', 0, 0, '2025-10-04 18:09:37.053257', '37534444', '1005', '2000-02-02', 'M', '65778899');

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

-- Volcando estructura para tabla hospitalbd.controlusuario_rolesprofesionales
CREATE TABLE IF NOT EXISTS `controlusuario_rolesprofesionales` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_rol_profesional` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipoUsuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `controlUsuario_roles_tipoUsuario_id_76331948_fk_controlUs` (`tipoUsuario_id`),
  CONSTRAINT `controlUsuario_roles_tipoUsuario_id_76331948_fk_controlUs` FOREIGN KEY (`tipoUsuario_id`) REFERENCES `controlusuario_tiposusuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_rolesprofesionales: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.controlusuario_tiposusuarios
CREATE TABLE IF NOT EXISTS `controlusuario_tiposusuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_tipoUsuario` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_tiposusuarios: ~6 rows (aproximadamente)
INSERT INTO `controlusuario_tiposusuarios` (`id`, `nombre_tipoUsuario`) VALUES
	(1, 'Superadministrador'),
	(2, 'Administrador'),
	(3, 'Médico'),
	(4, 'Enfermero'),
	(5, 'Apoyo en Diagnóstico y Tratamiento'),
	(6, 'Cargador de Resultados');

-- Volcando estructura para tabla hospitalbd.controlusuario_usuario
CREATE TABLE IF NOT EXISTS `controlusuario_usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero_matricula` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `debe_cambiar_contraseña` tinyint(1) NOT NULL,
  `persona_id` bigint NOT NULL,
  `tipoUsuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  KEY `controlUsuario_usuar_tipoUsuario_id_ded93330_fk_controlUs` (`tipoUsuario_id`),
  CONSTRAINT `controlUsuario_usuar_persona_id_60479e85_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`),
  CONSTRAINT `controlUsuario_usuar_tipoUsuario_id_ded93330_fk_controlUs` FOREIGN KEY (`tipoUsuario_id`) REFERENCES `controlusuario_tiposusuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuario: ~2 rows (aproximadamente)
INSERT INTO `controlusuario_usuario` (`id`, `numero_matricula`, `debe_cambiar_contraseña`, `persona_id`, `tipoUsuario_id`) VALUES
	(1, NULL, 0, 1, 1),
	(2, '10010', 1, 3, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_admin_log: ~1 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-10-03 22:11:33.686300', '2', 'Maximiliano Acuña (maxi@gmail.com) - DNI: 45912425', 2, '[{"changed": {"fields": ["password"]}}]', 7, 1),
	(2, '2025-10-03 22:17:53.836932', '1', 'Jose Perez (1000) - DNI: 33567321', 2, '[{"changed": {"fields": ["Dni", "Sexo", "Telefono"]}}]', 7, 1),
	(3, '2025-10-03 22:18:09.554015', '1', 'Usuario: 1 - Jose Perez - Legajo hospitalario: 1000', 1, '[{"added": {}}]', 9, 1);

-- Volcando estructura para tabla hospitalbd.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_content_type: ~27 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(7, 'controlUsuario', 'persona'),
	(8, 'controlUsuario', 'rolesprofesionales'),
	(6, 'controlUsuario', 'tiposusuarios'),
	(9, 'controlUsuario', 'usuario'),
	(11, 'hospital_pacientes', 'menoracargodepaciente'),
	(10, 'hospital_pacientes', 'paciente'),
	(12, 'hospital_personal', 'consultas'),
	(13, 'hospital_personal', 'departamento'),
	(17, 'hospital_personal', 'especialidades'),
	(18, 'hospital_personal', 'estudiosdiagnosticos'),
	(14, 'hospital_personal', 'jorna_laboral'),
	(15, 'hospital_personal', 'lugar'),
	(19, 'hospital_personal', 'medicaciones'),
	(20, 'hospital_personal', 'ordenestudio'),
	(21, 'hospital_personal', 'plantillaestudio'),
	(25, 'hospital_personal', 'resultadoestudio'),
	(16, 'hospital_personal', 'resultadoimagen'),
	(22, 'hospital_personal', 'serviciodiagnostico'),
	(23, 'hospital_personal', 'turno'),
	(24, 'hospital_personal', 'turnoestudio'),
	(27, 'hospital_personal', 'usuarioxdepartamentoxjornadaxlugar'),
	(26, 'hospital_personal', 'usuarioxespecialidadxservicioxrolesprofesionales'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla hospitalbd.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_migrations: ~21 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-10-03 22:04:07.331863'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2025-10-03 22:04:07.689392'),
	(3, 'auth', '0001_initial', '2025-10-03 22:04:08.600726'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2025-10-03 22:04:08.817529'),
	(5, 'auth', '0003_alter_user_email_max_length', '2025-10-03 22:04:08.834877'),
	(6, 'auth', '0004_alter_user_username_opts', '2025-10-03 22:04:08.859456'),
	(7, 'auth', '0005_alter_user_last_login_null', '2025-10-03 22:04:08.911798'),
	(8, 'auth', '0006_require_contenttypes_0002', '2025-10-03 22:04:08.946250'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2025-10-03 22:04:08.966827'),
	(10, 'auth', '0008_alter_user_username_max_length', '2025-10-03 22:04:09.005915'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2025-10-03 22:04:09.048942'),
	(12, 'auth', '0010_alter_group_name_max_length', '2025-10-03 22:04:09.141717'),
	(13, 'auth', '0011_update_proxy_permissions', '2025-10-03 22:04:09.187094'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2025-10-03 22:04:09.230122'),
	(15, 'controlUsuario', '0001_initial', '2025-10-03 22:04:11.095661'),
	(16, 'admin', '0001_initial', '2025-10-03 22:04:11.691491'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2025-10-03 22:04:11.734640'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-03 22:04:11.785029'),
	(19, 'hospital_pacientes', '0001_initial', '2025-10-03 22:04:12.569676'),
	(20, 'hospital_personal', '0001_initial', '2025-10-03 22:04:20.189709'),
	(21, 'sessions', '0001_initial', '2025-10-03 22:04:20.785556'),
	(22, 'controlUsuario', '0002_alter_persona_options', '2025-10-04 17:38:30.839802'),
	(23, 'hospital_personal', '0002_resultadoestudio_cargado_por', '2025-10-04 17:38:31.821967'),
	(24, 'hospital_personal', '0003_especialidades_permite_turno', '2025-10-04 21:06:12.811847');

-- Volcando estructura para tabla hospitalbd.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_session: ~1 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('5ro8t4t7zy2fp9nrhhelfxzjiaetjjfu', '.eJxVjMsOwiAQRf-FtSFOC4Vx6b7fQAZmkKqBpI-V8d-1SRe6veec-1KBtrWEbZE5TKwuCtTpd4uUHlJ3wHeqt6ZTq-s8Rb0r-qCLHhvL83q4fweFlvKtqRsG8IAMnBGhJxIh4xA5W7TJoQUw7B0RnLFLMaLvGVGcNR4Gyer9AdjXN5o:1v4nzx:VaWYemU0Bh15SbyG3bg_CqcRqKqVryNiPEGHrsq1RqE', '2025-10-17 22:11:33.729086'),
	('6b3decth51kbkmmousog6cxi6vym45xe', '.eJxVjMsOwiAQRf-FtSFOC4Vx6b7fQAZmkKqBpI-V8d-1SRe6veec-1KBtrWEbZE5TKwuCtTpd4uUHlJ3wHeqt6ZTq-s8Rb0r-qCLHhvL83q4fweFlvKtqRsG8IAMnBGhJxIh4xA5W7TJoQUw7B0RnLFLMaLvGVGcNR4Gyer9AdjXN5o:1v4sWn:IXz7UV-eL4ZRCPKmhNvozI6wCooo-Tir9ZK_G-nVjC4', '2025-10-18 03:01:45.103156'),
	('m086zfa3gvgwn0qneajpizalzvx02ews', '.eJxVjMsOwiAQRf-FtSFOC4Vx6b7fQAZmkKqBpI-V8d-1SRe6veec-1KBtrWEbZE5TKwuCtTpd4uUHlJ3wHeqt6ZTq-s8Rb0r-qCLHhvL83q4fweFlvKtqRsG8IAMnBGhJxIh4xA5W7TJoQUw7B0RnLFLMaLvGVGcNR4Gyer9AdjXN5o:1v59hT:21_D1juKDVX-Ru_HLh4r2JagmUZ9RtUh4gKmfbp4a3g', '2025-10-18 21:21:55.005773'),
	('tw7l3yav1twpk2u6oo041rdwre91gfb3', '.eJxVjMsOwiAQRf-FtSFOC4Vx6b7fQAZmkKqBpI-V8d-1SRe6veec-1KBtrWEbZE5TKwuCtTpd4uUHlJ3wHeqt6ZTq-s8Rb0r-qCLHhvL83q4fweFlvKtqRsG8IAMnBGhJxIh4xA5W7TJoQUw7B0RnLFLMaLvGVGcNR4Gyer9AdjXN5o:1v4o7G:9t1yxYEFEaqvBf6VoXFjlmBhOvMM2KaihnRikX4aQ74', '2025-10-17 22:19:06.272104'),
	('wiu31m52a7n8lq5coffz3kxiqbah2p89', '.eJxVjMsOwiAQRf-FtSGUxwAu3fsNZIBBqgaS0q6M_65NutDtPefcFwu4rTVsg5YwZ3Zmkp1-t4jpQW0H-Y7t1nnqbV3myHeFH3Twa8_0vBzu30HFUb_1pCchAYBy8SjAGgkWk86ymKRNsc6D9klFUGC906SKJ62cIAkoMBb2_gC8VTct:1v59Xq:HXToc8u1Oe_gYF0chakezLiZJ7JXE2yIJ6qJ0-vC03M', '2025-10-18 21:11:58.375580');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_menoracargodepaciente: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_pacientes_paciente
CREATE TABLE IF NOT EXISTS `hospital_pacientes_paciente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `persona_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  CONSTRAINT `hospital_pacientes_p_persona_id_bd0c2004_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_paciente: ~1 rows (aproximadamente)
INSERT INTO `hospital_pacientes_paciente` (`id`, `direccion`, `persona_id`) VALUES
	(1, 'Calle Falsa 1234', 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_consultas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_departamento
CREATE TABLE IF NOT EXISTS `hospital_personal_departamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_departamento: ~0 rows (aproximadamente)
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
  `permite_turno` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_departamento_id_c964bc2b_fk_hospital_` (`departamento_id`),
  CONSTRAINT `hospital_personal_es_departamento_id_c964bc2b_fk_hospital_` FOREIGN KEY (`departamento_id`) REFERENCES `hospital_personal_departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_especialidades: ~40 rows (aproximadamente)
INSERT INTO `hospital_personal_especialidades` (`id`, `nombre_especialidad`, `descripcion`, `departamento_id`, `permite_turno`) VALUES
	(1, 'Medicina de Urgencias', 'Especialidad que se ocupa de la atención inmediata a pacientes en situaciones de emergencia y urgencias médicas, como accidentes o enfermedades repentinas.', 1, 0),
	(2, 'Trauma y Cirugía de Urgencias', 'Especialidad centrada en el manejo de traumas y lesiones en situaciones de emergencia que requieren intervención quirúrgica urgente.', 1, 0),
	(3, 'Medicina General', 'Especialidad que se encarga de la atención primaria de la salud, diagnóstico y tratamiento de enfermedades comunes y prevención.', 2, 1),
	(4, 'Pediatría', 'Especialidad que se dedica a la atención médica de niños y adolescentes, desde el nacimiento hasta la adolescencia.', 2, 1),
	(5, 'Ginecología y Obstetricia', 'Especialidad médica que atiende la salud reproductiva femenina, abarcando desde consultas ginecológicas hasta seguimiento prenatal y postnatal.', 2, 1),
	(6, 'Dermatología', 'Especialidad que diagnostica y trata las enfermedades de la piel, cabello y uñas, incluyendo enfermedades dermatológicas comunes y estéticas.', 2, 1),
	(7, 'Cirugía General', 'Especialidad que se enfoca en el tratamiento quirúrgico de diversas patologías, incluyendo intervenciones en órganos y tejidos internos.', 3, 1),
	(8, 'Cirugía Oncológica', 'Especialidad quirúrgica que se dedica al diagnóstico y tratamiento quirúrgico del cáncer en diversas partes del cuerpo.', 3, 1),
	(9, 'Cirugía Vascular', 'Especialidad que aborda las enfermedades de los vasos sanguíneos, mediante procedimientos quirúrgicos.', 3, 1),
	(10, 'Medicina Crítica', 'Especialidad médica que se encarga del manejo de pacientes en estado crítico, incluyendo soporte vital y monitoreo intensivo.', 4, 0),
	(11, 'Anestesiología', 'Especialidad médica que se ocupa de la administración de anestesia y el manejo del dolor en procedimientos quirúrgicos o críticos.', 4, 1),
	(12, 'Radiología intervencionista', 'Especialidad médica que realiza procedimientos mínimamente invasivos guiados por imágenes (rayos X, ecografía, tomografía, resonancia) para diagnosticar y tratar diversas patologías, permitiendo atención directa del paciente sin necesidad de cirugía abierta.', 5, 1),
	(13, 'Radiología Pediátrica', 'Especialidad que se enfoca en realizar estudios de imagen para niños, adaptados a sus características físicas y patológicas.', 5, 1),
	(14, 'Patología', 'Especialidad médica que se ocupa del diagnóstico de enfermedades a través de análisis de muestras biológicas.', 6, 1),
	(15, 'Microbiología', 'Especialidad enfocada en el diagnóstico de infecciones mediante análisis microbiológicos de muestras de sangre, orina, etc.', 6, 1),
	(16, 'Farmacia Clínica', 'Especialidad que se ocupa del uso racional de los medicamentos en pacientes hospitalizados o ambulatorios, para garantizar la seguridad y efectividad del tratamiento.', 7, 1),
	(17, 'Oncología Médica', 'Especialidad que trata el cáncer mediante quimioterapia, terapias biológicas y seguimiento de pacientes con cáncer en todas sus fases.', 8, 1),
	(18, 'Oncología Ginecológica', 'Especialidad médica que trata los cánceres relacionados con el aparato reproductivo femenino, como cáncer de ovario y de cuello uterino.', 8, 1),
	(19, 'Neonatología', 'Especialidad médica que se ocupa del cuidado de recién nacidos, especialmente aquellos que nacen prematuramente o con enfermedades.', 9, 1),
	(20, 'Pediatría General', 'Especialidad que proporciona atención médica general a niños y adolescentes, abarcando el tratamiento de enfermedades y el seguimiento del desarrollo.', 9, 1),
	(21, 'Obstetricia', 'Especialidad que se ocupa del manejo del embarazo, el parto y el postparto, incluyendo la salud de la madre y el bebé.', 10, 1),
	(22, 'Ginecología', 'Especialidad médica que se encarga del diagnóstico y tratamiento de enfermedades del aparato reproductivo femenino, incluyendo trastornos menstruales y cáncer ginecológico.', 10, 1),
	(23, 'Dermatología Estética', 'Especialidad que trata las afecciones estéticas de la piel, cabello y uñas, como rejuvenecimiento facial, tratamientos contra la caída del cabello, etc.', 11, 1),
	(24, 'Cirugía Dermatológica', 'Especialidad quirúrgica que se ocupa de realizar procedimientos en la piel, como la eliminación de tumores cutáneos, tratamiento de cicatrices, etc.', 11, 1),
	(25, 'Medicina de Emergencias Pediátricas', 'Especialidad que se ocupa de la atención de emergencias médicas en niños, considerando sus necesidades específicas.', 1, 0),
	(26, 'Medicina de Desastres', 'Especialidad que se encarga de la atención de emergencias y desastres masivos, como accidentes múltiples, desastres naturales, etc.', 1, 0),
	(27, 'Cardiología', 'Especialidad que se dedica a diagnosticar y tratar enfermedades del corazón y del sistema circulatorio.', 2, 1),
	(28, 'Neumología', 'Especialidad que se ocupa de las enfermedades respiratorias, como el asma, bronquitis crónica, neumonía, entre otras.', 2, 1),
	(29, 'Endocrinología', 'Especialidad médica que trata trastornos hormonales y metabólicos, como diabetes, hipotiroidismo, etc.', 2, 1),
	(30, 'Oftalmología', 'Especialidad que se dedica al diagnóstico y tratamiento de enfermedades y trastornos visuales.', 2, 1),
	(31, 'Otorrinolaringología', 'Especialidad que se enfoca en el diagnóstico y tratamiento de enfermedades relacionadas con los oídos, nariz y garganta.', 2, 1),
	(32, 'Urología', 'Especialidad que trata enfermedades del sistema urinario y los órganos reproductores masculinos, incluyendo problemas renales y de próstata.', 2, 1),
	(33, 'Reumatología', 'Especialidad médica que diagnostica y trata enfermedades autoinmunes y enfermedades musculoesqueléticas como artritis y lupus.', 2, 1),
	(34, 'Gastroenterología', 'Especialidad dedicada al diagnóstico y tratamiento de enfermedades del aparato digestivo, incluyendo el hígado, páncreas y colon.', 2, 1),
	(35, 'Neurología', 'Especialidad médica que se ocupa de los trastornos del sistema nervioso central y periférico, como accidentes cerebrovasculares, esclerosis múltiple, etc.', 2, 1),
	(36, 'Cirugía Torácica', 'Especialidad quirúrgica que se ocupa del tratamiento de enfermedades del tórax, incluidos los pulmones y el corazón.', 3, 1),
	(37, 'Cirugía Plástica y Estética', 'Especialidad que se dedica a la reparación de tejidos y a los procedimientos estéticos reconstructivos.', 3, 1),
	(38, 'Cirugía Ortopédica', 'Especialidad quirúrgica que trata problemas musculoesqueléticos, incluyendo fracturas, deformidades y trastornos articulares.', 3, 1),
	(39, 'Neurocrítica', 'Especialidad que se ocupa del tratamiento de pacientes con trastornos neurológicos graves, como traumatismos craneoencefálicos o ACVs.', 4, 0),
	(40, 'Cuidados Paliativos', 'Especialidad que se centra en el alivio del dolor y el sufrimiento de pacientes con enfermedades terminales o crónicas.', 4, 1);

-- Volcando estructura para tabla hospitalbd.hospital_personal_estudiosdiagnosticos
CREATE TABLE IF NOT EXISTS `hospital_personal_estudiosdiagnosticos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipo_resultado` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_estudio` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `especialidad_id` bigint NOT NULL,
  `servicio_diagnostico_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` (`servicio_diagnostico_id`),
  KEY `hospital_personal_es_especialidad_id_2069348a_fk_hospital_` (`especialidad_id`),
  CONSTRAINT `hospital_personal_es_especialidad_id_2069348a_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_estudiosdiagnosticos: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_estudiosdiagnosticos` (`id`, `tipo_resultado`, `nombre_estudio`, `especialidad_id`, `servicio_diagnostico_id`) VALUES
	(1, 'img', 'Radiografía de tórax de urgencia', 1, 1),
	(2, 'img', 'Radiografía de abdomen de urgencia', 1, 1),
	(3, 'img', 'Radiografía de pelvis', 1, 1),
	(4, 'img', 'Ecografía FAST', 1, 2),
	(5, 'img', 'Ecografía abdominal rápida', 1, 2),
	(6, 'img', 'Ecocardiografía rápida', 1, 2),
	(7, 'img', 'TAC de cráneo sin contraste', 1, 3),
	(8, 'img', 'TAC de tórax de emergencia', 1, 3),
	(9, 'img', 'TAC abdominal de urgencia', 1, 3),
	(10, 'img', 'TAC de columna cervical', 1, 3),
	(11, 'img', 'Radiografía de huesos largos', 2, 1),
	(12, 'img', 'Radiografía de columna cervical', 2, 1),
	(13, 'img', 'Radiografía de tórax post-trauma', 2, 1),
	(14, 'img', 'Ecografía FAST extendido', 2, 2),
	(15, 'img', 'Ecografía abdominal en trauma', 2, 2),
	(16, 'img', 'TAC de tórax politrauma', 2, 3),
	(17, 'img', 'TAC de abdomen politrauma', 2, 3),
	(18, 'img', 'TAC de cráneo trauma cerrado', 2, 3),
	(19, 'img', 'TAC de pelvis politrauma', 2, 3),
	(20, 'img', 'TAC cuerpo entero (Whole Body CT)', 2, 3),
	(21, 'img', 'Radiografía de tórax pediátrica', 25, 1),
	(22, 'img', 'Radiografía de huesos largos pediátricos', 25, 1),
	(23, 'img', 'Radiografía de abdomen pediátrico', 25, 1),
	(24, 'img', 'Ecografía abdominal pediátrica', 25, 2),
	(25, 'img', 'Ecografía cerebral neonatal', 25, 2),
	(26, 'img', 'Ecografía renal pediátrica', 25, 2),
	(27, 'img', 'TAC craneal pediátrico', 25, 3),
	(28, 'img', 'TAC de tórax pediátrico', 25, 3),
	(29, 'img', 'TAC abdominal pediátrico', 25, 3),
	(30, 'img', 'TAC de columna pediátrica', 25, 3),
	(31, 'img', 'Radiografía de tórax múltiples víctimas', 26, 1),
	(32, 'img', 'Radiografía de pelvis múltiples víctimas', 26, 1),
	(33, 'img', 'Radiografía de columna múltiples víctimas', 26, 1),
	(34, 'img', 'Ecografía FAST en desastre', 26, 2),
	(35, 'img', 'Ecografía abdominal rápida en desastre', 26, 2),
	(36, 'img', 'Ecografía cardiaca rápida en desastre', 26, 2),
	(37, 'img', 'TAC de cráneo en catástrofe', 26, 3),
	(38, 'img', 'TAC de tórax en catástrofe', 26, 3),
	(39, 'img', 'TAC de abdomen en catástrofe', 26, 3),
	(40, 'img', 'TAC cuerpo entero en catástrofe', 26, 3),
	(41, 'lab', 'Hemograma completo', 3, 4),
	(42, 'lab', 'Examen de orina completo', 3, 4),
	(43, 'lab', 'Perfil lipídico', 3, 4),
	(44, 'lab', 'Glucemia en ayunas', 3, 4),
	(45, 'lab', 'Pruebas de función hepática', 3, 4),
	(46, 'lab', 'Pruebas de función renal', 3, 4),
	(47, 'fisio', 'Electrocardiograma en reposo', 3, 5),
	(48, 'eval', 'Examen visual básico', 3, 10),
	(49, 'eval', 'Examen auditivo básico', 3, 9),
	(50, 'lab', 'Prueba de alergia general', 3, 11),
	(51, 'lab', 'Hemograma pediátrico', 4, 4),
	(52, 'lab', 'Examen de orina pediátrico', 4, 4),
	(53, 'lab', 'Perfil metabólico pediátrico', 4, 4),
	(54, 'lab', 'Prueba neonatal de hipotiroidismo', 4, 29),
	(55, 'img', 'Ecografía abdominal pediátrica', 4, 30),
	(56, 'img', 'Ecografía cerebral pediátrica', 4, 30),
	(57, 'eval', 'Examen auditivo neonatal', 4, 29),
	(58, 'eval', 'Examen visual pediátrico', 4, 10),
	(59, 'lab', 'Pruebas de alergia pediátricas', 4, 11),
	(60, 'lab', 'Cultivo de orina pediátrico', 4, 4),
	(61, 'img', 'Ecografía ginecológica transvaginal', 5, 31),
	(62, 'img', 'Ecografía transabdominal', 5, 31),
	(63, 'img', 'Ecografía de control de folículos', 5, 31),
	(64, 'lab', 'Perfil hormonal femenino', 5, 32),
	(65, 'lab', 'Prueba de fertilidad básica', 5, 32),
	(66, 'lab', 'Prueba de fertilidad avanzada', 5, 32),
	(67, 'lab', 'Examen Papanicolaou', 5, 4),
	(68, 'img', 'Colposcopia', 5, 31),
	(69, 'lab', 'Biopsia endometrial', 5, 4),
	(70, 'lab', 'Examen de orina en embarazo', 5, 4),
	(71, 'img', 'Dermatoscopia de lunares', 6, 33),
	(72, 'img', 'Dermatoscopia de lesiones pigmentadas', 6, 33),
	(73, 'lab', 'Pruebas de alergia dermatológica', 6, 34),
	(74, 'lab', 'Prueba del parche (epicutánea)', 6, 34),
	(75, 'lab', 'Biopsia de piel', 6, 33),
	(76, 'lab', 'Cultivo micológico', 6, 34),
	(77, 'lab', 'Examen bacteriológico de piel', 6, 34),
	(78, 'img', 'Dermatoscopia digital', 6, 33),
	(79, 'eval', 'Examen capilar (tricograma)', 6, 34),
	(80, 'eval', 'Examen de uñas (onicopatías)', 6, 34),
	(81, 'fisio', 'Electrocardiograma en reposo', 27, 5),
	(82, 'fisio', 'Electrocardiograma de esfuerzo', 27, 5),
	(83, 'fisio', 'Holter de 24 horas', 27, 5),
	(84, 'fisio', 'Prueba de esfuerzo ergométrica', 27, 5),
	(85, 'img', 'Ecocardiograma Doppler', 27, 6),
	(86, 'img', 'Ecocardiograma transtorácico', 27, 6),
	(87, 'img', 'Ecocardiograma transesofágico', 27, 6),
	(88, 'fisio', 'Prueba de función cardíaca basal', 27, 5),
	(89, 'fisio', 'Prueba de esfuerzo farmacológica', 27, 5),
	(90, 'fisio', 'Prueba de variabilidad cardíaca', 27, 5),
	(91, 'fisio', 'Espirometría simple', 28, 7),
	(92, 'fisio', 'Espirometría forzada', 28, 7),
	(93, 'fisio', 'Prueba broncodilatadora', 28, 7),
	(94, 'fisio', 'Prueba de difusión pulmonar', 28, 7),
	(95, 'fisio', 'Prueba de función pulmonar completa', 28, 7),
	(96, 'fisio', 'Prueba de resistencia de vías aéreas', 28, 7),
	(97, 'fisio', 'Test de marcha de 6 minutos', 28, 7),
	(98, 'img', 'Radiografía de tórax control', 28, 18),
	(99, 'img', 'TAC de tórax alta resolución', 28, 19),
	(100, 'img', 'Resonancia pulmonar', 28, 20),
	(101, 'lab', 'Perfil tiroideo completo', 29, 23),
	(102, 'lab', 'Prueba de TSH', 29, 23),
	(103, 'lab', 'Prueba de T4 libre', 29, 23),
	(104, 'lab', 'Prueba de T3', 29, 23),
	(105, 'lab', 'Prueba de anticuerpos antitiroideos', 29, 23),
	(106, 'lab', 'Perfil glucémico', 29, 23),
	(107, 'lab', 'Prueba de tolerancia a la glucosa', 29, 23),
	(108, 'lab', 'Prueba de insulina basal', 29, 23),
	(109, 'lab', 'Prueba de hemoglobina glicosilada', 29, 23),
	(110, 'lab', 'Perfil lipídico endocrinológico', 29, 23),
	(111, 'eval', 'Examen de agudeza visual', 30, 10),
	(112, 'eval', 'Campimetría visual', 30, 10),
	(113, 'eval', 'Fondo de ojo', 30, 10),
	(114, 'eval', 'Tonometría ocular', 30, 10),
	(115, 'eval', 'Prueba de motilidad ocular', 30, 10),
	(116, 'eval', 'Prueba de visión de colores', 30, 10),
	(117, 'eval', 'Examen con lámpara de hendidura', 30, 10),
	(118, 'eval', 'Retinografía', 30, 10),
	(119, 'eval', 'OCT (Tomografía de coherencia óptica)', 30, 10),
	(120, 'eval', 'Paquimetría corneal', 30, 10),
	(121, 'eval', 'Audiometría tonal', 31, 9),
	(122, 'eval', 'Audiometría impedanciométrica', 31, 9),
	(123, 'img', 'Videoendoscopía nasofaríngea', 31, 6),
	(124, 'eval', 'Timpanometría', 31, 9),
	(125, 'eval', 'Pruebas de equilibrio vestibular', 31, 9),
	(126, 'eval', 'Examen de laringe con fibra óptica', 31, 6),
	(127, 'eval', 'Otoemisiones acústicas', 31, 9),
	(128, 'eval', 'Cultivo de exudado faríngeo', 31, 6),
	(129, 'eval', 'Prueba de olfato', 31, 6),
	(130, 'img', 'TAC de senos paranasales', 31, 19),
	(131, 'lab', 'Uroanálisis completo', 32, 24),
	(132, 'img', 'Ecografía renal y vesical', 32, 21),
	(133, 'img', 'Uro-TAC', 32, 19),
	(134, 'img', 'Cistoscopia', 32, 6),
	(135, 'lab', 'Pruebas de función renal', 32, 4),
	(136, 'img', 'Uro-RM (Resonancia Magnética)', 32, 20),
	(137, 'fisio', 'Flujometría urinaria', 32, 24),
	(138, 'lab', 'Estudio de próstata (PSA)', 32, 23),
	(139, 'lab', 'Cultivo de orina', 32, 24),
	(140, 'img', 'Urografía intravenosa', 32, 19),
	(141, 'lab', 'Perfil inflamatorio', 33, 4),
	(142, 'lab', 'Factor reumatoide', 33, 4),
	(143, 'lab', 'Anticuerpos anti-CCP', 33, 4),
	(144, 'lab', 'Análisis de líquido sinovial', 33, 4),
	(145, 'img', 'Radiografía de articulaciones', 33, 18),
	(146, 'img', 'Resonancia magnética de articulaciones', 33, 20),
	(147, 'img', 'Ultrasonido musculoesquelético', 33, 21),
	(148, 'img', 'Densitometría ósea', 33, 18),
	(149, 'lab', 'Pruebas HLA-B27', 33, 23),
	(150, 'eval', 'Examen físico especializado en artritis', 33, 6),
	(151, 'img', 'Endoscopia digestiva alta', 34, 8),
	(152, 'img', 'Colonoscopia', 34, 8),
	(153, 'img', 'Ecografía abdominal', 34, 21),
	(154, 'img', 'TAC abdominal', 34, 19),
	(155, 'lab', 'Pruebas de función hepática', 34, 4),
	(156, 'lab', 'Test de Helicobacter pylori', 34, 24),
	(157, 'lab', 'Biopsia gastrointestinal', 34, 27),
	(158, 'img', 'Resonancia magnética abdominal', 34, 20),
	(159, 'img', 'Fibroscan hepático', 34, 20),
	(160, 'fisio', 'pHmetría esofágica', 34, 7),
	(161, 'fisio', 'Electroencefalograma (EEG)', 35, 17),
	(162, 'fisio', 'Potenciales evocados', 35, 17),
	(163, 'img', 'TAC craneal', 35, 19),
	(164, 'img', 'RM cerebral', 35, 20),
	(165, 'fisio', 'Estudio de conducción nerviosa', 35, 17),
	(166, 'fisio', 'Electromiografía (EMG)', 35, 17),
	(167, 'fisio', 'Monitorización ambulatoria de EEG', 35, 17),
	(168, 'eval', 'Examen neurológico completo', 35, 6),
	(169, 'lab', 'Líquido cefalorraquídeo', 35, 23),
	(170, 'img', 'Ecografía Doppler de vasos cerebrales', 35, 6),
	(171, 'img', 'Radiografía preoperatoria', 7, 12),
	(172, 'img', 'TAC abdominal preoperatorio', 7, 19),
	(173, 'img', 'RM de órganos internos', 7, 20),
	(174, 'img', 'Ecografía preoperatoria', 7, 21),
	(175, 'lab', 'Marcadores tumorales', 7, 23),
	(176, 'lab', 'Examen de laboratorio prequirúrgico', 7, 4),
	(177, 'fisio', 'Electrocardiograma prequirúrgico', 7, 5),
	(178, 'fisio', 'Prueba de función pulmonar', 7, 7),
	(179, 'lab', 'Biopsia de tejidos', 7, 27),
	(180, 'img', 'Resonancia o TAC de planificación quirúrgica', 7, 20),
	(181, 'lab', 'Biopsia tumoral', 8, 27),
	(182, 'lab', 'Marcadores tumorales', 8, 23),
	(183, 'img', 'TAC prequirúrgico de tumor', 8, 19),
	(184, 'img', 'RM prequirúrgica de tumor', 8, 20),
	(185, 'img', 'PET-CT', 8, 19),
	(186, 'img', 'Ecografía abdominal en cáncer', 8, 21),
	(187, 'img', 'Radiografía de tórax en oncología', 8, 18),
	(188, 'lab', 'Pruebas hematológicas', 8, 4),
	(189, 'img', 'Endoscopia oncológica', 8, 8),
	(190, 'lab', 'Estudios de función hepática y renal', 8, 4),
	(191, 'img', 'Doppler arterial', 9, 21),
	(192, 'img', 'Doppler venoso', 9, 21),
	(193, 'img', 'Angiografía por TAC', 9, 19),
	(194, 'img', 'Angiografía por RM', 9, 20),
	(195, 'img', 'Ecografía vascular', 9, 21),
	(196, 'lab', 'Pruebas de coagulación', 9, 4),
	(197, 'eval', 'Examen físico vascular', 9, 6),
	(198, 'img', 'TAC de vasos periféricos', 9, 19),
	(199, 'img', 'RM de vasos periféricos', 9, 20),
	(200, 'fisio', 'Estudio de perfusión tisular', 9, 21),
	(201, 'img', 'Radiografía de tórax preoperatoria', 36, 18),
	(202, 'img', 'TAC torácico', 36, 19),
	(203, 'img', 'RM torácica', 36, 20),
	(204, 'img', 'Broncoscopia diagnóstica', 36, 8),
	(205, 'fisio', 'Pruebas de función pulmonar', 36, 7),
	(206, 'img', 'Ecografía torácica', 36, 21),
	(207, 'lab', 'Marcadores tumorales pulmonares', 36, 23),
	(208, 'img', 'Gammagrafía pulmonar', 36, 19),
	(209, 'lab', 'Examen preoperatorio general', 36, 4),
	(210, 'lab', 'Biopsia pulmonar', 36, 27),
	(211, 'eval', 'Evaluación prequirúrgica de piel', 37, 6),
	(212, 'eval', 'Fotografía médica preoperatoria', 37, 6),
	(213, 'img', 'Ecografía de tejidos blandos', 37, 21),
	(214, 'lab', 'Biopsia cutánea', 37, 27),
	(215, 'lab', 'Laboratorio preoperatorio', 37, 4),
	(216, 'lab', 'Evaluación de coagulación', 37, 4),
	(217, 'img', 'TAC de área quirúrgica', 37, 19),
	(218, 'img', 'RM de área quirúrgica', 37, 20),
	(219, 'img', 'Evaluación vascular de colgajos', 37, 21),
	(220, 'fisio', 'Estudio de función respiratoria', 37, 7),
	(221, 'img', 'Radiografía de articulaciones', 38, 18),
	(222, 'img', 'TAC de fracturas complejas', 38, 19),
	(223, 'img', 'RM de articulaciones', 38, 20),
	(224, 'img', 'Densitometría ósea', 38, 18),
	(225, 'img', 'Ultrasonido musculoesquelético', 38, 21),
	(226, 'lab', 'Estudios de laboratorio prequirúrgicos', 38, 4),
	(227, 'fisio', 'Electrocardiograma preoperatorio', 38, 5),
	(228, 'fisio', 'Pruebas de función pulmonar', 38, 7),
	(229, 'lab', 'Biopsia ósea', 38, 27),
	(230, 'eval', 'Evaluación física ortopédica completa', 38, 6),
	(231, 'fisio', 'Monitoreo hemodinámico', 10, 15),
	(232, 'lab', 'Gasometría arterial', 10, 23),
	(233, 'fisio', 'Electrocardiograma continuo', 10, 5),
	(234, 'img', 'Radiografía de tórax de UCI', 10, 18),
	(235, 'img', 'Ecografía abdominal en UCI', 10, 21),
	(236, 'img', 'TAC urgente en UCI', 10, 19),
	(237, 'img', 'Resonancia magnética urgente', 10, 20),
	(238, 'lab', 'Laboratorio clínico completo', 10, 4),
	(239, 'fisio', 'Monitoreo de presión intracraneal', 10, 15),
	(240, 'lab', 'Pruebas de función renal y hepática', 10, 4),
	(241, 'eval', 'Evaluación preanestésica', 11, 6),
	(242, 'fisio', 'Monitoreo intraoperatorio', 11, 15),
	(243, 'fisio', 'Gasometría arterial', 11, 23),
	(244, 'fisio', 'Electrocardiograma preanestésico', 11, 5),
	(245, 'lab', 'Pruebas de coagulación', 11, 4),
	(246, 'img', 'Ecografía para bloqueos nerviosos', 11, 21),
	(247, 'fisio', 'Monitoreo de oxigenación y ventilación', 11, 15),
	(248, 'fisio', 'Evaluación respiratoria preoperatoria', 11, 7),
	(249, 'lab', 'Laboratorio preoperatorio', 11, 4),
	(250, 'lab', 'Pruebas de función hepática y renal', 11, 4),
	(251, 'fisio', 'Monitorización neurológica', 39, 17),
	(252, 'fisio', 'Electroencefalograma en pacientes críticos', 39, 17),
	(253, 'img', 'TAC de cráneo urgente', 39, 19),
	(254, 'img', 'RM cerebral urgente', 39, 20),
	(255, 'lab', 'Evaluación laboratorio neurocrítico', 39, 4),
	(256, 'fisio', 'Monitoreo de presión intracraneal', 39, 15),
	(257, 'fisio', 'Gasometría arterial', 39, 23),
	(258, 'eval', 'Evaluación neurológica completa', 39, 6),
	(259, 'img', 'Ultrasonido transcraneal', 39, 21),
	(260, 'img', 'Ecografía Doppler cerebral', 39, 21),
	(261, 'eval', 'Evaluación clínica paliativa', 40, 6),
	(262, 'fisio', 'Monitoreo de signos vitales', 40, 15),
	(263, 'lab', 'Laboratorio básico', 40, 4),
	(264, 'lab', 'Pruebas de función renal y hepática', 40, 4),
	(265, 'fisio', 'Electrocardiograma', 40, 5),
	(266, 'eval', 'Evaluación del dolor', 40, 6),
	(267, 'img', 'Exámenes de imagen según necesidad', 40, 18),
	(268, 'lab', 'Evaluación nutricional', 40, 4),
	(269, 'lab', 'Pruebas de coagulación', 40, 4),
	(270, 'img', 'Ultrasonido general', 40, 21),
	(271, 'img', 'Radiografía lumbosacra', 3, 18);

-- Volcando estructura para tabla hospitalbd.hospital_personal_jorna_laboral
CREATE TABLE IF NOT EXISTS `hospital_personal_jorna_laboral` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dia` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `turno` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_jorna_laboral: ~0 rows (aproximadamente)
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

-- Volcando datos para la tabla hospitalbd.hospital_personal_lugar: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_lugar` (`id`, `nombre`, `tipo`, `piso`, `codigo`, `estado`, `capacidad`, `descripcion`, `es_critico`, `activo`) VALUES
	(1, 'Sala de Urgencias 1', 'hab', 1, 'URG-101', 'disponible', 4, 'Sala de atención inmediata para emergencias médicas.', 1, 1),
	(2, 'Sala de Urgencias 2', 'hab', 1, 'URG-102', 'disponible', 4, 'Sala equipada con camillas y monitores de emergencia.', 1, 1),
	(3, 'Consultorio de Urgencias 1', 'cons', 1, 'CONS-URG-103', 'disponible', 1, 'Consultorio de primera atención de emergencias.', 1, 1),
	(4, 'Quirófano de Trauma 1', 'qui', 2, 'QUI-TRA-201', 'disponible', 1, 'Quirófano para intervenciones urgentes por trauma.', 1, 1),
	(5, 'Quirófano de Trauma 2', 'qui', 2, 'QUI-TRA-202', 'disponible', 1, 'Quirófano preparado para cirugía de urgencia.', 1, 1),
	(6, 'Sala de Reanimación 1', 'hab', 2, 'REA-203', 'disponible', 2, 'Sala para reanimación post-trauma y emergencias quirúrgicas.', 1, 1),
	(7, 'Consultorio de Medicina General 1', 'cons', 1, 'CONS-MG-101', 'disponible', 1, 'Consultorio para consultas generales.', 0, 1),
	(8, 'Consultorio de Medicina General 2', 'cons', 1, 'CONS-MG-102', 'disponible', 1, 'Consultorio destinado a chequeos médicos básicos.', 0, 1),
	(9, 'Consultorio de Medicina General 3', 'cons', 1, 'CONS-MG-103', 'disponible', 1, 'Consultorio de diagnóstico y tratamiento general.', 0, 1),
	(10, 'Consultorio de Pediatría 1', 'cons', 2, 'CONS-PED-201', 'disponible', 1, 'Consultorio especializado en atención pediátrica.', 0, 1),
	(11, 'Consultorio de Pediatría 2', 'cons', 2, 'CONS-PED-202', 'disponible', 1, 'Consultorio para seguimiento del crecimiento y vacunas.', 0, 1),
	(12, 'Sala de Internación Pediátrica 1', 'hab', 2, 'HAB-PED-203', 'disponible', 2, 'Habitación compartida para niños hospitalizados.', 1, 1),
	(13, 'Consultorio de Ginecología 1', 'cons', 2, 'CONS-GIN-201', 'disponible', 1, 'Consultorio de control ginecológico.', 0, 1),
	(14, 'Consultorio de Obstetricia 1', 'cons', 2, 'CONS-OBS-202', 'disponible', 1, 'Consultorio de control prenatal.', 0, 1),
	(15, 'Sala de Partos 1', 'hab', 2, 'SAL-PAR-203', 'disponible', 1, 'Sala destinada a la atención del parto.', 1, 1),
	(16, 'Consultorio de Dermatología 1', 'cons', 3, 'CONS-DER-301', 'disponible', 1, 'Consultorio para diagnóstico de enfermedades cutáneas.', 0, 1),
	(17, 'Consultorio de Dermatología 2', 'cons', 3, 'CONS-DER-302', 'disponible', 1, 'Consultorio para tratamientos dermatológicos.', 0, 1),
	(18, 'Consultorio de Dermatología Estética', 'cons', 3, 'CONS-DER-303', 'disponible', 1, 'Consultorio para tratamientos estéticos de la piel.', 0, 1),
	(19, 'Quirófano de Cirugía General 1', 'qui', 2, 'QUI-CG-201', 'disponible', 1, 'Quirófano para cirugías abdominales y generales.', 1, 1),
	(20, 'Quirófano de Cirugía General 2', 'qui', 2, 'QUI-CG-202', 'disponible', 1, 'Quirófano para operaciones de rutina.', 1, 1),
	(21, 'Sala Preoperatoria Cirugía General', 'hab', 2, 'PRE-CG-203', 'disponible', 2, 'Sala para preparación de pacientes quirúrgicos.', 1, 1),
	(22, 'Quirófano Oncológico 1', 'qui', 2, 'QUI-ONC-204', 'disponible', 1, 'Quirófano para resección de tumores.', 1, 1),
	(23, 'Quirófano Oncológico 2', 'qui', 2, 'QUI-ONC-205', 'disponible', 1, 'Quirófano para cirugía oncológica compleja.', 1, 1),
	(24, 'Sala de Recuperación Oncológica', 'hab', 2, 'REC-ONC-206', 'disponible', 2, 'Sala para postoperatorio oncológico.', 1, 1),
	(25, 'Quirófano Vascular 1', 'qui', 2, 'QUI-VAS-207', 'disponible', 1, 'Quirófano especializado en cirugía de vasos sanguíneos.', 1, 1),
	(26, 'Quirófano Vascular 2', 'qui', 2, 'QUI-VAS-208', 'disponible', 1, 'Quirófano para bypass y reparaciones vasculares.', 1, 1),
	(27, 'Sala de Recuperación Vascular', 'hab', 2, 'REC-VAS-209', 'disponible', 2, 'Sala postoperatoria para pacientes de cirugía vascular.', 1, 1),
	(28, 'Unidad de Cuidados Intensivos 1', 'hab', 3, 'UCI-301', 'disponible', 1, 'Habitación de monitoreo intensivo.', 1, 1),
	(29, 'Unidad de Cuidados Intensivos 2', 'hab', 3, 'UCI-302', 'disponible', 1, 'Habitación con soporte vital avanzado.', 1, 1),
	(30, 'Unidad de Cuidados Intensivos 3', 'hab', 3, 'UCI-303', 'disponible', 1, 'Habitación con monitoreo multiparámetro.', 1, 1),
	(31, 'Sala de Anestesia 1', 'lab', 2, 'ANE-201', 'disponible', 2, 'Sala de preparación anestésica previa a cirugía.', 1, 1),
	(32, 'Sala de Anestesia 2', 'lab', 2, 'ANE-202', 'disponible', 2, 'Sala de recuperación anestésica postoperatoria.', 1, 1),
	(33, 'Consultorio de Manejo del Dolor', 'cons', 2, 'CONS-ANE-203', 'disponible', 1, 'Consultorio para control y manejo del dolor.', 0, 1),
	(34, 'Sala de Rayos X 1', 'lab', 1, 'RX-101', 'disponible', 2, 'Sala de radiología para estudios generales.', 0, 1),
	(35, 'Sala de Rayos X 2', 'lab', 1, 'RX-102', 'disponible', 2, 'Sala de diagnóstico por imagen.', 0, 1),
	(36, 'Sala de Radiología de Emergencias', 'lab', 1, 'RX-103', 'disponible', 2, 'Radiología rápida para pacientes críticos.', 1, 1),
	(37, 'Sala de Radiología Pediátrica 1', 'lab', 2, 'RX-PED-201', 'disponible', 1, 'Sala de rayos X adaptada a niños.', 0, 1),
	(38, 'Sala de Radiología Pediátrica 2', 'lab', 2, 'RX-PED-202', 'disponible', 1, 'Radiología infantil con equipos de baja radiación.', 0, 1),
	(39, 'Sala de Radiología Pediátrica 3', 'lab', 2, 'RX-PED-203', 'disponible', 1, 'Diagnóstico radiológico en pediatría.', 0, 1),
	(40, 'Laboratorio de Patología 1', 'lab', 1, 'LAB-PAT-101', 'disponible', 4, 'Laboratorio de anatomía patológica.', 0, 1),
	(41, 'Laboratorio de Patología 2', 'lab', 1, 'LAB-PAT-102', 'disponible', 4, 'Sala de procesamiento de muestras patológicas.', 0, 1),
	(42, 'Laboratorio de Patología 3', 'lab', 1, 'LAB-PAT-103', 'disponible', 3, 'Laboratorio para análisis histológicos.', 0, 1),
	(43, 'Laboratorio de Microbiología 1', 'lab', 1, 'LAB-MIC-101', 'disponible', 5, 'Laboratorio para análisis de muestras bacteriológicas.', 0, 1),
	(44, 'Laboratorio de Microbiología 2', 'lab', 1, 'LAB-MIC-102', 'disponible', 5, 'Sala para diagnóstico de infecciones.', 0, 1),
	(45, 'Laboratorio de Microbiología 3', 'lab', 1, 'LAB-MIC-103', 'disponible', 4, 'Laboratorio con cabinas de bioseguridad.', 0, 1),
	(46, 'Consultorio de Farmacia Clínica 1', 'cons', 1, 'CONS-FAR-101', 'disponible', 1, 'Consultorio para asesoría farmacéutica.', 0, 1),
	(47, 'Consultorio de Farmacia Clínica 2', 'cons', 1, 'CONS-FAR-102', 'disponible', 1, 'Asesoramiento sobre uso de medicamentos.', 0, 1),
	(48, 'Laboratorio de Farmacia Clínica', 'lab', 1, 'LAB-FAR-103', 'disponible', 3, 'Laboratorio de control de medicamentos hospitalarios.', 0, 1),
	(49, 'Consultorio de Oncología Médica 1', 'cons', 2, 'CONS-ONC-201', 'disponible', 1, 'Consultorio para control de pacientes con cáncer.', 0, 1),
	(50, 'Consultorio de Oncología Médica 2', 'cons', 2, 'CONS-ONC-202', 'disponible', 1, 'Atención y seguimiento de tratamientos oncológicos.', 0, 1),
	(51, 'Sala de Quimioterapia 1', 'hab', 2, 'QUI-ONC-203', 'disponible', 5, 'Sala de administración de quimioterapia.', 1, 1),
	(52, 'Consultorio de Oncología Ginecológica 1', 'cons', 2, 'CONS-ONG-201', 'disponible', 1, 'Consultorio para control de cáncer ginecológico.', 0, 1),
	(53, 'Consultorio de Oncología Ginecológica 2', 'cons', 2, 'CONS-ONG-202', 'disponible', 1, 'Consultorio de diagnóstico oncológico femenino.', 0, 1),
	(54, 'Sala de Tratamientos Oncológicos Ginecológicos', 'hab', 2, 'SAL-ONG-203', 'disponible', 2, 'Sala para procedimientos oncológicos ginecológicos.', 1, 1),
	(55, 'Unidad Neonatal 1', 'hab', 3, 'NEO-301', 'disponible', 2, 'Unidad para recién nacidos prematuros.', 1, 1),
	(56, 'Unidad Neonatal 2', 'hab', 3, 'NEO-302', 'disponible', 2, 'Habitación equipada con incubadoras.', 1, 1),
	(57, 'Unidad Neonatal 3', 'hab', 3, 'NEO-303', 'disponible', 2, 'Sala de cuidados intensivos neonatales.', 1, 1),
	(58, 'Consultorio de Pediatría General 1', 'cons', 2, 'CONS-PEDG-201', 'disponible', 1, 'Consultorio de atención pediátrica ambulatoria.', 0, 1),
	(59, 'Consultorio de Pediatría General 2', 'cons', 2, 'CONS-PEDG-202', 'disponible', 1, 'Atención general para niños y adolescentes.', 0, 1),
	(60, 'Sala de Internación Pediátrica General', 'hab', 2, 'HAB-PEDG-203', 'disponible', 3, 'Habitación compartida para pacientes pediátricos.', 1, 1),
	(61, 'Consultorio de Cardiología 1', 'cons', 3, 'CONS-CAR-301', 'disponible', 1, 'Consultorio especializado en enfermedades cardíacas.', 0, 1),
	(62, 'Consultorio de Cardiología 2', 'cons', 3, 'CONS-CAR-302', 'disponible', 1, 'Control y seguimiento de pacientes cardíacos.', 0, 1),
	(63, 'Sala de Electrocardiogramas', 'lab', 3, 'LAB-CAR-303', 'disponible', 2, 'Sala equipada para estudios de electrocardiograma.', 0, 1),
	(64, 'Consultorio de Neumología 1', 'cons', 3, 'CONS-NEU-301', 'disponible', 1, 'Consultorio para diagnóstico de enfermedades respiratorias.', 0, 1),
	(65, 'Consultorio de Neumología 2', 'cons', 3, 'CONS-NEU-302', 'disponible', 1, 'Atención de pacientes con enfermedades pulmonares.', 0, 1),
	(66, 'Laboratorio de Función Pulmonar', 'lab', 3, 'LAB-NEU-303', 'disponible', 2, 'Sala equipada para espirometrías y estudios respiratorios.', 0, 1),
	(67, 'Consultorio de Nefrología 1', 'cons', 3, 'CONS-NEF-301', 'disponible', 1, 'Consultorio para enfermedades renales.', 0, 1),
	(68, 'Consultorio de Nefrología 2', 'cons', 3, 'CONS-NEF-302', 'disponible', 1, 'Atención de pacientes con insuficiencia renal.', 0, 1),
	(69, 'Sala de Hemodiálisis 1', 'lab', 3, 'LAB-NEF-303', 'disponible', 4, 'Sala equipada con máquinas de hemodiálisis.', 1, 1),
	(70, 'Consultorio de Gastroenterología 1', 'cons', 3, 'CONS-GAS-301', 'disponible', 1, 'Consultorio para enfermedades digestivas.', 0, 1),
	(71, 'Consultorio de Gastroenterología 2', 'cons', 3, 'CONS-GAS-302', 'disponible', 1, 'Atención de pacientes con patologías gastrointestinales.', 0, 1),
	(72, 'Sala de Endoscopia 1', 'lab', 3, 'LAB-GAS-303', 'disponible', 2, 'Sala equipada para endoscopias digestivas.', 1, 1),
	(73, 'Consultorio de Dermatología 1', 'cons', 2, 'CONS-DER-201', 'disponible', 1, 'Consultorio de diagnóstico de enfermedades de la piel.', 0, 1),
	(74, 'Consultorio de Dermatología 2', 'cons', 2, 'CONS-DER-202', 'disponible', 1, 'Atención de tratamientos dermatológicos.', 0, 1),
	(75, 'Sala de Fototerapia', 'lab', 2, 'LAB-DER-203', 'disponible', 2, 'Sala equipada con lámparas UV para tratamientos.', 0, 1),
	(76, 'Consultorio de Reumatología 1', 'cons', 2, 'CONS-REU-201', 'disponible', 1, 'Consultorio para enfermedades autoinmunes.', 0, 1),
	(77, 'Consultorio de Reumatología 2', 'cons', 2, 'CONS-REU-202', 'disponible', 1, 'Atención de pacientes con artritis y lupus.', 0, 1),
	(78, 'Sala de Infusión Reumatológica', 'hab', 2, 'HAB-REU-203', 'disponible', 3, 'Sala para administración de terapias intravenosas.', 0, 1),
	(79, 'Consultorio de Endocrinología 1', 'cons', 2, 'CONS-END-201', 'disponible', 1, 'Consultorio para enfermedades hormonales.', 0, 1),
	(80, 'Consultorio de Endocrinología 2', 'cons', 2, 'CONS-END-202', 'disponible', 1, 'Control de pacientes con diabetes y tiroides.', 0, 1),
	(81, 'Sala de Educación Diabética', 'hab', 2, 'HAB-END-203', 'disponible', 5, 'Sala destinada a la enseñanza del autocontrol de la diabetes.', 0, 1),
	(82, 'Consultorio de Neurología 1', 'cons', 3, 'CONS-NRL-301', 'disponible', 1, 'Consultorio para enfermedades neurológicas.', 0, 1),
	(83, 'Consultorio de Neurología 2', 'cons', 3, 'CONS-NRL-302', 'disponible', 1, 'Atención de pacientes con epilepsia y migraña.', 0, 1),
	(84, 'Sala de Electroencefalogramas', 'lab', 3, 'LAB-NRL-303', 'disponible', 2, 'Sala para estudios de actividad cerebral.', 0, 1),
	(85, 'Consultorio de Psiquiatría 1', 'cons', 2, 'CONS-PSQ-201', 'disponible', 1, 'Consultorio de evaluación psiquiátrica.', 0, 1),
	(86, 'Consultorio de Psiquiatría 2', 'cons', 2, 'CONS-PSQ-202', 'disponible', 1, 'Seguimiento de pacientes con trastornos mentales.', 0, 1),
	(87, 'Sala de Terapias Grupales', 'hab', 2, 'HAB-PSQ-203', 'disponible', 8, 'Sala acondicionada para terapias grupales.', 0, 1),
	(88, 'Quirófano de Cirugía General 1', 'qui', 4, 'QUI-CG-401', 'disponible', 1, 'Quirófano para procedimientos generales.', 1, 1),
	(89, 'Quirófano de Cirugía General 2', 'qui', 4, 'QUI-CG-402', 'disponible', 1, 'Quirófano equipado para cirugías abdominales.', 1, 1),
	(90, 'Sala de Recuperación Cirugía General', 'hab', 4, 'REC-CG-403', 'disponible', 4, 'Sala postoperatoria de pacientes de cirugía general.', 1, 1),
	(91, 'Quirófano de Oncología 1', 'qui', 4, 'QUI-ONC-401', 'disponible', 1, 'Quirófano especializado en procedimientos oncológicos.', 1, 1),
	(92, 'Quirófano de Oncología 2', 'qui', 4, 'QUI-ONC-402', 'disponible', 1, 'Preparado para cirugía de tumores complejos.', 1, 1),
	(93, 'Sala de Recuperación Oncológica', 'hab', 4, 'REC-ONC-403', 'disponible', 3, 'Sala postoperatoria para pacientes oncológicos.', 1, 1),
	(94, 'Quirófano de Cirugía Vascular 1', 'qui', 4, 'QUI-CV-401', 'disponible', 1, 'Quirófano para procedimientos en vasos sanguíneos.', 1, 1),
	(95, 'Quirófano de Cirugía Vascular 2', 'qui', 4, 'QUI-CV-402', 'disponible', 1, 'Preparado para bypass y aneurismas.', 1, 1),
	(96, 'Sala de Recuperación Vascular', 'hab', 4, 'REC-CV-403', 'disponible', 2, 'Área de recuperación postquirúrgica vascular.', 1, 1),
	(97, 'Quirófano de Cirugía Torácica 1', 'qui', 4, 'QUI-CT-401', 'disponible', 1, 'Quirófano para operaciones de tórax y pulmones.', 1, 1),
	(98, 'Quirófano de Cirugía Torácica 2', 'qui', 4, 'QUI-CT-402', 'disponible', 1, 'Preparado para cirugía de pleura y pulmones.', 1, 1),
	(99, 'Sala de Cuidados Post-Torácicos', 'hab', 4, 'REC-CT-403', 'disponible', 3, 'Sala de recuperación para cirugía torácica.', 1, 1),
	(100, 'Quirófano de Cirugía Plástica 1', 'qui', 3, 'QUI-CP-301', 'disponible', 1, 'Quirófano para cirugía reconstructiva y estética.', 1, 1),
	(101, 'Quirófano de Cirugía Plástica 2', 'qui', 3, 'QUI-CP-302', 'disponible', 1, 'Preparado para cirugías faciales y corporales.', 1, 1),
	(102, 'Sala de Recuperación Estética', 'hab', 3, 'REC-CP-303', 'disponible', 4, 'Área de cuidados postoperatorios en cirugía estética.', 0, 1),
	(103, 'Quirófano de Ortopedia 1', 'qui', 3, 'QUI-ORT-301', 'disponible', 1, 'Quirófano para cirugía traumatológica y ortopédica.', 1, 1),
	(104, 'Quirófano de Ortopedia 2', 'qui', 3, 'QUI-ORT-302', 'disponible', 1, 'Preparado para implantes y prótesis.', 1, 1),
	(105, 'Sala de Rehabilitación Ortopédica', 'hab', 2, 'HAB-ORT-201', 'disponible', 6, 'Sala para recuperación de pacientes traumatológicos.', 0, 1),
	(106, 'Sala de Anestesia 1', 'lab', 4, 'LAB-ANE-401', 'disponible', 2, 'Preparación anestésica para cirugías.', 1, 1),
	(107, 'Sala de Anestesia 2', 'lab', 4, 'LAB-ANE-402', 'disponible', 2, 'Área para control de anestesia intraoperatoria.', 1, 1),
	(108, 'Unidad de Recuperación Anestésica', 'hab', 4, 'REC-ANE-403', 'disponible', 4, 'Monitoreo postanestesia inmediato.', 1, 1),
	(109, 'Unidad de Cuidados Intensivos 1', 'hab', 5, 'UCI-MC-501', 'disponible', 6, 'Área crítica para pacientes graves.', 1, 1),
	(110, 'Unidad de Cuidados Intensivos 2', 'hab', 5, 'UCI-MC-502', 'disponible', 6, 'Soporte vital avanzado.', 1, 1),
	(111, 'Unidad de Cuidados Intensivos 3', 'hab', 5, 'UCI-MC-503', 'disponible', 6, 'Atención 24h para pacientes críticos.', 1, 1),
	(112, 'Unidad de Cuidados Neurocríticos 1', 'hab', 5, 'UCN-NCR-501', 'disponible', 4, 'Manejo de pacientes con patologías neurológicas críticas.', 1, 1),
	(113, 'Unidad de Cuidados Neurocríticos 2', 'hab', 5, 'UCN-NCR-502', 'disponible', 4, 'Atención a traumatismos craneoencefálicos.', 1, 1),
	(114, 'Sala de Monitoreo Neurológico', 'lab', 5, 'LAB-NCR-503', 'disponible', 2, 'Monitoreo avanzado de la actividad cerebral.', 1, 1),
	(115, 'Sala de Radiología 1', 'lab', 1, 'LAB-RAD-101', 'disponible', 2, 'Diagnóstico por rayos X y TAC.', 0, 1),
	(116, 'Sala de Radiología 2', 'lab', 1, 'LAB-RAD-102', 'disponible', 2, 'Exámenes de radiografía y fluoroscopía.', 0, 1),
	(117, 'Sala de Resonancia Magnética', 'lab', 1, 'LAB-RAD-103', 'disponible', 1, 'Equipo de RMN de alto campo.', 0, 1),
	(118, 'Consultorio de Cuidados Paliativos 1', 'cons', 2, 'CONS-CPAL-201', 'disponible', 1, 'Atención integral a pacientes terminales.', 0, 1),
	(119, 'Consultorio de Cuidados Paliativos 2', 'cons', 2, 'CONS-CPAL-202', 'disponible', 1, 'Apoyo clínico y psicológico.', 0, 1),
	(120, 'Sala de Cuidados Paliativos', 'hab', 2, 'HAB-CPAL-203', 'disponible', 3, 'Área para internación de pacientes en cuidados paliativos.', 0, 1),
	(121, 'Sala de Rayos X de Emergencia 1', 'lab', 1, 'LAB-RX-101', 'disponible', 1, 'Radiología rápida para emergencias.', 1, 1),
	(122, 'Sala de Rayos X de Emergencia 2', 'lab', 1, 'LAB-RX-102', 'disponible', 1, 'Radiografía de tórax y huesos en urgencias.', 1, 1),
	(123, 'Sala de Ecografía de Emergencia', 'lab', 1, 'LAB-ECO-103', 'disponible', 1, 'Ultrasonido rápido en emergencias.', 1, 1),
	(124, 'Sala TAC de Emergencia', 'lab', 1, 'LAB-TAC-104', 'disponible', 1, 'Tomógrafo para diagnóstico rápido en trauma.', 1, 1),
	(125, 'Laboratorio Clínico Central', 'lab', 2, 'LAB-CLI-201', 'disponible', 10, 'Análisis de sangre, orina y bioquímica.', 0, 1),
	(126, 'Laboratorio Clínico Secundario', 'lab', 2, 'LAB-CLI-202', 'disponible', 6, 'Soporte para análisis de guardia.', 0, 1),
	(127, 'Sala de Electrocardiogramas', 'lab', 2, 'LAB-ECG-203', 'disponible', 2, 'Equipos para estudios de ritmo cardíaco.', 0, 1),
	(128, 'Sala de Espirometría', 'lab', 2, 'LAB-PUL-204', 'disponible', 2, 'Evaluación de la función respiratoria.', 0, 1),
	(129, 'Sala de Endoscopia 1', 'lab', 2, 'LAB-END-205', 'disponible', 2, 'Examen de tubo digestivo superior e inferior.', 1, 1),
	(130, 'Sala de Audiometría', 'lab', 2, 'LAB-AUD-206', 'disponible', 1, 'Cabina insonorizada para exámenes auditivos.', 0, 1),
	(131, 'Sala de Exámenes Visuales', 'cons', 2, 'CONS-OFT-207', 'disponible', 1, 'Pruebas de visión y salud ocular.', 0, 1),
	(132, 'Sala de Pruebas de Alergia', 'cons', 2, 'CONS-ALR-208', 'disponible', 2, 'Pruebas cutáneas y diagnósticos alérgicos.', 0, 1),
	(133, 'Radiología Quirúrgica 1', 'lab', 3, 'LAB-RQ-301', 'disponible', 1, 'Imagenología en quirófano.', 1, 1),
	(134, 'Sala TAC Central', 'lab', 1, 'LAB-TAC-105', 'disponible', 1, 'Tomógrafo multicorte de alta resolución.', 1, 1),
	(135, 'Sala de Resonancia Magnética 1', 'lab', 1, 'LAB-RM-106', 'disponible', 1, 'Resonancia para neurología y ortopedia.', 1, 1),
	(136, 'Sala de Resonancia Magnética 2', 'lab', 1, 'LAB-RM-107', 'disponible', 1, 'Resonancia de cuerpo completo.', 1, 1),
	(137, 'Unidad de Monitoreo Cardíaco', 'hab', 3, 'HAB-MON-301', 'disponible', 4, 'Monitoreo continuo de pacientes críticos.', 1, 1),
	(138, 'Sala de Oxigenoterapia', 'hab', 2, 'HAB-OXI-201', 'disponible', 3, 'Aplicación terapéutica de oxígeno.', 1, 1),
	(139, 'Sala EEG 1', 'lab', 3, 'LAB-EEG-302', 'disponible', 1, 'Estudios de actividad eléctrica cerebral.', 0, 1),
	(140, 'Sala de Mamografía', 'lab', 1, 'LAB-MAM-108', 'disponible', 1, 'Diagnóstico de cáncer de mama.', 0, 1),
	(141, 'Sala de Extracciones de Sangre', 'lab', 2, 'LAB-SANG-209', 'disponible', 5, 'Extracción y procesamiento de muestras.', 0, 1),
	(142, 'Sala de Análisis de Orina', 'lab', 2, 'LAB-ORI-210', 'disponible', 2, 'Procesamiento de muestras de orina.', 0, 1),
	(143, 'Laboratorio de Biología Molecular', 'lab', 2, 'LAB-BIO-211', 'disponible', 3, 'PCR, genética y virología.', 1, 1),
	(144, 'Sala de Asesoría Farmacéutica', 'cons', 2, 'CONS-FAR-212', 'disponible', 1, 'Atención de pacientes sobre medicamentos.', 0, 1),
	(145, 'Sala de Biopsias', 'lab', 3, 'LAB-BIOP-304', 'disponible', 1, 'Obtención de muestras para análisis oncológico.', 1, 1),
	(146, 'Sala de Radioterapia 1', 'lab', 3, 'LAB-RADT-305', 'disponible', 1, 'Tratamiento con radiación contra tumores.', 1, 1),
	(147, 'Sala de Radioterapia 2', 'lab', 3, 'LAB-RADT-306', 'disponible', 1, 'Unidad de acelerador lineal.', 1, 1),
	(148, 'Sala de Exámenes Neonatales', 'lab', 2, 'LAB-NEO-213', 'disponible', 2, 'Pruebas metabólicas y cardíacas en neonatos.', 0, 1),
	(149, 'Sala de Ecografía Pediátrica', 'lab', 2, 'LAB-ECO-214', 'disponible', 1, 'Ecografía adaptada para niños.', 0, 1),
	(150, 'Sala de Ecografía Ginecológica', 'lab', 2, 'LAB-ECO-215', 'disponible', 1, 'Ecografía transvaginal y obstétrica.', 0, 1),
	(151, 'Sala de Pruebas de Fertilidad', 'lab', 2, 'LAB-FER-216', 'disponible', 1, 'Estudios de fertilidad masculina y femenina.', 0, 1),
	(152, 'Sala de Dermatoscopia', 'cons', 2, 'CONS-DER-217', 'disponible', 1, 'Estudio detallado de lesiones cutáneas.', 0, 1),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_medicaciones: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_ordenestudio: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_plantillaestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_plantillaestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `estructura` json NOT NULL,
  `estudio_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `estudio_id` (`estudio_id`),
  CONSTRAINT `hospital_personal_pl_estudio_id_f14531a1_fk_hospital_` FOREIGN KEY (`estudio_id`) REFERENCES `hospital_personal_estudiosdiagnosticos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_plantillaestudio: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_plantillaestudio` (`id`, `estructura`, `estudio_id`) VALUES
	(1, '{"Perfil lipídico": {"Colesterol HDL": {"valor": "", "unidad": "mg/dL", "referencia": "Hombres: > 40 mg/dL, Mujeres: > 50 mg/dL"}, "Colesterol LDL": {"valor": "", "unidad": "mg/dL", "referencia": "< 100 mg/dL"}, "Triglicéridos": {"valor": "", "unidad": "mg/dL", "referencia": "< 150 mg/dL"}, "Colesterol total": {"valor": "", "unidad": "mg/dL", "referencia": "< 200 mg/dL"}}}', 43),
	(2, '{"Prueba de TSH": {"TSH": {"valor": "", "unidad": "µIU/mL", "referencia": "0.4 – 4.0 µIU/mL"}}}', 102),
	(3, '{"Prueba de T4 libre": {"T4 libre": {"valor": "", "unidad": "ng/dL", "referencia": "0.8 – 1.8 ng/dL"}}}', 103),
	(4, '{"Electrocardiograma en reposo": {"Onda P": {"valor": "", "unidad": "descriptivo", "referencia": "Presente y normal", "interpretacion": ""}, "Onda Q": {"valor": "", "unidad": "descriptivo", "referencia": "Pequeña o ausente", "interpretacion": ""}, "Onda T": {"valor": "", "unidad": "descriptivo", "referencia": "Positiva en derivaciones normales", "interpretacion": ""}, "Bloqueos": {"valor": "", "unidad": "descriptivo", "referencia": "No presentes", "interpretacion": ""}, "Segmento ST": {"valor": "", "unidad": "descriptivo", "referencia": "Isoeléctrico", "interpretacion": ""}, "Intervalo PR": {"valor": "", "unidad": "segundos", "referencia": "0.12 - 0.20", "interpretacion": ""}, "Extrasístoles": {"valor": "", "unidad": "descriptivo", "referencia": "Ausentes", "interpretacion": ""}, "Ritmo cardíaco": {"valor": "", "unidad": "descriptivo", "referencia": "Ritmo sinusal regular", "interpretacion": ""}, "Diagnóstico ECG": {"valor": "", "unidad": "descriptivo", "referencia": "Normal o con hallazgos", "interpretacion": ""}, "Frecuencia cardíaca": {"valor": "", "unidad": "latidos/minuto", "referencia": "60 - 100", "interpretacion": ""}, "Duración del complejo QRS": {"valor": "", "unidad": "segundos", "referencia": "< 0.12", "interpretacion": ""}, "Eje eléctrico del corazón": {"valor": "", "unidad": "grados", "referencia": "-30° a +90°", "interpretacion": ""}, "Intervalo QT corregido (QTc)": {"valor": "", "unidad": "segundos", "referencia": "< 0.44", "interpretacion": ""}}}', 81);

-- Volcando estructura para tabla hospitalbd.hospital_personal_resultadoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_resultadoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `informe` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `datos_especificos` json DEFAULT NULL,
  `archivo_pdf` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `turno_estudio_id` bigint NOT NULL,
  `cargado_por_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turno_estudio_id` (`turno_estudio_id`),
  KEY `hospital_personal_re_cargado_por_id_0942bff7_fk_controlUs` (`cargado_por_id`),
  CONSTRAINT `hospital_personal_re_cargado_por_id_0942bff7_fk_controlUs` FOREIGN KEY (`cargado_por_id`) REFERENCES `controlusuario_usuario` (`id`),
  CONSTRAINT `hospital_personal_re_turno_estudio_id_7530c068_fk_hospital_` FOREIGN KEY (`turno_estudio_id`) REFERENCES `hospital_personal_turnoestudio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_resultadoestudio: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_resultadoestudio_imagenes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_resultadoimagen
CREATE TABLE IF NOT EXISTS `hospital_personal_resultadoimagen` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imagen` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_carga` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_resultadoimagen: ~0 rows (aproximadamente)

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

-- Volcando datos para la tabla hospitalbd.hospital_personal_serviciodiagnostico: ~0 rows (aproximadamente)
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

-- Volcando datos para la tabla hospitalbd.hospital_personal_serviciodiagnostico_lugar: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_serviciodiagnostico_lugar` (`id`, `serviciodiagnostico_id`, `lugar_id`) VALUES
	(1, 1, 36),
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
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_turno` date NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turno: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_turnoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_turnoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_turno` date NOT NULL,
  `horario_turno` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `asistio` tinyint(1) NOT NULL,
  `lugar_id` bigint NOT NULL,
  `orden_id` bigint NOT NULL,
  `servicio_diagnostico_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orden_id` (`orden_id`),
  KEY `hospital_personal_tu_lugar_id_971898ab_fk_hospital_` (`lugar_id`),
  KEY `hospital_personal_tu_servicio_diagnostico_a0645368_fk_hospital_` (`servicio_diagnostico_id`),
  CONSTRAINT `hospital_personal_tu_lugar_id_971898ab_fk_hospital_` FOREIGN KEY (`lugar_id`) REFERENCES `hospital_personal_lugar` (`id`),
  CONSTRAINT `hospital_personal_tu_orden_id_dca8a0c5_fk_hospital_` FOREIGN KEY (`orden_id`) REFERENCES `hospital_personal_ordenestudio` (`id`),
  CONSTRAINT `hospital_personal_tu_servicio_diagnostico_a0645368_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turnoestudio: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxdepartamentoxjornadaxlugar: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_usuarioxespecialidadxservicioxrolesprofesi3bec
CREATE TABLE IF NOT EXISTS `hospital_personal_usuarioxespecialidadxservicioxrolesprofesi3bec` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `especialidad_id` bigint NOT NULL,
  `rol_profesional_id` bigint NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxespecialidadxservicioxrolesprofesi3bec: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
