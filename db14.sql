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
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `extra_bed` tinyint(1) NOT NULL,
  `whole_pension` tinyint(1) NOT NULL,
  `half_pension` tinyint(1) NOT NULL,
  `all_inclusive` tinyint(1) NOT NULL,
  `number_of_adults` int(11) NOT NULL,
  `number_of_children` int(11) DEFAULT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bookings_users` (`user_id`) USING BTREE,
  KEY `FK_bookings_rooms` (`room_id`) USING BTREE,
  CONSTRAINT `FK_bookings_rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  CONSTRAINT `FK_bookings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.bookings: ~5 rows (ungefär)
DELETE FROM `bookings`;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` (`id`, `room_id`, `user_id`, `price`, `extra_bed`, `whole_pension`, `half_pension`, `all_inclusive`, `number_of_adults`, `number_of_children`, `from_date`, `to_date`) VALUES
	(2, 1005, 5, 500, 2, 1, 0, 1, 1, 1, '2021-05-20', '2021-05-24'),
	(3, 1005, 1, 6000, 1, 1, 0, 1, 4, 0, '2021-09-05', '2021-09-09'),
	(48, 1024, 2, 800, 1, 0, 0, 1, 1, 1, '2021-06-04', '2021-06-07'),
	(49, 1017, 2, 800, 1, 0, 0, 1, 1, 1, '2021-06-04', '2021-06-07'),
	(50, 1017, 2, 800, 1, 0, 0, 1, 1, 1, '2021-06-10', '2021-06-16');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.favorites
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE IF NOT EXISTS `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_favorites_hotels` (`hotel_id`) USING BTREE,
  KEY `FK_favorites_users` (`user_id`) USING BTREE,
  CONSTRAINT `FK_favorites_hotels` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `FK_favorites_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.favorites: ~10 rows (ungefär)
DELETE FROM `favorites`;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` (`id`, `user_id`, `hotel_id`) VALUES
	(10, 5, 2),
	(13, 1, 1),
	(14, 1, 2),
	(15, 1, 3),
	(16, 1, 4),
	(17, 1, 5),
	(18, 1, 6),
	(19, 1, 1),
	(20, 1, 1),
	(21, 1, 2);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.hotels
