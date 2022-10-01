-- MariaDB dump 10.19  Distrib 10.8.3-MariaDB, for osx10.17 (arm64)
--
-- Host: localhost    Database: python_console_game
-- ------------------------------------------------------
-- Server version	10.8.3-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `joined_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_UN` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computer_fighter`
--

DROP TABLE IF EXISTS `computer_fighter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computer_fighter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `move_one` int(10) unsigned DEFAULT NULL,
  `move_two` int(10) unsigned DEFAULT NULL,
  `move_three` int(10) unsigned DEFAULT NULL,
  `move_four` int(10) unsigned DEFAULT NULL,
  `name` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `health` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `computer_fighter_FK` (`move_one`),
  KEY `computer_fighter_FK_1` (`move_two`),
  KEY `computer_fighter_FK_2` (`move_three`),
  KEY `computer_fighter_FK_3` (`move_four`),
  CONSTRAINT `computer_fighter_FK` FOREIGN KEY (`move_one`) REFERENCES `move` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `computer_fighter_FK_1` FOREIGN KEY (`move_two`) REFERENCES `move` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `computer_fighter_FK_2` FOREIGN KEY (`move_three`) REFERENCES `move` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `computer_fighter_FK_3` FOREIGN KEY (`move_four`) REFERENCES `move` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computer_fighter`
--

LOCK TABLES `computer_fighter` WRITE;
/*!40000 ALTER TABLE `computer_fighter` DISABLE KEYS */;
/*!40000 ALTER TABLE `computer_fighter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fighter`
--

DROP TABLE IF EXISTS `fighter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fighter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `move_one` int(10) unsigned DEFAULT NULL,
  `move_two` int(10) unsigned DEFAULT NULL,
  `move_three` int(10) unsigned DEFAULT NULL,
  `move_four` int(10) unsigned DEFAULT NULL,
  `name` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `health` int(10) unsigned DEFAULT NULL,
  `points` int(10) unsigned DEFAULT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fighter_FK` (`client_id`),
  KEY `fighter_FK_1` (`move_one`),
  KEY `fighter_FK_2` (`move_two`),
  KEY `fighter_FK_3` (`move_three`),
  KEY `fighter_FK_4` (`move_four`),
  CONSTRAINT `fighter_FK` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fighter_FK_1` FOREIGN KEY (`move_one`) REFERENCES `move` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fighter_FK_2` FOREIGN KEY (`move_two`) REFERENCES `move` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fighter_FK_3` FOREIGN KEY (`move_three`) REFERENCES `move` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fighter_FK_4` FOREIGN KEY (`move_four`) REFERENCES `move` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fighter`
--

LOCK TABLES `fighter` WRITE;
/*!40000 ALTER TABLE `fighter` DISABLE KEYS */;
/*!40000 ALTER TABLE `fighter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `move`
--

DROP TABLE IF EXISTS `move`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `move` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8mb4_bin DEFAULT NULL,
  `upper_damage_range` int(10) unsigned DEFAULT NULL,
  `lower_damage_range` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `move`
--

LOCK TABLES `move` WRITE;
/*!40000 ALTER TABLE `move` DISABLE KEYS */;
/*!40000 ALTER TABLE `move` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'python_console_game'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-01  9:57:30
