CREATE DATABASE  IF NOT EXISTS `smartphone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `smartphone`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smartphone
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `back_camera`
--

DROP TABLE IF EXISTS `back_camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `back_camera` (
  `back_cam_id` int(11) NOT NULL AUTO_INCREMENT,
  `camera_id` int(11) NOT NULL,
  `resolution` float NOT NULL,
  `aperture` float NOT NULL,
  `focal_length` int(10) NOT NULL,
  PRIMARY KEY (`back_cam_id`),
  UNIQUE KEY `back_cam_id_UNIQUE` (`back_cam_id`),
  KEY `backcam_camera_id_idx` (`camera_id`),
  CONSTRAINT `backcam_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `camera` (`camera_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `back_camera`
--

INSERT INTO `back_camera` VALUES (1,1,7,2.2,32);

--
-- Table structure for table `battery`
--

DROP TABLE IF EXISTS `battery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `battery` (
  `smartphone_model_id` int(11) NOT NULL,
  `battery_type` int(11) NOT NULL,
  `capacity` int(10) NOT NULL,
  `quick_charge_type_id` int(11) NOT NULL,
  `charging_port_id` int(11) NOT NULL,
  `feature_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`smartphone_model_id`),
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `battery_battery_type_id_idx` (`battery_type`),
  KEY `quick_charge_type_id_idx` (`quick_charge_type_id`),
  KEY `charging_port_id_idx` (`charging_port_id`),
  CONSTRAINT `battery_battery_type_id` FOREIGN KEY (`battery_type`) REFERENCES `battery_type` (`battery_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `battery_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `charging_port_id` FOREIGN KEY (`charging_port_id`) REFERENCES `charging_port` (`charging_port_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `quick_charge_type_id` FOREIGN KEY (`quick_charge_type_id`) REFERENCES `quick_charge_type` (`quick_charge_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battery`
--

INSERT INTO `battery` VALUES (1,1,3174,3,3,'Qi wireless charging');

--
-- Table structure for table `battery_type`
--

DROP TABLE IF EXISTS `battery_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `battery_type` (
  `battery_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`battery_type_id`),
  UNIQUE KEY `battery_type_id_UNIQUE` (`battery_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battery_type`
--

INSERT INTO `battery_type` VALUES (1,'Li-Ion');
INSERT INTO `battery_type` VALUES (2,'Li-Po');

--
-- Table structure for table `body_protection`
--

DROP TABLE IF EXISTS `body_protection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `body_protection` (
  `body_protection_id` int(11) NOT NULL AUTO_INCREMENT,
  `material` varchar(45) NOT NULL,
  PRIMARY KEY (`body_protection_id`),
  UNIQUE KEY `body_protection_id_UNIQUE` (`body_protection_id`),
  UNIQUE KEY `material_UNIQUE` (`material`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `body_protection`
--

INSERT INTO `body_protection` VALUES (2,'Aluminum');
INSERT INTO `body_protection` VALUES (4,'Ceramic');
INSERT INTO `body_protection` VALUES (3,'Glass');
INSERT INTO `body_protection` VALUES (1,'Plastic');

--
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `camera` (
  `camera_id` int(11) NOT NULL AUTO_INCREMENT,
  `smartphone_model_id` int(11) NOT NULL,
  `feature_description` varchar(200) DEFAULT NULL,
  `video_record_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`camera_id`),
  UNIQUE KEY `camera_id_UNIQUE` (`camera_id`),
  KEY `camera_smartphone_model_id_idx` (`smartphone_model_id`),
  CONSTRAINT `camera_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera`
--

INSERT INTO `camera` VALUES (1,1,'PDAF, 2x optical zoom, Quad-LED dual-tone flash, HDR (photo/panorama), TOF 3D camera','2160p@24/30/60fps, 1080p@30/60/120/240fps, HDR, stereo sound rec');

--
-- Table structure for table `charging_port`
--

DROP TABLE IF EXISTS `charging_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `charging_port` (
  `charging_port_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`charging_port_id`),
  UNIQUE KEY `charging_port_id_UNIQUE` (`charging_port_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charging_port`
--

INSERT INTO `charging_port` VALUES (3,'Lightning');
INSERT INTO `charging_port` VALUES (1,'Micro USB');
INSERT INTO `charging_port` VALUES (2,'USB Type-C');

--
-- Table structure for table `connection`
--

DROP TABLE IF EXISTS `connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `connection` (
  `smartphone_model_id` int(11) NOT NULL,
  `mobile_network` varchar(200) NOT NULL,
  `wlan_network` varchar(200) NOT NULL,
  `bluetooth` varchar(200) NOT NULL,
  `headphone_jack` int(11) NOT NULL,
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `headphonejacktype_headphone_jack_type_id_idx` (`headphone_jack`),
  CONSTRAINT `connection_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `headphonejacktype_headphone_jack_type_id` FOREIGN KEY (`headphone_jack`) REFERENCES `headphone_jack_type` (`headphone_jack_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

INSERT INTO `connection` VALUES (1,'2G, 3G, 4G','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','5.0, A2DP, LE',2);

--
-- Table structure for table `cpu`
--

DROP TABLE IF EXISTS `cpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cpu` (
  `cpu_id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_brand_id` int(11) NOT NULL,
  `igpu_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `frequency` varchar(200) DEFAULT NULL,
  `performance_rating` int(10) NOT NULL,
  PRIMARY KEY (`cpu_id`),
  UNIQUE KEY `cpu_id_UNIQUE` (`cpu_id`),
  KEY `cou_cpu_brand_id_idx` (`cpu_brand_id`),
  KEY `cpu_igpu_id_idx` (`igpu_id`),
  CONSTRAINT `cou_cpu_brand_id` FOREIGN KEY (`cpu_brand_id`) REFERENCES `cpu_brand` (`cpu_brand_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `cpu_igpu_id` FOREIGN KEY (`igpu_id`) REFERENCES `integrated_gpu` (`igpu_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu`
--

INSERT INTO `cpu` VALUES (1,5,38,'MT6750','1.0 GHz quad-core ARM Cortex-A53 1.5 GHz quad-core ARM Cortex-A53',48);
INSERT INTO `cpu` VALUES (2,5,38,'MT6750T','1.0 GHz quad-core ARM Cortex-A53 1.5 GHz quad-core ARM Cortex-A53',51);
INSERT INTO `cpu` VALUES (3,5,40,'MT6752','1.7 GHz octa-core ARM Cortex-A53',48);
INSERT INTO `cpu` VALUES (4,5,27,'MT6753','1.3 GHz quad-core ARM Cortex-A53 1.5 GHz quad-core ARM Cortex-A53',49);
INSERT INTO `cpu` VALUES (5,5,48,'Helio A22','4x Cortex-A53 @ 2.0 GHz',66);
INSERT INTO `cpu` VALUES (6,5,38,'Helio P10','2 GHz quad-core ARM Cortex-A53 and 1.2 GHz quad-core ARM Cortex-A53',59);
INSERT INTO `cpu` VALUES (7,5,38,'Helio P18','8x Cortex-A53 @ 2.0 GHz',61);
INSERT INTO `cpu` VALUES (8,5,46,'Helio P20','2.3 GHz quad-core ARM Cortex-A53 1.6 GHz quad-core ARM Cortex-A53',74);
INSERT INTO `cpu` VALUES (9,5,48,'Helio P22','8x Cortex-A53 @ 2.3 GHz',69);
INSERT INTO `cpu` VALUES (10,5,31,'Helio P23','4x Cortex A53 @ 2.3 GHz 4x Cortex A53 @ 1.65 GHz',79);
INSERT INTO `cpu` VALUES (11,5,46,'Helio P25','2.6 GHz Quad-core ARM Cortex-A53 1.6 GHz quad-core ARM Cortex-A53',75);
INSERT INTO `cpu` VALUES (12,5,31,'Helio P30','4x Cortex A53 @ 2.3 GHz 4x Cortex A53 @ 1.65 GHz',80);
INSERT INTO `cpu` VALUES (13,5,48,'Helio P35','8x Cortex A53 @ 2.3 GHz',81);
INSERT INTO `cpu` VALUES (14,5,32,'Helio P60','2.0 GHz Quad-core ARM Cortex-A73, 2 GHz quad-core ARM Cortex-A53',98);
INSERT INTO `cpu` VALUES (15,5,32,'Helio P70','2.1 GHz Quad-core ARM Cortex-A73, 2 GHz quad-core ARM Cortex-A53',99);
INSERT INTO `cpu` VALUES (16,5,50,'Helio P90','2x ARM Cortex-A75 @ 2.2GHz 6x ARM Cortex-A55 @ 2.0GHz',110);
INSERT INTO `cpu` VALUES (17,5,45,'Helio X10','2.0 GHz octa-core ARM Cortex-A53',59);
INSERT INTO `cpu` VALUES (18,5,49,'Helio X20','2.1 GHz Dual-core ARM Cortex-A72, 1.85 GHz quad-core ARM Cortex-A53, 1.4 GHz quad-core ARM Cortex-A53',75);
INSERT INTO `cpu` VALUES (19,5,49,'Helio X23','2.3 GHz Dual-core ARM Cortex-A72, 1,85 GHz quad-core ARM Cortex-A53, 1.4 GHz quad-core ARM Cortex-A53',79);
INSERT INTO `cpu` VALUES (20,5,49,'Helio X25','2.5 GHz Dual-core ARM Cortex-A72, 2 GHz quad-core ARM Cortex-A53, 1.55 GHz quad-core ARM Cortex-A53',77);
INSERT INTO `cpu` VALUES (21,5,49,'Helio X27','2.6 GHz Dual-core ARM Cortex-A72, 2 GHz quad-core ARM Cortex-A53, 1.6 GHz quad-core ARM Cortex-A53',85);
INSERT INTO `cpu` VALUES (22,5,51,'Helio X30','2.5 Ghz Dual-core ARM Cortex-A73, 2.2 Ghz Quad-core ARM Cortex-A53, 1.9 GHz Quadcore ARM Cortex-A35',109);
INSERT INTO `cpu` VALUES (23,4,54,'Kirin 620','8x Cortex-A53 @ 1.2 GHz',47);
INSERT INTO `cpu` VALUES (24,4,55,'Kirin 650','4x Cortex-A53 @ 2.0 GHz + 4x Cortex-A53 @ 1.7 GHz',70);
INSERT INTO `cpu` VALUES (25,4,55,'Kirin 655','4x Cortex-A53 @ 2.12 GHz + 4x Cortex-A53 @ 1.7 GHz',70);
INSERT INTO `cpu` VALUES (26,4,55,'Kirin 658','4x Cortex-A53 @ 2.35 GHz + 4x Cortex-A53 @ 1.7 GHz',71);
INSERT INTO `cpu` VALUES (27,4,55,'Kirin 659','4x Cortex-A53 @ 2.36 GHz + 4x Cortex-A53 @ 1.7 GHz',71);
INSERT INTO `cpu` VALUES (28,4,56,'Kirin 710','4x Cortex-A73 @ 2.2 GHz + 4x Cortex-A53 @ 1.7 GHz',98);
INSERT INTO `cpu` VALUES (29,4,58,'Kirin 930','4x Cortex-A53 @ 2.0 GHz + 4x Cortex-A53 @ 1.5 GHz',65);
INSERT INTO `cpu` VALUES (30,4,58,'Kirin 935','4x Cortex-A53 @ 2.2 GHz + 4x Cortex-A53 @ 1.5 GHz',66);
INSERT INTO `cpu` VALUES (31,4,49,'Kirin 950','4x Cortex-A72 @ 2.3 GHz + 4x Cortex-A53 @ 1.8 GHz',88);
INSERT INTO `cpu` VALUES (32,4,49,'Kirin 955','4x Cortex-A72 @ 2.5 GHz + 4x Cortex-A53 @ 1.8 GHz',89);
INSERT INTO `cpu` VALUES (33,4,60,'Kirin 960','4x Cortex-A73 @ 2.36 GHz + 4x Cortex-A53 @ 1.8 GHz',103);
INSERT INTO `cpu` VALUES (34,4,61,'Kirin 970','4x Cortex-A73 @ 2.36 GHz + 4x Cortex-A53 @ 1.8 GHz',121);
INSERT INTO `cpu` VALUES (35,4,62,'Kirin 980','4x Cortex-A76 at 2.6 GHz + 4x Cortex-A55 at 1.8 GHz',137);
INSERT INTO `cpu` VALUES (36,2,30,'Exynos 7872','	2x Cortex-A73 @ 2.0 GHz  + 4x Cortex-A53 @ 1.5 GHz',87);
INSERT INTO `cpu` VALUES (37,2,24,'Exynos 5433','4x Cortex-A57 @ 1.9 GHz  + 4x Cortex-A53 @ 1.3 GHz',61);
INSERT INTO `cpu` VALUES (38,2,25,'Exynos 7420','4x Cortex-A57 @ 2.1 GHz  + 4x Cortex-A53 @ 1.5 GHz',81);
INSERT INTO `cpu` VALUES (39,2,26,'Exynos 7570','4x Cortex-A53 @ 1.4 GHz',53);
INSERT INTO `cpu` VALUES (40,2,27,'Exynos 7580','8x Cortex-A53 @ 1.6 GHz',58);
INSERT INTO `cpu` VALUES (41,2,28,'Exynos 7870','8x Cortex-A53 @ 1.6 GHz',67);
INSERT INTO `cpu` VALUES (42,2,29,'Exynos 7880','8x Cortex-A53 @ 1.9 GHz',77);
INSERT INTO `cpu` VALUES (43,2,31,'Exynos 7904','	2x Cortex-A73 @ 1.8 GHz  + 6x Cortex-A53 @ 1.6 GHz',96);
INSERT INTO `cpu` VALUES (44,2,31,'Exynos 7885','2x Cortex-A73 @ 2.2 GHz  + 6x Cortex-A53 @ 1.6 GHz',98);
INSERT INTO `cpu` VALUES (45,2,32,'Exynos 9610','4x Cortex-A73 @ 2.3 GHz  + 4x Cortex-A53 @ 1.6 GHz',102);
INSERT INTO `cpu` VALUES (46,2,33,'Exynos 8890','4x Custom M1 @ 2.3 GHz  + 4x Cortex-A53 @ 1.6 GHz',106);
INSERT INTO `cpu` VALUES (47,2,35,'Exynos 8895','4x Custom M2 @ 2.314GHz + 4x Cortex-A53 @ 1.69GHz',114);
INSERT INTO `cpu` VALUES (48,2,36,'Exynos 9810','4x Custom M3 @ 2.9 GHz + 4x Cortex-A55 @ 1.9 GHz',125);
INSERT INTO `cpu` VALUES (49,2,37,'Exynos 9820','2x Custom M4 + 2x Cortex-A75 + 4x Cortex-A55',140);
INSERT INTO `cpu` VALUES (50,1,11,'Snapdragon 425','4x Cortex-A53 up to 1.4 GHz',49);
INSERT INTO `cpu` VALUES (51,1,11,'Snapdragon 427','4x Cortex-A53 up to 1.4 GHz',50);
INSERT INTO `cpu` VALUES (52,1,2,'Snapdragon 430','8x Cortex-A53 up to 1.4 GHz',57);
INSERT INTO `cpu` VALUES (53,1,2,'Snapdragon 435','8x Cortex-A53 up to 1.4 GHz',59);
INSERT INTO `cpu` VALUES (54,1,3,'Snapdragon 429','4x Cortex-A53 up to 1.95 GHz',65);
INSERT INTO `cpu` VALUES (55,1,2,'Snapdragon 439','4x Cortex-A53 up to 1.95 GHz + 4x Cortex-A53 up to 1.45 GHz',70);
INSERT INTO `cpu` VALUES (56,1,4,'Snapdragon 450','8x Cortex-A53 up to 1.8 GHz',69);
INSERT INTO `cpu` VALUES (57,1,4,'Snapdragon 625','8x Cortex-A53 up to 2.0 GHz',71);
INSERT INTO `cpu` VALUES (58,1,4,'Snapdragon 626','8x Cortex-A53 up to 2.2 GHz',72);
INSERT INTO `cpu` VALUES (59,1,7,'Snapdragon 630','4x Cortex-A53 at 2.2 GHz + 4x Cortex-A53 at 1.8 GHz',88);
INSERT INTO `cpu` VALUES (60,1,6,'Snapdragon 650','2x Cortex-A72 at 1.8 GHz + 4x Cortex-A53 at 1.4 GHz',70);
INSERT INTO `cpu` VALUES (61,1,6,'Snapdragon 652','4x Cortex-A72 at 1.8 GHz + 4x Cortex-A53 at 1.4 GHz',69);
INSERT INTO `cpu` VALUES (62,1,6,'Snapdragon 653','4x Cortex-A72 at 1.95 GHz + 4x Cortex-A53 at 1.4 GHz',74);
INSERT INTO `cpu` VALUES (63,1,4,'Snapdragon 632','4x Kryo 250 Gold at 1.8 GHz + 4x Kryo 250 Silver at 1.8 GHz',92);
INSERT INTO `cpu` VALUES (64,1,8,'Snapdragon 636','4x Kryo 260 Gold at 1.8 GHz + 4x Kryo 260 Silver at 1.6 GHz',97);
INSERT INTO `cpu` VALUES (65,1,1,'Snapdragon 660','4x Kryo 260 Gold at 2.2 GHz + 4x Kryo 260 Silver at 1.8 GHz',101);
INSERT INTO `cpu` VALUES (66,1,10,'Snapdragon 665','4x Kryo 260 Gold at 2.0 GHz + 4x Kryo 260 Silver at 1.8 GHz',100);
INSERT INTO `cpu` VALUES (67,1,13,'Snapdragon 670','2x Kryo 360 Gold at 2.0 GHz + 6x Kryo 360 Silver at 1.7 GHz',111);
INSERT INTO `cpu` VALUES (68,1,9,'Snapdragon 675','2x Kryo 460 Gold at 2.0 GHz + 6x Kryo 460 Silver at 1.7 GHz',112);
INSERT INTO `cpu` VALUES (69,1,14,'Snapdragon 710','2x Kryo 360 Gold at 2.2 GHz + 4x Kryo 360 Silver at 1.7 GHz',113);
INSERT INTO `cpu` VALUES (70,1,14,'Snapdragon 712','2x Kryo 360 Gold at 2.3 GHz + 4x Kryo 360 Silver at 1.7 GHz',114);
INSERT INTO `cpu` VALUES (71,1,15,'Snapdragon 730','2x Kryo 470 Gold at 2.2 GHz + 6x Kryo 470 Silver at 1.8 GHz',123);
INSERT INTO `cpu` VALUES (72,1,15,'Snapdragon 730G','2x Kryo 470 Gold at 2.2 GHz + 6x Kryo 470 Silver at 1.8 GHz',124);
INSERT INTO `cpu` VALUES (73,1,18,'Snapdragon 808','2x Cortex-A57 at 2.0 GHz + 4x Cortex-A53 at 1.4 GHz',68);
INSERT INTO `cpu` VALUES (74,1,19,'Snapdragon 810','4x Cortex-A57 at 2.0 GHz + 4x Cortex-A53 at 1.6 GHz',80);
INSERT INTO `cpu` VALUES (75,1,20,'Snapdragon 820','2x Kryo at 2.2 GHz+ 2x Kryo at 1.6 GHz',107);
INSERT INTO `cpu` VALUES (76,1,20,'Snapdragon 821','2x Kryo at 2.4 GHz+ 2x Kryo at 1.6 GHz',108);
INSERT INTO `cpu` VALUES (77,1,21,'Snapdragon 835','4x Kryo 280 at 2.45 GHz + 4x Kryo 280 at 1.9 GHz',117);
INSERT INTO `cpu` VALUES (78,1,22,'Snapdragon 845','4x Kryo 385 Gold at 2.8 GHz + 4x Kryo 385 Silver at 1.8 GHz',127);
INSERT INTO `cpu` VALUES (79,1,23,'Snapdragon 855','1x Kryo 485 at 2.84GHz + 3x Kryo 485 at 2.42GHz + 4x Kryo 485 at 1.80GHz',144);
INSERT INTO `cpu` VALUES (80,3,71,'A7','1.3 GHz dual-core Cyclone',65);
INSERT INTO `cpu` VALUES (81,3,63,'A8','1.1–1.5 GHz dual-core Typhoon',74);
INSERT INTO `cpu` VALUES (82,3,65,'A9','1.85 GHz dual-core Twister',109);
INSERT INTO `cpu` VALUES (83,3,67,'A10 Fusion','2.16–2.26 GHz dual-core Twister',118);
INSERT INTO `cpu` VALUES (84,3,68,'A11 Bionic','2.39 GHz hexa-core (2x Monsoon + 4x Mistral)',130);
INSERT INTO `cpu` VALUES (85,3,69,'A12 Bionic','2.49 GHz hexa-core (2x Vortex + 4x Tempest)',146);

--
-- Temporary view structure for view `cpu specification full`
--

DROP TABLE IF EXISTS `cpu specification full`;
/*!50001 DROP VIEW IF EXISTS `cpu specification full`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `cpu specification full` AS SELECT 
 1 AS `cpu_id`,
 1 AS `CPU Name`,
 1 AS `Core Frequency`,
 1 AS `GPU`,
 1 AS `Performance Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cpu_brand`
--

DROP TABLE IF EXISTS `cpu_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cpu_brand` (
  `cpu_brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`cpu_brand_id`),
  UNIQUE KEY `cpu_brand_id_UNIQUE` (`cpu_brand_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cpu_brand`
--

INSERT INTO `cpu_brand` VALUES (3,'Apple');
INSERT INTO `cpu_brand` VALUES (4,'HiSilicon');
INSERT INTO `cpu_brand` VALUES (5,'MediaTek');
INSERT INTO `cpu_brand` VALUES (1,'Qualcomm');
INSERT INTO `cpu_brand` VALUES (2,'Samsung');

--
-- Table structure for table `design`
--

DROP TABLE IF EXISTS `design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `design` (
  `smartphone_model_id` int(11) NOT NULL,
  `body_protection_id` int(11) NOT NULL,
  `frame_protection_id` int(11) NOT NULL,
  `screen_protection_id` int(11) NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `thickness` float NOT NULL,
  `weight` int(10) NOT NULL,
  `feature_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`smartphone_model_id`),
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `design_body_protection_id_idx` (`body_protection_id`),
  KEY `design_frame_protection_id_idx` (`frame_protection_id`),
  KEY `design_screen_protection_id_idx` (`screen_protection_id`),
  CONSTRAINT `design_body_protection_id` FOREIGN KEY (`body_protection_id`) REFERENCES `body_protection` (`body_protection_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `design_frame_protection_id` FOREIGN KEY (`frame_protection_id`) REFERENCES `frame_protection` (`frame_protection_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `design_screen_protection_id` FOREIGN KEY (`screen_protection_id`) REFERENCES `screen_protection` (`screen_protection_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `design_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design`
--

INSERT INTO `design` VALUES (1,3,3,7,157.5,77.4,7.7,208,'IP68 dust/water resistant (up to 2 meters for 30 mins)');

--
-- Table structure for table `display`
--

DROP TABLE IF EXISTS `display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `display` (
  `smartphone_model_id` int(11) NOT NULL,
  `display_type_id` int(11) NOT NULL,
  `size` float NOT NULL,
  `resolution` varchar(45) NOT NULL,
  `ratio` varchar(45) NOT NULL,
  `pixel_density` int(11) NOT NULL,
  `feature_description` varchar(200) DEFAULT NULL,
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `display_smartphone_model_id_idx` (`smartphone_model_id`),
  KEY `display_display_type_id_idx` (`display_type_id`),
  CONSTRAINT `display_display_type_id` FOREIGN KEY (`display_type_id`) REFERENCES `display_type` (`display_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `display_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display`
--

INSERT INTO `display` VALUES (1,4,6.5,'1242 x 2688','19.5:9',458,NULL);

--
-- Table structure for table `display_type`
--

DROP TABLE IF EXISTS `display_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `display_type` (
  `display_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`display_type_id`),
  UNIQUE KEY `display_type_id_UNIQUE` (`display_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display_type`
--

INSERT INTO `display_type` VALUES (8,'	LED-backlit IPS LCD');
INSERT INTO `display_type` VALUES (2,'	PLS TFT LCD');
INSERT INTO `display_type` VALUES (5,'AMOLED');
INSERT INTO `display_type` VALUES (7,'Dynamic AMOLED');
INSERT INTO `display_type` VALUES (1,'IPS LCD');
INSERT INTO `display_type` VALUES (3,'LTPS LCD');
INSERT INTO `display_type` VALUES (4,'OLED');
INSERT INTO `display_type` VALUES (6,'Super AMOLED');

--
-- Table structure for table `frame_protection`
--

DROP TABLE IF EXISTS `frame_protection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `frame_protection` (
  `frame_protection_id` int(11) NOT NULL AUTO_INCREMENT,
  `material` varchar(45) NOT NULL,
  PRIMARY KEY (`frame_protection_id`),
  UNIQUE KEY `idframeprotection_UNIQUE` (`frame_protection_id`),
  UNIQUE KEY `material_UNIQUE` (`material`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frame_protection`
--

INSERT INTO `frame_protection` VALUES (2,'Aluminum');
INSERT INTO `frame_protection` VALUES (1,'Plastic');
INSERT INTO `frame_protection` VALUES (3,'Stainless Steel');

--
-- Table structure for table `front_camera`
--

DROP TABLE IF EXISTS `front_camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `front_camera` (
  `front_cam_id` int(11) NOT NULL AUTO_INCREMENT,
  `camera_id` int(11) NOT NULL,
  `resolution` float NOT NULL,
  `aperture` float NOT NULL,
  `focal_length` int(10) NOT NULL,
  PRIMARY KEY (`front_cam_id`),
  UNIQUE KEY `front_cam_id_UNIQUE` (`front_cam_id`),
  KEY `frontcam_camera_id_idx` (`camera_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `frontcam_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `camera` (`camera_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `front_camera`
--

INSERT INTO `front_camera` VALUES (1,1,12,2.4,52);
INSERT INTO `front_camera` VALUES (2,1,12,1.8,26);

--
-- Table structure for table `headphone_jack_type`
--

DROP TABLE IF EXISTS `headphone_jack_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `headphone_jack_type` (
  `headphone_jack_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`headphone_jack_type_id`),
  UNIQUE KEY `headphonejacktypecol_UNIQUE` (`name`),
  UNIQUE KEY `headphone_jack_type_id_UNIQUE` (`headphone_jack_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `headphone_jack_type`
--

INSERT INTO `headphone_jack_type` VALUES (1,'3.5 mm');
INSERT INTO `headphone_jack_type` VALUES (2,'Lightning');

--
-- Table structure for table `integrated_gpu`
--

DROP TABLE IF EXISTS `integrated_gpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `integrated_gpu` (
  `igpu_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`igpu_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `igpu_id_UNIQUE` (`igpu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_gpu`
--

INSERT INTO `integrated_gpu` VALUES (12,'Adreno 306');
INSERT INTO `integrated_gpu` VALUES (11,'Adreno 308');
INSERT INTO `integrated_gpu` VALUES (16,'Adreno 330');
INSERT INTO `integrated_gpu` VALUES (5,'Adreno 405');
INSERT INTO `integrated_gpu` VALUES (18,'Adreno 418');
INSERT INTO `integrated_gpu` VALUES (17,'Adreno 420');
INSERT INTO `integrated_gpu` VALUES (19,'Adreno 430');
INSERT INTO `integrated_gpu` VALUES (3,'Adreno 504');
INSERT INTO `integrated_gpu` VALUES (2,'Adreno 505');
INSERT INTO `integrated_gpu` VALUES (4,'Adreno 506');
INSERT INTO `integrated_gpu` VALUES (7,'Adreno 508');
INSERT INTO `integrated_gpu` VALUES (8,'Adreno 509');
INSERT INTO `integrated_gpu` VALUES (6,'Adreno 510');
INSERT INTO `integrated_gpu` VALUES (1,'Adreno 512');
INSERT INTO `integrated_gpu` VALUES (20,'Adreno 530');
INSERT INTO `integrated_gpu` VALUES (21,'Adreno 540');
INSERT INTO `integrated_gpu` VALUES (10,'Adreno 610');
INSERT INTO `integrated_gpu` VALUES (9,'Adreno 612');
INSERT INTO `integrated_gpu` VALUES (13,'Adreno 615');
INSERT INTO `integrated_gpu` VALUES (14,'Adreno 616');
INSERT INTO `integrated_gpu` VALUES (15,'Adreno 618');
INSERT INTO `integrated_gpu` VALUES (22,'Adreno 630');
INSERT INTO `integrated_gpu` VALUES (23,'Adreno 640');
INSERT INTO `integrated_gpu` VALUES (68,'Apple-designed 3 core');
INSERT INTO `integrated_gpu` VALUES (69,'Apple-designed 4 core');
INSERT INTO `integrated_gpu` VALUES (70,'Apple-designed 7-core');
INSERT INTO `integrated_gpu` VALUES (53,'IMG PowerVR 7XTP-MT4');
INSERT INTO `integrated_gpu` VALUES (52,'IMG PowerVR G6200');
INSERT INTO `integrated_gpu` VALUES (47,'IMG PowerVR GE8320');
INSERT INTO `integrated_gpu` VALUES (54,'Mali-450 MP4');
INSERT INTO `integrated_gpu` VALUES (56,'Mali-G51 MP4');
INSERT INTO `integrated_gpu` VALUES (30,'Mali-G71 MP1');
INSERT INTO `integrated_gpu` VALUES (31,'Mali-G71 MP2');
INSERT INTO `integrated_gpu` VALUES (35,'Mali-G71 MP20');
INSERT INTO `integrated_gpu` VALUES (60,'Mali-G71 MP8');
INSERT INTO `integrated_gpu` VALUES (61,'Mali-G72 MP12');
INSERT INTO `integrated_gpu` VALUES (36,'Mali-G72 MP18');
INSERT INTO `integrated_gpu` VALUES (32,'Mali-G72 MP3');
INSERT INTO `integrated_gpu` VALUES (62,'Mali-G76 MP10');
INSERT INTO `integrated_gpu` VALUES (37,'Mali-G76 MP12');
INSERT INTO `integrated_gpu` VALUES (58,'Mali-T628 MP4');
INSERT INTO `integrated_gpu` VALUES (26,'Mali-T720 MP1');
INSERT INTO `integrated_gpu` VALUES (27,'Mali-T720 MP2');
INSERT INTO `integrated_gpu` VALUES (39,'Mali-T720 MP3');
INSERT INTO `integrated_gpu` VALUES (40,'Mali-T760 MP2 ');
INSERT INTO `integrated_gpu` VALUES (24,'Mali-T760 MP6');
INSERT INTO `integrated_gpu` VALUES (25,'Mali-T760 MP8');
INSERT INTO `integrated_gpu` VALUES (28,'Mali-T830 MP1');
INSERT INTO `integrated_gpu` VALUES (55,'Mali-T830 MP2');
INSERT INTO `integrated_gpu` VALUES (29,'Mali-T830 MP3');
INSERT INTO `integrated_gpu` VALUES (38,'Mali-T860 MP2');
INSERT INTO `integrated_gpu` VALUES (34,'Mali-T880 MP10 (Lite)');
INSERT INTO `integrated_gpu` VALUES (33,'Mali-T880 MP12');
INSERT INTO `integrated_gpu` VALUES (46,'Mali-T880 MP2');
INSERT INTO `integrated_gpu` VALUES (49,'Mali-T880 MP4');
INSERT INTO `integrated_gpu` VALUES (66,'PowerVR 7XT Series');
INSERT INTO `integrated_gpu` VALUES (45,'PowerVR G6200');
INSERT INTO `integrated_gpu` VALUES (71,'PowerVR G6430');
INSERT INTO `integrated_gpu` VALUES (48,'PowerVR GE8320');
INSERT INTO `integrated_gpu` VALUES (50,'PowerVR GM9446');
INSERT INTO `integrated_gpu` VALUES (51,'PowerVR GT7400 Plus');
INSERT INTO `integrated_gpu` VALUES (65,'PowerVR GT7600');
INSERT INTO `integrated_gpu` VALUES (67,'PowerVR GT7600 Plus');
INSERT INTO `integrated_gpu` VALUES (63,'PowerVR GX6450');
INSERT INTO `integrated_gpu` VALUES (64,'PowerVR GXA6850');

--
-- Table structure for table `memory_card`
--

DROP TABLE IF EXISTS `memory_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `memory_card` (
  `smartphone_model_id` int(11) NOT NULL,
  `mem_card_type_id` int(11) DEFAULT NULL,
  `mem_slot_type_id` int(11) DEFAULT NULL,
  `max_capacity` int(10) DEFAULT NULL,
  PRIMARY KEY (`smartphone_model_id`),
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `memorycardslot_mem_card_type_id_idx` (`mem_card_type_id`),
  KEY `memorycardslot_mem_slot_type_id_idx` (`mem_slot_type_id`),
  CONSTRAINT `memorycard_mem_card_type_id` FOREIGN KEY (`mem_card_type_id`) REFERENCES `memory_card_type` (`mem_card_type_id`),
  CONSTRAINT `memorycard_mem_slot_type_id` FOREIGN KEY (`mem_slot_type_id`) REFERENCES `memory_slot_type` (`mem_slot_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `memorycard_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory_card`
--

INSERT INTO `memory_card` VALUES (1,NULL,2,NULL);

--
-- Table structure for table `memory_card_type`
--

DROP TABLE IF EXISTS `memory_card_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `memory_card_type` (
  `mem_card_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`mem_card_type_id`),
  UNIQUE KEY `mem_card_type_id_UNIQUE` (`mem_card_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory_card_type`
--

INSERT INTO `memory_card_type` VALUES (1,'MicroSD');

--
-- Table structure for table `memory_slot_type`
--

DROP TABLE IF EXISTS `memory_slot_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `memory_slot_type` (
  `mem_slot_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`mem_slot_type_id`),
  UNIQUE KEY `mem_slot_type_id_UNIQUE` (`mem_slot_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memory_slot_type`
--

INSERT INTO `memory_slot_type` VALUES (4,'Dual SIM + 1 memory slot');
INSERT INTO `memory_slot_type` VALUES (3,'Hybrid Dual SIM');
INSERT INTO `memory_slot_type` VALUES (1,'No');
INSERT INTO `memory_slot_type` VALUES (2,'Single SIM');

--
-- Table structure for table `operating_system`
--

DROP TABLE IF EXISTS `operating_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `operating_system` (
  `os_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_stock_version_id` int(11) NOT NULL,
  `os_mod_version_id` int(11) NOT NULL,
  PRIMARY KEY (`os_id`),
  UNIQUE KEY `os_id_UNIQUE` (`os_id`),
  KEY `operatingsystem_os_stock_type_id_idx` (`os_stock_version_id`),
  KEY `operatingsystem_os_mod_version_id_idx` (`os_mod_version_id`),
  CONSTRAINT `operatingsystem_os_mod_version_id` FOREIGN KEY (`os_mod_version_id`) REFERENCES `os_modifier_version` (`os_mod_version_id`),
  CONSTRAINT `operatingsystem_os_stock_type_id` FOREIGN KEY (`os_stock_version_id`) REFERENCES `os_stock_version` (`os_stock_version_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operating_system`
--

INSERT INTO `operating_system` VALUES (1,3,1);
INSERT INTO `operating_system` VALUES (2,4,1);
INSERT INTO `operating_system` VALUES (3,5,1);
INSERT INTO `operating_system` VALUES (4,6,1);
INSERT INTO `operating_system` VALUES (5,3,2);
INSERT INTO `operating_system` VALUES (6,4,2);
INSERT INTO `operating_system` VALUES (7,5,2);
INSERT INTO `operating_system` VALUES (8,6,2);
INSERT INTO `operating_system` VALUES (9,7,1);
INSERT INTO `operating_system` VALUES (10,8,1);
INSERT INTO `operating_system` VALUES (11,9,1);
INSERT INTO `operating_system` VALUES (12,10,1);

--
-- Table structure for table `os_modifier_type`
--

DROP TABLE IF EXISTS `os_modifier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `os_modifier_type` (
  `os_mod_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`os_mod_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `os_modifier_id_UNIQUE` (`os_mod_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_modifier_type`
--

INSERT INTO `os_modifier_type` VALUES (2,'Android One');
INSERT INTO `os_modifier_type` VALUES (6,'ColorOS');
INSERT INTO `os_modifier_type` VALUES (1,'Default');
INSERT INTO `os_modifier_type` VALUES (5,'EMUI');
INSERT INTO `os_modifier_type` VALUES (3,'MIUI');
INSERT INTO `os_modifier_type` VALUES (4,'One UI');

--
-- Table structure for table `os_modifier_version`
--

DROP TABLE IF EXISTS `os_modifier_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `os_modifier_version` (
  `os_mod_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_mod_type_id` int(11) NOT NULL,
  `version` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`os_mod_version_id`),
  UNIQUE KEY `os_mod_version_id_UNIQUE` (`os_mod_version_id`),
  KEY `osmodversion_os_mod_type_id_idx` (`os_mod_type_id`),
  CONSTRAINT `osmodversion_os_mod_type_id` FOREIGN KEY (`os_mod_type_id`) REFERENCES `os_modifier_type` (`os_mod_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_modifier_version`
--

INSERT INTO `os_modifier_version` VALUES (1,1,NULL);
INSERT INTO `os_modifier_version` VALUES (2,2,NULL);
INSERT INTO `os_modifier_version` VALUES (3,3,'9');
INSERT INTO `os_modifier_version` VALUES (4,3,'10');
INSERT INTO `os_modifier_version` VALUES (5,3,'11');
INSERT INTO `os_modifier_version` VALUES (6,4,NULL);
INSERT INTO `os_modifier_version` VALUES (7,5,'8.0');
INSERT INTO `os_modifier_version` VALUES (8,5,'9.0');
INSERT INTO `os_modifier_version` VALUES (9,5,'10.0');
INSERT INTO `os_modifier_version` VALUES (10,6,'5.0');
INSERT INTO `os_modifier_version` VALUES (11,6,'5.1');
INSERT INTO `os_modifier_version` VALUES (12,6,'5.2');
INSERT INTO `os_modifier_version` VALUES (13,6,'6.0');

--
-- Table structure for table `os_stock_type`
--

DROP TABLE IF EXISTS `os_stock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `os_stock_type` (
  `os_stock_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`os_stock_type_id`),
  UNIQUE KEY `os_type_id_UNIQUE` (`os_stock_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_stock_type`
--

INSERT INTO `os_stock_type` VALUES (1,'Android');
INSERT INTO `os_stock_type` VALUES (2,'iOS');

--
-- Table structure for table `os_stock_version`
--

DROP TABLE IF EXISTS `os_stock_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `os_stock_version` (
  `os_stock_version_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_type_id` int(11) NOT NULL,
  `version` varchar(45) NOT NULL,
  PRIMARY KEY (`os_stock_version_id`),
  UNIQUE KEY `os_stock_version_id_UNIQUE` (`os_stock_version_id`),
  KEY `osstockversion_os_type_id_idx` (`os_type_id`),
  CONSTRAINT `osstockversion_os_type_id` FOREIGN KEY (`os_type_id`) REFERENCES `os_stock_type` (`os_stock_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_stock_version`
--

INSERT INTO `os_stock_version` VALUES (1,1,'7.0 Nougat');
INSERT INTO `os_stock_version` VALUES (2,1,'7.1 Nougat');
INSERT INTO `os_stock_version` VALUES (3,1,'8.0 Oreo');
INSERT INTO `os_stock_version` VALUES (4,1,'8.1 Oreo');
INSERT INTO `os_stock_version` VALUES (5,1,'9 Pie');
INSERT INTO `os_stock_version` VALUES (6,1,'Q');
INSERT INTO `os_stock_version` VALUES (7,2,'9');
INSERT INTO `os_stock_version` VALUES (8,2,'10');
INSERT INTO `os_stock_version` VALUES (9,2,'11');
INSERT INTO `os_stock_version` VALUES (10,2,'12');

--
-- Table structure for table `quick_charge_type`
--

DROP TABLE IF EXISTS `quick_charge_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `quick_charge_type` (
  `quick_charge_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`quick_charge_type_id`),
  UNIQUE KEY `quick_charge_type_id_UNIQUE` (`quick_charge_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quick_charge_type`
--

INSERT INTO `quick_charge_type` VALUES (1,'Fast battery charging 15W');
INSERT INTO `quick_charge_type` VALUES (3,'Fast battery charging 15W (USB Power Delivery 2.0)');
INSERT INTO `quick_charge_type` VALUES (2,'Fast battery charging 18W');
INSERT INTO `quick_charge_type` VALUES (4,'Fast battery charging 25W (USB Power Delivery 3.0)');
INSERT INTO `quick_charge_type` VALUES (6,'Quick Charge 1.0');
INSERT INTO `quick_charge_type` VALUES (7,'Quick Charge 2.0');
INSERT INTO `quick_charge_type` VALUES (8,'Quick Charge 3.0');
INSERT INTO `quick_charge_type` VALUES (9,'Quick Charge 4.0');
INSERT INTO `quick_charge_type` VALUES (10,'Quick Charge 4.0+');
INSERT INTO `quick_charge_type` VALUES (5,'VOOC');

--
-- Table structure for table `screen_protection`
--

DROP TABLE IF EXISTS `screen_protection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `screen_protection` (
  `screen_protection_id` int(11) NOT NULL AUTO_INCREMENT,
  `material` varchar(45) NOT NULL,
  PRIMARY KEY (`screen_protection_id`),
  UNIQUE KEY `screen_protection_id_UNIQUE` (`screen_protection_id`),
  UNIQUE KEY `material_UNIQUE` (`material`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen_protection`
--

INSERT INTO `screen_protection` VALUES (1,'Corning Gorilla Glass');
INSERT INTO `screen_protection` VALUES (2,'Corning Gorilla Glass 3');
INSERT INTO `screen_protection` VALUES (3,'Corning Gorilla Glass 4');
INSERT INTO `screen_protection` VALUES (4,'Corning Gorilla Glass 5');
INSERT INTO `screen_protection` VALUES (5,'Corning Gorilla Glass 6');
INSERT INTO `screen_protection` VALUES (6,'NEG Dinorex Glass');
INSERT INTO `screen_protection` VALUES (7,'Oleophobic Glass (Ion-Strengthened)');
INSERT INTO `screen_protection` VALUES (8,'Sapphire Glass');

--
-- Table structure for table `security_type`
--

DROP TABLE IF EXISTS `security_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `security_type` (
  `security_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`security_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `security_type_id_UNIQUE` (`security_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_type`
--

INSERT INTO `security_type` VALUES (10,'3D face scanner');
INSERT INTO `security_type` VALUES (7,'Face ID');
INSERT INTO `security_type` VALUES (8,'Facial detection');
INSERT INTO `security_type` VALUES (1,'Fingerprint (back side)');
INSERT INTO `security_type` VALUES (2,'Fingerprint (frame side)');
INSERT INTO `security_type` VALUES (3,'Fingerprint (front side)');
INSERT INTO `security_type` VALUES (9,'Infrared face scanner');
INSERT INTO `security_type` VALUES (6,'Iris scanner');
INSERT INTO `security_type` VALUES (4,'Optical fingerprint');
INSERT INTO `security_type` VALUES (5,'Ultrasonic fingerprint');

--
-- Table structure for table `sim`
--

DROP TABLE IF EXISTS `sim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sim` (
  `sim_id` int(11) NOT NULL AUTO_INCREMENT,
  `smartphone_model_id` int(11) NOT NULL,
  `sim_type_id` int(11) NOT NULL,
  PRIMARY KEY (`sim_id`),
  UNIQUE KEY `sim_id_UNIQUE` (`sim_id`),
  KEY `sim_smartphone_model_id_idx` (`smartphone_model_id`),
  KEY `sim_sim_type_id_idx` (`sim_type_id`),
  CONSTRAINT `sim_sim_type_id` FOREIGN KEY (`sim_type_id`) REFERENCES `sim_type` (`sim_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `sim_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sim`
--

INSERT INTO `sim` VALUES (1,1,3);
INSERT INTO `sim` VALUES (2,1,4);

--
-- Table structure for table `sim_type`
--

DROP TABLE IF EXISTS `sim_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sim_type` (
  `sim_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`sim_type_id`),
  UNIQUE KEY `sim_type_id_UNIQUE` (`sim_type_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sim_type`
--

INSERT INTO `sim_type` VALUES (4,'eSIM');
INSERT INTO `sim_type` VALUES (2,'Micro SIM');
INSERT INTO `sim_type` VALUES (1,'Mini SIM');
INSERT INTO `sim_type` VALUES (3,'Nano SIM');

--
-- Table structure for table `smartphone`
--

DROP TABLE IF EXISTS `smartphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smartphone` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `smartphone_modifier_id` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`),
  KEY `smartphone_smartphone_modifier_id_idx` (`smartphone_modifier_id`),
  CONSTRAINT `smartphone_smartphone_modifier_id` FOREIGN KEY (`smartphone_modifier_id`) REFERENCES `smartphone_modifier` (`smartphone_modifier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone`
--

INSERT INTO `smartphone` VALUES (1,1,'Silver','636748771945549047_iPhone-Xs-Max-Sliver.png');
INSERT INTO `smartphone` VALUES (2,1,'Space Gray','636748771942273320_iPhone-Xs-Max-Space-Gray.png');
INSERT INTO `smartphone` VALUES (3,1,'Gold','636748771945393060_iPhone-Xs-Max-Gold.png');
INSERT INTO `smartphone` VALUES (4,2,'Silver','636748771945549047_iPhone-Xs-Max-Sliver.png');
INSERT INTO `smartphone` VALUES (5,2,'Space Gray','636748771942273320_iPhone-Xs-Max-Space-Gray.png');
INSERT INTO `smartphone` VALUES (6,2,'Gold','636748771945393060_iPhone-Xs-Max-Gold.png');
INSERT INTO `smartphone` VALUES (7,3,'Gold','636748771945393060_iPhone-Xs-Max-Gold.png');

--
-- Table structure for table `smartphone_brand`
--

DROP TABLE IF EXISTS `smartphone_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smartphone_brand` (
  `smartphone_brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`smartphone_brand_id`),
  UNIQUE KEY `brand_id_UNIQUE` (`smartphone_brand_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone_brand`
--

INSERT INTO `smartphone_brand` VALUES (1,'Apple');
INSERT INTO `smartphone_brand` VALUES (6,'Asus');
INSERT INTO `smartphone_brand` VALUES (8,'BlackBerry');
INSERT INTO `smartphone_brand` VALUES (7,'Nokia');
INSERT INTO `smartphone_brand` VALUES (3,'Oppo');
INSERT INTO `smartphone_brand` VALUES (4,'Realme');
INSERT INTO `smartphone_brand` VALUES (2,'Samsung');
INSERT INTO `smartphone_brand` VALUES (9,'Vsmart');
INSERT INTO `smartphone_brand` VALUES (5,'Xiaomi');

--
-- Table structure for table `smartphone_brand_series`
--

DROP TABLE IF EXISTS `smartphone_brand_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smartphone_brand_series` (
  `brand_series_id` int(11) NOT NULL AUTO_INCREMENT,
  `smartphone_brand_id` int(11) NOT NULL,
  `series_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`brand_series_id`),
  UNIQUE KEY `brand_series_id_UNIQUE` (`brand_series_id`),
  KEY `smartphonebrand_smartphone_brand_id_idx` (`smartphone_brand_id`),
  CONSTRAINT `smartphonebrand_smartphone_brand_id` FOREIGN KEY (`smartphone_brand_id`) REFERENCES `smartphone_brand` (`smartphone_brand_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone_brand_series`
--

INSERT INTO `smartphone_brand_series` VALUES (1,1,'iPhone');
INSERT INTO `smartphone_brand_series` VALUES (2,2,NULL);
INSERT INTO `smartphone_brand_series` VALUES (3,3,NULL);
INSERT INTO `smartphone_brand_series` VALUES (4,4,NULL);
INSERT INTO `smartphone_brand_series` VALUES (5,5,'Mi');
INSERT INTO `smartphone_brand_series` VALUES (6,5,'Redmi');
INSERT INTO `smartphone_brand_series` VALUES (7,6,'Zenfone');
INSERT INTO `smartphone_brand_series` VALUES (8,7,NULL);
INSERT INTO `smartphone_brand_series` VALUES (9,8,NULL);
INSERT INTO `smartphone_brand_series` VALUES (10,9,NULL);

--
-- Table structure for table `smartphone_model`
--

DROP TABLE IF EXISTS `smartphone_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smartphone_model` (
  `smartphone_model_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_series_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `cpu_id` int(11) NOT NULL,
  `os_id` int(11) NOT NULL,
  `date_realeased` date DEFAULT NULL,
  PRIMARY KEY (`smartphone_model_id`),
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `smartphonemodel_brand_series_id_idx` (`brand_series_id`),
  KEY `smartphonemodel_cpu_id_idx` (`cpu_id`),
  KEY `smartphonemodel_os_id_idx` (`os_id`),
  CONSTRAINT `smartphonemodel_brand_series_id` FOREIGN KEY (`brand_series_id`) REFERENCES `smartphone_brand_series` (`brand_series_id`) ON UPDATE CASCADE,
  CONSTRAINT `smartphonemodel_cpu_id` FOREIGN KEY (`cpu_id`) REFERENCES `cpu` (`cpu_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `smartphonemodel_os_id` FOREIGN KEY (`os_id`) REFERENCES `operating_system` (`os_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone_model`
--

INSERT INTO `smartphone_model` VALUES (1,1,'Xs Max',85,12,'2019-05-25');

--
-- Table structure for table `smartphone_modifier`
--

DROP TABLE IF EXISTS `smartphone_modifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `smartphone_modifier` (
  `smartphone_modifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `smartphone_model_id` int(11) NOT NULL,
  `ram` varchar(45) NOT NULL,
  `rom` varchar(45) NOT NULL,
  `price` int(10) NOT NULL,
  PRIMARY KEY (`smartphone_modifier_id`),
  UNIQUE KEY `sp_modifier_id_UNIQUE` (`smartphone_modifier_id`),
  KEY `smartphonemodifier_smartphone_model_id_idx` (`smartphone_model_id`),
  CONSTRAINT `smartphonemodifier_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone_modifier`
--

INSERT INTO `smartphone_modifier` VALUES (1,1,'4','64',29990000);
INSERT INTO `smartphone_modifier` VALUES (2,1,'4','256',35990000);
INSERT INTO `smartphone_modifier` VALUES (3,1,'4','512',39990000);

--
-- Table structure for table `unlock_security`
--

DROP TABLE IF EXISTS `unlock_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `unlock_security` (
  `unlock_security_id` int(11) NOT NULL AUTO_INCREMENT,
  `smartphone_model_id` int(11) NOT NULL,
  `security_type_id` int(11) NOT NULL,
  PRIMARY KEY (`unlock_security_id`),
  UNIQUE KEY `unlock_security_id_UNIQUE` (`unlock_security_id`),
  KEY `unlocksecurity_smartphone_model_id_idx` (`smartphone_model_id`),
  KEY `unlocksecurity_security_type_id_idx` (`security_type_id`),
  CONSTRAINT `unlocksecurity_security_type_id` FOREIGN KEY (`security_type_id`) REFERENCES `security_type` (`security_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `unlocksecurity_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unlock_security`
--

INSERT INTO `unlock_security` VALUES (1,1,7);

--
-- Final view structure for view `cpu specification full`
--

/*!50001 DROP VIEW IF EXISTS `cpu specification full`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cpu specification full` AS select `cpu`.`cpu_id` AS `cpu_id`,concat(`cpu_brand`.`name`,' ',`cpu`.`name`) AS `CPU Name`,`cpu`.`frequency` AS `Core Frequency`,`integrated_gpu`.`name` AS `GPU`,`cpu`.`performance_rating` AS `Performance Rating` from ((`cpu` left join `cpu_brand` on((`cpu`.`cpu_brand_id` = `cpu_brand`.`cpu_brand_id`))) left join `integrated_gpu` on((`cpu`.`igpu_id` = `integrated_gpu`.`igpu_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
