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

-- Volcando datos para la tabla hospitalbd.auth_permission: ~88 rows (aproximadamente)
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
	(53, 'Can add especialidades', 14, 'add_especialidades'),
	(54, 'Can change especialidades', 14, 'change_especialidades'),
	(55, 'Can delete especialidades', 14, 'delete_especialidades'),
	(56, 'Can view especialidades', 14, 'view_especialidades'),
	(57, 'Can add estudios diagnosticos', 15, 'add_estudiosdiagnosticos'),
	(58, 'Can change estudios diagnosticos', 15, 'change_estudiosdiagnosticos'),
	(59, 'Can delete estudios diagnosticos', 15, 'delete_estudiosdiagnosticos'),
	(60, 'Can view estudios diagnosticos', 15, 'view_estudiosdiagnosticos'),
	(61, 'Can add medicaciones', 16, 'add_medicaciones'),
	(62, 'Can change medicaciones', 16, 'change_medicaciones'),
	(63, 'Can delete medicaciones', 16, 'delete_medicaciones'),
	(64, 'Can view medicaciones', 16, 'view_medicaciones'),
	(65, 'Can add orden estudio', 17, 'add_ordenestudio'),
	(66, 'Can change orden estudio', 17, 'change_ordenestudio'),
	(67, 'Can delete orden estudio', 17, 'delete_ordenestudio'),
	(68, 'Can view orden estudio', 17, 'view_ordenestudio'),
	(69, 'Can add resultado estudio', 18, 'add_resultadoestudio'),
	(70, 'Can change resultado estudio', 18, 'change_resultadoestudio'),
	(71, 'Can delete resultado estudio', 18, 'delete_resultadoestudio'),
	(72, 'Can view resultado estudio', 18, 'view_resultadoestudio'),
	(73, 'Can add turno', 19, 'add_turno'),
	(74, 'Can change turno', 19, 'change_turno'),
	(75, 'Can delete turno', 19, 'delete_turno'),
	(76, 'Can view turno', 19, 'view_turno'),
	(77, 'Can add turno estudio', 20, 'add_turnoestudio'),
	(78, 'Can change turno estudio', 20, 'change_turnoestudio'),
	(79, 'Can delete turno estudio', 20, 'delete_turnoestudio'),
	(80, 'Can view turno estudio', 20, 'view_turnoestudio'),
	(81, 'Can add usuario x especialidad', 21, 'add_usuarioxespecialidad'),
	(82, 'Can change usuario x especialidad', 21, 'change_usuarioxespecialidad'),
	(83, 'Can delete usuario x especialidad', 21, 'delete_usuarioxespecialidad'),
	(84, 'Can view usuario x especialidad', 21, 'view_usuarioxespecialidad'),
	(85, 'Can add usuario x departamento x jornada', 22, 'add_usuarioxdepartamentoxjornada'),
	(86, 'Can change usuario x departamento x jornada', 22, 'change_usuarioxdepartamentoxjornada'),
	(87, 'Can delete usuario x departamento x jornada', 22, 'delete_usuarioxdepartamentoxjornada'),
	(88, 'Can view usuario x departamento x jornada', 22, 'view_usuarioxdepartamentoxjornada');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_persona: ~0 rows (aproximadamente)
