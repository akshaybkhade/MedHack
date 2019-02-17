-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 16, 2019 at 07:49 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medhack`
--

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
CREATE TABLE IF NOT EXISTS `diseases` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `disease_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `disease_name`) VALUES
(1, 'Fever'),
(2, 'Headache'),
(3, 'Tuberculosis'),
(4, 'Typhoid'),
(5, 'Dengue'),
(6, 'Malaria'),
(7, 'Cancer'),
(8, 'OCD'),
(9, 'Whooping Cough'),
(10, 'Alzheimer\'s'),
(11, 'Diabetes'),
(12, 'Depression');

-- --------------------------------------------------------

--
-- Table structure for table `disease_symptom`
--

DROP TABLE IF EXISTS `disease_symptom`;
CREATE TABLE IF NOT EXISTS `disease_symptom` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `disease_id` int(10) NOT NULL,
  `symptom_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `disease_id_fk` (`disease_id`),
  KEY `symptom_id_fk` (`symptom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `disease_symptom`
--

INSERT INTO `disease_symptom` (`id`, `disease_id`, `symptom_id`) VALUES
(1, 3, 36),
(2, 9, 36),
(3, 10, 54),
(4, 10, 106),
(5, 10, 163),
(6, 12, 180),
(7, 12, 188);

-- --------------------------------------------------------

--
-- Table structure for table `genericscategories`
--

DROP TABLE IF EXISTS `genericscategories`;
CREATE TABLE IF NOT EXISTS `genericscategories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genericscategories`
--

