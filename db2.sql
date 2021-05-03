-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                10.4.17-MariaDB - mariadb.org binary distribution
-- Server-OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumpar databasstruktur för holiday-maker
DROP DATABASE IF EXISTS `holiday-maker`;
CREATE DATABASE IF NOT EXISTS `holiday-maker` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `holiday-maker`;

-- Dumpar struktur för tabell holiday-maker.bookings
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `extra_bed` tinyint(1) NOT NULL,
  `whole_pension` tinyint(1) NOT NULL,
  `half_pension` tinyint(1) NOT NULL,
  `all_inclusive` tinyint(1) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bookings_hotels` (`hotel`),
  KEY `FK_bookings_rooms` (`room`),
  KEY `FK_bookings_users` (`user`),
  CONSTRAINT `FK_bookings_hotels` FOREIGN KEY (`hotel`) REFERENCES `hotels` (`id`),
  CONSTRAINT `FK_bookings_rooms` FOREIGN KEY (`room`) REFERENCES `rooms` (`id`),
  CONSTRAINT `FK_bookings_users` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.bookings: ~0 rows (ungefär)
DELETE FROM `bookings`;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.favorites
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `hotel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_favorites_hotels` (`hotel`),
  KEY `FK_favorites_users` (`user`),
  CONSTRAINT `FK_favorites_hotels` FOREIGN KEY (`hotel`) REFERENCES `hotels` (`id`),
  CONSTRAINT `FK_favorites_users` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.favorites: ~0 rows (ungefär)
DELETE FROM `favorites`;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.hotels
DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(50) NOT NULL DEFAULT '',
  `pool` tinyint(1) NOT NULL,
  `entertainment` tinyint(1) NOT NULL,
  `childrens_club` tinyint(1) NOT NULL,
  `distance_to_beach` int(11) NOT NULL,
  `distance_to_center` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.hotels: ~15 rows (ungefär)
DELETE FROM `hotels`;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` (`id`, `name`, `country`, `city`, `address`, `pool`, `entertainment`, `childrens_club`, `distance_to_beach`, `distance_to_center`) VALUES
	(1, 'Keeling, Kozey and Terry', 'Norway', 'Mariestad', '4890 Talmadge Park', 1, 0, 0, 9, 43),
	(2, 'Feil, Koss and Schoen', 'Denmark', 'Fredrikshavn', '74 Dunning Drive', 1, 1, 1, 49, 21),
	(3, 'Johnson Inc', 'Finland', 'Helsinki', '7 Dakota Lane', 0, 1, 1, 74, 37),
	(4, 'Stroman Group', 'Sweden', 'Mora', '21862 Swallow Street', 0, 0, 0, 83, 45),
	(5, 'Yost-Hudson', 'Denmark', 'Köpenhamn', '32886 Hayes Terrace', 1, 1, 0, 29, 51),
	(6, 'Klein Group', 'Sweden', 'Norsborg', '7601 Tony Lane', 1, 0, 1, 77, 70),
	(7, 'Koss-Hagenes', 'Finland', 'Nykarleby', '4 Elmside Crossing', 0, 1, 0, 11, 40),
	(8, 'Thompson Group', 'Sweden', 'Leksand', '247 Briar Crest Hill', 0, 0, 1, 29, 48),
	(9, 'Gleason LLC', 'Norway', 'Oslo', '3189 Kinsman Circle', 0, 1, 0, 64, 66),
	(10, 'Stark Group', 'Denmark', 'Helsingor', '537 Lakeland Circle', 1, 1, 0, 50, 26),
	(11, 'Rippin LLC', 'Finland', 'Tammela', '901 Mayer Trail', 0, 0, 0, 27, 8),
	(12, 'Oberbrunner, Gleason and McClure', 'Sweden', 'Härnösand', '637 Crest Line Hill', 0, 0, 0, 32, 8),
	(13, 'Schaefer Inc', 'Finland', 'Porvoo', '15 Reindahl Lane', 1, 1, 0, 14, 89),
	(14, 'Carroll-Sawayn', 'Finland', 'Helsinki', '22784 Eliot Center', 0, 1, 1, 85, 39),
	(15, 'Klein-Hand', 'Norway', 'Kristiansand S', '5630 Schlimgen Road', 0, 0, 0, 95, 33);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_reviews_hotels` (`hotel_id`),
  KEY `FK_reviews_users` (`user_id`),
  CONSTRAINT `FK_reviews_hotels` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `FK_reviews_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.reviews: ~0 rows (ungefär)
