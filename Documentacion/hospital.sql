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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.auth_permission: ~64 rows (aproximadamente)
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
	(29, 'Can add paciente', 8, 'add_paciente'),
	(30, 'Can change paciente', 8, 'change_paciente'),
	(31, 'Can delete paciente', 8, 'delete_paciente'),
	(32, 'Can view paciente', 8, 'view_paciente'),
	(33, 'Can add menor a cargo', 9, 'add_menoracargo'),
	(34, 'Can change menor a cargo', 9, 'change_menoracargo'),
	(35, 'Can delete menor a cargo', 9, 'delete_menoracargo'),
	(36, 'Can view menor a cargo', 9, 'view_menoracargo'),
	(37, 'Can add usuario', 10, 'add_usuario'),
	(38, 'Can change usuario', 10, 'change_usuario'),
	(39, 'Can delete usuario', 10, 'delete_usuario'),
	(40, 'Can view usuario', 10, 'view_usuario'),
	(41, 'Can add especialidades', 11, 'add_especialidades'),
	(42, 'Can change especialidades', 11, 'change_especialidades'),
	(43, 'Can delete especialidades', 11, 'delete_especialidades'),
	(44, 'Can view especialidades', 11, 'view_especialidades'),
	(45, 'Can add usuario x especialidad', 12, 'add_usuarioxespecialidad'),
	(46, 'Can change usuario x especialidad', 12, 'change_usuarioxespecialidad'),
	(47, 'Can delete usuario x especialidad', 12, 'delete_usuarioxespecialidad'),
	(48, 'Can view usuario x especialidad', 12, 'view_usuarioxespecialidad'),
	(49, 'Can add departamento', 13, 'add_departamento'),
	(50, 'Can change departamento', 13, 'change_departamento'),
	(51, 'Can delete departamento', 13, 'delete_departamento'),
	(52, 'Can view departamento', 13, 'view_departamento'),
	(53, 'Can add usuario x departamento', 14, 'add_usuarioxdepartamento'),
	(54, 'Can change usuario x departamento', 14, 'change_usuarioxdepartamento'),
	(55, 'Can delete usuario x departamento', 14, 'delete_usuarioxdepartamento'),
	(56, 'Can view usuario x departamento', 14, 'view_usuarioxdepartamento'),
	(57, 'Can add jorna_laboral', 15, 'add_jorna_laboral'),
	(58, 'Can change jorna_laboral', 15, 'change_jorna_laboral'),
	(59, 'Can delete jorna_laboral', 15, 'delete_jorna_laboral'),
	(60, 'Can view jorna_laboral', 15, 'view_jorna_laboral'),
	(61, 'Can add usuario x departamento x jornada', 16, 'add_usuarioxdepartamentoxjornada'),
	(62, 'Can change usuario x departamento x jornada', 16, 'change_usuarioxdepartamentoxjornada'),
	(63, 'Can delete usuario x departamento x jornada', 16, 'delete_usuarioxdepartamentoxjornada'),
	(64, 'Can view usuario x departamento x jornada', 16, 'view_usuarioxdepartamentoxjornada'),
	(65, 'Can add menor a cargo de paciente', 17, 'add_menoracargodepaciente'),
	(66, 'Can change menor a cargo de paciente', 17, 'change_menoracargodepaciente'),
	(67, 'Can delete menor a cargo de paciente', 17, 'delete_menoracargodepaciente'),
	(68, 'Can view menor a cargo de paciente', 17, 'view_menoracargodepaciente');

