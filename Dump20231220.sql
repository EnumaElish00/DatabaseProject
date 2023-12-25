-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: emenu
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `ID` int NOT NULL,
  `Time` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Time` (`Time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
INSERT INTO `calendar` VALUES (1,'2023-01-01 00:00:00'),(2,'2023-02-01 00:00:00'),(3,'2023-03-01 00:00:00'),(4,'2023-04-01 00:00:00');
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID_Category` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Category`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'Dessert'),(1,'Drinks'),(2,'Main Course');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `ID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Pho',9.99),(2,'Pizza Hai San',12.50),(3,'Spaghetti',8.75),(4,'Sushi',15.99),(5,'Tempura',11.25),(6,'Chanh Day',14.50),(7,'Taiyaki',7.99),(8,'Kem Gelato',10.75),(9,'Che',13.50),(10,'Tiramisu',9.25);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_calendar`
--

DROP TABLE IF EXISTS `dish_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_calendar` (
  `ID_Dish` int NOT NULL,
  `ID_Calendar` int NOT NULL,
  PRIMARY KEY (`ID_Dish`,`ID_Calendar`),
  KEY `ID_Calendar` (`ID_Calendar`),
  CONSTRAINT `dish_calendar_ibfk_1` FOREIGN KEY (`ID_Dish`) REFERENCES `dish` (`ID`),
  CONSTRAINT `dish_calendar_ibfk_2` FOREIGN KEY (`ID_Calendar`) REFERENCES `calendar` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_calendar`
--

LOCK TABLES `dish_calendar` WRITE;
/*!40000 ALTER TABLE `dish_calendar` DISABLE KEYS */;
INSERT INTO `dish_calendar` VALUES (7,1),(8,2),(9,3),(10,4);
/*!40000 ALTER TABLE `dish_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_category`
--

DROP TABLE IF EXISTS `dish_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_category` (
  `ID_Dish` int NOT NULL,
  `ID_Category` int NOT NULL,
  PRIMARY KEY (`ID_Dish`,`ID_Category`),
  KEY `ID_Category` (`ID_Category`),
  CONSTRAINT `dish_category_ibfk_1` FOREIGN KEY (`ID_Dish`) REFERENCES `dish` (`ID`),
  CONSTRAINT `dish_category_ibfk_2` FOREIGN KEY (`ID_Category`) REFERENCES `category` (`ID_Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_category`
--

LOCK TABLES `dish_category` WRITE;
/*!40000 ALTER TABLE `dish_category` DISABLE KEYS */;
INSERT INTO `dish_category` VALUES (6,1),(1,2),(2,2),(3,2),(4,2),(5,2),(7,3),(8,3),(9,3),(10,3);
/*!40000 ALTER TABLE `dish_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_ingredient`
--

DROP TABLE IF EXISTS `dish_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_ingredient` (
  `ID_Dish` int NOT NULL,
  `ID_Ingredient` int NOT NULL,
  PRIMARY KEY (`ID_Dish`,`ID_Ingredient`),
  KEY `ID_Ingredient` (`ID_Ingredient`),
  CONSTRAINT `dish_ingredient_ibfk_1` FOREIGN KEY (`ID_Dish`) REFERENCES `dish` (`ID`),
  CONSTRAINT `dish_ingredient_ibfk_2` FOREIGN KEY (`ID_Ingredient`) REFERENCES `ingredient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_ingredient`
--

LOCK TABLES `dish_ingredient` WRITE;
/*!40000 ALTER TABLE `dish_ingredient` DISABLE KEYS */;
INSERT INTO `dish_ingredient` VALUES (1,1),(2,2),(3,2),(7,3),(1,4),(2,4),(3,4),(2,5),(3,5),(5,6),(4,7),(5,7),(6,8),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9),(5,11),(5,12),(9,13),(9,14),(6,15),(7,15),(8,15),(9,15),(10,15),(2,16),(3,16),(8,16),(10,17),(3,18),(4,19),(4,20);
/*!40000 ALTER TABLE `dish_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_origin`
--

DROP TABLE IF EXISTS `dish_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_origin` (
  `ID_Dish` int NOT NULL,
  `ID_Origin` int NOT NULL,
  PRIMARY KEY (`ID_Dish`,`ID_Origin`),
  KEY `ID_Origin` (`ID_Origin`),
  CONSTRAINT `dish_origin_ibfk_1` FOREIGN KEY (`ID_Dish`) REFERENCES `dish` (`ID`),
  CONSTRAINT `dish_origin_ibfk_2` FOREIGN KEY (`ID_Origin`) REFERENCES `origin` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_origin`
--

LOCK TABLES `dish_origin` WRITE;
/*!40000 ALTER TABLE `dish_origin` DISABLE KEYS */;
INSERT INTO `dish_origin` VALUES (1,1),(6,1),(9,1),(2,2),(3,2),(7,2),(8,2),(4,3),(5,3),(10,3);
/*!40000 ALTER TABLE `dish_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ID` int NOT NULL,
  `Unit_ID` int DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Import_date` date DEFAULT NULL,
  `Expire_date` date DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `Unit_ID` (`Unit_ID`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`Unit_ID`) REFERENCES `unit` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,1,'Rice Noodle','2023-01-01','2023-12-31',100),(2,1,'Flour','2023-02-01','2023-11-30',150),(3,1,'Leavening','2023-03-01','2023-10-31',120),(4,1,'Beef','2023-04-01','2023-09-30',80),(5,1,'Sausage','2023-05-01','2023-08-31',200),(6,1,'Shrimp','2023-06-01','2023-07-31',90),(7,1,'Salmon','2023-07-01','2023-06-30',110),(8,4,'Passion fruit','2023-08-01','2023-05-31',130),(9,1,'Sugar','2023-09-01','2023-04-30',70),(10,1,'Butter','2023-10-01','2023-03-31',180),(11,1,'Salt','2023-10-01','2023-03-31',180),(12,1,'Fried dough','2023-10-01','2023-03-31',180),(13,1,'Tapioca pearls','2023-10-01','2023-03-31',180),(14,4,'Lotus seeds','2023-10-01','2023-03-31',180),(15,2,'Milk','2023-10-01','2023-03-31',180),(16,1,'Cheese','2023-10-01','2023-03-31',180),(17,3,'Egg','2023-10-01','2023-03-31',180),(18,4,'Herb','2023-10-01','2023-03-31',180),(19,1,'Seaweed','2023-10-01','2023-03-31',180),(20,1,'Rice','2023-10-01','2023-03-31',180);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origin`
--

DROP TABLE IF EXISTS `origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `origin` (
  `ID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origin`
--

LOCK TABLES `origin` WRITE;
/*!40000 ALTER TABLE `origin` DISABLE KEYS */;
INSERT INTO `origin` VALUES (2,'Italian'),(3,'Japan'),(1,'VietNam');
/*!40000 ALTER TABLE `origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `ID` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (3,'Count'),(1,'Gram'),(2,'Milliliter'),(4,'Piece');
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-20  0:37:33