DELETE FROM `reviews`;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.rooms
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel` int(11) NOT NULL,
  `room_nr` int(11) NOT NULL,
  `beds` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rooms_hotels` (`hotel`),
  CONSTRAINT `FK_rooms_hotels` FOREIGN KEY (`hotel`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.rooms: ~100 rows (ungefär)
DELETE FROM `rooms`;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` (`id`, `hotel`, `room_nr`, `beds`, `price`) VALUES
	(1001, 3, 1, 1, 169),
	(1002, 15, 2, 2, 360),
	(1003, 9, 3, 4, 600),
	(1004, 3, 4, 3, 450),
	(1005, 12, 5, 1, 100),
	(1006, 2, 6, 3, 371),
	(1007, 9, 7, 4, 600),
	(1008, 13, 8, 3, 550),
	(1009, 8, 9, 1, 200),
	(1010, 7, 10, 2, 300),
	(1011, 14, 11, 3, 640),
	(1012, 9, 12, 3, 490),
	(1013, 7, 13, 1, 230),
	(1014, 4, 14, 3, 360),
	(1015, 11, 15, 3, 300),
	(1016, 6, 16, 2, 440),
	(1017, 1, 17, 3, 400),
	(1018, 7, 18, 2, 330),
	(1019, 7, 19, 1, 240),
	(1020, 8, 20, 2, 399),
	(1021, 8, 21, 3, 560),
	(1022, 8, 22, 1, 200),
	(1023, 5, 23, 1, 230),
	(1024, 13, 24, 1, 251),
	(1025, 1, 25, 2, 300),
	(1026, 4, 26, 3, 340),
	(1027, 9, 27, 4, 640),
	(1028, 3, 28, 2, 311),
	(1029, 8, 29, 4, 699),
	(1030, 4, 30, 3, 300),
	(1031, 14, 31, 2, 450),
	(1032, 2, 32, 4, 520),
	(1033, 14, 33, 2, 482),
	(1034, 3, 34, 2, 381),
	(1035, 1, 35, 4, 500),
	(1036, 1, 36, 2, 290),
	(1037, 2, 37, 2, 260),
	(1038, 2, 38, 2, 230),
	(1039, 10, 39, 2, 400),
	(1040, 13, 40, 3, 599),
	(1041, 3, 41, 1, 159),
	(1042, 15, 42, 4, 750),
	(1043, 10, 43, 4, 799),
	(1044, 1, 44, 3, 360),
	(1045, 11, 45, 3, 359),
	(1046, 6, 46, 4, 700),
	(1047, 4, 47, 3, 320),
	(1048, 13, 48, 1, 200),
	(1049, 8, 49, 2, 420),
	(1050, 14, 50, 4, 920),
	(1051, 7, 51, 1, 200),
	(1052, 11, 52, 1, 154),
	(1053, 1, 53, 3, 400),
	(1054, 1, 54, 4, 550),
	(1055, 12, 55, 3, 320),
	(1056, 4, 56, 2, 230),
	(1057, 4, 57, 1, 140),
	(1058, 6, 58, 2, 470),
	(1059, 13, 59, 1, 220),
	(1060, 12, 60, 3, 334),
	(1061, 12, 61, 2, 250),
	(1062, 6, 62, 3, 600),
	(1063, 5, 63, 1, 230),
	(1064, 4, 64, 3, 357),
	(1065, 6, 65, 3, 560),
	(1066, 8, 66, 1, 200),
	(1067, 15, 67, 2, 300),
	(1068, 2, 68, 3, 350),
	(1069, 5, 69, 3, 450),
	(1070, 2, 70, 4, 520),
	(1071, 9, 71, 1, 150),
	(1072, 3, 72, 4, 559),
	(1073, 4, 73, 2, 200),
	(1074, 14, 74, 3, 600),
	(1075, 7, 75, 4, 430),
	(1076, 6, 76, 2, 450),
	(1077, 12, 77, 1, 120),
	(1078, 10, 78, 2, 406),
	(1079, 1, 79, 1, 120),
	(1080, 8, 80, 1, 230),
	(1081, 5, 81, 1, 200),
	(1082, 4, 82, 2, 230),
	(1083, 2, 83, 1, 119),
	(1084, 15, 84, 1, 232),
	(1085, 15, 85, 4, 780),
	(1086, 12, 86, 1, 115),
	(1087, 6, 87, 4, 720),
	(1088, 14, 88, 2, 400),
	(1089, 7, 89, 1, 205),
	(1090, 7, 90, 3, 429),
	(1091, 8, 91, 2, 423),
	(1092, 8, 92, 3, 550),
	(1093, 7, 93, 4, 430),
	(1094, 2, 94, 1, 125),
	(1095, 9, 95, 1, 165),
	(1096, 13, 96, 4, 899),
	(1097, 1, 97, 1, 100),
	(1098, 1, 98, 3, 375),
	(1099, 12, 99, 2, 220),
	(1100, 1, 100, 2, 275);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.users: ~0 rows (ungefär)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
