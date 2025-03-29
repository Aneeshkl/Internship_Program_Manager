CREATE DATABASE  IF NOT EXISTS `internship_program_manager` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `internship_program_manager`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: internship_program_manager
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch` (
  `batchID` int NOT NULL AUTO_INCREMENT,
  `batchName` varchar(255) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `trainerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`batchID`),
  UNIQUE KEY `batchName_UNIQUE` (`batchName`),
  KEY `idx_batch_batchName` (`batchName`),
  KEY `fk_trainer` (`trainerName`),
  CONSTRAINT `fk_trainer` FOREIGN KEY (`trainerName`) REFERENCES `trainer` (`trainerName`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (7,'Batch1','Java','2024-01-21','2024-03-08','Narmi');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intern`
--

DROP TABLE IF EXISTS `intern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intern` (
  `internID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `course` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `shortDescription` varchar(200) DEFAULT NULL,
  `internDuration` varchar(255) DEFAULT NULL,
  `batchID` int DEFAULT NULL,
  `batchName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`internID`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `UK_phoneNumber` (`phoneNumber`),
  UNIQUE KEY `idx_name_email` (`name`,`email`),
  KEY `batchName` (`batchName`),
  KEY `batchID` (`batchID`),
  KEY `idx_name` (`name`),
  CONSTRAINT `intern_ibfk_1` FOREIGN KEY (`batchName`) REFERENCES `batch` (`batchName`),
  CONSTRAINT `intern_ibfk_2` FOREIGN KEY (`batchID`) REFERENCES `batch` (`batchID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intern`
--

LOCK TABLES `intern` WRITE;
/*!40000 ALTER TABLE `intern` DISABLE KEYS */;
INSERT INTO `intern` VALUES (12,'Rose','MKCE','CSE','1998-10-15','Female','aaa','8870254474','intern','3 months',7,'Batch1','$2a$12$fQ50IZrvxKN6a1IeRdVBh.3HEvrx6rPU5MpElP1xd4fhEWPng6Hfy','rose@gmail.com','Rose@1'),(15,'Manju','IT','CS','2001-06-20','Male','ssss','8870254472','intern','2 months',7,'Batch1','$2a$12$XIUO79jwZAKik57BXOOnueVNMFi0H8bEOkp6OXEZO36IJ6w9xICPC','manju@gmail.com','Manju@1'),(16,'Sanju','MKCE','CSE','2000-06-21','Male','abc','9123456781','intern','3 months',7,'Batch1','$2a$12$mnlrGjQ3wj8sA8jmxYmKmO97DFIE5MsW4pAwkkxt8YeyjBrYMuP0e','sanju@gmail.com','sanju@1');
/*!40000 ALTER TABLE `intern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance` (
  `performanceID` int NOT NULL AUTO_INCREMENT,
  `score` varchar(45) NOT NULL,
  `rank` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`performanceID`),
  KEY `name_idx` (`name`),
  KEY `email_idx` (`email`),
  KEY `fk_performance_tag` (`tag`),
  CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `intern` (`email`),
  CONSTRAINT `fk_performance_tag` FOREIGN KEY (`tag`) REFERENCES `test` (`tag`),
  CONSTRAINT `name` FOREIGN KEY (`name`) REFERENCES `intern` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES (18,'2/2','Pass','Rose','rose@gmail.com','Java'),(19,'2/2','Pass','Manju','manju@gmail.com','Java'),(23,'1/2','Pass','Sanju','sanju@gmail.com','Java'),(24,'1/2','Pass','Sanju','sanju@gmail.com','Java'),(25,'1/2','Pass','Sanju','sanju@gmail.com','Java');
/*!40000 ALTER TABLE `performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `questionID` int NOT NULL AUTO_INCREMENT,
  `question` varchar(450) NOT NULL,
  `option1` varchar(450) NOT NULL,
  `option2` varchar(450) NOT NULL,
  `option3` varchar(450) NOT NULL,
  `option4` varchar(450) NOT NULL,
  `correctAnswer` varchar(450) NOT NULL,
  `testID` int DEFAULT NULL,
  PRIMARY KEY (`questionID`),
  KEY `testID_idx` (`testID`),
  CONSTRAINT `testID` FOREIGN KEY (`testID`) REFERENCES `test` (`testID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (39,'what is jvm','java','virtual','machine','v','java,virtual,machine',22),(40,'what is jdbc','java','java database connectivity','database','virtual','java database connectivity',22);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `testID` int NOT NULL AUTO_INCREMENT,
  `tag` varchar(45) NOT NULL,
  `numOfQuestions` varchar(45) NOT NULL,
  PRIMARY KEY (`testID`),
  KEY `idx_test_tag` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (22,'Java','2');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testassign`
--

DROP TABLE IF EXISTS `testassign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testassign` (
  `AssignID` int NOT NULL AUTO_INCREMENT,
  `testID` int NOT NULL,
  `batchID` int NOT NULL,
  PRIMARY KEY (`AssignID`),
  KEY `fk_test_batch` (`batchID`),
  KEY `fk_test_tests` (`testID`),
  CONSTRAINT `fk_test_batch` FOREIGN KEY (`batchID`) REFERENCES `batch` (`batchID`),
  CONSTRAINT `fk_test_tests` FOREIGN KEY (`testID`) REFERENCES `test` (`testID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testassign`
--

LOCK TABLES `testassign` WRITE;
/*!40000 ALTER TABLE `testassign` DISABLE KEYS */;
INSERT INTO `testassign` VALUES (7,22,7);
/*!40000 ALTER TABLE `testassign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `trainerID` int NOT NULL AUTO_INCREMENT,
  `trainerName` varchar(255) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trainerID`),
  UNIQUE KEY `uc_Email` (`Email`),
  KEY `idx_trainerName` (`trainerName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (9,'Narmi','narmi@gmail.com','$2a$12$JcTdOMG/ucpH8D1gTiQ2/u1Gel9lGM1e7qdlIpuk846wCZDse843W','Narmi@1');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emaill_UNIQUE` (`email`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'Arul','$2a$12$QR76EZj0oMkLBpoXUIHW6uPEwVlC9jFdxYAR5UMKKben9thy1sY.K','arul@gmail.com'),(13,'Gayu','$2a$12$4jn/MxRZXaBe8JZq6RpgZugrC3u9n.Q0jBxeJRx0a90SObJ57sd4.','gayu@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-21 15:32:11
