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

INSERT INTO `hospital_personal_lugar` (`id`, `nombre`, `tipo`, `piso`, `codigo`, `estado`, `capacidad`, `descripcion`, `es_critico`, `activo`) VALUES
-- 11. ANESTESIOLOGÍA
(31, 'Sala de Anestesia 1', 'lab', 2, 'ANE-201', 'disponible', 2, 'Sala de preparación anestésica previa a cirugía.', 1, 1),
(32, 'Sala de Anestesia 2', 'lab', 2, 'ANE-202', 'ocupado', 2, 'Sala de recuperación anestésica postoperatoria.', 1, 1),
(33, 'Consultorio de Manejo del Dolor', 'cons', 2, 'CONS-ANE-203', 'disponible', 1, 'Consultorio para control y manejo del dolor.', 0, 1),

-- 12. RADIOLOGÍA GENERAL
(34, 'Sala de Rayos X 1', 'lab', 1, 'RX-101', 'ocupado', 2, 'Sala de radiología para estudios generales.', 0, 1),
(35, 'Sala de Rayos X 2', 'lab', 1, 'RX-102', 'disponible', 2, 'Sala de diagnóstico por imagen.', 0, 1),
(36, 'Sala de Radiología de Emergencias', 'lab', 1, 'RX-103', 'disponible', 2, 'Radiología rápida para pacientes críticos.', 1, 1),

-- 13. RADIOLOGÍA PEDIÁTRICA
(37, 'Sala de Radiología Pediátrica 1', 'lab', 2, 'RX-PED-201', 'disponible', 1, 'Sala de rayos X adaptada a niños.', 0, 1),
(38, 'Sala de Radiología Pediátrica 2', 'lab', 2, 'RX-PED-202', 'ocupado', 1, 'Radiología infantil con equipos de baja radiación.', 0, 1),
(39, 'Sala de Radiología Pediátrica 3', 'lab', 2, 'RX-PED-203', 'disponible', 1, 'Diagnóstico radiológico en pediatría.', 0, 1),

-- 14. PATOLOGÍA
(40, 'Laboratorio de Patología 1', 'lab', 1, 'LAB-PAT-101', 'disponible', 4, 'Laboratorio de anatomía patológica.', 0, 1),
(41, 'Laboratorio de Patología 2', 'lab', 1, 'LAB-PAT-102', 'ocupado', 4, 'Sala de procesamiento de muestras patológicas.', 0, 1),
(42, 'Laboratorio de Patología 3', 'lab', 1, 'LAB-PAT-103', 'disponible', 3, 'Laboratorio para análisis histológicos.', 0, 1),

-- 15. MICROBIOLOGÍA
(43, 'Laboratorio de Microbiología 1', 'lab', 1, 'LAB-MIC-101', 'disponible', 5, 'Laboratorio para análisis de muestras bacteriológicas.', 0, 1),
(44, 'Laboratorio de Microbiología 2', 'lab', 1, 'LAB-MIC-102', 'ocupado', 5, 'Sala para diagnóstico de infecciones.', 0, 1),
(45, 'Laboratorio de Microbiología 3', 'lab', 1, 'LAB-MIC-103', 'disponible', 4, 'Laboratorio con cabinas de bioseguridad.', 0, 1),

-- 16. FARMACIA CLÍNICA
(46, 'Consultorio de Farmacia Clínica 1', 'cons', 1, 'CONS-FAR-101', 'disponible', 1, 'Consultorio para asesoría farmacéutica.', 0, 1),
(47, 'Consultorio de Farmacia Clínica 2', 'cons', 1, 'CONS-FAR-102', 'ocupado', 1, 'Asesoramiento sobre uso de medicamentos.', 0, 1),
(48, 'Laboratorio de Farmacia Clínica', 'lab', 1, 'LAB-FAR-103', 'disponible', 3, 'Laboratorio de control de medicamentos hospitalarios.', 0, 1),

-- 17. ONCOLOGÍA MÉDICA
(49, 'Consultorio de Oncología Médica 1', 'cons', 2, 'CONS-ONC-201', 'ocupado', 1, 'Consultorio para control de pacientes con cáncer.', 0, 1),
(50, 'Consultorio de Oncología Médica 2', 'cons', 2, 'CONS-ONC-202', 'disponible', 1, 'Atención y seguimiento de tratamientos oncológicos.', 0, 1),
(51, 'Sala de Quimioterapia 1', 'hab', 2, 'QUI-ONC-203', 'disponible', 5, 'Sala de administración de quimioterapia.', 1, 1),

-- 18. ONCOLOGÍA GINECOLÓGICA
(52, 'Consultorio de Oncología Ginecológica 1', 'cons', 2, 'CONS-ONG-201', 'disponible', 1, 'Consultorio para control de cáncer ginecológico.', 0, 1),
(53, 'Consultorio de Oncología Ginecológica 2', 'cons', 2, 'CONS-ONG-202', 'ocupado', 1, 'Consultorio de diagnóstico oncológico femenino.', 0, 1),
(54, 'Sala de Tratamientos Oncológicos Ginecológicos', 'hab', 2, 'SAL-ONG-203', 'disponible', 2, 'Sala para procedimientos oncológicos ginecológicos.', 1, 1),

-- 19. NEONATOLOGÍA
(55, 'Unidad Neonatal 1', 'hab', 3, 'NEO-301', 'ocupado', 2, 'Unidad para recién nacidos prematuros.', 1, 1),
(56, 'Unidad Neonatal 2', 'hab', 3, 'NEO-302', 'disponible', 2, 'Habitación equipada con incubadoras.', 1, 1),
(57, 'Unidad Neonatal 3', 'hab', 3, 'NEO-303', 'disponible', 2, 'Sala de cuidados intensivos neonatales.', 1, 1),

-- 20. PEDIATRÍA GENERAL
(58, 'Consultorio de Pediatría General 1', 'cons', 2, 'CONS-PEDG-201', 'ocupado', 1, 'Consultorio de atención pediátrica ambulatoria.', 0, 1),
(59, 'Consultorio de Pediatría General 2', 'cons', 2, 'CONS-PEDG-202', 'disponible', 1, 'Atención general para niños y adolescentes.', 0, 1),
(60, 'Sala de Internación Pediátrica General', 'hab', 2, 'HAB-PEDG-203', 'disponible', 3, 'Habitación compartida para pacientes pediátricos.', 1, 1),

-- 21. CARDIOLOGÍA
(61, 'Consultorio de Cardiología 1', 'cons', 3, 'CONS-CAR-301', 'ocupado', 1, 'Consultorio especializado en enfermedades cardíacas.', 0, 1),
(62, 'Consultorio de Cardiología 2', 'cons', 3, 'CONS-CAR-302', 'disponible', 1, 'Control y seguimiento de pacientes cardíacos.', 0, 1),
(63, 'Sala de Electrocardiogramas', 'lab', 3, 'LAB-CAR-303', 'disponible', 2, 'Sala equipada para estudios de electrocardiograma.', 0, 1),

-- 22. NEUMOLOGÍA
(64, 'Consultorio de Neumología 1', 'cons', 3, 'CONS-NEU-301', 'ocupado', 1, 'Consultorio para diagnóstico de enfermedades respiratorias.', 0, 1),
(65, 'Consultorio de Neumología 2', 'cons', 3, 'CONS-NEU-302', 'disponible', 1, 'Atención de pacientes con enfermedades pulmonares.', 0, 1),
(66, 'Laboratorio de Función Pulmonar', 'lab', 3, 'LAB-NEU-303', 'disponible', 2, 'Sala equipada para espirometrías y estudios respiratorios.', 0, 1),

-- 23. NEFROLOGÍA
(67, 'Consultorio de Nefrología 1', 'cons', 3, 'CONS-NEF-301', 'disponible', 1, 'Consultorio para enfermedades renales.', 0, 1),
(68, 'Consultorio de Nefrología 2', 'cons', 3, 'CONS-NEF-302', 'ocupado', 1, 'Atención de pacientes con insuficiencia renal.', 0, 1),
(69, 'Sala de Hemodiálisis 1', 'lab', 3, 'LAB-NEF-303', 'disponible', 4, 'Sala equipada con máquinas de hemodiálisis.', 1, 1),