INSERT INTO `controlusuario_persona` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `login_id`, `fecha_nacimiento`, `sexo`, `telefono`) VALUES
	(1, 'pbkdf2_sha256$870000$rTJhYjGTNqLJxaxZZ2IDk3$7nTltD/rzFPAL9kEgRgLplvBXwgdpvWU8GRrEBx2eaw=', '2025-08-30 18:23:02.575686', 1, 'Jose', 'Perez', 'jperez@gmail.com', 1, 1, '2025-08-29 22:42:31.000000', '37567897', '1000', '1992-05-10', 'M', '25160870'),
	(2, 'pbkdf2_sha256$870000$MnwVGdc7cQLi0NJ0W7jOao$aDs45KxmN72BhjZ155LX34aqgYxZS7DbsrNFXaMD9GQ=', '2025-08-29 23:26:13.608701', 0, 'Micaela', 'Lopez', 'micaela@gmail.com', 0, 1, '2025-08-29 23:03:06.608820', '37567333', '1005', '1997-04-04', 'F', '65360870'),
	(3, 'pbkdf2_sha256$870000$TdoMAxALrCJ7Azmza8ztNo$Pt7BEK+J02Ecxw4RJVU9OLW5fTsQSr+7+vv2TH626Xs=', '2025-08-30 18:24:37.229053', 0, 'Maximiliano', 'Acuña', 'maxi@gmail.com', 0, 1, '2025-08-29 23:06:20.423121', '45912425', 'maxi@gmail.com', '1995-06-29', 'M', '25154782'),
	(4, '', NULL, 0, 'Lolo', 'Acuña', '', 0, 1, '2025-08-29 23:10:11.342585', '65321457', NULL, '2015-05-05', 'F', NULL),
	(5, 'pbkdf2_sha256$870000$O4eqqvswjDXm2duMIAzFjX$7vBVzaNVcnyVOTLKQUa6djBiLc63RUy9P+cVevHeaus=', '2025-08-30 18:25:03.195675', 0, 'Horacio', 'Gutiérrez', 'horacio@gmail.com', 0, 1, '2025-08-29 23:12:37.713916', '37562422', '1006', '1990-01-01', 'M', '25160321');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuario: ~0 rows (aproximadamente)
