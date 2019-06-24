-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: factory
-- ------------------------------------------------------
-- Server version	5.5.58-0+deb8u1

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
-- Table structure for table `tbl_api_keys`
--

DROP TABLE IF EXISTS `tbl_api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_api_keys` (
  `ky_id` int(11) NOT NULL AUTO_INCREMENT,
  `ky_auth` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ky_status` tinyint(4) DEFAULT NULL COMMENT '0=>Inactive, 1=> Active, -1=>Deleted',
  `ky_created_at` datetime DEFAULT NULL,
  `ky_modified_at` datetime DEFAULT NULL,
  `ky_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ky_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_api_keys`
--

LOCK TABLES `tbl_api_keys` WRITE;
/*!40000 ALTER TABLE `tbl_api_keys` DISABLE KEYS */;
INSERT INTO `tbl_api_keys` VALUES (1,'a5c1db8217d88d2812731b716f99d809feccce67b9b9a06da3',1,'2017-06-01 11:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tbl_api_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_api_logs`
--

DROP TABLE IF EXISTS `tbl_api_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_api_logs` (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT,
  `lg_usr_id` int(11) DEFAULT NULL,
  `lg_rqst_ip` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `lg_rqst_method` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `lg_rqst_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lg_rqst_uri` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lg_rqst_body` text CHARACTER SET utf8,
  `lg_rqst_header` text CHARACTER SET utf8,
  `lg_rqst_raw` text CHARACTER SET utf8,
  `lg_rsp_http_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `lg_rsp_msg_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lg_rsp_msg_code` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `lg_rsp_headers` text CHARACTER SET utf8,
  `lg_rsp_raw` text CHARACTER SET utf8,
  `lg_execution_time` bigint(20) NOT NULL DEFAULT '0' COMMENT 'In ms',
  `lg_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>Incomplete, 1=>Completed',
  `lg_created_at` datetime DEFAULT NULL,
  `lg_modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`lg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_api_logs`
--

LOCK TABLES `tbl_api_logs` WRITE;
/*!40000 ALTER TABLE `tbl_api_logs` DISABLE KEYS */;
INSERT INTO `tbl_api_logs` VALUES (1,1,'103.212.146.124','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,28,1,'2019-03-21 17:12:34','2019-03-21 17:12:34'),(2,1,'103.212.146.124','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,10,1,'2019-03-21 17:44:38','2019-03-21 17:44:38'),(3,1,'103.212.146.124','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10','/api/v1.0/app/customers?offset=10','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,12,1,'2019-03-21 17:45:03','2019-03-21 17:45:03'),(4,1,'103.212.146.124','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10&limit=10','/api/v1.0/app/customers?offset=10&limit=10','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,11,1,'2019-03-21 17:45:17','2019-03-21 17:45:17'),(5,1,'103.212.146.124','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10&limit=10','/api/v1.0/app/customers?offset=10&limit=10','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,14,1,'2019-03-21 17:45:32','2019-03-21 17:45:32'),(6,1,'103.212.146.124','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10&limit=20','/api/v1.0/app/customers?offset=10&limit=20','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,13,1,'2019-03-21 17:46:28','2019-03-21 17:46:28'),(7,1,'103.212.146.124','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10&limit=10','/api/v1.0/app/customers?offset=10&limit=10','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,17,1,'2019-03-21 17:46:53','2019-03-21 17:46:53'),(8,1,'103.212.146.124','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=20&limit=10','/api/v1.0/app/customers?offset=20&limit=10','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,19,1,'2019-03-21 17:47:01','2019-03-21 17:47:01'),(9,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,112,1,'2019-03-25 11:50:01','2019-03-25 11:50:01'),(10,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,81,1,'2019-03-25 11:56:05','2019-03-25 11:56:05'),(11,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,93,1,'2019-03-25 12:03:20','2019-03-25 12:03:20'),(12,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,144,1,'2019-03-25 12:04:44','2019-03-25 12:04:44'),(13,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,130,1,'2019-03-25 12:04:47','2019-03-25 12:04:47'),(14,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,138,1,'2019-03-25 12:04:49','2019-03-25 12:04:49'),(15,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,97,1,'2019-03-25 12:05:41','2019-03-25 12:05:41'),(16,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'403','APIKeyNotFound','1222',NULL,NULL,10,1,'2019-03-25 12:07:22','2019-03-25 12:07:22'),(17,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'401','APIKeyInvalid','1111',NULL,NULL,13,1,'2019-03-25 12:09:07','2019-03-25 12:09:07'),(18,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,83,1,'2019-03-25 12:10:05','2019-03-25 12:10:05'),(19,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karmanr\",\"login_password\":\"123456\"}',NULL,NULL,'404','UserNotFound','1111',NULL,NULL,10,1,'2019-03-25 12:11:34','2019-03-25 12:11:34'),(20,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"1234567\"}',NULL,NULL,'404','InvalidCredentials','1111',NULL,NULL,83,1,'2019-03-25 12:11:41','2019-03-25 12:11:41'),(21,NULL,'117.99.186.2','POST','https://factory-app-cammy92.c9users.io/api/v1.0/app/login','/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,82,1,'2019-03-25 12:11:56','2019-03-25 12:11:56'),(22,NULL,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'401','UserTokenInvalid','1111',NULL,NULL,9,1,'2019-03-25 12:15:36','2019-03-25 12:15:36'),(23,1,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,11,1,'2019-03-25 12:16:16','2019-03-25 12:16:16'),(24,1,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,12,1,'2019-03-25 12:20:50','2019-03-25 12:20:50'),(25,1,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,14,1,'2019-03-25 12:21:36','2019-03-25 12:21:36'),(26,1,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,11,1,'2019-03-25 12:21:39','2019-03-25 12:21:39'),(27,1,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,11,1,'2019-03-25 12:21:41','2019-03-25 12:21:41'),(28,1,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,11,1,'2019-03-25 12:21:43','2019-03-25 12:21:43'),(29,1,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,9,1,'2019-03-25 12:21:44','2019-03-25 12:21:44'),(30,NULL,'117.99.186.2','GET','https://factory-app-cammy92.c9users.io/api/v1.0/app/customers','/api/v1.0/app/customers','null',NULL,NULL,'429','APILimitCrossed','1111',NULL,NULL,7,1,'2019-03-25 12:21:47','2019-03-25 12:21:47'),(31,1,'103.61.254.148','GET','http://node14.codenvy.io/factory-app/api/v1.0/app/customers?limit=10&offset=10','/factory-app/api/v1.0/app/customers?limit=10&offset=10','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,4,1,'2019-06-10 10:29:29','2019-06-10 10:29:29'),(32,NULL,'103.61.254.148','GET','http://node14.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,1,'2019-06-10 10:35:15','2019-06-10 10:35:15'),(33,NULL,'103.61.254.148','GET','http://node14.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,'2019-06-10 10:36:21','2019-06-10 10:36:21'),(34,NULL,'103.61.254.148','GET','http://node14.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,3,1,'2019-06-10 10:36:38','2019-06-10 10:36:38'),(35,NULL,'103.61.254.148','GET','http://node14.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,4,1,'2019-06-10 10:39:17','2019-06-10 10:39:17'),(36,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,5,1,'2019-06-10 12:25:41','2019-06-10 12:25:41'),(37,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,5,1,'2019-06-10 12:31:39','2019-06-10 12:31:39'),(38,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,3,1,'2019-06-10 12:31:52','2019-06-10 12:31:52'),(39,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,3,1,'2019-06-10 12:35:29','2019-06-10 12:35:29'),(40,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170524617,0,'2019-06-10 12:42:04',NULL),(41,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170536507,0,'2019-06-10 12:42:16',NULL),(42,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170565422,0,'2019-06-10 12:42:45',NULL),(43,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170578510,0,'2019-06-10 12:42:58',NULL),(44,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170853128,0,'2019-06-10 12:47:33',NULL),(45,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170865925,0,'2019-06-10 12:47:45',NULL),(46,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170887691,0,'2019-06-10 12:48:07',NULL),(47,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170916397,0,'2019-06-10 12:48:36',NULL),(48,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560170965402,0,'2019-06-10 12:49:25',NULL),(49,NULL,'103.61.254.148','GET','http://node16.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,3,1,'2019-06-10 12:49:46','2019-06-10 12:49:46'),(50,1,'103.61.254.148','GET','http://node14.codenvy.io/factory-app/api/v1.0/app/customers?limit=10&offset=10','/factory-app/api/v1.0/app/customers?limit=10&offset=10','null',NULL,NULL,'200','FetchedSuccessful','1111',NULL,NULL,8,1,'2019-06-14 10:24:12','2019-06-14 10:24:12'),(51,NULL,'103.61.254.148','GET','http://node14.codenvy.io/factory-app/api/v1.0/app/customers?limit=10&offset=10','/factory-app/api/v1.0/app/customers?limit=10&offset=10','null',NULL,NULL,'401','UserTokenInvalid','1111',NULL,NULL,4,1,'2019-06-14 10:25:24','2019-06-14 10:25:24'),(52,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,96,1,'2019-06-14 10:26:31','2019-06-14 10:26:31'),(53,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_passwords\":\"123456\"}',NULL,NULL,'422','ValidationError','1111',NULL,NULL,3,1,'2019-06-14 10:27:18','2019-06-14 10:27:18'),(54,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,73,1,'2019-06-14 10:27:50','2019-06-14 10:27:50'),(55,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,73,1,'2019-06-14 10:28:37','2019-06-14 10:28:37'),(56,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,74,1,'2019-06-14 10:28:48','2019-06-14 10:28:48'),(57,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,117,1,'2019-06-14 10:28:50','2019-06-14 10:28:50'),(58,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'401','APIKeyInvalid','1111',NULL,NULL,4,1,'2019-06-14 10:30:14','2019-06-14 10:30:14'),(59,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,107,1,'2019-06-14 10:30:22','2019-06-14 10:30:22'),(60,1,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/init/application','/factory-app/api/v1.0/app/init/application','{\"app_version\":\"0\",\"firebase\":\"asdasd\"}',NULL,NULL,'200','InitializedSuccessful','1111',NULL,NULL,7,1,'2019-06-14 10:38:06','2019-06-14 10:38:06'),(61,NULL,'103.61.254.148','POST','http://node14.codenvy.io/factory-app/api/v1.0/app/init/application','/factory-app/api/v1.0/app/init/application','{\"app_version\":\"0\"}',NULL,NULL,'401','UserTokenInvalid','1111',NULL,NULL,4,1,'2019-06-14 10:42:02','2019-06-14 10:42:02'),(62,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/','/factory-app/api/v1.0/','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,13,1,'2019-06-14 12:32:59','2019-06-14 12:32:59'),(63,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,1025,1,'2019-06-14 12:33:03','2019-06-14 12:33:03'),(64,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,6,1,'2019-06-14 12:33:55','2019-06-14 12:33:55'),(65,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,4,1,'2019-06-14 12:33:56','2019-06-14 12:33:56'),(66,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,6,1,'2019-06-14 12:33:57','2019-06-14 12:33:57'),(67,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,6,1,'2019-06-14 12:33:58','2019-06-14 12:33:58'),(68,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,4,1,'2019-06-14 12:33:59','2019-06-14 12:33:59'),(69,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,5,1,'2019-06-14 12:34:00','2019-06-14 12:34:00'),(70,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,4,1,'2019-06-14 12:34:00','2019-06-14 12:34:00'),(71,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,3,1,'2019-06-14 12:34:01','2019-06-14 12:34:01'),(72,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,5,1,'2019-06-14 12:34:02','2019-06-14 12:34:02'),(73,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,3,1,'2019-06-14 12:34:02','2019-06-14 12:34:02'),(74,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560515735311,0,'2019-06-14 12:35:35',NULL),(75,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,4,1,'2019-06-14 12:42:53','2019-06-14 12:42:53'),(76,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,3,1,'2019-06-14 12:42:56','2019-06-14 12:42:56'),(77,NULL,'103.61.254.148','GET','http://node11.codenvy.io/factory-app/api/v1.0/test','/factory-app/api/v1.0/test','null',NULL,NULL,'200','TestSuccessful','0',NULL,NULL,3,1,'2019-06-14 12:42:58','2019-06-14 12:42:58'),(78,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560517218430,0,'2019-06-14 13:00:18',NULL),(79,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560517304388,0,'2019-06-14 13:01:44',NULL),(80,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,86,1,'2019-06-14 13:02:11','2019-06-14 13:02:11'),(81,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,77,1,'2019-06-14 13:02:13','2019-06-14 13:02:13'),(82,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,73,1,'2019-06-14 13:02:15','2019-06-14 13:02:15'),(83,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,75,1,'2019-06-14 13:03:15','2019-06-14 13:03:15'),(84,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,75,1,'2019-06-14 13:03:24','2019-06-14 13:03:24'),(85,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,'200','LoginSuccessful','1234',NULL,NULL,74,1,'2019-06-14 13:03:31','2019-06-14 13:03:31'),(86,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560517423376,0,'2019-06-14 13:03:43',NULL),(87,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560517432475,0,'2019-06-14 13:03:52',NULL),(88,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560517436901,0,'2019-06-14 13:03:56',NULL),(89,NULL,'103.61.254.148','POST','http://node11.codenvy.io/factory-app/api/v1.0/app/login','/factory-app/api/v1.0/app/login','{\"login_username\":\"karman\",\"login_password\":\"123456\"}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1560517452977,0,'2019-06-14 13:04:12',NULL);
/*!40000 ALTER TABLE `tbl_api_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_app_versions`
--

DROP TABLE IF EXISTS `tbl_app_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_app_versions` (
  `vrsn_id` int(11) NOT NULL AUTO_INCREMENT,
  `vrsn_device_type` enum('ANDROID','IOS','WEB','') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `vrsn_app_version` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `vrsn_api_version` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `vrsn_updated_on` datetime DEFAULT NULL,
  `vrsn_changelogs` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `vrsn_critical` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=> No, 1=> Yes',
  `vrsn_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=> Inactive, 1=> Active, -1=>Obsolete',
  `vrsn_created_at` datetime DEFAULT NULL,
  `vrsn_modified_at` datetime DEFAULT NULL,
  `vrsn_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`vrsn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_app_versions`
--

LOCK TABLES `tbl_app_versions` WRITE;
/*!40000 ALTER TABLE `tbl_app_versions` DISABLE KEYS */;
INSERT INTO `tbl_app_versions` VALUES (1,'ANDROID','1','1.0','2017-06-01 16:00:00','Initial release',0,1,NULL,NULL,NULL),(2,'IOS','1.0','1.0','2017-06-16 00:00:00','Major application update',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_app_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customers`
--

DROP TABLE IF EXISTS `tbl_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_customers` (
  `cstmr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cstmr_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cstmr_mobile` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `cstmr_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cstmr_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cstmr_status` tinyint(4) DEFAULT '0' COMMENT '0=>Inactive, 1=>Active, -1=>Deleted',
  `cstmr_created_at` datetime DEFAULT NULL,
  `cstmr_modified_at` datetime DEFAULT NULL,
  `cstmr_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cstmr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customers`
--

LOCK TABLES `tbl_customers` WRITE;
/*!40000 ALTER TABLE `tbl_customers` DISABLE KEYS */;
INSERT INTO `tbl_customers` VALUES (1,'AMIT BANARAS',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(2,'ARSH MIXI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(3,'ASHWANI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(4,'BANGALI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(5,'BHOLA',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(6,'DECENT ELECTRICAL',NULL,NULL,'FARIDABAD',1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(7,'DES RAJ',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(8,'FITWELL SPARES',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(9,'GINNI MIXI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(10,'GOYAL ENTERPRISES',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(11,'GULSHAN',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(12,'HARI HAR',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(13,'HIMAT SINGH',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(14,'IDEAL',NULL,NULL,'BANARAS',1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(15,'JAFAAR',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(16,'JK',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(17,'JMG',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(18,'JUBER',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(19,'KAUSHAL',NULL,NULL,'AHMEDABAD',1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(20,'KEDIA',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(21,'KHURANA',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(22,'KISHAN',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(23,'KRISHNA',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(24,'MAHARANI INDIA',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(25,'MANISH',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(26,'MANISH  NANGLOI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(27,'MANNU BHAI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(28,'MANOJ MISHRA',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(29,'MEHAK MIXI SPARES',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(30,'MISHRA MIXI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(31,'MLS',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(32,'MOHA TRADERS',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(33,'MUSA SPARES',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(34,'NAGI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(35,'NAZIM LOTUS',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(36,'PASRICHA',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(37,'RAJA RAM',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(38,'RAJIV',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(39,'RIDHI SIDHI JAIPUR',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(40,'S - INDIA',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(41,'SAI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(42,'SARFARAZ',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(43,'SEHGAL',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(44,'SELECT',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(45,'SHAM KANPUR',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(46,'SHIV SHAKTI ELECTRONICS',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(47,'SKT',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(48,'SONI',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(49,'SR',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(50,'STAR ELECTRICAL',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(51,'SUPER AGENCIES',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(52,'TEJ PAL',NULL,NULL,'KANPUR',1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(53,'TESTING',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(54,'TONI ANIL',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(55,'VIKRAM',NULL,NULL,NULL,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL);
/*!40000 ALTER TABLE `tbl_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_categories`
--

DROP TABLE IF EXISTS `tbl_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_product_categories` (
  `ctgry_id` int(11) NOT NULL AUTO_INCREMENT,
  `ctgry_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ctgry_type` tinyint(4) DEFAULT '0' COMMENT '0=>Intermediate, 1=>Final',
  `ctgry_status` tinyint(4) DEFAULT '0' COMMENT '0=>Inactive, 1=>Active, -1=>Deleted',
  `ctgry_created_at` datetime DEFAULT NULL,
  `ctgry_modified_at` datetime DEFAULT NULL,
  `ctgry_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ctgry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_categories`
--

LOCK TABLES `tbl_product_categories` WRITE;
/*!40000 ALTER TABLE `tbl_product_categories` DISABLE KEYS */;
INSERT INTO `tbl_product_categories` VALUES (1,'BUSH',0,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(2,'PLASTIC BAG',0,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(3,'ZINC ITEM',0,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(4,'SPRING WIRE',0,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(5,'MOULDING',0,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(6,'COUPLING',1,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(7,'GEAR',1,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(8,'COVER',1,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL);
/*!40000 ALTER TABLE `tbl_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_products` (
  `prdct_id` int(11) NOT NULL AUTO_INCREMENT,
  `prdct_ctgry_id` int(11) DEFAULT NULL,
  `prdct_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prdct_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prdct_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prdct_price` decimal(5,2) DEFAULT NULL,
  `prdct_unit` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `prdct_stock` int(11) DEFAULT '0',
  `prdct_status` tinyint(4) DEFAULT '0' COMMENT '0=> Inactive, 1=> Active, -1=> Deleted',
  `prdct_created_at` datetime DEFAULT NULL,
  `prdct_modified_at` datetime DEFAULT NULL,
  `prdct_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`prdct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (1,6,'170 ORIGINAL TYPE','','',35.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(2,6,'180 NATIONAL JAPAN (OT)','','',40.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(3,6,'520 BRASS','','',27.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(4,6,'BAJAJ (OT)','','',28.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(5,6,'BRASS (CHROME GEAR)','','',32.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(6,6,'BRASS (PLASTIC GEAR)','','',27.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(7,6,'BRASS EXTRA HEAVY','','',30.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(8,6,'BRASS LIGHT','','',22.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(9,6,'BRASS REGULAR','','',25.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(10,7,'CHROME GEAR (WITHOUT PACKING)','','',9.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(11,6,'ELECTROCOM LATEST','','',22.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(12,6,'ELECTROCOM NEW','','',25.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(13,6,'ELECTROCOM OLD','','',27.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(14,6,'GOPI BRASS','','',27.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(15,6,'HAVELLS QUBO','','',28.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(16,6,'HOTLINE (OT)','','',35.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(17,6,'INALSA','','',26.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(18,6,'INALSA COMMERCIAL (OT)','','',28.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(19,6,'JUICERY','','',18.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(20,6,'MAHARAJA BLACK (OT)','','',23.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(21,6,'MAHARAJA LATEST (PLASTIC GEAR)','','',27.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(22,6,'MAHARAJA MARK 1 (NEW MODEL)','','',25.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(23,6,'MAHARAJA NEW (AL.)','','',22.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(24,6,'MAHARAJA OLD (AL.)','','',22.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(25,7,'MAHARAJA PLASTIC GEAR (WITH PACKING)','','',4.50,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(26,6,'MORPHY RICHARDS','','',30.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(27,6,'MOULINEX (OT)','','',30.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(28,6,'ORPAT (OT)','','',30.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(29,6,'PEARL NEW','','',22.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(30,6,'PEARL OLD','','',22.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(31,6,'PHILIPS (PLASTIC GEAR)','','',27.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(32,6,'PHILIPS 1631/1632 (WITH COUPLER CAP)','','',30.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(33,6,'PHILIPS LATEST (OT)','','',29.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(34,6,'PHILIPS ORIGINAL TYPE (PLASTIC GEAR)','','',30.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(35,6,'SINGER','','',27.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(36,6,'SUJATA DYNAMIC (CHROME GEAR)','','',50.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(37,8,'SUJATA MIXER COVER (ORIGINAL TYPE)','','',18.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(38,6,'SUJATA ROUND','','',30.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(39,6,'SUJATA ROUND (OT)','','',42.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(40,6,'SUJATA ROUND OLD (OT)','','',32.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(41,7,'SUJATA TYPE GOLDEN GEAR (WITH PACKING)','','',17.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(42,7,'SUJATA TYPE PLASIC GEAR (BLUE PACKING)','','',5.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(43,7,'SUJATA TYPE PLASIC GEAR (WITH PACKING)','','',4.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(44,6,'USHA NEW','','',23.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(45,6,'USHA NEW (CHROME GEAR)','','',40.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(46,6,'USHA NEW (OT)','','',28.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(47,6,'USHA NEW (PLASTIC GEAR)','','',31.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(48,6,'USHA NEW COMMERCIAL (OT)','','',28.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(49,6,'USHA OLD','','',27.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(50,7,'USHA PLASTIC GEAR (WITH PACKING)','','',7.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(51,1,'170 NATIONAL','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(52,1,'180 NATIONAL','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(53,1,'180 NATIONAL KATORI','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(54,1,'520 BRASS','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(55,1,'BAJAJ','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(56,1,'BAJAJ KATORI','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(57,1,'BRASS LOTA','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(58,1,'BRASS REGULAR','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(59,1,'ELECTROCOM LATEST','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(60,1,'ELECTROCOM NEW','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(61,1,'ELECTROCOM OLD','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(62,1,'GOPI BRASS','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(63,1,'HAVELLS QUBO','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(64,1,'HOTLINE (OT)','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(65,1,'INALSA','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(66,1,'JUICERY','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(67,1,'MAHARAJA BLACK','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(68,1,'MAHARAJA LATEST','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(69,1,'MAHARAJA MARK 1','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(70,1,'MAHARAJA OLD/NEW','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(71,1,'MORPHY RICHARDS','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(72,1,'MOULINEX','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(73,1,'ORPAT (OT)','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(74,1,'PEARL NEW','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(75,1,'PEARL OLD','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(76,1,'PHILIPS','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(77,1,'PHILIPS 1631/1632','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(78,1,'SINGER','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(79,1,'SUJATA LIGHT','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(80,1,'SUJATA ORIGINAL','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(81,1,'SUJATA / PHILIPS AL BUSH','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(82,1,'USHA NEW','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(83,1,'USHA COMMERCIAL','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL),(84,1,'USHA OLD','','',1.00,'pc',0,1,'2018-01-06 00:00:00','2018-01-06 00:00:00',NULL);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_settings`
--

DROP TABLE IF EXISTS `tbl_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_settings` (
  `stng_id` int(11) NOT NULL AUTO_INCREMENT,
  `stng_key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `stng_value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `stng_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>API, 2=>APP, 3=>WEB',
  `stng_api_version` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `stng_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>Inactive, 1=>Active, -1=>Deleted',
  `stng_created_at` datetime DEFAULT NULL,
  `stng_modified_at` datetime DEFAULT NULL,
  `stng_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`stng_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_settings`
--

LOCK TABLES `tbl_settings` WRITE;
/*!40000 ALTER TABLE `tbl_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_stock_transactions`
--

DROP TABLE IF EXISTS `tbl_stock_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_stock_transactions` (
  `txn_id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_prdct_id` int(11) DEFAULT NULL,
  `txn_usr_id` int(11) DEFAULT NULL,
  `txn_qty` int(11) DEFAULT NULL,
  `txn_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1=>Inward, 2=>Outward',
  `txn_date` date DEFAULT NULL,
  `txn_created_at` datetime DEFAULT NULL,
  `txn_modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_stock_transactions`
--

LOCK TABLES `tbl_stock_transactions` WRITE;
/*!40000 ALTER TABLE `tbl_stock_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_stock_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_suppliers`
--

DROP TABLE IF EXISTS `tbl_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_suppliers` (
  `splr_id` int(11) NOT NULL AUTO_INCREMENT,
  `splr_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `splr_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `splr_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>Inactive, 1=>Active, -1=>Deleted',
  `splr_created_at` datetime DEFAULT NULL,
  `splr_modified_at` datetime DEFAULT NULL,
  `splr_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`splr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_suppliers`
--

LOCK TABLES `tbl_suppliers` WRITE;
/*!40000 ALTER TABLE `tbl_suppliers` DISABLE KEYS */;
INSERT INTO `tbl_suppliers` VALUES (1,'NITESH',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(2,'NARENDRA MEHTA',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(3,'DR PLASTICS LTD',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(4,'RELIANCE POLYMER',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(5,'DR INTERNATIONAL',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(6,'CHAGGAN JAMNAGAR',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(7,'PATEL ROSHANARA',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(8,'RAMESH PATEL',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(9,'JAIN ZINC',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL),(10,'ASHOK / MAHESH',NULL,1,'2019-01-06 00:00:00','2019-01-06 00:00:00',NULL);
/*!40000 ALTER TABLE `tbl_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_logins`
--

DROP TABLE IF EXISTS `tbl_user_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user_logins` (
  `lgn_id` int(11) NOT NULL AUTO_INCREMENT,
  `lgn_usr_id` int(11) DEFAULT NULL,
  `lgn_device_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lgn_device_type` enum('ANDROID','IOS','WEB','') CHARACTER SET utf8 DEFAULT NULL,
  `lgn_token` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lgn_token_status` tinyint(4) DEFAULT NULL COMMENT '-1=>Invalidated, 0=> Expired, 1=> Active',
  `lgn_token_valid_from` datetime DEFAULT NULL,
  `lgn_token_valid_till` datetime DEFAULT NULL,
  `lgn_firebase` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lgn_firebase_status` tinyint(4) DEFAULT NULL,
  `lgn_app_version` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `lgn_last_login` datetime DEFAULT NULL,
  `lgn_created_at` datetime DEFAULT NULL,
  `lgn_modified_at` datetime DEFAULT NULL,
  `lgn_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`lgn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_logins`
--

LOCK TABLES `tbl_user_logins` WRITE;
/*!40000 ALTER TABLE `tbl_user_logins` DISABLE KEYS */;
INSERT INTO `tbl_user_logins` VALUES (4,1,'123123','ANDROID','cdabc7264048743585a66cf04967c02e9e6a6d4140f6ea55e7',0,'2019-06-14 10:26:31','2019-07-12 10:26:31','asdasd',1,'0','2019-06-14 10:38:06','2019-06-14 10:26:31','2019-06-14 10:38:06',NULL),(5,1,'123123','ANDROID','582c4dae8e56f70950e0ff091cb11fe1c810ff8112615a4d51',0,'2019-06-14 13:02:11','2019-07-12 13:02:11',NULL,NULL,NULL,NULL,'2019-06-14 13:02:11',NULL,NULL);
/*!40000 ALTER TABLE `tbl_user_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_mobile` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `usr_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_login_username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_login_password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_type` tinyint(4) DEFAULT '0' COMMENT '1=>Admin',
  `usr_status` tinyint(4) DEFAULT '0' COMMENT '0=>Inactive, 1=> Active, -1=>Deleted',
  `usr_created_at` datetime DEFAULT NULL,
  `usr_modified_at` datetime DEFAULT NULL,
  `usr_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (1,'Karman Singh','karman.singhh@gmail.com','9873684678',NULL,'karman','$2y$10$cp3I0wktz3iMq.t2qVxavuciCJx9F4cq7psPSCd4wPclBRgc8XlXe',1,1,'2018-12-29 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-14 13:19:11