-- 24. GASTROENTEROLOGÍA
(70, 'Consultorio de Gastroenterología 1', 'cons', 3, 'CONS-GAS-301', 'ocupado', 1, 'Consultorio para enfermedades digestivas.', 0, 1),
(71, 'Consultorio de Gastroenterología 2', 'cons', 3, 'CONS-GAS-302', 'disponible', 1, 'Atención de pacientes con patologías gastrointestinales.', 0, 1),
(72, 'Sala de Endoscopia 1', 'lab', 3, 'LAB-GAS-303', 'disponible', 2, 'Sala equipada para endoscopias digestivas.', 1, 1),

-- 25. DERMATOLOGÍA
(73, 'Consultorio de Dermatología 1', 'cons', 2, 'CONS-DER-201', 'disponible', 1, 'Consultorio de diagnóstico de enfermedades de la piel.', 0, 1),
(74, 'Consultorio de Dermatología 2', 'cons', 2, 'CONS-DER-202', 'ocupado', 1, 'Atención de tratamientos dermatológicos.', 0, 1),
(75, 'Sala de Fototerapia', 'lab', 2, 'LAB-DER-203', 'disponible', 2, 'Sala equipada con lámparas UV para tratamientos.', 0, 1),

-- 26. REUMATOLOGÍA
(76, 'Consultorio de Reumatología 1', 'cons', 2, 'CONS-REU-201', 'ocupado', 1, 'Consultorio para enfermedades autoinmunes.', 0, 1),
(77, 'Consultorio de Reumatología 2', 'cons', 2, 'CONS-REU-202', 'disponible', 1, 'Atención de pacientes con artritis y lupus.', 0, 1),
(78, 'Sala de Infusión Reumatológica', 'hab', 2, 'HAB-REU-203', 'disponible', 3, 'Sala para administración de terapias intravenosas.', 0, 1),

-- 27. ENDOCRINOLOGÍA
(79, 'Consultorio de Endocrinología 1', 'cons', 2, 'CONS-END-201', 'disponible', 1, 'Consultorio para enfermedades hormonales.', 0, 1),
(80, 'Consultorio de Endocrinología 2', 'cons', 2, 'CONS-END-202', 'ocupado', 1, 'Control de pacientes con diabetes y tiroides.', 0, 1),
(81, 'Sala de Educación Diabética', 'hab', 2, 'HAB-END-203', 'disponible', 5, 'Sala destinada a la enseñanza del autocontrol de la diabetes.', 0, 1),

-- 28. NEUROLOGÍA
(82, 'Consultorio de Neurología 1', 'cons', 3, 'CONS-NRL-301', 'ocupado', 1, 'Consultorio para enfermedades neurológicas.', 0, 1),
(83, 'Consultorio de Neurología 2', 'cons', 3, 'CONS-NRL-302', 'disponible', 1, 'Atención de pacientes con epilepsia y migraña.', 0, 1),
(84, 'Sala de Electroencefalogramas', 'lab', 3, 'LAB-NRL-303', 'disponible', 2, 'Sala para estudios de actividad cerebral.', 0, 1),

-- 29. PSIQUIATRÍA
(85, 'Consultorio de Psiquiatría 1', 'cons', 2, 'CONS-PSQ-201', 'disponible', 1, 'Consultorio de evaluación psiquiátrica.', 0, 1),
(86, 'Consultorio de Psiquiatría 2', 'cons', 2, 'CONS-PSQ-202', 'ocupado', 1, 'Seguimiento de pacientes con trastornos mentales.', 0, 1),
(87, 'Sala de Terapias Grupales', 'hab', 2, 'HAB-PSQ-203', 'disponible', 8, 'Sala acondicionada para terapias grupales.', 0, 1),

-- 30. CIRUGÍA GENERAL
(88, 'Quirófano de Cirugía General 1', 'qui', 4, 'QUI-CG-401', 'ocupado', 1, 'Quirófano para procedimientos generales.', 1, 1),
(89, 'Quirófano de Cirugía General 2', 'qui', 4, 'QUI-CG-402', 'disponible', 1, 'Quirófano equipado para cirugías abdominales.', 1, 1),
(90, 'Sala de Recuperación Cirugía General', 'hab', 4, 'REC-CG-403', 'disponible', 4, 'Sala postoperatoria de pacientes de cirugía general.', 1, 1),

-- 31. CIRUGÍA ONCOLÓGICA
(91, 'Quirófano de Oncología 1', 'qui', 4, 'QUI-ONC-401', 'ocupado', 1, 'Quirófano especializado en procedimientos oncológicos.', 1, 1),
(92, 'Quirófano de Oncología 2', 'qui', 4, 'QUI-ONC-402', 'disponible', 1, 'Preparado para cirugía de tumores complejos.', 1, 1),
(93, 'Sala de Recuperación Oncológica', 'hab', 4, 'REC-ONC-403', 'disponible', 3, 'Sala postoperatoria para pacientes oncológicos.', 1, 1),

-- 32. CIRUGÍA VASCULAR
(94, 'Quirófano de Cirugía Vascular 1', 'qui', 4, 'QUI-CV-401', 'ocupado', 1, 'Quirófano para procedimientos en vasos sanguíneos.', 1, 1),
(95, 'Quirófano de Cirugía Vascular 2', 'qui', 4, 'QUI-CV-402', 'disponible', 1, 'Preparado para bypass y aneurismas.', 1, 1),
(96, 'Sala de Recuperación Vascular', 'hab', 4, 'REC-CV-403', 'disponible', 2, 'Área de recuperación postquirúrgica vascular.', 1, 1),

-- 33. CIRUGÍA TORÁCICA
(97, 'Quirófano de Cirugía Torácica 1', 'qui', 4, 'QUI-CT-401', 'ocupado', 1, 'Quirófano para operaciones de tórax y pulmones.', 1, 1),
(98, 'Quirófano de Cirugía Torácica 2', 'qui', 4, 'QUI-CT-402', 'disponible', 1, 'Preparado para cirugía de pleura y pulmones.', 1, 1),
(99, 'Sala de Cuidados Post-Torácicos', 'hab', 4, 'REC-CT-403', 'disponible', 3, 'Sala de recuperación para cirugía torácica.', 1, 1),

-- 34. CIRUGÍA PLÁSTICA Y ESTÉTICA
(100, 'Quirófano de Cirugía Plástica 1', 'qui', 3, 'QUI-CP-301', 'ocupado', 1, 'Quirófano para cirugía reconstructiva y estética.', 1, 1),
(101, 'Quirófano de Cirugía Plástica 2', 'qui', 3, 'QUI-CP-302', 'disponible', 1, 'Preparado para cirugías faciales y corporales.', 1, 1),
(102, 'Sala de Recuperación Estética', 'hab', 3, 'REC-CP-303', 'disponible', 4, 'Área de cuidados postoperatorios en cirugía estética.', 0, 1),

-- 35. CIRUGÍA ORTOPÉDICA
(103, 'Quirófano de Ortopedia 1', 'qui', 3, 'QUI-ORT-301', 'ocupado', 1, 'Quirófano para cirugía traumatológica y ortopédica.', 1, 1),
(104, 'Quirófano de Ortopedia 2', 'qui', 3, 'QUI-ORT-302', 'disponible', 1, 'Preparado para implantes y prótesis.', 1, 1),
(105, 'Sala de Rehabilitación Ortopédica', 'hab', 2, 'HAB-ORT-201', 'disponible', 6, 'Sala para recuperación de pacientes traumatológicos.', 0, 1),

-- 36. ANESTESIOLOGÍA
(106, 'Sala de Anestesia 1', 'lab', 4, 'LAB-ANE-401', 'ocupado', 2, 'Preparación anestésica para cirugías.', 1, 1),
(107, 'Sala de Anestesia 2', 'lab', 4, 'LAB-ANE-402', 'disponible', 2, 'Área para control de anestesia intraoperatoria.', 1, 1),
(108, 'Unidad de Recuperación Anestésica', 'hab', 4, 'REC-ANE-403', 'disponible', 4, 'Monitoreo postanestesia inmediato.', 1, 1),

-- 37. MEDICINA CRÍTICA
(109, 'Unidad de Cuidados Intensivos 1', 'hab', 5, 'UCI-MC-501', 'ocupado', 6, 'Área crítica para pacientes graves.', 1, 1),
(110, 'Unidad de Cuidados Intensivos 2', 'hab', 5, 'UCI-MC-502', 'disponible', 6, 'Soporte vital avanzado.', 1, 1),
(111, 'Unidad de Cuidados Intensivos 3', 'hab', 5, 'UCI-MC-503', 'disponible', 6, 'Atención 24h para pacientes críticos.', 1, 1),