-- Volcando estructura para tabla hospitalbd.controlusuario_departamento
CREATE TABLE IF NOT EXISTS `controlusuario_departamento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_departamento: ~11 rows (aproximadamente)
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

-- Volcando estructura para tabla hospitalbd.controlusuario_especialidades
CREATE TABLE IF NOT EXISTS `controlusuario_especialidades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_especialidad` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_especialidades: ~31 rows (aproximadamente)
INSERT INTO `hospital_personal_especialidades` (`id`, `nombre_especialidad`, `descripcion`, `departamento_id`) VALUES
  (1, 'Medicina de Urgencias', 'Se ocupa del diagnóstico y tratamiento de enfermedades o lesiones que requieren atención médica inmediata.', 1),
  (2, 'Trauma y Cirugía de Urgencias', 'Atiende lesiones graves, como fracturas o heridas profundas, que requieren intervención quirúrgica urgente.', 1),
  (3, 'Medicina Crítica', 'Atención intensiva para pacientes graves o que requieren soporte vital.', 1),
  (4, 'Medicina General', 'Atención primaria para pacientes de todas las edades, con diagnóstico y tratamiento de enfermedades comunes.', 2),
  (5, 'Endocrinología', 'Trata enfermedades relacionadas con el sistema endocrino, como diabetes, trastornos de tiroides y problemas hormonales.', 2),
  (6, 'Oftalmología', 'Diagnóstico y tratamiento de enfermedades y trastornos oculares.', 2),
  (7, 'Otorrinolaringología', 'Enfoque en trastornos de los oídos, nariz y garganta.', 2),
  (8, 'Cirugía General', 'Realización de procedimientos quirúrgicos para tratar diversas condiciones médicas, como apendicitis o hernias.', 3),
  (9, 'Cirugía Plástica y Reconstructiva', 'Procedimientos para restaurar la apariencia física después de accidentes o enfermedades, incluyendo cirugías estéticas.', 3),
  (10, 'Medicina Intensiva', 'Manejo de pacientes en estado crítico que requieren monitoreo constante y tratamiento especializado.', 4),
  (11, 'UCI Cardiovascular', 'Cuidados intensivos para pacientes con insuficiencia cardíaca, infartos o cirugía cardíaca reciente.', 4),
  (12, 'UCI Respiratoria', 'Tratamiento especializado para pacientes con fallos respiratorios graves, como aquellos con insuficiencia respiratoria o neumonía severa.', 4),
  (13, 'Radiología General', 'Uso de rayos X para obtener imágenes del cuerpo y ayudar en el diagnóstico de enfermedades como fracturas o infecciones.', 5),
  (14, 'Resonancia Magnética (RM)', 'Técnica que utiliza imanes y ondas de radio para obtener imágenes detalladas de los órganos y tejidos internos.', 5),
  (15, 'Ecografía/Doppler', 'Uso de ondas sonoras para crear imágenes del cuerpo y evaluar la circulación sanguínea, a menudo utilizada en el embarazo.', 5),
  (16, 'Mamografía', 'Examen de imágenes de la mama para detectar cáncer de mama en etapas tempranas.', 5),
  (17, 'Bioquímica Clínica', 'Análisis de muestras biológicas, como sangre o orina, para evaluar las funciones metabólicas y diagnosticar enfermedades.', 6),
  (18, 'Microbiología', 'Análisis de muestras para detectar infecciones bacterianas, virales y fúngicas.', 6),
  (19, 'Inmunología', 'Estudio del sistema inmunológico y su respuesta a infecciones, alergias y enfermedades autoinmunes.', 6),
  (20, 'Farmacia Clínica', 'Uso adecuado de medicamentos para tratar enfermedades y mejorar la calidad de vida de los pacientes.', 7),
  (21, 'Farmacia Hospitalaria', 'Gestión de los medicamentos dentro del hospital, asegurando su correcta distribución y administración.', 7),
  (22, 'Oncología Médica', 'Tratamiento del cáncer utilizando medicamentos como quimioterapia, inmunoterapia y terapias dirigidas.', 8),
  (23, 'Oncología Radioterápica', 'Tratamiento del cáncer mediante radiación, con el fin de destruir células tumorales.', 8),
  (24, 'Cirugía Oncológica', 'Intervención quirúrgica para extirpar tumores cancerosos y tejidos afectados.', 8),
  (25, 'Pediatría General', 'Atención integral para niños y adolescentes, desde la prevención hasta el tratamiento de enfermedades comunes.', 9),
  (26, 'Ginecología General', 'Diagnóstico y tratamiento de afecciones ginecológicas, como infecciones, fibromas y cáncer.', 10),
  (27, 'Obstetricia', 'Atención médica a mujeres durante el embarazo, el parto y el postparto.', 10),
  (28, 'Perinatología', 'Atención médica especializada para embarazos de alto riesgo.', 10),
  (29, 'Dermatología General', 'Tratamiento de afecciones comunes de la piel, como acné, eczema y psoriasis.', 11),
  (30, 'Dermatología Estética', 'Procedimientos cosméticos para mejorar la apariencia de la piel, como láser o Botox.', 11),
  (31, 'Venereología', 'Diagnóstico y tratamiento de enfermedades de transmisión sexual.', 11);

TRUNCATE TABLE hospital_personal_ordenestudio

-- Volcando estructura para tabla hospitalbd.controlusuario_jorna_laboral
CREATE TABLE IF NOT EXISTS `controlusuario_jorna_laboral` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dia` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `turno` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_jorna_laboral: ~25 rows (aproximadamente)
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

