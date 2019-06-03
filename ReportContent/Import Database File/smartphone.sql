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
  `focal_length` int(10) DEFAULT NULL,
  PRIMARY KEY (`back_cam_id`),
  UNIQUE KEY `back_cam_id_UNIQUE` (`back_cam_id`),
  KEY `backcam_camera_id_idx` (`camera_id`),
  CONSTRAINT `backcam_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `camera` (`camera_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `back_camera`
--

INSERT INTO `back_camera` VALUES (1,1,12,2.4,52);
INSERT INTO `back_camera` VALUES (2,1,12,1.8,26);
INSERT INTO `back_camera` VALUES (3,2,12,2.4,52);
INSERT INTO `back_camera` VALUES (4,2,12,1.8,26);
INSERT INTO `back_camera` VALUES (5,3,12,1.8,26);
INSERT INTO `back_camera` VALUES (6,4,12,2.4,52);
INSERT INTO `back_camera` VALUES (7,4,12,1.8,28);
INSERT INTO `back_camera` VALUES (8,5,12,2.8,57);
INSERT INTO `back_camera` VALUES (9,5,12,1.8,28);
INSERT INTO `back_camera` VALUES (10,6,12,1.8,28);
INSERT INTO `back_camera` VALUES (11,7,12,2.8,56);
INSERT INTO `back_camera` VALUES (12,7,12,1.8,28);
INSERT INTO `back_camera` VALUES (13,8,12,1.8,28);
INSERT INTO `back_camera` VALUES (14,9,12,2.2,29);
INSERT INTO `back_camera` VALUES (15,10,12,1.5,26);
INSERT INTO `back_camera` VALUES (16,10,12,2.4,52);
INSERT INTO `back_camera` VALUES (17,10,16,2.2,12);
INSERT INTO `back_camera` VALUES (18,11,12,1.5,26);
INSERT INTO `back_camera` VALUES (19,11,12,2.4,52);
INSERT INTO `back_camera` VALUES (20,11,16,2.2,12);
INSERT INTO `back_camera` VALUES (21,12,12,1.5,26);
INSERT INTO `back_camera` VALUES (22,12,16,2.2,12);
INSERT INTO `back_camera` VALUES (23,13,12,1.5,26);
INSERT INTO `back_camera` VALUES (24,13,12,2.4,52);
INSERT INTO `back_camera` VALUES (25,14,12,2.4,52);
INSERT INTO `back_camera` VALUES (26,14,12,2.7,26);
INSERT INTO `back_camera` VALUES (27,15,12,2.4,52);
INSERT INTO `back_camera` VALUES (28,15,12,1.5,26);
INSERT INTO `back_camera` VALUES (29,16,12,1.5,26);

--
-- Table structure for table `battery`
--