INSERT INTO `controlusuario_usuario` (`id`, `numero_matricula`, `debe_cambiar_contraseña`, `persona_id`, `rol_id`) VALUES
	(1, NULL, 0, 1, 1),
	(2, '10010', 1, 2, 2),
	(3, '10015', 1, 5, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_admin_log: ~0 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-08-29 22:44:28.007623', '1', 'Jose Perez (1000) - DNI: 37567897', 2, '[{"changed": {"fields": ["Email address", "Dni", "Fecha nacimiento", "Sexo", "Telefono"]}}]', 7, 1),
	(2, '2025-08-29 22:45:17.397120', '1', 'Usuario: 1 - Jose Perez - Legajo hospitalario: 1000', 1, '[{"added": {}}]', 8, 1),
	(3, '2025-08-29 23:04:06.785356', '1', 'Usuario: Micaela Lopez - N° Legajo: 1005 - Especialidad: Dermatología Estética - N° Matricula: 10010', 1, '[{"added": {}}]', 21, 1),
	(4, '2025-08-29 23:04:34.282216', '1', 'El usuario 2 trabaja los dias lunes en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 22, 1),
	(5, '2025-08-29 23:04:45.850497', '2', 'El usuario 2 trabaja los dias martes en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 22, 1),
	(6, '2025-08-29 23:04:55.979931', '3', 'El usuario 2 trabaja los dias miercoles en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 22, 1),
	(7, '2025-08-29 23:05:07.601250', '4', 'El usuario 2 trabaja los dias jueves en el Departamento: Ginecología y Obstetricia en el horario: dia', 1, '[{"added": {}}]', 22, 1),
	(8, '2025-08-29 23:13:22.959478', '2', 'Usuario: Horacio Gutiérrez - N° Legajo: 1006 - Especialidad: Endocrinología - N° Matricula: 10015', 1, '[{"added": {}}]', 21, 1),
	(9, '2025-08-29 23:13:36.432878', '5', 'El usuario 2 trabaja los dias viernes en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 22, 1),
	(10, '2025-08-29 23:19:00.432007', '6', 'El usuario 3 trabaja los dias lunes en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 22, 1),
	(11, '2025-08-29 23:19:13.647373', '7', 'El usuario 3 trabaja los dias martes en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 22, 1),
	(12, '2025-08-29 23:28:58.877572', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 19, 1),
	(13, '2025-08-30 01:03:09.040686', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 19, 1),
	(14, '2025-08-30 18:30:16.551575', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 19, 1);

-- Volcando estructura para tabla hospitalbd.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_content_type: ~22 rows (aproximadamente)
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
	(14, 'hospital_personal', 'especialidades'),
	(15, 'hospital_personal', 'estudiosdiagnosticos'),
	(13, 'hospital_personal', 'jorna_laboral'),
	(16, 'hospital_personal', 'medicaciones'),
	(17, 'hospital_personal', 'ordenestudio'),
	(18, 'hospital_personal', 'resultadoestudio'),
	(19, 'hospital_personal', 'turno'),
	(20, 'hospital_personal', 'turnoestudio'),
	(22, 'hospital_personal', 'usuarioxdepartamentoxjornada'),
	(21, 'hospital_personal', 'usuarioxespecialidad'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla hospitalbd.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_migrations: ~21 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-08-29 22:40:53.465844'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2025-08-29 22:40:53.789007'),
	(3, 'auth', '0001_initial', '2025-08-29 22:40:54.755517'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2025-08-29 22:40:54.975465'),
	(5, 'auth', '0003_alter_user_email_max_length', '2025-08-29 22:40:54.993444'),
	(6, 'auth', '0004_alter_user_username_opts', '2025-08-29 22:40:55.020402'),
	(7, 'auth', '0005_alter_user_last_login_null', '2025-08-29 22:40:55.049355'),
	(8, 'auth', '0006_require_contenttypes_0002', '2025-08-29 22:40:55.062335'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2025-08-29 22:40:55.089294'),
	(10, 'auth', '0008_alter_user_username_max_length', '2025-08-29 22:40:55.134221'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2025-08-29 22:40:55.163176'),
	(12, 'auth', '0010_alter_group_name_max_length', '2025-08-29 22:40:55.248143'),
	(13, 'auth', '0011_update_proxy_permissions', '2025-08-29 22:40:55.279096'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2025-08-29 22:40:55.302696'),
	(15, 'controlUsuario', '0001_initial', '2025-08-29 22:40:56.824787'),
	(16, 'admin', '0001_initial', '2025-08-29 22:40:57.268667'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2025-08-29 22:40:57.301612'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-29 22:40:57.348553'),
	(19, 'hospital_pacientes', '0001_initial', '2025-08-29 22:40:58.068556'),
	(20, 'hospital_personal', '0001_initial', '2025-08-29 22:41:02.383108'),
	(21, 'sessions', '0001_initial', '2025-08-29 22:41:02.622732');

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
	('ibapnikuiciezo0v0fe63lofxlffkqvz', '.eJxVjMsOwiAQRf-FtSHyGCou3fcbyAwwUjWQlHZl_HfbpAvd3nPOfYuA61LC2vMcpiSuQonT70YYn7nuID2w3puMrS7zRHJX5EG7HFvKr9vh_h0U7GWrjYekLeuBbYxOmewiOgMGFBIRaK8iaCagTNZ74MER2jNfjOa0RUp8vuHzOAE:1us7oG:Ai2aabib2vldBnmsmOYZyXAiL2t1JRMOjqapgvBiQCQ', '2025-09-12 22:43:04.727779'),
	('s4zstc0bmv82ny4s5k3w44lpx03dozl2', '.eJxVjMsOwiAQRf-FtSHyGCou3fcbyAwwUjWQlHZl_HfbpAvd3nPOfYuA61LC2vMcpiSuQonT70YYn7nuID2w3puMrS7zRHJX5EG7HFvKr9vh_h0U7GWrjYekLeuBbYxOmewiOgMGFBIRaK8iaCagTNZ74MER2jNfjOa0RUp8vuHzOAE:1usQEA:Tot7_hEFb-gSa3zsVp7lAXA40mNo1fyCzYEfy2KHw98', '2025-09-13 18:23:02.596650'),
	('v9m240c38nbqpv5ynifn3ndai067bqn2', '.eJxVjMsOwiAQRf-FtSFQYGBcuvcbyPCSqoGktCvjv2uTLnR7zzn3xTxta_XbyIufEzszw06_W6D4yG0H6U7t1nnsbV3mwHeFH3Twa0_5eTncv4NKo35rRAmoM7horYAy6SQkYQEptU4OSJWognFYjHWQtBEaikQ1AUSSWCx7fwC3Njav:1usQG7:VrLd-sh-ah69htx6JmF0NSSMEHGitPGqZ0CrKcL3ddM', '2025-09-13 18:25:03.217045');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_menoracargodepaciente: ~0 rows (aproximadamente)
INSERT INTO `hospital_pacientes_menoracargodepaciente` (`id`, `parentesco`, `adulto_id`, `menor_id`) VALUES
	(1, 'HIJO', 1, 2);

-- Volcando estructura para tabla hospitalbd.hospital_pacientes_paciente
CREATE TABLE IF NOT EXISTS `hospital_pacientes_paciente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `persona_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  CONSTRAINT `hospital_pacientes_p_persona_id_bd0c2004_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_paciente: ~0 rows (aproximadamente)
INSERT INTO `hospital_pacientes_paciente` (`id`, `direccion`, `persona_id`) VALUES
	(1, 'Calle Falsa 123', 3),
	(2, '', 4);

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

-- Volcando datos para la tabla hospitalbd.hospital_personal_consultas: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_consultas` (`id`, `diagnostico`, `tratamiento`, `observaciones`, `fecha`, `turno_id`) VALUES
	(1, 'Síndrome de hipotiroidismo subclínico', 'Iniciar tratamiento con levotiroxina sódica 25 mcg diarios, en ayunas, 30 minutos antes del desayuno.\r\n\r\nRecomendaciones:\r\n• Dieta rica en yodo (pescados, algas, lácteos)\r\n• Ejercicio moderado 3 veces por semana\r\n• Control de peso\r\n\r\nSeguimiento en 6 semanas para reevaluar TSH y ajustar dosis si es necesario.', 'Paciente refiere intolerancia al frío, fatiga matutina, piel seca, caída difusa del cabello. No bocio palpable. Resto del examen físico normal. \r\nPresión arterial 110/70 mmHg, FC 60 lpm, peso 68 kg, IMC 24.\r\n\r\nNo antecedentes familiares de enfermedad tiroidea conocidos.', '2025-08-30 01:10:22.546847', 1),
	(2, '', '', '', '2025-08-30 18:25:47.071377', 1),
	(3, '', '', '', '2025-08-30 18:27:28.999771', 1),
	(4, '', '', '', '2025-08-30 18:27:55.737380', 1),
	(5, '', '', '', '2025-08-30 18:30:46.654666', 1),
	(6, '', '', '', '2025-08-30 18:31:17.726537', 1),
	(7, '', '', '', '2025-08-30 18:37:48.371952', 1);

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
  `tipo_atencion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `departamento_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_departamento_id_c964bc2b_fk_hospital_` (`departamento_id`),
  CONSTRAINT `hospital_personal_es_departamento_id_c964bc2b_fk_hospital_` FOREIGN KEY (`departamento_id`) REFERENCES `hospital_personal_departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_especialidades: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_especialidades` (`id`, `nombre_especialidad`, `descripcion`, `tipo_atencion`, `departamento_id`) VALUES
	(1, 'Medicina de Urgencias', 'Se ocupa del diagnóstico y tratamiento de enfermedades o lesiones que requieren atención médica inmediata.', 'consulta', 1),
	(2, 'Trauma y Cirugía de Urgencias', 'Atiende lesiones graves, como fracturas o heridas profundas, que requieren intervención quirúrgica urgente.', 'consulta', 1),
	(3, 'Medicina Crítica', 'Atención intensiva para pacientes graves o que requieren soporte vital.', 'consulta', 1),
	(4, 'Medicina General', 'Atención primaria para pacientes de todas las edades, con diagnóstico y tratamiento de enfermedades comunes.', 'consulta', 2),
	(5, 'Endocrinología', 'Trata enfermedades relacionadas con el sistema endocrino, como diabetes, trastornos de tiroides y problemas hormonales.', 'consulta', 2),
	(6, 'Oftalmología', 'Diagnóstico y tratamiento de enfermedades y trastornos oculares.', 'consulta', 2),
	(7, 'Otorrinolaringología', 'Enfoque en trastornos de los oídos, nariz y garganta.', 'consulta', 2),
	(8, 'Cirugía General', 'Realización de procedimientos quirúrgicos para tratar diversas condiciones médicas, como apendicitis o hernias.', 'consulta', 3),
	(9, 'Cirugía Plástica y Reconstructiva', 'Procedimientos para restaurar la apariencia física después de accidentes o enfermedades, incluyendo cirugías estéticas.', 'consulta', 3),
	(10, 'Medicina Intensiva', 'Manejo de pacientes en estado crítico que requieren monitoreo constante y tratamiento especializado.', 'consulta', 4),
	(11, 'UCI Cardiovascular', 'Cuidados intensivos para pacientes con insuficiencia cardíaca, infartos o cirugía cardíaca reciente.', 'consulta', 4),
	(12, 'UCI Respiratoria', 'Tratamiento especializado para pacientes con fallos respiratorios graves, como aquellos con insuficiencia respiratoria o neumonía severa.', 'consulta', 4),
	(13, 'Radiología General', 'Uso de rayos X para obtener imágenes del cuerpo y ayudar en el diagnóstico de enfermedades como fracturas o infecciones.', 'servicios_diagnosticos', 5),
	(14, 'Resonancia Magnética (RM)', 'Técnica que utiliza imanes y ondas de radio para obtener imágenes detalladas de los órganos y tejidos internos.', 'servicios_diagnosticos', 5),
	(15, 'Ecografía/Doppler', 'Uso de ondas sonoras para crear imágenes del cuerpo y evaluar la circulación sanguínea, a menudo utilizada en el embarazo.', 'servicios_diagnosticos', 5),
	(16, 'Mamografía', 'Examen de imágenes de la mama para detectar cáncer de mama en etapas tempranas.', 'servicios_diagnosticos', 5),
	(17, 'Bioquímica Clínica', 'Análisis de muestras biológicas, como sangre o orina, para evaluar las funciones metabólicas y diagnosticar enfermedades.', 'servicios_diagnosticos', 6),
	(18, 'Microbiología', 'Análisis de muestras para detectar infecciones bacterianas, virales y fúngicas.', 'servicios_diagnosticos', 6),
	(19, 'Inmunología', 'Estudio del sistema inmunológico y su respuesta a infecciones, alergias y enfermedades autoinmunes.', 'servicios_diagnosticos', 6),
	(20, 'Farmacia Clínica', 'Uso adecuado de medicamentos para tratar enfermedades y mejorar la calidad de vida de los pacientes.', 'consulta', 7),
	(21, 'Farmacia Hospitalaria', 'Gestión de los medicamentos dentro del hospital, asegurando su correcta distribución y administración.', 'servicios_diagnosticos', 7),
	(22, 'Oncología Médica', 'Tratamiento del cáncer utilizando medicamentos como quimioterapia, inmunoterapia y terapias dirigidas.', 'consulta', 8),
	(23, 'Oncología Radioterápica', 'Tratamiento del cáncer mediante radiación, con el fin de destruir células tumorales.', 'consulta', 8),
	(24, 'Cirugía Oncológica', 'Intervención quirúrgica para extirpar tumores cancerosos y tejidos afectados.', 'consulta', 8),
	(25, 'Pediatría General', 'Atención integral para niños y adolescentes, desde la prevención hasta el tratamiento de enfermedades comunes.', 'consulta', 9),
	(26, 'Ginecología General', 'Diagnóstico y tratamiento de afecciones ginecológicas, como infecciones, fibromas y cáncer.', 'consulta', 10),
	(27, 'Obstetricia', 'Atención médica a mujeres durante el embarazo, el parto y el postparto.', 'consulta', 10),
	(28, 'Perinatología', 'Atención médica especializada para embarazos de alto riesgo.', 'consulta', 10),
	(29, 'Dermatología General', 'Tratamiento de afecciones comunes de la piel, como acné, eczema y psoriasis.', 'consulta', 11),
	(30, 'Dermatología Estética', 'Procedimientos cosméticos para mejorar la apariencia de la piel, como láser o Botox.', 'consulta', 11),
	(31, 'Venereología', 'Diagnóstico y tratamiento de enfermedades de transmisión sexual.', 'consulta', 11);

-- Volcando estructura para tabla hospitalbd.hospital_personal_estudiosdiagnosticos
CREATE TABLE IF NOT EXISTS `hospital_personal_estudiosdiagnosticos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_estudio` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `servicio_diagnostico_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` (`servicio_diagnostico_id`),
  CONSTRAINT `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_especialidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_estudiosdiagnosticos: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_estudiosdiagnosticos` (`id`, `nombre_estudio`, `servicio_diagnostico_id`) VALUES
	(1, 'Radiografía de tórax PA', 13),
	(2, 'Radiografía de columna lumbosacra', 13),
	(3, 'Radiografía de cadera', 13),
	(4, 'Radiografía de manos o pies', 13),
	(5, 'Radiografía panorámica dental', 13),
	(6, 'Resonancia magnética de cráneo', 14),
	(7, 'Resonancia magnética de columna cervical', 14),
	(8, 'Resonancia magnética de columna lumbar', 14),
	(9, 'Resonancia magnética de rodilla', 14),
	(10, 'Resonancia magnética de pelvis', 14),
	(11, 'Ecografía abdominal completa', 15),
	(12, 'Ecografía transvaginal', 15),
	(13, 'Ecografía obstétrica', 15),
	(14, 'Ecografía de tiroides', 15),
	(15, 'Doppler venoso de miembros inferiores', 15),
	(16, 'Mamografía bilateral', 16),
	(17, 'Mamografía de control', 16),
	(18, 'Mamografía con proyecciones adicionales', 16),
	(19, 'Hemograma completo', 17),
	(20, 'Glucemia en ayunas', 17),
	(21, 'Perfil lipídico', 17),
	(22, 'Urea y creatinina', 17),
	(23, 'TSH y T4 libre', 17),
	(24, 'Prueba de embarazo en sangre', 17),
	(25, 'Cultivo de orina', 18),
	(26, 'Cultivo de exudado faríngeo', 18),
	(27, 'Cultivo de secreción vaginal', 18),
	(28, 'Test rápido de estreptococo', 18),
	(29, 'Prueba de VIH (por ELISA)', 18),
	(30, 'Anticuerpos antinucleares (ANA)', 19),
	(31, 'PCR ultrasensible', 19),
	(32, 'IgE total', 19),
	(33, 'Panel de alérgenos respiratorios', 19),
	(34, 'Prueba de autoanticuerpos', 19);

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
	(1, 'Levotiroxina sódica', '25 mcg', '1 vez al día, en ayunas', 'Temporal hasta resultados de laboratorio', 2, 3),
	(2, 'Levotiroxina sódicad', '25 mcg', '1 vez al día, en ayunas', 'Temporal hasta resultados de laboratorio', 3, 3);

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
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_turno` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turno: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_turno` (`id`, `fecha_creacion`, `fecha_turno`, `estado`, `motivo`, `asistio`, `especialidad_id`, `paciente_id`, `profesional_id`) VALUES
	(1, '2025-08-29 23:21:50.990883', '2025-08-30', 'pendiente', 'Caída del cabello y piel seca,intolerancia al frío o al calor', 1, 5, 1, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxdepartamentoxjornada: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_usuarioxdepartamentoxjornada` (`id`, `departamento_id`, `jornada_id`, `usuario_id`) VALUES
	(1, 11, 1, 2),
	(2, 11, 2, 2),
	(3, 11, 3, 2),
	(4, 10, 4, 2),
	(5, 11, 5, 2),
	(6, 2, 1, 3),
	(7, 2, 2, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxespecialidad: ~0 rows (aproximadamente)
INSERT INTO `hospital_personal_usuarioxespecialidad` (`id`, `nombre_profesion`, `especialidad_id`, `usuario_id`) VALUES
	(1, 'Dermatólogo', 30, 2),
	(2, 'Endocrinólogo', 5, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
