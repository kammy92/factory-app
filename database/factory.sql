-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 05, 2019 at 08:45 AM
-- Server version: 5.5.57-0ubuntu0.14.04.1
-- PHP Version: 5.6.39-1+ubuntu14.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `factory`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_api_keys`
--

CREATE TABLE IF NOT EXISTS `tbl_api_keys` (
  `ky_id` int(11) NOT NULL AUTO_INCREMENT,
  `ky_auth` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ky_status` tinyint(4) DEFAULT NULL COMMENT '-1=>Deleted, 0=>Inactive, 1=> Active',
  `ky_created_at` datetime DEFAULT NULL,
  `ky_modified_at` datetime DEFAULT NULL,
  `ky_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ky_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_api_keys`
--

INSERT INTO `tbl_api_keys` (`ky_id`, `ky_auth`, `ky_status`, `ky_created_at`, `ky_modified_at`, `ky_deleted_at`) VALUES
(1, 'a5c1db8217d88d2812731b716f99d809feccce67b9b9a06da3', 1, '2017-06-01 11:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_api_logs`
--

CREATE TABLE IF NOT EXISTS `tbl_api_logs` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `tbl_api_logs`
--

INSERT INTO `tbl_api_logs` (`lg_id`, `lg_usr_id`, `lg_rqst_ip`, `lg_rqst_method`, `lg_rqst_url`, `lg_rqst_uri`, `lg_rqst_body`, `lg_rqst_header`, `lg_rqst_raw`, `lg_rsp_http_code`, `lg_rsp_msg_type`, `lg_rsp_msg_code`, `lg_rsp_headers`, `lg_rsp_raw`, `lg_execution_time`, `lg_status`, `lg_created_at`, `lg_modified_at`) VALUES
(1, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 28, 1, '2019-03-21 17:12:34', '2019-03-21 17:12:34'),
(2, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 10, 1, '2019-03-21 17:44:38', '2019-03-21 17:44:38'),
(3, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10', '/api/v1.0/app/customers?offset=10', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 12, 1, '2019-03-21 17:45:03', '2019-03-21 17:45:03'),
(4, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10&limit=10', '/api/v1.0/app/customers?offset=10&limit=10', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 11, 1, '2019-03-21 17:45:17', '2019-03-21 17:45:17'),
(5, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10&limit=10', '/api/v1.0/app/customers?offset=10&limit=10', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 14, 1, '2019-03-21 17:45:32', '2019-03-21 17:45:32'),
(6, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10&limit=20', '/api/v1.0/app/customers?offset=10&limit=20', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 13, 1, '2019-03-21 17:46:28', '2019-03-21 17:46:28'),
(7, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=10&limit=10', '/api/v1.0/app/customers?offset=10&limit=10', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 17, 1, '2019-03-21 17:46:53', '2019-03-21 17:46:53'),
(8, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers?offset=20&limit=10', '/api/v1.0/app/customers?offset=20&limit=10', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 19, 1, '2019-03-21 17:47:01', '2019-03-21 17:47:01'),
(9, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 112, 1, '2019-03-25 11:50:01', '2019-03-25 11:50:01'),
(10, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 81, 1, '2019-03-25 11:56:05', '2019-03-25 11:56:05'),
(11, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 93, 1, '2019-03-25 12:03:20', '2019-03-25 12:03:20'),
(12, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 144, 1, '2019-03-25 12:04:44', '2019-03-25 12:04:44'),
(13, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 130, 1, '2019-03-25 12:04:47', '2019-03-25 12:04:47'),
(14, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 138, 1, '2019-03-25 12:04:49', '2019-03-25 12:04:49'),
(15, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 97, 1, '2019-03-25 12:05:41', '2019-03-25 12:05:41'),
(16, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '403', 'APIKeyNotFound', '1222', NULL, NULL, 10, 1, '2019-03-25 12:07:22', '2019-03-25 12:07:22'),
(17, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '401', 'APIKeyInvalid', '1111', NULL, NULL, 13, 1, '2019-03-25 12:09:07', '2019-03-25 12:09:07'),
(18, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 83, 1, '2019-03-25 12:10:05', '2019-03-25 12:10:05'),
(19, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karmanr","login_password":"123456"}', NULL, NULL, '404', 'UserNotFound', '1111', NULL, NULL, 10, 1, '2019-03-25 12:11:34', '2019-03-25 12:11:34'),
(20, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"1234567"}', NULL, NULL, '404', 'InvalidCredentials', '1111', NULL, NULL, 83, 1, '2019-03-25 12:11:41', '2019-03-25 12:11:41'),
(21, NULL, '117.99.186.2', 'POST', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/login', '/api/v1.0/app/login', '{"login_username":"karman","login_password":"123456"}', NULL, NULL, '200', 'LoginSuccessful', '1234', NULL, NULL, 82, 1, '2019-03-25 12:11:56', '2019-03-25 12:11:56'),
(22, NULL, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '401', 'UserTokenInvalid', '1111', NULL, NULL, 9, 1, '2019-03-25 12:15:36', '2019-03-25 12:15:36'),
(23, 1, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 11, 1, '2019-03-25 12:16:16', '2019-03-25 12:16:16'),
(24, 1, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 12, 1, '2019-03-25 12:20:50', '2019-03-25 12:20:50'),
(25, 1, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 14, 1, '2019-03-25 12:21:36', '2019-03-25 12:21:36'),
(26, 1, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 11, 1, '2019-03-25 12:21:39', '2019-03-25 12:21:39'),
(27, 1, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 11, 1, '2019-03-25 12:21:41', '2019-03-25 12:21:41'),
(28, 1, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 11, 1, '2019-03-25 12:21:43', '2019-03-25 12:21:43'),
(29, 1, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 9, 1, '2019-03-25 12:21:44', '2019-03-25 12:21:44'),
(30, NULL, '117.99.186.2', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '429', 'APILimitCrossed', '1111', NULL, NULL, 7, 1, '2019-03-25 12:21:47', '2019-03-25 12:21:47');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_api_settings`
--

CREATE TABLE IF NOT EXISTS `tbl_api_settings` (
  `stng_id` int(11) NOT NULL AUTO_INCREMENT,
  `stng_log_flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=> False, 1=> True',
  `stng_created_at` datetime DEFAULT NULL,
  `stng_modified_at` datetime DEFAULT NULL,
  `stng_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`stng_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_app_settings`
--

CREATE TABLE IF NOT EXISTS `tbl_app_settings` (
  `stng_id` int(11) NOT NULL AUTO_INCREMENT,
  `stng_value` varchar(255) DEFAULT NULL,
  `stng_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>Inactive, 1=>Active',
  `stng_created_at` datetime DEFAULT NULL,
  `stng_modified_at` datetime DEFAULT NULL,
  `stng_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`stng_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_app_versions`
--

CREATE TABLE IF NOT EXISTS `tbl_app_versions` (
  `vrsn_id` int(11) NOT NULL AUTO_INCREMENT,
  `vrsn_device_type` enum('ANDROID','IOS','WEB','') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `vrsn_app_version` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `vrsn_api_version` varchar(20) DEFAULT NULL,
  `vrsn_updated_on` datetime DEFAULT NULL,
  `vrsn_changelogs` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `vrsn_critical` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=> No, 1=> Yes',
  `vrsn_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1=>Obsolete, 0=> Inactive, 1=> Active',
  `vrsn_created_at` datetime DEFAULT NULL,
  `vrsn_modified_at` datetime DEFAULT NULL,
  `vrsn_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`vrsn_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_app_versions`
--

INSERT INTO `tbl_app_versions` (`vrsn_id`, `vrsn_device_type`, `vrsn_app_version`, `vrsn_api_version`, `vrsn_updated_on`, `vrsn_changelogs`, `vrsn_critical`, `vrsn_status`, `vrsn_created_at`, `vrsn_modified_at`, `vrsn_deleted_at`) VALUES
(1, 'ANDROID', '1', '1.0', '2017-06-01 16:00:00', 'Initial release', 0, 1, NULL, NULL, NULL),
(2, 'IOS', '1.0', '1.0', '2017-06-16 00:00:00', 'Major application update', 0, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customers`
--

CREATE TABLE IF NOT EXISTS `tbl_customers` (
  `cstmr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cstmr_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cstmr_mobile` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `cstmr_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cstmr_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cstmr_status` tinyint(4) DEFAULT '0' COMMENT '-1=>Deleted, 0=>Inactive, 1=>Active',
  `cstmr_created_at` datetime DEFAULT NULL,
  `cstmr_modified_at` datetime DEFAULT NULL,
  `cstmr_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cstmr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `tbl_customers`
--

INSERT INTO `tbl_customers` (`cstmr_id`, `cstmr_name`, `cstmr_mobile`, `cstmr_email`, `cstmr_address`, `cstmr_status`, `cstmr_created_at`, `cstmr_modified_at`, `cstmr_deleted_at`) VALUES
(1, 'AMIT BANARAS', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(2, 'ARSH MIXI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(3, 'ASHWANI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(4, 'BANGALI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(5, 'BHOLA', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(6, 'DECENT ELECTRICAL', NULL, NULL, 'FARIDABAD', 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(7, 'DES RAJ', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(8, 'FITWELL SPARES', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(9, 'GINNI MIXI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(10, 'GOYAL ENTERPRISES', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(11, 'GULSHAN', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(12, 'HARI HAR', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(13, 'HIMAT SINGH', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(14, 'IDEAL', NULL, NULL, 'BANARAS', 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(15, 'JAFAAR', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(16, 'JK', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(17, 'JMG', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(18, 'JUBER', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(19, 'KAUSHAL', NULL, NULL, 'AHMEDABAD', 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(20, 'KEDIA', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(21, 'KHURANA', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(22, 'KISHAN', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(23, 'KRISHNA', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(24, 'MAHARANI INDIA', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(25, 'MANISH', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(26, 'MANISH  NANGLOI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(27, 'MANNU BHAI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(28, 'MANOJ MISHRA', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(29, 'MEHAK MIXI SPARES', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(30, 'MISHRA MIXI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(31, 'MLS', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(32, 'MOHA TRADERS', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(33, 'MUSA SPARES', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(34, 'NAGI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(35, 'NAZIM LOTUS', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(36, 'PASRICHA', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(37, 'RAJA RAM', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(38, 'RAJIV', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(39, 'RIDHI SIDHI JAIPUR', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(40, 'S - INDIA', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(41, 'SAI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(42, 'SARFARAZ', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(43, 'SEHGAL', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(44, 'SELECT', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(45, 'SHAM KANPUR', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(46, 'SHIV SHAKTI ELECTRONICS', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(47, 'SKT', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(48, 'SONI', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(49, 'SR', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(50, 'STAR ELECTRICAL', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(51, 'SUPER AGENCIES', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(52, 'TEJ PAL', NULL, NULL, 'KANPUR', 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(53, 'TESTING', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(54, 'TONI ANIL', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(55, 'VIKRAM', NULL, NULL, NULL, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

CREATE TABLE IF NOT EXISTS `tbl_products` (
  `prdct_id` int(11) NOT NULL AUTO_INCREMENT,
  `prdct_ctgry_id` int(11) DEFAULT NULL,
  `prdct_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prdct_description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prdct_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `prdct_price` decimal(5,2) DEFAULT NULL,
  `prdct_unit` varchar(20) DEFAULT NULL,
  `prdct_stock` int(11) DEFAULT '0',
  `prdct_status` tinyint(4) DEFAULT NULL COMMENT '-1=> Deleted, 0=> Inactive, 1=> Active',
  `prdct_created_at` datetime DEFAULT NULL,
  `prdct_modified_at` datetime DEFAULT NULL,
  `prdct_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`prdct_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85 ;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`prdct_id`, `prdct_ctgry_id`, `prdct_name`, `prdct_description`, `prdct_image`, `prdct_price`, `prdct_unit`, `prdct_stock`, `prdct_status`, `prdct_created_at`, `prdct_modified_at`, `prdct_deleted_at`) VALUES
(1, 6, '170 ORIGINAL TYPE', '', '', '35.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(2, 6, '180 NATIONAL JAPAN (OT)', '', '', '40.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(3, 6, '520 BRASS', '', '', '27.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(4, 6, 'BAJAJ (OT)', '', '', '28.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(5, 6, 'BRASS (CHROME GEAR)', '', '', '32.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(6, 6, 'BRASS (PLASTIC GEAR)', '', '', '27.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(7, 6, 'BRASS EXTRA HEAVY', '', '', '30.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(8, 6, 'BRASS LIGHT', '', '', '22.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(9, 6, 'BRASS REGULAR', '', '', '25.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(10, 7, 'CHROME GEAR (WITHOUT PACKING)', '', '', '9.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(11, 6, 'ELECTROCOM LATEST', '', '', '22.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(12, 6, 'ELECTROCOM NEW', '', '', '25.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(13, 6, 'ELECTROCOM OLD', '', '', '27.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(14, 6, 'GOPI BRASS', '', '', '27.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(15, 6, 'HAVELLS QUBO', '', '', '28.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(16, 6, 'HOTLINE (OT)', '', '', '35.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(17, 6, 'INALSA', '', '', '26.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(18, 6, 'INALSA COMMERCIAL (OT)', '', '', '28.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(19, 6, 'JUICERY', '', '', '18.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(20, 6, 'MAHARAJA BLACK (OT)', '', '', '23.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(21, 6, 'MAHARAJA LATEST (PLASTIC GEAR)', '', '', '27.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(22, 6, 'MAHARAJA MARK 1 (NEW MODEL)', '', '', '25.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(23, 6, 'MAHARAJA NEW (AL.)', '', '', '22.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(24, 6, 'MAHARAJA OLD (AL.)', '', '', '22.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(25, 7, 'MAHARAJA PLASTIC GEAR (WITH PACKING)', '', '', '4.50', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(26, 6, 'MORPHY RICHARDS', '', '', '30.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(27, 6, 'MOULINEX (OT)', '', '', '30.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(28, 6, 'ORPAT (OT)', '', '', '30.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(29, 6, 'PEARL NEW', '', '', '22.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(30, 6, 'PEARL OLD', '', '', '22.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(31, 6, 'PHILIPS (PLASTIC GEAR)', '', '', '27.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(32, 6, 'PHILIPS 1631/1632 (WITH COUPLER CAP)', '', '', '30.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(33, 6, 'PHILIPS LATEST (OT)', '', '', '29.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(34, 6, 'PHILIPS ORIGINAL TYPE (PLASTIC GEAR)', '', '', '30.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(35, 6, 'SINGER', '', '', '27.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(36, 6, 'SUJATA DYNAMIC (CHROME GEAR)', '', '', '50.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(37, 8, 'SUJATA MIXER COVER (ORIGINAL TYPE)', '', '', '18.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(38, 6, 'SUJATA ROUND', '', '', '30.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(39, 6, 'SUJATA ROUND (OT)', '', '', '42.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(40, 6, 'SUJATA ROUND OLD (OT)', '', '', '32.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(41, 7, 'SUJATA TYPE GOLDEN GEAR (WITH PACKING)', '', '', '17.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(42, 7, 'SUJATA TYPE PLASIC GEAR (BLUE PACKING)', '', '', '5.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(43, 7, 'SUJATA TYPE PLASIC GEAR (WITH PACKING)', '', '', '4.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(44, 6, 'USHA NEW', '', '', '23.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(45, 6, 'USHA NEW (CHROME GEAR)', '', '', '40.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(46, 6, 'USHA NEW (OT)', '', '', '28.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(47, 6, 'USHA NEW (PLASTIC GEAR)', '', '', '31.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(48, 6, 'USHA NEW COMMERCIAL (OT)', '', '', '28.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(49, 6, 'USHA OLD', '', '', '27.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(50, 7, 'USHA PLASTIC GEAR (WITH PACKING)', '', '', '7.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(51, 1, '170 NATIONAL', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(52, 1, '180 NATIONAL', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(53, 1, '180 NATIONAL KATORI', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(54, 1, '520 BRASS', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(55, 1, 'BAJAJ', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(56, 1, 'BAJAJ KATORI', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(57, 1, 'BRASS LOTA', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(58, 1, 'BRASS REGULAR', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(59, 1, 'ELECTROCOM LATEST', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(60, 1, 'ELECTROCOM NEW', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(61, 1, 'ELECTROCOM OLD', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(62, 1, 'GOPI BRASS', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(63, 1, 'HAVELLS QUBO', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(64, 1, 'HOTLINE (OT)', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(65, 1, 'INALSA', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(66, 1, 'JUICERY', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(67, 1, 'MAHARAJA BLACK', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(68, 1, 'MAHARAJA LATEST', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(69, 1, 'MAHARAJA MARK 1', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(70, 1, 'MAHARAJA OLD/NEW', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(71, 1, 'MORPHY RICHARDS', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(72, 1, 'MOULINEX', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(73, 1, 'ORPAT (OT)', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(74, 1, 'PEARL NEW', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(75, 1, 'PEARL OLD', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(76, 1, 'PHILIPS', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(77, 1, 'PHILIPS 1631/1632', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(78, 1, 'SINGER', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(79, 1, 'SUJATA LIGHT', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(80, 1, 'SUJATA ORIGINAL', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(81, 1, 'SUJATA / PHILIPS AL BUSH', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(82, 1, 'USHA NEW', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(83, 1, 'USHA COMMERCIAL', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL),
(84, 1, 'USHA OLD', '', '', '1.00', 'pc', 0, 1, '2018-01-06 00:00:00', '2018-01-06 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_categories`
--

CREATE TABLE IF NOT EXISTS `tbl_product_categories` (
  `ctgry_id` int(11) NOT NULL AUTO_INCREMENT,
  `ctgry_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ctgry_type` tinyint(4) DEFAULT '0' COMMENT '0=>Intermediate, 1=>Final',
  `ctgry_status` tinyint(4) DEFAULT NULL COMMENT '-1=>Deleted, 0=>Inactive, 1=>Active',
  `ctgry_created_at` datetime DEFAULT NULL,
  `ctgry_modified_at` datetime DEFAULT NULL,
  `ctgry_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ctgry_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbl_product_categories`
--

INSERT INTO `tbl_product_categories` (`ctgry_id`, `ctgry_name`, `ctgry_type`, `ctgry_status`, `ctgry_created_at`, `ctgry_modified_at`, `ctgry_deleted_at`) VALUES
(1, 'BUSH', 0, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(2, 'PLASTIC BAG', 0, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(3, 'ZINC ITEM', 0, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(4, 'SPRING WIRE', 0, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(5, 'MOULDING', 0, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(6, 'COUPLING', 1, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(7, 'GEAR', 1, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(8, 'COVER', 1, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_transactions`
--

CREATE TABLE IF NOT EXISTS `tbl_stock_transactions` (
  `txn_id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_prdct_id` int(11) DEFAULT NULL,
  `txn_usr_id` int(11) DEFAULT NULL,
  `txn_qty` int(11) DEFAULT NULL,
  `txn_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1=>Inward, 2=>Outward',
  `txn_date` date DEFAULT NULL,
  `txn_created_at` datetime DEFAULT NULL,
  `txn_modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

CREATE TABLE IF NOT EXISTS `tbl_suppliers` (
  `splr_id` int(11) NOT NULL AUTO_INCREMENT,
  `splr_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `splr_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `splr_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1=>Deleted, 0=>Inactive, 1=>Active',
  `splr_created_at` datetime DEFAULT NULL,
  `splr_modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`splr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`splr_id`, `splr_name`, `splr_email`, `splr_status`, `splr_created_at`, `splr_modified_at`) VALUES
(1, 'Nitesh', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(2, 'Narendra Mehta', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(3, 'DR Plastic', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(4, 'Reliance Polymer', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(5, 'DR International', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(6, 'Chaggan Jamnagar', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(7, 'Patel Roshanara', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(8, 'Ramesh Patel', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(9, 'Jain Zinc', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00'),
(10, 'Ashok / Mahesh', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE IF NOT EXISTS `tbl_users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_mobile` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `usr_image` varchar(255) DEFAULT NULL,
  `usr_login_username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_login_password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `usr_type` tinyint(4) DEFAULT '0',
  `usr_status` tinyint(4) DEFAULT '0' COMMENT '-1=>Deleted, 0=>Inactive, 1=> Active',
  `usr_created_at` datetime DEFAULT NULL,
  `usr_modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`usr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`usr_id`, `usr_name`, `usr_email`, `usr_mobile`, `usr_image`, `usr_login_username`, `usr_login_password`, `usr_type`, `usr_status`, `usr_created_at`, `usr_modified_at`) VALUES
(1, 'Karman Singh', 'karman.singhh@gmail.com', '9873684678', NULL, 'karman', '$2y$10$cp3I0wktz3iMq.t2qVxavuciCJx9F4cq7psPSCd4wPclBRgc8XlXe', 1, 1, '2018-12-29 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_logins`
--

CREATE TABLE IF NOT EXISTS `tbl_user_logins` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tbl_user_logins`
--

INSERT INTO `tbl_user_logins` (`lgn_id`, `lgn_usr_id`, `lgn_device_id`, `lgn_device_type`, `lgn_token`, `lgn_token_status`, `lgn_token_valid_from`, `lgn_token_valid_till`, `lgn_firebase`, `lgn_firebase_status`, `lgn_app_version`, `lgn_last_login`, `lgn_created_at`, `lgn_modified_at`, `lgn_deleted_at`) VALUES
(1, 1, '', '', 'afefc9487dc70e2552e778456bb2a43ede97230a650891bc32', 0, '2019-03-25 12:03:20', '2019-04-22 12:03:20', NULL, NULL, NULL, NULL, '2019-03-25 12:03:20', NULL, NULL),
(2, 1, '', '', 'f5b3b11843887e92a668b5bdeb0a224995032d5b3d6f2f083d', 1, '2019-03-25 12:04:44', '2019-04-22 12:04:44', NULL, NULL, NULL, NULL, '2019-03-25 12:04:44', NULL, NULL),
(3, 1, '123123', 'ANDROID', 'f447cd6aed91570983a76795515e9b05234ddac0514c5405ba', 1, '2019-03-25 12:05:41', '2019-04-22 12:05:41', NULL, NULL, NULL, NULL, '2019-03-25 12:05:41', NULL, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