DROP TABLE IF EXISTS `hotels`;
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `review` tinyint(1) DEFAULT NULL,
  `country` varchar(50) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `pool` tinyint(1) NOT NULL,
  `entertainment` tinyint(1) NOT NULL,
  `childrens_club` tinyint(1) NOT NULL,
  `restaurant` tinyint(1) NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `bar` tinyint(1) NOT NULL,
  `distance_to_beach` int(11) NOT NULL,
  `distance_to_center` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `cheapest_price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.hotels: ~15 rows (ungefär)
DELETE FROM `hotels`;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` (`id`, `name`, `review`, `country`, `city`, `address`, `description`, `pool`, `entertainment`, `childrens_club`, `restaurant`, `wifi`, `bar`, `distance_to_beach`, `distance_to_center`, `img`, `cheapest_price`) VALUES
	(1, 'Keeling, Kozey and Terry', 2, 'Norway', 'Mariestad', '4890 Talmadge Park', 'Detta lyxhotell ligger i anslutning till Stockholm Waterfront Congress Centre och centralstationen. Hotellet erbjuder gratis WiFi, ett gym, utmärkta restauranger och panoramautsikt över staden.', 1, 0, 0, 1, 1, 1, 2, 6, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/15/18/151839_v5.jpeg', 100),
	(2, 'Feil, Koss and Schoen', 1, 'Denmark', 'Fredrikshavn', '74 Dunning Drive', 'Detta designhotell erbjuder utsökt mat och fantastisk utsikt. Hotellet ligger i den trendiga Stockholmsstadsdelen Södermalm, bara några meter från tunnelbanestationen Skanstull.', 1, 1, 1, 0, 0, 0, 1, 7, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/96/95/96959_v6.jpeg', 119),
	(3, 'Johnson Inchotels', 3, 'Finland', 'Helsinki', '7 Dakota Lane', 'Detta moderna designhotell har ett centralt läge i Stockholm. Här finns en restaurang som erbjuder internationell matlagning, en vinbar med utomhusterrass samt ett välutrustat gym som är öppet dygnet runt. \r\n', 0, 1, 1, 1, 1, 1, 4, 7, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/19/32/1932523_v9.jpeg', 159),
	(4, 'Stroman Group', 4, 'Sweden', 'Mora', '21862 Swallow Street', 'Detta hotell i centrala Stockholm erbjuder fantastisk utsikt över Nybroviken samt gratis WiFi. Det är en perfekt bas för dig som vill besöka Gamla stan eller Moderna Museet. ', 0, 0, 0, 1, 0, 0, 5, 8, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/28/27/2827015_v4.jpeg', 140),
	(5, 'Yost-Hudson', 4, 'Denmark', 'Köpenhamn', '32886 Hayes Terrace', 'Detthotelsa hotell i centrala Stockholm erbjuder fantastisk utsikt över Nybroviken samt gratis WiFi. Det är en perfekt bas för dig som vill besöka Gamla stan eller Moderna Museet. ', 1, 1, 0, 1, 1, 1, 7, 2, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/95/00/9500346_v2.jpeg', 200),
	(6, 'Klein Group', 5, 'Sweden', 'Norsborg', '7601 Tony Lane', 'Detta prisvärda designhotell ligger mittemot Stockholms centralstation, hållplatsen för snabbtåget Arlanda Express samt Casino Cosmopol.', 1, 0, 1, 1, 0, 0, 10, 1, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/37/71/37714_v21.jpeg', 440),
	(7, 'Koss-Hagenes', 5, 'Finland', 'Nykarleby', '4 Elmside Crossing', 'Detta moderna hotell har ett centralt läge mellan den trendiga stadsdelen Södermalm och Gamla stan', 0, 1, 0, 1, 1, 1, 3, 6, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/90/80/908005_v10.jpeg', 200),
	(8, 'Thompson Group', 3, 'Sweden', 'Leksand', '247 Briar Crest Hill', 'Detta designhotell ligger på Kungsholmen i centrala Stockholm, bara 400 meter från tunnelbanestationen Fridhemsplan', 0, 0, 1, 0, 1, 0, 6, 1, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/93/05/93059_v4.jpeg', 200),
	(9, 'Gleason LLC', 4, 'Norway', 'Oslo', '3189 Kinsman Circle', 'Berns Hotel är ett elegant boutiquehotell från 1863, som ligger vid Nybrokajen i centrala Stockholm', 0, 1, 0, 1, 1, 1, 32, 1, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/11/61/1161096_v6.jpeg', 150),
	(10, 'Stark Group', 5, 'Denmark', 'Helsingor', '537 Lakeland Circle', 'Scandic Continental ligger tvärs över gatan från Stockholms centralstation', 1, 1, 0, 0, 1, 1, 12, 2, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/97/04/97047_v8.jpeg', 400),
	(11, 'Rippin LLC', 2, 'Finland', 'Tammela', '901 Mayer Trail', 'Clarion Hotel Sign ligger 400 meter från Arlanda Express-terminalen och har gratis WiFi samt ett året-runt-öppet takspa med en uppvärmd pool och en bar.', 0, 0, 0, 1, 0, 1, 4, 3, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/54/38/5438642_v1.jpeg', 154),
	(12, 'Oberbrunner, Gleason and McClure', 3, 'Sweden', 'Härnösand', '637 Crest Line Hill', 'Detta hotell ligger i Hammarby sjöstad, 5 km från Stockholms centrum. Tågstationen vid Sickla kaj ligger 200 meter bort', 0, 0, 0, 0, 1, 0, 31, 4, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/37/71/37711_v8.jpeg', 100),
	(13, 'Schaefer Inc', 4, 'Finland', 'Porvoo', '15 Reindahl Lane', 'Best Western and hotel erbjuder modernt och kompakt boende i centrala Stockholm.', 1, 1, 0, 1, 1, 1, 23, 1, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/23/30/2330200_v7.jpeg', 200),
	(14, 'Carroll-Sawayn', 5, 'Finland', 'Helsinki', '22784 Eliot Center', 'Detta hotell ligger i ett centralt men ändå lugnt bostadsområde i Stockholm, precis vid Vanadislunden.', 0, 1, 1, 1, 0, 1, 2, 6, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/57/54/5754756_v4.jpeg', 400),
	(15, 'Klein-Hand', 3, 'Norway', 'Kristiansand S', '5630 Schlimgen Road', 'Generator Stockholm ligger på Norrmalm i Stockholm, och erbjuder en modern lounge, flera sällskapsutrymmen och en bar som serverar nordiska cocktails', 0, 0, 0, 0, 1, 0, 4, 14, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/11/28/112854_v6.jpeg', 232);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.reviews
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `rating` int(1) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_reviews_hotels` (`hotel_id`),
  KEY `FK_reviews_users` (`user_id`),
  CONSTRAINT `FK_reviews_hotels` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`),
  CONSTRAINT `FK_reviews_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.reviews: ~5 rows (ungefär)
DELETE FROM `reviews`;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `user_id`, `hotel_id`, `rating`, `description`) VALUES
	(1, 1, 8, 1, 'Helt ok'),
	(2, 1, 1, 5, 'Ganska kasst'),
	(3, 1, 1, 4, 'Ok'),
	(4, 1, 15, 1, 'Fint och så'),
	(5, 1, 15, 4, 'BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST BRÖDROST ');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.rooms
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `room_nr` int(11) NOT NULL,
  `beds` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `booked` tinyint(1) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rooms_hotels` (`hotel_id`) USING BTREE,
  CONSTRAINT `FK_rooms_hotels` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.rooms: ~100 rows (ungefär)
DELETE FROM `rooms`;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` (`id`, `hotel_id`, `room_nr`, `beds`, `price`, `booked`, `img`) VALUES
	(1001, 3, 1, 1, 169, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732254.jpeg'),
	(1002, 15, 2, 2, 360, 0, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/15/46/15468860.jpeg'),
	(1003, 9, 3, 4, 600, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/26/38/263826400.jpeg'),
	(1004, 3, 4, 3, 450, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/20/68/20682274.jpeg'),
	(1005, 12, 5, 1, 100, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/13/36131834.jpeg'),
	(1006, 2, 6, 3, 371, 0, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/15/46/15468860.jpeg'),
	(1007, 9, 7, 4, 600, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732156.jpeg'),
	(1008, 13, 8, 3, 550, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/93/479348922.jpeg'),
	(1009, 8, 9, 1, 200, 0, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/15/46/15468860.jpeg'),
	(1010, 7, 10, 2, 300, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/78/08/780814486.jpeg'),
	(1011, 14, 11, 3, 640, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/95/36955288.jpeg'),
	(1012, 9, 12, 3, 490, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/13/36131836.jpeg'),
	(1013, 7, 13, 1, 230, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/93/58/935837024.jpeg'),
	(1014, 4, 14, 3, 360, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/55/335592044.jpeg'),
	(1015, 11, 15, 3, 300, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/27/57/27578608.jpeg'),
	(1016, 6, 16, 2, 440, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/49/50/495023986.jpeg'),
	(1017, 1, 17, 3, 400, 0, 'https://imgcy.trivago.com/d_dummy.jpeg,f_auto,q_auto/if_iw_lte_ih,c_scale,w_236/if_else,c_scale,h_160/e_improve,q_auto:low//partnerimages/33/64/336448480.jpeg'),
	(1018, 7, 18, 2, 330, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/11/53/11535952.jpeg'),
	(1019, 7, 19, 1, 240, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/24/81/24819648.jpeg'),
	(1020, 8, 20, 2, 399, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/21/332113970.jpeg'),
	(1021, 8, 21, 3, 560, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/27/57/27578608.jpeg'),
	(1022, 8, 22, 1, 200, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/35/63/356349680.jpeg'),
	(1023, 5, 23, 1, 230, 0, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/15/46/15468860.jpeg'),
	(1024, 13, 24, 1, 251, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/56/335653036.jpeg'),
	(1025, 1, 25, 2, 300, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/60/336066070.jpeg'),
	(1026, 4, 26, 3, 340, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/30/93/309396772.jpeg'),
	(1027, 9, 27, 4, 640, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/29/34/293470222.jpeg'),
	(1028, 3, 28, 2, 311, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/78/08/780814486.jpeg'),
	(1029, 8, 29, 4, 699, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/26/38/263826400.jpeg'),
	(1030, 4, 30, 3, 300, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/35/63/356349680.jpeg'),
	(1031, 14, 31, 2, 450, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/20/68/20682274.jpeg'),
	(1032, 2, 32, 4, 520, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732156.jpeg'),
	(1033, 14, 33, 2, 482, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/29/20/29205144.jpeg'),
	(1034, 3, 34, 2, 381, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/29/34/293470222.jpeg'),
	(1035, 1, 35, 4, 500, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/38/26/38263852.jpeg'),
	(1036, 1, 36, 2, 290, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/27/08/270858654.jpeg'),
	(1037, 2, 37, 2, 260, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/24/81/24819648.jpeg'),
	(1038, 2, 38, 2, 230, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/27/57/27578608.jpeg'),
	(1039, 10, 39, 2, 400, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/13/36131836.jpeg'),
	(1040, 13, 40, 3, 599, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/27/89/278952940.jpeg'),
	(1041, 3, 41, 1, 159, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732254.jpeg'),
	(1042, 15, 42, 4, 750, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/21/332113970.jpeg'),
	(1043, 10, 43, 4, 799, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/35/63/356349680.jpeg'),
	(1044, 1, 44, 3, 360, 0, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/14/13/1413728_v8.jpeg'),
	(1045, 11, 45, 3, 359, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/13/36131890.jpeg'),
	(1046, 6, 46, 4, 700, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/11/53/11535952.jpeg'),
	(1047, 4, 47, 3, 320, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732254.jpeg'),
	(1048, 13, 48, 1, 200, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/24/81/24819648.jpeg'),
	(1049, 8, 49, 2, 420, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/13/36131834.jpeg'),
	(1050, 14, 50, 4, 920, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/29/17/29170340.jpeg'),
	(1051, 7, 51, 1, 200, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/29/34/293470222.jpeg'),
	(1052, 11, 52, 1, 154, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/20/68/20682274.jpeg'),
	(1053, 1, 53, 3, 400, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/26/64/266457370.jpeg'),
	(1054, 1, 54, 4, 550, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/28/53/28532068.jpeg'),
	(1055, 12, 55, 3, 320, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/93/58/935837024.jpeg'),
	(1056, 4, 56, 2, 230, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/29/20/29205144.jpeg'),
	(1057, 4, 57, 1, 140, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/11/53/11535952.jpeg'),
	(1058, 6, 58, 2, 470, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/71/60/716083880.jpeg'),
	(1059, 13, 59, 1, 220, 0, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/15/46/15468860.jpeg'),
	(1060, 12, 60, 3, 334, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/29/20/29205144.jpeg'),
	(1061, 12, 61, 2, 250, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/26/38/263826400.jpeg'),
	(1062, 6, 62, 3, 600, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/21/332113970.jpeg'),
	(1063, 5, 63, 1, 230, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732156.jpeg'),
	(1064, 4, 64, 3, 357, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/95/36955288.jpeg'),
	(1065, 6, 65, 3, 560, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/56/335653036.jpeg'),
	(1066, 8, 66, 1, 200, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/29/17/29170340.jpeg'),
	(1067, 15, 67, 2, 300, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/29/34/293470222.jpeg'),
	(1068, 2, 68, 3, 350, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732254.jpeg'),
	(1069, 5, 69, 3, 450, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732254.jpeg'),
	(1070, 2, 70, 4, 520, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/96/479689298.jpeg'),
	(1071, 9, 71, 1, 150, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/13/36131890.jpeg'),
	(1072, 3, 72, 4, 559, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/30/93/309396772.jpeg'),
	(1073, 4, 73, 2, 200, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732254.jpeg'),
	(1074, 14, 74, 3, 600, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/29/34/293470222.jpeg'),
	(1075, 7, 75, 4, 430, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/95/36955288.jpeg'),
	(1076, 6, 76, 2, 450, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/93/479348922.jpeg'),
	(1077, 12, 77, 1, 120, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732156.jpeg'),
	(1078, 10, 78, 2, 406, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/58/335894586.jpeg'),
	(1079, 1, 79, 1, 120, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/30/333040304.jpeg'),
	(1080, 8, 80, 1, 230, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/93/58/935837024.jpeg'),
	(1081, 5, 81, 1, 200, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732254.jpeg'),
	(1082, 4, 82, 2, 230, 0, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/27/91/2791705_v1.jpeg'),
	(1083, 2, 83, 1, 119, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732254.jpeg'),
	(1084, 15, 84, 1, 232, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/55/335592044.jpeg'),
	(1085, 15, 85, 4, 780, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/27/57/27578608.jpeg'),
	(1086, 12, 86, 1, 115, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/31/19/31191022.jpeg'),
	(1087, 6, 87, 4, 720, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/27/57/27578608.jpeg'),
	(1088, 14, 88, 2, 400, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/78/08/780814486.jpeg'),
	(1089, 7, 89, 1, 205, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/97/479732156.jpeg'),
	(1090, 7, 90, 3, 429, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/35/63/356349680.jpeg'),
	(1091, 8, 91, 2, 423, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/33/55/335592044.jpeg'),
	(1092, 8, 92, 3, 550, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/27/89/278952940.jpeg'),
	(1093, 7, 93, 4, 430, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/47/93/479348922.jpeg'),
	(1094, 2, 94, 1, 125, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/35/63/356349680.jpeg'),
	(1095, 9, 95, 1, 165, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/35/63/356349680.jpeg'),
	(1096, 13, 96, 4, 899, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/30/93/309396772.jpeg'),
	(1097, 1, 97, 1, 100, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/36/95/36950104.jpeg'),
	(1098, 1, 98, 3, 375, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/uploadimages/20/82/20822344.jpeg'),
	(1099, 12, 99, 2, 220, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/71/60/716083880.jpeg'),
	(1100, 1, 100, 2, 275, 0, 'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,f_auto,h_190,q_auto,w_240/partnerimages/32/43/324324558.jpeg');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;

-- Dumpar struktur för tabell holiday-maker.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell holiday-maker.users: ~7 rows (ungefär)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`) VALUES
	(1, 'Lasse74', '$2a$10$TRwlvQbVBlkxJWpgk4ab5.AwVCU1LDOsNfvWIkaaA.lcJzqvS5JJa'),
	(2, 'user', '$2a$10$dQq20I6vctnwFjODSix7suAL4re3/owmKHy5K.c/fsz55cf/irnTe'),
	(3, 'user123', '$2a$10$FQn6KpSHfYJHU46/uuev2u.88yvRihWp7LCJa299ZO5bCoQpFyDym'),
	(4, 'abc', '$2a$10$koi440X7Ecs8s1hwx6alCerksqwYqonM5Xt5Cu2LkQMz3/YumNug6'),
	(5, 'testkalle', '$2a$10$b.AGs6BNUqgM2DDYhDh7PeeGy2iJfdDR2lON0chCbUyLSJ2K/caty'),
	(7, 'kalle@hotmail.com', '$2a$10$sGZoLFLn8S4Whu2aHHYAYORFxnxXO7sjFWtCb7Jva15XW9VaYjHHC'),
	(9, '8oyyo', '$2a$10$hFi/7PrV3UNaWO9fKX9BY./PjYZ6nlj41osduO81nIo39JJ.lIVKm');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
