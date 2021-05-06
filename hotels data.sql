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

-- Dumpar data för tabell holiday-maker.hotels: ~15 rows (ungefär)
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` (`id`, `name`, `country`, `city`, `address`, `description`, `pool`, `entertainment`, `childrens_club`, `restaurant`, `bar`, `wifi`, `distance_to_beach`, `distance_to_center`, `img`) VALUES
	(1, 'Keeling, Kozey and Terry', 'Norway', 'Mariestad', '4890 Talmadge Park', 'Detta lyxhotell ligger i anslutning till Stockholm Waterfront Congress Centre och centralstationen. Hotellet erbjuder gratis WiFi, ett gym, utmärkta restauranger och panoramautsikt över staden.', 1, 0, 0, 1, 1, 1, 9, 43, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/15/18/151839_v5.jpeg'),
	(2, 'Feil, Koss and Schoen', 'Denmark', 'Fredrikshavn', '74 Dunning Drive', 'Detta designhotell erbjuder utsökt mat och fantastisk utsikt. Hotellet ligger i den trendiga Stockholmsstadsdelen Södermalm, bara några meter från tunnelbanestationen Skanstull.', 1, 1, 1, 0, 0, 0, 49, 21, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/96/95/96959_v6.jpeg'),
	(3, 'Johnson Inc', 'Finland', 'Helsinki', '7 Dakota Lane', 'Detta moderna designhotell har ett centralt läge i Stockholm. Här finns en restaurang som erbjuder internationell matlagning, en vinbar med utomhusterrass samt ett välutrustat gym som är öppet dygnet runt. \r\n', 0, 1, 1, 1, 1, 1, 74, 37, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/19/32/1932523_v9.jpeg'),
	(4, 'Stroman Group', 'Sweden', 'Mora', '21862 Swallow Street', 'Detta hotell i centrala Stockholm erbjuder fantastisk utsikt över Nybroviken samt gratis WiFi. Det är en perfekt bas för dig som vill besöka Gamla stan eller Moderna Museet. ', 0, 0, 0, 1, 0, 0, 83, 45, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/28/27/2827015_v4.jpeg'),
	(5, 'Yost-Hudson', 'Denmark', 'Köpenhamn', '32886 Hayes Terrace', 'Detta hotell i centrala Stockholm erbjuder fantastisk utsikt över Nybroviken samt gratis WiFi. Det är en perfekt bas för dig som vill besöka Gamla stan eller Moderna Museet. ', 1, 1, 0, 1, 1, 1, 29, 51, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/95/00/9500346_v2.jpeg'),
	(6, 'Klein Group', 'Sweden', 'Norsborg', '7601 Tony Lane', 'Detta prisvärda designhotell ligger mittemot Stockholms centralstation, hållplatsen för snabbtåget Arlanda Express samt Casino Cosmopol.', 1, 0, 1, 1, 0, 0, 77, 70, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/37/71/37714_v21.jpeg'),
	(7, 'Koss-Hagenes', 'Finland', 'Nykarleby', '4 Elmside Crossing', 'Detta moderna hotell har ett centralt läge mellan den trendiga stadsdelen Södermalm och Gamla stan', 0, 1, 0, 1, 1, 1, 11, 40, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/90/80/908005_v10.jpeg'),
	(8, 'Thompson Group', 'Sweden', 'Leksand', '247 Briar Crest Hill', 'Detta designhotell ligger på Kungsholmen i centrala Stockholm, bara 400 meter från tunnelbanestationen Fridhemsplan', 0, 0, 1, 0, 0, 1, 29, 48, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/93/05/93059_v4.jpeg'),
	(9, 'Gleason LLC', 'Norway', 'Oslo', '3189 Kinsman Circle', 'Berns Hotel är ett elegant boutiquehotell från 1863, som ligger vid Nybrokajen i centrala Stockholm', 0, 1, 0, 1, 1, 1, 64, 66, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/11/61/1161096_v6.jpeg'),
	(10, 'Stark Group', 'Denmark', 'Helsingor', '537 Lakeland Circle', 'Scandic Continental ligger tvärs över gatan från Stockholms centralstation', 1, 1, 0, 0, 1, 1, 50, 26, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/97/04/97047_v8.jpeg'),
	(11, 'Rippin LLC', 'Finland', 'Tammela', '901 Mayer Trail', 'Clarion Hotel Sign ligger 400 meter från Arlanda Express-terminalen och har gratis WiFi samt ett året-runt-öppet takspa med en uppvärmd pool och en bar.', 0, 0, 0, 1, 1, 0, 27, 8, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/54/38/5438642_v1.jpeg'),
	(12, 'Oberbrunner, Gleason and McClure', 'Sweden', 'Härnösand', '637 Crest Line Hill', 'Detta hotell ligger i Hammarby sjöstad, 5 km från Stockholms centrum. Tågstationen vid Sickla kaj ligger 200 meter bort', 0, 0, 0, 0, 0, 1, 32, 8, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/37/71/37711_v8.jpeg'),
	(13, 'Schaefer Inc', 'Finland', 'Porvoo', '15 Reindahl Lane', 'Best Western and hotel erbjuder modernt och kompakt boende i centrala Stockholm.', 1, 1, 0, 1, 1, 1, 14, 89, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/23/30/2330200_v7.jpeg'),
	(14, 'Carroll-Sawayn', 'Finland', 'Helsinki', '22784 Eliot Center', 'Detta hotell ligger i ett centralt men ändå lugnt bostadsområde i Stockholm, precis vid Vanadislunden.', 0, 1, 1, 1, 1, 0, 85, 39, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/57/54/5754756_v4.jpeg'),
	(15, 'Klein-Hand', 'Norway', 'Kristiansand S', '5630 Schlimgen Road', 'Generator Stockholm ligger på Norrmalm i Stockholm, och erbjuder en modern lounge, flera sällskapsutrymmen och en bar som serverar nordiska cocktails', 0, 0, 0, 0, 0, 1, 95, 33, 'https://imgcy.trivago.com/c_lfill,d_dummy.jpeg,e_sharpen:60,f_auto,h_225,q_auto,w_225/itemimages/11/28/112854_v6.jpeg');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
