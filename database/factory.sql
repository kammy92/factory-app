-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2020 at 02:11 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `factory`
--
CREATE DATABASE IF NOT EXISTS `factory` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `factory`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_api_keys`
--

DROP TABLE IF EXISTS `tbl_api_keys`;
CREATE TABLE IF NOT EXISTS `tbl_api_keys` (
  `ky_id` int(11) NOT NULL AUTO_INCREMENT,
  `ky_auth` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ky_status` tinyint(4) DEFAULT NULL COMMENT '0=>Inactive, 1=> Active, -1=>Deleted',
  `ky_created_at` datetime DEFAULT NULL,
  `ky_modified_at` datetime DEFAULT NULL,
  `ky_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ky_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_api_keys`
--

INSERT INTO `tbl_api_keys` (`ky_id`, `ky_auth`, `ky_status`, `ky_created_at`, `ky_modified_at`, `ky_deleted_at`) VALUES
(1, 'a5c1db8217d88d2812731b716f99d809feccce67b9b9a06da3', 1, '2017-06-01 11:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_api_logs`
--

DROP TABLE IF EXISTS `tbl_api_logs`;
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
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_api_logs`
--

INSERT INTO `tbl_api_logs` (`lg_id`, `lg_usr_id`, `lg_rqst_ip`, `lg_rqst_method`, `lg_rqst_url`, `lg_rqst_uri`, `lg_rqst_body`, `lg_rqst_header`, `lg_rqst_raw`, `lg_rsp_http_code`, `lg_rsp_msg_type`, `lg_rsp_msg_code`, `lg_rsp_headers`, `lg_rsp_raw`, `lg_execution_time`, `lg_status`, `lg_created_at`, `lg_modified_at`) VALUES
(1, 1, '103.212.146.124', 'GET', 'https://factory-app-cammy92.c9users.io/api/v1.0/app/customers', '/api/v1.0/app/customers', 'null', NULL, NULL, '200', 'FetchedSuccessful', '1111', NULL, NULL, 28, 1, '2019-03-21 17:12:34', '2019-03-21 17:12:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_app_versions`
--

DROP TABLE IF EXISTS `tbl_app_versions`;
CREATE TABLE IF NOT EXISTS `tbl_app_versions` (
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

DROP TABLE IF EXISTS `tbl_customers`;
CREATE TABLE IF NOT EXISTS `tbl_customers` (
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

DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE IF NOT EXISTS `tbl_products` (
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

DROP TABLE IF EXISTS `tbl_product_categories`;
CREATE TABLE IF NOT EXISTS `tbl_product_categories` (
  `ctgry_id` int(11) NOT NULL AUTO_INCREMENT,
  `ctgry_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ctgry_type` tinyint(4) DEFAULT '0' COMMENT '0=>Intermediate, 1=>Final',
  `ctgry_status` tinyint(4) DEFAULT '0' COMMENT '0=>Inactive, 1=>Active, -1=>Deleted',
  `ctgry_created_at` datetime DEFAULT NULL,
  `ctgry_modified_at` datetime DEFAULT NULL,
  `ctgry_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ctgry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

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
-- Table structure for table `tbl_settings`
--

DROP TABLE IF EXISTS `tbl_settings`;
CREATE TABLE IF NOT EXISTS `tbl_settings` (
  `stng_id` int(11) NOT NULL AUTO_INCREMENT,
  `stng_key` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `stng_value` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `stng_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=>API, 2=>APP, 3=>WEB',
  `stng_api_version` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '0=>All',
  `stng_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>Inactive, 1=>Active, -1=>Deleted',
  `stng_created_at` datetime DEFAULT NULL,
  `stng_modified_at` datetime DEFAULT NULL,
  `stng_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`stng_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stock_transactions`
--

DROP TABLE IF EXISTS `tbl_stock_transactions`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

DROP TABLE IF EXISTS `tbl_suppliers`;
CREATE TABLE IF NOT EXISTS `tbl_suppliers` (
  `splr_id` int(11) NOT NULL AUTO_INCREMENT,
  `splr_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `splr_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `splr_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=>Inactive, 1=>Active, -1=>Deleted',
  `splr_created_at` datetime DEFAULT NULL,
  `splr_modified_at` datetime DEFAULT NULL,
  `splr_deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`splr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`splr_id`, `splr_name`, `splr_email`, `splr_status`, `splr_created_at`, `splr_modified_at`, `splr_deleted_at`) VALUES
(1, 'NITESH', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(2, 'NARENDRA MEHTA', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(3, 'DR PLASTICS LTD', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(4, 'RELIANCE POLYMER', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(5, 'DR INTERNATIONAL', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(6, 'CHAGGAN JAMNAGAR', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(7, 'PATEL ROSHANARA', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(8, 'RAMESH PATEL', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(9, 'JAIN ZINC', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL),
(10, 'ASHOK / MAHESH', NULL, 1, '2019-01-06 00:00:00', '2019-01-06 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE IF NOT EXISTS `tbl_users` (
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

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`usr_id`, `usr_name`, `usr_email`, `usr_mobile`, `usr_image`, `usr_login_username`, `usr_login_password`, `usr_type`, `usr_status`, `usr_created_at`, `usr_modified_at`, `usr_deleted_at`) VALUES
(1, 'Karman Singh', 'karman.singhh@gmail.com', '9873684678', NULL, 'karman', '$2y$10$cp3I0wktz3iMq.t2qVxavuciCJx9F4cq7psPSCd4wPclBRgc8XlXe', 1, 1, '2018-12-29 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_logins`
--

DROP TABLE IF EXISTS `tbl_user_logins`;
CREATE TABLE IF NOT EXISTS `tbl_user_logins` (
  `lgn_id` int(11) NOT NULL AUTO_INCREMENT,
  `lgn_usr_id` int(11) DEFAULT NULL,
  `lgn_device_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lgn_device_type` enum('ANDROID','IOS','WEB','') CHARACTER SET utf8 DEFAULT NULL,
  `lgn_device_details` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `lgn_device_timezone` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `lgn_token` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_logins`
--

INSERT INTO `tbl_user_logins` (`lgn_id`, `lgn_usr_id`, `lgn_device_id`, `lgn_device_type`, `lgn_device_details`, `lgn_device_timezone`, `lgn_token`, `lgn_token_status`, `lgn_token_valid_from`, `lgn_token_valid_till`, `lgn_firebase`, `lgn_firebase_status`, `lgn_app_version`, `lgn_last_login`, `lgn_created_at`, `lgn_modified_at`, `lgn_deleted_at`) VALUES
(14, 1, '123123', 'ANDROID', '{\"device_id\" : \"123123\",\"android_version\":\"9.0\",\"device_model\":\"LLD-20\",\"manufacturer\":\"Honor\"}', '+05:30', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJhdWQiOiJLYXJtYW4gU2luZ2giLCJpc3MiOiJhZG1pbiIsImlhdCI6IjIwMTktMDgtMDkgMDY6Mzk6MjgiLCJleHAiOjE1Njc3NTE5NjgsInpvbmVpbmZvIjoiKzA1OjMwIn0.snY_mdHgrh1GD6thiAkBcpFAJnP2-i5by7Wko7hBz6s', 1, '2019-08-09 06:39:28', '2019-09-06 06:39:28', 'asdasd', 1, '0', '2019-08-09 09:30:37', '2019-08-09 06:39:28', '2019-08-09 09:30:37', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
