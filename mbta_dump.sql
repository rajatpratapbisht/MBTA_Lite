CREATE DATABASE  IF NOT EXISTS `mbta_lite` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mbta_lite`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: mbta_lite
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `connectivity`
--

DROP TABLE IF EXISTS `connectivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connectivity` (
  `this_station` int NOT NULL,
  `next_station` int NOT NULL,
  `line_id` int NOT NULL,
  PRIMARY KEY (`this_station`,`next_station`,`line_id`),
  KEY `next_station` (`next_station`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `connectivity_ibfk_1` FOREIGN KEY (`this_station`) REFERENCES `stations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `connectivity_ibfk_2` FOREIGN KEY (`next_station`) REFERENCES `stations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `connectivity_ibfk_3` FOREIGN KEY (`line_id`) REFERENCES `train_lines` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connectivity`
--

LOCK TABLES `connectivity` WRITE;
/*!40000 ALTER TABLE `connectivity` DISABLE KEYS */;
INSERT INTO `connectivity` VALUES (1,2,1),(2,3,1),(3,4,1),(4,5,1),(5,6,1),(6,7,1),(7,8,1),(8,9,1),(9,10,1),(20,10,2),(10,11,1),(11,12,1),(13,14,2),(14,15,2),(15,16,2),(16,17,2),(17,18,2),(18,19,2),(19,20,2),(10,21,2),(21,22,2),(22,23,2),(23,24,2),(24,25,2),(25,26,2),(26,27,2),(27,28,2),(28,29,2),(29,30,2),(30,31,2),(32,33,3),(33,34,3),(34,35,3),(35,36,3),(36,37,3),(37,38,3),(38,39,3);
/*!40000 ALTER TABLE `connectivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_stations_map`
--

DROP TABLE IF EXISTS `line_stations_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line_stations_map` (
  `line_id` int NOT NULL,
  `station_id` int NOT NULL,
  PRIMARY KEY (`line_id`,`station_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `line_stations_map_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `train_lines` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `line_stations_map_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_stations_map`
--

LOCK TABLES `line_stations_map` WRITE;
/*!40000 ALTER TABLE `line_stations_map` DISABLE KEYS */;
INSERT INTO `line_stations_map` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,10),(1,11),(1,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39);
/*!40000 ALTER TABLE `line_stations_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_types`
--

DROP TABLE IF EXISTS `line_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `line_types` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `speed_limit` int NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_types`
--

LOCK TABLES `line_types` WRITE;
/*!40000 ALTER TABLE `line_types` DISABLE KEYS */;
INSERT INTO `line_types` VALUES (1,'Metro',25),(2,'Light Rail',10);
/*!40000 ALTER TABLE `line_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('rajat','bisht'),('root','toor');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_lines_map`
--

DROP TABLE IF EXISTS `manager_lines_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_lines_map` (
  `manager_id` int NOT NULL,
  `line_id` int NOT NULL,
  PRIMARY KEY (`manager_id`,`line_id`),
  KEY `manager_lines_map_fk_lines` (`line_id`),
  CONSTRAINT `manager_lines_map_fk_lines` FOREIGN KEY (`line_id`) REFERENCES `train_lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `manager_lines_map_fk_manager` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`m_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_lines_map`
--

LOCK TABLES `manager_lines_map` WRITE;
/*!40000 ALTER TABLE `manager_lines_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_lines_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `managers` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(64) NOT NULL,
  `l_name` varchar(64) NOT NULL,
  `office_location` varchar(64) NOT NULL,
  `u_name` varchar(32) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `manager_fk_login` (`u_name`),
  CONSTRAINT `manager_fk_login` FOREIGN KEY (`u_name`) REFERENCES `login` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (2,'root','toor','boston','root');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `latitude` varchar(16) NOT NULL,
  `longitude` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `latitude` (`latitude`,`longitude`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Wonderland','42.41437371','-70.99158207'),(2,'Revere Beach','42.40784944','-70.99254796'),(3,'Beachmont','42.3972084','-70.99254796'),(4,'Suffolk Downs','42.39050054','-70.99707329'),(5,'Orien Heights','42.38696855','-71.00480807'),(6,'Wood Island','42.37973802','-71.02290938'),(7,'Airport','42.37430865','-71.03025902'),(8,'Maverick','42.36911593','-71.03953434'),(9,'Aquarium','42.35979792','-71.05164889'),(10,'State','42.35883742','-71.05758092'),(11,'Government Center','42.35974553','-71.05937707'),(12,'Bowdoin','42.36140454','-71.06202403'),(13,'Oak Grove','42.43668413','-71.07106585'),(14,'Maiden Center','42.42680288','-71.07432487'),(15,'Wellington','42.40240584','-71.07710548'),(16,'Assembly','42.39291008','-71.07718385'),(17,'Sullivan Square','42.38401858','-71.07700675'),(18,'Community College','42.37370882','-71.0696081'),(19,'North Station','42.3666564','-71.06188817'),(20,'Haymarket','42.36288215','-71.05830724'),(21,'Downtown Crossing','42.3555332','-71.06021567'),(22,'Chinatown','42.3524108','-71.0624992'),(23,'Tufts Medical Center','42.34969828','-71.0638627'),(24,'Back Bay','42.3473349','-71.07556094'),(25,'Massachusetts Ave','42.34152267','-71.08336665'),(26,'Ruggles','42.33714271','-71.08946067'),(27,'Roxbury Crossing','42.33139225','-71.09547044'),(28,'Jackson Square','42.32321492','-71.09982914'),(29,'Stony Brook','42.31713331','-71.10427337'),(30,'Green Street','42.31056058','-71.10739096'),(31,'Forest Hills','42.30131345','-71.11399096'),(32,'Ashmont','42.28368534','-71.0633958'),(33,'Cedar Grove','42.27963437','-71.06036387'),(34,'Butler','42.27243509','-71.06250333'),(35,'Milton','42.27037013','-71.06726597'),(36,'Central Avenue','42.2700948','-71.07346111'),(37,'Vally Road','42.26837394','-71.08134923'),(38,'Capen Street','42.26758913','-71.08703927'),(39,'Mattapan','42.26763043','-71.09247165'),(51,'start_dummy','123','456'),(52,'end_dummy','456','789');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_lines`
--

DROP TABLE IF EXISTS `train_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_lines` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `color` varchar(16) NOT NULL,
  `terminal_A` int NOT NULL,
  `terminal_B` int NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `terminal_A` (`terminal_A`),
  KEY `terminal_B` (`terminal_B`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `train_lines_ibfk_1` FOREIGN KEY (`terminal_A`) REFERENCES `stations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `train_lines_ibfk_2` FOREIGN KEY (`terminal_B`) REFERENCES `stations` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `train_lines_ibfk_3` FOREIGN KEY (`type_id`) REFERENCES `line_types` (`type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_lines`
--

LOCK TABLES `train_lines` WRITE;
/*!40000 ALTER TABLE `train_lines` DISABLE KEYS */;
INSERT INTO `train_lines` VALUES (1,'Blue Line','blue',1,12,1),(2,'Orange Line','orange',13,31,1),(3,'Mattapan Line','red',32,39,2);
/*!40000 ALTER TABLE `train_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trains`
--

DROP TABLE IF EXISTS `trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trains` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `num_cars` int NOT NULL DEFAULT '2',
  `last_service_date` date DEFAULT NULL,
  `l_id` int NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `trains_fk_lines` (`l_id`),
  CONSTRAINT `trains_fk_lines` FOREIGN KEY (`l_id`) REFERENCES `train_lines` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trains`
--

LOCK TABLES `trains` WRITE;
/*!40000 ALTER TABLE `trains` DISABLE KEYS */;
INSERT INTO `trains` VALUES (1,2,'2023-12-10',1),(2,2,'2023-11-20',1),(3,2,'2023-10-15',1),(4,2,'2023-09-25',1),(5,2,'2023-11-28',1),(6,2,'2023-10-05',1),(7,4,'2023-09-12',1),(8,4,'2023-12-30',1),(9,4,'2023-11-18',1),(10,4,'2023-12-01',1),(11,4,'2023-10-05',1),(12,4,'2023-12-08',1),(13,4,'2023-08-21',2),(14,4,'2023-11-17',2),(15,4,'2023-11-12',2),(16,4,'2023-12-02',2),(17,4,'2023-10-07',2),(18,4,'2023-10-11',2),(19,6,'2023-09-08',2),(20,6,'2023-12-23',2),(21,6,'2023-12-08',2),(22,6,'2023-10-27',2),(23,6,'2023-11-19',2),(24,6,'2023-12-26',2),(25,6,'2023-11-01',2),(26,6,'2023-12-19',2),(27,6,'2023-09-09',2),(28,6,'2023-08-15',2),(29,6,'2023-12-20',2),(31,2,'2023-12-21',3),(32,2,'2023-10-04',3),(33,2,'2023-12-26',3),(34,2,'2023-09-15',3),(35,2,'2023-12-03',3),(36,2,'2023-11-22',3),(37,2,'2023-09-24',3),(38,2,'2023-08-14',3),(39,2,'2023-10-22',3),(40,2,'2023-12-09',3);
/*!40000 ALTER TABLE `trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mbta_lite'
--

--
-- Dumping routines for database 'mbta_lite'
--
/*!50003 DROP FUNCTION IF EXISTS `are_on_same_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `are_on_same_line`(st_id1 INT, st_id2 INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE common_line_id INT;
    Declare junction_id int;
    

   -- Find the common line_id if stations are on the same line
    SELECT line_id INTO common_line_id
    FROM line_stations_map
    WHERE (
        (station_id = st_id1 AND line_id IN 
			(SELECT line_id FROM line_stations_map WHERE station_id = st_id2)
		)
        OR
        (station_id = st_id2 AND line_id IN 
			(SELECT line_id FROM line_stations_map WHERE station_id = st_id1)
        )
    ) limit 1;		-- limit 1 is used because the above simple comparision writes same data two times :)

    -- Return the common_line_id if found, otherwise return 0
    RETURN COALESCE(common_line_id, -1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `is_junction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `is_junction`(st_id int) RETURNS tinyint(1)
    READS SQL DATA
Begin
	declare return_value boolean;
    declare num_rows int;
    
    select count(*) into num_rows from line_stations_map where station_id = st_id;
    
    if num_rows != 1 then 
		return true;
	else 
		return false;
	end if;

End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_connectivity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_connectivity`(in t_stn Varchar(64), in n_stn varchar(64), in l_name varchar(64))
BEGIN
	declare t_stn_id int;	-- this_station_id
    declare n_stn_id int;	-- next_station_id
    declare l_id int;
    declare num_count int;
    

    select id into l_id from train_lines where name = l_name;
    select id into t_stn_id from stations where name = t_stn;
    select id into n_stn_id from stations where name = n_stn;
    
    if t_stn_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "this_station not found"; 
	elseif n_stn_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "next_station not found"; 
	elseif l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found"; 
	end if;
    
    select count(*) into num_count from connectivity 
		where this_station = t_stn_id and next_station = n_stn_id and line_id = l_id;
    
    if num_count > 0 then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "this pair already exsists in connectivity table"; 
    else
		insert into connectivity (this_station, next_station, line_id) values (t_stn_id, n_stn_id, l_id);
	end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_line_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_line_type`(in l_type varchar(60), in sp_limit int )
BEGIN
	declare typ_id int;
    select type_id into typ_id from line_types where type = l_type;
    
    if typ_id is not null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Line type already exists";        
    end if;
    
    insert into line_types(type, speed_limit) values (l_type, sp_limit);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_manager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_manager`(in first_name varchar(64), in last_name varchar(64), 
								in office varchar(64), in uname varchar(32) )
BEGIN
	declare num_c int;
    
    select count(*) into num_c from managers where u_name = uname;
    
    if num_c > 0 then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Username already associated with a different manager."; 
    end if;
    
    insert into managers(f_name, l_name, office_location, u_name)
		values (first_name, last_name, office, uname);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_line`(	IN line_name VARCHAR(64),
							IN line_color VARCHAR(64),
                            IN start_stn VARCHAR(64),
                            IN end_stn VARCHAR(64),
                            IN line_type VARCHAR(64)
                            )
BEGIN
	declare l_id int;
    declare s_stn_id int;
    declare e_stn_id int;
    declare l_type_id int;
    
    select id into l_id from train_lines where name = line_name;
    select id into s_stn_id from stations where name = start_stn;
    select id into e_stn_id from stations where name = end_stn;
    select type_id into l_type_id from line_types where type = line_type;

	-- check if the line name already exists. cannot have two lines with same names.
	if l_id is not null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "this line name already exists"; 
	end if;
    
    -- check if the provided start station is valid
	if s_stn_id is null then 
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "start station not found"; 
	end if;
    
    -- check if the provided end station name is valid
    if e_stn_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "end station not found"; 
	end if;
    
    -- check if the provided line type is valid.
    if l_type_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line type not found"; 
	end if;
    
    
    insert into train_lines (name, color, terminal_A, terminal_B, type_id) values
		(line_name, line_color, s_stn_id, e_stn_id, l_type_id); 
    
    -- retrieve the new line id
    select id into l_id from train_lines where name = line_name;
    
    -- add the stations in the lines station mapping table
    
    insert into line_stations_map(line_id, station_id) values (l_id, s_stn_id),(l_id, e_stn_id);
    
    -- also update the connectivity table where this_station = start_Stn next_station = end_stn;
    insert into connectivity(this_station, next_station, line_id) values (s_stn_id, e_stn_id, l_id);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_station`( in st_name varchar(60),
								in st_lat varchar(16),
                                in st_longi varchar(16)
                                )
BEGIN
	
    declare st_id int;
    declare geo_loc_count int default 0;
    
    select count(*) into geo_loc_count from stations where latitude = st_lat and  longitude = st_longi;
    select id into st_id from stations where name = st_name;
    
    if st_id is not null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Station name already exists";
	elseif geo_loc_count > 0 then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Geo loaction is not unique";
	else
		insert into stations (name, latitude, longitude) values (st_name, st_lat, st_longi);
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_new_train` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_new_train`(in n_cars int, in l_name varchar(64))
BEGIN
	declare lid int;
    
    select id into lid from train_lines where name = l_name;
    
    if lid is null then 
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Line not found"; 
	elseif n_cars < 2 then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "min number of cars is 2"; 
	end if;
    
    insert into trains(num_cars,last_service_date, l_id) values (n_cars, CURDATE(), lid);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_station_to_lines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_station_to_lines`(in l_name varchar(64), in st_name varchar(64))
BEGIN
	declare l_id int;
    declare st_id int;
    
    select id into l_id from train_lines where name = l_name;
    
    select id into st_id from stations where name = st_name;
    
    if l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found"; 	
    elseif st_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "station not found"; 
	end if;
    
    insert into line_stations_map (line_id, station_id) values (l_id, st_id);
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `all_stations_on_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `all_stations_on_line`(in l_name varchar(64))
BEGIN
	declare l_id int;
    
    select id into l_id from train_lines where name = l_name;
    
    if l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found"; 	
	end if;
    
    select st.name, st.latitude, st.longitude from stations st 
		inner join line_stations_map lst_m 
		on  lst_m.station_id = st.id where lst_m.line_id = l_id;

    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_connectivity_pair` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_connectivity_pair`(in this_station_name varchar(64), 
											in next_station_name varchar(64),
                                            in line_name varchar(64))
BEGIN
	declare l_id int;
    declare this_st int;
    declare next_st int;
    declare num_count int;
    
    select id into this_st  from stations where name = this_station_name;
    select id into next_st  from stations where name = next_station_name;
    select id into l_id from train_lines where name = line_name;
    select count(*) into num_count from connectivity where this_station = this_st and next_station = next_St and line_id = l_id;
    
    if this_st is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "this_Station not found"; 	
	elseif next_st is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "next_Station not found";
	elseif l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Line not found";
	elseif num_count = 0 then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Station pair not found in connectivity";
    end if;
    
    delete from connectivity where 
		this_station = this_st and
        next_station = next_st and
        line_id = l_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_line`(in l_name  varchar(64))
BEGIN
	declare lid int;
    
    select id into lid from train_lines where name = l_name;
    
    if lid is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found"; 
	end if;
    
    -- delete from the connectivity table;
    delete from connectivity where line_id = lid;
    
    -- delete form the line_stations_map table
    delete from line_stations_map where line_id = lid;
    -- delete from the manager_lines_map
    delete from manager_lines_map where line_id = lid;
    -- delete trains with this line id
    delete from trains where l_id = lid;
    -- delete from the train_lines table;
    delete from train_lines where id = lid;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_line_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_line_type`(in l_type Varchar(60))
BEGIN
	declare typ_id int;
    select type_id into typ_id from line_types where type = l_type;
    
    if typ_id is  null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Line type not found";        
    end if;
	
	delete from line_types where type = l_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_station` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_station`(in st_name varchar(60))
BEGIN
	declare st_id int;
    select id into st_id from stations where name = st_name;
    
    if st_id is null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Station not found";
    end if;
    
    
    -- delete form mapping
    delete from line_stations_map where station_id = st_id;
    -- delete form stations
    delete from stations where id = st_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_station_connectivity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_station_connectivity`(in st_name varchar(64), in l_name varchar(64))
BEGIN
	declare st_id int;
    declare l_id int;
    
    declare prev_st int;
    declare next_st int;
    
    select id into st_id  from stations where name = st_name;
    select id into l_id from train_lines where name = l_name;
    
    
    if st_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Station not found"; 	
	elseif l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Line not found"; 	
    end if;
    
    select this_station into prev_st from connectivity where next_station = st_id and line_id = l_id;
    select next_station into next_st from connectivity where this_station = st_id and line_id = l_id;
    
     if prev_st is null then
		-- this station has no previous ==> this is a terminal_a station of the given line
        update train_lines 
			set terminal_A = next_st where id =l_id;
        delete from connectivity where this_station = st_id and line_id = l_id;
        
        
     elseif next_st is null then   
		-- this station has no previous ==> this is a terminal_a station of the given line
         update train_lines 
			set terminal_B = prev_st where id =l_id;
        delete from connectivity where next_station = st_id and line_id = l_id;
       
        
	else
		-- we can remove the station and connect the prev->next
        call delete_connectivity_pair(prev_st, st_id, l_id);
		call delete_connectivity_pair(st_id, next_st , l_id);
		call add_connectivity(prev_st, next_st);
        
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_train` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_train`(in t_id  int)
BEGIN
	declare id int;
    select tid into id from trains where tid = t_id;
    
    if id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Invalid train ID found"; 
	end if;
    
    delete from trains where tid = id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_junctions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_junctions`()
BEGIN
	select station_id as junction, GROUP_CONCAT(line_id separator ',') as line_connections 
	from line_stations_map 
    group by station_id 
    having count(*) > 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_lines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_lines`()
BEGIN
	Select tl.name, tl.color, tl.terminal_A, tl.terminal_B, lt.type, lt.speed_limit  from train_lines tl 
inner join line_types lt on tl.type_id = lt.type_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_line_types` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_all_line_types`()
BEGIN
	select type from line_types;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_authentication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_authentication`(in u_name varchar(64), in passwd varchar(64))
BEGIN
	declare un varchar(64);
    declare ps varchar(64);
    
    select username, password into un, ps from login where username = u_name;
    
    if un is null then 
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "incorrect username"; 
    elseif ps <> passwd then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Incorrect Password"; 
	else 
		select un;
	end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_line_color` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_line_color`(in l_name varchar(64))
BEGIN
	declare l_id int;
    
    select id into l_id from train_lines where name = l_name;
    
    if l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found"; 
	end if;
    
    select color from train_lines where name = l_name;
    
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_line_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_line_info`(in l_name varchar(64))
BEGIN
	declare l_id int;
    
    select id into l_id from train_lines where name = l_name;
    
    if l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found"; 
	end if;
    
    select tl.name, tl.color, 
			start_st.name as start_station, 
            end_st.name as end_station, 
            lt.type, lt.speed_limit 
	from train_lines tl 
					inner join line_types lt on tl.type_id = lt.type_id
					inner join stations  as start_st on tl.terminal_A = start_st.id
                    inner join stations as end_st on tl.terminal_B = end_st.id
                    where tl.name = l_name;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_manager_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_manager_info`(in uname varchar(64))
BEGIN
	
    declare mgid int;
    
    select m_id into mgid from managers where u_name = uname;
    
    
    if mgid is null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "invalid user";
	end if;
    
    select f_name, l_name, office_location, u_name from managers where m_id = mgid;  
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_path_by_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_path_by_line`(in l_name varchar(64))
BEGIN
	declare l_id int;
    declare s_st_id int;
    declare e_st_id int;
    declare s_st_name varchar(64);
    declare e_st_name varchar(64);
    
    select id, terminal_A, terminal_B into l_id, s_st_id, e_st_id from train_lines where name = l_name;
    
    if l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found"; 	
	end if;
    
    select name into s_st_name from stations where id = s_st_id;
    select name into e_st_name  from stations where id = e_st_id;
	
    call get_path_same_line(s_st_name, e_st_name);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_path_same_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_path_same_line`(IN start_station Varchar(64), IN end_station varchar(64))
BEGIN
    -- declare variables to store station id for further queries
    DECLARE s_stn int;		-- start station id
    DECLARE e_stn int;		-- end station id
	DECLARE last_row_offset int;	-- offset for getting last row information
    DECLARE end_stat_ret_id int;  	-- id from the station at last row;
    Declare l_id int;		-- line id 
    
    
    -- retrieve values of station id from stations table.
    select id into s_stn from stations where stations.name = start_station;
    select id into e_stn from stations where stations.name = end_station;


	-- checking validity of station id(s).
	if s_stn is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Invalid Start station";
	elseif e_stn is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Invalid End station";
	end if;
    

    -- retrieve line_id
    select are_on_same_line(s_stn, e_stn) into l_id;
    if l_id = -1 then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "stations not on same line";
	end if;
    
    -- Create a temporary table to store the result
    CREATE TEMPORARY TABLE return_table (
        station INT
    );

	-- Insert the result into the temporary table
     INSERT INTO return_table (station)
        WITH RECURSIVE StationCTE AS (
            SELECT cnn.this_station as next_Station
            FROM connectivity cnn
            WHERE this_station = s_stn and cnn.line_id = l_id

            UNION

            SELECT t.next_station
            FROM connectivity t
            JOIN StationCTE cte ON t.this_station = cte.next_station
            WHERE t.this_station <> e_stn and t.line_id = l_id
        )
        SELECT next_Station
        FROM StationCTE;

    -- You can use temp_myTable as needed within this procedure
   -- SELECT * FROM temp_myTable;

    Set last_row_offset = (select count(*) from return_table) - 1;

    set end_stat_ret_id = (select * from return_table limit 1 offset last_row_offset );


    if end_stat_ret_id <> e_stn
    then
        -- return reverse order
        call get_path_same_line_rev(start_station, end_station);
        
	else
        -- else return table
		select st.name, st.latitude, st.longitude from return_table
			inner join stations st on st.id = return_table.station;
		
	end if;

    -- Drop the temporary table when done
    DROP TEMPORARY TABLE IF EXISTS return_table;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_path_same_line_rev` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_path_same_line_rev`(IN start_station Varchar(64), IN end_station varchar(64))
BEGIN
    -- declare variables to store station id for further queries
    DECLARE s_stn int;
    DECLARE e_stn int;
	DECLARE last_row_offset int;
    DECLARE end_stat_ret_id int;
    declare l_id int;
    
    
    -- retrieve values of station id from stations table.
    select id into s_stn from stations where stations.name = start_station;
    select id into e_stn from stations where stations.name = end_station;

	-- checking validity of station id(s).
	if s_stn is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Invalid Start station";
	elseif e_stn is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Invalid End station";
	end if;
    
    -- retrieve line_id
	select are_on_same_line(s_stn, e_stn) into l_id;
    if l_id = -1 then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "stations not on same line";
	end if;
    
    
	
    -- Create a temporary table to store the result
    CREATE TEMPORARY TABLE return_table_rev (
        station INT
    );

	-- Insert the result into the temporary table
     INSERT INTO return_table_rev (station)
        WITH RECURSIVE StationCTE AS (
            SELECT cnn.this_station as prev_Station
            FROM connectivity cnn
            WHERE cnn.this_station = s_stn and cnn.line_id = l_id

            UNION

            SELECT t.this_station
            FROM connectivity t
            JOIN StationCTE cte ON t.next_station = cte.prev_Station
            WHERE t.next_station <> e_stn and t.line_id = l_id
        )
        SELECT prev_Station
        FROM StationCTE;

    -- You can use temp_myTable as needed within this procedure
   -- SELECT * FROM temp_myTable;

    Set last_row_offset = (select count(*) from return_table_rev) - 1;

    set end_stat_ret_id = (select * from return_table_rev limit 1 offset last_row_offset );


    if end_stat_ret_id <> e_stn
    then
        -- return reverse order
        -- call get_path_same_line_rev(start_station, end_station);
        select * from return_table_rev limit 0; -- should never be called
        
	else
        -- else return table
		select st.name, st.latitude, st.longitude from return_table_rev 
			inner join stations st on st.id = return_table_rev.station ;
		
	end if;

    -- Drop the temporary table when done
    DROP TEMPORARY TABLE IF EXISTS return_table_rev;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_speed_limit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_speed_limit`(in l_type varchar(60))
BEGIN
	declare typ_id int;
    select type_id into typ_id from line_types where type = l_type;
    
    if typ_id is  null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Line type not found";        
    end if;
    
    select speed_limit from line_types where type = l_type;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_station_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_station_info`(in st_name varchar(60))
BEGIN
	declare st_id int;
    
    select id into st_id from stations where name = st_name;
    
    if st_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Station name not found";
	end if;

	select name, latitude, longitude from stations where id = st_id;


end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_station_info_complete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_station_info_complete`(in st_name varchar(60))
BEGIN
	declare st_id int;
    
    select id into st_id from stations where name = st_name;
    
    if st_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Station name not found";
	end if;
    
    with line_info as (
		select station_id, GROUP_CONCAT(tl.name separator ',') as line_connections 
		from line_stations_map lsm inner join train_lines tl on tl.id = lsm.line_id  
        where station_id = st_id
		group by station_id 
    )
    select st.name, st.latitude, st.longitude , line_connections
    from stations as st inner join line_info on st.id = line_info.station_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_trains_by_service_months` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_trains_by_service_months`(in l_name varchar(64), in diff_month int)
BEGIN
	declare lid int;
    select id into lid from train_lines where name = l_name;
    if lid is null then 
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Line not found"; 
	elseif diff_month < 0 then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "month difference cannot be negative"; 
	end if;
    
    select * from trains where l_id = lid;
    SELECT tid, num_cars, last_service_date FROM trains
		WHERE last_service_date < DATE_SUB(CURDATE(), INTERVAL diff_month MONTH);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_train_info_by_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_train_info_by_line`(in l_name varchar(64))
BEGIN
	declare lid int;
    select id into lid from train_lines where name = l_name;
    if lid is null then 
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Line not found"; 
	end if;
    
    select t.tid, t.num_cars, t.last_service_date, l.name from trains t 
		inner join train_lines l on t.l_id = l.id where l_id = lid;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register`(in u_name varchar(64), in passwd varchar(64))
BEGIN
	declare usr_nm varchar(64);
    
    select username into usr_nm from login where username = u_name;
    
    -- if the usenrname is already taken
    if usr_nm is not null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Username already exists"; 
	else
		insert into login (username, password) values (u_name, passwd);
    end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reset_manager_manages_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reset_manager_manages_line`(in line_name varchar(64))
BEGIN
	
    declare l_id int;
    
    select id into l_id from train_lines where name = line_name;
    
    
    if l_id is null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "invalid line";
	end if;
    
    delete from manager_lines_map where line_id = l_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_manager_manages_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_manager_manages_line`(in user_name varchar(64), in line_name varchar(64))
BEGIN
	declare mgid int;
    declare l_id int;
    
    select id into l_id from train_lines where name = line_name;
    select m_id into mgid from managers where u_name = user_name;
    
    if l_id is null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "invalid line";
	elseif mgid is null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "invalid username for manager";
	end if;
    
    insert into manager_lines_map(manager_id, line_id) values (mgid, l_id);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unregister` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unregister`(in u_name varchar(64), in passwd varchar(64))
BEGIN
	declare un varchar(64);
    declare ps varchar(64);
    
    select username, password into un, ps from login where username = u_name;
    
    if un is null then 
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "incorrect username"; 
    elseif ps <> passwd then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Incorrect Password"; 
	else 
		delete from login where username = u_name and password = passwd;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_connectivity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_connectivity`(in new_station varchar(64), 
									in p_station varchar(64), 
                                    in n_station varchar(64), 
                                    in l_name varchar(64)
                                    )
BEGIN
	declare new_stn_id int;
    declare prev_stn_id int;
    declare next_stn_id int;
    declare l_id int;
    declare num_count int;
    
    select id into new_stn_id from stations where name = new_station;
    select id into prev_stn_id from stations where name = p_station;
    select id into next_stn_id from stations where name = n_station;
    select id into l_id from train_lines where name = l_name;
    
    select count(*) into num_count from connectivity 
		where this_station = prev_stn_id and next_station = next_stn_id and line_id = l_id;
	
    if new_stn_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "new station not found"; 	
	elseif prev_stn_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "previous station not found";
	elseif next_stn_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "new station not found";
	elseif l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found";
	elseif num_count = 0 then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "pair provided to add station in between doesnot exist";
    end if;
    
    delete from connectivity 
		where this_station = prev_stn_id
        and next_station = next_stn_id
        and line_id = l_id;
	
    insert into connectivity(this_station, next_station, line_id) 
		values (prev_stn_id, new_stn_id, l_id),
				(new_stn_id, next_stn_id, l_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_line_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_line_name`(in l_name varchar(64), in new_name varchar(64))
BEGIN
	declare l_id int;
    
    select id into l_id from train_lines where name = l_name;
    
    if l_id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "line not found"; 
	end if;
    
    update train_lines 
		set name = new_name
	where id = l_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_password`(in u_name varchar(64), in passwd varchar(64), in new_passwd varchar(64))
BEGIN
	declare un varchar(64);
    declare ps varchar(64);
    
    select username, password into un, ps from login where username = u_name;
    
    if un is null then 
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "incorrect username"; 
    elseif ps <> passwd then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Incorrect Password"; 
	else 
		update login
			set password = new_passwd
		where username = u_name;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_service_date` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_service_date`(in t_id int)
BEGIN
	declare id int;
    select tid into id from trains where tid = t_id;
    
    if id is null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Invalid train ID found"; 
	end if;
    
    update trains
		set last_service_date = CURDATE()
	where tid = id;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_speed_limit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_speed_limit`(in l_type varchar(60), in new_speed int)
BEGIN
	declare typ_id int;
    select type_id into typ_id from line_types where type = l_type;
    
    if typ_id is  null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Line type not found";        
    end if;
    
    update line_types 
		set speed_limit = new_speed
	where type = l_type;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_station_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_station_name`(in new_name varchar(60), in old_name varchar(60))
BEGIN
	declare st_id_new int;
    declare st_id_old int;
    select id into st_id_new from stations where name = new_name;
    select id into st_id_old from stations where name = old_name;
    
    if st_id_new is not null then
		SIGNAL SQLSTATE  '45000'
		SET MESSAGE_TEXT = "Station's new name already exists";
	elseif st_id_old is null then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = "Station to operate on not found";
    end if;
    
    update stations 
		set name = new_name
	where id = st_id_old;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 22:33:46
