CREATE DATABASE  IF NOT EXISTS `db_times` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_times`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_times
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `attachment_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `attachment_url` varchar(255) NOT NULL,
  `ticket_id` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `attachments_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON UPDATE CASCADE,
  CONSTRAINT `attachments_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON UPDATE CASCADE,
  CONSTRAINT `attachments_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON UPDATE CASCADE,
  CONSTRAINT `attachments_ibfk_4` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON UPDATE CASCADE,
  CONSTRAINT `attachments_ibfk_5` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON UPDATE CASCADE,
  CONSTRAINT `attachments_ibfk_6` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (0011,'uploads\\attachments\\79b62f80-16e8-11ed-b3c2-31339a8d3eca.jpg','KIO0001','2022-08-08 14:05:24','2022-08-08 14:05:24'),(0012,'uploads\\attachments\\79b6a4b0-16e8-11ed-b3c2-31339a8d3eca.png','KIO0001','2022-08-08 14:05:24','2022-08-08 14:05:24'),(0013,'uploads\\attachments\\c852bf40-16f8-11ed-8674-c54d946ce111.png','DIS0075','2022-08-08 16:02:08','2022-08-08 16:02:08'),(0014,'uploads\\attachments\\c8530d60-16f8-11ed-8674-c54d946ce111.jpg','DIS0075','2022-08-08 16:02:08','2022-08-08 16:02:08'),(0015,'uploads\\attachments\\de86a560-16f8-11ed-8674-c54d946ce111.jpg','KIO0076','2022-08-08 16:02:45','2022-08-08 16:02:45'),(0016,'uploads\\attachments\\de86cc70-16f8-11ed-8674-c54d946ce111.png','KIO0076','2022-08-08 16:02:45','2022-08-08 16:02:45'),(0017,'uploads\\attachments\\f7fe1dc0-16f8-11ed-8674-c54d946ce111.png','MOB0077','2022-08-08 16:03:28','2022-08-08 16:03:28'),(0018,'uploads\\attachments\\dee4e730-1796-11ed-951e-830705ed2c05.jpg','MOB0078','2022-08-09 10:53:47','2022-08-09 10:53:47'),(0019,'uploads\\attachments\\dee50e40-1796-11ed-951e-830705ed2c05.pdf','MOB0078','2022-08-09 10:53:47','2022-08-09 10:53:47'),(0020,'uploads\\attachments\\b61d1de0-17be-11ed-8624-51baa5fe89d7.jpg','KIO0079','2022-08-09 15:38:58','2022-08-09 15:38:58'),(0021,'uploads\\attachments\\1bf5f650-17bf-11ed-b1a7-c94c7d023200.jpg','KIO0080','2022-08-09 15:41:49','2022-08-09 15:41:49'),(0022,'uploads\\attachments\\3e6b5f90-17bf-11ed-8ca7-c9448910c8da.jpg','DIS0081','2022-08-09 15:42:47','2022-08-09 15:42:47'),(0023,'uploads\\attachments\\5b0881f0-17bf-11ed-9ff3-ff2cee72191d.jpg','DIS0082','2022-08-09 15:43:35','2022-08-09 15:43:35'),(0024,'uploads\\attachments\\c8a2ba50-17c4-11ed-a57b-3b19e94356e7.jpg','MOB0083','2022-08-09 16:22:26','2022-08-09 16:22:26'),(0025,'uploads\\attachments\\a85ee260-1859-11ed-a64c-f343c7abb544.jpg','KIO0084','2022-08-10 10:08:07','2022-08-10 10:08:07'),(0026,'uploads\\attachments\\49f1a7b0-192d-11ed-99a7-b3f0f11c4de5.jpg','MOB0085','2022-08-11 11:23:02','2022-08-11 11:23:02'),(0027,'uploads\\attachments\\49f35560-192d-11ed-99a7-b3f0f11c4de5.jpg','MOB0085','2022-08-11 11:23:02','2022-08-11 11:23:02'),(0028,'uploads\\attachments\\b5d22ce0-1958-11ed-81b1-cf0ba01a1044.pdf','DIS0086','2022-08-11 16:33:51','2022-08-11 16:33:51'),(0029,'uploads\\attachments\\b5d38c70-1958-11ed-81b1-cf0ba01a1044.jpg','DIS0086','2022-08-11 16:33:51','2022-08-11 16:33:51'),(0030,'uploads\\attachments\\b5eba850-1958-11ed-81b1-cf0ba01a1044.png','DIS0086','2022-08-11 16:33:51','2022-08-11 16:33:51'),(0032,'uploads\\attachments\\1447b350-1d17-11ed-b18c-4dcf4ec1bbd6.jpg','MOB0083','2022-08-16 10:54:08','2022-08-16 10:54:08'),(0033,'uploads\\attachments\\3ac43070-1d18-11ed-8f86-71998ea5749f.jpg','KIO0084','2022-08-16 11:02:22','2022-08-16 11:02:22'),(0034,'uploads\\attachments\\184f4a20-1d1d-11ed-b900-ffa48ed33a74.jpg','MOB0083','2022-08-16 11:37:11','2022-08-16 11:37:11'),(0035,'uploads\\attachments\\2c4cb810-228a-11ed-843a-6970cb44fc92.jpg','KIO0084','2022-08-23 09:20:36','2022-08-23 09:20:36'),(0036,'uploads\\attachments\\afe65800-235e-11ed-9435-4bb00d36c1e6.jpg','DIS0081','2022-08-24 10:41:50','2022-08-24 10:41:50'),(0037,'uploads\\attachments\\2dac8260-238b-11ed-9435-4bb00d36c1e6.jpg','DIS0086','2022-08-24 16:00:19','2022-08-24 16:00:19'),(0038,'uploads\\attachments\\30add610-243c-11ed-a496-5d8768897c1a.jpg','MOB0083','2022-08-25 13:07:25','2022-08-25 13:07:25'),(0039,'uploads\\attachments\\af8bac70-2912-11ed-8bcf-09034f41b41c.png','DIS0081','2022-08-31 16:52:56','2022-08-31 16:52:56'),(0040,'uploads\\attachments\\47cf58a0-29af-11ed-a8a0-33e00dd1ce0e.png','KIO0087','2022-09-01 11:33:52','2022-09-01 11:33:52'),(0041,'uploads\\attachments\\da8b6ab0-29b6-11ed-a75f-83d240da422f.png','KIO0088','2022-09-01 12:28:04','2022-09-01 12:28:04');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casesubjects`
