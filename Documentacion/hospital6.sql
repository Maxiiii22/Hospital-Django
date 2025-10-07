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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=UTF8MB4_GENERAL_CI;

INSERT INTO `hospital_personal_serviciodiagnostico_lugar` (`serviciodiagnostico_id`, `lugar_id`) VALUES
(1, 121), (1, 122),          -- Rayos X de Emergencia
(2, 123),                    -- Ecografía de Emergencia
(3, 124),                    -- TAC de Emergencia
-- Laboratorio y pruebas generales
(4, 125), (4, 126),          -- Pruebas de Laboratorio Clínico
(5, 127),                    -- Electrocardiograma
(6, 150),                    -- Ecografía General (uso de sala ginecológica general)
(7, 128), (7, 66),           -- Función Pulmonar (Espirometría + Lab respiratorio)
(8, 129), (8, 72),           -- Endoscopia Digestiva
(9, 130),                    -- Audiometría
(10, 131),                   -- Examen Visual
(11, 132),                  -- Pruebas de Alergia
-- Quirúrgico
(12, 133),                   -- Radiología Quirúrgica
(13, 134),                   -- TAC Quirúrgico
(14, 135), (14, 136),        -- Resonancia Magnética
-- Cuidados críticos
(15, 137),                   -- Monitoreo Cardíaco
(16, 138),                   -- Oxigenoterapia
(17, 139), (17, 84),        -- EEG
-- Diagnóstico por imagen general
(18, 34), (18, 35), (18, 36), (18, 115), (18, 116),   -- Radiología General
(19, 134), (19, 124),         -- Tomografía
(20, 135), (20, 136), (20, 117),  -- Resonancia
(21, 149), (21, 150),         -- Ecografía General
(22, 140),                    -- Mamografía
-- Laboratorio avanzado
(23, 141),                   -- Análisis de Sangre
(24, 142),                   -- Orina
(25, 143),                   -- Biología Molecular
-- Asesoría
(26, 144),                   -- Farmacéutica
-- Oncología
(27, 145),                   -- Biopsias
(28, 146), (28, 147),        -- Radioterapia
-- Pediatría y neonatal
(29, 148),                   -- Exámenes Neonatales
(30, 149),                   -- Ecografía Pediátrica
-- Ginecología
(31, 150),                   -- Ecografía Ginecológica
(32, 151),                   -- Fertilidad
-- Dermatología
(33, 152),                   -- Dermatoscopia
(34, 153);                   -- Alergia Dermatológica

SELECT VERSION();

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
	(96, 'Can view usuario x departamento x jornada x lugar', 24, 'view_usuarioxdepartamentoxjornadaxlugar');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_persona: ~0 rows (aproximadamente)
INSERT INTO `controlusuario_persona` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `login_id`, `fecha_nacimiento`, `sexo`, `telefono`) VALUES
	(1, 'pbkdf2_sha256$870000$HXO7rp3EMdhsOoTl736PAa$By7RKIZKhHZ0ccY2fXct+pf0kV2EV0al05EN6odowXQ=', '2025-09-03 18:24:35.768023', 1, 'Jose', 'Perez', '', 1, 1, '2025-09-03 01:29:08.880908', '', '1000', NULL, '', NULL);

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