DROP TABLE IF EXISTS `battery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `battery` (
  `smartphone_model_id` int(11) NOT NULL,
  `battery_type_id` int(11) NOT NULL,
  `capacity` int(10) NOT NULL,
  `quick_charge_type_id` int(11) DEFAULT NULL,
  `charging_port_id` int(11) NOT NULL,
  `feature_description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`smartphone_model_id`),
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `battery_battery_type_id_idx` (`battery_type_id`),
  KEY `quick_charge_type_id_idx` (`quick_charge_type_id`),
  KEY `charging_port_id_idx` (`charging_port_id`),
  CONSTRAINT `battery_battery_type_id` FOREIGN KEY (`battery_type_id`) REFERENCES `battery_type` (`battery_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `battery_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `charging_port_id` FOREIGN KEY (`charging_port_id`) REFERENCES `charging_port` (`charging_port_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `quick_charge_type_id` FOREIGN KEY (`quick_charge_type_id`) REFERENCES `quick_charge_type` (`quick_charge_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battery`
--

INSERT INTO `battery` VALUES (1,1,3174,3,3,'Qi wireless charging');
INSERT INTO `battery` VALUES (2,1,2658,3,3,'Qi wireless charging');
INSERT INTO `battery` VALUES (3,1,2942,3,3,'Qi wireless charging');
INSERT INTO `battery` VALUES (4,1,2716,3,3,'Qi wireless charging');
INSERT INTO `battery` VALUES (5,1,2691,3,3,'Qi wireless charging');
INSERT INTO `battery` VALUES (6,1,1821,3,3,'Qi wireless charging');
INSERT INTO `battery` VALUES (7,1,2900,NULL,3,NULL);
INSERT INTO `battery` VALUES (8,1,1960,NULL,3,NULL);
INSERT INTO `battery` VALUES (9,1,2750,NULL,3,NULL);
INSERT INTO `battery` VALUES (10,1,4100,1,2,'Fast wireless charging 15W, Power bank/Reverse wireless charging 9W');
INSERT INTO `battery` VALUES (11,1,3400,1,2,'Fast wireless charging 15W, Power bank/Reverse wireless charging 9W');
INSERT INTO `battery` VALUES (12,1,3100,1,2,'Fast wireless charging 15W, Power bank/Reverse wireless charging 9W');
INSERT INTO `battery` VALUES (13,1,4000,7,2,'Qi/PMA wireless charging');
INSERT INTO `battery` VALUES (14,1,3300,7,2,'Qi/PMA wireless charging');
INSERT INTO `battery` VALUES (15,1,3500,7,2,'Qi/PMA wireless charging');
INSERT INTO `battery` VALUES (16,1,3000,7,2,'Qi/PMA wireless charging');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera`
--

INSERT INTO `camera` VALUES (1,1,'OIS, PDAF, 2x optical zoom, Quad-LED dual-tone flash, HDR (photo/panorama), TOF 3D camera','2160p@24/30/60fps, 1080p@30/60/120/240fps, HDR, stereo sound rec');
INSERT INTO `camera` VALUES (2,2,'OIS, PDAF, 2x optical zoom, Quad-LED dual-tone flash, HDR (photo/panorama), TOF 3D camera','2160p@24/30/60fps, 1080p@30/60/120/240fps, HDR, stereo sound rec');
INSERT INTO `camera` VALUES (3,3,'OIS, PDAF, Quad-LED dual-tone flash, HDR (photo/panorama)','2160p@24/30/60fps, 1080p@30/60/120/240fps, HDR, stereo sound rec');
INSERT INTO `camera` VALUES (4,4,'OIS, PDAF, 2x optical zoom, Quad-LED dual-tone flash, HDR (photo/panorama), panorama, HDR, TOF 3D camera','2160p@24/30/60fps, 1080p@30/60/120/240fps');
INSERT INTO `camera` VALUES (5,5,'OIS, PDAF, 2x optical zoom, Quad-LED dual-tone flash, HDR, Face detection','2160p@24/30/60fps, 1080p@30/60/120/240fps');
INSERT INTO `camera` VALUES (6,6,'OIS, PDAF, Quad-LED dual-tone flash, HDR, Face detection, Panorama','2160p@24/30/60fps, 1080p@30/60/120/240fps');
INSERT INTO `camera` VALUES (7,7,'OIS, PDAF, 2x optical zoom, AF, Quad-LED dual-tone flash, HDR, Face detection','2160p@30fps, 1080p@30/60/120fps, 720p@240fps');
INSERT INTO `camera` VALUES (8,8,'OIS, PDAF, Quad-LED dual-tone flash, HDR, Face detection, Panorama','2160p@30fps, 1080p@30/60/120fps, 720p@240fps');
INSERT INTO `camera` VALUES (9,9,'OIS, PDAF, Dual-LED dual-tone flash, HDR, Face detection, Panorama','2160p@30fps, 1080p@60fps, 1080p@120fps, 720p@240fps');
INSERT INTO `camera` VALUES (10,10,'Dual Pixel PDAF, OIS, AF, OIS, 2x Optical Zoom, LED flash, Auto-HDR, Panorama, Depth Sensor, Dual Video Call','2160p@60fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec');
INSERT INTO `camera` VALUES (11,11,'Dual Pixel PDAF, OIS, AF, OIS, 2x Optical Zoom, LED flash, Auto-HDR, Panorama, Depth Sensor, Dual Video Call','2160p@60fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec');
INSERT INTO `camera` VALUES (12,12,'Dual Pixel PDAF, OIS, LED flash, Auto-HDR, Panorama, Dual video call','2160p@60fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec');
INSERT INTO `camera` VALUES (13,13,'AF, Dual Pixel PDAF, OIS, 2x optical zoom ,LED flash, Auto-HDR, Panorama, Dual video call','2160p@60fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec');
INSERT INTO `camera` VALUES (14,14,'AF, Dual Pixel PDAF, OIS, 2x optical zoom ,LED flash, Auto-HDR, Panorama, Dual video call','2160p@30fps, 1440p@30fps, 1080p@60fps, 720p@240fps, HDR, dual-video rec');
INSERT INTO `camera` VALUES (15,15,'AF, Dual Pixel PDAF, OIS, 2x optical zoom , LED flash, Auto-HDR, Panorama, Dual video call','2160p@60fps, 1440p@30fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec');
INSERT INTO `camera` VALUES (16,16,'AF, Dual Pixel PDAF, OIS, LED flash, Auto-HDR, Panorama, Dual video call','2160p@60fps, 1440p@30fps, 1080p@240fps, 720p@960fps, HDR, dual-video rec');

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
  `headphone_jack_type_id` int(11) DEFAULT NULL,
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `headphonejacktype_headphone_jack_type_id_idx` (`headphone_jack_type_id`),
  CONSTRAINT `connection_smartphone_model_id` FOREIGN KEY (`smartphone_model_id`) REFERENCES `smartphone_model` (`smartphone_model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `headphonejacktype_headphone_jack_type_id` FOREIGN KEY (`headphone_jack_type_id`) REFERENCES `headphone_jack_type` (`headphone_jack_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connection`
--

INSERT INTO `connection` VALUES (1,'4G','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','5.0, A2DP, LE',2);
INSERT INTO `connection` VALUES (2,'4G','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','5.0, A2DP, LE',2);
INSERT INTO `connection` VALUES (3,'4G','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','5.0, A2DP, LE',2);
INSERT INTO `connection` VALUES (4,'3G, 4G LTE Cat 16','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','5.0, A2DP, LE',2);
INSERT INTO `connection` VALUES (5,'3G, 4G LTE Cat 16','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','5.0, A2DP, LE',2);
INSERT INTO `connection` VALUES (6,'3G, 4G LTE Cat 16','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','5.0, A2DP, LE',NULL);
INSERT INTO `connection` VALUES (7,'3G, 4G LTE Cat 9','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','4.2, A2DP, LE',2);
INSERT INTO `connection` VALUES (8,'3G, 4G LTE Cat 9','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','4.2, A2DP, LE',2);
INSERT INTO `connection` VALUES (9,'3G, 4G LTE Cat 6','Wi-Fi 802.11 a/b/g/n/ac, dual-band, hotspot','4.2, A2DP, LE',1);
INSERT INTO `connection` VALUES (10,'4G','Wi-Fi 802.11 a/b/g/n/ac/ax, dual-band, Wi-Fi Direct, hotspot','5.0, A2DP, LE, aptX',1);
INSERT INTO `connection` VALUES (11,'4G','Wi-Fi 802.11 a/b/g/n/ac/ax, dual-band, Wi-Fi Direct, hotspot','5.0, A2DP, LE, aptX',1);
INSERT INTO `connection` VALUES (12,'4G','Wi-Fi 802.11 a/b/g/n/ac/ax, dual-band, Wi-Fi Direct, hotspot','5.0, A2DP, LE, aptX',1);
INSERT INTO `connection` VALUES (13,'4G','Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot','5.0, A2DP, LE, aptX',1);
INSERT INTO `connection` VALUES (14,'3G, 4G LTE Cat 16','Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot','5.0, A2DP, LE, aptX',1);
INSERT INTO `connection` VALUES (15,'3G, 4G LTE Cat 18','Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot','5.0, A2DP, LE, aptX',1);
INSERT INTO `connection` VALUES (16,'3G, 4G LTE Cat 18','Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot','5.0, A2DP, LE, aptX',1);

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
-- Temporary view structure for view `cpu_specification_full`
--

DROP TABLE IF EXISTS `cpu_specification_full`;
/*!50001 DROP VIEW IF EXISTS `cpu_specification_full`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `cpu_specification_full` AS SELECT 
 1 AS `cpu_id`,
 1 AS `CPU Name`,
 1 AS `Core Frequency`,
 1 AS `GPU`,
 1 AS `Performance Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cpu_specification_simple`
--

DROP TABLE IF EXISTS `cpu_specification_simple`;
/*!50001 DROP VIEW IF EXISTS `cpu_specification_simple`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `cpu_specification_simple` AS SELECT 
 1 AS `cpu_id`,
 1 AS `CPU Name`*/;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `design` VALUES (2,3,3,7,143.6,70.9,7.7,177,'IP68 dust/water resistant (up to 2 meters for 30 mins)');
INSERT INTO `design` VALUES (3,3,2,7,150.9,75.7,8.3,194,'IP67 dust/water resistant (up to 1 meter for 30 mins)');
INSERT INTO `design` VALUES (4,3,3,7,143.6,70.9,7.7,177,'IP67 dust/water resistant (up to 1 meter for 30 mins)');
INSERT INTO `design` VALUES (5,3,2,7,143.6,70.9,7.7,177,'IP67 dust/water resistant (up to 1 meter for 30 mins)');
INSERT INTO `design` VALUES (6,3,2,7,138.4,67.3,7.3,158,'IP67 dust/water resistant (up to 1 meter for 30 mins)');
INSERT INTO `design` VALUES (7,2,2,7,158.2,77.9,7.3,188,'IP67 dust/water resistant (up to 1 meter for 30 mins)');
INSERT INTO `design` VALUES (8,2,2,7,138.3,67.1,7.1,138,'IP67 dust/water resistant (up to 1 meter for 30 mins)');
INSERT INTO `design` VALUES (9,2,2,7,158.2,77.9,7.3,192,NULL);
INSERT INTO `design` VALUES (10,3,2,5,157.6,74.1,7.8,175,'IP68 dust/water proof (up to 1.5 meters for 30 mins)');
INSERT INTO `design` VALUES (11,3,2,5,149.9,70.4,7.8,157,'IP68 dust/water proof (up to 1.5 meters for 30 mins)');
INSERT INTO `design` VALUES (12,3,2,5,149.9,70.4,7.8,157,'IP68 dust/water proof (up to 1.5 meters for 30 mins)');
INSERT INTO `design` VALUES (13,3,2,4,161.9,76.4,8.8,201,'IP68 dust/water proof (up to 1.5 meters for 30 mins)');
INSERT INTO `design` VALUES (14,3,2,4,162.5,74.8,8.6,195,'IP68 dust/water proof (up to 1.5 meters for 30 mins)');
INSERT INTO `design` VALUES (15,3,2,4,158.1,73.8,8.5,189,'IP68 dust/water proof (up to 1.5 meters for 30 mins)');
INSERT INTO `design` VALUES (16,3,2,4,147.7,68.7,8.5,163,'IP68 dust/water proof (up to 1.5 meters for 30 mins)');

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

INSERT INTO `display` VALUES (1,4,6.5,'1242 x 2688','19.5:9',458,'Dolby Vision | HDR10 | Wide color gamut | 3D Touch | True-tone | 120 Hz touch-sensing');
INSERT INTO `display` VALUES (2,4,5.8,'1125 x 2436','19.5:9',458,'Dolby Vision | HDR10 | Wide color gamut | 3D Touch | True-tone | 120 Hz touch-sensing');
INSERT INTO `display` VALUES (3,1,6.1,'828 x 1792','19.5:9',326,'True-tone | Wide color gamut | 120 Hz touch-sensing');
INSERT INTO `display` VALUES (4,4,5.8,'1125 x 2436','19.5:9',458,'Dolby Vision | HDR10 | Wide color gamut | 3D Touch | True-tone | 120 Hz touch-sensing');
INSERT INTO `display` VALUES (5,8,5.5,'1080 x 1920','16:9',401,'Wide color gamut | 3D Touch display & home button | True-tone');
INSERT INTO `display` VALUES (6,8,4.7,'750 x 1334','16:9',326,'Wide color gamut | 3D Touch display & home button | True-tone');
INSERT INTO `display` VALUES (7,8,5.5,'1920 x 1080','16:9',401,'Wide color gamut | 3D Touch display & home button');
INSERT INTO `display` VALUES (8,8,4.7,'750 x 1334','16:9',326,'Wide color gamut | 3D Touch display & home button');
INSERT INTO `display` VALUES (9,8,5.5,'1920 x 1080','16:9',401,'3D Touch display');
INSERT INTO `display` VALUES (10,7,6.4,'3040 x 1440','19:9',522,'HDR10+, Always-on display');
INSERT INTO `display` VALUES (11,7,6.1,'3040 x 1440','19:9',550,'HDR10+, Always-on display');
INSERT INTO `display` VALUES (12,7,5.8,'2280 x 1080','19:9',438,'HDR10+, Always-on display');
INSERT INTO `display` VALUES (13,6,6.4,'2960 x 1440','18.5:9',516,'HDR 10, Always-on display');
INSERT INTO `display` VALUES (14,6,6.3,'2960 x 1440','18.5:9',521,'HDR 10, 3D Touch (home button only), Always-on display');
INSERT INTO `display` VALUES (15,6,6.2,'2960 x 1440','18.5:9',529,'HDR 10, 3D Touch (home button only), Always-on display');
INSERT INTO `display` VALUES (16,6,5.8,'2960 x 1440','18.5:9',570,'HDR 10, 3D Touch (home button only), Always-on display');

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
  `focal_length` int(10) DEFAULT NULL,
  PRIMARY KEY (`front_cam_id`),
  UNIQUE KEY `front_cam_id_UNIQUE` (`front_cam_id`),
  KEY `frontcam_camera_id_idx` (`camera_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `frontcam_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `camera` (`camera_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `front_camera`
--

INSERT INTO `front_camera` VALUES (1,1,7,2.2,32);
INSERT INTO `front_camera` VALUES (2,2,7,2.2,32);
INSERT INTO `front_camera` VALUES (3,3,7,2.2,32);
INSERT INTO `front_camera` VALUES (4,4,7,2.2,32);
INSERT INTO `front_camera` VALUES (5,5,7,2.2,32);
INSERT INTO `front_camera` VALUES (6,6,7,2.2,NULL);
INSERT INTO `front_camera` VALUES (7,7,7,2.2,32);
INSERT INTO `front_camera` VALUES (8,8,7,2.2,32);
INSERT INTO `front_camera` VALUES (9,9,5,2.2,31);
INSERT INTO `front_camera` VALUES (10,10,10,2.2,22);
INSERT INTO `front_camera` VALUES (11,10,8,1.9,26);
INSERT INTO `front_camera` VALUES (12,11,10,1.9,26);
INSERT INTO `front_camera` VALUES (13,12,10,1.9,26);
INSERT INTO `front_camera` VALUES (14,13,8,1.7,25);
INSERT INTO `front_camera` VALUES (15,14,8,1.7,25);
INSERT INTO `front_camera` VALUES (16,15,8,1.7,25);
INSERT INTO `front_camera` VALUES (17,16,8,1.7,25);

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
INSERT INTO `memory_card` VALUES (2,NULL,2,NULL);
INSERT INTO `memory_card` VALUES (3,NULL,2,NULL);
INSERT INTO `memory_card` VALUES (4,NULL,2,NULL);
INSERT INTO `memory_card` VALUES (5,NULL,2,NULL);
INSERT INTO `memory_card` VALUES (6,NULL,2,NULL);
INSERT INTO `memory_card` VALUES (7,NULL,2,NULL);
INSERT INTO `memory_card` VALUES (8,NULL,2,NULL);
INSERT INTO `memory_card` VALUES (9,NULL,2,NULL);
INSERT INTO `memory_card` VALUES (10,1,3,512);
INSERT INTO `memory_card` VALUES (11,1,3,512);
INSERT INTO `memory_card` VALUES (12,1,3,1024);
INSERT INTO `memory_card` VALUES (13,1,3,1024);
INSERT INTO `memory_card` VALUES (14,1,3,256);
INSERT INTO `memory_card` VALUES (15,1,3,400);
INSERT INTO `memory_card` VALUES (16,1,3,400);

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
  `os_stock_type_id` int(11) NOT NULL,
  `os_mod_type_id` int(11) NOT NULL,
  PRIMARY KEY (`os_id`),
  UNIQUE KEY `os_id_UNIQUE` (`os_id`),
  KEY `operatingsystem.os_stock_type_id_idx` (`os_stock_type_id`),
  KEY `operatingsystem_os_mod_type_idx` (`os_mod_type_id`),
  CONSTRAINT `operatingsystem_os_mod_type_id` FOREIGN KEY (`os_mod_type_id`) REFERENCES `os_modifier_type` (`os_mod_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `operatingsystem_os_stock_type` FOREIGN KEY (`os_stock_type_id`) REFERENCES `os_stock_type` (`os_stock_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
INSERT INTO `operating_system` VALUES (13,5,6);
INSERT INTO `operating_system` VALUES (14,4,6);
INSERT INTO `operating_system` VALUES (15,2,1);
INSERT INTO `operating_system` VALUES (16,3,6);

--
-- Table structure for table `os_modifier_type`
--

DROP TABLE IF EXISTS `os_modifier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `os_modifier_type` (
  `os_mod_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `version` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`os_mod_type_id`),
  UNIQUE KEY `os_mod_version_id_UNIQUE` (`os_mod_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_modifier_type`
--

INSERT INTO `os_modifier_type` VALUES (1,'Default',NULL);
INSERT INTO `os_modifier_type` VALUES (2,'Android One',NULL);
INSERT INTO `os_modifier_type` VALUES (3,'MIUI','9');
INSERT INTO `os_modifier_type` VALUES (4,'MIUI','10');
INSERT INTO `os_modifier_type` VALUES (5,'MIUI','11');
INSERT INTO `os_modifier_type` VALUES (6,'One UI',NULL);
INSERT INTO `os_modifier_type` VALUES (7,'EMUI','8.0');
INSERT INTO `os_modifier_type` VALUES (8,'EMUI','9.0');
INSERT INTO `os_modifier_type` VALUES (9,'EMUI','10.0');
INSERT INTO `os_modifier_type` VALUES (10,'ColorOS','5.0');
INSERT INTO `os_modifier_type` VALUES (11,'ColorOS','5.1');
INSERT INTO `os_modifier_type` VALUES (12,'ColorOS','5.2');
INSERT INTO `os_modifier_type` VALUES (13,'ColorOS','6.0');

--
-- Table structure for table `os_stock_type`
--

DROP TABLE IF EXISTS `os_stock_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `os_stock_type` (
  `os_stock_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `version` varchar(45) NOT NULL,
  PRIMARY KEY (`os_stock_type_id`),
  UNIQUE KEY `os_stock_version_id_UNIQUE` (`os_stock_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os_stock_type`
--

INSERT INTO `os_stock_type` VALUES (1,'Android','7.0 Nougat');
INSERT INTO `os_stock_type` VALUES (2,'Android','7.1 Nougat');
INSERT INTO `os_stock_type` VALUES (3,'Android','8.0 Oreo');
INSERT INTO `os_stock_type` VALUES (4,'Android','8.1 Oreo');
INSERT INTO `os_stock_type` VALUES (5,'Android','9 Pie');
INSERT INTO `os_stock_type` VALUES (6,'Android','Q');
INSERT INTO `os_stock_type` VALUES (7,'iOS','9');
INSERT INTO `os_stock_type` VALUES (8,'iOS','10');
INSERT INTO `os_stock_type` VALUES (9,'iOS','11');
INSERT INTO `os_stock_type` VALUES (10,'iOS','12');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sim`
--

INSERT INTO `sim` VALUES (1,1,3);
INSERT INTO `sim` VALUES (2,1,4);
INSERT INTO `sim` VALUES (3,2,3);
INSERT INTO `sim` VALUES (4,2,4);
INSERT INTO `sim` VALUES (5,3,3);
INSERT INTO `sim` VALUES (6,3,4);
INSERT INTO `sim` VALUES (7,4,3);
INSERT INTO `sim` VALUES (8,5,3);
INSERT INTO `sim` VALUES (9,6,3);
INSERT INTO `sim` VALUES (10,7,3);
INSERT INTO `sim` VALUES (11,8,3);
INSERT INTO `sim` VALUES (12,9,3);
INSERT INTO `sim` VALUES (13,10,3);
INSERT INTO `sim` VALUES (14,11,3);
INSERT INTO `sim` VALUES (15,12,3);
INSERT INTO `sim` VALUES (16,13,3);
INSERT INTO `sim` VALUES (17,14,3);
INSERT INTO `sim` VALUES (18,15,3);
INSERT INTO `sim` VALUES (19,16,3);

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone`
--

INSERT INTO `smartphone` VALUES (1,1,'Gold','636748771945393060_iPhone-Xs-Max-Gold.png');
INSERT INTO `smartphone` VALUES (2,1,'Space Gray','636748771942273320_iPhone-Xs-Max-Space-Gray.png');
INSERT INTO `smartphone` VALUES (3,1,'Silver','636748771945549047_iPhone-Xs-Max-Sliver.png');
INSERT INTO `smartphone` VALUES (4,2,'Gold','636748771945393060_iPhone-Xs-Max-Gold.png');
INSERT INTO `smartphone` VALUES (5,2,'Space Gray','636748771942273320_iPhone-Xs-Max-Space-Gray.png');
INSERT INTO `smartphone` VALUES (6,2,'Silver','636748771945549047_iPhone-Xs-Max-Sliver.png');
INSERT INTO `smartphone` VALUES (7,3,'Gold','636748771945393060_iPhone-Xs-Max-Gold.png');
INSERT INTO `smartphone` VALUES (8,4,'Silver','636748771945549047_iPhone-Xs-White.png');
INSERT INTO `smartphone` VALUES (9,4,'Space Gray','636748771942273320_iPhone-Xs-black.png');
INSERT INTO `smartphone` VALUES (10,4,'Gold','636748771945393060_iPhone-Xs-gold.png');
INSERT INTO `smartphone` VALUES (11,5,'Silver','636748771945549047_iPhone-Xs-White.png');
INSERT INTO `smartphone` VALUES (12,5,'Gold','636748771945393060_iPhone-Xs-gold.png');
INSERT INTO `smartphone` VALUES (13,6,'Black','636748797174925889_iphone-Xr-black.png');
INSERT INTO `smartphone` VALUES (14,6,'Red','636748797175081877_iphone-Xr-red.png');
INSERT INTO `smartphone` VALUES (15,6,'Yellow','636748797174925889_iphone-Xr-yellow.png');
INSERT INTO `smartphone` VALUES (16,6,'Blue','636748797174145949_iphone-Xr-Blue.png');
INSERT INTO `smartphone` VALUES (17,6,'Coral','636748797174925889_iphone-Xr-coral.png');
INSERT INTO `smartphone` VALUES (18,6,'White','636748797174925889_iphone-Xr-white.png');
INSERT INTO `smartphone` VALUES (19,7,'Black','636748797174925889_iphone-Xr-black.png');
INSERT INTO `smartphone` VALUES (20,7,'Red','636748797175081877_iphone-Xr-red.png');
INSERT INTO `smartphone` VALUES (21,7,'Yellow','636748797174925889_iphone-Xr-yellow.png');
INSERT INTO `smartphone` VALUES (22,7,'Blue','636748797174145949_iphone-Xr-Blue.png');
INSERT INTO `smartphone` VALUES (23,7,'Coral','636748797174925889_iphone-Xr-coral.png');
INSERT INTO `smartphone` VALUES (24,7,'White','636748797174925889_iphone-Xr-white.png');
INSERT INTO `smartphone` VALUES (25,8,'Black','636748797174925889_iphone-Xr-black.png');
INSERT INTO `smartphone` VALUES (26,8,'Red','636748797175081877_iphone-Xr-red.png');
INSERT INTO `smartphone` VALUES (27,8,'White','636748797174925889_iphone-Xr-white.png');
INSERT INTO `smartphone` VALUES (28,9,'Space Gray','636483219613202713_iphonex-space-gray.png');
INSERT INTO `smartphone` VALUES (29,9,'Silver','636483223586180190_iphonex-silver.png');
INSERT INTO `smartphone` VALUES (30,10,'Silver','636483223586180190_iphonex-silver.png');
INSERT INTO `smartphone` VALUES (31,11,'Gold','636808956101668511_iphone8-plus-64-gold.png');
INSERT INTO `smartphone` VALUES (32,12,'Gold','636808956101668511_iphone8-plus-64-gold.png');
INSERT INTO `smartphone` VALUES (33,12,'Space Gray','636808956101668511_iphone8-plus-64-space-gray.png');
INSERT INTO `smartphone` VALUES (34,12,'Silver','636808956101668511_iphone8-plus-64-silver.png');
INSERT INTO `smartphone` VALUES (35,12,'Red','636808956101668511_iphone8-plus-64-red.png');
INSERT INTO `smartphone` VALUES (36,13,'Silver','a476795197ac86a83df8c868a74627b9-iphone8-silver.png');
INSERT INTO `smartphone` VALUES (37,13,'Space Gray','5c7c4b15955d4eb35b4fa7bcd554e5f5-iphone8-space-gray.png');
INSERT INTO `smartphone` VALUES (38,13,'Gold','d477bf93d12ec906e33265f3474ff9ff-iphone8-gold.png');
INSERT INTO `smartphone` VALUES (39,13,'Red','baddaa66d6a769deb6a5f6f1878b2ab6-iphone8-red.png');
INSERT INTO `smartphone` VALUES (40,14,'Silver','a476795197ac86a83df8c868a74627b9-iphone8-silver.png');
INSERT INTO `smartphone` VALUES (41,14,'Space Gray','5c7c4b15955d4eb35b4fa7bcd554e5f5-iphone8-space-gray.png');
INSERT INTO `smartphone` VALUES (42,14,'Gold','d477bf93d12ec906e33265f3474ff9ff-iphone8-gold.png');
INSERT INTO `smartphone` VALUES (43,15,'Jet Black','b86bff56087c5aae4a2904033a314ed2-iphone7-plus-jet-black.png');
INSERT INTO `smartphone` VALUES (44,15,'Black','b86bff56087c5aae4a2904033a314ed2-iphone7-plus-black.png');
INSERT INTO `smartphone` VALUES (45,15,'Gold','b86bff56087c5aae4a2904033a314ed2-iphone7-plus-gold.png');
INSERT INTO `smartphone` VALUES (46,16,'Black','892ce08c86b4bbe637710522f9489aae-iphone7-black.png');
INSERT INTO `smartphone` VALUES (47,16,'Gold','04a17edaca2b07a5aee55ef9cca3960e-iphone7-gold.png');
INSERT INTO `smartphone` VALUES (48,17,'Gold','90375518604b6972d727430c3bef8a24-iphone6s-plus-gold.png');
INSERT INTO `smartphone` VALUES (49,17,'Rose Gold','ca3dd1e04421065a3f08605aba97dfae-iphone6s-plus-rose-gold.png');
INSERT INTO `smartphone` VALUES (50,18,'Prism Green','636863659522918468_ss-galaxy-s10-plus-prism-green.png');
INSERT INTO `smartphone` VALUES (51,18,'Ceramic Black','636863636051023338_ss-galaxy-s10-plus-ceramic-black.png');
INSERT INTO `smartphone` VALUES (52,18,'Prism White','636863648672228468_ss-galaxy-s10-plus-prism-white.png');
INSERT INTO `smartphone` VALUES (53,19,'Ceramic Black','636863636051023338_ss-galaxy-s10-plus-ceramic-black.png');
INSERT INTO `smartphone` VALUES (54,20,'Ceramic Black','636863636051023338_ss-galaxy-s10-plus-ceramic-black.png');
INSERT INTO `smartphone` VALUES (55,21,'Prism White','636863643187455627_ss-galaxy-s10-prism-white.png');
INSERT INTO `smartphone` VALUES (56,21,'Prism Green','636863653373578468_ss-galaxy-s10-prism-green.png');
INSERT INTO `smartphone` VALUES (57,21,'Ceramic Black','636863621214675213_ss-galaxy-s10-ceramic-black.png');
INSERT INTO `smartphone` VALUES (58,22,'Prism Black','636863622278818137_ss-galaxy-s10e-prism-black.png');
INSERT INTO `smartphone` VALUES (59,23,'Ocean Blue','3b34232c6e8e60bdde7ab71c8cffee4e-ss-galaxy-note9-ocean-blue.png');
INSERT INTO `smartphone` VALUES (60,23,'Metallic Copper','3b34232c6e8e60bdde7ab71c8cffee4e-ss-galaxy-note9-metallic-copper.png');
INSERT INTO `smartphone` VALUES (61,23,'Midnight Black','3b34232c6e8e60bdde7ab71c8cffee4e-ss-galaxy-note9-midnight-black.png');
INSERT INTO `smartphone` VALUES (62,24,'Ocean Blue','3b34232c6e8e60bdde7ab71c8cffee4e-ss-galaxy-note9-ocean-blue.png');
INSERT INTO `smartphone` VALUES (63,25,'Maple Gold','0dfbfb741726ebf3306a6d2f94ff20f1-ss-galaxy-note8-maple-gold.png');
INSERT INTO `smartphone` VALUES (64,25,'Midnight Black','0dfbfb741726ebf3306a6d2f94ff20f1-ss-galaxy-note8-midnight-black.png');
INSERT INTO `smartphone` VALUES (65,26,'Burgundy Red','636812497715500000_ss-s9-plus-burgundy-red.png');
INSERT INTO `smartphone` VALUES (66,26,'Midnight Black','636812497715500000_ss-s9-plus-midnight-black.png');
INSERT INTO `smartphone` VALUES (67,26,'Coral Blue','636812497715500000_ss-s9-plus-coral-blue.png');
INSERT INTO `smartphone` VALUES (68,26,'Lilac Purple','636812497715500000_ss-s9-plus-lilac-purple.png');
INSERT INTO `smartphone` VALUES (69,27,'Lilac Purple','636812497715500000_ss-s9-plus-lilac-purple.png');
INSERT INTO `smartphone` VALUES (70,27,'Sunrise Gold','636812497715500000_ss-s9-plus-sunrise-gold.png');
INSERT INTO `smartphone` VALUES (71,28,'Midnight Black','0fbefc4b1acd8f5e8a3d0443c267154e-ss-galaxy-s9-midnight-black.png');

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
INSERT INTO `smartphone_brand_series` VALUES (11,2,'Galaxy');

--
-- Temporary view structure for view `smartphone_list`
--

DROP TABLE IF EXISTS `smartphone_list`;
/*!50001 DROP VIEW IF EXISTS `smartphone_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `smartphone_list` AS SELECT 
 1 AS `Image`,
 1 AS `Name`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

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
  `date_released` date DEFAULT NULL,
  PRIMARY KEY (`smartphone_model_id`),
  UNIQUE KEY `smartphone_model_id_UNIQUE` (`smartphone_model_id`),
  KEY `smartphonemodel_brand_series_id_idx` (`brand_series_id`),
  KEY `smartphonemodel_cpu_id_idx` (`cpu_id`),
  KEY `smartphonemodel_os_id_idx` (`os_id`),
  CONSTRAINT `smartphonemodel_brand_series_id` FOREIGN KEY (`brand_series_id`) REFERENCES `smartphone_brand_series` (`brand_series_id`) ON UPDATE CASCADE,
  CONSTRAINT `smartphonemodel_cpu_id` FOREIGN KEY (`cpu_id`) REFERENCES `cpu` (`cpu_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `smartphonemodel_os_id` FOREIGN KEY (`os_id`) REFERENCES `operating_system` (`os_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone_model`
--

INSERT INTO `smartphone_model` VALUES (1,1,'Xs Max',85,12,'2019-05-25');
INSERT INTO `smartphone_model` VALUES (2,1,'Xs',85,12,'2019-05-24');
INSERT INTO `smartphone_model` VALUES (3,1,'Xr',85,12,'2019-05-24');
INSERT INTO `smartphone_model` VALUES (4,1,'X',84,11,'2018-05-24');
INSERT INTO `smartphone_model` VALUES (5,1,'8 Plus',84,11,'2018-02-12');
INSERT INTO `smartphone_model` VALUES (6,1,'8',84,11,'2018-02-12');
INSERT INTO `smartphone_model` VALUES (7,1,'7 Plus',83,10,'2017-07-30');
INSERT INTO `smartphone_model` VALUES (8,1,'7',83,10,'2017-07-29');
INSERT INTO `smartphone_model` VALUES (9,1,'6s Plus',82,9,'2015-03-08');
INSERT INTO `smartphone_model` VALUES (10,11,'S10+',49,13,'2019-05-30');
INSERT INTO `smartphone_model` VALUES (11,11,'S10',49,13,'2019-05-29');
INSERT INTO `smartphone_model` VALUES (12,11,'S10e',49,13,'2019-05-28');
INSERT INTO `smartphone_model` VALUES (13,11,'Note 9',48,14,'2018-11-20');
INSERT INTO `smartphone_model` VALUES (14,11,'Note 8',47,15,'2017-11-20');
INSERT INTO `smartphone_model` VALUES (15,11,'S9+',48,16,'2018-03-10');
INSERT INTO `smartphone_model` VALUES (16,11,'S9',48,16,'2018-03-10');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartphone_modifier`
--

INSERT INTO `smartphone_modifier` VALUES (1,1,'4','64',29990000);
INSERT INTO `smartphone_modifier` VALUES (2,1,'4','256',35990000);
INSERT INTO `smartphone_modifier` VALUES (3,1,'4','512',39990000);
INSERT INTO `smartphone_modifier` VALUES (4,2,'4','64',26990000);
INSERT INTO `smartphone_modifier` VALUES (5,2,'4','256',32990000);
INSERT INTO `smartphone_modifier` VALUES (6,3,'3','64',17990000);
INSERT INTO `smartphone_modifier` VALUES (7,3,'3','128',21990000);
INSERT INTO `smartphone_modifier` VALUES (8,3,'3','256',23990000);
INSERT INTO `smartphone_modifier` VALUES (9,4,'3','64',20990000);
INSERT INTO `smartphone_modifier` VALUES (10,4,'3','256',27990000);
INSERT INTO `smartphone_modifier` VALUES (11,5,'3','64',18990000);
INSERT INTO `smartphone_modifier` VALUES (12,5,'3','256',25790000);
INSERT INTO `smartphone_modifier` VALUES (13,6,'2','64',16990000);
INSERT INTO `smartphone_modifier` VALUES (14,6,'2','256',19990000);
INSERT INTO `smartphone_modifier` VALUES (15,7,'2','32',12990000);
INSERT INTO `smartphone_modifier` VALUES (16,8,'2','32',8990000);
INSERT INTO `smartphone_modifier` VALUES (17,9,'2','32',8780000);
INSERT INTO `smartphone_modifier` VALUES (18,10,'8','128',22990000);
INSERT INTO `smartphone_modifier` VALUES (19,10,'8','512',28990000);
INSERT INTO `smartphone_modifier` VALUES (20,10,'8','1024',33990000);
INSERT INTO `smartphone_modifier` VALUES (21,11,'8','128',20990000);
INSERT INTO `smartphone_modifier` VALUES (22,12,'6','128',15990000);
INSERT INTO `smartphone_modifier` VALUES (23,13,'6','128',19990000);
INSERT INTO `smartphone_modifier` VALUES (24,13,'8','512',26990000);
INSERT INTO `smartphone_modifier` VALUES (25,14,'6','64',12990000);
INSERT INTO `smartphone_modifier` VALUES (26,15,'6','64',17990000);
INSERT INTO `smartphone_modifier` VALUES (27,15,'6','128',18990000);
INSERT INTO `smartphone_modifier` VALUES (28,16,'4','64',16490000);

--
-- Temporary view structure for view `smartphone_specification_full`
--

DROP TABLE IF EXISTS `smartphone_specification_full`;
/*!50001 DROP VIEW IF EXISTS `smartphone_specification_full`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `smartphone_specification_full` AS SELECT 
 1 AS `Name`,
 1 AS `Display Type`,
 1 AS `Display Size`,
 1 AS `Ratio`,
 1 AS `Resolution`,
 1 AS `Pixel Density`,
 1 AS `Display Feature`,
 1 AS `Front Camera`,
 1 AS `Back Camera`,
 1 AS `Camera Feature`,
 1 AS `Video`,
 1 AS `Operating System`,
 1 AS `CPU`,
 1 AS `Core Frequency`,
 1 AS `GPU`,
 1 AS `Memory Card`,
 1 AS `SIM`,
 1 AS `Mobile Network`,
 1 AS `WLAN`,
 1 AS `Bluetooth`,
 1 AS `Headphone Jack`,
 1 AS `Unlock Security`,
 1 AS `Protection`,
 1 AS `Size`,
 1 AS `Weight`,
 1 AS `Feature Description`,
 1 AS `Battery Capacity`,
 1 AS `Battery Type`,
 1 AS `Quick Charge`,
 1 AS `Charging Port`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `smartphone_specification_simple`
--

DROP TABLE IF EXISTS `smartphone_specification_simple`;
/*!50001 DROP VIEW IF EXISTS `smartphone_specification_simple`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `smartphone_specification_simple` AS SELECT 
 1 AS `Name`,
 1 AS `Display`,
 1 AS `Front Camera`,
 1 AS `Back Camera`,
 1 AS `Operating System`,
 1 AS `CPU`,
 1 AS `Memory Card`,
 1 AS `SIM`,
 1 AS `Battery`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unlock_security`
--

INSERT INTO `unlock_security` VALUES (1,1,7);
INSERT INTO `unlock_security` VALUES (2,2,7);
INSERT INTO `unlock_security` VALUES (3,3,7);
INSERT INTO `unlock_security` VALUES (4,4,7);
INSERT INTO `unlock_security` VALUES (5,5,3);
INSERT INTO `unlock_security` VALUES (6,6,3);
INSERT INTO `unlock_security` VALUES (7,7,3);
INSERT INTO `unlock_security` VALUES (8,8,3);
INSERT INTO `unlock_security` VALUES (9,9,3);
INSERT INTO `unlock_security` VALUES (10,10,5);
INSERT INTO `unlock_security` VALUES (11,10,8);
INSERT INTO `unlock_security` VALUES (12,11,5);
INSERT INTO `unlock_security` VALUES (13,11,8);
INSERT INTO `unlock_security` VALUES (14,12,2);
INSERT INTO `unlock_security` VALUES (15,13,1);
INSERT INTO `unlock_security` VALUES (16,13,6);
INSERT INTO `unlock_security` VALUES (17,13,8);
INSERT INTO `unlock_security` VALUES (18,14,1);
INSERT INTO `unlock_security` VALUES (19,14,6);
INSERT INTO `unlock_security` VALUES (20,14,8);
INSERT INTO `unlock_security` VALUES (21,15,1);
INSERT INTO `unlock_security` VALUES (22,15,6);
INSERT INTO `unlock_security` VALUES (23,15,8);
INSERT INTO `unlock_security` VALUES (24,16,1);
INSERT INTO `unlock_security` VALUES (25,16,6);
INSERT INTO `unlock_security` VALUES (26,16,8);

--
-- Final view structure for view `cpu_specification_full`
--

/*!50001 DROP VIEW IF EXISTS `cpu_specification_full`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cpu_specification_full` AS select `cpu`.`cpu_id` AS `cpu_id`,concat(`cpu_brand`.`name`,' ',`cpu`.`name`) AS `CPU Name`,`cpu`.`frequency` AS `Core Frequency`,`integrated_gpu`.`name` AS `GPU`,`cpu`.`performance_rating` AS `Performance Rating` from ((`cpu` left join `cpu_brand` on((`cpu`.`cpu_brand_id` = `cpu_brand`.`cpu_brand_id`))) left join `integrated_gpu` on((`cpu`.`igpu_id` = `integrated_gpu`.`igpu_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cpu_specification_simple`
--

/*!50001 DROP VIEW IF EXISTS `cpu_specification_simple`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cpu_specification_simple` AS select `cpu`.`cpu_id` AS `cpu_id`,concat(`cpu_brand`.`name`,' ',`cpu`.`name`) AS `CPU Name` from (`cpu` left join `cpu_brand` on((`cpu`.`cpu_brand_id` = `cpu_brand`.`cpu_brand_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `smartphone_list`
--

/*!50001 DROP VIEW IF EXISTS `smartphone_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `smartphone_list` AS select `smartphone`.`image` AS `Image`,concat(`smartphone_brand`.`name`,' ',if((`smartphone_brand_series`.`series_name` is not null),`smartphone_brand_series`.`series_name`,''),' ',`smartphone_model`.`name`) AS `Name`,min(`smartphone_modifier`.`price`) AS `Price` from ((((`smartphone_model` left join `smartphone_brand_series` on((`smartphone_model`.`brand_series_id` = `smartphone_brand_series`.`brand_series_id`))) left join `smartphone_brand` on((`smartphone_brand_series`.`smartphone_brand_id` = `smartphone_brand`.`smartphone_brand_id`))) left join `smartphone_modifier` on((`smartphone_model`.`smartphone_model_id` = `smartphone_modifier`.`smartphone_model_id`))) left join `smartphone` on((`smartphone_modifier`.`smartphone_modifier_id` = `smartphone`.`smartphone_modifier_id`))) where (`smartphone_modifier`.`smartphone_modifier_id` = `smartphone`.`smartphone_modifier_id`) group by `smartphone_modifier`.`smartphone_model_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `smartphone_specification_full`
--

/*!50001 DROP VIEW IF EXISTS `smartphone_specification_full`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `smartphone_specification_full` AS select concat(`smartphone_brand`.`name`,' ',if((`smartphone_brand_series`.`series_name` is not null),`smartphone_brand_series`.`series_name`,''),' ',`smartphone_model`.`name`) AS `Name`,`display_type`.`name` AS `Display Type`,concat(`display`.`size`,' inch') AS `Display Size`,`display`.`ratio` AS `Ratio`,`display`.`resolution` AS `Resolution`,concat(`display`.`pixel_density`,' ppi') AS `Pixel Density`,`display`.`feature_description` AS `Display Feature`,concat((select distinct group_concat(`front_camera`.`resolution`,' MP f/',`front_camera`.`aperture`,if((`front_camera`.`focal_length` is not null),concat(' ',`front_camera`.`focal_length`,'mm'),'') separator ' + ') from `front_camera` where (`camera`.`camera_id` = `front_camera`.`camera_id`) group by `front_camera`.`camera_id`),' ') AS `Front Camera`,concat((select distinct group_concat(`back_camera`.`resolution`,' MP f/',`back_camera`.`aperture`,if((`back_camera`.`focal_length` is not null),concat(' ',`back_camera`.`focal_length`,'mm'),'') separator ' + ') from `back_camera` where (`camera`.`camera_id` = `back_camera`.`camera_id`) group by `back_camera`.`camera_id`),' ') AS `Back Camera`,`camera`.`feature_description` AS `Camera Feature`,`camera`.`video_record_description` AS `Video`,concat(`os_stock_type`.`name`,' ',`os_stock_type`.`version`,' (',`os_modifier_type`.`name`,if((`os_modifier_type`.`version` is not null),concat(' ',`os_modifier_type`.`version`),''),')') AS `Operating System`,concat(`cpu_brand`.`name`,' ',`cpu`.`name`) AS `CPU`,`cpu`.`frequency` AS `Core Frequency`,`integrated_gpu`.`name` AS `GPU`,if(exists(select `memory_card`.`smartphone_model_id` from `memory_card`),concat(if((`memory_card`.`mem_card_type_id` is not null),concat(`memory_card_type`.`name`,' ',`memory_card`.`max_capacity`,' GB'),''),if((`memory_card`.`mem_slot_type_id` is not null),`memory_slot_type`.`name`,'')),'No') AS `Memory Card`,group_concat(distinct `sim_type`.`name` separator ', ') AS `SIM`,`connection`.`mobile_network` AS `Mobile Network`,`connection`.`wlan_network` AS `WLAN`,`connection`.`bluetooth` AS `Bluetooth`,if((`headphone_jack_type`.`name` is not null),`headphone_jack_type`.`name`,'No') AS `Headphone Jack`,group_concat(distinct `security_type`.`name` separator ', ') AS `Unlock Security`,concat('Body: ',`body_protection`.`material`,' | ','Frame: ',`frame_protection`.`material`,' | ','Screen: ',`screen_protection`.`material`) AS `Protection`,concat('Width ',`design`.`width`,' mm | ','Height ',`design`.`height`,' mm | ','Thickness ',`design`.`thickness`,' mm') AS `Size`,concat(`design`.`weight`,'g') AS `Weight`,if((`design`.`feature_description` is not null),`design`.`feature_description`,'No') AS `Feature Description`,concat(`battery`.`capacity`,' mAh') AS `Battery Capacity`,`battery_type`.`name` AS `Battery Type`,if((`quick_charge_type`.`name` is not null),`quick_charge_type`.`name`,'No') AS `Quick Charge`,`charging_port`.`name` AS `Charging Port` from ((((((((((((((((((((((((((((`smartphone_model` left join `smartphone_brand_series` on((`smartphone_model`.`brand_series_id` = `smartphone_brand_series`.`brand_series_id`))) left join `smartphone_brand` on((`smartphone_brand_series`.`smartphone_brand_id` = `smartphone_brand`.`smartphone_brand_id`))) left join `display` on((`smartphone_model`.`smartphone_model_id` = `display`.`smartphone_model_id`))) left join `display_type` on((`display`.`display_type_id` = `display_type`.`display_type_id`))) left join `camera` on((`smartphone_model`.`smartphone_model_id` = `camera`.`smartphone_model_id`))) left join `operating_system` on((`smartphone_model`.`os_id` = `operating_system`.`os_id`))) left join `os_stock_type` on((`operating_system`.`os_stock_type_id` = `os_stock_type`.`os_stock_type_id`))) left join `os_modifier_type` on((`operating_system`.`os_mod_type_id` = `os_modifier_type`.`os_mod_type_id`))) left join `cpu` on((`smartphone_model`.`cpu_id` = `cpu`.`cpu_id`))) left join `cpu_brand` on((`cpu`.`cpu_brand_id` = `cpu_brand`.`cpu_brand_id`))) left join `integrated_gpu` on((`cpu`.`igpu_id` = `integrated_gpu`.`igpu_id`))) left join `memory_card` on((`smartphone_model`.`smartphone_model_id` = `memory_card`.`smartphone_model_id`))) left join `memory_card_type` on((`memory_card`.`mem_card_type_id` = `memory_card_type`.`mem_card_type_id`))) left join `memory_slot_type` on((`memory_card`.`mem_slot_type_id` = `memory_slot_type`.`mem_slot_type_id`))) left join `sim` on((`smartphone_model`.`smartphone_model_id` = `sim`.`smartphone_model_id`))) left join `sim_type` on((`sim`.`sim_type_id` = `sim_type`.`sim_type_id`))) left join `connection` on((`smartphone_model`.`smartphone_model_id` = `connection`.`smartphone_model_id`))) left join `headphone_jack_type` on((`connection`.`headphone_jack_type_id` = `headphone_jack_type`.`headphone_jack_type_id`))) left join `unlock_security` on((`smartphone_model`.`smartphone_model_id` = `unlock_security`.`smartphone_model_id`))) left join `security_type` on((`unlock_security`.`security_type_id` = `security_type`.`security_type_id`))) left join `design` on((`smartphone_model`.`smartphone_model_id` = `design`.`smartphone_model_id`))) left join `body_protection` on((`design`.`body_protection_id` = `body_protection`.`body_protection_id`))) left join `frame_protection` on((`design`.`frame_protection_id` = `frame_protection`.`frame_protection_id`))) left join `screen_protection` on((`design`.`screen_protection_id` = `screen_protection`.`screen_protection_id`))) left join `battery` on((`smartphone_model`.`smartphone_model_id` = `battery`.`smartphone_model_id`))) left join `battery_type` on((`battery`.`battery_type_id` = `battery_type`.`battery_type_id`))) left join `quick_charge_type` on((`battery`.`quick_charge_type_id` = `quick_charge_type`.`quick_charge_type_id`))) left join `charging_port` on((`battery`.`charging_port_id` = `charging_port`.`charging_port_id`))) group by `sim`.`smartphone_model_id`,`unlock_security`.`smartphone_model_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `smartphone_specification_simple`
--

/*!50001 DROP VIEW IF EXISTS `smartphone_specification_simple`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `smartphone_specification_simple` AS select concat(`smartphone_brand`.`name`,' ',if((`smartphone_brand_series`.`series_name` is not null),`smartphone_brand_series`.`series_name`,''),' ',`smartphone_model`.`name`) AS `Name`,concat(`display_type`.`name`,', ',`display`.`size`,' inch, ',`display`.`resolution`) AS `Display`,concat((select distinct group_concat(`front_camera`.`resolution`,' MP' separator ' + ') from `front_camera` where (`camera`.`camera_id` = `front_camera`.`camera_id`) group by `front_camera`.`camera_id`),' ') AS `Front Camera`,concat((select distinct group_concat(`back_camera`.`resolution`,' MP' separator ' + ') from `back_camera` where (`camera`.`camera_id` = `back_camera`.`camera_id`) group by `back_camera`.`camera_id`),' ') AS `Back Camera`,concat(`os_stock_type`.`name`,' ',`os_stock_type`.`version`,' (',`os_modifier_type`.`name`,if((`os_modifier_type`.`version` is not null),concat(' ',`os_modifier_type`.`version`),''),')') AS `Operating System`,concat(`cpu_brand`.`name`,' ',`cpu`.`name`) AS `CPU`,if(exists(select `memory_card`.`smartphone_model_id` from `memory_card`),concat(if((`memory_card`.`mem_card_type_id` is not null),concat(`memory_card_type`.`name`,' ',`memory_card`.`max_capacity`,' GB'),''),if((`memory_card`.`mem_slot_type_id` is not null),`memory_slot_type`.`name`,'')),'No') AS `Memory Card`,concat(`connection`.`mobile_network`,' (',group_concat(distinct `sim_type`.`name` separator ', '),')') AS `SIM`,concat(`battery_type`.`name`,' ',`battery`.`capacity`,' mAh',if((`quick_charge_type`.`name` is not null),concat(', ',`quick_charge_type`.`name`),'')) AS `Battery` from ((((((((((((((((((((`smartphone_model` left join `smartphone_brand_series` on((`smartphone_model`.`brand_series_id` = `smartphone_brand_series`.`brand_series_id`))) left join `smartphone_brand` on((`smartphone_brand_series`.`smartphone_brand_id` = `smartphone_brand`.`smartphone_brand_id`))) left join `display` on((`smartphone_model`.`smartphone_model_id` = `display`.`smartphone_model_id`))) left join `display_type` on((`display`.`display_type_id` = `display_type`.`display_type_id`))) left join `camera` on((`smartphone_model`.`smartphone_model_id` = `camera`.`smartphone_model_id`))) left join `operating_system` on((`smartphone_model`.`os_id` = `operating_system`.`os_id`))) left join `os_stock_type` on((`operating_system`.`os_stock_type_id` = `os_stock_type`.`os_stock_type_id`))) left join `os_modifier_type` on((`operating_system`.`os_mod_type_id` = `os_modifier_type`.`os_mod_type_id`))) left join `cpu` on((`smartphone_model`.`cpu_id` = `cpu`.`cpu_id`))) left join `cpu_brand` on((`cpu`.`cpu_brand_id` = `cpu_brand`.`cpu_brand_id`))) left join `memory_card` on((`smartphone_model`.`smartphone_model_id` = `memory_card`.`smartphone_model_id`))) left join `memory_card_type` on((`memory_card`.`mem_card_type_id` = `memory_card_type`.`mem_card_type_id`))) left join `memory_slot_type` on((`memory_card`.`mem_slot_type_id` = `memory_slot_type`.`mem_slot_type_id`))) left join `sim` on((`smartphone_model`.`smartphone_model_id` = `sim`.`smartphone_model_id`))) left join `sim_type` on((`sim`.`sim_type_id` = `sim_type`.`sim_type_id`))) left join `connection` on((`smartphone_model`.`smartphone_model_id` = `connection`.`smartphone_model_id`))) left join `unlock_security` on((`smartphone_model`.`smartphone_model_id` = `unlock_security`.`smartphone_model_id`))) left join `battery` on((`smartphone_model`.`smartphone_model_id` = `battery`.`smartphone_model_id`))) left join `battery_type` on((`battery`.`battery_type_id` = `battery_type`.`battery_type_id`))) left join `quick_charge_type` on((`battery`.`quick_charge_type_id` = `quick_charge_type`.`quick_charge_type_id`))) group by `sim`.`smartphone_model_id`,`unlock_security`.`smartphone_model_id` */;
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