--

DROP TABLE IF EXISTS `casesubjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casesubjects` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `severity` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `subproduct_id` int(4) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `subproduct_id` (`subproduct_id`),
  CONSTRAINT `casesubjects_ibfk_1` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_10` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_11` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_12` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_13` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_14` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_15` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_16` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_17` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_18` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_19` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_2` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_20` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_21` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_22` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_23` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_3` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_4` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_5` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_6` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_7` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_8` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `casesubjects_ibfk_9` FOREIGN KEY (`subproduct_id`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casesubjects`
--

LOCK TABLES `casesubjects` WRITE;
/*!40000 ALTER TABLE `casesubjects` DISABLE KEYS */;
INSERT INTO `casesubjects` VALUES (0001,'Kiosk SP1 CS1','MEDIUM','2022-07-29 16:09:11','2022-08-05 13:24:48',0001),(0002,'Kiosk SP1 CS2','HIGH','2022-07-29 16:09:22','2022-08-05 13:25:05',0001),(0003,'Kiosk SP3 CS1','CRITICAL','2022-07-29 16:09:30','2022-08-05 13:25:21',0003),(0004,'Kiosk SP2 CS1','MEDIUM','2022-07-29 16:09:40','2022-08-05 13:25:33',0002),(0005,'Kiosk SP3 CS2','LOW','2022-07-29 16:09:51','2022-08-05 13:25:48',0003),(0006,'Kiosk SP3 CS3','HIGH','2022-07-29 16:10:01','2022-08-05 13:25:59',0003),(0007,'MW SP1 CS1','MEDIUM','2022-07-29 16:10:18','2022-08-05 13:26:08',0004),(0008,'MW SP2 CS1','HIGH','2022-07-29 16:10:28','2022-08-05 13:26:22',0005),(0009,'MW SP2 CS2','LOW','2022-07-29 16:10:35','2022-08-24 10:41:02',0005),(0010,'Disb SP1 CS1','CRITICAL','2022-08-04 08:47:15','2022-08-10 17:15:58',0006),(0011,'Disb SP1 CS2','HIGH','2022-08-11 09:50:21','2022-08-11 09:50:21',0006);
/*!40000 ALTER TABLE `casesubjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `comment_body` text NOT NULL,
  `user_id` int unsigned NOT NULL,
  `ticket_id` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `attachment_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comments_ticket_id` (`ticket_id`),
  KEY `comments_ibfk_252` (`attachment_id`),
  KEY `comments_ibfk_99` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_10` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_100` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_101` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_102` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_103` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_104` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_105` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_106` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_107` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_108` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_109` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_11` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_110` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_111` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_112` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_113` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_114` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_115` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_116` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_117` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_118` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_119` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_12` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_120` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_121` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_122` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_123` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_124` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_125` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_126` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_127` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_128` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_129` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_13` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_130` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_131` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_132` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_133` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_134` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_135` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_136` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_137` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_138` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_139` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_14` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_140` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_141` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_142` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_143` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_144` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_145` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_146` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_147` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_148` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_149` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_15` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_150` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_151` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_152` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_153` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_154` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_155` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_156` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_157` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_158` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_159` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_16` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_160` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_161` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_162` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_163` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_164` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_165` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_166` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_167` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_168` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_169` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_17` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_170` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_171` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_172` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_173` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_174` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_175` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_176` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_177` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_178` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_179` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_18` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_180` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_181` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_182` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_183` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_184` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_185` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_186` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_187` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_188` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_189` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_19` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_190` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_191` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_192` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_193` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_194` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_195` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_196` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_197` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_198` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_199` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_20` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_200` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_201` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_202` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_203` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_204` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_205` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_206` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_207` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_208` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_209` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_21` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_210` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_211` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_212` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_213` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_214` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_215` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_216` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_217` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_218` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_219` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_22` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_220` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_221` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_222` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_223` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_224` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_225` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_226` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_227` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_228` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_229` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_23` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_230` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_231` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_232` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_233` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_234` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_235` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_236` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_237` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_238` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_239` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_24` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_240` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_241` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_242` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_243` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_244` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_245` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_246` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_247` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_248` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_249` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_25` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_250` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_251` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_252` FOREIGN KEY (`attachment_id`) REFERENCES `attachments` (`attachment_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_26` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_27` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_28` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_29` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_30` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_31` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_32` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_33` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_34` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_35` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_36` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_37` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_38` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_39` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_40` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_41` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_42` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_43` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_44` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_45` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_46` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_47` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_48` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_49` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_50` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_51` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_52` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_53` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_54` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_55` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_56` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_57` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_58` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_59` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_6` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_60` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_61` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_62` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_63` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_64` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_65` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_66` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_67` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_68` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_69` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_7` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_70` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_71` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_72` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_73` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_74` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_75` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_76` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_77` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_78` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_79` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_8` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_80` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_81` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_82` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_83` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_84` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_85` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_86` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_87` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_88` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_89` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_9` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_90` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_91` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_92` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_93` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_94` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_95` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_96` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_97` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_98` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_99` FOREIGN KEY (`user_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (0053,'Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt.',2,'KIO0001','2022-08-08 17:46:45','2022-08-08 17:46:45',NULL),(0054,'Cras ultricies ligula sed magna dictum porta. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Proin eget tortor risus.',3,'MOB0083','2022-08-10 10:41:59','2022-08-10 10:41:59',NULL),(0055,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Vivamus suscipit tortor eget felis porttitor volutpat.',3,'KIO0084','2022-08-10 17:13:54','2022-08-10 17:13:54',NULL),(0056,'Hello',2,'DIS0082','2022-08-12 09:55:43','2022-08-12 09:55:43',NULL),(0057,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh.',3,'DIS0082','2022-08-12 10:08:56','2022-08-12 10:08:56',NULL),(0058,'Test',2,'MOB0083','2022-08-16 10:43:01','2022-08-16 10:43:01',NULL),(0060,'Hello World',2,'MOB0083','2022-08-16 10:54:08','2022-08-16 10:54:08',32),(0061,'Test',2,'KIO0084','2022-08-16 11:02:00','2022-08-16 11:02:00',NULL),(0062,'Test with Attachment',2,'KIO0084','2022-08-16 11:02:22','2022-08-16 11:02:22',33),(0063,'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh.',3,'MOB0083','2022-08-16 11:36:47','2022-08-16 11:36:47',NULL),(0064,'This is attachment',3,'MOB0083','2022-08-16 11:37:11','2022-08-16 11:37:11',34),(0065,'Donec rutrum congue leo eget malesuada. Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada.',2,'MOB0083','2022-08-16 11:40:50','2022-08-16 11:40:50',NULL),(0066,'Sed porttitor lectus nibh. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.',2,'KIO0084','2022-08-23 09:20:09','2022-08-23 09:20:09',NULL),(0067,'Hello Comment with Attachment',2,'KIO0084','2022-08-23 09:20:36','2022-08-23 09:20:36',35),(0068,'Pellentesque in ipsum id orci porta dapibus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Donec rutrum congue leo eget malesuada.',2,'DIS0075','2022-08-23 15:04:06','2022-08-23 15:04:06',NULL),(0069,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Curabitur aliquet quam id dui posuere blandit.',2,'DIS0081','2022-08-23 15:16:38','2022-08-23 15:16:38',NULL),(0070,'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Donec rutrum congue leo eget malesuada.',2,'DIS0075','2022-08-23 21:09:21','2022-08-23 21:09:21',NULL),(0071,'Pellentesque in ipsum id orci porta dapibus. Cras ultricies ligula sed magna dictum porta. Quisque velit nisi, pretium ut lacinia in, elementum id enim.',3,'DIS0081','2022-08-24 10:41:39','2022-08-24 10:41:39',NULL),(0072,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Nulla quis lorem ut libero malesuada feugiat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.',3,'DIS0081','2022-08-24 10:41:50','2022-08-24 10:41:50',36),(0073,'Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.',2,'DIS0086','2022-08-24 15:59:40','2022-08-24 15:59:40',NULL),(0074,'Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Cras ultricies ligula sed magna dictum porta.',3,'DIS0086','2022-08-24 15:59:51','2022-08-24 15:59:51',NULL),(0075,'Donec rutrum congue leo eget malesuada. Nulla porttitor accumsan tincidunt. Cras ultricies ligula sed magna dictum porta.',2,'DIS0086','2022-08-24 16:00:00','2022-08-24 16:00:00',NULL),(0076,'Nulla porttitor accumsan tincidunt. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.',2,'DIS0086','2022-08-24 16:00:19','2022-08-24 16:00:19',37),(0077,'Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Nulla quis lorem ut libero malesuada feugiat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',2,'DIS0081','2022-08-25 12:46:19','2022-08-25 12:46:19',NULL),(0078,'Pellentesque in ipsum id orci porta dapibus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',3,'DIS0081','2022-08-25 12:50:25','2022-08-25 12:50:25',NULL),(0079,'Sed porttitor lectus nibh. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt.',3,'KIO0080','2022-08-25 12:55:42','2022-08-25 12:55:42',NULL),(0080,'Test',2,'MOB0083','2022-08-25 13:07:25','2022-08-25 13:07:25',38),(0081,'Sed porttitor lectus nibh. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',2,'MOB0077','2022-08-30 16:55:36','2022-08-30 16:55:36',NULL),(0082,'Test',2,'DIS0081','2022-08-31 16:52:55','2022-08-31 16:52:56',39);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationchanges`
--

DROP TABLE IF EXISTS `notificationchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificationchanges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notification_object_id` int unsigned NOT NULL,
  `actor_id` int unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notificationchanges_ibfk_8` (`actor_id`),
  KEY `notificationchanges_ibfk_9` (`notification_object_id`),
  CONSTRAINT `notificationchanges_ibfk_1` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_10` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_11` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_12` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_13` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_14` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_15` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_16` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_17` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_18` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_19` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_20` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_21` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_22` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_23` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_24` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_25` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_26` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_27` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_28` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_29` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_3` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_30` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_31` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_32` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_33` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_34` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_35` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_36` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_37` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_38` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_39` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_4` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_40` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_41` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_42` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_43` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_44` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_45` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_46` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_47` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_48` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_49` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_5` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_50` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_51` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_52` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_53` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_54` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_55` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_56` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_57` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_58` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_59` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_6` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_60` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_61` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_62` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_63` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_64` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_65` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_66` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_67` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_68` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_69` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_7` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_70` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_71` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_72` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_8` FOREIGN KEY (`actor_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notificationchanges_ibfk_9` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationchanges`
--

LOCK TABLES `notificationchanges` WRITE;
/*!40000 ALTER TABLE `notificationchanges` DISABLE KEYS */;
INSERT INTO `notificationchanges` VALUES (132,137,3,'2022-08-08 14:05:24','2022-08-08 14:05:24'),(133,138,3,'2022-08-08 14:06:09','2022-08-08 14:06:09'),(134,139,2,'2022-08-08 15:59:53','2022-08-08 15:59:53'),(135,140,3,'2022-08-08 16:02:08','2022-08-08 16:02:08'),(136,141,3,'2022-08-08 16:02:45','2022-08-08 16:02:45'),(137,142,3,'2022-08-08 16:03:28','2022-08-08 16:03:28'),(138,143,2,'2022-08-08 17:46:45','2022-08-08 17:46:45'),(139,144,3,'2022-08-09 10:53:47','2022-08-09 10:53:47'),(140,145,3,'2022-08-09 15:38:58','2022-08-09 15:38:58'),(141,146,3,'2022-08-09 15:41:49','2022-08-09 15:41:49'),(142,147,3,'2022-08-09 15:42:47','2022-08-09 15:42:47'),(143,148,3,'2022-08-09 15:43:35','2022-08-09 15:43:35'),(144,149,3,'2022-08-09 16:05:34','2022-08-09 16:05:34'),(145,150,2,'2022-08-09 16:22:26','2022-08-09 16:22:26'),(146,151,3,'2022-08-09 16:22:55','2022-08-09 16:22:55'),(147,152,3,'2022-08-09 16:24:40','2022-08-09 16:24:40'),(148,153,3,'2022-08-09 16:25:57','2022-08-09 16:25:57'),(149,154,3,'2022-08-09 16:29:59','2022-08-09 16:29:59'),(150,155,3,'2022-08-10 10:08:07','2022-08-10 10:08:07'),(151,156,3,'2022-08-10 10:41:59','2022-08-10 10:41:59'),(152,157,2,'2022-08-10 10:42:48','2022-08-10 10:42:48'),(153,158,3,'2022-08-10 17:13:54','2022-08-10 17:13:54'),(154,159,4,'2022-08-11 11:23:02','2022-08-11 11:23:02'),(155,160,2,'2022-08-11 13:06:47','2022-08-11 13:06:47'),(156,161,2,'2022-08-11 13:06:49','2022-08-11 13:06:49'),(157,162,2,'2022-08-11 16:33:51','2022-08-11 16:33:51'),(158,163,2,'2022-08-12 09:55:29','2022-08-12 09:55:29'),(159,164,2,'2022-08-12 09:55:43','2022-08-12 09:55:43'),(160,165,3,'2022-08-12 10:08:56','2022-08-12 10:08:56'),(161,166,3,'2022-08-12 10:09:29','2022-08-12 10:09:29'),(162,167,2,'2022-08-16 10:43:01','2022-08-16 10:43:01'),(164,169,2,'2022-08-16 10:54:08','2022-08-16 10:54:08'),(165,170,2,'2022-08-16 11:02:00','2022-08-16 11:02:00'),(166,171,2,'2022-08-16 11:02:22','2022-08-16 11:02:22'),(167,172,3,'2022-08-16 11:36:47','2022-08-16 11:36:47'),(168,173,3,'2022-08-16 11:37:11','2022-08-16 11:37:11'),(169,174,2,'2022-08-16 11:40:50','2022-08-16 11:40:50'),(170,175,2,'2022-08-23 09:20:09','2022-08-23 09:20:09'),(171,176,2,'2022-08-23 09:20:36','2022-08-23 09:20:36'),(172,177,2,'2022-08-23 15:04:06','2022-08-23 15:04:06'),(173,178,2,'2022-08-23 15:16:26','2022-08-23 15:16:26'),(174,179,2,'2022-08-23 15:16:38','2022-08-23 15:16:38'),(175,180,2,'2022-08-23 21:09:21','2022-08-23 21:09:21'),(176,181,3,'2022-08-24 10:41:39','2022-08-24 10:41:39'),(177,182,3,'2022-08-24 10:41:50','2022-08-24 10:41:50'),(178,183,3,'2022-08-24 10:42:25','2022-08-24 10:42:25'),(179,184,3,'2022-08-24 15:59:29','2022-08-24 15:59:29'),(180,185,2,'2022-08-24 15:59:40','2022-08-24 15:59:40'),(181,186,3,'2022-08-24 15:59:51','2022-08-24 15:59:51'),(182,187,2,'2022-08-24 16:00:00','2022-08-24 16:00:00'),(183,188,2,'2022-08-24 16:00:19','2022-08-24 16:00:19'),(184,189,2,'2022-08-24 16:00:31','2022-08-24 16:00:31'),(185,190,2,'2022-08-25 12:46:19','2022-08-25 12:46:19'),(186,191,3,'2022-08-25 12:50:25','2022-08-25 12:50:25'),(187,192,2,'2022-08-25 12:55:27','2022-08-25 12:55:27'),(188,193,3,'2022-08-25 12:55:42','2022-08-25 12:55:42'),(189,194,2,'2022-08-25 13:07:25','2022-08-25 13:07:25'),(190,195,2,'2022-08-30 16:55:24','2022-08-30 16:55:24'),(191,196,2,'2022-08-30 16:55:36','2022-08-30 16:55:36'),(192,197,2,'2022-08-31 16:52:56','2022-08-31 16:52:56'),(193,198,2,'2022-09-01 11:33:52','2022-09-01 11:33:52'),(194,199,2,'2022-09-01 12:28:04','2022-09-01 12:28:04');
/*!40000 ALTER TABLE `notificationchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificationobjects`
--

DROP TABLE IF EXISTS `notificationobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificationobjects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `entity_id` int(4) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificationobjects`
--

LOCK TABLES `notificationobjects` WRITE;
/*!40000 ALTER TABLE `notificationobjects` DISABLE KEYS */;
INSERT INTO `notificationobjects` VALUES (137,'TICKET_CREATE','2022-08-08 14:05:24','2022-08-08 14:05:24',0073),(138,'TICKET_CREATE','2022-08-08 14:06:09','2022-08-08 14:06:09',0074),(139,'TICKET_PROGRESS','2022-08-08 15:59:53','2022-08-08 15:59:53',0073),(140,'TICKET_CREATE','2022-08-08 16:02:08','2022-08-08 16:02:08',0075),(141,'TICKET_CREATE','2022-08-08 16:02:45','2022-08-08 16:02:45',0076),(142,'TICKET_CREATE','2022-08-08 16:03:28','2022-08-08 16:03:28',0077),(143,'TICKET_COMMENT','2022-08-08 17:46:45','2022-08-08 17:46:45',0053),(144,'TICKET_CREATE','2022-08-09 10:53:47','2022-08-09 10:53:47',0078),(145,'TICKET_CREATE','2022-08-09 15:38:58','2022-08-09 15:38:58',0079),(146,'TICKET_CREATE','2022-08-09 15:41:49','2022-08-09 15:41:49',0080),(147,'TICKET_CREATE','2022-08-09 15:42:47','2022-08-09 15:42:47',0081),(148,'TICKET_CREATE','2022-08-09 15:43:35','2022-08-09 15:43:35',0082),(149,'TICKET_CLOSED','2022-08-09 16:05:34','2022-08-09 16:05:34',0073),(150,'TICKET_CREATE','2022-08-09 16:22:26','2022-08-09 16:22:26',0083),(151,'TICKET_PROGRESS','2022-08-09 16:22:55','2022-08-09 16:22:55',0083),(152,'TICKET_PROGRESS','2022-08-09 16:24:40','2022-08-09 16:24:40',0083),(153,'TICKET_PROGRESS','2022-08-09 16:25:57','2022-08-09 16:25:57',0083),(154,'TICKET_PROGRESS','2022-08-09 16:29:59','2022-08-09 16:29:59',0083),(155,'TICKET_CREATE','2022-08-10 10:08:07','2022-08-10 10:08:07',0084),(156,'TICKET_COMMENT','2022-08-10 10:41:59','2022-08-10 10:41:59',0054),(157,'TICKET_PROGRESS','2022-08-10 10:42:48','2022-08-10 10:42:48',0084),(158,'TICKET_COMMENT','2022-08-10 17:13:54','2022-08-10 17:13:54',0055),(159,'TICKET_CREATE','2022-08-11 11:23:02','2022-08-11 11:23:02',0085),(160,'TICKET_PROGRESS','2022-08-11 13:06:47','2022-08-11 13:06:47',0075),(161,'TICKET_PROGRESS','2022-08-11 13:06:49','2022-08-11 13:06:49',0074),(162,'TICKET_CREATE','2022-08-11 16:33:51','2022-08-11 16:33:51',0086),(163,'TICKET_PROGRESS','2022-08-12 09:55:29','2022-08-12 09:55:29',0082),(164,'TICKET_COMMENT','2022-08-12 09:55:43','2022-08-12 09:55:43',0056),(165,'TICKET_COMMENT','2022-08-12 10:08:56','2022-08-12 10:08:56',0057),(166,'TICKET_CLOSED','2022-08-12 10:09:29','2022-08-12 10:09:29',0082),(167,'TICKET_COMMENT','2022-08-16 10:43:01','2022-08-16 10:43:01',0058),(169,'TICKET_COMMENT','2022-08-16 10:54:08','2022-08-16 10:54:08',0060),(170,'TICKET_COMMENT','2022-08-16 11:02:00','2022-08-16 11:02:00',0061),(171,'TICKET_COMMENT','2022-08-16 11:02:22','2022-08-16 11:02:22',0062),(172,'TICKET_COMMENT','2022-08-16 11:36:47','2022-08-16 11:36:47',0063),(173,'TICKET_COMMENT','2022-08-16 11:37:11','2022-08-16 11:37:11',0064),(174,'TICKET_COMMENT','2022-08-16 11:40:50','2022-08-16 11:40:50',0065),(175,'TICKET_COMMENT','2022-08-23 09:20:09','2022-08-23 09:20:09',0066),(176,'TICKET_COMMENT','2022-08-23 09:20:36','2022-08-23 09:20:36',0067),(177,'TICKET_COMMENT','2022-08-23 15:04:06','2022-08-23 15:04:06',0068),(178,'TICKET_PROGRESS','2022-08-23 15:16:26','2022-08-23 15:16:26',0081),(179,'TICKET_COMMENT','2022-08-23 15:16:38','2022-08-23 15:16:38',0069),(180,'TICKET_COMMENT','2022-08-23 21:09:21','2022-08-23 21:09:21',0070),(181,'TICKET_COMMENT','2022-08-24 10:41:39','2022-08-24 10:41:39',0071),(182,'TICKET_COMMENT','2022-08-24 10:41:50','2022-08-24 10:41:50',0072),(183,'TICKET_CLOSED','2022-08-24 10:42:25','2022-08-24 10:42:25',0084),(184,'TICKET_PROGRESS','2022-08-24 15:59:29','2022-08-24 15:59:29',0086),(185,'TICKET_COMMENT','2022-08-24 15:59:40','2022-08-24 15:59:40',0073),(186,'TICKET_COMMENT','2022-08-24 15:59:51','2022-08-24 15:59:51',0074),(187,'TICKET_COMMENT','2022-08-24 16:00:00','2022-08-24 16:00:00',0075),(188,'TICKET_COMMENT','2022-08-24 16:00:19','2022-08-24 16:00:19',0076),(189,'TICKET_CLOSED','2022-08-24 16:00:31','2022-08-24 16:00:31',0086),(190,'TICKET_COMMENT','2022-08-25 12:46:19','2022-08-25 12:46:19',0077),(191,'TICKET_COMMENT','2022-08-25 12:50:25','2022-08-25 12:50:25',0078),(192,'TICKET_PROGRESS','2022-08-25 12:55:27','2022-08-25 12:55:27',0080),(193,'TICKET_COMMENT','2022-08-25 12:55:42','2022-08-25 12:55:42',0079),(194,'TICKET_COMMENT','2022-08-25 13:07:25','2022-08-25 13:07:25',0080),(195,'TICKET_PROGRESS','2022-08-30 16:55:24','2022-08-30 16:55:24',0077),(196,'TICKET_COMMENT','2022-08-30 16:55:36','2022-08-30 16:55:36',0081),(197,'TICKET_COMMENT','2022-08-31 16:52:56','2022-08-31 16:52:56',0082),(198,'TICKET_CREATE','2022-09-01 11:33:52','2022-09-01 11:33:52',0087),(199,'TICKET_CREATE','2022-09-01 12:28:04','2022-09-01 12:28:04',0088);
/*!40000 ALTER TABLE `notificationobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notifier_id` int unsigned NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `notification_object_id` int unsigned NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'UNREAD',
  PRIMARY KEY (`id`),
  KEY `notifications_ibfk_8` (`notifier_id`),
  KEY `Notifications_notification_object_id_foreign_idx` (`notification_object_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_10` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_11` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_12` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_13` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_14` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_15` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_16` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_17` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_18` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_19` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_20` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_21` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_22` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_23` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_24` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_25` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_26` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_27` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_28` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_29` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_30` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_31` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_32` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_33` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_34` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_35` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_36` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_37` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_38` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_39` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_4` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_40` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_41` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_42` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_43` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_44` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_45` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_46` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_47` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_48` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_49` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_5` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_50` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_51` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_52` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_53` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_54` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_55` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_56` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_57` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_58` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_59` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_6` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_60` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_61` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_62` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_63` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_64` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_65` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_66` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_67` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_68` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_69` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_7` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_70` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_71` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_8` FOREIGN KEY (`notifier_id`) REFERENCES `x-users` (`user_id`) ON UPDATE CASCADE,
  CONSTRAINT `notifications_ibfk_9` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Notifications_notification_object_id_foreign_idx` FOREIGN KEY (`notification_object_id`) REFERENCES `notificationobjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (124,2,'2022-08-08 14:05:24','2022-08-08 15:04:31',137,'READ'),(125,2,'2022-08-08 14:06:09','2022-08-08 15:04:31',138,'READ'),(126,3,'2022-08-08 15:59:53','2022-08-08 16:00:36',139,'READ'),(127,2,'2022-08-08 16:02:08','2022-08-08 17:46:10',140,'READ'),(128,2,'2022-08-08 16:02:46','2022-08-08 17:46:10',141,'READ'),(129,2,'2022-08-08 16:03:28','2022-08-08 17:46:10',142,'READ'),(130,3,'2022-08-08 17:46:45','2022-08-09 09:38:27',143,'READ'),(131,2,'2022-08-09 10:53:47','2022-08-09 16:21:32',144,'READ'),(132,2,'2022-08-09 15:38:58','2022-08-09 16:21:32',145,'READ'),(133,2,'2022-08-09 15:41:49','2022-08-09 16:21:32',146,'READ'),(134,2,'2022-08-09 15:42:47','2022-08-09 16:21:32',147,'READ'),(135,2,'2022-08-09 15:43:35','2022-08-09 16:21:32',148,'READ'),(136,2,'2022-08-09 16:05:34','2022-08-09 16:21:32',149,'READ'),(137,3,'2022-08-09 16:22:26','2022-08-09 16:22:42',150,'READ'),(138,2,'2022-08-09 16:22:55','2022-08-10 10:06:46',151,'READ'),(139,2,'2022-08-09 16:24:40','2022-08-10 10:06:46',152,'READ'),(140,2,'2022-08-09 16:25:57','2022-08-10 10:06:46',153,'READ'),(141,2,'2022-08-09 16:29:59','2022-08-10 10:06:46',154,'READ'),(142,2,'2022-08-10 10:08:07','2022-08-10 10:42:22',155,'READ'),(143,2,'2022-08-10 10:41:59','2022-08-10 10:42:22',156,'READ'),(144,3,'2022-08-10 10:42:48','2022-08-10 17:13:45',157,'READ'),(145,2,'2022-08-10 17:13:55','2022-08-11 09:46:46',158,'READ'),(146,2,'2022-08-11 11:23:02','2022-08-11 11:24:27',159,'READ'),(147,3,'2022-08-11 13:06:47','2022-08-11 15:59:47',160,'READ'),(148,3,'2022-08-11 13:06:49','2022-08-11 15:59:47',161,'READ'),(149,3,'2022-08-11 16:33:51','2022-08-12 10:08:41',162,'READ'),(150,3,'2022-08-12 09:55:29','2022-08-12 10:08:41',163,'READ'),(151,3,'2022-08-12 09:55:43','2022-08-12 10:08:41',164,'READ'),(152,2,'2022-08-12 10:08:56','2022-08-12 10:09:42',165,'READ'),(153,2,'2022-08-12 10:09:29','2022-08-12 10:09:42',166,'READ'),(154,3,'2022-08-16 10:43:01','2022-08-16 11:11:49',167,'READ'),(156,3,'2022-08-16 10:54:08','2022-08-16 11:11:49',169,'READ'),(157,3,'2022-08-16 11:02:00','2022-08-16 11:11:49',170,'READ'),(158,3,'2022-08-16 11:02:22','2022-08-16 11:11:49',171,'READ'),(159,2,'2022-08-16 11:36:47','2022-08-16 11:37:20',172,'READ'),(160,2,'2022-08-16 11:37:11','2022-08-16 11:37:20',173,'READ'),(161,3,'2022-08-16 11:40:50','2022-08-23 13:56:24',174,'READ'),(162,3,'2022-08-23 09:20:09','2022-08-23 13:56:24',175,'READ'),(163,3,'2022-08-23 09:20:36','2022-08-23 13:56:24',176,'READ'),(164,3,'2022-08-23 15:04:06','2022-08-23 15:19:00',177,'READ'),(165,3,'2022-08-23 15:16:26','2022-08-23 15:19:00',178,'READ'),(166,3,'2022-08-23 15:16:38','2022-08-23 15:19:00',179,'READ'),(167,3,'2022-08-23 21:09:21','2022-08-24 10:41:22',180,'READ'),(168,2,'2022-08-24 10:41:39','2022-08-24 10:42:51',181,'READ'),(169,2,'2022-08-24 10:41:50','2022-08-24 10:42:51',182,'READ'),(170,2,'2022-08-24 10:42:25','2022-08-24 10:42:51',183,'READ'),(171,2,'2022-08-24 15:59:29','2022-08-24 15:59:33',184,'READ'),(172,3,'2022-08-24 15:59:40','2022-08-24 15:59:42',185,'READ'),(173,2,'2022-08-24 15:59:51','2022-08-24 15:59:53',186,'READ'),(174,3,'2022-08-24 16:00:00','2022-08-24 16:00:34',187,'READ'),(175,3,'2022-08-24 16:00:19','2022-08-24 16:00:34',188,'READ'),(176,3,'2022-08-24 16:00:31','2022-08-24 16:00:34',189,'READ'),(177,3,'2022-08-25 12:46:19','2022-08-25 12:46:32',190,'READ'),(178,2,'2022-08-25 12:50:25','2022-08-25 12:50:40',191,'READ'),(179,3,'2022-08-25 12:55:27','2022-08-25 12:55:34',192,'READ'),(180,2,'2022-08-25 12:55:42','2022-08-25 12:55:49',193,'READ'),(181,3,'2022-08-25 13:07:25','2022-08-30 16:55:43',194,'READ'),(182,3,'2022-08-30 16:55:24','2022-08-30 16:55:43',195,'READ'),(183,3,'2022-08-30 16:55:36','2022-08-30 16:55:43',196,'READ'),(184,3,'2022-08-31 16:52:56','2022-08-31 16:52:56',197,'UNREAD'),(185,2,'2022-09-01 11:33:52','2022-09-01 12:27:19',198,'READ'),(186,2,'2022-09-01 12:28:04','2022-09-01 12:28:06',199,'READ');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_desc` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (0001,'Kiosk','Kiosk Product','2022-07-29 16:06:19','2022-07-29 16:06:19'),(0002,'MobileWallet','MobileWallet Product','2022-07-29 16:06:32','2022-07-29 16:06:32'),(0003,'Disbursement','Disbursement Product','2022-07-29 16:06:45','2022-07-29 16:06:45');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subproducts`
--

DROP TABLE IF EXISTS `subproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subproducts` (
  `subproduct_id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `subproduct_name` varchar(255) NOT NULL,
  `subproduct_desc` varchar(255) DEFAULT NULL,
  `product_id` int(4) unsigned zerofill NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`subproduct_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `subproducts_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_10` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_100` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_101` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_102` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_103` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_104` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_105` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_106` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_107` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_108` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_109` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_11` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_110` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_111` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_112` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_113` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_114` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_115` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_116` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_117` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_118` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_119` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_12` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_120` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_121` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_122` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_123` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_124` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_125` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_126` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_127` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_128` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_129` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_13` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_130` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_131` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_132` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_133` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_134` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_135` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_136` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_137` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_138` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_139` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_14` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_140` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_141` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_142` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_143` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_144` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_15` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_16` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_17` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_18` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_19` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_20` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_21` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_22` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_23` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_24` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_25` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_26` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_27` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_28` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_29` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_30` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_31` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_32` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_33` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_34` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_35` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_36` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_37` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_38` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_39` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_40` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_41` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_42` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_43` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_44` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_45` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_46` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_47` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_48` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_49` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_5` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_50` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_51` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_52` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_53` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_54` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_55` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_56` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_57` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_58` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_59` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_6` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_60` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_61` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_62` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_63` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_64` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_65` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_66` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_67` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_68` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_69` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_7` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_70` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_71` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_72` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_73` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_74` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_75` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_76` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_77` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_78` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_79` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_8` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_80` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_81` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_82` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_83` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_84` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_85` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_86` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_87` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_88` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_89` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_9` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_90` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_91` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_92` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_93` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_94` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_95` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_96` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_97` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_98` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subproducts_ibfk_99` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subproducts`
--

LOCK TABLES `subproducts` WRITE;
/*!40000 ALTER TABLE `subproducts` DISABLE KEYS */;
INSERT INTO `subproducts` VALUES (0001,'Kiosk SP1','Kiosk SP1',0001,'2022-07-29 16:07:08','2022-07-29 16:07:08'),(0002,'Kiosk SP2','Kiosk SP2',0001,'2022-07-29 16:07:30','2022-07-29 16:07:30'),(0003,'Kiosk SP3','Kiosk SP3',0001,'2022-07-29 16:07:41','2022-07-29 16:07:41'),(0004,'MW SP1','MW SP1',0002,'2022-07-29 16:07:56','2022-07-29 16:07:56'),(0005,'MW SP2','MW SP2',0002,'2022-07-29 16:08:19','2022-07-29 16:08:19'),(0006,'Disb SP1','Disb SP1',0003,'2022-07-29 16:08:31','2022-07-29 16:08:31'),(0008,'Disb SP2','Disbursement Subproduct 2',0003,'2022-08-24 10:40:48','2022-08-24 10:40:48');
/*!40000 ALTER TABLE `subproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `cust_name` varchar(255) NOT NULL,
  `cust_no` varchar(255) NOT NULL,
  `cust_email` varchar(255) NOT NULL,
  `product` int(4) unsigned zerofill NOT NULL,
  `subproduct` int(4) unsigned zerofill NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `casesubject` int(4) unsigned zerofill NOT NULL,
  `description` text NOT NULL,
  `created_by` int unsigned NOT NULL,
  `modified_by` varchar(255) DEFAULT NULL,
  `pic_id` int unsigned DEFAULT NULL,
  `status` varchar(255) DEFAULT 'OPEN',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `sla` int DEFAULT NULL,
  `solution` text,
  `closed_date` datetime DEFAULT NULL,
  `created_by_dept` varchar(255) DEFAULT NULL,
  `private` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tickets_ticket_id` (`ticket_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  UNIQUE KEY `ticket_id_2` (`ticket_id`),
  UNIQUE KEY `ticket_id_3` (`ticket_id`),
  UNIQUE KEY `ticket_id_4` (`ticket_id`),
  UNIQUE KEY `ticket_id_5` (`ticket_id`),
  UNIQUE KEY `ticket_id_6` (`ticket_id`),
  UNIQUE KEY `ticket_id_7` (`ticket_id`),
  UNIQUE KEY `ticket_id_8` (`ticket_id`),
  UNIQUE KEY `ticket_id_9` (`ticket_id`),
  UNIQUE KEY `ticket_id_10` (`ticket_id`),
  UNIQUE KEY `ticket_id_11` (`ticket_id`),
  UNIQUE KEY `ticket_id_12` (`ticket_id`),
  UNIQUE KEY `ticket_id_13` (`ticket_id`),
  UNIQUE KEY `ticket_id_14` (`ticket_id`),
  UNIQUE KEY `ticket_id_15` (`ticket_id`),
  UNIQUE KEY `ticket_id_16` (`ticket_id`),
  UNIQUE KEY `ticket_id_17` (`ticket_id`),
  UNIQUE KEY `ticket_id_18` (`ticket_id`),
  UNIQUE KEY `ticket_id_19` (`ticket_id`),
  UNIQUE KEY `ticket_id_20` (`ticket_id`),
  UNIQUE KEY `ticket_id_21` (`ticket_id`),
  UNIQUE KEY `ticket_id_22` (`ticket_id`),
  UNIQUE KEY `ticket_id_23` (`ticket_id`),
  UNIQUE KEY `ticket_id_24` (`ticket_id`),
  UNIQUE KEY `ticket_id_25` (`ticket_id`),
  UNIQUE KEY `ticket_id_26` (`ticket_id`),
  UNIQUE KEY `ticket_id_27` (`ticket_id`),
  UNIQUE KEY `ticket_id_28` (`ticket_id`),
  UNIQUE KEY `ticket_id_29` (`ticket_id`),
  UNIQUE KEY `ticket_id_30` (`ticket_id`),
  UNIQUE KEY `ticket_id_31` (`ticket_id`),
  UNIQUE KEY `ticket_id_32` (`ticket_id`),
  UNIQUE KEY `ticket_id_33` (`ticket_id`),
  UNIQUE KEY `ticket_id_34` (`ticket_id`),
  UNIQUE KEY `ticket_id_35` (`ticket_id`),
  KEY `tickets_ibfk_463` (`created_by`),
  KEY `tickets_ibfk_464` (`pic_id`),
  KEY `tickets_casesubject` (`casesubject`),
  KEY `tickets_product` (`product`),
  KEY `tickets_subproduct` (`subproduct`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`subproduct`) REFERENCES `subproducts` (`subproduct_id`) ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`casesubject`) REFERENCES `casesubjects` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (0073,'KIO0001','Gedung Prima Sejahtera','Reinhard','08119251301','reinhardkevin.rk@gmail.com',0001,0003,'IT',0005,'Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus nibh. Pellentesque in ipsum id orci porta dapibus.',3,NULL,2,'CLOSED','2022-08-08 14:05:24','2022-08-09 16:05:34',NULL,'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Pellentesque in ipsum id orci porta dapibus.','2022-08-09 16:05:34','OPR',0),(0074,'MOB0074','Indomaret','Budi','081122837421','budi@gmail.com',0002,0005,'IT',0009,'Donec rutrum congue leo eget malesuada. Donec sollicitudin molestie malesuada. Cras ultricies ligula sed magna dictum porta.',3,NULL,2,'PROGRESS','2022-08-08 14:06:09','2022-08-25 09:51:16',-6,NULL,NULL,'OPR',0),(0075,'DIS0075','Indomaret','Andi','082232312381','andi@gmail.com',0003,0006,'IT',0010,'Nulla porttitor accumsan tincidunt. Proin eget tortor risus. Sed porttitor lectus nibh.',3,NULL,2,'PROGRESS','2022-08-08 16:02:08','2022-08-25 09:51:16',-15,NULL,NULL,'OPR',0),(0076,'KIO0076','Alfamart','Siti','0822327182346','siti@gmail.com',0001,0002,'IT',0004,'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.',3,NULL,NULL,'OPEN','2022-08-08 16:02:45','2022-08-25 09:51:16',-11,NULL,NULL,'OPR',0),(0077,'MOB0077','MCD','Rinto','081192932182','rinto@gmail.com',0002,0004,'IT',0007,'Sed porttitor lectus nibh. Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem.',3,NULL,2,'PROGRESS','2022-08-08 16:03:28','2022-08-30 16:55:24',-11,NULL,NULL,'OPR',0),(0078,'MOB0078','MCD','Dusun','082137371246','dusun@gmail.com',0002,0004,'IT',0007,'Pellentesque in ipsum id orci porta dapibus. Vivamus suscipit tortor eget felis porttitor volutpat. Vivamus suscipit tortor eget felis porttitor volutpat.',3,NULL,NULL,'OPEN','2022-08-09 10:53:47','2022-08-25 12:49:50',-11,NULL,NULL,'OPR',0),(0079,'KIO0079','Kelapa Gading','Santoso','082318183721','santoso@gmail.com',0001,0002,'IT',0004,'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla quis lorem ut libero malesuada feugiat. Proin eget tortor risus.',3,NULL,NULL,'OPEN','2022-08-09 15:38:58','2022-08-25 09:51:16',-10,NULL,NULL,'OPR',0),(0080,'KIO0080','Kelapa Gading','Santoso','082318183721','santoso@gmail.com',0001,0002,'IT',0004,'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Nulla quis lorem ut libero malesuada feugiat. Proin eget tortor risus.',3,NULL,2,'PROGRESS','2022-08-09 15:41:49','2022-08-25 12:55:27',-10,NULL,NULL,'OPR',0),(0081,'DIS0081','Alfamart','Tono','08231273132','tono@gmail.com',0003,0006,'IT',0010,'Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.',3,NULL,2,'PROGRESS','2022-08-09 15:42:47','2022-08-25 09:51:16',-14,NULL,NULL,'OPR',0),(0082,'DIS0082','Alfamart','Tono','08231273132','tono@gmail.com',0003,0006,'IT',0010,'Pellentesque in ipsum id orci porta dapibus. Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.',3,NULL,2,'CLOSED','2022-08-09 15:43:35','2022-08-12 10:09:29',NULL,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Sed porttitor lectus nibh.','2022-08-12 10:09:29','OPR',0),(0083,'MOB0083','Indomaret','Sanjaya','083213712381','sanjaya@gmail.com',0002,0005,'OPR',0008,'Sed porttitor lectus nibh. Proin eget tortor risus. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',2,NULL,3,'PROGRESS','2022-08-09 16:22:26','2022-08-25 09:51:16',-12,NULL,NULL,'IT',0),(0084,'KIO0084','Gedung Prima Sejahtera','Jono','081137372461','reinhardkevin.rk@gmail.com',0001,0003,'IT',0003,'Cras ultricies ligula sed magna dictum porta. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Donec sollicitudin molestie malesuada.',3,NULL,2,'CLOSED','2022-08-10 10:08:07','2022-08-24 10:42:25',NULL,'Cras ultricies ligula sed magna dictum porta. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit.','2022-08-24 10:42:25','OPR',0),(0085,'MOB0085','Gedung Prima Sejahtera','John','082232714262','john@gmail.com',0002,0005,'IT',0008,'Donec sollicitudin molestie malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Proin eget tortor risus.',4,NULL,NULL,'OPEN','2022-08-11 11:23:02','2022-08-25 12:49:50',-11,NULL,NULL,'MKT',0),(0086,'DIS0086','Indomaret','Reinhard','081137372416','reinhard@gmail.com',0003,0006,'OPR',0010,'Curabitur aliquet quam id dui posuere blandit. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.',2,NULL,3,'CLOSED','2022-08-11 16:33:51','2022-08-24 16:00:31',NULL,'Cras ultricies ligula sed magna dictum porta. Donec rutrum congue leo eget malesuada. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.','2022-08-24 16:00:31','IT',0),(0087,'KIO0087','GPS','Jono','08119249231','jono@gmail.com',0001,0002,'IT',0004,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur aliquet quam id dui posuere blandit. Sed porttitor lectus nibh.',2,NULL,NULL,'OPEN','2022-09-01 11:33:52','2022-09-01 11:33:52',4,NULL,NULL,'IT',0),(0088,'KIO0088','Gedung Prima Sejahtera','Yanto','081144722318','yan@to',0001,0001,'IT',0001,'Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.',2,NULL,NULL,'OPEN','2022-09-01 12:28:04','2022-09-01 12:28:04',5,NULL,NULL,'IT',0);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-01 12:37:29
