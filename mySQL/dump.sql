-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: cram
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `heatshock_enum`
--

DROP TABLE IF EXISTS `heatshock_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heatshock_enum` (
  `heatshock_option` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT 'No HEATSHOCK TREATMENT description provided',
  PRIMARY KEY (`heatshock_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heatshock_enum`
--

LOCK TABLES `heatshock_enum` WRITE;
/*!40000 ALTER TABLE `heatshock_enum` DISABLE KEYS */;
INSERT INTO `heatshock_enum` VALUES ('30m',NULL),('None',NULL);
/*!40000 ALTER TABLE `heatshock_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immobilizationmethod_enum`
--

DROP TABLE IF EXISTS `immobilizationmethod_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `immobilizationmethod_enum` (
  `immob_option` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT 'No IMMOB METHOD description provided',
  PRIMARY KEY (`immob_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immobilizationmethod_enum`
--

LOCK TABLES `immobilizationmethod_enum` WRITE;
/*!40000 ALTER TABLE `immobilizationmethod_enum` DISABLE KEYS */;
INSERT INTO `immobilizationmethod_enum` VALUES ('10% agarose, beads','(JBM1 pg25)');
/*!40000 ALTER TABLE `immobilizationmethod_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `initials` char(3) NOT NULL,
  `fn` varchar(45) NOT NULL,
  `ln` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `pw_hash` char(64) NOT NULL,
  UNIQUE KEY `initials_UNIQUE` (`initials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('AAA','Alice','Ailes','ailes.a@husky.neu.edu','e2cd8bc78fa87c5500c7059dbdd419d153f1d5250496646521fddca9870ce91e'),('BBB','Bob','Borker','borker.b@husky.neu.edu','db5fd390a16005ba9c1dcdc333da41e54f50afb3160c3957c5f61e899b34a01e'),('DPA','Douglas','Pagani','pagani.d@husky.neu.edu','92e89237bba3c2562f4b17d94c6ce27e88549c8225f874b263f691eb57c79eb8'),('JAB','Jeff','Bouffard','bouffard.j@husky.neu.edu','14975af22f0ae95c99edcb8693356459ab88c002e3bb7e39fe37cb826b3ac712'),('PGC','Penny','Caldera','caldera.p@husky.neu.edu','b0ced705705fd248cb36593d2af55ee5b23701a8297c5906cceab84960bc5d11');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_audit`
--

DROP TABLE IF EXISTS `person_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_audit` (
  `idperson_audit` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idperson_audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_audit`
--

LOCK TABLES `person_audit` WRITE;
/*!40000 ALTER TABLE `person_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rnai_enum`
--

DROP TABLE IF EXISTS `rnai_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnai_enum` (
  `rnai_option` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT 'No RNAi description provided',
  PRIMARY KEY (`rnai_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rnai_enum`
--

LOCK TABLES `rnai_enum` WRITE;
/*!40000 ALTER TABLE `rnai_enum` DISABLE KEYS */;
INSERT INTO `rnai_enum` VALUES ('cku-80','The Quick Brown Fox'),('eat-16','a'),('let-502','shark');
/*!40000 ALTER TABLE `rnai_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensors_enum`
--

DROP TABLE IF EXISTS `sensors_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensors_enum` (
  `sensor_option` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT 'No SENSOR description provided',
  PRIMARY KEY (`sensor_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensors_enum`
--

LOCK TABLES `sensors_enum` WRITE;
/*!40000 ALTER TABLE `sensors_enum` DISABLE KEYS */;
INSERT INTO `sensors_enum` VALUES ('DIC','Just DIC'),('GCaMP3','Calcium-flurophore');
/*!40000 ALTER TABLE `sensors_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strain_enum`
--

DROP TABLE IF EXISTS `strain_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strain_enum` (
  `strain_option` varchar(10) NOT NULL,
  `description` varchar(45) DEFAULT 'No STRAIN description provided.',
  PRIMARY KEY (`strain_option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strain_enum`
--

LOCK TABLES `strain_enum` WRITE;
/*!40000 ALTER TABLE `strain_enum` DISABLE KEYS */;
INSERT INTO `strain_enum` VALUES ('CR0902','my favorite child'),('UN1108','the best strain'),('UN1310','little red riding hood'),('UN1417','I do not like green eggs & ham.'),('UN1710','the new stuff, baby');
/*!40000 ALTER TABLE `strain_enum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timepoints`
--

DROP TABLE IF EXISTS `timepoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timepoints` (
  `vid` int(11) NOT NULL,
  `scientist` char(3) NOT NULL,
  `entry_start` int(10) unsigned DEFAULT NULL,
  `entry_stop` int(10) unsigned DEFAULT NULL,
  `exit_start` int(10) unsigned DEFAULT NULL,
  `exit_stop` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`vid`,`scientist`),
  KEY `Person_idx` (`scientist`),
  CONSTRAINT `Person` FOREIGN KEY (`scientist`) REFERENCES `person` (`initials`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Video` FOREIGN KEY (`vid`) REFERENCES `video` (`vid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timepoints`
--

LOCK TABLES `timepoints` WRITE;
/*!40000 ALTER TABLE `timepoints` DISABLE KEYS */;
INSERT INTO `timepoints` VALUES (1,'DPA',40,80,130,210),(1,'JAB',33,23,140,220);
/*!40000 ALTER TABLE `timepoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `vid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'In the TSV''s, rani and heatshock can be "none." ',
  `owner` char(3) NOT NULL,
  `strain` varchar(10) NOT NULL,
  `rnai` varchar(45) DEFAULT NULL,
  `heatshock` varchar(45) DEFAULT NULL,
  `sensors` varchar(45) NOT NULL,
  `ovulation_no` smallint(6) NOT NULL,
  `growth_temp` smallint(6) NOT NULL,
  `immob_method` varchar(45) NOT NULL,
  `date_recorded` date NOT NULL,
  `old_file_name` varchar(45) NOT NULL,
  `date_archived` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `archive_filepath` varchar(45) NOT NULL,
  `full_ovulation` tinyint(1) NOT NULL,
  `is_trap` tinyint(1) NOT NULL,
  `searchCount` int(11) NOT NULL DEFAULT '99999',
  PRIMARY KEY (`vid`),
  KEY `initials_idx` (`owner`),
  KEY `rnai_idx` (`rnai`),
  KEY `heatshocktreatment_idx` (`heatshock`),
  KEY `immobolization_idx` (`immob_method`),
  KEY `sensors_idx` (`sensors`),
  KEY `strain_idx` (`strain`),
  KEY `date_idx` (`date_recorded`) USING BTREE,
  CONSTRAINT `heatshocktreatment` FOREIGN KEY (`heatshock`) REFERENCES `heatshock_enum` (`heatshock_option`) ON UPDATE CASCADE,
  CONSTRAINT `immobolization` FOREIGN KEY (`immob_method`) REFERENCES `immobilizationmethod_enum` (`immob_option`) ON UPDATE CASCADE,
  CONSTRAINT `initials` FOREIGN KEY (`owner`) REFERENCES `person` (`initials`) ON UPDATE CASCADE,
  CONSTRAINT `rnai` FOREIGN KEY (`rnai`) REFERENCES `rnai_enum` (`rnai_option`) ON UPDATE CASCADE,
  CONSTRAINT `sensors` FOREIGN KEY (`sensors`) REFERENCES `sensors_enum` (`sensor_option`) ON UPDATE CASCADE,
  CONSTRAINT `strain` FOREIGN KEY (`strain`) REFERENCES `strain_enum` (`strain_option`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'DPA','UN1417','cku-80','30m','GCaMP3',3,25,'10% agarose, beads','2017-03-24','myGreatVideo.tif','2017-03-25 19:23:21','/UN1417/cku-80/30m',1,0,99999),(2,'DPA','UN1108','cku-80','None','GCaMP3',5,20,'10% agarose, beads','2017-03-27','myAmazVideo.tif','2017-04-01 23:27:21','/UN1417/cku-80/',1,0,7777),(3,'JAB','UN1417','eat-16','30m','DIC',2,25,'10% agarose, beads','2017-03-27','jeffsCoolVid.tif','2017-04-01 23:27:21','/UN1417/eat-16/30m',1,0,987),(4,'PGC','UN1710','let-502','None','GCaMP3',3,15,'10% agarose, beads','2017-04-10','babyWorm.tif','2017-04-12 23:27:21','/UN1417/let-502/30m',0,1,9999),(5,'DPA','UN1310','let-502','30m','GCaMP3',9,15,'10% agarose, beads','2017-06-11','myBart.tif','2017-04-12 23:27:21','/UN1417/let-502/30m',0,1,99);
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_acquisition_parameters`
--

DROP TABLE IF EXISTS `video_acquisition_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_acquisition_parameters` (
  `vid` int(11) NOT NULL,
  `rotation_angle` int(11) NOT NULL,
  `notebook` varchar(45) NOT NULL,
  `additional_comments` varchar(45) NOT NULL,
  `objective` varchar(45) DEFAULT NULL,
  `frame_rate` varchar(45) NOT NULL,
  `exposure_time` varchar(45) NOT NULL,
  `gain` varchar(45) NOT NULL,
  `bit_depth` varchar(45) NOT NULL,
  `neutral_density` varchar(45) NOT NULL,
  `dic_polarizer` varchar(45) NOT NULL,
  `room_door_state` varchar(45) NOT NULL,
  PRIMARY KEY (`vid`),
  CONSTRAINT `acquisition` FOREIGN KEY (`vid`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_acquisition_parameters`
--

LOCK TABLES `video_acquisition_parameters` WRITE;
/*!40000 ALTER TABLE `video_acquisition_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_acquisition_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_audit`
--

DROP TABLE IF EXISTS `video_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_audit` (
  `idvideo_audit` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idvideo_audit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_audit`
--

LOCK TABLES `video_audit` WRITE;
/*!40000 ALTER TABLE `video_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `video_metrics`
--

DROP TABLE IF EXISTS `video_metrics`;
/*!50001 DROP VIEW IF EXISTS `video_metrics`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `video_metrics` AS SELECT 
 1 AS `AVG(entry_start)`,
 1 AS `AVG(entry_stop)`,
 1 AS `AVG(exit_start)`,
 1 AS `AVG(exit_stop)`,
 1 AS `count(scientist)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `video_processing_parameters`
--

DROP TABLE IF EXISTS `video_processing_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_processing_parameters` (
  `vid` int(11) NOT NULL,
  `temporal_cropping` varchar(45) NOT NULL,
  `rotation_angle_pre_reg_1` varchar(45) NOT NULL,
  `spatial_crop_pre_reg_2` varchar(45) NOT NULL,
  `registration_frame` varchar(45) NOT NULL,
  `rotation_angle` varchar(45) NOT NULL,
  `spatial_crop` varchar(45) NOT NULL,
  PRIMARY KEY (`vid`),
  CONSTRAINT `processing` FOREIGN KEY (`vid`) REFERENCES `video` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_processing_parameters`
--

LOCK TABLES `video_processing_parameters` WRITE;
/*!40000 ALTER TABLE `video_processing_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_processing_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `video_metrics`
--

/*!50001 DROP VIEW IF EXISTS `video_metrics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `video_metrics` AS select avg(`timepoints`.`entry_start`) AS `AVG(entry_start)`,avg(`timepoints`.`entry_stop`) AS `AVG(entry_stop)`,avg(`timepoints`.`exit_start`) AS `AVG(exit_start)`,avg(`timepoints`.`exit_stop`) AS `AVG(exit_stop)`,count(`timepoints`.`scientist`) AS `count(scientist)` from `timepoints` group by `timepoints`.`vid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-24 13:32:34