-- 38. NEUROCRÍTICA
(112, 'Unidad de Cuidados Neurocríticos 1', 'hab', 5, 'UCN-NCR-501', 'ocupado', 4, 'Manejo de pacientes con patologías neurológicas críticas.', 1, 1),
(113, 'Unidad de Cuidados Neurocríticos 2', 'hab', 5, 'UCN-NCR-502', 'disponible', 4, 'Atención a traumatismos craneoencefálicos.', 1, 1),
(114, 'Sala de Monitoreo Neurológico', 'lab', 5, 'LAB-NCR-503', 'disponible', 2, 'Monitoreo avanzado de la actividad cerebral.', 1, 1),

-- 39. RADIODIAGNÓSTICO
(115, 'Sala de Radiología 1', 'lab', 1, 'LAB-RAD-101', 'disponible', 2, 'Diagnóstico por rayos X y TAC.', 0, 1),
(116, 'Sala de Radiología 2', 'lab', 1, 'LAB-RAD-102', 'ocupado', 2, 'Exámenes de radiografía y fluoroscopía.', 0, 1),
(117, 'Sala de Resonancia Magnética', 'lab', 1, 'LAB-RAD-103', 'disponible', 1, 'Equipo de RMN de alto campo.', 0, 1),

-- 40. CUIDADOS PALIATIVOS
(118, 'Consultorio de Cuidados Paliativos 1', 'cons', 2, 'CONS-CPAL-201', 'ocupado', 1, 'Atención integral a pacientes terminales.', 0, 1),
(119, 'Consultorio de Cuidados Paliativos 2', 'cons', 2, 'CONS-CPAL-202', 'disponible', 1, 'Apoyo clínico y psicológico.', 0, 1),
(120, 'Sala de Cuidados Paliativos', 'hab', 2, 'HAB-CPAL-203', 'disponible', 3, 'Área para internación de pacientes en cuidados paliativos.', 0, 1),

(121, 'Sala de Rayos X de Emergencia 1', 'lab', 1, 'LAB-RX-101', 'ocupado', 1, 'Radiología rápida para emergencias.', 1, 1),
(122, 'Sala de Rayos X de Emergencia 2', 'lab', 1, 'LAB-RX-102', 'disponible', 1, 'Radiografía de tórax y huesos en urgencias.', 1, 1),

-- Ecografía de Emergencia
(123, 'Sala de Ecografía de Emergencia', 'lab', 1, 'LAB-ECO-103', 'disponible', 1, 'Ultrasonido rápido en emergencias.', 1, 1),

-- Tomografía Computarizada de Emergencia
(124, 'Sala TAC de Emergencia', 'lab', 1, 'LAB-TAC-104', 'ocupado', 1, 'Tomógrafo para diagnóstico rápido en trauma.', 1, 1),

-- Pruebas de Laboratorio Clínico
(125, 'Laboratorio Clínico Central', 'lab', 2, 'LAB-CLI-201', 'ocupado', 10, 'Análisis de sangre, orina y bioquímica.', 0, 1),
(126, 'Laboratorio Clínico Secundario', 'lab', 2, 'LAB-CLI-202', 'disponible', 6, 'Soporte para análisis de guardia.', 0, 1),

-- Electrocardiograma (ECG)
(127, 'Sala de Electrocardiogramas', 'lab', 2, 'LAB-ECG-203', 'disponible', 2, 'Equipos para estudios de ritmo cardíaco.', 0, 1),

-- Pruebas de Función Pulmonar
(128, 'Sala de Espirometría', 'lab', 2, 'LAB-PUL-204', 'disponible', 2, 'Evaluación de la función respiratoria.', 0, 1),

-- Endoscopia Digestiva
(129, 'Sala de Endoscopia 1', 'lab', 2, 'LAB-END-205', 'ocupado', 2, 'Examen de tubo digestivo superior e inferior.', 1, 1),

-- Audiometría
(130, 'Sala de Audiometría', 'lab', 2, 'LAB-AUD-206', 'disponible', 1, 'Cabina insonorizada para exámenes auditivos.', 0, 1),

-- Examen Visual
(131, 'Sala de Exámenes Visuales', 'cons', 2, 'CONS-OFT-207', 'disponible', 1, 'Pruebas de visión y salud ocular.', 0, 1),

-- Pruebas de Alergia
(132, 'Sala de Pruebas de Alergia', 'cons', 2, 'CONS-ALR-208', 'ocupado', 2, 'Pruebas cutáneas y diagnósticos alérgicos.', 0, 1),

-- Radiología Quirúrgica
(133, 'Radiología Quirúrgica 1', 'lab', 3, 'LAB-RQ-301', 'ocupado', 1, 'Imagenología en quirófano.', 1, 1),

-- Tomografía Axial Computarizada (TAC)
(134, 'Sala TAC Central', 'lab', 1, 'LAB-TAC-105', 'disponible', 1, 'Tomógrafo multicorte de alta resolución.', 1, 1),

-- Resonancia Magnética (RM)
(135, 'Sala de Resonancia Magnética 1', 'lab', 1, 'LAB-RM-106', 'disponible', 1, 'Resonancia para neurología y ortopedia.', 1, 1),
(136, 'Sala de Resonancia Magnética 2', 'lab', 1, 'LAB-RM-107', 'ocupado', 1, 'Resonancia de cuerpo completo.', 1, 1),

-- Monitoreo Cardíaco
(137, 'Unidad de Monitoreo Cardíaco', 'hab', 3, 'HAB-MON-301', 'disponible', 4, 'Monitoreo continuo de pacientes críticos.', 1, 1),

-- Oxigenoterapia
(138, 'Sala de Oxigenoterapia', 'hab', 2, 'HAB-OXI-201', 'ocupado', 3, 'Aplicación terapéutica de oxígeno.', 1, 1),

-- Electroencefalograma (EEG)
(139, 'Sala EEG 1', 'lab', 3, 'LAB-EEG-302', 'disponible', 1, 'Estudios de actividad eléctrica cerebral.', 0, 1),

-- Mamografía
(140, 'Sala de Mamografía', 'lab', 1, 'LAB-MAM-108', 'ocupado', 1, 'Diagnóstico de cáncer de mama.', 0, 1),

-- Análisis de Sangre
(141, 'Sala de Extracciones de Sangre', 'lab', 2, 'LAB-SANG-209', 'disponible', 5, 'Extracción y procesamiento de muestras.', 0, 1),

-- Análisis de Orina
(142, 'Sala de Análisis de Orina', 'lab', 2, 'LAB-ORI-210', 'disponible', 2, 'Procesamiento de muestras de orina.', 0, 1),

-- Pruebas de Biología Molecular
(143, 'Laboratorio de Biología Molecular', 'lab', 2, 'LAB-BIO-211', 'ocupado', 3, 'PCR, genética y virología.', 1, 1),

-- Asesoría Farmacéutica
(144, 'Sala de Asesoría Farmacéutica', 'cons', 2, 'CONS-FAR-212', 'disponible', 1, 'Atención de pacientes sobre medicamentos.', 0, 1),

-- Biopsias Oncológicas
(145, 'Sala de Biopsias', 'lab', 3, 'LAB-BIOP-304', 'ocupado', 1, 'Obtención de muestras para análisis oncológico.', 1, 1),

-- Radioterapia
(146, 'Sala de Radioterapia 1', 'lab', 3, 'LAB-RADT-305', 'ocupado', 1, 'Tratamiento con radiación contra tumores.', 1, 1),
(147, 'Sala de Radioterapia 2', 'lab', 3, 'LAB-RADT-306', 'disponible', 1, 'Unidad de acelerador lineal.', 1, 1),

-- Exámenes Neonatales
(148, 'Sala de Exámenes Neonatales', 'lab', 2, 'LAB-NEO-213', 'disponible', 2, 'Pruebas metabólicas y cardíacas en neonatos.', 0, 1),

-- Ecografía Pediátrica
(149, 'Sala de Ecografía Pediátrica', 'lab', 2, 'LAB-ECO-214', 'ocupado', 1, 'Ecografía adaptada para niños.', 0, 1),

-- Ecografía Ginecológica
(150, 'Sala de Ecografía Ginecológica', 'lab', 2, 'LAB-ECO-215', 'disponible', 1, 'Ecografía transvaginal y obstétrica.', 0, 1),

-- Pruebas de Fertilidad
(151, 'Sala de Pruebas de Fertilidad', 'lab', 2, 'LAB-FER-216', 'disponible', 1, 'Estudios de fertilidad masculina y femenina.', 0, 1),

-- Dermatoscopia
(152, 'Sala de Dermatoscopia', 'cons', 2, 'CONS-DER-217', 'ocupado', 1, 'Estudio detallado de lesiones cutáneas.', 0, 1),

