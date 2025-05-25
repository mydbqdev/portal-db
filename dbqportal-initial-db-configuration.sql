-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: dbqportal
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dbqportal`
--

CREATE DATABASE dbqportal DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;

USE `dbqportal`;

--
-- Table structure for table `employee_master`
--

DROP TABLE IF EXISTS `employee_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_master` (
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_band` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blood_group` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` mediumblob,
  `emp_join_date` date NOT NULL,
  `form_of_address` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_of_birth` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `process_data` int NOT NULL DEFAULT '0',
  `picture` mediumblob,
  `current_address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permanent_address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted_on` datetime DEFAULT CURRENT_TIMESTAMP,
  `rejoin` int DEFAULT '0',
  `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'I-OnBoard' COMMENT 'When through  I-OnBoard screen then value should be I-OnBoard, If through Config Upload screen with existing employee then value should be Config-Upload-Employee otherwise Config-Upload-Ex-Employee',
  `from_application` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_email`),
  UNIQUE KEY `emp_code` (`emp_code`),
  UNIQUE KEY `employee_master_UN` (`personal_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `aadhar_details`
--

DROP TABLE IF EXISTS `aadhar_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aadhar_details` (
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aadhar_no` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_as_per_aadhar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob_as_per_aadhar` date DEFAULT NULL,
  `gender_as_in_aadhar` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_m_h_name_as_in_aadhar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_with_above` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_card` mediumblob,
  `disclaimer` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aadhar_key` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `aadhar_details_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement_notice`
--

DROP TABLE IF EXISTS `announcement_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `announcement_notice_UN` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement_notice_file`
--

DROP TABLE IF EXISTS `announcement_notice_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_notice_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `an_id` int NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `file` int NOT NULL DEFAULT '0',
  `url` varchar(2000) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `announcement_notice_file_FK` (`an_id`),
  CONSTRAINT `announcement_notice_file_FK` FOREIGN KEY (`an_id`) REFERENCES `announcement_notice` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_role`
--

DROP TABLE IF EXISTS `app_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_access`
--

DROP TABLE IF EXISTS `application_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_access` (
  `application_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`application_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org_project_list`
--

DROP TABLE IF EXISTS `org_project_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_project_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `default_emp` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_project_list_UN` (`project_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assign_project_details`
--

DROP TABLE IF EXISTS `assign_project_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign_project_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_billable` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assign_project_details_FK` (`emp_code`),
  KEY `assign_project_details_FK_1` (`project`),
  CONSTRAINT `assign_project_details_FK` FOREIGN KEY (`emp_code`) REFERENCES `employee_master` (`emp_code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `assign_project_details_FK_1` FOREIGN KEY (`project`) REFERENCES `org_project_list` (`project_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audit_action_log`
--

DROP TABLE IF EXISTS `audit_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_action_log` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email_account` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_type` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_details` json NOT NULL,
  PRIMARY KEY (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `band_with_designations`
--

DROP TABLE IF EXISTS `band_with_designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `band_with_designations` (
  `band` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`band`,`designation`),
  UNIQUE KEY `band_with_designations_UN` (`designation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_details`
--

DROP TABLE IF EXISTS `bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_details` (
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_number` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `ifsc` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payee` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ehs_rep_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `bank_details_FK` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `branch_info`
--

DROP TABLE IF EXISTS `branch_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_info` (
  `branch_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_started_on` date DEFAULT NULL,
  `total_employees` int DEFAULT NULL,
  `primary_ph_num` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_ph_num` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notice_period` int DEFAULT NULL,
  `docs` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_ph_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`branch_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_date` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_day` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_festival` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_holiday` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_restricted_holiday` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `c_date_UNIQUE` (`c_date`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `expenditure_claim`
--

DROP TABLE IF EXISTS `expenditure_claim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenditure_claim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expenditure_date` date NOT NULL,
  `exp_amount` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_number` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_doc` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` date NOT NULL,
  `request_type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `claim_request_feedbck`
--

DROP TABLE IF EXISTS `claim_request_feedbck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim_request_feedbck` (
  `id` int NOT NULL AUTO_INCREMENT,
  `s_id` int NOT NULL,
  `comment` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `claim_request_feedbck_FK_idx` (`s_id`),
  CONSTRAINT `claim_request_feedbck_FK` FOREIGN KEY (`s_id`) REFERENCES `expenditure_claim` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `communication`
--

DROP TABLE IF EXISTS `communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sub_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `communication_FK` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comp_off_leave`
--

DROP TABLE IF EXISTS `comp_off_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comp_off_leave` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_mail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comp_off_date` date NOT NULL,
  `approved_on` date NOT NULL,
  `comp_off_used_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comp_off_min_working_hours`
--

DROP TABLE IF EXISTS `comp_off_min_working_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comp_off_min_working_hours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `half_day_hrs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_day_hrs` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_policy`
--

DROP TABLE IF EXISTS `company_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_policy` (
  `policy_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `policy_file` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`policy_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `company_policy_list`
--

DROP TABLE IF EXISTS `company_policy_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_policy_list` (
  `policy_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`policy_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compensation_details`
--

DROP TABLE IF EXISTS `compensation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compensation_details` (
  `basic` decimal(12,2) DEFAULT NULL,
  `d_a` decimal(12,2) DEFAULT NULL,
  `h_r_a` decimal(12,2) DEFAULT NULL,
  `flexible` decimal(12,2) DEFAULT NULL,
  `perfomance_bonus` decimal(12,2) DEFAULT NULL,
  `l_t_a` decimal(12,2) DEFAULT NULL,
  `other_allowances` decimal(12,2) DEFAULT NULL,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `effective_date` date NOT NULL,
  `curr_salary` decimal(12,2) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `default_hike` int DEFAULT '1',
  `monthly_bsc` decimal(12,2) DEFAULT NULL,
  `monthly_house` decimal(12,2) DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_designation_change` int DEFAULT NULL,
  `attachment` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_four_eye` int DEFAULT NULL,
  `band` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_salary` decimal(12,2) DEFAULT NULL,
  `hike_percent` decimal(10,2) DEFAULT NULL,
  `hike_amount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`emp_email`),
  KEY `compensation_details_FK` (`emp_email`),
  CONSTRAINT `compensation_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compensation_upload`
--

DROP TABLE IF EXISTS `compensation_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compensation_upload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comp_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cycle_year` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `rm_code` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concept_process_table`
--

DROP TABLE IF EXISTS `concept_process_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concept_process_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `application_launched` int DEFAULT NULL,
  `email_send` int DEFAULT NULL,
  `scheduler_run` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` int DEFAULT NULL,
  `country_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_ph_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curr_work_loc`
--

DROP TABLE IF EXISTS `curr_work_loc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curr_work_loc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tower` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `curr_loc` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_email` (`emp_email`),
  CONSTRAINT `curr_work_loc_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbqrequiter`
--

DROP TABLE IF EXISTS `dbqrequiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbqrequiter` (
  `sr_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000',
  `primary_skill` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondary_skill` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `st_no_of_positions` int DEFAULT '0',
  `experience` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_years` int DEFAULT '0',
  `to_years` int DEFAULT '0',
  `cu_no_of_positions` int DEFAULT '0',
  `pre_verification` tinyint DEFAULT '0',
  `cu_no_of_rounds` int DEFAULT '0',
  PRIMARY KEY (`sr_no`),
  UNIQUE KEY `sr_no_UNIQUE` (`sr_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `education_details`
--

DROP TABLE IF EXISTS `education_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_details` (
  `begin_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `education_details_FK` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_format_config`
--

DROP TABLE IF EXISTS `email_format_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_format_config` (
  `screen_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_format_config_UN` (`screen_name`,`mail_type`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_send`
--

DROP TABLE IF EXISTS `email_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_send` (
  `is_active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `template_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_address`
--

DROP TABLE IF EXISTS `emp_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `begin_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `emp_address_FK` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_assignment_timesheet_task`
--

DROP TABLE IF EXISTS `emp_assignment_timesheet_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_assignment_timesheet_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_activity_task_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_assignment_timesheet_task_FK_1` (`project_activity_task_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `emp_assignment_timesheet_task_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_comp_off`
--

DROP TABLE IF EXISTS `emp_comp_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_comp_off` (
  `emp_mail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `comp_off_date` date NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `approver_mail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved_on` datetime DEFAULT NULL,
  `comp_off_used_date` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_mail`,`comp_off_date`),
  CONSTRAINT `emp_comp_off_FK` FOREIGN KEY (`emp_mail`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_experience_letter`
--

DROP TABLE IF EXISTS `emp_experience_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_experience_letter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `el_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `sign_path` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_relieved_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_experience_letter_UN` (`emp_email`,`act_relieved_date`),
  KEY `emp_experience_letter_FK` (`emp_email`),
  CONSTRAINT `emp_experience_letter_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_leave_request`
--

DROP TABLE IF EXISTS `emp_leave_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_leave_request` (
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` date DEFAULT NULL,
  `leave_date` date NOT NULL,
  `leave_duration` int DEFAULT NULL,
  `approver` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `comment` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_mails` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_name`,`leave_date`),
  KEY `emp_leave_request_FK` (`user_name`),
  CONSTRAINT `emp_leave_request_FK` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_payslip_process_data`
--

DROP TABLE IF EXISTS `emp_payslip_process_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_payslip_process_data` (
  `emp_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `other_arrear_label` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_deduction_label` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf` varbinary(100) DEFAULT NULL,
  `pt` varbinary(100) DEFAULT NULL,
  `other_arrear_amount` varbinary(100) DEFAULT NULL,
  `other_deduction_amount` varbinary(100) DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT NULL,
  `lop_for_month` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lop_amount` varbinary(100) DEFAULT NULL,
  `lop_rev_for_month` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lop_rev_amount` varbinary(100) DEFAULT NULL,
  `tds_monthly_amount` varbinary(100) DEFAULT NULL,
  `loan_monthly_emi_amount` varbinary(100) DEFAULT NULL,
  `lop_lopr_cal_for_month_year` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_email`),
  CONSTRAINT `emp_payslip_process_data_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_personal_profile_photo`
--

DROP TABLE IF EXISTS `emp_personal_profile_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_personal_profile_photo` (
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo_bucket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` mediumblob,
  `profile_photo_pth` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `emp_personal_profile_photo_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_personaldata`
--

DROP TABLE IF EXISTS `emp_personaldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_personaldata` (
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_of_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marital_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `citizen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marriage_wedding_card` mediumblob,
  `passport_ssc_certificate` mediumblob,
  `ehs_rep` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dual_citizen` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_city` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marriage_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferred_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_bucket` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_ssc_doc_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `emp_personaldata_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_pwd_history`
--

DROP TABLE IF EXISTS `emp_pwd_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_pwd_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pwd` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_pwd_history_FK` (`emp_id`),
  CONSTRAINT `emp_pwd_history_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_relieving_letter`
--

DROP TABLE IF EXISTS `emp_relieving_letter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_relieving_letter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rl_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime DEFAULT NULL,
  `sign_path` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `act_relieved_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_relieving_letter_UN` (`emp_email`,`act_relieved_date`),
  KEY `emp_relieving_letter_FK` (`emp_email`),
  CONSTRAINT `emp_relieving_letter_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_shift_mngt`
--

DROP TABLE IF EXISTS `emp_shift_mngt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_shift_mngt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `shift_date` date NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_shift_mngt_FK` (`emp_id`),
  CONSTRAINT `emp_shift_mngt_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emp_working_days`
--

DROP TABLE IF EXISTS `emp_working_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp_working_days` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_mail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_days` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_working_days_FK` (`emp_mail`),
  CONSTRAINT `emp_working_days_FK` FOREIGN KEY (`emp_mail`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_account`
--

DROP TABLE IF EXISTS `employee_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_account` (
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pf_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vpf_percentage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vpf_amount` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_annuation_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gratuity_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professional_tax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eligibility` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labour_welfare_fund` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `employee_account_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `employee_annexure_details`
--

DROP TABLE IF EXISTS `employee_annexure_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_annexure_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `effective_date` date NOT NULL,
  `release_date` date NOT NULL,
  `current_salary` varbinary(100) NOT NULL,
  `default_hike` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`emp_email`,`effective_date`),
  UNIQUE KEY `unique_id` (`id`),
  KEY `employee_annexure_details_FK` (`emp_email`),
  CONSTRAINT `employee_annexure_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_annexure_type`
--

DROP TABLE IF EXISTS `pre_join_annexure_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_annexure_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_earning_deduction` int DEFAULT '0',
  `sequence_order` int DEFAULT '1',
  `require_payslip` int DEFAULT '1',
  `non_editable_delete` int DEFAULT '1' COMMENT 'if 0 then non editable',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pre_join_annexure_type_UN` (`section_name`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_annexure_configuration`
--

DROP TABLE IF EXISTS `pre_join_annexure_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_annexure_configuration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `components` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_percentage` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_type` int NOT NULL,
  `is_active` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT 'yes',
  `non_editable_delete` int DEFAULT '1' COMMENT 'if 0 then non editable',
  `comp_hidden_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'it will use in tds calculation',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pre_join_annexure_configuration_UN` (`components`),
  KEY `pre_join_annexure_configuration_FK` (`amount_type`),
  CONSTRAINT `pre_join_annexure_configuration_FK` FOREIGN KEY (`amount_type`) REFERENCES `pre_join_annexure_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `employee_annexure_componets_details`
--

DROP TABLE IF EXISTS `employee_annexure_componets_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_annexure_componets_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `annuexure_id` bigint NOT NULL,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_id` int NOT NULL,
  `component_annual_amount` varbinary(100) NOT NULL,
  `component_monthly_amount` varbinary(100) NOT NULL,
  `require_payslip` int DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_annexure_componets_details_UN` (`annuexure_id`,`emp_email`,`component_id`),
  KEY `employee_annexure_componets_details_FK` (`emp_email`),
  KEY `employee_annexure_componets_details_FK_2` (`component_id`),
  CONSTRAINT `employee_annexure_componets_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `employee_annexure_componets_details_FK_1` FOREIGN KEY (`annuexure_id`) REFERENCES `employee_annexure_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_annexure_componets_details_FK_2` FOREIGN KEY (`component_id`) REFERENCES `pre_join_annexure_configuration` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `employee_bgv_details`
--

DROP TABLE IF EXISTS `employee_bgv_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_bgv_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_code` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reporting_manager` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teamate` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_mail` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_address_status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `permanant_address_status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `qualification` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qualification_status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `previous_exp_status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `noc_status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_code` (`emp_code`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_compensation_componets_details`
--

DROP TABLE IF EXISTS `employee_compensation_componets_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_compensation_componets_details` (
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_id` int NOT NULL,
  `require_payslip` int DEFAULT '1',
  `component_annual_amount` varbinary(100) DEFAULT NULL,
  `component_monthly_amount` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`component_id`,`emp_email`),
  UNIQUE KEY `employee_compensation_componets_details_UN` (`emp_email`,`component_id`),
  KEY `employee_compensation_componets_details_FK` (`emp_email`),
  KEY `employee_compensation_componets_details_FK_2` (`component_id`),
  CONSTRAINT `employee_compensation_componets_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `employee_compensation_componets_details_FK_1` FOREIGN KEY (`component_id`) REFERENCES `pre_join_annexure_configuration` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_compensation_details`
--

DROP TABLE IF EXISTS `employee_compensation_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_compensation_details` (
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `effective_date` date NOT NULL,
  `release_date` date NOT NULL,
  `hike_percentage` double(7,2) DEFAULT NULL,
  `hike_amount` double(12,2) DEFAULT NULL,
  `band` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_four_eye` int DEFAULT NULL,
  `current_salary` varbinary(100) DEFAULT NULL,
  `old_salary` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`emp_email`),
  KEY `employee_compensation_details_PK` (`emp_email`),
  CONSTRAINT `employee_compensation_details_PK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_deduction_details`
--

DROP TABLE IF EXISTS `employee_deduction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_deduction_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `financial_year` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_login_details`
--

DROP TABLE IF EXISTS `employee_login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_login_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isinitial_pwd_change` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_pwd_change_date` date DEFAULT NULL,
  `is_lock` int DEFAULT '0',
  `emp_password` varbinary(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_login_details_UN` (`emp_email`),
  CONSTRAINT `employee_login_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `employee_payslip_componets_details`
--

DROP TABLE IF EXISTS `employee_payslip_componets_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_payslip_componets_details` (
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month_year` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_annual_amount` varbinary(100) DEFAULT NULL,
  `component_monthly_amount` varbinary(100) NOT NULL,
  `section_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `component_order` int NOT NULL,
  `from_annexure` int DEFAULT '1',
  PRIMARY KEY (`month_year`,`emp_email`,`component_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_payslip_details`
--

DROP TABLE IF EXISTS `employee_payslip_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_payslip_details` (
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `uan_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_of_days` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `net_pay` varbinary(100) DEFAULT NULL,
  `created_on` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`year`,`month`,`emp_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_previous_experience`
--

DROP TABLE IF EXISTS `employee_previous_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_previous_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_details` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `begin_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_lock` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_previous_experience_FK` (`emp_email`),
  CONSTRAINT `employee_previous_experience_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_requests`
--

DROP TABLE IF EXISTS `employee_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_request_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `damage_card` mediumblob,
  `approval_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(2400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disclaimer` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  `token_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_requests_FK` (`emp_id`),
  CONSTRAINT `employee_requests_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_requests_feedbck`
--

DROP TABLE IF EXISTS `employee_requests_feedbck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_requests_feedbck` (
  `id` int NOT NULL AUTO_INCREMENT,
  `s_id` int NOT NULL,
  `comment` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_requests_feedbck_FK` (`s_id`),
  CONSTRAINT `employee_requests_feedbck_FK` FOREIGN KEY (`s_id`) REFERENCES `employee_requests` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_tds`
--

DROP TABLE IF EXISTS `employee_tds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_tds` (
  `emp_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fy` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_income` varbinary(100) DEFAULT NULL,
  `total_tds` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`emp_email`,`fy`),
  CONSTRAINT `employee_tds_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee_tds_slab`
--

DROP TABLE IF EXISTS `employee_tds_slab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_tds_slab` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_income_slab` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_income_slab` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` decimal(10,0) NOT NULL,
  `financial_year` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ems_login_details`
--

DROP TABLE IF EXISTS `ems_login_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ems_login_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_personal_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_password` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ems_login_details` (`emp_email`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exit_management_sys`
--

DROP TABLE IF EXISTS `exit_management_sys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exit_management_sys` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resign_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resign_date` date DEFAULT NULL,
  `req_relieve_date` date DEFAULT NULL,
  `act_relieve_date` date DEFAULT NULL,
  `status_of_approval_rm` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_of_approval_hr` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relieve_reason` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relieve_detailed_reason` text COLLATE utf8mb4_unicode_ci,
  `rehire` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `1to1discussion_completed` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rm_comments` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hr_comments` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_equipment` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desk_files` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_items` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_badge` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdrawal_status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `withdrawal_date` date DEFAULT NULL,
  `settlement_status` int DEFAULT '0',
  `relieve_date` date DEFAULT NULL,
  `ownself` int DEFAULT '0',
  `rejoin` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `emp_code` (`emp_code`),
  CONSTRAINT `exit_management_sys_ibfk_1` FOREIGN KEY (`emp_code`) REFERENCES `employee_master` (`emp_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `family_details`
--

DROP TABLE IF EXISTS `family_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valid_from` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_to` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `known_as` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_place` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_birth` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dependent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `family_details_FK` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form16`
--

DROP TABLE IF EXISTS `form16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form16` (
  `emp_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bucket` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formb_key` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forma_key` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`year`,`emp_code`),
  KEY `emp_email` (`emp_email`),
  CONSTRAINT `form16_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `full_n_final_settlement_details`
--

DROP TABLE IF EXISTS `full_n_final_settlement_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `full_n_final_settlement_details` (
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conveyance_payable` decimal(10,0) DEFAULT NULL,
  `medical_deductions` decimal(10,0) DEFAULT NULL,
  `other_deductions` decimal(10,0) DEFAULT NULL,
  `leave_allowance` decimal(10,0) DEFAULT NULL,
  `lop` decimal(10,0) DEFAULT NULL,
  `settlement_month` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hrd_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_dt` date DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_year` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_earnings` varbinary(100) DEFAULT NULL,
  `total_deductions` varbinary(100) DEFAULT NULL,
  `actual_relieve_date` date NOT NULL,
  `net_settlement_amount` double(12,2) DEFAULT NULL,
  `hold_month_net_pay` decimal(12,0) DEFAULT NULL,
  PRIMARY KEY (`emp_code`,`actual_relieve_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hike_details`
--

DROP TABLE IF EXISTS `hike_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hike_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `basic` decimal(10,0) DEFAULT NULL,
  `d_a` decimal(10,0) DEFAULT NULL,
  `h_r_a` decimal(10,0) DEFAULT NULL,
  `flexible` decimal(10,0) DEFAULT NULL,
  `perfomance_bonus` decimal(10,0) DEFAULT NULL,
  `l_t_a` decimal(10,0) DEFAULT NULL,
  `other_allowances` decimal(10,0) DEFAULT NULL,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `effective_date` date NOT NULL,
  `curr_salary` decimal(10,0) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `default_hike` int DEFAULT '1',
  `monthly_bsc` decimal(10,0) DEFAULT NULL,
  `monthly_house` decimal(10,0) DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hike_details_FK` (`emp_email`),
  CONSTRAINT `hike_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `id_card_request`
--

DROP TABLE IF EXISTS `id_card_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_card_request` (
  `emp_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `blood_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_working_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disclaimer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_sap_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `damaged_card` tinyblob,
  `request_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `it_declaration`
--

DROP TABLE IF EXISTS `it_declaration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_declaration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finance_yr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_old_new` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `it_declaration_UN` (`emp_email`,`finance_yr`),
  CONSTRAINT `it_declaration_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `it_declaration_80c`
--

DROP TABLE IF EXISTS `it_declaration_80c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_declaration_80c` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finance_yr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `80c_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `policy_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_holder_nm` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relation_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_dt` date DEFAULT NULL,
  `apprve_amount` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apprve_dt` date DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `docs` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `it_declaration_80c_FK` (`emp_email`),
  CONSTRAINT `it_declaration_80c_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `it_declaration_80d`
--

DROP TABLE IF EXISTS `it_declaration_80d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_declaration_80d` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finance_yr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `policy_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_holder_nm` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `relation_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `citizen_type` int DEFAULT '0',
  `receipt_dt` date DEFAULT NULL,
  `apprve_amount` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apprve_dt` date DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `docs` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `it_declaration_80d_FK` (`emp_email`),
  CONSTRAINT `it_declaration_80d_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `it_declaration_80e_ee_eeb`
--

DROP TABLE IF EXISTS `it_declaration_80e_ee_eeb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_declaration_80e_ee_eeb` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finance_yr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `80_e_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_start_dt` date DEFAULT NULL,
  `apprve_amount` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apprve_dt` date DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `principle_amount` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `docs` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `it_declaration_80e_ee_eeb_FK` (`emp_email`),
  CONSTRAINT `it_declaration_80e_ee_eeb_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `it_declaration_80g`
--

DROP TABLE IF EXISTS `it_declaration_80g`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_declaration_80g` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finance_yr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_pan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_dt` date NOT NULL,
  `apprve_amount` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apprve_dt` date DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `docs` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `it_declaration_80g_FK` (`emp_email`),
  CONSTRAINT `it_declaration_80g_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `it_declaration_hra`
--

DROP TABLE IF EXISTS `it_declaration_hra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_declaration_hra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finance_yr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `form_month` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_month` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rent_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_dt` date NOT NULL,
  `rent_amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` int NOT NULL,
  `landlord_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landlord_pan` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apprve_amount` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apprve_dt` date DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `docs` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `is_metro` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `it_declaration_hra_FK` (`emp_email`),
  CONSTRAINT `it_declaration_hra_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `it_declaration_lvc`
--

DROP TABLE IF EXISTS `it_declaration_lvc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `it_declaration_lvc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finance_yr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `food_cost` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stay_cost` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_cost` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_from_dt` date NOT NULL,
  `receipt_dt` date NOT NULL,
  `apprve_amount` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apprve_dt` date DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travel_to_dt` date DEFAULT NULL,
  `docs` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `it_declaration_lvc_FK` (`emp_email`),
  CONSTRAINT `it_declaration_lvc_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `itdeclaration_settings`
--

DROP TABLE IF EXISTS `itdeclaration_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itdeclaration_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cutoffdate_provisional` date NOT NULL,
  `cutoffdate_actual` date NOT NULL,
  `fy` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_balance`
--

DROP TABLE IF EXISTS `leave_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_balance` (
  `balance_id` int NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_leaves` int DEFAULT NULL,
  `used_leaves` int DEFAULT NULL,
  `remaining_leaves` int DEFAULT NULL,
  `user_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`balance_id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `leave_balance_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_balance_master`
--

DROP TABLE IF EXISTS `leave_balance_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_balance_master` (
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` smallint NOT NULL,
  `opening_balance` double DEFAULT '0',
  `previous_year_carry` double DEFAULT '0',
  `lapse` double DEFAULT '0',
  `loss_of_pay` double DEFAULT '0',
  `adjusted` double DEFAULT '0',
  `encashment` double DEFAULT '0',
  `rh_opening_balance` double DEFAULT '0',
  `sum_total_previous_carry` double DEFAULT '0',
  PRIMARY KEY (`user_name`,`year`),
  CONSTRAINT `leave_balance_master_FK` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_request`
--

DROP TABLE IF EXISTS `leave_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_date` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_leaves` double(30,2) DEFAULT '0.00',
  `leave_duration` int DEFAULT '0',
  PRIMARY KEY (`request_id`),
  KEY `user_name` (`user_name`),
  KEY `approver` (`approved_by`),
  CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `leave_request_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `employee_master` (`emp_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_setting`
--

DROP TABLE IF EXISTS `leave_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_setting` (
  `year` int NOT NULL,
  `annual_leave` int DEFAULT NULL,
  `rh_leave` int DEFAULT NULL,
  `max_encash` int DEFAULT NULL,
  `max_carry_forward` int DEFAULT NULL,
  `tot_max_carry_forward` int DEFAULT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `leave_type_master`
--

DROP TABLE IF EXISTS `leave_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_type_master` (
  `id` int DEFAULT '0',
  `year` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leave_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_leaves` double(30,2) DEFAULT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `availed` double(30,2) NOT NULL DEFAULT '0.00',
  `accrued` double(30,2) NOT NULL DEFAULT '0.00',
  `opening_Balance` double(30,2) DEFAULT '0.00',
  `pending` double(30,2) DEFAULT '0.00',
  `adjusted_by_HR` double(30,2) DEFAULT '0.00',
  `previous_year_encashment` double(30,2) DEFAULT '0.00',
  `current_year_encashment` double(30,2) DEFAULT '0.00',
  `max_carry_forward` double(30,2) DEFAULT '0.00',
  `lapsable` double(30,2) DEFAULT '0.00',
  `Loss_of_pay_leave` double(30,2) DEFAULT '0.00',
  PRIMARY KEY (`year`,`leave_type`,`user_name`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `leave_type_master_FK` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `my_performance`
--

DROP TABLE IF EXISTS `my_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_performance` (
  `performance_id` int NOT NULL AUTO_INCREMENT,
  `review_period` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `overall_rating` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_of_appraisal` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_overall_desc` text COLLATE utf8mb4_unicode_ci,
  `rm_overall_desc` text COLLATE utf8mb4_unicode_ci,
  `emp_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rm_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewer_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`performance_id`),
  UNIQUE KEY `my_performance_UN` (`review_period`,`emp_email`),
  KEY `my_performance_ibfk_1` (`emp_email`),
  CONSTRAINT `my_performance_ibfk_1` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `my_performance_add`
--

DROP TABLE IF EXISTS `my_performance_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_performance_add` (
  `id` int NOT NULL AUTO_INCREMENT,
  `performance_id` int DEFAULT NULL,
  `appraise_rating` int DEFAULT NULL,
  `appraise_rating_desc` text COLLATE utf8mb4_unicode_ci,
  `appraiser_rating` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appraiser_rating_desc` text COLLATE utf8mb4_unicode_ci,
  `category` varchar(90) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rm_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `my_performance_add_FK` (`performance_id`),
  CONSTRAINT `my_performance_add_FK` FOREIGN KEY (`performance_id`) REFERENCES `my_performance` (`performance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `new_nominee_details`
--

DROP TABLE IF EXISTS `new_nominee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_nominee_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nominee_name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominee_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominee_relation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominee_dob` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominee_guardian_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominee_guardian_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominee_guardian_relation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_in_medical` int DEFAULT NULL,
  `share_in_full_and_Final` int DEFAULT NULL,
  `share_in_pension` int DEFAULT NULL,
  `share_in_pf` int DEFAULT NULL,
  `emp_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `new_nominee_details_FK` (`emp_email`),
  CONSTRAINT `new_nominee_details_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `office_time_sheet`
--

DROP TABLE IF EXISTS `office_time_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_time_sheet` (
  `emp_code` int NOT NULL,
  `date` date DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `org_project_task`
--

DROP TABLE IF EXISTS `org_project_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_project_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_project_id` int DEFAULT NULL,
  `is_active` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `org_project_task_FK` (`org_project_id`),
  CONSTRAINT `org_project_task_FK` FOREIGN KEY (`org_project_id`) REFERENCES `org_project_list` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `org_working_days`
--

DROP TABLE IF EXISTS `org_working_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_working_days` (
  `working_days` int NOT NULL,
  PRIMARY KEY (`working_days`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `otp_session`
--

DROP TABLE IF EXISTS `otp_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `otp_session` (
  `otp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_requested_time` bigint DEFAULT NULL,
  `emp_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`emp_email`),
  CONSTRAINT `otp_session_ibfk_1` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pan_details`
--

DROP TABLE IF EXISTS `pan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pan_details` (
  `emp_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pan_num` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pan_card` mediumblob,
  `pan_key` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `pan_details_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passport_details`
--

DROP TABLE IF EXISTS `passport_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passport_details` (
  `emp_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passport_num` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuing_num` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_issue` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_expiry` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_of_issue` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_of_issue` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proof_of_nationality` mediumblob,
  `name_on_passport` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `given_name_on_passport` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname_on_passport` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_page` mediumblob,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `passport_details_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payslip_details`
--

DROP TABLE IF EXISTS `payslip_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payslip_details` (
  `year` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month_year` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `uan_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` varbinary(100) DEFAULT NULL,
  `food_allowance` varbinary(100) DEFAULT NULL,
  `holiday_allowance` varbinary(100) DEFAULT NULL,
  `house_allowance` varbinary(100) DEFAULT NULL,
  `performance_bonus` varbinary(100) DEFAULT NULL,
  `special_allowance` varbinary(100) DEFAULT NULL,
  `total_earnings` varbinary(100) DEFAULT NULL,
  `epf` varbinary(100) DEFAULT NULL,
  `pt` varbinary(100) DEFAULT NULL,
  `total_deductions` varbinary(100) DEFAULT NULL,
  `net_pay` varbinary(100) DEFAULT NULL,
  `file_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varbinary(100) DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num_of_days` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shift_allowance` varbinary(100) DEFAULT NULL,
  `tds` varbinary(100) DEFAULT NULL,
  `mie` varbinary(100) DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_on` date DEFAULT NULL,
  `arrears_lbl` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrears` varbinary(100) DEFAULT NULL,
  `advance_repayment_lbl` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advance_repayment` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`year`,`month`,`emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `performance_access_settings`
--

DROP TABLE IF EXISTS `performance_access_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_access_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `performance_rating`
--

DROP TABLE IF EXISTS `performance_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_rating` (
  `emp_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_join_date` date DEFAULT NULL,
  `performancerating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rm_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rm_emp_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rm_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `performance_setting_eligible`
--

DROP TABLE IF EXISTS `performance_setting_eligible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_setting_eligible` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL DEFAULT '0',
  `notice_period` int NOT NULL DEFAULT '0',
  `fy` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `performance_settings`
--

DROP TABLE IF EXISTS `performance_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `FY` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_details`
--

DROP TABLE IF EXISTS `pf_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_details` (
  `year` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_code` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pan_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ifsc` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uan_num` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_sheet` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_credit` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_share` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer_share` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pf_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vpf_percentage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vpf_amount` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `super_annuation_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gratuity_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professional_tax_eligibility` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labor_welfare_fund` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`year`,`month`,`emp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pf_setting_details`
--

DROP TABLE IF EXISTS `pf_setting_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pf_setting_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `default_amount` decimal(10,0) NOT NULL,
  `pf_condition` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_candidate_details`
--

DROP TABLE IF EXISTS `pre_join_candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_candidate_details` (
  `id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gaurdian_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personal_mail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pan` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adhaar` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin_code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experienced` tinyint(1) NOT NULL DEFAULT '0',
  `emp_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pan_UNIQUE` (`pan`),
  UNIQUE KEY `personal_mail_UNIQUE` (`personal_mail`),
  UNIQUE KEY `contact_number_UNIQUE` (`contact_number`),
  KEY `pre_join_candidate_details_KEY` (`emp_code`),
  CONSTRAINT `pre_join_candidate_details_FK` FOREIGN KEY (`emp_code`) REFERENCES `employee_master` (`emp_code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `pre_join_bgv`
--

DROP TABLE IF EXISTS `pre_join_bgv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_bgv` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `crid` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sr_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified_time` datetime NOT NULL,
  `final_status` smallint DEFAULT NULL,
  `address` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_status` tinyint(1) DEFAULT '0',
  `education` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `education_status` tinyint(1) DEFAULT '0',
  `experience` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience_status` tinyint(1) DEFAULT '0',
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `pre_join_bgv_FK_sr_number` (`sr_number`),
  KEY `pre_join_bgv_FK_crid` (`crid`),
  CONSTRAINT `pre_join_bgv_FK_crid` FOREIGN KEY (`crid`) REFERENCES `pre_join_candidate_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pre_join_bgv_FK_sr_number` FOREIGN KEY (`sr_number`) REFERENCES `dbqrequiter` (`sr_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_candid_education`
--

DROP TABLE IF EXISTS `pre_join_candid_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_candid_education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `register_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `details` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`register_id`),
  CONSTRAINT `id1` FOREIGN KEY (`register_id`) REFERENCES `pre_join_candidate_details` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_candid_experience`
--

DROP TABLE IF EXISTS `pre_join_candid_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_candid_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `register_id` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `begin_date` date NOT NULL,
  `end_date` date NOT NULL,
  `previous_employer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`register_id`),
  CONSTRAINT `id` FOREIGN KEY (`register_id`) REFERENCES `pre_join_candidate_details` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `pre_join_candidate_resume`
--

DROP TABLE IF EXISTS `pre_join_candidate_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_candidate_resume` (
  `crid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `resume_path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uploaded_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`crid`),
  CONSTRAINT `pre_join_candidate_resume_FK` FOREIGN KEY (`crid`) REFERENCES `pre_join_candidate_details` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_candidate_sr_numbers`
--

DROP TABLE IF EXISTS `pre_join_candidate_sr_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_candidate_sr_numbers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `crid` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sr_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  `removed_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pre_join_candidate_sr_numbers_FK` (`crid`),
  KEY `pre_join_candidate_sr_numbers_FK_1` (`sr_number`),
  CONSTRAINT `pre_join_candidate_sr_numbers_FK` FOREIGN KEY (`crid`) REFERENCES `pre_join_candidate_details` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pre_join_candidate_sr_numbers_FK_1` FOREIGN KEY (`sr_number`) REFERENCES `dbqrequiter` (`sr_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_candidates_annexure_details`
--

DROP TABLE IF EXISTS `pre_join_candidates_annexure_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_candidates_annexure_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `components_id` int NOT NULL,
  `amount` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sr_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `require_payslip` int DEFAULT '1',
  `amount_1` varbinary(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pre_join_candidates_annexure_details_FK` (`sr_number`),
  CONSTRAINT `pre_join_candidates_annexure_details_FK` FOREIGN KEY (`sr_number`) REFERENCES `dbqrequiter` (`sr_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_candidates_offer_letter_details`
--

DROP TABLE IF EXISTS `pre_join_candidates_offer_letter_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_candidates_offer_letter_details` (
  `crid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_joining` date NOT NULL,
  `designation` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_release_offer_letter` date NOT NULL,
  `work_location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notice_period` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `compensation` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finalized` int NOT NULL DEFAULT '0',
  `sr_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_letter` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`crid`),
  KEY `pre_join_candidates_offer_letter_details_FK` (`sr_number`),
  CONSTRAINT `pre_join_candidates_offer_letter_details_FK` FOREIGN KEY (`sr_number`) REFERENCES `dbqrequiter` (`sr_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_candidates_skills`
--

DROP TABLE IF EXISTS `pre_join_candidates_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_candidates_skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `crid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skill` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skill_type` smallint NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pre_join_candidates_skills_pre_join_candidate_details_FK` (`crid`),
  CONSTRAINT `pre_join_candidates_skills_pre_join_candidate_details_FK` FOREIGN KEY (`crid`) REFERENCES `pre_join_candidate_details` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_communication`
--

DROP TABLE IF EXISTS `pre_join_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_communication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sr_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_mail_sent` tinyint DEFAULT '0',
  `email_id` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_content_text_type`
--

DROP TABLE IF EXISTS `pre_join_content_text_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_content_text_type` (
  `text_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_eligible_days`
--

DROP TABLE IF EXISTS `pre_join_eligible_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_eligible_days` (
  `id` int NOT NULL AUTO_INCREMENT,
  `days` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_ext_otp_login`
--

DROP TABLE IF EXISTS `pre_join_ext_otp_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_ext_otp_login` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_requested_time` bigint DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_final_offered_sr`
--

DROP TABLE IF EXISTS `pre_join_final_offered_sr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_final_offered_sr` (
  `crid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sr_number` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`crid`,`sr_number`),
  KEY `pre_join_final_offered_sr_FK_1` (`sr_number`),
  CONSTRAINT `pre_join_final_offered_sr_FK` FOREIGN KEY (`crid`) REFERENCES `pre_join_candidate_details` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `pre_join_final_offered_sr_FK_1` FOREIGN KEY (`sr_number`) REFERENCES `dbqrequiter` (`sr_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_interview_panel`
--

DROP TABLE IF EXISTS `pre_join_interview_panel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_interview_panel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `panel_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interview_id` int NOT NULL,
  `feedback` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_interview_schedule`
--

DROP TABLE IF EXISTS `pre_join_interview_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_interview_schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sr_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schedule_from_date_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `schedule_to_date_time` datetime DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `optional_panel` tinyint DEFAULT '0',
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_rejected_candidates`
--

DROP TABLE IF EXISTS `pre_join_rejected_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_rejected_candidates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sr_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` date DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `offer_status` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_selected_candidates`
--

DROP TABLE IF EXISTS `pre_join_selected_candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_selected_candidates` (
  `crid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_selected` tinyint(1) DEFAULT '1',
  `shortlisted_screen` tinyint DEFAULT NULL,
  `final_selected_screen` tinyint DEFAULT NULL,
  `offered_screen` tinyint DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`crid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_shortlisted_status_history`
--

DROP TABLE IF EXISTS `pre_join_shortlisted_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_shortlisted_status_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `crid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` int DEFAULT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sr_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_status_type`
--

DROP TABLE IF EXISTS `pre_join_status_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_status_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordering` int DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_text_content`
--

DROP TABLE IF EXISTS `pre_join_text_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_text_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pre_join_text_content_constants`
--

DROP TABLE IF EXISTS `pre_join_text_content_constants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_join_text_content_constants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `constant_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `constant_text` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `previous_employer`
--

DROP TABLE IF EXISTS `previous_employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `previous_employer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `begin_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name` (`user_name`),
  CONSTRAINT `previous_employer_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_list_approvals`
--

DROP TABLE IF EXISTS `project_list_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_list_approvals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plannedstart_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plannedend_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actualstart_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actualend_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_expenditure_of_the_project` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimated_expenses` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actual_expenses` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_name` (`project_name`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_text_content`
--

DROP TABLE IF EXISTS `report_text_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_text_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reporting_manager`
--

DROP TABLE IF EXISTS `reporting_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting_manager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manager_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `begin_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_code` (`manager_code`),
  KEY `reporting_manager_FK` (`emp_id`),
  CONSTRAINT `reporting_manager_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reporting_manager_requests`
--

DROP TABLE IF EXISTS `reporting_manager_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reporting_manager_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_rm` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_rm` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_rm_approval` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_rm_approval` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `begin_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_date` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_screen`
--

DROP TABLE IF EXISTS `role_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_screen` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `screen_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_prv` tinyint NOT NULL,
  `write_prv` tinyint NOT NULL,
  PRIMARY KEY (`screen_name`,`role_id`),
  UNIQUE KEY `id` (`id`),
  KEY `role_screen_FK` (`role_id`),
  CONSTRAINT `role_screen_FK` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduler_run`
--

DROP TABLE IF EXISTS `scheduler_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduler_run` (
  `is_active` int NOT NULL,
  PRIMARY KEY (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `season_email`
--

DROP TABLE IF EXISTS `season_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season_email` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request`
--

DROP TABLE IF EXISTS `service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `emp_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `token_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `service_request_FK` (`emp_email`),
  CONSTRAINT `service_request_FK` FOREIGN KEY (`emp_email`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request_feedbck`
--

DROP TABLE IF EXISTS `service_request_feedbck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_request_feedbck` (
  `id` int NOT NULL AUTO_INCREMENT,
  `s_id` int NOT NULL,
  `comment` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `service_request_feedbck_FK` (`s_id`),
  CONSTRAINT `service_request_feedbck_FK` FOREIGN KEY (`s_id`) REFERENCES `service_request` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request_type_list`
--

DROP TABLE IF EXISTS `service_request_type_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_request_type_list` (
  `service_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `state_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`state_name`),
  KEY `country_name` (`country_name`),
  CONSTRAINT `states_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `countries` (`country_name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxable_hra_info`
--

DROP TABLE IF EXISTS `taxable_hra_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxable_hra_info` (
  `emp_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finance_yr` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxable_hra_amount` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_basic` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sum_receive_hra` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`emp_code`,`finance_yr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `technologies`
--

DROP TABLE IF EXISTS `technologies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technologies` (
  `id` int NOT NULL,
  `technologies` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years` int DEFAULT NULL,
  `months` int DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_sheet`
--

DROP TABLE IF EXISTS `time_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_sheet` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int NOT NULL,
  `date` date NOT NULL,
  `time_hrs` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'draft',
  `reporting_manager_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_sheet_UN` (`emp_id`,`task_id`,`date`),
  KEY `reporting_manager_id` (`reporting_manager_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `time_sheet_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `time_sheet_ibfk_3` FOREIGN KEY (`reporting_manager_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `time_sheet_ibfk_4` FOREIGN KEY (`task_id`) REFERENCES `org_project_task` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uan_details`
--

DROP TABLE IF EXISTS `uan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uan_details` (
  `emp_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uan` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `uan_details_UN` (`uan`),
  CONSTRAINT `uan_details_FK` FOREIGN KEY (`emp_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upload_all_files`
--

DROP TABLE IF EXISTS `upload_all_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_all_files` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `upload_file` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  `sub_category` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_reason` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `compensation_proof` int DEFAULT '0',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_application_access`
--

DROP TABLE IF EXISTS `user_application_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_application_access` (
  `emp_mail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `application_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` varchar(350) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `user_role_FK_1` (`user_id`),
  KEY `user_role_FK` (`role_id`),
  CONSTRAINT `user_role_FK` FOREIGN KEY (`role_id`) REFERENCES `app_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_FK_1` FOREIGN KEY (`user_id`) REFERENCES `employee_master` (`emp_email`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `concept_process_table` VALUES (1,0,1,1);

/*!40000 ALTER TABLE `email_template` DISABLE KEYS */;
INSERT INTO `email_template` VALUES (1,'<!DOCTYPE html>\n <html>\n <head>\n <style>\n html {\n     min-height: 100%;\n }\n body {\n     background-image: linear-gradient(to top right,rgb(228, 180, 91),rgb(5, 179, 248));\n }\n </style>\n </head>\n <body>\n {mail_text_content}\n </body> </html>');
/*!40000 ALTER TABLE `email_template` ENABLE KEYS */;

INSERT INTO `email_format_config` VALUES ('i_on_board','credential_details','ZOY Employee Portal Login Details','<div >\n<p>Dear {emp_name_code},</br><br>\nPlease use below data to login into the portal,</br>\nURL: {site_url}</br>\nUser Name: {user_name} </br>\nPassword: {pwd}</br></br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',1),('forgot_password','sending_OTP','OTP To Change Password','<div >\n <p>Dear {emp_name_code},</br><br>\n Please use below passcode to change password.<br>\n security code: {security_code}</br></br></br>\n </br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n </p>\n <p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n </div>',2),('change_password','change_password_reminder_mail','Change Password reminder','<div >\n<p>Dear {emp_name_code},</br><br>\nPlease change ZOY Employee Portal password. For every 45 days Password should be changed.<br><br>\nPath: Login ZOY Employee Portal --> Account Settings --> Change password<br><br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',3),('reporting_manager','rm_change_request','RM Change Request','<div >\n<p>Dear Reporting Manager,<br><br>\nReporting Manager change request has been submitted by {emp_name_code}.</br> \nPlease Approve/Reject using below path.<br><br>\nPath: Login ZOY Employee Portal --> LMS --> RM Approvals.<br><br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',4),('rm_approvals','rm_change_request_approved','Reporting Manager change Request Approved','<div >\n<p>Dear {emp_name_code},<br><br>Your RM request has been approved by {rm_name_code}.<br><br>\nPath: Login ZOY Employee Portal --> Employment --> Reporting manager.<br><br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',5),('rm_approvals','rm_change_request_approved_fully','Reporting Manager change Request Approved','<div >\n<p>Dear {emp_name_code},<br><br>Your RM request has been fully approved.<br><br>\nPath: Login ZOY Employee Portal --> Employment --> Reporting manager.<br><br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',6),('rm_approvals','rm_change_request_rejected','Reporting Manager change Request Rejected','<div >\n<p>Dear {emp_name_code},<br><br>\nYour RM request has been rejected by {rm_name_code}.<br><br>\nPath: Login ZOY Employee Portal --> Employment --> Reporting manager.<br><br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',7),('rm_approvals','leave_request_approved','Leave Request Approved','<div >\n<p>Dear {emp_name_code},<br><br>\n{full_content}.<br><br>\nPath: Login ZOY Employee Portal --> LMS.<br><br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',8),('rm_approvals','leave_request_rejected','Leave Request Rejected','<div >\n<p>Dear {emp_name_code},<br><br>\n{full_content}.<br><br>\nPath: Login ZOY Employee Portal --> LMS.<br><br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',9),('id_card_request','id_card_request','ID Card Request','<div >\n<p>Dear HR Manager/Admin,<br><br>The ID card request has been submitted by {emp_name_code}.<br> \nRequest Type: {type}<br> \nPlease Approve or Reject.<br><br> \nPath: Login ZOY Employee Portal --> Employment --> Admin Approvals .<br><br> \n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',10),('admin_approvals','id_card_request_approved','ID Card Request Approved','<div >\n<p>Dear {emp_name_code},<br> <br> \nYour ID card request has been Approved. Please collect from HR Admin.<br><br> \n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',11),('admin_approvals','id_card_request_rejected','ID Card Request Rejected','<div >\n<p>Dear {emp_name_code},<br> <br> \nYour ID card request has been Rejected.<br><br> \nReason: {reason}.<br><br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',12),('my_performance_management','performance_comment_submitted_to_rm','Performance comments has been submitted','<div >\n<p>Dear {rm_name_code},<br> <br> \nThe performance comments have been submitted by {emp_name_code}.</br>\nPlease review and provide your comments.</br></br>\nPath: Login to ZOY Employee Portal --> Employment --> Performance Management.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',13),('my_performance_management','performance_comment_submitted_by_rm','Performance comments submitted by Reporting Manager','<div >\n<p>Dear {reviewer_name_code},<br> <br> \nThe performance comments have been submitted by the Reporting Manager for employee {emp_name_code}  and it is ready for review.</br></br>Path: Login to ZOY Employee Portal --> Employment --> Performance Management.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',14),('my_performance_management','performance_comment_recalled','Performance comments Recalled','<div >\n<p>Dear {emp_name_code},<br> <br> \nYour performance comments have been recalled by your Reporting Manager {rm_name_code}.\nIf any changes needed, please do modification & submit again.</br></br>\nPath: Login to ZOY Employee Portal --> Employment --> Performance Management.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',15),('lms','leave_request','Leave Request','<div >\n<p>Dear {rm_name_code},<br> <br> \n{full_content}</br></br>\nReason : {reason}</br> </br>\nPath: Login to ZOY Employee Portal --> LMS --> RM approvals.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',16),('lms','leave_request_approved','Leave Request Approved','<div >\n<p>Dear {hr_name_code},<br> <br> \n{full_content}</br></br>\nPath: Login to ZOY Employee Portal --> LMS</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',17),('lms','leave_request_rejected','Leave Request Rejected','<div >\n<p>Dear {emp_name_code},<br> <br> \n{full_content}</br></br>\nPath: Login to ZOY Employee Portal --> LMS</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',18),('DBQ_recruiter','DBQ_recruiter','Talent Acquisition','<div >\n<p>Dear Employee,<br> <br>We have opening for below positions. Please refer your contacts for required positions. For more details, please check with your HR/Admin.</br></br>\n{full_content}</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',19),('project_assignation','project_assignation','My Project Assignation','<div >\n<p>Dear {emp_name_code},<br> <br> \n{project_name} has been assigned to you. Please verify it and change your RM to receptive resource.</br></br>\nPath:</br>\nLogin to ZOY Employee Portal --> Employment --> My Project Assignation (To check the project details) </br>\nLogin to ZOY Employee Portal --> Employment --> My Reporting Manager ( To change the RM) </br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',20),('compensation','compensation','Compensation','<div >\n<p>Dear {emp_name_code},<br> <br> \nYour annual compensation has been done. Please verify in the below location.</br></br>\nPath: Login to ZOY Employee Portal --> Employment --> My Compensation.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',21),('timesheet','timesheet_request','Timesheet Request','<div >\n<p>Dear {rm_name_code},<br> <br> \n{full_content}</br></br>\nPath: Login to ZOY Employee Portal --> Time Sheet --> Employee Time sheet </br></br>Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',22),('timesheet','timesheet_request_rejected','Timesheet Rejected','<div >\n<p>Dear {emp_name_code},<br> <br> \n{full_content}</br></br>\nPath: Login to ZOY Employee Portal --> Time Sheet --> Time sheet dashboard. </br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br></p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',23),('timesheet','timesheet_request_recalled','Timesheet Recalled','<div >\n<p>Dear {emp_name_code},<br> <br> \n{full_content}</br></br>\nPath: Login to ZOY Employee Portal --> Time Sheet --> Time sheet dashboard. </br></br>Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',24),('ems','ems_submitted','Separation submitted by {emp_name_code}','<div >\n<p>Dear  HR Manager/ Reporting Manager, </br></br>\n{full_content} </br><br> \nPath: Login to ZOY Employee Portal --> EMS --> Approvals </br> </br> </br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',25),('ems','ems_withdrawal','Separation  withdrawal','<div >\n<p>Dear  {emp_name_code}, </br></br>\nCongratulations!!! </br>\nYour Resignation withdrawal is successfully completed and continue happy working ZOY PG. </br><br>\nPath: Login to ZOY Employee Portal --> EMS --> Separation</br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',26),('ems','ems_approved','Separation Approved','<div >\n<p>Dear  {emp_name_code}, </br></br>\n{full_content} </br><br>\nPath: Login to ZOY Employee Portal --> EMS --> Separation</br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',27),('ems','ems_rejected','Separation Rejected','<div >\n<p>Dear  {emp_name_code}, </br></br>\n{full_content} </br><br>\nPath: Login to ZOY Employee Portal --> EMS --> Separation</br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',28),('ems','ems_credential','ZOY EMS Credentials','<div >\n<p>Dear  {emp_name_code}, </br></br>\nPlease take your related documents by login into below portal. </br>\nURL:{url} </br>\nUserName: {user_nm} </br>\nPassword: {pwd} </br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',29),('scheduler','birthday','HAPPY BIRTHDAY WISHES','<div >\n<p>Dear  {emp_name_code}, </br></br>\nOn behalf of <b>ZOY PG PVT. LTD</b>, We would like to wish you a very <b style=\"color:blue;\">HAPPY BIRTHDAY !</b> \nand sending you our best wishes for much happiness in your life.<br> \nMay the year ahead be filled with success, growth, and fulfilment in both your personal and professional life </br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',30),('scheduler','anniversary','Celebrating your Job anniversary!','<div >\n<p>Dear  {emp_name_code}, </br></br>\nCongratulation! You have been with us at ZOY PG Pvt. Ltd. for {year_content} .\nYou have made a great contribution to our department\'s success during your time with us. We appreciate your unwavering commitment and hard work on the same.<br>\nWe wish you enjoy this anniversary and also the years to come. </br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',31),('f_f_settlement','f_f_settlement','Full and Final Settlement','<div >\n<p>Dear Ex-Employee,</br></br> \n\nYour full and final settlement has been completed from ZOY PG Pvt Ltd & the settlement amount will be credited end of month. Please login to Ex-employee portal {url} for related documents  </br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',32),('finance_time','form16','Form16','<div >\n<p>Dear Employee,</br></br> \nYour Form 16 has been uploaded for the Financial year - {year}. If you are facing any issues, please reach out your HR.<br><br>\nPath: Login ZOY Employee Portal --> Personal --> Form16.</br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',33),('finance_time','payslip','Salary Slip of {1} for {2}','<div >\n<p>Dear {3},</br></br> \nPlease find attached <B>Salary Slip of {1} for {2} </B>.<BR/>\n<B> Password will be your PAN Number</B> <BR/> \nIf you have any question ,do not hesitate to contact HR Support<B>(hrsupport@mydbq.com)</B>.<BR/> \nPath: Login to ZOY Employee Portal --> Personal --> My PaySlip <BR/><BR/>\nRegards<BR/>HR SUPPORT<BR/>ZOY PG PVT. LTD.<BR/>Email: hrsupport@mydbq.com<BR/>364, Ground floor, 6th main, 6th sector, HSR Layout, Bengaluru, Karnataka 560102<BR/><BR/><BR/>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',34),('finance_time','payslip_without_pwd','Salary Slip {1} for {2}','<div >\n<p>Dear {3},</br></br> \nThe <B>Salary Slip {1} for {2} </B> has been generated. You can download it using below application path.  <BR/>\nIf you have any question ,do not hesitate to contact HR Support<B>(hrsupport@mydbq.com)</B>.<BR/> \nPath: Login to ZOY Employee Portal --> Personal --> My PaySlip <BR/><BR/>\nRegards<BR/>HR SUPPORT<BR/>ZOY PG PVT. LTD.<BR/>Email: hrsupport@mydbq.com<BR/>364, Ground floor, 6th main, 6th sector, HSR Layout, Bengaluru, Karnataka 560102<BR/><BR/><BR/>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',35),('Bank_add_update','EHS','Bank information add / update by employee','<div >\n<p>Dear,<br> <br>Bank information  has been added / updated by {nm}.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',36),('Bank_details_approval','approval_mail','Bank information Approval','<div >\n <p>Dear {emp_name},<br> <br>The bank details has been approved by {hr_name}.</br></br>\n </br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n </p>\n <p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n </div>',37),('timesheet','timesheet_lop','Time sheet Auto Submitted as LOP','<div >\n<p>Dear {emp_name_code},<br> <br> \n     You didn\'t submit your time sheet on {date} ,so it\'s auto submitted as Loss Of Pay .</br></br>\nThanks, </br> Admin Department, </br>ZOY PG.</br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',38),('timesheet','timesheet_wm','Time sheet not submitted','<div >\n<p>Dear {emp_name_code},</br></br> \n    You didn\'t submit your time sheet on {dates} dates.\n    If you are unable to submitted the Time sheet, it will be auto submitted as LOP on the above dates .<br><br>\nPath: Login to ZOY Employee Portal --> Time Sheet --> Employee Time sheet.</br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',39),('Timesheet','recall_LOP','LOP Time Sheet Recalled','<div >\n<p>Dear {emp_name},<br> <br>The Loss of pay timesheet has been recalled by your RM. Please fill and submit timesheet.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',40),('Timesheet','reject_recall_LOP','LOP Recall Request Rejected','<div >\n<p>Dear {emp_name},<br> <br>The Loss of pay timesheet recall request has been rejected by your  RM. Please reached out your RM if you any concern.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',41),('ServiceRequest','ServiceRequest','{request_type}','<div >\n  <p>Dear Admin,<br> <br>The {request_type} has been submitted by {Name_and_Emp_Id_of_the_employee}.</br>Description: {description} </br></br>  \n  Path: <Login ZOY Employee Portal --> Approvals --> Admin Approvals.</br></br>\n  </br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n  </p>\n  <p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n  </div>',42),('AdminApprovals','ServiceRequest','{request_type}','<div >\n <p>Dear {Name_of_the_employee},<br> <br>Your {request} has been {status}.</br>comments: {comments} </br></br> \n Path: Login ZOY Employee Portal --> Personal Details--> Service Request.</br></br>\n </br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n </p>\n <p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n </div>',43),('ServiceRequest','feedback','{type}','<div >\n<p>Dear Admin,<br> <br>The {Request_Type} has been {status} by {Name_and_Emp_Id_of_the_employee}.</br>Comments: {comments} </br></br>\n Path: Login ZOY Employee Portal --> Approvals --> Admin Approvals. </br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',44),('season_email','run','{subject}','<div >\n<p>Dear Employee, <br><br>\n{comments} </br></br>\n</br> \nThanks,</br>HR Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',45),('MyCompOffApply','Comp-OffSubmission','{subject}','<div >\n <p>Dear {RM_Name},<br> <br>The Comp-off request has been submitted by {Employee_Name} for this dates {YYYY-MM-DD}.</br>\n Description: {description}</br></br>\n Path: Login to ZOY Employee Portal --> Time Sheet --> Employee Comp-Off Approvals. </br></br>\n </br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n </p>\n <p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n </div>',46),('EmpCompOffApprovals','Comp-OffApprovals','{subject}','<div >\n <p>Dear {Employee_Name},<br> <br>The Comp-off request has been {status} by {RM_Name} for this dates {YYYY-MM-DD}.</br></br>\n Path: Login to ZOY Employee Portal --> Time Sheet --> My Comp-Off Apply. </br></br>\n </br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n </p>\n <p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n </div>',47),('MyCompOffApply','Comp-OffRecall','Comp-off Re-Called','<div >\n<p>Dear {RM_Name},<br> <br>The Comp-off request has been re-called by {Employee_Name} for this dates {YYYY-MM-DD}.</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',48),('candidate_details','credential_details','ZOY PG HR Portal Login Details','<div >\n<p>Dear {applicant_name},</p>\n<p>We are pleased to inform you that your application process is now in progress. To proceed further, please use your <b> personal email </b> address as the username to log in to the application.</p>\n<p>Kindly access the application using the provided URL:<a href=\'{site_url}\'>{site_url}</a></p>\n<p>Once logged in, please fill out your basic information to continue with the application process. Should you encounter any difficulties or have questions, please feel free to contact us.</p>\n<p>All the best and Thank you for your cooperation.</p> \n<p>Best regards,<br>Admin Department,<br>ZOY PG</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',49),('Setting_config','performance_appraisal','Performance Evalution Notification','<div >\n<p>Dear Employee,<br> <br>\nI hope this email finds you well.<br/><br/>\nAs part of our ongoing commitment to support your professional growth and development, ZOY PG wanted to remind you that your performance evaluation is scheduled for</br></br>\n{full_content}</br></br>\nThis evaluation is an opportunity for us to reflect on your accomplishments, discuss any challenges you may have encountered, and set goals for the future.Please take some time to prepare for the evaluation by reflecting on your achievements and considering any goals you would like to discuss.\n</br></br>\nThank you for your dedication and hard work. I look forward to our discussion.\n</br></br>\nPath: Login to ZOY Employee Portal --> Employement --> My Performance Management <BR/><BR/>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',50),('Setting_config','IT_notification','Income Tax Declaration Notification','<div >\n<p>Dear Employee,<br> <br>Income Tax Declaration window is open. Please declare the tax slab on or before below cut-off date. If you have any queries, please check with your HR/Admin partner.</br></br>\n{full_content}</br></br>\nNote : Please ignore if already you have done it.\n</br></br>\nPath: Login to ZOY Employee Portal --> Tax Declaration <BR/><BR/>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',51),('f_f_experience_ltter','f_f_experience_ltter','ZOY PG Experience Letter Released','<div >\n<p>Dear Ex-Employee,</br></br> \n\nYour experience letter has been processed from ZOY PG Pvt Ltd. Please login to Ex-employee portal {url} for related documents  </br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',52),('f_f_relieving_ltter','f_f_relieving_ltter','ZOY PG Relieving Letter Released','<div >\n<p>Dear Ex-Employee,</br></br> \n\nYour relieving letter has been processed from ZOY PG Pvt Ltd. Please login to Ex-employee portal {url} for related documents  </br></br>\nThanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',53),('compensation','compensation-reject','Compensation has been rejected','<div >\n<p>Dear All,<br> <br> \nThe compensation({emp_name}) has been rejected by management,please correct and request once again.</br></br>\nPath: Login to ZOY Employee Portal --> Admin --> Compensation .</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',54),('my_performance_management','Self-Performance_Remainder','Gentle Reminder for Self-Performance Rating ','<div >\n<p>Dear {emp},<br> <br> \nThis is a friendly reminder to complete your self-evaluation for the performance review period of current financial year.</br>\nYour input is valuable for a productive discussion during our upcoming review meeting. Taking the time to reflect on your accomplishments and areas for development will help us set clear goals for the future.</br>\nThe deadline to complete the self-evaluation is {due_date}.</br></br>\nTo complete your self-evaluation, please follow the steps below:</br>\nPath: Login to ZOY Employee Portal --> Employment --> My Performance Management</br></br>\n</br> Thanks, </br> Admin Department, </br> ZOY PG.</br></br>\n</p>\n<p>Note: This is Auto generated mail don\'t reply for this mail.</p>\n</div>',55);
/*!40000 ALTER TABLE `email_format_config` ENABLE KEYS */;

INSERT INTO `app_role` VALUES (1,'All Access','ALL ACCESS');
INSERT INTO `role_screen` VALUES (888,1,'ADMIN_DASHBOARD',1,1),(883,1,'ANNEXURE_CONFIG',1,1),(848,1,'ANNEXURE_TYPE',1,1),
(886,1,'ANNOUNCEMENTS',1,1),(885,1,'APPRAISAL',1,1),(863,1,'BAND_DESIGNATION',1,1),(864,1,'BANK_DETAILS_APPROVALS',1,1),
(851,1,'BRANCH_INFO',1,1),(871,1,'COMP_OFF_APPROVALS',1,1),(878,1,'COMPENSATION',1,1),(895,1,'COMPENSATION_APPROVAL',1,1),(862,1,'COMPENSATION_REPORT',1,1),
(866,1,'COMPENSATION_UPLOAD',1,1),(860,1,'DBQ_RECRUITER',1,1),(861,1,'DBQ_VERIFY',1,1),(847,1,'EMAIL_CONFIG',1,1),
(857,1,'EMP_LIST_REPORTS',1,1),(875,1,'EMP_NOMINEE_REPORTS',1,1),(849,1,'EMP_PAYSLIP_DATA',1,1),(890,1,'EMPLOYEE_BGV_INFO',1,1),(876,1,'EMPLOYEE_INFO',1,1),
(853,1,'EMPLOYEE_MGM',1,1),(874,1,'EMPLOYEE_SEARCH',1,1),(896,1,'EMPLOYEE_SEPARATION',1,1),(850,1,'EMPLOYEE_TIMESHEET',1,1),
(854,1,'EMS_APPROVAL',1,1),(843,1,'EMS_SETTLEMENT',1,1),(867,1,'FINANCE_AND_TIME',1,1),(882,1,'ION_BOARD',1,1),
(852,1,'LEAVE_BALANCE_REPORTS',1,1),(881,1,'OFFICE_TIME_SHEET',1,1),(872,1,'PAYSLIP_SALARY_REPORTS',1,1),(897,1,'PERFORMANCE_RATING',1,1),
(873,1,'PF_SETTING',1,1),(893,1,'PROCESS_PAYSLIP',1,1),(858,1,'PROJECT_ASSIGNATION',1,1),(884,1,'PROJECT_REPORTS',1,1),
(891,1,'REPORT_TEXT_CONTENT',1,1),(859,1,'RESIGNATION_REPORTS',1,1),(846,1,'RM_CHANGE_REQUEST',1,1),(877,1,'ROLE_MASTER',1,1),
(855,1,'SA_APPROVALS_INFO',1,1),(887,1,'SALARY_ACCOUNT_DETAILS_REPORT',1,1),(856,1,'SCHEDULER_RUN',1,1),(892,1,'SEASON_EMAIL_SETUP',1,1),
(870,1,'SETTINGS_CONFIG',1,1),(869,1,'SETTINGS_TDS',1,1),(879,1,'TAX_DECLARATION_APPROVALS',1,1),(889,1,'TAX_DECLARATION_REPORTS',1,1);
/*!40000 ALTER TABLE `role_screen` ENABLE KEYS */;


INSERT INTO `employee_master` VALUES ('sysadmin@mydbq.com','D0','SYS','999','SYSTEM',NULL,'Admin','2020-04-01','Male','B+','sonOf _','sysadmin@mydbq.com',NULL,'2020-04-01','Mr.','Indian','India',NULL,1,NULL,'BGLR','BGLR',NULL,0,'I-OnBoard',NULL);
INSERT INTO `employee_login_details` VALUES (1,'sysadmin@mydbq.com','Y','Y','2025-03-19',1,AES_ENCRYPT('Sysadmin@#25' ,'mydbq@2023'));
INSERT INTO `user_role` VALUES ('sysadmin@mydbq.com',1,1);
INSERT INTO `countries` VALUES (13,'Australia','Australian','Australia Dollars â€“ AUD','+61'),(10,'Canada','Canadian','Canada Dollars â€“ CAD','+1'),(2,'China','Chinese','China Yuan Renminbi â€“ CNY','+86'),(8,'France','French','France Francs â€“ FRF','+33'),(6,'Germany','German','Germany Deutsche Marks â€“ DEM','+49'),(1,'India','Indian','India Rupees â€“ INR','+91'),(9,'Italy','Italian','Italy Lire â€“ ITL','+39'),(5,'Japan','Japanies','Japan Yen â€“ JPY','+81'),(17,'Kuwait','Kuwaiti','Kuwait Dinars â€“ KWD','+60'),(12,'Malaysia','Malaysians','Malaysia Ringgits â€“ MYR','+60'),(16,'New Zealand','New Zealander','New Zealand Dollars â€“ NZD','+64'),(4,'Russia','Russian','Russia Rubles â€“ RUB','+7'),(11,'Saudi Arabia','Saudi Arabians','Saudi Arabis-RIAL','+966'),(15,'Singapore','Singaporean','Singapore Dollars â€“ SGD','+65'),(14,'UAE','Emirati','United Arab Emirates Dirhams â€“ AED','+971'),(7,'UK','British','United Kingdom Pounds â€“ GBP','+44'),(3,'United States','American','United States Dollars â€“ USD','+1');

INSERT INTO `states` VALUES ('Australian Capital TerritoryÂ ','Australia'),('New South WalesÂ ','Australia'),('Northern TerritoryÂ ','Australia'),('QueenslandÂ ','Australia'),('South AustraliaÂ ','Australia'),('TasmaniaÂ ','Australia'),('VictoriaÂ ','Australia'),('Western AustraliaÂ ','Australia'),('AlbertaÂ ','Canada'),('British ColumbiaÂ ','Canada'),('ManitobaÂ ','Canada'),('New Brunswick','Canada'),('Newfoundland and LabradorÂ ','Canada'),('Northwest TerritoriesÂ ','Canada'),('Nova ScotiaÂ ','Canada'),('NunavutÂ ','Canada'),('OntarioÂ ','Canada'),('Prince Edward IslandÂ ','Canada'),('QuebecÂ ','Canada'),('SaskatchewanÂ ','Canada'),('YukonÂ ','Canada'),('Anhui','China'),('Beijing','China'),('Chongqing ','China'),('Fujian','China'),('Gansu','China'),('Guangdong','China'),('Guangxi Zhuang','China'),('Guizhou','China'),('Hainan','China'),('Hebei','China'),('Heilongjiang','China'),('Henan','China'),('Hong Kong SAR','China'),('Hubei','China'),('Hunan','China'),('Inner Mongolia','China'),('Jiangsu','China'),('Jiangxi','China'),('Jilin','China'),('Liaoning','China'),('Macau SAR','China'),('Ningxia Huizu','China'),('Qinghai','China'),('Shaanxi','China'),('Shandong','China'),('ShanghaiÂ ','China'),('Shanxi','China'),('Sichuan','China'),('TaiwanÂ ','China'),('Tianjin','China'),('Xinjiang','China'),('Xizang','China'),('Yunnan','China'),('Zhejiang','China'),('AinÂ ','France'),('AisneÂ ','France'),('AllierÂ ','France'),('Alpes-de-Haute-ProvenceÂ ','France'),('Alpes-MaritimesÂ ','France'),('AlsaceÂ ','France'),('ArdÃ¨cheÂ ','France'),('ArdennesÂ ','France'),('AriÃ¨geÂ ','France'),('AubeÂ ','France'),('AudeÂ ','France'),('Auvergne-RhÃ´ne-AlpesÂ ','France'),('AveyronÂ ','France'),('Bas-RhinÂ ','France'),('Bouches-du-RhÃ´neÂ ','France'),('Bourgogne-Franche-ComtÃ©Â ','France'),('BretagneÂ ','France'),('CalvadosÂ ','France'),('CantalÂ ','France'),('Centre-Val de LoireÂ ','France'),('CharenteÂ ','France'),('Charente-MaritimeÂ ','France'),('CherÂ ','France'),('ClippertonÂ ','France'),('CorrÃ¨zeÂ ','France'),('CorseÂ ','France'),('Corse-du-SudÂ ','France'),('CÃ´te-d\'OrÂ ','France'),('CÃ´tes-d\'ArmorÂ ','France'),('CreuseÂ ','France'),('Deux-SÃ¨vresÂ ','France'),('DordogneÂ ','France'),('DoubsÂ ','France'),('DrÃ´meÂ ','France'),('EssonneÂ ','France'),('EureÂ ','France'),('Eure-et-LoirÂ ','France'),('FinistÃ¨reÂ ','France'),('French GuianaÂ ','France'),('French PolynesiaÂ ','France'),('French Southern and Antarctic LandsÂ ','France'),('GardÂ ','France'),('GersÂ ','France'),('GirondeÂ ','France'),('Grand-EstÂ ','France'),('GuadeloupeÂ ','France'),('Haut-RhinÂ ','France'),('Haute-CorseÂ ','France'),('Haute-GaronneÂ ','France'),('Haute-LoireÂ ','France'),('Haute-MarneÂ ','France'),('Haute-SaÃ´neÂ ','France'),('Haute-SavoieÂ ','France'),('Haute-VienneÂ ','France'),('Hautes-AlpesÂ ','France'),('Hautes-PyrÃ©nÃ©esÂ ','France'),('Hauts-de-FranceÂ ','France'),('Hauts-de-SeineÂ ','France'),('HÃ©raultÂ ','France'),('ÃŽle-de-FranceÂ ','France'),('Ille-et-VilaineÂ ','France'),('IndreÂ ','France'),('Indre-et-LoireÂ ','France'),('IsÃ¨reÂ ','France'),('JuraÂ ','France'),('La RÃ©unionÂ ','France'),('LandesÂ ','France'),('Loir-et-CherÂ ','France'),('LoireÂ ','France'),('Loire-AtlantiqueÂ ','France'),('LoiretÂ ','France'),('LotÂ ','France'),('Lot-et-GaronneÂ ','France'),('LozÃ¨reÂ ','France'),('Maine-et-LoireÂ ','France'),('MancheÂ ','France'),('MarneÂ ','France'),('MartiniqueÂ ','France'),('MayenneÂ ','France'),('MayotteÂ ','France'),('MÃ©tropole de LyonÂ ','France'),('Meurthe-et-MoselleÂ ','France'),('MeuseÂ ','France'),('MorbihanÂ ','France'),('MoselleÂ ','France'),('NiÃ¨vreÂ ','France'),('NordÂ ','France'),('NormandieÂ ','France'),('Nouvelle-AquitaineÂ ','France'),('OccitanieÂ ','France'),('OiseÂ ','France'),('OrneÂ ','France'),('ParisÂ ','France'),('Pas-de-CalaisÂ ','France'),('Pays-de-la-LoireÂ ','France'),('Provence-Alpes-CÃ´te-dâ€™AzurÂ ','France'),('Puy-de-DÃ´meÂ ','France'),('PyrÃ©nÃ©es-AtlantiquesÂ ','France'),('PyrÃ©nÃ©es-OrientalesÂ ','France'),('RhÃ´neÂ ','France'),('Saint Pierre and MiquelonÂ ','France'),('Saint-BarthÃ©lemyÂ ','France'),('Saint-MartinÂ ','France'),('SaÃ´ne-et-LoireÂ ','France'),('SartheÂ ','France'),('SavoieÂ ','France'),('Seine-et-MarneÂ ','France'),('Seine-MaritimeÂ ','France'),('Seine-Saint-DenisÂ ','France'),('SommeÂ ','France'),('TarnÂ ','France'),('Tarn-et-GaronneÂ ','France'),('Territoire de BelfortÂ ','France'),('Val-d\'OiseÂ ','France'),('Val-de-MarneÂ ','France'),('VarÂ ','France'),('VaucluseÂ ','France'),('VendÃ©eÂ ','France'),('VienneÂ ','France'),('VosgesÂ ','France'),('Wallis and FutunaÂ ','France'),('YonneÂ ','France'),('YvelinesÂ ','France'),('Baden-WÃ¼rttembergÂ ','Germany'),('BavariaÂ ','Germany'),('BerlinÂ ','Germany'),('BrandenburgÂ ','Germany'),('BremenÂ ','Germany'),('HamburgÂ ','Germany'),('HesseÂ ','Germany'),('Lower SaxonyÂ ','Germany'),('Mecklenburg-VorpommernÂ ','Germany'),('North Rhine-WestphaliaÂ ','Germany'),('Rhineland-PalatinateÂ ','Germany'),('SaarlandÂ ','Germany'),('SaxonyÂ ','Germany'),('Saxony-AnhaltÂ ','Germany'),('Schleswig-HolsteinÂ ','Germany'),('ThuringiaÂ ','Germany'),('Andaman and Nicobar Islands','India'),('Andhra Pradesh','India'),('Arunachal Pradesh','India'),('Assam','India'),('Bihar','India'),('Chandigarh','India'),('Chhattisgarh','India'),('Dadra and Nagar Haveli and Daman and Diu ','India'),('Delhi','India'),('Goa','India'),('Gujarat','India'),('Haryana','India'),('Himachal Pradesh','India'),('Jammu and Kashmir','India'),('Jharkhand','India'),('Karnataka','India'),('Kerala','India'),('Ladakh','India'),('Lakshadweep','India'),('Madhya Pradesh','India'),('Maharastra','India'),('Manipur','India'),('Meghalaya','India'),('Mizoram','India'),('Nagaland','India'),('Odisha','India'),('Puducherry','India'),('Punjab','India'),('Rajasthan','India'),('Sikkim','India'),('TamilNadu','India'),('Telangana','India'),('Tripura','India'),('Uttarakhand ','India'),('Uttarpradesh','India'),('West Bengal','India'),('AbruzzoÂ ','Italy'),('AgrigentoÂ ','Italy'),('AlessandriaÂ ','Italy'),('AnconaÂ ','Italy'),('Aosta ValleyÂ ','Italy'),('ApuliaÂ ','Italy'),('Ascoli PicenoÂ ','Italy'),('AstiÂ ','Italy'),('AvellinoÂ ','Italy'),('Barletta-Andria-TraniÂ ','Italy'),('BasilicataÂ ','Italy'),('BellunoÂ ','Italy'),('BeneventoÂ ','Italy'),('BergamoÂ ','Italy'),('BiellaÂ ','Italy'),('BresciaÂ ','Italy'),('BrindisiÂ ','Italy'),('CalabriaÂ ','Italy'),('CaltanissettaÂ ','Italy'),('CampaniaÂ ','Italy'),('CampobassoÂ ','Italy'),('CasertaÂ ','Italy'),('CatanzaroÂ ','Italy'),('ChietiÂ ','Italy'),('ComoÂ ','Italy'),('CosenzaÂ ','Italy'),('CremonaÂ ','Italy'),('CrotoneÂ ','Italy'),('CuneoÂ ','Italy'),('Emilia-RomagnaÂ ','Italy'),('EnnaÂ ','Italy'),('FermoÂ ','Italy'),('FerraraÂ ','Italy'),('FoggiaÂ ','Italy'),('ForlÃ¬-CesenaÂ ','Italy'),('Friuliâ€“Venezia GiuliaÂ ','Italy'),('FrosinoneÂ ','Italy'),('GoriziaÂ ','Italy'),('GrossetoÂ ','Italy'),('ImperiaÂ ','Italy'),('IserniaÂ ','Italy'),('L\'AquilaÂ ','Italy'),('La SpeziaÂ ','Italy'),('LatinaÂ ','Italy'),('LazioÂ ','Italy'),('LecceÂ ','Italy'),('LeccoÂ ','Italy'),('LiguriaÂ ','Italy'),('LivornoÂ ','Italy'),('LodiÂ ','Italy'),('LombardyÂ ','Italy'),('LuccaÂ ','Italy'),('MacerataÂ ','Italy'),('MantuaÂ ','Italy'),('MarcheÂ ','Italy'),('Massa and CarraraÂ ','Italy'),('MateraÂ ','Italy'),('Medio CampidanoÂ ','Italy'),('ModenaÂ ','Italy'),('MoliseÂ ','Italy'),('Monza and BrianzaÂ ','Italy'),('NovaraÂ ','Italy'),('NuoroÂ ','Italy'),('OristanoÂ ','Italy'),('PaduaÂ ','Italy'),('PalermoÂ ','Italy'),('ParmaÂ ','Italy'),('PaviaÂ ','Italy'),('PerugiaÂ ','Italy'),('Pesaro and UrbinoÂ ','Italy'),('PescaraÂ ','Italy'),('PiacenzaÂ ','Italy'),('PiedmontÂ ','Italy'),('PisaÂ ','Italy'),('PistoiaÂ ','Italy'),('PordenoneÂ ','Italy'),('PotenzaÂ ','Italy'),('PratoÂ ','Italy'),('RagusaÂ ','Italy'),('RavennaÂ ','Italy'),('Reggio EmiliaÂ ','Italy'),('RietiÂ ','Italy'),('RiminiÂ ','Italy'),('RovigoÂ ','Italy'),('SalernoÂ ','Italy'),('SardiniaÂ ','Italy'),('SassariÂ ','Italy'),('SavonaÂ ','Italy'),('SicilyÂ ','Italy'),('SienaÂ ','Italy'),('SiracusaÂ ','Italy'),('SondrioÂ ','Italy'),('South SardiniaÂ ','Italy'),('TarantoÂ ','Italy'),('TeramoÂ ','Italy'),('TerniÂ ','Italy'),('TrapaniÂ ','Italy'),('Trentino-South TyrolÂ ','Italy'),('TrevisoÂ ','Italy'),('TriesteÂ ','Italy'),('TuscanyÂ ','Italy'),('UdineÂ ','Italy'),('UmbriaÂ ','Italy'),('VareseÂ ','Italy'),('VenetoÂ ','Italy'),('Verbano-Cusio-OssolaÂ ','Italy'),('VercelliÂ ','Italy'),('VeronaÂ ','Italy'),('Vibo ValentiaÂ ','Italy'),('VicenzaÂ ','Italy'),('ViterboÂ ','Italy'),('Aichi PrefectureÂ ','Japan'),('Akita PrefectureÂ ','Japan'),('Aomori PrefectureÂ ','Japan'),('Chiba PrefectureÂ ','Japan'),('Ehime PrefectureÂ ','Japan'),('Fukui PrefectureÂ ','Japan'),('Fukuoka PrefectureÂ ','Japan'),('Fukushima PrefectureÂ ','Japan'),('Gifu PrefectureÂ ','Japan'),('Gunma PrefectureÂ ','Japan'),('Hiroshima PrefectureÂ ','Japan'),('HokkaidÅ PrefectureÂ ','Japan'),('HyÅgo PrefectureÂ ','Japan'),('Ibaraki PrefectureÂ ','Japan'),('Ishikawa PrefectureÂ ','Japan'),('Iwate PrefectureÂ ','Japan'),('Kagawa PrefectureÂ ','Japan'),('Kagoshima PrefectureÂ ','Japan'),('Kanagawa PrefectureÂ ','Japan'),('KÅchi PrefectureÂ ','Japan'),('Kumamoto PrefectureÂ ','Japan'),('KyÅto PrefectureÂ ','Japan'),('Mie PrefectureÂ ','Japan'),('Miyagi PrefectureÂ ','Japan'),('Miyazaki PrefectureÂ ','Japan'),('Nagano PrefectureÂ ','Japan'),('Nagasaki PrefectureÂ ','Japan'),('Nara PrefectureÂ ','Japan'),('Niigata PrefectureÂ ','Japan'),('ÅŒita PrefectureÂ ','Japan'),('Okayama PrefectureÂ ','Japan'),('Okinawa PrefectureÂ ','Japan'),('ÅŒsaka PrefectureÂ ','Japan'),('Saga PrefectureÂ ','Japan'),('Saitama PrefectureÂ ','Japan'),('Shiga PrefectureÂ ','Japan'),('Shimane PrefectureÂ ','japan'),('Shizuoka PrefectureÂ ','Japan'),('Tochigi PrefectureÂ ','Japan'),('Tokushima PrefectureÂ ','japan'),('TokyoÂ ','Japan'),('Tottori PrefectureÂ ','Japan'),('Toyama PrefectureÂ ','japan'),('Wakayama PrefectureÂ ','Japan'),('Yamagata PrefectureÂ ','Japan'),('Yamaguchi PrefectureÂ ','Japan'),('Yamanashi PrefectureÂ ','Japan'),('Al AhmadiÂ ','Kuwait'),('Al FarwaniyahÂ ','Kuwait'),('Al JahraÂ ','Kuwait'),('CapitalÂ ','Kuwait'),('HawalliÂ ','Kuwait'),('Mubarak Al-KabeerÂ ','Kuwait'),('JohorÂ ','Malaysia'),('KedahÂ ','Malaysia'),('KelantanÂ ','Malaysia'),('Kuala LumpurÂ ','Malaysia'),('LabuanÂ ','Malaysia'),('MalaccaÂ ','Malaysia'),('Negeri SembilanÂ ','Malaysia'),('PahangÂ ','Malaysia'),('PenangÂ ','Malaysia'),('PerakÂ ','Malaysia'),('PerlisÂ ','Malaysia'),('PutrajayaÂ ','Malaysia'),('SabahÂ ','Malaysia'),('SarawakÂ ','Malaysia'),('SelangorÂ ','Malaysia'),('TerengganuÂ ','Malaysia'),('Auckland RegionÂ ','New zealand'),('Bay of Plenty RegionÂ ','New zealand'),('Canterbury RegionÂ ','New zealand'),('Chatham IslandsÂ ','New zealand'),('Gisborne DistrictÂ ','New zealand'),('Hawke\'s Bay RegionÂ ','New zealand'),('Manawatu-Wanganui RegionÂ ','New zealand'),('Marlborough RegionÂ ','New zealand'),('Nelson RegionÂ ','New zealand'),('Northland RegionÂ ','New zealand'),('Otago RegionÂ ','New zealand'),('Southland RegionÂ ','New zealand'),('Taranaki RegionÂ ','New zealand'),('Tasman DistrictÂ ','New zealand'),('Waikato RegionÂ ','New zealand'),('Wellington RegionÂ ','New zealand'),('West Coast RegionÂ ','New zealand'),('Altai KraiÂ ','Russia'),('Altai RepublicÂ ','Russia'),('Amur Oblast','Russia'),('Arkhangelsk','Russia'),('Astrakhan OblastÂ ','Russia'),('Belgorod OblastÂ ','Russia'),('Bryansk OblastÂ ','Russia'),('Chechen RepublicÂ ','Russia'),('Chelyabinsk OblastÂ ','Russia'),('Chukotka Autonomous OkrugÂ ','Russia'),('Chuvash RepublicÂ ','Russia'),('IrkutskÂ ','Russia'),('Ivanovo OblastÂ ','Russia'),('Jewish Autonomous OblastÂ ','Russia'),('Kabardino-Balkar RepublicÂ ','Russia'),('KaliningradÂ ','Russia'),('Kaluga OblastÂ ','Russia'),('Kamchatka KraiÂ ','Russia'),('Karachay-Cherkess RepublicÂ ','Russia'),('Kemerovo OblastÂ ','Russia'),('Khabarovsk KraiÂ ','Russia'),('Khanty-Mansi Autonomous OkrugÂ ','Russia'),('Kirov OblastÂ ','Russia'),('Komi RepublicÂ ','Russia'),('Kostroma OblastÂ ','Russia'),('Krasnodar KraiÂ ','Russia'),('Krasnoyarsk KraiÂ ','Russia'),('Kurgan OblastÂ ','Russia'),('Kursk OblastÂ ','Russia'),('Leningrad OblastÂ ','Russia'),('Lipetsk OblastÂ ','Russia'),('Magadan OblastÂ ','Russia'),('Mari El RepublicÂ ','Russia'),('MoscowÂ ','Russia'),('Moscow OblastÂ ','Russia'),('Murmansk OblastÂ ','Russia'),('Nenets Autonomous OkrugÂ ','Russia'),('Nizhny Novgorod OblastÂ ','Russia'),('Novgorod OblastÂ ','Russia'),('NovosibirskÂ ','Russia'),('Omsk OblastÂ ','Russia'),('Orenburg OblastÂ ','Russia'),('Oryol OblastÂ ','Russia'),('Penza OblastÂ ','Russia'),('Perm KraiÂ ','Russia'),('Primorsky KraiÂ ','Russia'),('Pskov OblastÂ ','Russia'),('Republic of AdygeaÂ ','Russia'),('Republic of BashkortostanÂ ','Russia'),('Republic of BuryatiaÂ ','Russia'),('Republic of DagestanÂ ','Russia'),('Republic of IngushetiaÂ ','Russia'),('Republic of KalmykiaÂ ','Russia'),('Republic of KareliaÂ ','Russia'),('Republic of KhakassiaÂ ','Russia'),('Republic of MordoviaÂ ','Russia'),('Republic of North Ossetia-AlaniaÂ ','Russia'),('Republic of TatarstanÂ ','Russia'),('Rostov OblastÂ ','Russia'),('Ryazan OblastÂ ','Russia'),('Saint PetersburgÂ ','Russia'),('Sakha RepublicÂ ','Russia'),('SakhalinÂ ','Russia'),('Samara OblastÂ ','Russia'),('Saratov OblastÂ ','Russia'),('SevastopolÂ ','Russia'),('Smolensk OblastÂ ','Russia'),('Stavropol KraiÂ ','Russia'),('SverdlovskÂ ','Russia'),('Tambov OblastÂ ','Russia'),('Tomsk OblastÂ ','Russia'),('Tula OblastÂ ','Russia'),('Tuva RepublicÂ ','Russia'),('Tver OblastÂ ','Russia'),('Tyumen OblastÂ ','Russia'),('Udmurt RepublicÂ ','Russia'),('Ulyanovsk OblastÂ ','Russia'),('Vladimir OblastÂ ','Russia'),('Volgograd OblastÂ ','Russia'),('Vologda OblastÂ ','Russia'),('Voronezh OblastÂ ','Russia'),('Yamalo-Nenets Autonomous OkrugÂ ','Russia'),('Yaroslavl OblastÂ ','Russia'),('Zabaykalsky KraiÂ ','Russia'),('Al BahahÂ ','Saudi Arabia'),('Al JawfÂ ','Saudi Arabia'),('Al MadinahÂ ','Saudi Arabia'),('Al-QassimÂ ','Saudi Arabia'),('AsirÂ ','Saudi Arabia'),('Eastern ProvinceÂ ','Saudi Arabia'),('Ha\'ilÂ ','Saudi Arabia'),('JizanÂ ','Saudi Arabia'),('MakkahÂ ','Saudi Arabia'),('NajranÂ ','Saudi Arabia'),('Northern BordersÂ ','Saudi Arabia'),('RiyadhÂ ','Saudi Arabia'),('TabukÂ ','Saudi Arabia'),('Central Singapore Community Development CouncilÂ ','Singapore'),('North East Community Development CouncilÂ ','Singapore'),('North West Community Development CouncilÂ ','Singapore'),('South East Community Development CouncilÂ ','Singapore'),('South West Community Development CouncilÂ ','Singapore'),('Abu Dhabi EmirateÂ AZ','UAE'),('Ajman EmirateÂ ','UAE'),('DubaiÂ ','UAE'),('FujairahÂ ','UAE'),('Ras al-KhaimahÂ ','UAE'),('Sharjah EmirateÂ ','UAE'),('Umm al-QuwainÂ ','UAE'),('Aberdeen','UK'),('Aberdeenshire','UK'),('AngusÂ ','UK'),('AntrimÂ ','UK'),('Antrim and NewtownabbeyÂ ','UK'),('ArdsÂ ','UK'),('Ards and North DownÂ ','UK'),('Argyll and ButeÂ ','UK'),('Armagh City and District CouncilÂ ','UK'),('Armagh, Banbridge and CraigavonÂ ','UK'),('Ascension IslandÂ ','UK'),('Ballymena BoroughÂ ','UK'),('BallymoneyÂ ','UK'),('BanbridgeÂ ','UK'),('BarnsleyÂ ','UK'),('Bath and North East SomersetÂ ','UK'),('BedfordÂ ','UK'),('Belfast districtÂ ','UK'),('BirminghamÂ ','UK'),('Blackburn with DarwenÂ ','UK'),('BlackpoolÂ ','UK'),('Blaenau Gwent County BoroughÂ ','UK'),('BoltonÂ ','UK'),('BournemouthÂ ','UK'),('Bracknell ForestÂ ','UK'),('BradfordÂ ','UK'),('Bridgend County BoroughÂ ','UK'),('Brighton and HoveÂ ','UK'),('BuckinghamshireÂ ','UK'),('BuryÂ ','UK'),('Caerphilly County BoroughÂ ','UK'),('CalderdaleÂ ','UK'),('CambridgeshireÂ ','UK'),('CarmarthenshireÂ ','UK'),('Carrickfergus Borough CouncilÂ ','UK'),('CastlereaghÂ ','UK'),('Causeway Coast and GlensÂ ','UK'),('Central BedfordshireÂ ','UK'),('CeredigionÂ ','UK'),('Cheshire EastÂ ','UK'),('Cheshire West and ChesterÂ ','UK'),('City and County of CardiffÂ ','UK'),('City and County of SwanseaÂ ','UK'),('City of BristolÂ ','UK'),('City of DerbyÂ ','UK'),('City of Kingston upon HullÂ ','UK'),('City of LeicesterÂ ','UK'),('City of LondonÂ ','UK'),('City of NottinghamÂ ','UK'),('City of PeterboroughÂ ','UK'),('City of PlymouthÂ ','UK'),('City of PortsmouthÂ ','UK'),('City of SouthamptonÂ ','UK'),('City of Stoke-on-TrentÂ ','UK'),('City of SunderlandÂ ','UK'),('City of WestminsterÂ ','UK'),('City of WolverhamptonÂ ','UK'),('City of YorkÂ ','UK'),('ClackmannanshireÂ ','UK'),('Coleraine Borough CouncilÂ ','UK'),('Conwy County BoroughÂ ','UK'),('Cookstown District CouncilÂ ','UK'),('CornwallÂ ','UK'),('County DurhamÂ ','UK'),('CoventryÂ ','UK'),('Craigavon Borough CouncilÂ ','UK'),('CumbriaÂ ','UK'),('DarlingtonÂ ','UK'),('DenbighshireÂ ','UK'),('DerbyshireÂ ','UK'),('Derry City and StrabaneÂ ','UK'),('Derry City CouncilÂ ','UK'),('DevonÂ ','UK'),('DoncasterÂ ','UK'),('DorsetÂ ','UK'),('Down District CouncilÂ ','UK'),('DudleyÂ ','UK'),('Dumfries and GallowayÂ ','UK'),('DundeeÂ ','UK'),('Dungannon and South Tyrone Borough CouncilÂ ','UK'),('East AyrshireÂ ','UK'),('East DunbartonshireÂ ','UK'),('East LothianÂ ','UK'),('East RenfrewshireÂ ','UK'),('East Riding of YorkshireÂ ','UK'),('East SussexÂ ','UK'),('EdinburghÂ ','UK'),('EnglandÂ ','UK'),('EssexÂ ','UK'),('FalkirkÂ ','UK'),('Fermanagh and OmaghÂ ','UK'),('Fermanagh District CouncilÂ ','UK'),('FifeÂ ','UK'),('FlintshireÂ ','UK'),('GatesheadÂ ','UK'),('GlasgowÂ ','UK'),('GloucestershireÂ ','UK'),('GwyneddÂ ','UK'),('HaltonÂ ','UK'),('HampshireÂ ','UK'),('HartlepoolÂ ','UK'),('HerefordshireÂ ','UK'),('HertfordshireÂ ','UK'),('HighlandÂ ','UK'),('InverclydeÂ ','UK'),('Isle of WightÂ ','UK'),('Isles of ScillyÂ ','UK'),('KentÂ ','UK'),('KirkleesÂ ','UK'),('KnowsleyÂ ','UK'),('LancashireÂ ','UK'),('Larne Borough CouncilÂ ','UK'),('LeedsÂ ','UK'),('LeicestershireÂ ','UK'),('Limavady Borough CouncilÂ ','UK'),('LincolnshireÂ ','UK'),('Lisburn and CastlereaghÂ ','UK'),('Lisburn City CouncilÂ ','UK'),('LiverpoolÂ ','UK'),('London Borough of Barking and DagenhamÂ BDG','UK'),('London Borough of BarnetÂ ','UK'),('London Borough of BexleyÂ ','UK'),('London Borough of BrentÂ ','UK'),('London Borough of BromleyÂ ','UK'),('London Borough of CamdenÂ ','UK'),('London Borough of CroydonÂ ','UK'),('London Borough of EalingÂ ','UK'),('London Borough of EnfieldÂ ','UK'),('London Borough of HackneyÂ ','UK'),('London Borough of Hammersmith and FulhamÂ ','UK'),('London Borough of HaringeyÂ ','UK'),('London Borough of HarrowÂ ','UK'),('London Borough of HaveringÂ ','UK'),('London Borough of HillingdonÂ ','UK'),('London Borough of HounslowÂ ','UK'),('London Borough of IslingtonÂ ','UK'),('London Borough of LambethÂ ','UK'),('London Borough of LewishamÂ ','UK'),('London Borough of MertonÂ ','UK'),('London Borough of NewhamÂ ','UK'),('London Borough of RedbridgeÂ ','UK'),('London Borough of Richmond upon ThamesÂ ','UK'),('London Borough of SouthwarkÂ ','UK'),('London Borough of SuttonÂ ','UK'),('London Borough of Tower HamletsÂ ','UK'),('London Borough of Waltham ForestÂ ','UK'),('London Borough of WandsworthÂ ','UK'),('Magherafelt District CouncilÂ ','UK'),('ManchesterÂ ','UK'),('MedwayÂ ','UK'),('Merthyr Tydfil County BoroughÂ ','UK'),('Metropolitan Borough of WiganÂ ','UK'),('Mid and East AntrimÂ ','UK'),('Mid UlsterÂ ','UK'),('MiddlesbroughÂ ','UK'),('MidlothianÂ ','UK'),('Milton KeynesÂ ','UK'),('MonmouthshireÂ ','UK'),('MorayÂ ','UK'),('Moyle District CouncilÂ ','UK'),('Neath Port Talbot County BoroughÂ ','UK'),('Newcastle upon TyneÂ ','UK'),('NewportÂ ','UK'),('Newry and Mourne District CouncilÂ ','UK'),('Newry, Mourne and DownÂ ','UK'),('Newtownabbey Borough CouncilÂ ','UK'),('NorfolkÂ ','UK'),('North AyrshireÂ ','UK'),('North Down Borough CouncilÂ ','UK'),('North East LincolnshireÂ ','UK'),('North LanarkshireÂ ','UK'),('North LincolnshireÂ ','UK'),('North SomersetÂ ','UK'),('North TynesideÂ ','UK'),('North YorkshireÂ ','UK'),('NorthamptonshireÂ ','UK'),('Northern IrelandÂ ','UK'),('NorthumberlandÂ ','UK'),('NottinghamshireÂ ','UK'),('OldhamÂ ','UK'),('Omagh District CouncilÂ ','UK'),('Orkney IslandsÂ ','UK'),('Outer HebridesÂ ','UK'),('OxfordshireÂ ','UK'),('PembrokeshireÂ ','UK'),('Perth and KinrossÂ ','UK'),('PooleÂ ','UK'),('PowysÂ ','UK'),('ReadingÂ ','UK'),('Redcar and ClevelandÂ ','UK'),('RenfrewshireÂ ','UK'),('Rhondda Cynon TafÂ ','UK'),('RochdaleÂ ','UK'),('RotherhamÂ ','UK'),('Royal Borough of GreenwichÂ ','UK'),('Royal Borough of Kensington and ChelseaÂ ','UK'),('Royal Borough of Kingston upon ThamesÂ ','UK'),('RutlandÂ ','UK'),('Saint HelenaÂ ','UK'),('SalfordÂ ','UK'),('SandwellÂ ','UK'),('ScotlandÂ ','UK'),('Scottish BordersÂ ','UK'),('SeftonÂ ','UK'),('SheffieldÂ ','UK'),('Shetland IslandsÂ ','UK'),('ShropshireÂ ','UK'),('SloughÂ ','UK'),('SolihullÂ ','UK'),('SomersetÂ ','UK'),('South AyrshireÂ ','UK'),('South GloucestershireÂ ','UK'),('South LanarkshireÂ ','UK'),('South TynesideÂ ','UK'),('Southend-on-SeaÂ ','UK'),('St HelensÂ ','UK'),('StaffordshireÂ ','UK'),('StirlingÂ ','UK'),('StockportÂ ','UK'),('Stockton-on-TeesÂ ','UK'),('Strabane District CouncilÂ ','UK'),('SuffolkÂ ','UK'),('SurreyÂ ','UK'),('SwindonÂ ','UK'),('TamesideÂ ','UK'),('Telford and WrekinÂ ','UK'),('ThurrockÂ ','UK'),('TorbayÂ ','UK'),('TorfaenÂ ','UK'),('TraffordÂ ','UK'),('United KingdomÂ ','UK'),('Vale of GlamorganÂ ','UK'),('WakefieldÂ ','UK'),('WalesÂ ','UK'),('WalsallÂ ','UK'),('WarringtonÂ ','UK'),('WarwickshireÂ ','UK'),('West BerkshireÂ ','UK'),('West DunbartonshireÂ ','UK'),('West LothianÂ ','UK'),('West SussexÂ ','UK'),('WiltshireÂ ','UK'),('Windsor and MaidenheadÂ ','UK'),('WirralÂ ','UK'),('WokinghamÂ ','UK'),('WorcestershireÂ ','UK'),('Wrexham County BoroughÂ ','UK'),('Alabama','United States'),('Alaska','United States'),('American Samoa','United States'),('Arizona','United States'),('Arkansas','United States'),('Baker Island','United States'),('California','United States'),('Colorado','United States'),('Connecticut','United States'),('Delaware','United States'),('District of Columbia','United States'),('Florida','United States'),('Georgia','United States'),('Guam','United States'),('Hawaii','United States'),('Howland Island','United States'),('Idaho','United States'),('Illinois','United States'),('Indiana','United States'),('Iowa','United States'),('Jarvis Island','United States'),('Johnston Atoll','United States'),('Kansas','United States'),('Kentucky','United States'),('Kingman Reef','United States'),('Louisiana','United States'),('Maine','United States'),('Maryland','United States'),('Massachusetts','United States'),('Michigan','United States'),('Midway Atoll','United States'),('Minnesota','United States'),('Mississippi','United States'),('Missouri','United States'),('Montana','United States'),('Navassa Island','United States'),('Nebraska','United States'),('Nevada','United States'),('New Hampshire','United States'),('New Jersey','United States'),('New Mexico','United States'),('New York','United States'),('North Carolina','United States'),('North DakotaÂ ','United States'),('Northern Mariana IslandsÂ ','United States'),('Ohio','United States'),('Oklahoma','United States'),('OregonÂ ','United States'),('Palmyra AtollÂ ','United States'),('PennsylvaniaÂ ','United States'),('Puerto RicoÂ ','United States'),('Rhode IslandÂ ','United States'),('South CarolinaÂ ','United States'),('South DakotaÂ ','United States'),('TennesseeÂ ','United States'),('TexasÂ ','United States'),('United States Minor Outlying IslandsÂ ','United States'),('United States Virgin IslandsÂ ','United States'),('UtahÂ ','United States'),('VermontÂ ','United States'),('VirginiaÂ ','United States'),('Wake IslandÂ ','United States'),('WashingtonÂ ','United States'),('West VirginiaÂ ','United States'),('WisconsinÂ ','United States'),('WyomingÂ ','United States');

/*!40000 ALTER TABLE `report_text_content` DISABLE KEYS */;
INSERT INTO `report_text_content` VALUES (1,'Relieving Letter','<p>\nIn reference to your resignation dated <b>{date_of_resignation}</b> stating your intention to resign from\nposition of <b>{designation}</b> held at DBQ TECHNOLOGIES PRIVATE LIMITED. We would like to inform\nyou that your resignation from the services of the Organization has been accepted.<br>\n</p>\n<p>\nYou will be relieved from all your duties and responsibilities at the close of office hours of\n<b>{date_of_relieve}</b>.<br>\n</p>\n<p>\nYour experience certificate shall be issued to you subject to the Full &amp; Final Settlement of\ndues, if any.\n</p>\n<br>\n<p>\nWe thank you for your services in DBQ TECHNOLOGIES PRIVATE LIMITED and wish you success in your\nfuture endeavours.\n</p>'),(2,'Experience Letter','<p>\nThis is to certify that <b>{name}</b>, Employee code <b>{emp_code}</b> was\nan employee of DBQ TECHNOLOGIES PRIVATE LIMITED. from <b>{date_of_join}</b> till <b>{date_of_relieve}</b>. As per our\nrecords, his last designation at the time of exit from the company was <b>{designation}</b>.\n<br>\n</p>\n<p>\nWe wish <b>{name}</b> all the best in his future endeavours.\n</p>');
/*!40000 ALTER TABLE `report_text_content` ENABLE KEYS */;

/*!40000 ALTER TABLE `service_request_type_list` DISABLE KEYS */;
INSERT INTO `service_request_type_list` VALUES ('Form 16'),('Laptop'),('Laptop Accessories'),('Others'),('Payslip');
/*!40000 ALTER TABLE `service_request_type_list` ENABLE KEYS */;

/*!40000 ALTER TABLE `company_policy_list` DISABLE KEYS */;
INSERT INTO `company_policy_list` VALUES ('Claim Policy'),('Compoff Policy'),('Interview Process'),('Leave Policy'),('Notice Period'),('Weekend Allowances');
/*!40000 ALTER TABLE `company_policy_list` ENABLE KEYS */;

/*!40000 ALTER TABLE `scheduler_run` DISABLE KEYS */;
INSERT INTO `scheduler_run` VALUES (1);
/*!40000 ALTER TABLE `scheduler_run` ENABLE KEYS */;

/*!40000 ALTER TABLE `org_project_list` DISABLE KEYS */;
INSERT INTO `org_project_list` VALUES (1,'ORG','Organization Activities','Y',0),(2,'TRN','Trainings','Y',0),(3,'AUD','AUDIT','Y',0),(4,'LVE','Leave','Y',0);
/*!40000 ALTER TABLE `org_project_list` ENABLE KEYS */;

/*!40000 ALTER TABLE `org_project_task` DISABLE KEYS */;
INSERT INTO `org_project_task` VALUES (1,'Organization Behaviour',1,'Y'),(2,'SKILL Training',2,'Y'),(3,'Behaviour Training',2,'Y'),(4,'Security Training',2,'Y'),(5,'Audit',3,'Y'),(6,'Leave',4,'Y');
/*!40000 ALTER TABLE `org_project_task` ENABLE KEYS */;

INSERT INTO `pf_setting_details` VALUES (1,1800,2);

LOCK TABLES `itdeclaration_settings` WRITE;
/*!40000 ALTER TABLE `itdeclaration_settings` DISABLE KEYS */;
INSERT INTO `itdeclaration_settings` VALUES (1,'2024-12-25','2025-03-20','2024-2025','IT_Declaration');
/*!40000 ALTER TABLE `itdeclaration_settings` ENABLE KEYS */;
UNLOCK TABLES;
INSERT INTO `performance_settings` VALUES (1,'2024-04-01','2024-04-30','2024-2025','self'),(2,'2024-04-01','2024-05-10','2024-2025','rm'),(3,'2024-04-01','2024-05-20','2024-2025','reviewer');

INSERT INTO `performance_setting_eligible` VALUES (1,11,0,'2024-2025','performance_rating');


DELIMITER //
CREATE DEFINER=`epadmin`@`%` PROCEDURE `dbqportal`.`data_process_onboard`(IN empCode CHAR(100),IN password CHAR(100))
BEGIN
	DECLARE countRecordPers INT;
    DECLARE countRecordLogin INT;
    DECLARE countRecordUserPhoto INT;
   SET countRecordPers = (select Count(*) cnt from emp_personaldata pr join employee_master em on em.emp_email = pr.emp_id where em.emp_code=empCode);
   SET countRecordLogin = (select Count(*) cnt from employee_login_details eld join employee_master em on em.emp_email = eld.emp_email where em.emp_code=empCode);
   SET countRecordUserPhoto = (select Count(*) cnt from emp_personal_profile_photo eld join employee_master em on em.emp_email = eld.emp_id where em.emp_code=empCode);
 IF(countRecordPers <1) THEN
     insert into emp_personaldata (emp_id,preferred_name,form_of_address,first_name,middle_name,last_name,country_of_birth)
     select em.emp_email , concat(IFNULL(em.form_of_address,''),' ',IFNULL(em.emp_name,''),' ',IFNULL(em.middle_name,''),' ',IFNULL(em.last_name,'')) as name,  IFNULL(em.form_of_address,''),IFNULL(em.emp_name,''),IFNULL(em.middle_name,''),IFNULL(em.last_name,'') ,em.country_of_birth 
     from employee_master em where em.emp_code=empCode;
 ELSE 
  UPDATE emp_personaldata pers
  INNER JOIN employee_master ms ON pers.emp_id=ms.emp_email and  ms.emp_code=empCode
  SET 
  pers.preferred_name=concat(IFNULL(ms.form_of_address,''),' ',IFNULL(ms.emp_name,''),' ',IFNULL(ms.middle_name,''),' ',IFNULL(ms.last_name,'')),
  pers.form_of_address=IFNULL(ms.form_of_address,''),
  pers.first_name=IFNULL(ms.emp_name,''),
  pers.middle_name=IFNULL(ms.middle_name,''),
  pers.last_name=IFNULL(ms.last_name,''),
  pers.country_of_birth=ms.country_of_birth ;
 END IF;
IF(countRecordLogin <1) THEN
   insert into employee_login_details (emp_email,emp_password,is_active) select em.emp_email ,AES_ENCRYPT(password ,'mydbq@2023') as pwd,'Y' as is_active from employee_master em where em.emp_code=empCode;
ELSE
    UPDATE employee_login_details set is_active='Y',emp_password=AES_ENCRYPT(password ,'mydbq@2023') where emp_email =(select em.emp_email from employee_master em where em.emp_code=empCode);
END IF;
IF(countRecordUserPhoto <1) THEN
   insert into emp_personal_profile_photo (emp_id,profile_photo) select em.emp_email ,em.picture from employee_master em where em.emp_code=empCode;
ELSE
     UPDATE emp_personal_profile_photo pers
     INNER JOIN employee_master ms ON pers.emp_id=ms.emp_email and  ms.emp_code=empCode
     SET 
     pers.profile_photo=ms.picture ;
END IF;
update employee_master em set em.process_data=1 where em.emp_code=empCode; 
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`epadmin`@`%` PROCEDURE `dbqportal`.`change_reset_pwd`(IN empid CHAR(100),IN newPwd CHAR(100),IN oldPwd CHAR(100))
BEGIN
	DECLARE countRow INT;
    DECLARE countTotlRecord INT;
	UPDATE employee_login_details el set el.emp_password =AES_ENCRYPT(newPwd ,'mydbq@2023'),el.last_pwd_change_date =CURDATE(),el.is_active='Y',el.is_lock=0 ,el.isinitial_pwd_change='Y'
    WHERE el.emp_email =empid and AES_DECRYPT(el.emp_password, 'mydbq@2023')=oldPwd;
   SET countRow= ROW_COUNT();
   IF(countRow >0) THEN
     INSERT INTO emp_pwd_history (emp_id,pwd) values(empid,AES_ENCRYPT(newPwd ,'mydbq@2023'));
   END IF;
   SET countTotlRecord = (SELECT COUNT(*) FROM emp_pwd_history where emp_id= empid);
   IF(countTotlRecord >3) THEN
     DELETE FROM emp_pwd_history  where emp_id= empid order by id limit 1;
   END IF;
END//
DELIMITER ;

DELIMITER //
CREATE DEFINER=`epadmin`@`%` PROCEDURE `dbqportal`.`approval_rm_change`(IN empcode INT, IN reqtype CHAR(20),IN createdt CHAR(20),IN empid CHAR(100))
BEGIN
	DECLARE countRow INT;
	UPDATE reporting_manager_requests rm1 SET rm1.old_rm_approval = CASE WHEN (rm1.old_rm = empcode and rm1.old_rm_approval='Pending') THEN reqtype  WHEN rm1.old_rm_approval='Pending' THEN 'Pending' WHEN rm1.old_rm_approval='Approved' THEN 'Approved' WHEN rm1.old_rm_approval='Rejected' THEN 'Rejected' END,
    rm1.new_rm_approval = CASE WHEN (rm1.new_rm = empcode  and rm1.new_rm_approval='Pending') THEN reqtype  WHEN rm1.new_rm_approval='Pending' THEN 'Pending' WHEN rm1.new_rm_approval ='Approved' THEN 'Approved' WHEN rm1.new_rm_approval ='Rejected' THEN 'Rejected'  END,
    rm1.status =  CASE WHEN ( (rm1.old_rm_approval IS NULL OR rm1.old_rm_approval='Approved')   and rm1.new_rm_approval='Approved') THEN 'Approved' WHEN (rm1.old_rm_approval='Rejected'  or  rm1.new_rm_approval='Rejected' ) THEN 'Rejected'  WHEN rm1.status ='Pending' THEN 'Pending'  END,
    rm1.approved_date =  CASE WHEN ((rm1.old_rm_approval IS NULL OR rm1.old_rm_approval='Approved')  and rm1.new_rm_approval='Approved') THEN CURDATE()  END
    where  rm1.created_date =createdt and rm1.emp_id =empid;
  SET countRow= ROW_COUNT();
  IF(countRow >0) THEN  
   UPDATE reporting_manager rm
   JOIN (
     select count(*) as cnt from reporting_manager_requests  where status='Approved' and created_date =createdt and emp_id =empid
    )t2 on t2.cnt=1 
    set rm.end_date =(select DATE_SUB(begin_date,INTERVAL 1 DAY) as dt from reporting_manager_requests  where status='Approved' and created_date =createdt and emp_id =empid)
    where rm.emp_id=empid and (rm.end_date is null or rm.end_date='');
   insert into reporting_manager (emp_id,manager_code,begin_date)
   select emp_id ,new_rm ,DATE_FORMAT(begin_date,'%Y-%m-%d') as dt from reporting_manager_requests  where status='Approved' and created_date =createdt and emp_id =empid and NOT EXISTS (select * from reporting_manager rm where rm.emp_id=empid and (rm.end_date is null or rm.end_date=''));
  END IF;
  select (CASE WHEN (rm.old_rm = empcode and rm.old_rm_approval='Approved' and rm.status not in('Approved')) THEN 1 WHEN (rm.new_rm = empcode and rm.new_rm_approval ='Approved' and rm.status not in('Approved')) THEN 2 WHEN (rm.status='Approved') THEN 3 WHEN (rm.status='Rejected') THEN 4 WHEN (rm.status='Pending') THEN 0 END) as status  from reporting_manager_requests rm 
  where rm.created_date =createdt and rm.emp_id =empid; 
 /* return status =1 then old rm approve if 2 new rm approve if 3 then fully approved if 4 then rejected if 0 then no updte*/
END//
DELIMITER ;