INSERT INTO `genericscategories` (`id`, `description`) VALUES
(69, 'Sea lettuce gumbo grape kale kombu cauliflower salsify kohlrabi okra garlic.'),
(70, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(71, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(72, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(73, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(74, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(75, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(76, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(77, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(78, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(79, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(80, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(81, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(82, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(83, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(84, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(85, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(86, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(87, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(88, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(89, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(90, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(91, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(92, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(93, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(94, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(95, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(96, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(97, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(98, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(99, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(100, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(101, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(102, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(103, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(104, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(105, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(106, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(107, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(108, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(109, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(110, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(111, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(112, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(113, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(114, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(115, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(116, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.'),
(117, 'Sea lettuce water spinach gram fava bean leek dandelion silver beet eggplant bush tomato.');

-- --------------------------------------------------------

--
-- Table structure for table `medicine_details`
--

DROP TABLE IF EXISTS `medicine_details`;
CREATE TABLE IF NOT EXISTS `medicine_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(255) NOT NULL,
  `composition` varchar(255) DEFAULT NULL,
  `generic_category_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKGenericCategory` (`generic_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine_details`
--

INSERT INTO `medicine_details` (`id`, `medicine_name`, `composition`, `generic_category_id`) VALUES
(1, 'CROCIN 100MG DROP', NULL, 69),
(2, 'CROCIN 125 MG SUSPENSION', NULL, 69),
(3, 'Paracetamol', NULL, 69),
(4, 'Caffeine', NULL, 69),
(5, 'CROCIN PAIN RELIEF TABLET', NULL, 69),
(6, 'CROCIN DS SUSPENSION', NULL, 69),
(7, 'CROCIN COLD & FLU MAX TABLET', NULL, 69),
(8, 'Phenylephrine', NULL, 69),
(9, 'TOPINATE 0.05% CREAM', NULL, 70),
(10, 'Clobetasol Topical', NULL, 70),
(11, 'CLOP 0.05% W/W CREAM', NULL, 70),
(12, 'TENOVATE 0.05% OINTMENT', NULL, 70),
(13, 'CLOP E CREAM', NULL, 70),
(14, 'CUTISOFT 1% W/W CREAM', NULL, 71),
(15, 'Hydrocortisone', NULL, 71),
(16, 'Topical', NULL, 71),
(17, 'CLOP 0.05% W/W CREAM', NULL, 70),
(18, 'ENTOFOAM 2 GM INHALER', NULL, 71),
(19, 'FLUTIVATE 0.05% W/W OINTMENT', NULL, 72),
(20, 'Fluticasone (topical)', NULL, 72),
(21, 'FLOMON 0.1%W/V EYE DROP', NULL, 73),
(22, 'Fluorometholone', NULL, 73),
(23, 'DEDEP 20MG TABLET', NULL, 74),
(24, 'Fluoxetine', NULL, 74),
(25, 'OCOVATE 0.05% CREAM', NULL, 70),
(26, 'SUPRAVATE 0.05% CREAM', NULL, 70),
(27, 'CVATE 0.05% CREAM', NULL, 70),
(28, 'KLOSOFT 0.05% CREAM', NULL, 70),
(29, 'ZIFI', NULL, 75),
(30, 'cefixime', NULL, 75),
(31, 'Cipla (Oncocare)', NULL, 76),
(32, 'DAUNOTEC', NULL, 76),
(33, 'ACINIL', NULL, 77),
(34, 'Citdel', NULL, 77),
(35, 'OMEE', NULL, 78),
(36, 'omeprazole', NULL, 78),
(37, 'AVOMINE', NULL, 79),
(38, 'promethazine', NULL, 79),
(39, 'GRILINCTUS-BM', NULL, 80),
(40, 'terbutaline', NULL, 80),
(41, 'ESGIPYRIN', NULL, 69),
(42, 'diclofenac', NULL, 69),
(43, 'COMBIFLAM', NULL, 69),
(44, 'ibuprofen', NULL, 69),
(45, 'GLUCOFIT', NULL, 81),
(46, 'gliclazide', NULL, 81);

-- --------------------------------------------------------

--
-- Table structure for table `medicine_symptom`
--

DROP TABLE IF EXISTS `medicine_symptom`;
CREATE TABLE IF NOT EXISTS `medicine_symptom` (
  `medicine_id` int(10) NOT NULL AUTO_INCREMENT,
  `id` int(10) NOT NULL,
  `symptom_id` int(10) NOT NULL,
  PRIMARY KEY (`medicine_id`),
  KEY `FKMedicineId` (`id`),
  KEY `FKSymptomId` (`symptom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

DROP TABLE IF EXISTS `symptoms`;
CREATE TABLE IF NOT EXISTS `symptoms` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `symptom_name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`Id`, `symptom_name`) VALUES
(3, 'Abdominal guarding'),
(4, 'Abdominal pain'),
(5, 'Abdominal pain associated with menstruation'),
(6, 'Absence of a pulse'),
(7, 'Aggressiveness'),
(8, 'Agitation'),
(9, 'Ankle deformity'),
(10, 'Ankle swelling'),
(11, 'Anxiety'),
(12, 'Arm swelling'),
(13, 'Back deformity'),
(14, 'Back pain'),
(15, 'Black stools'),
(16, 'Blackhead'),
(17, 'Bleeding from vagina'),
(18, 'Bleeding in the conjunctiva of the eye'),
(19, 'Bloated feeling in the stomach'),
(20, 'Blood in stool'),
(21, 'Bloody cough'),
(22, 'Blue colored skin'),
(23, 'Blue spot on skin'),
(24, 'Blurred vision'),
(25, 'Bold area among hair on the head'),
(26, 'Bone fracture'),
(27, 'Breathing-related pains'),
(28, 'Brittleness of nails'),
(29, 'Bulging abdominal wall'),
(30, 'Burning eyes'),
(31, 'Burning in the throat'),
(32, 'Burning nose'),
(33, 'Burning sensation when urinating'),
(34, 'Changes in the nails'),
(35, 'Cheek swelling'),
(36, 'Chest pain'),
(37, 'Chest tightness'),
(38, 'Chills'),
(39, 'Coarsening of the skin structure'),
(40, 'Cold feet'),
(41, 'Cold hands'),
(42, 'Cold sweats'),
(43, 'Cough'),
(44, 'Cough with sputum'),
(45, 'Cramps'),
(46, 'Cravings'),
(47, 'Crusting'),
(48, 'Curvature of the spine'),
(49, 'Dark urine'),
(50, 'Decreased urine stream'),
(51, 'Delayed start to urination'),
(52, 'Diarrhea'),
(53, 'Difficult defecation'),
(54, 'Difficulty in finding words'),
(55, 'Difficulty in speaking'),
(56, 'Difficulty in swallowing'),
(57, 'Difficulty to concentrate'),
(58, 'Difficulty with movement'),
(59, 'Discoloration of nails'),
(60, 'Disorientation regarding time or place'),
(61, 'Distended abdomen'),
(62, 'Dizziness'),
(63, 'Double vision'),
(64, 'Double vision, acute-onset'),
(65, 'Dribbling after urination'),
(66, 'Drooping eyelid'),
(67, 'Dry eyes'),
(68, 'Dry mouth'),
(69, 'Dry skin'),
(70, 'Earache'),
(71, 'Early satiety'),
(72, 'Eye blinking'),
(73, 'Eye lid swelling'),
(74, 'Eye lids sticking together'),
(75, 'Eye pain'),
(76, 'Eye redness'),
(77, 'Face pain'),
(78, 'Facial paralysis'),
(79, 'Facial swelling'),
(80, 'Fast, deepened breathing'),
(81, 'Fatty defecation'),
(82, 'Feeling faint'),
(83, 'Feeling of foreign body in the eye'),
(84, 'Feeling of pressure in the ear'),
(85, 'Feeling of residual urine'),
(86, 'Feeling of tension in the legs'),
(87, 'Fever'),
(88, 'Finger deformity'),
(89, 'Flaking skin'),
(90, 'Flaking skin on the head'),
(91, 'Flatulence'),
(92, 'Foot pain'),
(93, 'Foot swelling'),
(94, 'Forgetfulness'),
(95, 'Formation of blisters on a skin area'),
(96, 'Foul smelling defecation'),
(97, 'Frequent urination'),
(98, 'Genital warts'),
(99, 'Going black before the eyes'),
(100, 'Hair loss'),
(101, 'Hallucination'),
(102, 'Halo'),
(103, 'Hand swelling'),
(104, 'Hard defecation'),
(105, 'Hardening of the skin'),
(106, 'Headache'),
(107, 'Hearing loss'),
(108, 'Heart murmur'),
(109, 'Heartburn'),
(110, 'Hiccups'),
(111, 'Hip deformity'),
(112, 'Hip pain'),
(113, 'Hoarseness'),
(114, 'Hot flushes'),
(115, 'Immobilization'),
(116, 'Impaired balance'),
(117, 'Impaired hearing'),
(118, 'Impaired light-dark adaptation'),
(119, 'Impairment of male potency'),
(120, 'Incomplete defecation'),
(121, 'Increased appetite'),
(122, 'Increased drive'),
(123, 'Increased salivation'),
(124, 'Increased thirst'),
(125, 'Increased touch sensitivity'),
(126, 'Increased urine quantity'),
(127, 'Involuntary movements'),
(128, 'Irregular heartbeat'),
(129, 'Irregular mole'),
(130, 'Itching eyes'),
(131, 'Itching in the ear'),
(132, 'Itching in the mouth or throat'),
(133, 'Itching in the nose'),
(134, 'Itching of skin'),
(135, 'Itching of the anus'),
(136, 'Itching on head'),
(137, 'Itching or burning in the genital area'),
(138, 'Joint effusion'),
(139, 'Joint instability'),
(140, 'Joint pain'),
(141, 'Joint redness'),
(142, 'Joint swelling'),
(143, 'Joylessness'),
(144, 'Knee deformity'),
(145, 'Knee pain'),
(146, 'Leg cramps'),
(147, 'Leg swelling'),
(148, 'Leg ulcer'),
(149, 'Less than 3 defecations per week'),
(150, 'Limited mobility of the ankle'),
(151, 'Limited mobility of the back'),
(152, 'Limited mobility of the fingers'),
(153, 'Limited mobility of the hip'),
(154, 'Limited mobility of the leg'),
(155, 'Lip swelling'),
(156, 'Lockjaw'),
(157, 'Loss of eye lashes'),
(158, 'Lower abdominal pain'),
(159, 'Lower-back pain'),
(160, 'Lump in the breast'),
(161, 'Malposition of the testicles'),
(162, 'Marked veins'),
(163, 'Memory gap'),
(164, 'Menstruation disorder'),
(165, 'Missed period'),
(166, 'Moist and softened skin'),
(167, 'Mood swings'),
(168, 'Morning stiffness'),
(169, 'Mouth pain'),
(170, 'Mouth ulcers'),
(171, 'Muscle pain'),
(172, 'Muscle stiffness'),
(173, 'Muscle weakness'),
(174, 'Muscular atrophy in the leg'),
(175, 'Muscular atrophy of the arm'),
(176, 'Muscular weakness in the arm'),
(177, 'Muscular weakness in the leg'),
(178, 'Nausea'),
(179, 'Neck pain'),
(180, 'Nervousness'),
(181, 'Night cough'),
(182, 'Non-healing skin wound'),
(183, 'Nosebleed'),
(184, 'Numbness in the arm'),
(185, 'Numbness in the leg'),
(186, 'Numbness of the hands'),
(187, 'Oversensitivity to light'),
(188, 'Overweight'),
(189, 'Pain in the bones'),
(190, 'Pain in the calves'),
(191, 'Pain in the limbs'),
(192, 'Pain of the anus'),
(193, 'Pain on swallowing'),
(194, 'Pain radiating to the arm'),
(195, 'Pain radiating to the leg'),
(196, 'Pain when chewing'),
(197, 'Painful defecation'),
(198, 'Painful urination'),
(199, 'Pallor'),
(200, 'Palpitations'),
(201, 'Paralysis');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disease_symptom`
--
ALTER TABLE `disease_symptom`
  ADD CONSTRAINT `disease_id_fk` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `symptom_id_fk` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicine_details`
--
ALTER TABLE `medicine_details`
  ADD CONSTRAINT `FKGenericCategory` FOREIGN KEY (`generic_category_id`) REFERENCES `genericscategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medicine_symptom`
--
ALTER TABLE `medicine_symptom`
  ADD CONSTRAINT `FKMedicineId` FOREIGN KEY (`id`) REFERENCES `medicine_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKSymptomId` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