-- Volcando estructura para tabla hospitalbd.controlusuario_menoracargodepaciente
CREATE TABLE IF NOT EXISTS `controlusuario_menoracargodepaciente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parentesco` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `adulto_id` bigint NOT NULL,
  `menor_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menor_id` (`menor_id`),
  KEY `controlUsuario_menor_adulto_id_13341d39_fk_controlUs` (`adulto_id`),
  CONSTRAINT `controlUsuario_menor_adulto_id_13341d39_fk_controlUs` FOREIGN KEY (`adulto_id`) REFERENCES `controlusuario_paciente` (`id`),
  CONSTRAINT `controlUsuario_menor_menor_id_54c29f81_fk_controlUs` FOREIGN KEY (`menor_id`) REFERENCES `controlusuario_paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_menoracargodepaciente: ~0 rows (aproximadamente)
INSERT INTO `controlusuario_menoracargodepaciente` (`id`, `parentesco`, `adulto_id`, `menor_id`) VALUES
	(1, 'HIJO', 1, 2),
	(2, 'HIJO', 1, 3);

-- Volcando estructura para tabla hospitalbd.controlusuario_paciente
CREATE TABLE IF NOT EXISTS `controlusuario_paciente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `direccion` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `persona_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persona_id` (`persona_id`),
  CONSTRAINT `controlUsuario_pacie_persona_id_939a58e8_fk_controlUs` FOREIGN KEY (`persona_id`) REFERENCES `controlusuario_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_paciente: ~3 rows (aproximadamente)
INSERT INTO `controlusuario_paciente` (`id`, `direccion`, `persona_id`) VALUES
	(1, 'Calle Falsa 123', 2),
	(2, '', 5),
	(3, '', 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_persona: ~6 rows (aproximadamente)
INSERT INTO `controlusuario_persona` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `login_id`, `fecha_nacimiento`, `sexo`, `telefono`) VALUES
	(1, 'pbkdf2_sha256$870000$JCRnrxxS24imkC4vskrP7P$hUiH7ho/Jxjj8mfG+NaXS73I9ZKKwv85ZBkVxKvaH2c=', '2025-08-19 16:45:25.717602', 1, 'Jose', 'Perez', 'jperez@gmail.com', 1, 1, '2025-08-16 19:45:21.000000', '37567897', '1000', '1992-05-10', 'M', '25160870'),
	(2, 'pbkdf2_sha256$870000$dMlr6jupDfE3kVCq0tsgBA$KUNodd4gu1r0134+zRiprsn/kr+CJLFeROOemCqBaow=', '2025-08-19 18:32:50.814449', 0, 'Maximiliano', 'Acuña', 'maxi@gmail.com', 0, 1, '2025-08-16 19:55:01.575625', '45912425', 'maxi@gmail.com', '2004-06-29', 'M', '2516080'),
	(3, 'Atenas123', NULL, 0, 'Lolo', 'Lolin', 'lolo@gmail.com', 0, 1, '2025-08-17 01:32:55.721053', '37567895', '1005', '2000-02-02', 'M', '25150870'),
	(4, 'pbkdf2_sha256$870000$Ex1ikdKAhVnKBpsdiNci8f$RF13ENCa7i8c2Fxbhvs8PsbZ8mEklW4u6hO3/aTT5nA=', NULL, 0, 'Micaela', 'Garcia', 'micaela@gmail.com', 0, 1, '2025-08-17 01:49:59.040368', '45912433', '1006', '2000-02-02', 'F', '25160833'),
	(5, '', NULL, 0, 'Jojo', 'Acuña', '', 0, 1, '2025-08-18 17:07:49.519222', '65321456', NULL, '2015-02-21', 'M', NULL),
	(6, '', NULL, 0, 'Lola', 'Acuña', '', 0, 1, '2025-08-18 20:17:59.632586', '65321457', NULL, '2015-02-21', 'F', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuario: ~3 rows (aproximadamente)
INSERT INTO `controlusuario_usuario` (`id`, `numero_matricula`, `debe_cambiar_contraseña`, `persona_id`, `rol_id`) VALUES
	(1, NULL, 0, 1, 1),
	(2, '10000', 1, 3, 3),
	(3, '10010', 1, 4, 3);

-- Volcando estructura para tabla hospitalbd.controlusuario_usuarioxdepartamentoxjornada
CREATE TABLE IF NOT EXISTS `controlusuario_usuarioxdepartamentoxjornada` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jornada_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usuario_jornada` (`usuario_id`,`jornada_id`),
  KEY `controlUsuario_usuar_jornada_id_7341e6d0_fk_controlUs` (`jornada_id`),
  CONSTRAINT `controlUsuario_usuar_usuario_id_97033fdd_fk_controlUs` FOREIGN KEY (`usuario_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuarioxdepartamentoxjornada: ~2 rows (aproximadamente)
INSERT INTO `controlusuario_usuarioxdepartamentoxjornada` (`id`, `jornada_id`, `usuario_id`) VALUES
	(1, 1, 3),
	(2, 2, 3);

-- Volcando estructura para tabla hospitalbd.controlusuario_usuarioxespecialidad
CREATE TABLE IF NOT EXISTS `controlusuario_usuarioxespecialidad` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint NOT NULL,
  `nombre_profesion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `controlUsuario_usuar_usuario_id_aa967dc5_fk_controlUs` (`usuario_id`),
  CONSTRAINT `controlUsuario_usuar_usuario_id_aa967dc5_fk_controlUs` FOREIGN KEY (`usuario_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuarioxespecialidad: ~1 rows (aproximadamente)
INSERT INTO `controlusuario_usuarioxespecialidad` (`id`, `usuario_id`, `nombre_profesion`) VALUES
	(3, 3, 'Dermatólogo');

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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Volcando datos para la tabla hospitalbd.django_admin_log: ~76 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-08-16 19:45:58.446993', '1', '1- Superadministrador', 1, '[{"added": {}}]', 6, 1),
	(2, '2025-08-16 19:46:08.689474', '1', 'Usuario: 1 - Jose Perez - Legajo hospitalario: 1000', 1, '[{"added": {}}]', 10, 1),
	(3, '2025-08-16 19:46:35.099034', '1', 'Jose Perez (1000)', 2, '[{"changed": {"fields": ["Email address", "Dni", "Fecha nacimiento", "Sexo", "Telefono"]}}]', 7, 1),
	(4, '2025-08-16 21:02:31.926867', '2', '2- Director del hospital', 1, '[{"added": {}}]', 6, 1),
	(5, '2025-08-16 21:56:27.791292', '1', 'ID Departamento 1 - Nombre: Urgencias (Emergencias)', 1, '[{"added": {}}]', 13, 1),
	(6, '2025-08-16 22:05:13.292512', '2', 'ID Departamento 2 - Nombre: Consultas Externas (Consultorios)', 1, '[{"added": {}}]', 13, 1),
	(7, '2025-08-16 22:06:43.352392', '3', 'ID Departamento 3 - Nombre: Cirugía', 1, '[{"added": {}}]', 13, 1),
	(8, '2025-08-16 22:06:58.415105', '4', 'ID Departamento 4 - Nombre: Unidad de Cuidados Intensivos (UCI)', 1, '[{"added": {}}]', 13, 1),
	(9, '2025-08-16 22:07:21.414476', '5', 'ID Departamento 5 - Nombre: Radiología y Diagnóstico por Imagen', 1, '[{"added": {}}]', 13, 1),
	(10, '2025-08-16 22:07:46.143150', '6', 'ID Departamento 6 - Nombre: Laboratorio Clínico', 1, '[{"added": {}}]', 13, 1),
	(11, '2025-08-16 22:08:15.150520', '7', 'ID Departamento 7 - Nombre: Farmacia', 1, '[{"added": {}}]', 13, 1),
	(12, '2025-08-16 22:09:04.112498', '8', 'ID Departamento 8 - Nombre: Oncología', 1, '[{"added": {}}]', 13, 1),
	(13, '2025-08-16 22:09:49.205475', '9', 'ID Departamento 9 - Nombre: Pediatría', 1, '[{"added": {}}]', 13, 1),
	(14, '2025-08-16 22:10:06.974585', '10', 'ID Departamento 10 - Nombre: Ginecología y Obstetricia', 1, '[{"added": {}}]', 13, 1),
	(15, '2025-08-16 22:10:34.582826', '11', 'ID Departamento 11 - Nombre: Dermatología', 1, '[{"added": {}}]', 13, 1),
	(16, '2025-08-16 22:26:18.233021', '1', 'ID especialidad 1 - Nombre: Medicina de Urgencias - Departamento: Urgencias (Emergencias)', 1, '[{"added": {}}]', 11, 1),
	(17, '2025-08-16 22:26:35.587035', '2', 'ID especialidad 2 - Nombre: Trauma y Cirugía de Urgencias - Departamento: Urgencias (Emergencias)', 1, '[{"added": {}}]', 11, 1),
	(18, '2025-08-16 22:27:14.506669', '3', 'ID especialidad 3 - Nombre: Medicina Crítica - Departamento: Urgencias (Emergencias)', 1, '[{"added": {}}]', 11, 1),
	(19, '2025-08-16 22:31:32.043438', '4', 'ID especialidad 4 - Nombre: Medicina General - Departamento: Consultas Externas (Consultorios)', 1, '[{"added": {}}]', 11, 1),
	(20, '2025-08-16 22:32:48.827269', '5', 'ID especialidad 5 - Nombre: Endocrinología - Departamento: Consultas Externas (Consultorios)', 1, '[{"added": {}}]', 11, 1),
	(21, '2025-08-16 22:33:16.314857', '6', 'ID especialidad 6 - Nombre: Oftalmología - Departamento: Consultas Externas (Consultorios)', 1, '[{"added": {}}]', 11, 1),
	(22, '2025-08-16 22:33:33.784218', '7', 'ID especialidad 7 - Nombre: Otorrinolaringología - Departamento: Consultas Externas (Consultorios)', 1, '[{"added": {}}]', 11, 1),
	(23, '2025-08-16 22:33:59.766106', '8', 'ID especialidad 8 - Nombre: Cirugía General - Departamento: Cirugía', 1, '[{"added": {}}]', 11, 1),
	(24, '2025-08-16 22:34:34.653199', '9', 'ID especialidad 9 - Nombre: Cirugía Plástica y Reconstructiva - Departamento: Cirugía', 1, '[{"added": {}}]', 11, 1),
	(25, '2025-08-16 22:34:58.446196', '10', 'ID especialidad 10 - Nombre: Medicina Intensiva - Departamento: Unidad de Cuidados Intensivos (UCI)', 1, '[{"added": {}}]', 11, 1),
	(26, '2025-08-16 22:35:22.869222', '11', 'ID especialidad 11 - Nombre: UCI Cardiovascular - Departamento: Unidad de Cuidados Intensivos (UCI)', 1, '[{"added": {}}]', 11, 1),
	(27, '2025-08-16 22:35:44.600450', '12', 'ID especialidad 12 - Nombre: UCI Respiratoria - Departamento: Unidad de Cuidados Intensivos (UCI)', 1, '[{"added": {}}]', 11, 1),
	(28, '2025-08-16 22:36:09.206329', '13', 'ID especialidad 13 - Nombre: Radiología General - Departamento: Radiología y Diagnóstico por Imagen', 1, '[{"added": {}}]', 11, 1),
	(29, '2025-08-16 22:36:35.854811', '14', 'ID especialidad 14 - Nombre: Resonancia Magnética (RM) - Departamento: Radiología y Diagnóstico por Imagen', 1, '[{"added": {}}]', 11, 1),
	(30, '2025-08-16 22:37:17.437257', '15', 'ID especialidad 15 - Nombre: Ecografía/Doppler - Departamento: Radiología y Diagnóstico por Imagen', 1, '[{"added": {}}]', 11, 1),
	(31, '2025-08-16 22:37:37.310280', '16', 'ID especialidad 16 - Nombre: Mamografía - Departamento: Radiología y Diagnóstico por Imagen', 1, '[{"added": {}}]', 11, 1),
	(32, '2025-08-16 22:37:56.386447', '17', 'ID especialidad 17 - Nombre: Bioquímica Clínica - Departamento: Laboratorio Clínico', 1, '[{"added": {}}]', 11, 1),
	(33, '2025-08-16 22:38:56.489375', '18', 'ID especialidad 18 - Nombre: Microbiología - Departamento: Laboratorio Clínico', 1, '[{"added": {}}]', 11, 1),
	(34, '2025-08-16 22:39:09.508815', '19', 'ID especialidad 19 - Nombre: Inmunología - Departamento: Laboratorio Clínico', 1, '[{"added": {}}]', 11, 1),
	(35, '2025-08-16 22:39:52.891095', '20', 'ID especialidad 20 - Nombre: Farmacia Clínica - Departamento: Farmacia', 1, '[{"added": {}}]', 11, 1),
	(36, '2025-08-16 22:40:07.472402', '21', 'ID especialidad 21 - Nombre: Farmacia Hospitalaria - Departamento: Farmacia', 1, '[{"added": {}}]', 11, 1),
	(37, '2025-08-16 22:40:40.807248', '22', 'ID especialidad 22 - Nombre: Oncología Médica - Departamento: Oncología', 1, '[{"added": {}}]', 11, 1),
	(38, '2025-08-16 22:41:33.014799', '23', 'ID especialidad 23 - Nombre: Oncología Radioterápica - Departamento: Oncología', 1, '[{"added": {}}]', 11, 1),
	(39, '2025-08-16 22:41:50.206384', '24', 'ID especialidad 24 - Nombre: Cirugía Oncológica - Departamento: Oncología', 1, '[{"added": {}}]', 11, 1),
	(40, '2025-08-16 22:42:15.092097', '25', 'ID especialidad 25 - Nombre: Pediatría General - Departamento: Pediatría', 1, '[{"added": {}}]', 11, 1),
	(41, '2025-08-16 22:42:54.884957', '26', 'ID especialidad 26 - Nombre: Ginecología General - Departamento: Ginecología y Obstetricia', 1, '[{"added": {}}]', 11, 1),
	(42, '2025-08-16 22:43:10.170223', '27', 'ID especialidad 27 - Nombre: Obstetricia - Departamento: Ginecología y Obstetricia', 1, '[{"added": {}}]', 11, 1),
	(43, '2025-08-16 22:43:42.717497', '28', 'ID especialidad 28 - Nombre: Perinatología - Departamento: Ginecología y Obstetricia', 1, '[{"added": {}}]', 11, 1),
	(44, '2025-08-16 22:44:08.272165', '29', 'ID especialidad 29 - Nombre: Dermatología General - Departamento: Dermatología', 1, '[{"added": {}}]', 11, 1),
	(45, '2025-08-16 22:44:52.250020', '30', 'ID especialidad 30 - Nombre: Dermatología Estética - Departamento: Dermatología', 1, '[{"added": {}}]', 11, 1),
	(46, '2025-08-16 22:45:11.972536', '31', 'ID especialidad 31 - Nombre: Venereología - Departamento: Dermatología', 1, '[{"added": {}}]', 11, 1),
	(47, '2025-08-16 23:17:54.330007', '3', '3- Médico', 1, '[{"added": {}}]', 6, 1),
	(48, '2025-08-17 02:15:56.124907', '3', 'Usuario: <bound method AbstractUser.get_full_name of <Persona: Micaela Garcia (1006)>> - N° Legajo: 1006 - Especialidad: Dermatología Estética - N° Matricula: 10010', 1, '[{"added": {}}]', 12, 1),
	(49, '2025-08-17 19:33:19.717141', '1', 'El dia: lunes trabaja en el turno: dia', 1, '[{"added": {}}]', 15, 1),
	(50, '2025-08-17 19:33:57.803332', '2', 'El dia martes trabaja en el turno: dia', 1, '[{"added": {}}]', 15, 1),
	(51, '2025-08-17 19:34:02.687387', '3', 'El dia miercoles trabaja en el turno: dia', 1, '[{"added": {}}]', 15, 1),
	(52, '2025-08-17 19:34:06.229411', '4', 'El dia jueves trabaja en el turno: dia', 1, '[{"added": {}}]', 15, 1),
	(53, '2025-08-17 19:34:24.334685', '5', 'El dia viernes trabaja en el turno: dia', 1, '[{"added": {}}]', 15, 1),
	(54, '2025-08-17 19:34:29.690091', '6', 'El dia sabado trabaja en el turno: dia', 1, '[{"added": {}}]', 15, 1),
	(55, '2025-08-17 19:34:33.634019', '7', 'El dia domingo trabaja en el turno: dia', 1, '[{"added": {}}]', 15, 1),
	(56, '2025-08-17 19:34:38.470249', '8', 'El dia lunes trabaja en el turno: tarde', 1, '[{"added": {}}]', 15, 1),
	(57, '2025-08-17 19:34:42.387537', '9', 'El dia martes trabaja en el turno: tarde', 1, '[{"added": {}}]', 15, 1),
	(58, '2025-08-17 19:34:45.817223', '10', 'El dia miercoles trabaja en el turno: tarde', 1, '[{"added": {}}]', 15, 1),
	(59, '2025-08-17 19:34:49.427041', '11', 'El dia jueves trabaja en el turno: tarde', 1, '[{"added": {}}]', 15, 1),
	(60, '2025-08-17 19:34:52.821918', '12', 'El dia viernes trabaja en el turno: tarde', 1, '[{"added": {}}]', 15, 1),
	(61, '2025-08-17 19:34:56.588559', '13', 'El dia sabado trabaja en el turno: tarde', 1, '[{"added": {}}]', 15, 1),
	(62, '2025-08-17 19:35:00.787457', '14', 'El dia domingo trabaja en el turno: tarde', 1, '[{"added": {}}]', 15, 1),
	(63, '2025-08-17 19:35:06.036237', '15', 'El dia lunes trabaja en el turno: noche', 1, '[{"added": {}}]', 15, 1),
	(64, '2025-08-17 19:35:09.672811', '16', 'El dia martes trabaja en el turno: noche', 1, '[{"added": {}}]', 15, 1),
	(65, '2025-08-17 19:35:13.652039', '17', 'El dia miercoles trabaja en el turno: noche', 1, '[{"added": {}}]', 15, 1),
	(66, '2025-08-17 19:35:17.119564', '18', 'El dia jueves trabaja en el turno: noche', 1, '[{"added": {}}]', 15, 1),
	(67, '2025-08-17 19:35:21.305325', '19', 'El dia viernes trabaja en el turno: noche', 1, '[{"added": {}}]', 15, 1),
	(68, '2025-08-17 19:35:25.134337', '20', 'El dia sabado trabaja en el turno: noche', 1, '[{"added": {}}]', 15, 1),
	(69, '2025-08-17 19:35:29.783899', '21', 'El dia domingo trabaja en el turno: noche', 1, '[{"added": {}}]', 15, 1),
	(70, '2025-08-17 19:35:47.919659', '22', 'El dia lunes trabaja en el turno: on-call', 1, '[{"added": {}}]', 15, 1),
	(71, '2025-08-17 19:35:50.873197', '23', 'El dia martes trabaja en el turno: on-call', 1, '[{"added": {}}]', 15, 1),
	(72, '2025-08-17 19:35:53.835468', '24', 'El dia miercoles trabaja en el turno: on-call', 1, '[{"added": {}}]', 15, 1),
	(73, '2025-08-17 19:35:58.249927', '25', 'El dia jueves trabaja en el turno: on-call', 1, '[{"added": {}}]', 15, 1),
	(74, '2025-08-17 19:36:01.855427', '26', 'El dia viernes trabaja en el turno: on-call', 1, '[{"added": {}}]', 15, 1),
	(75, '2025-08-17 19:36:05.414889', '27', 'El dia sabado trabaja en el turno: on-call', 1, '[{"added": {}}]', 15, 1),
	(76, '2025-08-17 19:36:09.215793', '28', 'El dia domingo trabaja en el turno: on-call', 1, '[{"added": {}}]', 15, 1),
	(77, '2025-08-17 19:45:46.304702', '1', 'Departamento: Dermatología', 1, '[{"added": {}}]', 16, 1),
	(78, '2025-08-17 20:16:26.216135', '2', 'Departamento: Dermatología', 1, '[{"added": {}}]', 16, 1),
	(79, '2025-08-19 21:50:55.798814', '1', 'Jojo Acuña con el DNI: 65321456 esta a cargo de Maximiliano Acuña con el DNI: 45912425 parentesco con el menor: Hijo/a', 1, '[{"added": {}}]', 17, 1),
	(80, '2025-08-19 21:51:09.231887', '2', 'Lola Acuña con el DNI: 65321457 esta a cargo de Maximiliano Acuña con el DNI: 45912425 parentesco con el menor: Hijo/a', 1, '[{"added": {}}]', 17, 1);

-- Volcando estructura para tabla hospitalbd.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_content_type: ~17 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'contenttypes', 'contenttype'),
	(13, 'controlUsuario', 'departamento'),
	(11, 'controlUsuario', 'especialidades'),
	(15, 'controlUsuario', 'jorna_laboral'),
	(9, 'controlUsuario', 'menoracargo'),
	(17, 'controlUsuario', 'menoracargodepaciente'),
	(8, 'controlUsuario', 'paciente'),
	(7, 'controlUsuario', 'persona'),
	(6, 'controlUsuario', 'roles'),
	(10, 'controlUsuario', 'usuario'),
	(14, 'controlUsuario', 'usuarioxdepartamento'),
	(16, 'controlUsuario', 'usuarioxdepartamentoxjornada'),
	(12, 'controlUsuario', 'usuarioxespecialidad'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla hospitalbd.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_migrations: ~24 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-08-16 19:44:50.797010'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2025-08-16 19:44:51.106523'),
	(3, 'auth', '0001_initial', '2025-08-16 19:44:52.032563'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2025-08-16 19:44:52.225602'),
	(5, 'auth', '0003_alter_user_email_max_length', '2025-08-16 19:44:52.243577'),
	(6, 'auth', '0004_alter_user_username_opts', '2025-08-16 19:44:52.266538'),
	(7, 'auth', '0005_alter_user_last_login_null', '2025-08-16 19:44:52.306071'),
	(8, 'auth', '0006_require_contenttypes_0002', '2025-08-16 19:44:52.326037'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2025-08-16 19:44:52.359987'),
	(10, 'auth', '0008_alter_user_username_max_length', '2025-08-16 19:44:52.513738'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2025-08-16 19:44:52.535259'),
	(12, 'auth', '0010_alter_group_name_max_length', '2025-08-16 19:44:52.598918'),
	(13, 'auth', '0011_update_proxy_permissions', '2025-08-16 19:44:52.623878'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2025-08-16 19:44:52.673800'),
	(15, 'controlUsuario', '0001_initial', '2025-08-16 19:44:55.034298'),
	(16, 'admin', '0001_initial', '2025-08-16 19:44:55.484003'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2025-08-16 19:44:55.514278'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-16 19:44:55.580168'),
	(19, 'sessions', '0001_initial', '2025-08-16 19:44:55.708767'),
	(20, 'controlUsuario', '0002_departamento_especialidades_usuarioxdepartamento_and_more', '2025-08-16 21:44:12.741297'),
	(21, 'controlUsuario', '0003_usuarioxespecialidad_nombre_profesion', '2025-08-16 22:21:48.781671'),
	(22, 'controlUsuario', '0004_alter_usuario_debe_cambiar_contraseña_and_more', '2025-08-17 02:11:07.215626'),
	(23, 'controlUsuario', '0005_jorna_laboral_usuarioxdepartamentoxjornada_and_more', '2025-08-17 19:25:34.855124'),
	(25, 'controlUsuario', '0006_alter_jorna_laboral_dia_menoracargodepaciente_and_more', '2025-08-19 21:48:19.800387');

-- Volcando estructura para tabla hospitalbd.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_session: ~4 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('20ce60b63qkxa2rhrvh4q8kygfm7q2qd', '.eJxVjDkOwjAQAP_iGlnxER-U9LzB2l1vcAA5UpxUiL-DpRTQzozmJRLsW0l74zXNWZyFEqdfhkAPrl3kO9TbImmp2zqj7Ik8bJPXJfPzcrR_gwKt9C2xsjQqryhqGxmZfQiExjo3sR68cVllneOkjfHfApUeog2jd4AWSLw_1IM3Rw:1unMqc:6pgu8UyNEZ0CgOrT-GV9lnpx2LI8i8jiNLcQ_FTYNaM', '2025-08-30 19:45:50.387523'),
	('8fbt5fdx7wdl795schs1lqmamw7sgwus', '.eJxVjDkOwjAQAP_iGlnxER-U9LzB2l1vcAA5UpxUiL-DpRTQzozmJRLsW0l74zXNWZyFEqdfhkAPrl3kO9TbImmp2zqj7Ik8bJPXJfPzcrR_gwKt9C2xsjQqryhqGxmZfQiExjo3sR68cVllneOkjfHfApUeog2jd4AWSLw_1IM3Rw:1uoA5U:kTTaDUOrkN4gwYCX7xb-n2IO_fj8PZA_UPP9C18A39c', '2025-09-02 00:20:28.569471'),
	('xeswv3v0500y6iw9y0nhd5wc3oz53rqw', '.eJxVjMsOwiAQRf-FtSFAYQCX7v0GMsNDqgaS0q6M_65NutDtPefcFwu4rTVsIy9hTuzMFDv9boTxkdsO0h3brfPY27rMxHeFH3Twa0_5eTncv4OKo35rJ41EiugUeg8lFzUZcFqDd0ooIE-CoICWTloQIkYAsCriZI2VlDx7fwDCADbA:1uoR8c:z8RWhc8CQhpbp3ua9mG2VlO5wXuA_MhtC4vQJDV4C5k', '2025-09-02 18:32:50.839124'),
	('ygzfyfsweld6im5adu5152ygpagnnzeb', '.eJxVjDkOwjAQAP_iGlnxER-U9LzB2l1vcAA5UpxUiL-DpRTQzozmJRLsW0l74zXNWZyFEqdfhkAPrl3kO9TbImmp2zqj7Ik8bJPXJfPzcrR_gwKt9C2xsjQqryhqGxmZfQiExjo3sR68cVllneOkjfHfApUeog2jd4AWSLw_1IM3Rw:1uoPSf:Iv3LvwqA35RY7CGw3pWf1jlEp4uw27T_rlKQtymebcU', '2025-09-02 16:45:25.736657');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
hospitalbd