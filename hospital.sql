-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2022 at 04:31 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `caregivers`
--

CREATE TABLE `caregivers` (
  `id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `health_center` int(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `caregivers`
--

INSERT INTO `caregivers` (`id`, `name`, `health_center`, `phone`, `location`) VALUES
(1, 'Linda Kanaga', 1, '072145787', 'Gaigedi');

-- --------------------------------------------------------

--
-- Table structure for table `counties`
--

CREATE TABLE `counties` (
  `id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `counties`
--

INSERT INTO `counties` (`id`, `name`) VALUES
(1, 'Vihiga '),
(2, 'Bungoma'),
(3, 'Nairobi'),
(4, 'Kisumu'),
(5, 'Kakamega'),
(6, 'Busia'),
(7, 'Narok'),
(8, 'Kericho'),
(9, 'Bomet'),
(10, 'Nandi'),
(11, 'West Pokot');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `quantity` int(50) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `health_center_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`id`, `name`, `quantity`, `unit`, `health_center_id`) VALUES
(1, 'ARV', 500, 'Pcs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `health_centers`
--

CREATE TABLE `health_centers` (
  `id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `health_centers`
--

INSERT INTO `health_centers` (`id`, `name`, `email`, `address`, `phone`, `location`) VALUES
(1, 'Sabatia Subcounty Hospital', 'sabatia@gmail.com', '23561 Wodanga', '0723658952', 'Sabatia'),
(2, 'Givudimbuli Health center', 'givudimbuli@gmail.com', '354  Kiritu', '0764589545', 'Mambai');

-- --------------------------------------------------------

--
-- Table structure for table `medication`
--

CREATE TABLE `medication` (
  `id` int(50) NOT NULL,
  `patient_id` int(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `caregiver_id` int(100) NOT NULL,
  `hc_id` int(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medication`
--

INSERT INTO `medication` (`id`, `patient_id`, `start_date`, `end_date`, `caregiver_id`, `hc_id`, `status`) VALUES
(1, 1, '2022-06-04', '2022-06-20', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `medication_details`
--

CREATE TABLE `medication_details` (
  `id` int(50) NOT NULL,
  `medication_id` int(50) NOT NULL,
  `drug_name` int(50) NOT NULL,
  `quatity` int(50) NOT NULL,
  `unit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medication_details`
--

INSERT INTO `medication_details` (`id`, `medication_id`, `drug_name`, `quatity`, `unit`) VALUES
(3, 1, 1, 10, 'pcs');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `birth_date` date NOT NULL,
  `national_id` int(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `Mother_name` varchar(100) NOT NULL,
  `Father_name` varchar(100) NOT NULL,
  `county` varchar(100) NOT NULL,
  `subcounty` varchar(100) NOT NULL,
  `ward` varchar(100) NOT NULL,
  `Sub_location` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `health_center` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `birth_date`, `national_id`, `gender`, `phone`, `Mother_name`, `Father_name`, `county`, `subcounty`, `ward`, `Sub_location`, `date`, `health_center`) VALUES
(1, 'Johnston Kamau', '1986-04-02', 31791234, 'Male', '0732568564', 'Jane Kavindu', 'Keneth Avudaywa', 'Vihiga ', 'Sabatia', 'Wodanga', 'Gaigedi', '2022-06-04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sec_apps`
--

CREATE TABLE `sec_apps` (
  `app_name` varchar(128) NOT NULL,
  `app_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sec_apps`
--

INSERT INTO `sec_apps` (`app_name`, `app_type`, `description`) VALUES
('app_change_pswd', 'contr', 'Security Application'),
('app_form_add_users', 'form', 'Security Application'),
('app_form_edit_users', 'form', 'Security Application'),
('app_form_sec_apps', 'form', 'Security Application'),
('app_form_sec_groups', 'form', 'Security Application'),
('app_form_sec_groups_apps', 'form', 'Security Application'),
('app_grid_sec_apps', 'cons', 'Security Application'),
('app_grid_sec_groups', 'cons', 'Security Application'),
('app_grid_sec_users', 'cons', 'Security Application'),
('app_grid_sec_users_groups', 'form', 'Security Application'),
('app_logged', 'contr', 'Security Application'),
('app_logged_users', 'cons', 'Security Application'),
('app_Login', 'contr', 'Security Application'),
('app_retrieve_pswd', 'contr', 'Security Application'),
('app_search_sec_groups', 'filter', 'Security Application'),
('app_sync_apps', 'contr', 'Security Application'),
('chart_patients', 'chart', ''),
('form_caregivers', 'form', ''),
('form_counties', 'form', ''),
('form_drugs', 'form', ''),
('form_health_centers', 'form', ''),
('form_medication', 'form', ''),
('form_medication_alert', 'form', ''),
('form_medication_details', 'form', ''),
('form_patients', 'form', ''),
('form_sub_counties', 'form', ''),
('form_sub_location', 'form', ''),
('form_wards', 'form', ''),
('grid_drugs', 'cons', ''),
('grid_health_centers', 'cons', ''),
('grid_medication', 'cons', ''),
('grid_medication_alert', 'cons', ''),
('grid_medication_details', 'cons', ''),
('grid_patients', 'cons', ''),
('menu', 'menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `sec_groups`
--

CREATE TABLE `sec_groups` (
  `group_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sec_groups`
--

INSERT INTO `sec_groups` (`group_id`, `description`) VALUES
(1, 'Administrator'),
(2, 'Doctor'),
(3, 'Hospital Manager');

-- --------------------------------------------------------

--
-- Table structure for table `sec_groups_apps`
--

CREATE TABLE `sec_groups_apps` (
  `group_id` int(11) NOT NULL,
  `app_name` varchar(128) NOT NULL,
  `priv_access` varchar(1) DEFAULT NULL,
  `priv_insert` varchar(1) DEFAULT NULL,
  `priv_delete` varchar(1) DEFAULT NULL,
  `priv_update` varchar(1) DEFAULT NULL,
  `priv_export` varchar(1) DEFAULT NULL,
  `priv_print` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sec_groups_apps`
--

INSERT INTO `sec_groups_apps` (`group_id`, `app_name`, `priv_access`, `priv_insert`, `priv_delete`, `priv_update`, `priv_export`, `priv_print`) VALUES
(1, 'app_change_pswd', 'Y', 'N', 'N', 'N', 'N', 'N'),
(1, 'app_form_add_users', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'app_form_edit_users', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'app_form_sec_apps', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'app_form_sec_groups', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'app_form_sec_groups_apps', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'app_grid_sec_apps', 'Y', '', '', '', 'Y', 'Y'),
(1, 'app_grid_sec_groups', 'Y', '', '', '', 'Y', 'Y'),
(1, 'app_grid_sec_users', 'Y', '', '', '', 'Y', 'Y'),
(1, 'app_grid_sec_users_groups', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'app_logged', 'Y', '', '', '', '', ''),
(1, 'app_logged_users', 'Y', '', '', '', 'Y', 'Y'),
(1, 'app_Login', 'Y', '', '', '', '', ''),
(1, 'app_retrieve_pswd', 'Y', '', '', '', '', ''),
(1, 'app_search_sec_groups', 'Y', '', '', '', '', ''),
(1, 'app_sync_apps', 'Y', 'N', 'N', 'N', 'N', 'N'),
(1, 'chart_patients', 'Y', '', '', '', 'Y', 'Y'),
(1, 'form_caregivers', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_counties', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_drugs', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_health_centers', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_medication', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_medication_alert', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_medication_details', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_patients', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_sub_counties', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_sub_location', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'form_wards', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(1, 'grid_drugs', 'Y', '', '', '', 'Y', 'Y'),
(1, 'grid_health_centers', 'Y', '', '', '', '', ''),
(1, 'grid_medication', 'Y', 'N', 'N', 'N', 'Y', 'Y'),
(1, 'grid_medication_alert', 'Y', '', '', '', 'Y', 'Y'),
(1, 'grid_medication_details', 'Y', '', '', '', 'Y', 'Y'),
(1, 'grid_patients', 'Y', '', '', '', 'Y', 'Y'),
(1, 'menu', 'Y', '', '', '', '', ''),
(2, 'app_change_pswd', 'Y', '', '', '', '', ''),
(2, 'app_form_add_users', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_form_edit_users', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_form_sec_apps', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_form_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_form_sec_groups_apps', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_grid_sec_apps', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_grid_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_grid_sec_users', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_grid_sec_users_groups', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_logged', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_logged_users', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_Login', 'Y', '', '', '', '', ''),
(2, 'app_retrieve_pswd', 'Y', '', '', '', '', ''),
(2, 'app_search_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'app_sync_apps', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'chart_patients', 'Y', '', '', '', '', ''),
(2, 'form_caregivers', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'form_counties', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'form_drugs', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'form_health_centers', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'form_medication', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'form_medication_alert', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'form_medication_details', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'form_patients', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(2, 'form_sub_counties', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'form_sub_location', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'form_wards', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'grid_drugs', 'Y', '', '', '', 'Y', 'Y'),
(2, 'grid_health_centers', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'grid_medication', 'Y', '', '', '', 'Y', 'Y'),
(2, 'grid_medication_alert', 'Y', '', '', '', 'Y', 'Y'),
(2, 'grid_medication_details', 'Y', '', '', '', 'Y', 'Y'),
(2, 'grid_patients', 'Y', '', '', '', 'Y', 'Y'),
(2, 'menu', 'Y', '', '', '', '', ''),
(3, 'app_change_pswd', 'Y', '', '', '', '', ''),
(3, 'app_form_add_users', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_form_edit_users', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_form_sec_apps', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_form_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_form_sec_groups_apps', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_grid_sec_apps', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_grid_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_grid_sec_users', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_grid_sec_users_groups', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_logged', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_logged_users', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_Login', 'Y', '', '', '', '', ''),
(3, 'app_retrieve_pswd', 'Y', '', '', '', '', ''),
(3, 'app_search_sec_groups', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'app_sync_apps', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'chart_patients', 'Y', '', '', '', '', ''),
(3, 'form_caregivers', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_counties', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_drugs', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
(3, 'form_health_centers', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_medication', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_medication_alert', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_medication_details', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_patients', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_sub_counties', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_sub_location', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'form_wards', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'grid_drugs', 'Y', '', '', '', 'Y', 'Y'),
(3, 'grid_health_centers', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'grid_medication', 'Y', '', '', '', 'Y', 'Y'),
(3, 'grid_medication_alert', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'grid_medication_details', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'grid_patients', 'Y', '', '', '', 'Y', 'Y'),
(3, 'menu', 'Y', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sec_logged`
--

CREATE TABLE `sec_logged` (
  `login` varchar(190) NOT NULL,
  `date_login` varchar(128) DEFAULT NULL,
  `sc_session` varchar(32) DEFAULT NULL,
  `ip` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sec_logged`
--

INSERT INTO `sec_logged` (`login`, `date_login`, `sc_session`, `ip`) VALUES
('erick', '1655561308.7194', '4c94e2cd03a312d64f67891a26025e7a', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `sec_users`
--

CREATE TABLE `sec_users` (
  `login` varchar(190) NOT NULL,
  `pswd` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `activation_code` varchar(32) DEFAULT NULL,
  `priv_admin` varchar(1) DEFAULT NULL,
  `mfa` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sec_users`
--

INSERT INTO `sec_users` (`login`, `pswd`, `name`, `email`, `active`, `activation_code`, `priv_admin`, `mfa`) VALUES
('admin', 'c93ccd78b2076528346216b3b2f701e6', 'Admin', 'brammabale@gmail.com', 'Y', NULL, 'Y', NULL),
('erick', '12bb89a751743959a4c69fcc292a3efe', 'erick Mabale', 'erick@gmail.com', 'Y', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sec_users_groups`
--

CREATE TABLE `sec_users_groups` (
  `login` varchar(190) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sec_users_groups`
--

INSERT INTO `sec_users_groups` (`login`, `group_id`) VALUES
('admin', 1),
('erick', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sub_counties`
--

CREATE TABLE `sub_counties` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_counties`
--

INSERT INTO `sub_counties` (`id`, `name`) VALUES
(1, 'Sabatia'),
(2, 'Vihiga'),
(3, 'Hamisi'),
(4, 'Luanda '),
(5, 'Emuhaya');

-- --------------------------------------------------------

--
-- Table structure for table `sub_location`
--

CREATE TABLE `sub_location` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_location`
--

INSERT INTO `sub_location` (`id`, `name`) VALUES
(1, 'Gaigedi'),
(2, 'Lusengeli'),
(3, 'Mambai'),
(4, 'Vokoli');

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`id`, `name`) VALUES
(1, 'Wodanga'),
(2, 'North Maragoli'),
(3, 'Lyaduywa'),
(4, 'Sabatia West'),
(5, 'Izava'),
(6, 'Chavakali');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `caregivers`
--
ALTER TABLE `caregivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `health_center_id` (`health_center`);

--
-- Indexes for table `counties`
--
ALTER TABLE `counties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `h_center-id` (`health_center_id`);

--
-- Indexes for table `health_centers`
--
ALTER TABLE `health_centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medication`
--
ALTER TABLE `medication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `caregiver_fk` (`caregiver_id`),
  ADD KEY `p-id` (`patient_id`),
  ADD KEY `hcid` (`hc_id`);

--
-- Indexes for table `medication_details`
--
ALTER TABLE `medication_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `med_id` (`medication_id`),
  ADD KEY `drg_id` (`drug_name`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hc` (`health_center`);

--
-- Indexes for table `sec_apps`
--
ALTER TABLE `sec_apps`
  ADD PRIMARY KEY (`app_name`);

--
-- Indexes for table `sec_groups`
--
ALTER TABLE `sec_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indexes for table `sec_groups_apps`
--
ALTER TABLE `sec_groups_apps`
  ADD PRIMARY KEY (`group_id`,`app_name`),
  ADD KEY `sec_groups_apps_ibfk_2` (`app_name`);

--
-- Indexes for table `sec_users`
--
ALTER TABLE `sec_users`
  ADD PRIMARY KEY (`login`);

--
-- Indexes for table `sec_users_groups`
--
ALTER TABLE `sec_users_groups`
  ADD PRIMARY KEY (`login`,`group_id`),
  ADD KEY `sec_users_groups_ibfk_2` (`group_id`);

--
-- Indexes for table `sub_counties`
--
ALTER TABLE `sub_counties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_location`
--
ALTER TABLE `sub_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `caregivers`
--
ALTER TABLE `caregivers`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `counties`
--
ALTER TABLE `counties`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `health_centers`
--
ALTER TABLE `health_centers`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medication`
--
ALTER TABLE `medication`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medication_details`
--
ALTER TABLE `medication_details`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sec_groups`
--
ALTER TABLE `sec_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_counties`
--
ALTER TABLE `sub_counties`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_location`
--
ALTER TABLE `sub_location`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `caregivers`
--
ALTER TABLE `caregivers`
  ADD CONSTRAINT `health_center_id` FOREIGN KEY (`health_center`) REFERENCES `health_centers` (`id`);

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `h_center-id` FOREIGN KEY (`health_center_id`) REFERENCES `health_centers` (`id`);

--
-- Constraints for table `medication`
--
ALTER TABLE `medication`
  ADD CONSTRAINT `caregiver_fk` FOREIGN KEY (`caregiver_id`) REFERENCES `caregivers` (`id`),
  ADD CONSTRAINT `hcid` FOREIGN KEY (`hc_id`) REFERENCES `health_centers` (`id`),
  ADD CONSTRAINT `p-id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `medication_details`
--
ALTER TABLE `medication_details`
  ADD CONSTRAINT `drg_id` FOREIGN KEY (`drug_name`) REFERENCES `drugs` (`id`),
  ADD CONSTRAINT `med_id` FOREIGN KEY (`medication_id`) REFERENCES `medication` (`id`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `hc` FOREIGN KEY (`health_center`) REFERENCES `health_centers` (`id`);

--
-- Constraints for table `sec_groups_apps`
--
ALTER TABLE `sec_groups_apps`
  ADD CONSTRAINT `sec_groups_apps_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sec_groups_apps_ibfk_2` FOREIGN KEY (`app_name`) REFERENCES `sec_apps` (`app_name`) ON DELETE CASCADE;

--
-- Constraints for table `sec_users_groups`
--
ALTER TABLE `sec_users_groups`
  ADD CONSTRAINT `sec_users_groups_ibfk_1` FOREIGN KEY (`login`) REFERENCES `sec_users` (`login`) ON DELETE CASCADE,
  ADD CONSTRAINT `sec_users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `sec_groups` (`group_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