-- Volcando datos para la tabla hospitalbd.controlusuario_roles: ~0 rows (aproximadamente)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuario: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_admin_log: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_content_type: ~24 rows (aproximadamente)
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
	(11, 'hospital_personal', 'consultas'),
	(12, 'hospital_personal', 'departamento'),
	(15, 'hospital_personal', 'especialidades'),
	(16, 'hospital_personal', 'estudiosdiagnosticos'),
	(13, 'hospital_personal', 'jorna_laboral'),
	(14, 'hospital_personal', 'lugar'),
	(17, 'hospital_personal', 'medicaciones'),
	(18, 'hospital_personal', 'ordenestudio'),
	(22, 'hospital_personal', 'resultadoestudio'),
	(19, 'hospital_personal', 'serviciodiagnostico'),
	(20, 'hospital_personal', 'turno'),
	(21, 'hospital_personal', 'turnoestudio'),
	(24, 'hospital_personal', 'usuarioxdepartamentoxjornadaxlugar'),
	(23, 'hospital_personal', 'usuarioxespecialidadxservicio'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla hospitalbd.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_migrations: ~21 rows (aproximadamente)
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
	(22, 'hospital_personal', '0002_remove_serviciodiagnostico_lugar_and_more', '2025-09-03 18:48:14.420205');

-- Volcando estructura para tabla hospitalbd.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_session: ~0 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('e2pggaeldszk3h4km76nanob1niuikxn', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1uts9r:UX_UW9ZiLrmhsoXHgkrbhEglXnM8EXQx2qybHMYipvs', '2025-09-17 18:24:35.799085'),
	('yx9suqrxoyr40bsxuc0v9o86auou4re4', '.eJxVjDsOwjAQBe_iGlnxB-ylpM8ZrPXuBgeQI8VJhbg7iZQC2jcz760SrktJa5M5jayuyqjT75aRnlJ3wA-s90nTVJd5zHpX9EGb7ieW1-1w_w4KtrLVnbVEyALSuQjeQkACFyjmwYsAGEMYJYgJGaLlOHhwnJ0Jm3dxZ6s-X-3rN-0:1utcNf:4uoI6NgdHiDQw5TOfA8pccjiHn__rB5Sw_gOFBOjQUQ', '2025-09-17 01:33:47.853305');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_paciente: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
	(11, 'Dermatología', 'Enfermedades de la piel.', 'Especializado en el diagnóstico y tratamiento de enfermedades de la piel, cabello y uñas, tales como acné, psoriasis, dermatitis, cáncer de piel, y trastornos estéticos.');

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

-- Volcando datos para la tabla hospitalbd.hospital_personal_especialidades: ~0 rows (aproximadamente)
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
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` (`servicio_diagnostico_id`),
  KEY `hospital_personal_es_especialidad_id_2069348a_fk_hospital_` (`especialidad_id`),
  CONSTRAINT `hospital_personal_es_especialidad_id_2069348a_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_estudiosdiagnosticos: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_lugar: ~0 rows (aproximadamente)
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
	(153, 'Sala de Pruebas de Alergia Dermatológica', 'cons', 2, 'CONS-DER-218', 'disponible', 1, 'Diagnóstico de dermatitis y eccemas.', 0, 1);

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

-- Volcando estructura para tabla hospitalbd.hospital_personal_resultadoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_resultadoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `informe` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `archivo_pdf` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `turno_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `turno_id` (`turno_id`),
  CONSTRAINT `hospital_personal_re_turno_id_039f6e9d_fk_hospital_` FOREIGN KEY (`turno_id`) REFERENCES `hospital_personal_turnoestudio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_resultadoestudio: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_serviciodiagnostico
CREATE TABLE IF NOT EXISTS `hospital_personal_serviciodiagnostico` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `departamento_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_se_departamento_id_aee03b02_fk_hospital_` (`departamento_id`),
  CONSTRAINT `hospital_personal_se_departamento_id_aee03b02_fk_hospital_` FOREIGN KEY (`departamento_id`) REFERENCES `hospital_personal_departamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_serviciodiagnostico: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_serviciodiagnostico_lugar: ~0 rows (aproximadamente)

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turno: ~0 rows (aproximadamente)

-- Volcando estructura para tabla hospitalbd.hospital_personal_turnoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_turnoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_creacion` datetime(6) NOT NULL,
  `fecha_turno` date DEFAULT NULL,
  `horario_turno` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `orden_id` bigint NOT NULL,
  `servicio_diagnostico_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servicio_diagnostico_id` (`servicio_diagnostico_id`),
  KEY `hospital_personal_tu_orden_id_dca8a0c5_fk_hospital_` (`orden_id`),
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

-- Volcando estructura para tabla hospitalbd.hospital_personal_usuarioxespecialidadxservicio
CREATE TABLE IF NOT EXISTS `hospital_personal_usuarioxespecialidadxservicio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_profesion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `especialidad_id` bigint NOT NULL,
  `servicio_diagnostico_id` bigint DEFAULT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_us_especialidad_id_b923e28d_fk_hospital_` (`especialidad_id`),
  KEY `hospital_personal_us_servicio_diagnostico_357862e3_fk_hospital_` (`servicio_diagnostico_id`),
  KEY `hospital_personal_us_usuario_id_2c45e2b0_fk_controlUs` (`usuario_id`),
  CONSTRAINT `hospital_personal_us_especialidad_id_b923e28d_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_us_servicio_diagnostico_357862e3_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`),
  CONSTRAINT `hospital_personal_us_usuario_id_2c45e2b0_fk_controlUs` FOREIGN KEY (`usuario_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxespecialidadxservicio: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
