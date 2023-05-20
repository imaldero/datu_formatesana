-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.32 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for datu_formatesana
CREATE DATABASE IF NOT EXISTS `datu_formatesana` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `datu_formatesana`;

-- Dumping structure for table datu_formatesana.date
CREATE TABLE IF NOT EXISTS `date` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB AUTO_INCREMENT=3560 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.date: ~0 rows (approximately)
INSERT INTO `date` (`id`, `date`) VALUES
	(3479, '2023-04-18');

-- Dumping structure for table datu_formatesana.lamp_color
CREATE TABLE IF NOT EXISTS `lamp_color` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `color` (`color`)
) ENGINE=InnoDB AUTO_INCREMENT=805 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.lamp_color: ~0 rows (approximately)
INSERT INTO `lamp_color` (`id`, `color`) VALUES
	(733, 'A'),
	(741, 'G'),
	(724, 'R');

-- Dumping structure for table datu_formatesana.lamp_dati
CREATE TABLE IF NOT EXISTS `lamp_dati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `direct_id` int NOT NULL,
  `color_id` int NOT NULL,
  `lamp` int NOT NULL,
  `line` varchar(1) COLLATE utf8mb4_general_ci NOT NULL,
  `power_id` int NOT NULL,
  `ref1_id` int NOT NULL,
  `obj_id` int NOT NULL COMMENT 'Objekta IP',
  `date_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_rows` (`type_id`,`direct_id`,`color_id`,`lamp`,`line`,`power_id`,`ref1_id`,`obj_id`,`date_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.lamp_dati: ~50 rows (approximately)
INSERT INTO `lamp_dati` (`id`, `type_id`, `direct_id`, `color_id`, `lamp`, `line`, `power_id`, `ref1_id`, `obj_id`, `date_id`) VALUES
	(1261, 1, 721, 724, 1, '', 722, 721, 3489, 3479),
	(1274, 1, 721, 724, 1, 'L', 724, 721, 3489, 3479),
	(1284, 1, 721, 741, 1, '', 727, 721, 3489, 3479),
	(1266, 1, 724, 724, 1, '', 727, 727, 3489, 3479),
	(1275, 1, 724, 724, 1, 'L', 724, 721, 3489, 3479),
	(1285, 1, 724, 741, 1, '', 725, 727, 3489, 3479),
	(1267, 1, 726, 724, 1, '', 727, 729, 3489, 3479),
	(1280, 1, 726, 724, 1, 'L', 724, 721, 3489, 3479),
	(1286, 1, 726, 741, 1, '', 742, 727, 3489, 3479),
	(1260, 2, 721, 724, 1, '', 721, 721, 3489, 3479),
	(1269, 2, 721, 724, 1, 'L', 724, 721, 3489, 3479),
	(1268, 2, 721, 733, 1, '', 726, 721, 3489, 3479),
	(1277, 2, 721, 741, 1, '', 738, 721, 3489, 3479),
	(1262, 2, 723, 724, 1, '', 723, 723, 3489, 3479),
	(1272, 2, 723, 724, 1, 'L', 724, 721, 3489, 3479),
	(1270, 2, 723, 733, 1, '', 723, 723, 3489, 3479),
	(1278, 2, 723, 741, 1, '', 739, 723, 3489, 3479),
	(1263, 2, 724, 724, 1, '', 725, 721, 3489, 3479),
	(1264, 2, 724, 724, 1, 'L', 724, 721, 3489, 3479),
	(1273, 2, 724, 733, 1, '', 725, 734, 3489, 3479),
	(1281, 2, 724, 741, 1, '', 742, 734, 3489, 3479),
	(1265, 2, 726, 724, 1, '', 726, 726, 3489, 3479),
	(1271, 2, 726, 724, 1, 'L', 724, 721, 3489, 3479),
	(1276, 2, 726, 733, 1, '', 726, 721, 3489, 3479),
	(1282, 2, 726, 741, 1, '', 743, 721, 3489, 3479),
	(1279, 2, 740, 741, 1, '', 740, 734, 3489, 3479),
	(1283, 2, 744, 741, 1, '', 744, 726, 3489, 3479);

-- Dumping structure for table datu_formatesana.lamp_direct
CREATE TABLE IF NOT EXISTS `lamp_direct` (
  `id` int NOT NULL AUTO_INCREMENT,
  `direct` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `direct` (`direct`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.lamp_direct: ~0 rows (approximately)
INSERT INTO `lamp_direct` (`id`, `direct`) VALUES
	(721, '1'),
	(726, '10'),
	(744, '12'),
	(723, '4'),
	(740, '6'),
	(724, '7');

-- Dumping structure for table datu_formatesana.lamp_power
CREATE TABLE IF NOT EXISTS `lamp_power` (
  `id` int NOT NULL AUTO_INCREMENT,
  `power` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `power` (`power`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.lamp_power: ~0 rows (approximately)
INSERT INTO `lamp_power` (`id`, `power`) VALUES
	(724, 0),
	(740, 9),
	(725, 19),
	(742, 20),
	(727, 21),
	(722, 22),
	(721, 28),
	(726, 29),
	(738, 30),
	(743, 31),
	(744, 32),
	(723, 39),
	(739, 40);

-- Dumping structure for table datu_formatesana.lamp_ref1
CREATE TABLE IF NOT EXISTS `lamp_ref1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref1` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ref1` (`ref1`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.lamp_ref1: ~0 rows (approximately)
INSERT INTO `lamp_ref1` (`id`, `ref1`) VALUES
	(721, 0),
	(734, 7),
	(727, 15),
	(729, 20),
	(726, 25),
	(723, 35);

-- Dumping structure for table datu_formatesana.lamp_type
CREATE TABLE IF NOT EXISTS `lamp_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=804 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.lamp_type: ~0 rows (approximately)
INSERT INTO `lamp_type` (`id`, `type`) VALUES
	(1, 'GP'),
	(103, 'undef'),
	(2, 'V');

-- Dumping structure for table datu_formatesana.log_code
CREATE TABLE IF NOT EXISTS `log_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.log_code: ~0 rows (approximately)

-- Dumping structure for table datu_formatesana.log_dati
CREATE TABLE IF NOT EXISTS `log_dati` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip_id` int DEFAULT NULL,
  `date_id` int DEFAULT NULL,
  `time_id` int DEFAULT NULL,
  `code_id` int DEFAULT NULL,
  `error_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_rows` (`ip_id`,`date_id`,`time_id`,`code_id`,`error_id`,`unit_id`,`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.log_dati: ~0 rows (approximately)

-- Dumping structure for table datu_formatesana.log_error
CREATE TABLE IF NOT EXISTS `log_error` (
  `id` int NOT NULL AUTO_INCREMENT,
  `error` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `error` (`error`)
) ENGINE=InnoDB AUTO_INCREMENT=2740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.log_error: ~0 rows (approximately)

-- Dumping structure for table datu_formatesana.log_status
CREATE TABLE IF NOT EXISTS `log_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.log_status: ~0 rows (approximately)

-- Dumping structure for table datu_formatesana.log_time
CREATE TABLE IF NOT EXISTS `log_time` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=2740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.log_time: ~0 rows (approximately)

-- Dumping structure for table datu_formatesana.log_unit
CREATE TABLE IF NOT EXISTS `log_unit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=2740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.log_unit: ~0 rows (approximately)

-- Dumping structure for table datu_formatesana.object_ip
CREATE TABLE IF NOT EXISTS `object_ip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=3570 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table datu_formatesana.object_ip: ~0 rows (approximately)
INSERT INTO `object_ip` (`id`, `ip`) VALUES
	(3489, '10.192.1.131');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