-- Pruebas de Alergia Dermatológica
(153, 'Sala de Pruebas de Alergia Dermatológica', 'cons', 2, 'CONS-DER-218', 'disponible', 1, 'Diagnóstico de dermatitis y eccemas.', 0, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.auth_permission: ~92 rows (aproximadamente)
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
	(85, 'Can add usuario x especialidad x servicio', 22, 'add_usuarioxespecialidadxservicio'),
	(86, 'Can change usuario x especialidad x servicio', 22, 'change_usuarioxespecialidadxservicio'),
	(87, 'Can delete usuario x especialidad x servicio', 22, 'delete_usuarioxespecialidadxservicio'),
	(88, 'Can view usuario x especialidad x servicio', 22, 'view_usuarioxespecialidadxservicio'),
	(89, 'Can add usuario x departamento x jornada', 23, 'add_usuarioxdepartamentoxjornada'),
	(90, 'Can change usuario x departamento x jornada', 23, 'change_usuarioxdepartamentoxjornada'),
	(91, 'Can delete usuario x departamento x jornada', 23, 'delete_usuarioxdepartamentoxjornada'),
	(92, 'Can view usuario x departamento x jornada', 23, 'view_usuarioxdepartamentoxjornada');

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

-- Volcando datos para la tabla hospitalbd.controlusuario_persona: ~5 rows (aproximadamente)
INSERT INTO `controlusuario_persona` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `dni`, `login_id`, `fecha_nacimiento`, `sexo`, `telefono`) VALUES
	(1, 'pbkdf2_sha256$870000$D1DqFyCxmmmd0kGrXXB71i$Rbniv0MvUamaY/zI5pHNawD2jO0wC41T8ssFFIE9i3Y=', '2025-09-02 16:52:43.447078', 1, 'Jose', 'Perez', 'jperez@gmail.com', 1, 1, '2025-08-30 22:00:42.000000', '37567897', '1000', '1992-05-10', 'M', '25160870'),
	(2, 'pbkdf2_sha256$870000$MnwVGdc7cQLi0NJ0W7jOao$aDs45KxmN72BhjZ155LX34aqgYxZS7DbsrNFXaMD9GQ=', '2025-09-02 16:54:14.339275', 0, 'Micaela', 'Lopez', 'micaela@gmail.com', 0, 1, '2025-08-29 23:03:06.608820', '37567333', '1005', '1997-04-04', 'F', '65360870'),
	(3, 'pbkdf2_sha256$870000$TdoMAxALrCJ7Azmza8ztNo$Pt7BEK+J02Ecxw4RJVU9OLW5fTsQSr+7+vv2TH626Xs=', '2025-09-02 18:04:19.454520', 0, 'Maximiliano', 'Acuña', 'maxi@gmail.com', 0, 1, '2025-08-29 23:06:20.423121', '45912425', 'maxi@gmail.com', '1995-06-29', 'M', '25154782'),
	(4, 'pbkdf2_sha256$870000$O4eqqvswjDXm2duMIAzFjX$7vBVzaNVcnyVOTLKQUa6djBiLc63RUy9P+cVevHeaus=', '2025-09-02 17:41:47.503259', 0, 'Horacio', 'Gutiérrez', 'horacio@gmail.com', 0, 1, '2025-08-29 23:12:37.713916', '37562422', '1006', '1990-01-01', 'M', '25160321'),
	(5, 'pbkdf2_sha256$870000$2v6tS56XrhvHbvkxYYVeNo$dL+0MFgS44K0n9O/XojF0hd1+zMge2Tc5gDLfo8nsRc=', '2025-09-01 00:06:26.038944', 0, 'Walter', 'White', 'walter@gmail.com', 0, 1, '2025-08-31 21:12:26.077275', '37567111', '1007', '1990-03-06', 'M', '21225465'),
	(6, '', NULL, 0, 'Lolo', 'Acuña', '', 0, 1, '2025-09-01 16:43:54.312381', '65321457', NULL, '2015-04-04', 'M', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.controlusuario_usuario: ~3 rows (aproximadamente)
INSERT INTO `controlusuario_usuario` (`id`, `numero_matricula`, `debe_cambiar_contraseña`, `persona_id`, `rol_id`) VALUES
	(4, NULL, 0, 1, 1),
	(5, '10010', 1, 2, 2),
	(6, '10015', 1, 4, 2),
	(7, '12000', 1, 5, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_admin_log: ~31 rows (aproximadamente)
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2025-08-30 22:01:43.696841', '1', 'Jose Perez (1000) - DNI: 37567897', 2, '[{"changed": {"fields": ["Email address", "Dni", "Fecha nacimiento", "Sexo", "Telefono"]}}]', 7, 1),
	(2, '2025-08-30 23:16:16.036356', '4', 'Usuario: 4 - Jose Perez - Legajo hospitalario: 1000', 1, '[{"added": {}}]', 8, 1),
	(3, '2025-08-30 23:16:29.444671', '5', 'Usuario: 5 - Micaela Lopez - Legajo hospitalario: 1005', 1, '[{"added": {}}]', 8, 1),
	(4, '2025-08-30 23:16:42.279922', '6', 'Usuario: 6 - Horacio Gutiérrez - Legajo hospitalario: 1006', 1, '[{"added": {}}]', 8, 1),
	(5, '2025-08-31 00:07:18.927461', '1', 'Paciente: 1 - Maximiliano Acuña - DNI: 45912425 - Email: maxi@gmail.com', 1, '[{"added": {}}]', 9, 1),
	(6, '2025-08-31 00:12:38.700932', '1', 'Usuario: Micaela Lopez - N° Legajo: 1005 - Especialidad: Dermatología - N° Matricula: 10010', 1, '[{"added": {}}]', 22, 1),
	(7, '2025-08-31 00:14:06.576947', '2', 'Usuario: Horacio Gutiérrez - N° Legajo: 1006 - Especialidad: Endocrinología - N° Matricula: 10015', 1, '[{"added": {}}]', 22, 1),
	(8, '2025-08-31 00:14:21.909433', '1', 'El usuario 5 trabaja los dias lunes en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 23, 1),
	(9, '2025-08-31 00:14:29.790530', '2', 'El usuario 5 trabaja los dias martes en el Departamento: Dermatología en el horario: dia', 1, '[{"added": {}}]', 23, 1),
	(10, '2025-08-31 00:14:41.476584', '3', 'El usuario 6 trabaja los dias viernes en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 23, 1),
	(11, '2025-08-31 18:13:55.652427', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 20, 1),
	(12, '2025-08-31 18:26:13.854743', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(13, '2025-08-31 19:37:39.277005', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(14, '2025-08-31 20:05:55.421101', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(15, '2025-08-31 20:21:26.834557', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(16, '2025-08-31 20:25:04.041211', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(17, '2025-08-31 20:37:19.810336', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(18, '2025-08-31 20:48:05.091798', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(19, '2025-08-31 20:59:45.742369', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(20, '2025-08-31 21:04:48.662120', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(21, '2025-08-31 21:06:21.014763', '1', 'ID turno: 1, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(22, '2025-08-31 21:07:45.251929', '1', 'ID turno: 1, Estado: atendido', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(23, '2025-08-31 21:13:17.513524', '3', 'Usuario: Walter White - N° Legajo: 1007 - Especialidad: Endocrinología - N° Matricula: 12000', 1, '[{"added": {}}]', 22, 1),
	(24, '2025-08-31 21:13:38.583235', '4', 'El usuario 7 trabaja los dias jueves en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 23, 1),
	(25, '2025-09-01 00:07:01.168143', '2', 'ID turno: 2, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno", "Estado"]}}]', 20, 1),
	(26, '2025-09-01 17:56:44.039707', '5', 'El usuario 6 trabaja los dias jueves en el Departamento: Consultas Externas (Consultorios) en el horario: dia', 1, '[{"added": {}}]', 23, 1),
	(27, '2025-09-01 17:58:34.380595', '6', 'El usuario 6 trabaja los dias lunes en el Departamento: Consultas Externas (Consultorios) en el horario: tarde', 1, '[{"added": {}}]', 23, 1),
	(28, '2025-09-01 18:16:57.916629', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Estado"]}}]', 20, 1),
	(29, '2025-09-01 19:22:56.115711', '3', 'ID turno: 3, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(30, '2025-09-02 16:54:21.416898', '3', 'ID turno: 3, Estado: atendido', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1),
	(31, '2025-09-02 17:41:26.869499', '4', 'ID turno: 4, Estado: pendiente', 2, '[{"changed": {"fields": ["Fecha turno"]}}]', 20, 1);

-- Volcando estructura para tabla hospitalbd.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_content_type: ~23 rows (aproximadamente)
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
	(19, 'hospital_personal', 'serviciodiagnostico'),
	(20, 'hospital_personal', 'turno'),
	(21, 'hospital_personal', 'turnoestudio'),
	(23, 'hospital_personal', 'usuarioxdepartamentoxjornada'),
	(22, 'hospital_personal', 'usuarioxespecialidadxservicio'),
	(5, 'sessions', 'session');

-- Volcando estructura para tabla hospitalbd.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_migrations: ~22 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2025-08-30 22:00:10.509804'),
	(2, 'contenttypes', '0002_remove_content_type_name', '2025-08-30 22:00:10.892688'),
	(3, 'auth', '0001_initial', '2025-08-30 22:00:11.835714'),
	(4, 'auth', '0002_alter_permission_name_max_length', '2025-08-30 22:00:12.023749'),
	(5, 'auth', '0003_alter_user_email_max_length', '2025-08-30 22:00:12.046715'),
	(6, 'auth', '0004_alter_user_username_opts', '2025-08-30 22:00:12.077665'),
	(7, 'auth', '0005_alter_user_last_login_null', '2025-08-30 22:00:12.111613'),
	(8, 'auth', '0006_require_contenttypes_0002', '2025-08-30 22:00:12.162532'),
	(9, 'auth', '0007_alter_validators_add_error_messages', '2025-08-30 22:00:12.181963'),
	(10, 'auth', '0008_alter_user_username_max_length', '2025-08-30 22:00:12.202932'),
	(11, 'auth', '0009_alter_user_last_name_max_length', '2025-08-30 22:00:12.250855'),
	(12, 'auth', '0010_alter_group_name_max_length', '2025-08-30 22:00:12.338718'),
	(13, 'auth', '0011_update_proxy_permissions', '2025-08-30 22:00:12.381650'),
	(14, 'auth', '0012_alter_user_first_name_max_length', '2025-08-30 22:00:12.400619'),
	(15, 'controlUsuario', '0001_initial', '2025-08-30 22:00:13.826539'),
	(16, 'admin', '0001_initial', '2025-08-30 22:00:14.267965'),
	(17, 'admin', '0002_logentry_remove_auto_add', '2025-08-30 22:00:14.295925'),
	(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-30 22:00:14.343848'),
	(19, 'hospital_pacientes', '0001_initial', '2025-08-30 22:00:15.096504'),
	(20, 'hospital_personal', '0001_initial', '2025-08-30 22:00:20.061967'),
	(21, 'sessions', '0001_initial', '2025-08-30 22:00:20.213314'),
	(22, 'hospital_personal', '0002_alter_consultas_diagnostico_and_more', '2025-08-31 20:47:43.522105'),
	(23, 'hospital_personal', '0003_turno_horario_turno', '2025-09-01 18:14:21.566985');

-- Volcando estructura para tabla hospitalbd.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.django_session: ~6 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('99fyu9420dl3ukh619p6dwnwr62r4u2w', '.eJxVjEEOwiAQRe_C2hAoYAeX7nsGMsyMUjU0Ke3KeHfbpAvdvvf-f6uE61LS2mROI6uLsur0yzLSU-ou-IH1Pmma6jKPWe-JPmzTw8Tyuh7t30HBVra1AZ8D2QgSM_XY-RjA2w6QgUCycQaIfX8z6K0LFM4bEucwonCwBtTnC9EQN2s:1usmSy:jdrDsD43dh65a-qq6SrjjGXiFHiJ6mRvMPeH0AsuLeE', '2025-09-14 18:07:48.870886'),
	('bcumjf5h8cysyb2luddio4u9r7crtm62', '.eJxVjEEOwiAQRe_C2hDKyNC6dO8ZyMCAVA0kpV0Z7y5NutDte-__t3C0rdltLS5uZnERIE6_zFN4xrILflC5VxlqWZfZyz2Rh23yVjm-rkf7d5Cp5b5OI-OIMBBqHwzTxJA8JoZJaXsG1KFzzdbHqEgTDajYgjEYekCGxOcL80M4Hw:1utVMh:_GFim4RdHR7upiuw_7Ho6air3NfgkvhAcQ8V2jiBhN4', '2025-09-16 18:04:19.465141'),
	('dv6i3nk7fmkgetzcugvh6sqvon2v7gtr', '.eJxVjEEOwiAQRe_C2hAoYAeX7nsGMsyMUjU0Ke3KeHfbpAvdvvf-f6uE61LS2mROI6uLsur0yzLSU-ou-IH1Pmma6jKPWe-JPmzTw8Tyuh7t30HBVra1AZ8D2QgSM_XY-RjA2w6QgUCycQaIfX8z6K0LFM4bEucwonCwBtTnC9EQN2s:1ut7c6:PZWCZgrN0eSqR6BwwZVxyJZ7ISfmlDjGcbbw9yhpDGQ', '2025-09-15 16:42:38.362733'),
	('f98e6tm2z1tx0n1y1e3e285sx7ubgl23', '.eJxVjEEOwiAQRe_C2hAoYAeX7nsGMsyMUjU0Ke3KeHfbpAvdvvf-f6uE61LS2mROI6uLsur0yzLSU-ou-IH1Pmma6jKPWe-JPmzTw8Tyuh7t30HBVra1AZ8D2QgSM_XY-RjA2w6QgUCycQaIfX8z6K0LFM4bEucwonCwBtTnC9EQN2s:1utUFP:nC8xRtNW0DAyA84eSW8koYHUHH2jrYcst1ITIIZM5Kc', '2025-09-16 16:52:43.456440'),
	('ge38bj6zzu9jff7ek9mm61wyksy4r65u', '.eJxVjEEOwiAQRe_C2hAoYAeX7nsGMsyMUjU0Ke3KeHfbpAvdvvf-f6uE61LS2mROI6uLsur0yzLSU-ou-IH1Pmma6jKPWe-JPmzTw8Tyuh7t30HBVra1AZ8D2QgSM_XY-RjA2w6QgUCycQaIfX8z6K0LFM4bEucwonCwBtTnC9EQN2s:1usTdP:X9Yr8_LK4vpxNcIyv3_VHX8ypq_Mm7dXOASB1-utqT4', '2025-09-13 22:01:19.986476'),
	('lt6pechahmvf90hr58lg7siy1dqvckjs', 'e30:1usVah:Z-vrjY_q0ZCRm6ksNFQN9Irn3iBy9K5FnPBI5G3EcJ4', '2025-09-14 00:06:39.027163');

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

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_menoracargodepaciente: ~1 rows (aproximadamente)
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

-- Volcando datos para la tabla hospitalbd.hospital_pacientes_paciente: ~1 rows (aproximadamente)
INSERT INTO `hospital_pacientes_paciente` (`id`, `direccion`, `persona_id`) VALUES
	(1, 'Calle Falsa 1234', 3),
	(2, '', 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_consultas: ~11 rows (aproximadamente)
INSERT INTO `hospital_personal_consultas` (`id`, `diagnostico`, `tratamiento`, `observaciones`, `fecha`, `turno_id`) VALUES
	(1, 'dfsdf', 'sdfsd', 'dsfsd', '2025-08-31 18:21:16.913997', 1),
	(2, 'ff', 'ff', 'fff', '2025-08-31 19:32:15.713713', 1),
	(3, 'aaaa', 'aaaa', 'aaaa', '2025-08-31 19:57:05.084005', 1),
	(4, 'qq', 'qqq', 'qqq', '2025-08-31 20:06:34.848953', 1),
	(5, 'ji', 'ji', 'ji', '2025-08-31 20:22:17.222907', 1),
	(6, 'ooo', 'ooo', 'oooo', '2025-08-31 20:29:12.082405', 1),
	(7, '', '', '', '2025-08-31 20:45:09.529301', 1),
	(8, 'wwwww', '', 'wwwww', '2025-08-31 20:49:15.065378', 1),
	(9, 'yu', '', 'yu', '2025-08-31 21:04:28.427569', 1),
	(10, 'pop', '', 'opop', '2025-08-31 21:06:02.413744', 1),
	(11, 'Dermatitis de contacto irritativaa', 'Retirar el agente desencadenante (cosmético, producto de higiene o químico sospechoso).\r\nHigiene suave del rostro con limpiadores sin fragancia ni alcohol.', 'Paciente refiere uso reciente de una nueva crema facial.', '2025-09-01 19:31:27.004422', 3),
	(12, 'jyj', '', 'jyj', '2025-09-02 18:03:08.892357', 4);

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
  PRIMARY KEY (`id`),
  KEY `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` (`servicio_diagnostico_id`),
  KEY `hospital_personal_es_especialidad_id_2069348a_fk_hospital_` (`especialidad_id`),
  CONSTRAINT `hospital_personal_es_especialidad_id_2069348a_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_es_servicio_diagnostico_06e305e5_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_estudiosdiagnosticos: ~270 rows (aproximadamente)
INSERT INTO `hospital_personal_estudiosdiagnosticos` (`id`, `nombre_estudio`, `especialidad_id`, `servicio_diagnostico_id`) VALUES
	(1, 'Radiografía de tórax de urgencia', 1, 1),
	(2, 'Radiografía de abdomen de urgencia', 1, 1),
	(3, 'Radiografía de pelvis', 1, 1),
	(4, 'Ecografía FAST', 1, 2),
	(5, 'Ecografía abdominal rápida', 1, 2),
	(6, 'Ecocardiografía rápida', 1, 2),
	(7, 'TAC de cráneo sin contraste', 1, 3),
	(8, 'TAC de tórax de emergencia', 1, 3),
	(9, 'TAC abdominal de urgencia', 1, 3),
	(10, 'TAC de columna cervical', 1, 3),
	(11, 'Radiografía de huesos largos', 2, 1),
	(12, 'Radiografía de columna cervical', 2, 1),
	(13, 'Radiografía de tórax post-trauma', 2, 1),
	(14, 'Ecografía FAST extendido', 2, 2),
	(15, 'Ecografía abdominal en trauma', 2, 2),
	(16, 'TAC de tórax politrauma', 2, 3),
	(17, 'TAC de abdomen politrauma', 2, 3),
	(18, 'TAC de cráneo trauma cerrado', 2, 3),
	(19, 'TAC de pelvis politrauma', 2, 3),
	(20, 'TAC cuerpo entero (Whole Body CT)', 2, 3),
	(21, 'Radiografía de tórax pediátrica', 25, 1),
	(22, 'Radiografía de huesos largos pediátricos', 25, 1),
	(23, 'Radiografía de abdomen pediátrico', 25, 1),
	(24, 'Ecografía abdominal pediátrica', 25, 2),
	(25, 'Ecografía cerebral neonatal', 25, 2),
	(26, 'Ecografía renal pediátrica', 25, 2),
	(27, 'TAC craneal pediátrico', 25, 3),
	(28, 'TAC de tórax pediátrico', 25, 3),
	(29, 'TAC abdominal pediátrico', 25, 3),
	(30, 'TAC de columna pediátrica', 25, 3),
	(31, 'Radiografía de tórax múltiples víctimas', 26, 1),
	(32, 'Radiografía de pelvis múltiples víctimas', 26, 1),
	(33, 'Radiografía de columna múltiples víctimas', 26, 1),
	(34, 'Ecografía FAST en desastre', 26, 2),
	(35, 'Ecografía abdominal rápida en desastre', 26, 2),
	(36, 'Ecografía cardiaca rápida en desastre', 26, 2),
	(37, 'TAC de cráneo en catástrofe', 26, 3),
	(38, 'TAC de tórax en catástrofe', 26, 3),
	(39, 'TAC de abdomen en catástrofe', 26, 3),
	(40, 'TAC cuerpo entero en catástrofe', 26, 3),
	(41, 'Hemograma completo', 3, 4),
	(42, 'Examen de orina completo', 3, 4),
	(43, 'Perfil lipídico', 3, 4),
	(44, 'Glucemia en ayunas', 3, 4),
	(45, 'Pruebas de función hepática', 3, 4),
	(46, 'Pruebas de función renal', 3, 4),
	(47, 'Electrocardiograma en reposo', 3, 5),
	(48, 'Examen visual básico', 3, 10),
	(49, 'Examen auditivo básico', 3, 9),
	(50, 'Prueba de alergia general', 3, 11),
	(51, 'Hemograma pediátrico', 4, 4),
	(52, 'Examen de orina pediátrico', 4, 4),
	(53, 'Perfil metabólico pediátrico', 4, 4),
	(54, 'Prueba neonatal de hipotiroidismo', 4, 29),
	(55, 'Ecografía abdominal pediátrica', 4, 30),
	(56, 'Ecografía cerebral pediátrica', 4, 30),
	(57, 'Examen auditivo neonatal', 4, 29),
	(58, 'Examen visual pediátrico', 4, 10),
	(59, 'Pruebas de alergia pediátricas', 4, 11),
	(60, 'Cultivo de orina pediátrico', 4, 4),
	(61, 'Ecografía ginecológica transvaginal', 5, 31),
	(62, 'Ecografía transabdominal', 5, 31),
	(63, 'Ecografía de control de folículos', 5, 31),
	(64, 'Perfil hormonal femenino', 5, 32),
	(65, 'Prueba de fertilidad básica', 5, 32),
	(66, 'Prueba de fertilidad avanzada', 5, 32),
	(67, 'Examen Papanicolaou', 5, 4),
	(68, 'Colposcopia', 5, 31),
	(69, 'Biopsia endometrial', 5, 4),
	(70, 'Examen de orina en embarazo', 5, 4),
	(71, 'Dermatoscopia de lunares', 6, 33),
	(72, 'Dermatoscopia de lesiones pigmentadas', 6, 33),
	(73, 'Pruebas de alergia dermatológica', 6, 34),
	(74, 'Prueba del parche (epicutánea)', 6, 34),
	(75, 'Biopsia de piel', 6, 33),
	(76, 'Cultivo micológico', 6, 34),
	(77, 'Examen bacteriológico de piel', 6, 34),
	(78, 'Dermatoscopia digital', 6, 33),
	(79, 'Examen capilar (tricograma)', 6, 34),
	(80, 'Examen de uñas (onicopatías)', 6, 34),
	(81, 'Electrocardiograma en reposo', 27, 5),
	(82, 'Electrocardiograma de esfuerzo', 27, 5),
	(83, 'Holter de 24 horas', 27, 5),
	(84, 'Prueba de esfuerzo ergométrica', 27, 5),
	(85, 'Ecocardiograma Doppler', 27, 6),
	(86, 'Ecocardiograma transtorácico', 27, 6),
	(87, 'Ecocardiograma transesofágico', 27, 6),
	(88, 'Prueba de función cardíaca basal', 27, 5),
	(89, 'Prueba de esfuerzo farmacológica', 27, 5),
	(90, 'Prueba de variabilidad cardíaca', 27, 5),
	(91, 'Espirometría simple', 28, 7),
	(92, 'Espirometría forzada', 28, 7),
	(93, 'Prueba broncodilatadora', 28, 7),
	(94, 'Prueba de difusión pulmonar', 28, 7),
	(95, 'Prueba de función pulmonar completa', 28, 7),
	(96, 'Prueba de resistencia de vías aéreas', 28, 7),
	(97, 'Test de marcha de 6 minutos', 28, 7),
	(98, 'Radiografía de tórax control', 28, 18),
	(99, 'TAC de tórax alta resolución', 28, 19),
	(100, 'Resonancia pulmonar', 28, 20),
	(101, 'Perfil tiroideo completo', 29, 23),
	(102, 'Prueba de TSH', 29, 23),
	(103, 'Prueba de T4 libre', 29, 23),
	(104, 'Prueba de T3', 29, 23),
	(105, 'Prueba de anticuerpos antitiroideos', 29, 23),
	(106, 'Perfil glucémico', 29, 23),
	(107, 'Prueba de tolerancia a la glucosa', 29, 23),
	(108, 'Prueba de insulina basal', 29, 23),
	(109, 'Prueba de hemoglobina glicosilada', 29, 23),
	(110, 'Perfil lipídico endocrinológico', 29, 23),
	(111, 'Examen de agudeza visual', 30, 10),
	(112, 'Campimetría visual', 30, 10),
	(113, 'Fondo de ojo', 30, 10),
	(114, 'Tonometría ocular', 30, 10),
	(115, 'Prueba de motilidad ocular', 30, 10),
	(116, 'Prueba de visión de colores', 30, 10),
	(117, 'Examen con lámpara de hendidura', 30, 10),
	(118, 'Retinografía', 30, 10),
	(119, 'OCT (Tomografía de coherencia óptica)', 30, 10),
	(120, 'Paquimetría corneal', 30, 10),
	(121, 'Audiometría tonal', 31, 9),
	(122, 'Audiometría impedanciométrica', 31, 9),
	(123, 'Videoendoscopía nasofaríngea', 31, 6),
	(124, 'Timpanometría', 31, 9),
	(125, 'Pruebas de equilibrio vestibular', 31, 9),
	(126, 'Examen de laringe con fibra óptica', 31, 6),
	(127, 'Otoemisiones acústicas', 31, 9),
	(128, 'Cultivo de exudado faríngeo', 31, 6),
	(129, 'Prueba de olfato', 31, 6),
	(130, 'TAC de senos paranasales', 31, 19),
	(131, 'Uroanálisis completo', 32, 24),
	(132, 'Ecografía renal y vesical', 32, 21),
	(133, 'Uro-TAC', 32, 19),
	(134, 'Cistoscopia', 32, 6),
	(135, 'Pruebas de función renal', 32, 4),
	(136, 'Uro-RM (Resonancia Magnética)', 32, 20),
	(137, 'Flujometría urinaria', 32, 24),
	(138, 'Estudio de próstata (PSA)', 32, 23),
	(139, 'Cultivo de orina', 32, 24),
	(140, 'Urografía intravenosa', 32, 19),
	(141, 'Perfil inflamatorio', 33, 4),
	(142, 'Factor reumatoide', 33, 4),
	(143, 'Anticuerpos anti-CCP', 33, 4),
	(144, 'Análisis de líquido sinovial', 33, 4),
	(145, 'Radiografía de articulaciones', 33, 18),
	(146, 'Resonancia magnética de articulaciones', 33, 20),
	(147, 'Ultrasonido musculoesquelético', 33, 21),
	(148, 'Densitometría ósea', 33, 18),
	(149, 'Pruebas HLA-B27', 33, 23),
	(150, 'Examen físico especializado en artritis', 33, 6),
	(151, 'Endoscopia digestiva alta', 34, 8),
	(152, 'Colonoscopia', 34, 8),
	(153, 'Ecografía abdominal', 34, 21),
	(154, 'TAC abdominal', 34, 19),
	(155, 'Pruebas de función hepática', 34, 4),
	(156, 'Test de Helicobacter pylori', 34, 24),
	(157, 'Biopsia gastrointestinal', 34, 27),
	(158, 'Resonancia magnética abdominal', 34, 20),
	(159, 'Fibroscan hepático', 34, 20),
	(160, 'pHmetría esofágica', 34, 7),
	(161, 'Electroencefalograma (EEG)', 35, 17),
	(162, 'Potenciales evocados', 35, 17),
	(163, 'TAC craneal', 35, 19),
	(164, 'RM cerebral', 35, 20),
	(165, 'Estudio de conducción nerviosa', 35, 17),
	(166, 'Electromiografía (EMG)', 35, 17),
	(167, 'Monitorización ambulatoria de EEG', 35, 17),
	(168, 'Examen neurológico completo', 35, 6),
	(169, 'Líquido cefalorraquídeo', 35, 23),
	(170, 'Ecografía Doppler de vasos cerebrales', 35, 6),
	(171, 'Radiografía preoperatoria', 7, 12),
	(172, 'TAC abdominal preoperatorio', 7, 19),
	(173, 'RM de órganos internos', 7, 20),
	(174, 'Ecografía preoperatoria', 7, 21),
	(175, 'Marcadores tumorales', 7, 23),
	(176, 'Examen de laboratorio prequirúrgico', 7, 4),
	(177, 'Electrocardiograma prequirúrgico', 7, 5),
	(178, 'Prueba de función pulmonar', 7, 7),
	(179, 'Biopsia de tejidos', 7, 27),
	(180, 'Resonancia o TAC de planificación quirúrgica', 7, 20),
	(181, 'Biopsia tumoral', 8, 27),
	(182, 'Marcadores tumorales', 8, 23),
	(183, 'TAC prequirúrgico de tumor', 8, 19),
	(184, 'RM prequirúrgica de tumor', 8, 20),
	(185, 'PET-CT', 8, 19),
	(186, 'Ecografía abdominal en cáncer', 8, 21),
	(187, 'Radiografía de tórax en oncología', 8, 18),
	(188, 'Pruebas hematológicas', 8, 4),
	(189, 'Endoscopia oncológica', 8, 8),
	(190, 'Estudios de función hepática y renal', 8, 4),
	(191, 'Doppler arterial', 9, 21),
	(192, 'Doppler venoso', 9, 21),
	(193, 'Angiografía por TAC', 9, 19),
	(194, 'Angiografía por RM', 9, 20),
	(195, 'Ecografía vascular', 9, 21),
	(196, 'Pruebas de coagulación', 9, 4),
	(197, 'Examen físico vascular', 9, 6),
	(198, 'TAC de vasos periféricos', 9, 19),
	(199, 'RM de vasos periféricos', 9, 20),
	(200, 'Estudio de perfusión tisular', 9, 21),
	(201, 'Radiografía de tórax preoperatoria', 36, 18),
	(202, 'TAC torácico', 36, 19),
	(203, 'RM torácica', 36, 20),
	(204, 'Broncoscopia diagnóstica', 36, 8),
	(205, 'Pruebas de función pulmonar', 36, 7),
	(206, 'Ecografía torácica', 36, 21),
	(207, 'Marcadores tumorales pulmonares', 36, 23),
	(208, 'Gammagrafía pulmonar', 36, 19),
	(209, 'Examen preoperatorio general', 36, 4),
	(210, 'Biopsia pulmonar', 36, 27),
	(211, 'Evaluación prequirúrgica de piel', 37, 6),
	(212, 'Fotografía médica preoperatoria', 37, 6),
	(213, 'Ecografía de tejidos blandos', 37, 21),
	(214, 'Biopsia cutánea', 37, 27),
	(215, 'Laboratorio preoperatorio', 37, 4),
	(216, 'Evaluación de coagulación', 37, 4),
	(217, 'TAC de área quirúrgica', 37, 19),
	(218, 'RM de área quirúrgica', 37, 20),
	(219, 'Evaluación vascular de colgajos', 37, 21),
	(220, 'Estudio de función respiratoria', 37, 7),
	(221, 'Radiografía de articulaciones', 38, 18),
	(222, 'TAC de fracturas complejas', 38, 19),
	(223, 'RM de articulaciones', 38, 20),
	(224, 'Densitometría ósea', 38, 18),
	(225, 'Ultrasonido musculoesquelético', 38, 21),
	(226, 'Estudios de laboratorio prequirúrgicos', 38, 4),
	(227, 'Electrocardiograma preoperatorio', 38, 5),
	(228, 'Pruebas de función pulmonar', 38, 7),
	(229, 'Biopsia ósea', 38, 27),
	(230, 'Evaluación física ortopédica completa', 38, 6),
	(231, 'Monitoreo hemodinámico', 10, 15),
	(232, 'Gasometría arterial', 10, 23),
	(233, 'Electrocardiograma continuo', 10, 5),
	(234, 'Radiografía de tórax de UCI', 10, 18),
	(235, 'Ecografía abdominal en UCI', 10, 21),
	(236, 'TAC urgente en UCI', 10, 19),
	(237, 'Resonancia magnética urgente', 10, 20),
	(238, 'Laboratorio clínico completo', 10, 4),
	(239, 'Monitoreo de presión intracraneal', 10, 15),
	(240, 'Pruebas de función renal y hepática', 10, 4),
	(241, 'Evaluación preanestésica', 11, 6),
	(242, 'Monitoreo intraoperatorio', 11, 15),
	(243, 'Gasometría arterial', 11, 23),
	(244, 'Electrocardiograma preanestésico', 11, 5),
	(245, 'Pruebas de coagulación', 11, 4),
	(246, 'Ecografía para bloqueos nerviosos', 11, 21),
	(247, 'Monitoreo de oxigenación y ventilación', 11, 15),
	(248, 'Evaluación respiratoria preoperatoria', 11, 7),
	(249, 'Laboratorio preoperatorio', 11, 4),
	(250, 'Pruebas de función hepática y renal', 11, 4),
	(251, 'Monitorización neurológica', 39, 17),
	(252, 'Electroencefalograma en pacientes críticos', 39, 17),
	(253, 'TAC de cráneo urgente', 39, 19),
	(254, 'RM cerebral urgente', 39, 20),
	(255, 'Evaluación laboratorio neurocrítico', 39, 4),
	(256, 'Monitoreo de presión intracraneal', 39, 15),
	(257, 'Gasometría arterial', 39, 23),
	(258, 'Evaluación neurológica completa', 39, 6),
	(259, 'Ultrasonido transcraneal', 39, 21),
	(260, 'Ecografía Doppler cerebral', 39, 21),
	(261, 'Evaluación clínica paliativa', 40, 6),
	(262, 'Monitoreo de signos vitales', 40, 15),
	(263, 'Laboratorio básico', 40, 4),
	(264, 'Pruebas de función renal y hepática', 40, 4),
	(265, 'Electrocardiograma', 40, 5),
	(266, 'Evaluación del dolor', 40, 6),
	(267, 'Exámenes de imagen según necesidad', 40, 18),
	(268, 'Evaluación nutricional', 40, 4),
	(269, 'Pruebas de coagulación', 40, 4),
	(270, 'Ultrasonido general', 40, 21);
	


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
  `tiempo_uso` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consulta_id` bigint NOT NULL,
  `recetada_por_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_me_consulta_id_be122a02_fk_hospital_` (`consulta_id`),
  KEY `hospital_personal_me_recetada_por_id_4712be69_fk_controlUs` (`recetada_por_id`),
  CONSTRAINT `hospital_personal_me_consulta_id_be122a02_fk_hospital_` FOREIGN KEY (`consulta_id`) REFERENCES `hospital_personal_consultas` (`id`),
  CONSTRAINT `hospital_personal_me_recetada_por_id_4712be69_fk_controlUs` FOREIGN KEY (`recetada_por_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_medicaciones: ~12 rows (aproximadamente)
INSERT INTO `hospital_personal_medicaciones` (`id`, `medicamento`, `dosis`, `frecuencia`, `tiempo_uso`, `consulta_id`, `recetada_por_id`) VALUES
	(1, 'Levotiroxina sódica', '25 mcg', '1 vez al día, en ayunas', 'Hasta nuevo control', 1, 6),
	(2, 'Levotiroxina sódicaa', '255 mcg', '1 vez al día, en ayunas', 'Hasta nuevo control', 2, 6),
	(3, 'Levotiroxina sódicad', '50 mcg', 'Una vez al día, por la mañana en ayunas', 'Hasta nuevo control', 3, 6),
	(4, 'Levotiroxina sódicaeee', 'eee', 'eeee', 'eeee', 4, 6),
	(5, 'ji', 'ji', 'ji', 'ji', 5, 6),
	(6, 'jii', 'jii', 'jii', 'jii', 5, 6),
	(7, 'sdsd', 'sdasdsa', 'dasd', 'sadsadsad', 7, 6),
	(8, 'www', '', '', '', 8, 6),
	(9, 'yu', 'yuyu', 'yuyu', 'yuy', 9, 6),
	(10, 'opop', 'opop', 'opop', 'opop', 10, 6),
	(11, 'Hidrocortisona 1% crema', 'Aplicar capa fina', '2 veces al día', '5 a 7 días (no exceder 10)', 11, 5),
	(13, 'Loratadina 10 mg', '1 comprimido', '1 vez al día', '5 días o según síntomas', 11, 5);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_ordenestudio: ~11 rows (aproximadamente)
INSERT INTO `hospital_personal_ordenestudio` (`id`, `motivo_estudio`, `indicaciones`, `fecha_solicitud`, `estado`, `consulta_id`, `solicitado_por_id`, `tipo_estudio_id`) VALUES
	(1, 'fff', 'fff', '2025-08-31 19:32:15.772620', 'pendiente', 2, 6, 102),
	(2, 'aaaa', 'aaaaa', '2025-08-31 19:57:05.103278', 'pendiente', 3, 6, 103),
	(3, 'qqqq', 'qqqq', '2025-08-31 20:06:34.905859', 'pendiente', 4, 6, 106),
	(4, 'ji', 'ji', '2025-08-31 20:22:17.261845', 'pendiente', 5, 6, 110),
	(5, 'ij', 'ji', '2025-08-31 20:22:17.281767', 'pendiente', 5, 6, 109),
	(6, 'dsdsad', 'sadsad', '2025-08-31 20:45:09.540809', 'pendiente', 7, 6, 104),
	(7, 'dsfds', '', '2025-08-31 20:49:15.086345', 'pendiente', 8, 6, 101),
	(8, 'yuyu', 'yuyu', '2025-08-31 21:04:28.443466', 'pendiente', 9, 6, 101),
	(9, 'opop', 'opopo', '2025-08-31 21:06:02.430838', 'pendiente', 10, 6, 101),
	(10, 'jyj', 'jyjy', '2025-09-02 18:03:08.906142', 'pendiente', 12, 6, 103),
	(11, 'yjy', 'jyjy', '2025-09-02 18:03:08.930315', 'pendiente', 12, 6, 104);

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
  `horario_turno` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_personal_tu_especialidad_id_8f04877d_fk_hospital_` (`especialidad_id`),
  KEY `hospital_personal_tu_paciente_id_2db2a483_fk_hospital_` (`paciente_id`),
  KEY `hospital_personal_tu_profesional_id_d103668c_fk_controlUs` (`profesional_id`),
  CONSTRAINT `hospital_personal_tu_especialidad_id_8f04877d_fk_hospital_` FOREIGN KEY (`especialidad_id`) REFERENCES `hospital_personal_especialidades` (`id`),
  CONSTRAINT `hospital_personal_tu_paciente_id_2db2a483_fk_hospital_` FOREIGN KEY (`paciente_id`) REFERENCES `hospital_pacientes_paciente` (`id`),
  CONSTRAINT `hospital_personal_tu_profesional_id_d103668c_fk_controlUs` FOREIGN KEY (`profesional_id`) REFERENCES `controlusuario_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_turno: ~5 rows (aproximadamente)
INSERT INTO `hospital_personal_turno` (`id`, `fecha_creacion`, `fecha_turno`, `estado`, `motivo`, `asistio`, `especialidad_id`, `paciente_id`, `profesional_id`, `horario_turno`) VALUES
	(1, '2025-08-31 00:17:10.417348', '2025-08-31', 'atendido', 'Caida de cabello, bla bla', 1, 29, 1, 6, 'dia'),
	(2, '2025-09-01 19:21:21.435805', '2025-09-04', 'pendiente', 'je', 0, 29, 1, 7, 'dia'),
	(3, '2025-09-01 19:15:10.260046', '2025-09-02', 'atendido', 'Sarpullido en el rostro', 1, 6, 2, 5, 'dia'),
	(4, '2025-09-01 18:36:07.295169', '2025-09-02', 'atendido', 'JEje', 1, 29, 2, 6, 'tarde'),
	(5, '2025-09-02 17:40:54.414519', '2025-09-08', 'cancelado', 'ss', 0, 29, 2, 6, 'tarde');

-- Volcando estructura para tabla hospitalbd.hospital_personal_turnoestudio
CREATE TABLE IF NOT EXISTS `hospital_personal_turnoestudio` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_turno` date NOT NULL,
  `lugar` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `orden_id` bigint NOT NULL,
  `servicio_diagnostico_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orden_id` (`orden_id`),
  UNIQUE KEY `servicio_diagnostico_id` (`servicio_diagnostico_id`),
  CONSTRAINT `hospital_personal_tu_orden_id_dca8a0c5_fk_hospital_` FOREIGN KEY (`orden_id`) REFERENCES `hospital_personal_ordenestudio` (`id`),
  CONSTRAINT `hospital_personal_tu_servicio_diagnostico_a0645368_fk_hospital_` FOREIGN KEY (`servicio_diagnostico_id`) REFERENCES `hospital_personal_serviciodiagnostico` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxdepartamentoxjornada: ~6 rows (aproximadamente)
INSERT INTO `hospital_personal_usuarioxdepartamentoxjornada` (`id`, `departamento_id`, `jornada_id`, `usuario_id`) VALUES
	(1, 11, 1, 5),
	(2, 11, 2, 5),
	(3, 2, 5, 6),
	(4, 2, 4, 7),
	(5, 2, 4, 6),
	(6, 2, 8, 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla hospitalbd.hospital_personal_usuarioxespecialidadxservicio: ~2 rows (aproximadamente)
INSERT INTO `hospital_personal_usuarioxespecialidadxservicio` (`id`, `nombre_profesion`, `especialidad_id`, `servicio_diagnostico_id`, `usuario_id`) VALUES
	(1, 'Dermatólogo', 6, NULL, 5),
	(2, 'Endocrinólogo', 29, NULL, 6),
	(3, 'Endocrinólogo', 29, NULL, 7);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
