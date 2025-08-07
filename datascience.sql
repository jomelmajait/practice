-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2025 at 01:06 PM
-- Server version: 11.7.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datascience`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$EShCFtthalsv6wE0f81AdN$FLDmZ2mug0ZXsWCjcgmk9JWdDOVvdqUAquSgxQAop1w=', '2025-07-14 09:57:52.128901', 1, 'jomel', '', '', 'majaitjomel23@gmail.com', 1, 1, '2025-07-14 09:53:51.824610');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'main_app', 'genderemployeeprofile'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-07-14 09:41:12.413043'),
(2, 'auth', '0001_initial', '2025-07-14 09:41:31.935636'),
(3, 'admin', '0001_initial', '2025-07-14 09:41:34.894227'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-07-14 09:41:35.036068'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-07-14 09:41:35.054512'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-07-14 09:41:37.091560'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-07-14 09:41:38.458961'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-07-14 09:41:39.283399'),
(9, 'auth', '0004_alter_user_username_opts', '2025-07-14 09:41:39.339760'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-07-14 09:41:40.732005'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-07-14 09:41:40.780755'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-07-14 09:41:40.854149'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-07-14 09:41:41.606034'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-07-14 09:41:42.406772'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-07-14 09:41:43.473958'),
(16, 'auth', '0011_update_proxy_permissions', '2025-07-14 09:41:43.517988'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-07-14 09:41:44.094922'),
(18, 'sessions', '0001_initial', '2025-07-14 09:41:45.289908');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5pefdwj995r2pyei1ie61dupq57ea5jy', '.eJxVjDsOwjAQBe_iGll2WK8cSnrOYO3PJIASKZ8q4u4QKQW0b2be5gqtS1fW2abSq7u46E6_G5M8bdiBPmi4j17GYZl69rviDzr726j2uh7u30FHc_etTZmsBVSIoikIZICoAQRbwUaYolXKZ8BYGTkZxhy4scTCTa5g7v0BAXQ4sw:1ubFwW:nUbzezoAnAObhpjj_mzngv2Rnhxi-H720RZtL9yQMxE', '2025-07-28 09:57:52.225692');

-- --------------------------------------------------------

--
-- Table structure for table `gender_employee_profile`
--

CREATE TABLE `gender_employee_profile` (
  `id` int(11) NOT NULL,
  `campus_assignment` enum('Main Campus','College of Agriculture','DRT Campus','Balagtas Campus','Sta. Maria Campus') DEFAULT NULL,
  `office_affiliation` varchar(100) DEFAULT NULL,
  `employment_status` enum('Permanent','Temporary','Contractual','Job Order / Contract of Service','Full-Time','Part-Time','Project-Based') DEFAULT NULL,
  `type_of_employee` enum('Teaching','Non-Teaching') DEFAULT NULL,
  `sex` enum('Male','Female') DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `marital_status` enum('Single','Married','Widowed','Separated','Other') DEFAULT NULL,
  `years_in_service` int(11) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `height_cm` decimal(5,2) DEFAULT NULL,
  `weight_kg` decimal(5,2) DEFAULT NULL,
  `is_head_of_family` tinyint(1) DEFAULT NULL,
  `is_primary_caregiver` tinyint(1) DEFAULT NULL,
  `is_solo_parent` tinyint(1) DEFAULT NULL,
  `has_children_below_7` tinyint(1) DEFAULT NULL,
  `has_children_with_disabilities` tinyint(1) DEFAULT NULL,
  `is_ip_member` tinyint(1) DEFAULT NULL,
  `is_pwd` tinyint(1) DEFAULT NULL,
  `pwd_types` varchar(255) DEFAULT NULL,
  `household_size` int(11) DEFAULT NULL,
  `household_income_range` enum('<=10000','10001-19999','20000-39999','40000-74999','75000-99999','>=100000') DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `employee_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gender_employee_profile`
--

INSERT INTO `gender_employee_profile` (`id`, `campus_assignment`, `office_affiliation`, `employment_status`, `type_of_employee`, `sex`, `age`, `marital_status`, `years_in_service`, `designation`, `position`, `height_cm`, `weight_kg`, `is_head_of_family`, `is_primary_caregiver`, `is_solo_parent`, `has_children_below_7`, `has_children_with_disabilities`, `is_ip_member`, `is_pwd`, `pwd_types`, `household_size`, `household_income_range`, `address`, `name`, `employee_id`) VALUES
(1, 'Main Campus', 'Auxiliary & Business Office', 'Permanent', 'Teaching', 'Male', 36, 'Married', 9, 'Director', 'Associate Professor II', 167.64, 73.00, 1, 1, 0, 0, 0, 0, 0, NULL, 2, '40000-74999', '', '', ''),
(2, 'Main Campus', 'Auxiliary & Business Office', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 46, 'Married', 5, '', 'Utility', 167.64, 89.00, 1, 0, 0, 0, 0, 0, 0, NULL, 6, '<=10000', 'San Ildefonso', '', ''),
(3, 'Main Campus', 'Auxiliary & Business Office', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 61, 'Widowed', 12, '', 'Support Staff', 177.80, 73.00, 1, 1, 1, 0, 0, 0, 0, NULL, 5, '10001-19999', 'San Ildefonso', '', ''),
(4, 'Main Campus', 'Auxiliary & Business Office', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 29, 'Single', 1, '', 'Support Staff', 162.00, 62.00, 0, 0, 0, 0, 0, 0, 0, NULL, 4, '10001-19999', 'San Ildefonso', '', ''),
(5, 'Main Campus', 'Intellectual Property and Technology Business Management Office', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 22, 'Single', 0, '', 'Support Staff', 172.72, 79.00, 0, 0, 0, 0, 0, 0, 0, NULL, 6, '10001-19999', 'San Ildefonso', '', ''),
(6, 'Main Campus', 'Intellectual Property and Technology Business Management Office', 'Temporary', 'Teaching', 'Female', 30, 'Married', 5, 'Head, Technology Transfer X Commercialization Unit', 'Instructor I', 158.00, 88.00, 0, 1, 0, 1, 0, 0, 0, NULL, 8, '20000-39999', 'San Ildefonso', 'Karen C. Wagan', 'BASC-00251E'),
(7, 'Main Campus', 'Intellectual Property and Technology Business Management Office', 'Temporary', 'Teaching', 'Female', 30, 'Married', 3, 'IPU Head', 'Instructor I', 155.00, 58.80, 0, 0, 0, 0, 0, 0, 0, NULL, 4, '40000-74999', 'San Ildefonso', '', ''),
(8, 'Main Campus', 'Intellectual Property and Technology Business Management Office', 'Permanent', 'Teaching', 'Male', 49, 'Married', 23, 'Director', 'Associate Professor V', 174.00, 85.00, 1, 0, 0, 1, 0, 0, 0, NULL, 5, '20000-39999', 'San Ildefonso', '', ''),
(9, 'Main Campus', 'Intellectual Property and Technology Business Management Office', 'Permanent', 'Teaching', 'Female', 31, 'Married', 8, 'EKMU Head', 'Instructor III', 163.80, 65.00, 0, 1, 0, 0, 0, 0, 0, NULL, 2, '75000-99999', 'San Rafael', '', ''),
(10, 'Main Campus', 'Intellectual Property and Technology Business Management Office', 'Project-Based', 'Non-Teaching', 'Female', 29, 'Married', 4, '', 'Project Tech Assistant II', 153.00, 45.00, 0, 0, 0, 1, 0, 0, 0, NULL, 3, '20000-39999', 'San Miguel', '', ''),
(11, 'Main Campus', 'HRMO', 'Permanent', 'Non-Teaching', 'Male', 34, 'Married', 2, '', 'Clerk II', 175.00, 91.00, 1, 0, 0, 1, 0, 0, 0, '', 3, '40000-74999', '', '', ''),
(12, 'Main Campus', 'HRMO', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 31, 'Single', 2, '', 'Support Staff', 165.00, 60.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '10001-19999', 'San Ildefonso', '', ''),
(13, 'Main Campus', 'HRMO', 'Permanent', 'Non-Teaching', 'Female', 0, 'Married', 4, '', 'Administrative Officer IV', 152.40, 47.00, 0, 0, 0, 1, 0, 0, 0, '', 5, '40000-74999', 'San Ildefonso', '', ''),
(14, 'Main Campus', 'Audit', 'Permanent', 'Non-Teaching', 'Female', 49, 'Married', 4, '', 'Internal Auditor I', 160.02, 57.00, 1, 1, 1, 0, 0, 0, 0, '', 3, '20000-39999', 'San Ildefonso', 'Corazon R. Ababa', '00113E'),
(15, 'Main Campus', 'Audit', 'Permanent', 'Non-Teaching', 'Female', 41, 'Separated', 7, '', '', 156.00, 71.00, 1, 1, 1, 0, 0, 0, 1, 'Visual Impairment', 6, '40000-74999', 'San Miguel', '', ''),
(16, 'Main Campus', 'OVPAA', 'Permanent', 'Non-Teaching', 'Female', 33, 'Single', 3, '', 'Admin Aide VI', 168.00, 72.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '40000-74999', 'San Ildefonso', '', ''),
(17, 'Main Campus', 'OVPAA', 'Permanent', 'Non-Teaching', 'Female', 31, 'Married', 2, 'Secretary', 'ADAS III', 180.34, 56.00, 1, 0, 0, 1, 0, 0, 0, '', 4, '20000-39999', 'Bulacan', '', ''),
(18, 'Main Campus', 'OBS', 'Permanent', 'Non-Teaching', 'Female', 32, 'Single', 8, '', 'Board Secretary', 168.00, 62.00, 0, 1, 0, 0, 0, 0, 0, '', 2, '75000-99999', 'San Ildefonso', '', ''),
(19, 'Main Campus', 'OBS', 'Permanent', 'Non-Teaching', 'Female', 34, 'Married', 2, '', 'Admin Assistant', 150.00, 58.00, 0, 1, 0, 1, 1, 0, 1, 'Speech Impairment', 7, '20000-39999', 'San Ildefonso', '', ''),
(20, 'Main Campus', 'PSMO', 'Permanent', 'Non-Teaching', 'Male', 27, 'Single', 0, 'Staff', 'Aide VI', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '10001-19999', 'San Ildefonso', '', ''),
(21, 'Main Campus', 'PSMO', 'Permanent', 'Non-Teaching', 'Male', 44, 'Married', 0, '', 'AOI', 160.00, 73.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '20000-39999', '', '', ''),
(22, 'Main Campus', 'PSMO', 'Permanent', 'Non-Teaching', 'Female', 29, 'Single', 2, '', 'Admin Assistant II', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 1, 'Visual Impairment', 6, '20000-39999', 'San Ildefonso', '', ''),
(23, 'Main Campus', 'OSA', 'Permanent', 'Teaching', 'Female', 48, 'Married', 0, 'Director', 'Associate Professor', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '40000-74999', 'San Ildefonso', '', ''),
(24, 'Main Campus', 'MIS', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 21, 'Single', 0, '', 'Support Staff', 172.00, 100.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '10001-19999', '', '', ''),
(25, 'Main Campus', 'MIS', 'Permanent', 'Non-Teaching', 'Male', 27, 'Married', 7, '', 'ISA I', 165.00, 60.00, 1, 1, 0, 0, 0, 0, 0, '', 4, '20000-39999', '', '', ''),
(26, 'Main Campus', 'Institute of Computer Studies', 'Permanent', 'Teaching', 'Male', 45, 'Single', 4, '', '', 172.72, 75.00, 1, 0, 0, 0, 0, 0, 0, '', 6, '40000-74999', 'Baliuag', '', ''),
(27, 'Main Campus', 'Institute of Arts and Sciences', 'Permanent', 'Teaching', 'Female', 30, 'Married', 0, '', '', 0.00, 0.00, 0, 0, 0, 1, 0, 0, 0, '', 3, '40000-74999', 'San Miguel', '', ''),
(28, 'Main Campus', 'OSA', 'Permanent', 'Teaching', 'Female', 29, 'Married', 1, 'SWS Head', 'Instructor I', 166.37, 56.00, 0, 0, 0, 0, 0, 0, 0, '', 2, '75000-99999', 'Plaridel', '', ''),
(29, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Male', 33, 'Single', 0, '', '', 174.00, 76.00, 0, 0, 0, 0, 0, 0, 0, '', 2, '20000-39999', '', '', ''),
(30, 'Main Campus', 'Planning and Development', 'Permanent', 'Non-Teaching', 'Female', 30, 'Married', 3, '', 'PDO1', 152.00, 50.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '20000-39999', 'San Ildefonso', '', ''),
(31, 'Main Campus', 'Planning and Development', 'Permanent', 'Non-Teaching', 'Male', 47, 'Single', 12, '', 'Admin Officer V', 175.00, 69.00, 1, 1, 1, 1, 0, 0, 0, '', 3, '40000-74999', 'San Rafael', '', ''),
(32, 'Main Campus', 'Planning and Development', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 25, 'Single', 1, '', 'Support Staff', 152.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '<=10000', 'San Ildefonso', '', ''),
(33, 'Main Campus', 'Planning and Development', 'Permanent', 'Non-Teaching', 'Male', 34, 'Married', 1, '', 'PDO 3', 173.00, 89.00, 1, 0, 0, 0, 0, 0, 0, '', 2, '40000-74999', 'San Rafael', '', ''),
(34, 'Main Campus', 'Planning and Development', 'Permanent', 'Teaching', 'Female', 44, 'Married', 6, '', 'PO II', 152.50, 65.00, 1, 0, 0, 1, 0, 0, 0, '', 4, '20000-39999', '', '', ''),
(35, 'Main Campus', 'Planning and Development', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 38, 'Married', 11, 'PDO', 'Admin Aide VI', 168.00, 69.00, 1, 1, 0, 0, 0, 0, 0, '', 10, '10001-19999', '', '', ''),
(36, 'Main Campus', 'Planning and Development', 'Permanent', 'Non-Teaching', 'Male', 26, 'Single', 3, '', 'Admin Aide III', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '', 11, '', 'San Ildefonso', '', ''),
(37, 'Main Campus', 'General Services and Civil Security', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 47, 'Married', 3, '', 'Support Staff', 167.00, 54.00, 1, 0, 0, 1, 0, 0, 0, '', 7, '<=10000', '', '', ''),
(38, 'Main Campus', 'General Services and Civil Security', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 0, 'Single', 3, '', 'Support Staff', 167.00, 50.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '<=10000', '', '', ''),
(39, 'Main Campus', 'General Services and Civil Security', 'Permanent', 'Non-Teaching', 'Female', 43, 'Married', 7, '', 'AO I', 160.00, 63.00, 0, 1, 0, 0, 1, 0, 0, '', 6, '40000-74999', 'San Ildefonso', '', ''),
(40, 'Main Campus', 'OSA', 'Permanent', 'Teaching', 'Male', 25, 'Single', 3, '', 'Instructor I', 175.00, 65.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '75000-99999', 'San Miguel', '', ''),
(41, 'Main Campus', 'Institute of Arts and Sciences, OSA', 'Permanent', 'Teaching', 'Male', 52, 'Married', 8, 'Head SDSU', 'Instructor I', 177.80, 110.00, 1, 1, 0, 0, 1, 0, 0, '', 4, '20000-39999', 'San Rafael', '', ''),
(42, 'Main Campus', 'OSA', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 27, 'Married', 0, '', 'Support Staff', 153.00, 67.00, 0, 0, 0, 1, 0, 0, 0, '', 5, '20000-39999', 'San Rafael', '', ''),
(43, 'Main Campus', 'Records', 'Permanent', 'Non-Teaching', 'Female', 46, 'Married', 22, '', 'AO III', 0.00, 0.00, 0, 1, 0, 0, 0, 0, 0, '', 4, '10001-19999', 'San Ildefonso', '', ''),
(44, 'Main Campus', 'Audit', 'Permanent', '', 'Female', 63, 'Widowed', 38, '', '', 157.48, 50.00, 1, 0, 1, 0, 0, 0, 0, '', 5, '40000-74999', 'San Ildefonso', '', ''),
(45, 'Main Campus', 'OVPAF', 'Permanent', 'Non-Teaching', 'Female', 41, 'Married', 8, '', 'Admin Assistant III', 161.00, 66.00, 0, 1, 0, 0, 0, 0, 0, '', 3, '20000-39999', '', '', ''),
(46, 'Main Campus', 'OCR', 'Permanent', 'Non-Teaching', 'Female', 28, 'Married', 2, '', 'Admin Aide VI', 161.00, 55.00, 1, 1, 0, 1, 0, 0, 0, '', 7, '10001-19999', 'San Miguel', '', ''),
(47, 'Main Campus', 'OCR', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 46, 'Married', 0, '', 'Support Staff', 167.64, 77.00, 1, 1, 0, 0, 0, 0, 0, '', 5, '40000-74999', 'San Ildefonso', '', ''),
(48, 'Main Campus', 'OCR', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 42, 'Married', 13, '', 'Support Staff', 155.00, 78.00, 0, 1, 0, 1, 0, 0, 0, '', 6, '10001-19999', '', '', ''),
(49, 'Main Campus', 'OCR', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 30, 'Married', 6, '', '', 168.00, 78.00, 0, 1, 0, 1, 0, 0, 0, '', 6, '40000-74999', 'San Ildefonso', '', ''),
(50, 'Main Campus', 'OCR', 'Permanent', 'Non-Teaching', 'Male', 0, 'Married', 17, '', 'Admin Aide VI', 164.00, 55.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '<=10000', '', '', ''),
(51, 'Main Campus', 'OCR', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 0, 'Single', 1, '', 'Staff', 164.00, 55.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '10001-19999', '', '', ''),
(52, 'Main Campus', 'Office of the President', 'Permanent', 'Non-Teaching', 'Female', 49, 'Married', 0, '', 'Admin Assistant III', 127.00, 62.00, 1, 1, 0, 1, 0, 0, 0, '', 4, '20000-39999', 'San Ildefonso', '', ''),
(53, 'Main Campus', 'Office of the President', 'Permanent', 'Non-Teaching', 'Female', 25, 'Single', 0, '', 'Admin Assistant V', 152.40, 40.00, 1, 0, 0, 0, 0, 0, 1, 'Seizures', 3, '10001-19999', 'San Ildefonso', 'Patrice Villarin', ''),
(54, 'Main Campus', 'Cashiers Office', 'Permanent', 'Non-Teaching', 'Male', 0, 'Single', 0, '', 'AO III', 173.00, 85.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '20000-39999', 'Bulacan', '', ''),
(55, 'Main Campus', 'Cashiers Office', 'Permanent', 'Non-Teaching', 'Female', 43, 'Married', 4, '', 'Admin Aide VI', 152.40, 59.00, 0, 1, 0, 0, 0, 0, 0, '', 6, '40000-74999', 'San Ildefonso', '', '197'),
(56, 'College of Agriculture', 'Institute of Veterinary Medicine', 'Temporary', 'Teaching', 'Male', 35, 'Married', 4, 'Associate Dean', 'Assistant Professor IV', 152.00, 64.00, 1, 1, 0, 1, 0, 0, 0, '', 5, '40000-74999', 'San Miguel', '', ''),
(57, 'College of Agriculture', 'Institute of Veterinary Medicine', 'Temporary', 'Teaching', 'Female', 27, 'Single', 3, '', 'Assistant Professor III', 154.94, 50.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '40000-74999', 'San Ildefonso', '', ''),
(58, 'College of Agriculture', 'College of Agriculture', 'Temporary', 'Teaching', 'Male', 26, 'Single', 3, '', 'Instructor I', 158.00, 52.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'San Ildefonso', 'Mark Airon Awitan', ''),
(59, 'Main Campus', 'Institute of Arts and Sciences', 'Permanent', 'Teaching', 'Female', 0, 'Married', 9, '', '', 156.00, 54.00, 0, 0, 0, 1, 0, 0, 0, '', 4, '20000-39999', ' ', '', ''),
(60, 'Main Campus', 'Institute of Arts and Sciences', 'Permanent', 'Teaching', 'Male', 39, 'Married', 1, '', 'Instructor I', 164.00, 89.00, 1, 0, 0, 1, 0, 0, 0, '', 5, '20000-39999', ' ', '', ''),
(61, 'Main Campus', 'Accounting', 'Permanent', 'Non-Teaching', 'Female', 26, 'Single', 4, '', 'Admin Aide VI', 163.00, 68.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '10001-19999', 'San Ildefonso', '', ''),
(62, 'Main Campus', 'Accounting', 'Permanent', 'Non-Teaching', 'Female', 0, 'Single', 4, '', 'Admin Assistant III', 163.00, 110.00, 1, 1, 0, 0, 0, 0, 0, '', 3, '20000-39999', 'San Ildefonso', '', ''),
(63, 'Main Campus', 'Accounting', 'Permanent', 'Non-Teaching', 'Female', 44, 'Widowed', 4, '', 'Support Staff', 162.56, 65.00, 1, 0, 1, 0, 1, 0, 0, '', 4, '10001-19999', 'San Ildefonso', '', ''),
(64, 'Main Campus', 'Accounting', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 23, 'Single', 1, '', 'Support Staff', 153.00, 64.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '10001-19999', 'San Miguel', '', ''),
(65, 'Main Campus', 'Accounting', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 28, 'Married', 7, '', 'Support Staff', 152.00, 57.00, 0, 0, 0, 1, 0, 0, 1, 'Visual Impairment', 3, '20000-39999', 'San Ildefonso', '', ''),
(66, 'Main Campus', 'Institute of Arts and Sciences', 'Temporary', 'Teaching', 'Male', 24, 'Single', 1, '', 'Instructor I', 179.00, 115.00, 1, 0, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'San Miguel', '', '11030E'),
(67, 'Main Campus', 'College of Engineering and Technology', 'Temporary', 'Teaching', 'Male', 0, 'Single', 2, '', 'Instructor I', 178.00, 93.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '75000-99999', 'San Ildefonso', '', ''),
(68, 'Main Campus', 'College of Engineering and Technology', 'Permanent', 'Teaching', 'Male', 43, 'Married', 14, '', 'Associate Professor V', 167.64, 65.00, 1, 0, 0, 1, 0, 0, 0, '', 5, '40000-74999', '', '', ''),
(69, 'Main Campus', 'College of Engineering and Technology', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 24, 'Single', 1, '', '', 183.00, 115.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '10001-19999', 'San Ildefonso', '', ''),
(70, 'Main Campus', 'College of Engineering and Technology', 'Temporary', 'Teaching', 'Male', 27, 'Single', 4, '', 'Instructor I', 170.00, 80.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '40000-74999', 'San Ildefonso', '', ''),
(71, 'Main Campus', 'College of Engineering and Technology', 'Permanent', 'Teaching', 'Female', 36, 'Single', 7, 'Program Chair', 'Instructor I', 152.40, 56.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'San Ildefonso', '', ''),
(72, 'Main Campus', 'College of Engineering and Technology', 'Permanent', 'Teaching', 'Male', 43, 'Single', 8, 'Associate Dean', 'Instructor III', 177.80, 93.00, 1, 1, 0, 0, 0, 0, 0, '', 5, '20000-39999', 'San Ildefonso', '', ''),
(73, 'Main Campus', 'College of Engineering and Technology', 'Permanent', 'Teaching', 'Male', 40, 'Married', 15, 'Dean', 'Assistant Professor IV', 173.00, 97.00, 1, 0, 0, 0, 0, 0, 0, '', 5, '>=100000', 'San Rafael', '', ''),
(74, 'Main Campus', 'College of Engineering and Technology', 'Permanent', 'Teaching', 'Female', 29, 'Single', 0, 'LERP Coordinator', 'Instructor I', 154.94, 53.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '20000-39999', 'San Ildefonso', '', ''),
(75, 'Main Campus', 'College of Engineering and Technology', 'Permanent', 'Teaching', 'Male', 37, 'Married', 7, '', '', 182.00, 114.00, 1, 1, 0, 1, 0, 0, 0, '', 3, '>=100000', '', '', ''),
(76, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Female', 0, 'Married', 5, '', 'Instructor III', 0.00, 0.00, 0, 1, 0, 0, 0, 0, 0, '', 7, '20000-39999', 'San Ildefonso', '', ''),
(77, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Male', 35, 'Single', 12, '', 'Instructor III', 162.56, 65.00, 0, 0, 0, 0, 0, 0, 0, '', 14, '20000-39999', 'Bulacan', '', ''),
(78, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Female', 26, 'Married', 1, '', 'Instructor I', 158.00, 80.00, 0, 1, 0, 1, 0, 0, 0, '', 3, '20000-39999', 'San Ildefonso', '', ''),
(79, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Male', 35, 'Single', 8, '', 'Instructor I', 167.00, 60.00, 1, 1, 0, 0, 0, 0, 0, '', 2, '20000-39999', 'Gapan City', '', ''),
(80, 'Main Campus', 'Institute of Management', 'Part-Time', 'Teaching', 'Female', 41, 'Married', 0, '', 'Instructor I', 163.00, 62.00, 0, 1, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'Calumpit', 'May H. Fajardo', 'BASC-01174E'),
(81, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Female', 0, 'Widowed', 20, 'PC', 'Assistant Professor II', 170.00, 75.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '40000-74999', 'San Ildefonso', '', ''),
(82, 'Main Campus', 'Institute of Management', 'Temporary', 'Teaching', 'Female', 44, 'Married', 4, 'PC BSAB', 'Instructor I', 154.48, 63.00, 1, 0, 1, 0, 0, 0, 0, '', 4, '20000-39999', 'San Ildefonso', '', ''),
(83, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Female', 37, 'Married', 11, 'Dean', 'Instructor II', 126.00, 57.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '40000-74999', '', '', ''),
(84, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Female', 46, 'Separated', 4, 'Associate Dean', '', 161.50, 60.00, 1, 1, 1, 0, 0, 0, 0, '', 5, '20000-39999', 'Bulacan', '', ''),
(85, 'Main Campus', 'Institute of Management', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 0, 'Married', 0, '', 'Support Staff', 170.00, 70.00, 1, 1, 0, 1, 0, 0, 0, '', 3, '<=10000', '', '', ''),
(86, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Male', 43, 'Married', 10, 'PC', 'Instructor I', 165.00, 60.00, 1, 1, 0, 0, 1, 0, 0, '', 4, '20000-39999', 'San Ildefonso', '', ''),
(87, 'Main Campus', 'Institute of Management', 'Permanent', 'Teaching', 'Female', 43, 'Married', 6, '', 'Instructor II', 0.00, 0.00, 1, 1, 1, 1, 0, 0, 0, '', 5, '20000-39999', 'San Ildefonso', '', ''),
(88, 'Main Campus', 'Institute of Arts and Sciences, GAD', 'Permanent', 'Teaching', 'Female', 54, 'Married', 29, 'GAD Director', 'Associate Professor V', 161.00, 75.00, 0, 1, 0, 0, 0, 0, 1, 'Visual Impairment', 8, '40000-74999', 'San Ildefonso', '', ''),
(89, 'Main Campus', 'GAD', 'Permanent', 'Teaching', 'Female', 29, 'Single', 0, '', 'Instructor I', 154.94, 53.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '20000-39999', 'San Ildefonso', 'Edna Mae Cruz', '00212E'),
(90, 'Main Campus', 'Budget', 'Permanent', 'Non-Teaching', 'Female', 39, 'Single', 8, '', 'Admin Officer', 164.00, 50.00, 0, 0, 0, 0, 0, 0, 0, '', 3, '20000-39999', 'San Ildefonso', '', ''),
(91, 'Main Campus', 'Budget', 'Permanent', 'Non-Teaching', 'Male', 27, 'Married', 3, '', 'AO IV', 175.00, 80.00, 0, 0, 0, 0, 0, 0, 0, '', 3, '20000-39999', 'San Miguel', '', ''),
(92, 'Main Campus', 'Budget', 'Permanent', 'Non-Teaching', 'Male', 25, 'Single', 0, '', 'Admin Assistant II', 167.00, 63.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '20000-39999', '', '', ''),
(93, 'Main Campus', 'Budget', 'Permanent', 'Non-Teaching', 'Female', 59, 'Widowed', 0, '', '', 0.00, 0.00, 1, 1, 1, 0, 0, 0, 0, '', 4, '40000-74999', '', '', ''),
(94, 'Main Campus', 'Library', 'Permanent', 'Non-Teaching', 'Female', 32, 'Married', 7, '', '', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '40000-74999', 'San Rafael', '', ''),
(95, 'Main Campus', 'Library', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 0, 'Married', 3, '', 'Support Staff', 154.00, 58.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '', 'San Miguel', '', '00916'),
(96, 'Main Campus', 'Library', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 40, 'Married', 0, '', 'Support Staff', 149.86, 50.00, 0, 1, 0, 0, 0, 0, 0, '', 5, '10001-19999', 'San Ildefonso', '', ''),
(97, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Male', 26, 'Single', 0, '', '', 160.00, 65.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '20000-39999', '', '', 'San Ildefonso'),
(98, 'Main Campus', 'College of Education', 'Temporary', 'Teaching', 'Male', 27, 'Single', 1, 'LET Coordinator', 'Instructor I', 165.00, 75.00, 0, 1, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'San Ildefonso', '', ''),
(99, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Female', 30, 'Married', 0, 'GSE Librarian', 'Instructor I', 169.00, 65.00, 0, 0, 0, 1, 0, 0, 0, '', 4, '20000-39999', 'San Miguel', '', ''),
(100, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Female', 56, 'Widowed', 9, '', 'Assistant Professor III', 152.40, 72.00, 1, 1, 1, 0, 0, 0, 0, '', 4, '10001-19999', 'San Miguel', '', ''),
(101, 'Main Campus', 'College of Education', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 23, 'Single', 0, '', 'Support Staff', 173.00, 54.00, 0, 0, 0, 0, 0, 0, 0, '', 8, '10001-19999', 'San Miguel', 'John Leo Pilit', 'BASC-01169E'),
(102, 'Main Campus', 'College of Education', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 24, 'Single', 2, '', 'Support Staff', 156.00, 45.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '20000-39999', 'San Ildefonso', '', ''),
(103, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Female', 0, 'Single', 2, '', 'Instructor I', 161.54, 55.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '20000-39999', 'San Ildefonso', '', ''),
(104, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Male', 29, 'Single', 3, 'LET Coordinator', 'Instructor I', 165.00, 61.00, 0, 0, 0, 0, 0, 0, 0, '', 1, '20000-39999', 'San Ildefonso', '', ''),
(105, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Female', 50, 'Married', 7, 'Associate Dean', '', 149.86, 54.00, 0, 1, 0, 0, 0, 0, 0, '', 5, '20000-39999', 'San Ildefonso', 'Cynthia M. Sanchez', ''),
(106, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Male', 36, 'Single', 5, 'PC', 'Instructor I', 174.00, 70.00, 1, 1, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'San Ildefonso', '', ''),
(107, 'Main Campus', 'College of Education', 'Temporary', 'Teaching', 'Female', 30, 'Married', 4, 'PC', 'Instructor I', 0.00, 90.00, 0, 0, 0, 1, 0, 0, 0, '', 4, '20000-39999', '', '', ''),
(108, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Female', 41, 'Married', 18, '', 'Associate Professor IV', 149.00, 75.00, 1, 1, 0, 0, 0, 0, 0, '', 4, '40000-74999', 'San Ildefonso', '', ''),
(109, 'Main Campus', 'College of Education', 'Permanent', 'Teaching', 'Male', 34, 'Single', 4, 'SIAP Coordinator', 'Instructor III', 174.00, 105.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '40000-74999', 'San Ildefonso', '', ''),
(110, 'DRT Campus', 'College of Education', 'Permanent', 'Teaching', 'Male', 35, 'Single', 12, 'Program Chair', 'Instructor III', 167.64, 73.00, 0, 0, 0, 0, 0, 0, 0, '', 8, '20000-39999', 'DRT', '', ''),
(111, 'DRT Campus', 'OSAS DRT', 'Contractual', 'Teaching', 'Female', 28, 'Married', 3, 'DRT OSAS-SWSU', 'Instructor', 155.00, 65.00, 1, 1, 0, 1, 0, 0, 0, '', 4, '20000-39999', 'San Ildefonso', '', ''),
(112, 'DRT Campus', 'Agroforestry Demo Farm', 'Permanent', 'Non-Teaching', 'Male', 28, 'Single', 4, 'Dorm Manager', 'Support Staff', 162.66, 53.00, 0, 0, 0, 0, 0, 0, 1, 'Speech Impairment', 6, '10001-19999', 'DRT', 'Nickie T. Punla', ''),
(113, 'DRT Campus', 'DRT Campus', 'Contractual', '', 'Male', 41, 'Married', 0, '', 'Utility', 167.64, 1.00, 0, 0, 1, 0, 0, 0, 0, '', 7, '20000-39999', 'DRT', '', ''),
(114, 'DRT Campus', 'College of Education', 'Job Order / Contract of Service', 'Non-Teaching', 'Male', 31, 'Married', 3, '', 'Support Staff', 163.00, 50.00, 1, 0, 0, 1, 0, 0, 0, '', 4, '10001-19999', 'DRT', '', ''),
(115, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Female', 33, 'Single', 13, '', '', 162.00, 60.00, 0, 0, 0, 0, 0, 0, 0, '', 8, '20000-39999', 'Guiguinto', '', ''),
(116, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Male', 48, 'Married', 15, '', '', 175.00, 70.00, 1, 0, 0, 0, 0, 0, 0, '', 5, '20000-39999', 'Plaridel', '', ''),
(117, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Male', 52, 'Married', 23, '', '', 155.00, 68.00, 1, 0, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'Pandi', '', ''),
(118, 'Balagtas Campus', '', 'Permanent', 'Non-Teaching', 'Female', 59, 'Married', 18, '', '', 149.00, 55.00, 0, 1, 0, 0, 0, 0, 0, '', 4, '10001-19999', 'Balagtas', '', ''),
(119, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Male', 40, 'Married', 10, '', '', 158.00, 57.00, 1, 0, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'Plaridel', '', ''),
(120, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Male', 54, 'Married', 15, '', '', 181.00, 78.00, 1, 1, 0, 0, 0, 0, 0, '', 4, '', 'Guiguinto', '', ''),
(121, 'Balagtas Campus', '', 'Temporary', 'Non-Teaching', 'Female', 31, 'Single', 2, '', '', 151.00, 65.00, 10, 0, 0, 0, 0, 0, 0, '', 5, '10001-19999', 'Balagtas', '', ''),
(122, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Female', 35, 'Single', 0, '', '', 165.00, 56.00, 0, 1, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'Balagtas', '', ''),
(123, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Male', 30, 'Married', 5, '', '', 165.00, 70.00, 1, 1, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'Balagtas', '', ''),
(124, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Female', 35, 'Single', 12, '', '', 150.00, 60.00, 0, 1, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'Balagtas', '', ''),
(125, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Male', 45, 'Married', 0, '', '', 155.00, 52.00, 1, 1, 0, 1, 0, 0, 0, '', 3, '', 'Balagtas', '', ''),
(126, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Female', 0, 'Single', 38, '', '', 154.00, 38.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '20000-39999', 'Balagtas', '', ''),
(127, 'Balagtas Campus', '', 'Permanent', 'Teaching', '', 34, 'Single', 7, '', '', 160.00, 65.00, 1, 1, 0, 1, 0, 0, 0, '', 4, '20000-39999', 'Malolos', '', ''),
(128, 'Balagtas Campus', '', 'Part-Time', 'Teaching', 'Female', 42, 'Married', 10, '', '', 162.00, 55.00, 1, 1, 0, 1, 0, 0, 0, '', 5, '20000-39999', 'Bocaue', '', ''),
(129, 'Sta. Maria Campus', 'College of Agriculture', 'Job Order / Contract of Service', 'Non-Teaching', 'Female', 22, 'Single', 0, 'SMB', 'Secretary', 152.00, 50.00, 0, 0, 0, 0, 0, 0, 0, '', 5, '10001-19999', 'Sta Maria', 'Rachell Ann', 'BASC-01164E'),
(130, 'Balagtas Campus', 'College of Agriculture', 'Temporary', 'Teaching', 'Female', 29, 'Single', 3, '', 'Instructor I', 0.00, 0.00, 0, 0, 0, 0, 0, 0, 0, '', 6, '20000-39999', 'San Ildefonso', '', ''),
(131, 'Balagtas Campus', 'College of Agriculture', 'Temporary', 'Teaching', 'Male', 28, 'Single', 2, '', 'Instructor I', 168.00, 82.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '20000-39999', 'San Ildefonso', '', ''),
(132, 'Balagtas Campus', 'College of Agriculture', 'Temporary', 'Teaching', 'Female', 32, 'Single', 3, 'Assistant Program Chair', 'Instructor I', 0.00, 68.00, 0, 0, 0, 0, 0, 0, 0, '', 4, '40000-74999', 'Pampanga', '', ''),
(133, 'Main Campus', 'Clinic', 'Permanent', 'Non-Teaching', 'Female', 53, 'Married', 14, '', 'College Nurse', 160.00, 67.00, 0, 1, 0, 0, 0, 0, 0, '', 4, '40000-74999', '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `gender_employee_profile`
--
ALTER TABLE `gender_employee_profile`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `gender_employee_profile`
--
ALTER TABLE `gender_employee_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
