-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2025 at 11:17 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- Database: `2fa_demo`
--
CREATE DATABASE IF NOT EXISTS `2fa_demo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `2fa_demo`;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` varchar(255) DEFAULT NULL,
  `is_2fa_enabled` tinyint(1) DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Database: `a@beche`
--
CREATE DATABASE IF NOT EXISTS `a@beche` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `a@beche`;

-- --------------------------------------------------------
--
-- Table structure for table `applications`
--
CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position` varchar(100) NOT NULL,
  `education` text NOT NULL,
  `experience` text NOT NULL,
  `skills` text NOT NULL,
  `resume` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `applications`
--
INSERT INTO
  `applications` (
    `application_id`,
    `fullName`,
    `email`,
    `phone`,
    `position`,
    `education`,
    `experience`,
    `skills`,
    `resume`
  )
VALUES
  (
    1,
    'PROSPER MWASILE',
    'popermwasile173@gmail.com',
    '0672586994',
    'public health',
    'hhHh',
    'AAGAGGA',
    'AAGAG',
    'uploads\\23902301010b6a93778fcc96dbac513e'
  ),
  (
    7,
    'john temu',
    'jaydanjohn79@gmail.com',
    '0757303007',
    'account and auditing',
    'hhHh',
    'AAGAGGA',
    'AAGAG',
    'uploads\\6cc1bcfe591bb5bbe5acdcac9fa089ac'
  ),
  (
    8,
    'john temu',
    'jaydanjohn79@gmail.com',
    '0757303007',
    'account and auditing',
    'john',
    'hey john',
    'first year',
    'uploads\\53c489c6a1360655814fbfa89508e9a3'
  ),
  (
    9,
    'salim arafat',
    'salimarafat78@gmail.com',
    '0757303007',
    'public health',
    'ahahhah',
    'shshhshhhh',
    'yyhhh',
    'uploads\\dafb14e0ee49428ffff6c28fc8dfe887'
  );

-- --------------------------------------------------------
--
-- Table structure for table `categories`
--
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `contacts`
--
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `feedback`
--
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `job_postings`
--
CREATE TABLE `job_postings` (
  `id` int(11) NOT NULL,
  `post_name` varchar(255) NOT NULL,
  `post_number` int(11) NOT NULL,
  `employer` varchar(255) NOT NULL,
  `application_start` date NOT NULL,
  `application_end` date NOT NULL,
  `duties` text NOT NULL,
  `qualifications` text NOT NULL,
  `salary_range` decimal(10, 2) NOT NULL,
  `Location` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `job_postings`
--
INSERT INTO
  `job_postings` (
    `id`,
    `post_name`,
    `post_number`,
    `employer`,
    `application_start`,
    `application_end`,
    `duties`,
    `qualifications`,
    `salary_range`,
    `Location`,
    `created_at`
  )
VALUES
  (
    6,
    'ACCOUNTANCY',
    2,
    'DAM MICROFINANCE',
    '2025-01-18',
    '2025-02-09',
    '\nI. LOI\nII. LUI',
    '\nI. POI\nII. LOP',
    '230000.00',
    'DASM',
    '2025-01-16 13:41:08'
  );

-- --------------------------------------------------------
--
-- Table structure for table `notifications`
--
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `pages`
--
CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `search_logs`
--
CREATE TABLE `search_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `query` text NOT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `settings`
--
CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('job_seeker', 'employer', 'admin') DEFAULT 'job_seeker',
  `profile_picture` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (
    `id`,
    `username`,
    `email`,
    `password`,
    `role`,
    `profile_picture`,
    `bio`,
    `created_at`
  )
VALUES
  (
    2,
    'admin',
    'popermwasile173@gmail.com',
    'password',
    'employer',
    NULL,
    NULL,
    '2025-01-15 21:26:31'
  ),
  (
    4,
    'PROSPER',
    'poper173@gmail.com',
    'password',
    'admin',
    NULL,
    NULL,
    '2025-01-15 21:30:24'
  ),
  (
    6,
    'ubaya ubwela',
    'mwasile173@gmail.com',
    '',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-15 21:32:44'
  ),
  (
    7,
    'nasra juma',
    'naah@gmail.com',
    '123456',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-15 21:59:46'
  ),
  (
    8,
    'IDDI ALLY',
    'iddyone173@gmail.com',
    'newuser@1234',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-15 22:02:09'
  ),
  (
    9,
    'mwamlima poper',
    'mlima173@gmail.com',
    '1234567',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-15 22:09:04'
  ),
  (
    10,
    'mwamposa',
    'mwamposa173@gmail.com',
    '123456',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-16 08:05:54'
  ),
  (
    15,
    'doreen',
    'doreen123@gmail.com',
    'dodo',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-16 14:41:06'
  ),
  (
    19,
    'muu',
    'muu173@gmail.com',
    '45678',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-16 14:42:33'
  ),
  (
    20,
    'mwarabu',
    'mwarabu173@gmail.com',
    '45678',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-16 14:44:15'
  ),
  (
    21,
    'new  user ',
    'inniester@gmail.com',
    '12345',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-16 20:18:35'
  ),
  (
    25,
    'john temu',
    'jaydanjohn79@gmail.com',
    '12345',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-16 21:43:24'
  ),
  (
    26,
    'salim arafat',
    'salimarafat78@gmail.com',
    '12345',
    'job_seeker',
    NULL,
    NULL,
    '2025-01-16 22:04:24'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `applications`
--
ALTER TABLE
  `applications`
ADD
  PRIMARY KEY (`application_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE
  `categories`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contacts`
--
ALTER TABLE
  `contacts`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE
  `feedback`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE
  `job_postings`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE
  `pages`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `search_logs`
--
ALTER TABLE
  `search_logs`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE
  `settings`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `username` (`username`),
ADD
  UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE
  `applications`
MODIFY
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE
  `categories`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE
  `contacts`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE
  `feedback`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE
  `job_postings`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE
  `notifications`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE
  `pages`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_logs`
--
ALTER TABLE
  `search_logs`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE
  `settings`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 29;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `feedback`
--
ALTER TABLE
  `feedback`
ADD
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `search_logs`
--
ALTER TABLE
  `search_logs`
ADD
  CONSTRAINT `search_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `settings`
--
ALTER TABLE
  `settings`
ADD
  CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Database: `auth_db`
--
CREATE DATABASE IF NOT EXISTS `auth_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `auth_db`;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pp` varchar(255) NOT NULL DEFAULT 'default-pp.png'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (`id`, `fname`, `username`, `password`, `pp`)
VALUES
  (
    1,
    'pop',
    'ge@mail.com',
    '$2y$10$MU4C8G.9fdIJIji8eSlWeOGvHOSa5YVA88O5T1J.lDwKMRaZtdoyC',
    'ge@mail.com66c305e2eff4e9.25507248.jpg'
  ),
  (
    2,
    'pop',
    'ge@mail.com',
    '$2y$10$iBLwbgGD0A4k3pfsAOZ0a.M0yEZe4JOKg8eIOT4pLbp1kf5Ktg7rW',
    'ge@mail.com66c305f3364156.58067604.jpg'
  ),
  (
    3,
    'pop',
    'po@mail.com',
    '$2y$10$EDJLlgChlQZ1wy6EizTHxeOulj/TK1k2UrzLYYkP/A08KYXU/qS7y',
    'po@mail.com66c30832868e04.68454753.jpg'
  ),
  (
    4,
    'PROSPER MWASILE',
    'popermwasile173@gmail.com',
    '$2y$10$NpTw95A..glBX7OBQ7Tdsu726Y24InyAFZPYBxAljReq4x5/.geFm',
    'popermwasile173@gmail.com673c5517971844.94285521.png'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;

--
-- Database: `chatapp`
--
CREATE DATABASE IF NOT EXISTS `chatapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `chatapp`;

-- --------------------------------------------------------
--
-- Table structure for table `messages`
--
CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `messages`
--
INSERT INTO
  `messages` (
    `msg_id`,
    `incoming_msg_id`,
    `outgoing_msg_id`,
    `msg`
  )
VALUES
  (1, 1141352718, 1169377514, 'sadds'),
  (2, 1141352718, 1169377514, 'mamboo'),
  (3, 1141352718, 786094797, 'mamboo'),
  (4, 1169377514, 786094797, 'poah');

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (
    `user_id`,
    `unique_id`,
    `fname`,
    `lname`,
    `email`,
    `password`,
    `img`,
    `status`
  )
VALUES
  (
    1,
    1141352718,
    'juma',
    'gerge',
    'ge@gmail.com',
    '202cb962ac59075b964b07152d234b70',
    '17234591411.jpg',
    'Offline now'
  ),
  (
    2,
    1169377514,
    '27748',
    '9899797',
    'ge@mail.com',
    '202cb962ac59075b964b07152d234b70',
    '172373375714.jpg',
    'Active now'
  ),
  (
    3,
    786094797,
    'prosper',
    'mwasile',
    'popermwasile173@gmail.com',
    'a01610228fe998f515a72dd730294d87',
    '1727359501jn.jpg',
    'Active now'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `messages`
--
ALTER TABLE
  `messages`
ADD
  PRIMARY KEY (`msg_id`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE
  `messages`
MODIFY
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- Database: `database`
--
CREATE DATABASE IF NOT EXISTS `database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `database`;

-- --------------------------------------------------------
--
-- Table structure for table `notifications`
--
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (`id`, `username`, `password`)
VALUES
  (
    1,
    'mwasilee',
    '$2y$10$s9jR3YRlzXY3xC6Y8d2ch.uiuWlil2Mz0UTf9iyC.VqotXqCO.8lq'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE
  `notifications`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Database: `databenki`
--
CREATE DATABASE IF NOT EXISTS `databenki` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `databenki`;

-- --------------------------------------------------------
--
-- Table structure for table `admin_task_processes`
--
CREATE TABLE `admin_task_processes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `proccessing_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_task_processes`
--
INSERT INTO
  `admin_task_processes` (
    `id`,
    `admin_id`,
    `task_id`,
    `proccessing_status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    25,
    1,
    24,
    1,
    '2022-06-20 09:48:29',
    '2022-06-20 09:48:29'
  ),
  (
    26,
    1,
    25,
    1,
    '2022-06-20 15:55:55',
    '2022-06-20 15:55:55'
  ),
  (
    28,
    1,
    27,
    1,
    '2022-06-22 09:10:50',
    '2022-06-22 09:10:50'
  ),
  (
    29,
    1,
    28,
    1,
    '2022-06-25 10:26:46',
    '2022-06-25 10:26:46'
  ),
  (
    30,
    1,
    26,
    1,
    '2022-06-29 16:28:01',
    '2022-06-29 16:28:01'
  ),
  (
    31,
    1,
    29,
    1,
    '2022-07-12 10:59:55',
    '2022-07-12 10:59:55'
  );

-- --------------------------------------------------------
--
-- Table structure for table `assigned_specializations`
--
CREATE TABLE `assigned_specializations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `assigned_specialization` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `assigned_specializations`
--
INSERT INTO
  `assigned_specializations` (
    `id`,
    `user_id`,
    `assigned_specialization`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    131,
    '1,2,12',
    '2022-01-25 22:02:11',
    '2022-01-25 22:02:11'
  ),
  (
    2,
    133,
    '2',
    '2022-01-25 22:03:20',
    '2022-01-25 22:03:20'
  ),
  (
    3,
    52,
    '1,12,15,17,18,22,26,27,29',
    '2022-04-17 00:46:33',
    '2022-04-17 00:46:33'
  ),
  (
    4,
    135,
    '17,13,16,22,28,27',
    '2022-04-26 21:45:19',
    '2022-04-26 21:45:19'
  ),
  (
    5,
    9,
    '5,32,31',
    '2022-05-14 19:26:42',
    '2024-08-02 16:52:47'
  ),
  (
    6,
    136,
    '23,7,13,1,2,21,5,12,15,16,18,22,26,29',
    '2022-06-19 13:55:18',
    '2022-06-20 10:27:03'
  ),
  (
    7,
    139,
    '32',
    '2022-06-22 06:51:01',
    '2022-06-22 06:51:01'
  ),
  (
    8,
    161,
    '34',
    '2022-07-04 08:52:47',
    '2022-07-04 08:52:47'
  ),
  (
    9,
    158,
    '38,32',
    '2022-07-04 08:56:47',
    '2022-07-04 09:09:28'
  ),
  (
    10,
    153,
    '21,22,17,15,29,1,2,5,12,13,14,18,19,26,27,34',
    '2022-07-04 18:23:39',
    '2022-07-04 18:35:49'
  ),
  (
    11,
    168,
    '15,17,21,22,26,29,28,18',
    '2022-07-08 08:42:56',
    '2022-07-08 08:55:07'
  );

-- --------------------------------------------------------
--
-- Table structure for table `cron_instructions`
--
CREATE TABLE `cron_instructions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `cron_instructions`
--
INSERT INTO
  `cron_instructions` (
    `id`,
    `type`,
    `recipient`,
    `message`,
    `status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    50,
    'withdraw_request',
    'surveying@xfrey.co.tz',
    '-',
    1,
    '2022-06-25 14:49:44',
    '2022-06-27 14:05:43'
  ),
  (
    51,
    'register',
    'client@xfrey.co.tz',
    'Ze7Mcg4F',
    0,
    '2022-06-30 16:40:01',
    '2022-06-30 16:40:01'
  );

-- --------------------------------------------------------
--
-- Table structure for table `failed_jobs`
--
CREATE TABLE `failed_jobs` (
  `id` int(11) NOT NULL,
  `uuid` varchar(250) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `jobs`
--
CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Table structure for table `messages`
--
CREATE TABLE `messages` (
  `message_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `messages`
--
INSERT INTO
  `messages` (
    `message_id`,
    `sender_id`,
    `receiver_id`,
    `message`,
    `sent_at`
  )
VALUES
  (1, 1, 37, 'doooo', '2024-08-19 07:36:44'),
  (2, 1, 9, 'engeneer', '2024-08-19 07:38:29'),
  (3, 1, 11, 'engeneer', '2024-08-19 07:38:29'),
  (4, 1, 13, 'engeneer', '2024-08-19 07:38:29'),
  (5, 1, 27, 'engeneer', '2024-08-19 07:38:29'),
  (6, 1, 30, 'engeneer', '2024-08-19 07:38:29'),
  (7, 1, 31, 'engeneer', '2024-08-19 07:38:29'),
  (8, 1, 33, 'engeneer', '2024-08-19 07:38:29'),
  (9, 1, 37, 'engeneer', '2024-08-19 07:38:29'),
  (10, 1, 38, 'engeneer', '2024-08-19 07:38:29'),
  (11, 1, 40, 'engeneer', '2024-08-19 07:38:29'),
  (12, 1, 41, 'engeneer', '2024-08-19 07:38:29'),
  (13, 1, 42, 'engeneer', '2024-08-19 07:38:29'),
  (14, 1, 43, 'engeneer', '2024-08-19 07:38:29'),
  (15, 1, 48, 'engeneer', '2024-08-19 07:38:29'),
  (16, 1, 51, 'engeneer', '2024-08-19 07:38:29'),
  (17, 1, 52, 'engeneer', '2024-08-19 07:38:29'),
  (18, 1, 56, 'engeneer', '2024-08-19 07:38:29'),
  (19, 1, 57, 'engeneer', '2024-08-19 07:38:29'),
  (20, 1, 59, 'engeneer', '2024-08-19 07:38:29'),
  (21, 1, 64, 'engeneer', '2024-08-19 07:38:29'),
  (22, 1, 79, 'engeneer', '2024-08-19 07:38:29'),
  (23, 1, 81, 'engeneer', '2024-08-19 07:38:29'),
  (24, 1, 84, 'engeneer', '2024-08-19 07:38:29'),
  (25, 1, 85, 'engeneer', '2024-08-19 07:38:29'),
  (26, 1, 88, 'engeneer', '2024-08-19 07:38:29'),
  (27, 1, 89, 'engeneer', '2024-08-19 07:38:29'),
  (28, 1, 92, 'engeneer', '2024-08-19 07:38:29'),
  (29, 1, 98, 'engeneer', '2024-08-19 07:38:29'),
  (30, 1, 106, 'engeneer', '2024-08-19 07:38:29'),
  (31, 1, 108, 'engeneer', '2024-08-19 07:38:29'),
  (32, 1, 133, 'engeneer', '2024-08-19 07:38:29'),
  (33, 1, 135, 'engeneer', '2024-08-19 07:38:29'),
  (34, 1, 136, 'engeneer', '2024-08-19 07:38:29'),
  (35, 1, 139, 'engeneer', '2024-08-19 07:38:29'),
  (36, 1, 140, 'engeneer', '2024-08-19 07:38:29'),
  (37, 1, 142, 'engeneer', '2024-08-19 07:38:29'),
  (38, 1, 143, 'engeneer', '2024-08-19 07:38:29'),
  (39, 1, 144, 'engeneer', '2024-08-19 07:38:29'),
  (40, 1, 145, 'engeneer', '2024-08-19 07:38:29'),
  (41, 1, 149, 'engeneer', '2024-08-19 07:38:29'),
  (42, 1, 151, 'engeneer', '2024-08-19 07:38:29'),
  (43, 1, 152, 'engeneer', '2024-08-19 07:38:29'),
  (44, 1, 153, 'engeneer', '2024-08-19 07:38:29'),
  (45, 1, 154, 'engeneer', '2024-08-19 07:38:29'),
  (46, 1, 155, 'engeneer', '2024-08-19 07:38:29'),
  (47, 1, 156, 'engeneer', '2024-08-19 07:38:29'),
  (48, 1, 157, 'engeneer', '2024-08-19 07:38:29'),
  (49, 1, 158, 'engeneer', '2024-08-19 07:38:29'),
  (50, 1, 161, 'engeneer', '2024-08-19 07:38:29'),
  (51, 1, 162, 'engeneer', '2024-08-19 07:38:29'),
  (52, 1, 163, 'engeneer', '2024-08-19 07:38:30'),
  (53, 1, 164, 'engeneer', '2024-08-19 07:38:30'),
  (54, 1, 165, 'engeneer', '2024-08-19 07:38:30'),
  (55, 1, 166, 'engeneer', '2024-08-19 07:38:30'),
  (56, 1, 167, 'engeneer', '2024-08-19 07:38:30'),
  (57, 1, 168, 'engeneer', '2024-08-19 07:38:30'),
  (
    58,
    1,
    9,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    59,
    1,
    11,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    60,
    1,
    13,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    61,
    1,
    27,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    62,
    1,
    30,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    63,
    1,
    31,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    64,
    1,
    33,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    65,
    1,
    37,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    66,
    1,
    38,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    67,
    1,
    40,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    68,
    1,
    41,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    69,
    1,
    42,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    70,
    1,
    43,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    71,
    1,
    48,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    72,
    1,
    51,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    73,
    1,
    52,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    74,
    1,
    56,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    75,
    1,
    57,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    76,
    1,
    59,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    77,
    1,
    64,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    78,
    1,
    79,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    79,
    1,
    81,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    80,
    1,
    84,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    81,
    1,
    85,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    82,
    1,
    88,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    83,
    1,
    89,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    84,
    1,
    92,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    85,
    1,
    98,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    86,
    1,
    106,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    87,
    1,
    108,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    88,
    1,
    133,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    89,
    1,
    135,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    90,
    1,
    136,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    91,
    1,
    139,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    92,
    1,
    140,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    93,
    1,
    142,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    94,
    1,
    143,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    95,
    1,
    144,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    96,
    1,
    145,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    97,
    1,
    149,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    98,
    1,
    151,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    99,
    1,
    152,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    100,
    1,
    153,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    101,
    1,
    154,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    102,
    1,
    155,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    103,
    1,
    156,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    104,
    1,
    157,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    105,
    1,
    158,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    106,
    1,
    161,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    107,
    1,
    162,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    108,
    1,
    163,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    109,
    1,
    164,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    110,
    1,
    165,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    111,
    1,
    166,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    112,
    1,
    167,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (
    113,
    1,
    168,
    'mambo zenu wakuu',
    '2024-08-24 19:57:50'
  ),
  (114, 1, 142, 'haloo', '2024-08-24 20:17:44'),
  (
    115,
    1,
    142,
    'uongo proxy',
    '2024-08-24 20:19:08'
  ),
  (116, 1, 9, 'hey  you', '2024-09-02 18:56:02'),
  (117, 1, 11, 'hey  you', '2024-09-02 18:56:02'),
  (118, 1, 13, 'hey  you', '2024-09-02 18:56:02'),
  (119, 1, 27, 'hey  you', '2024-09-02 18:56:02'),
  (120, 1, 30, 'hey  you', '2024-09-02 18:56:02'),
  (121, 1, 31, 'hey  you', '2024-09-02 18:56:02'),
  (122, 1, 33, 'hey  you', '2024-09-02 18:56:02'),
  (123, 1, 37, 'hey  you', '2024-09-02 18:56:02'),
  (124, 1, 38, 'hey  you', '2024-09-02 18:56:02'),
  (125, 1, 40, 'hey  you', '2024-09-02 18:56:02'),
  (126, 1, 41, 'hey  you', '2024-09-02 18:56:02'),
  (127, 1, 42, 'hey  you', '2024-09-02 18:56:02'),
  (128, 1, 43, 'hey  you', '2024-09-02 18:56:02'),
  (129, 1, 48, 'hey  you', '2024-09-02 18:56:02'),
  (130, 1, 51, 'hey  you', '2024-09-02 18:56:02'),
  (131, 1, 52, 'hey  you', '2024-09-02 18:56:02'),
  (132, 1, 56, 'hey  you', '2024-09-02 18:56:02'),
  (133, 1, 57, 'hey  you', '2024-09-02 18:56:02'),
  (134, 1, 59, 'hey  you', '2024-09-02 18:56:02'),
  (135, 1, 64, 'hey  you', '2024-09-02 18:56:02'),
  (136, 1, 79, 'hey  you', '2024-09-02 18:56:02'),
  (137, 1, 81, 'hey  you', '2024-09-02 18:56:02'),
  (138, 1, 84, 'hey  you', '2024-09-02 18:56:02'),
  (139, 1, 85, 'hey  you', '2024-09-02 18:56:02'),
  (140, 1, 88, 'hey  you', '2024-09-02 18:56:02'),
  (141, 1, 89, 'hey  you', '2024-09-02 18:56:02'),
  (142, 1, 92, 'hey  you', '2024-09-02 18:56:02'),
  (143, 1, 98, 'hey  you', '2024-09-02 18:56:02'),
  (144, 1, 106, 'hey  you', '2024-09-02 18:56:02'),
  (145, 1, 108, 'hey  you', '2024-09-02 18:56:02'),
  (146, 1, 133, 'hey  you', '2024-09-02 18:56:02'),
  (147, 1, 135, 'hey  you', '2024-09-02 18:56:02'),
  (148, 1, 136, 'hey  you', '2024-09-02 18:56:02'),
  (149, 1, 139, 'hey  you', '2024-09-02 18:56:02'),
  (150, 1, 140, 'hey  you', '2024-09-02 18:56:02'),
  (151, 1, 142, 'hey  you', '2024-09-02 18:56:02'),
  (152, 1, 143, 'hey  you', '2024-09-02 18:56:02'),
  (153, 1, 144, 'hey  you', '2024-09-02 18:56:02'),
  (154, 1, 145, 'hey  you', '2024-09-02 18:56:02'),
  (155, 1, 149, 'hey  you', '2024-09-02 18:56:02'),
  (156, 1, 151, 'hey  you', '2024-09-02 18:56:02'),
  (157, 1, 152, 'hey  you', '2024-09-02 18:56:02'),
  (158, 1, 153, 'hey  you', '2024-09-02 18:56:02'),
  (159, 1, 154, 'hey  you', '2024-09-02 18:56:02'),
  (160, 1, 155, 'hey  you', '2024-09-02 18:56:02'),
  (161, 1, 156, 'hey  you', '2024-09-02 18:56:02'),
  (162, 1, 157, 'hey  you', '2024-09-02 18:56:02'),
  (163, 1, 158, 'hey  you', '2024-09-02 18:56:02'),
  (164, 1, 161, 'hey  you', '2024-09-02 18:56:02'),
  (165, 1, 162, 'hey  you', '2024-09-02 18:56:02'),
  (166, 1, 163, 'hey  you', '2024-09-02 18:56:02'),
  (167, 1, 164, 'hey  you', '2024-09-02 18:56:02'),
  (168, 1, 165, 'hey  you', '2024-09-02 18:56:02'),
  (169, 1, 166, 'hey  you', '2024-09-02 18:56:02'),
  (170, 1, 167, 'hey  you', '2024-09-02 18:56:02'),
  (171, 1, 168, 'hey  you', '2024-09-02 18:56:02'),
  (
    172,
    9,
    1,
    'admin are u there',
    '2024-09-02 18:59:17'
  ),
  (173, 1, 9, 'hello mamboo', '2024-09-20 08:59:37'),
  (
    174,
    1,
    11,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    175,
    1,
    13,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    176,
    1,
    27,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    177,
    1,
    30,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    178,
    1,
    31,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    179,
    1,
    33,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    180,
    1,
    37,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    181,
    1,
    38,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    182,
    1,
    40,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    183,
    1,
    41,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    184,
    1,
    42,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    185,
    1,
    43,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    186,
    1,
    48,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    187,
    1,
    51,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    188,
    1,
    52,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    189,
    1,
    56,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    190,
    1,
    57,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    191,
    1,
    59,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    192,
    1,
    64,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    193,
    1,
    79,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    194,
    1,
    81,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    195,
    1,
    84,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    196,
    1,
    85,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    197,
    1,
    88,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    198,
    1,
    89,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    199,
    1,
    92,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    200,
    1,
    98,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    201,
    1,
    106,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    202,
    1,
    108,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    203,
    1,
    133,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    204,
    1,
    135,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    205,
    1,
    136,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    206,
    1,
    139,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    207,
    1,
    140,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    208,
    1,
    142,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    209,
    1,
    143,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    210,
    1,
    144,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    211,
    1,
    145,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    212,
    1,
    149,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    213,
    1,
    151,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    214,
    1,
    152,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    215,
    1,
    153,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    216,
    1,
    154,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    217,
    1,
    155,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    218,
    1,
    156,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    219,
    1,
    157,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    220,
    1,
    158,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    221,
    1,
    161,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    222,
    1,
    162,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    223,
    1,
    163,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    224,
    1,
    164,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    225,
    1,
    165,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    226,
    1,
    166,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    227,
    1,
    167,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    228,
    1,
    168,
    'hello mamboo',
    '2024-09-20 08:59:37'
  ),
  (
    229,
    9,
    1,
    'poa tunahitaji mzigo mbona umetucheleweshea unaakili kweli ww kijana',
    '2024-09-20 09:00:42'
  ),
  (230, 1, 9, 'usd buy  ', '2024-10-04 21:57:22'),
  (231, 1, 11, 'usd buy  ', '2024-10-04 21:57:22'),
  (232, 1, 13, 'usd buy  ', '2024-10-04 21:57:22'),
  (233, 1, 27, 'usd buy  ', '2024-10-04 21:57:22'),
  (234, 1, 30, 'usd buy  ', '2024-10-04 21:57:22'),
  (235, 1, 31, 'usd buy  ', '2024-10-04 21:57:22'),
  (236, 1, 33, 'usd buy  ', '2024-10-04 21:57:22'),
  (237, 1, 37, 'usd buy  ', '2024-10-04 21:57:22'),
  (238, 1, 38, 'usd buy  ', '2024-10-04 21:57:22'),
  (239, 1, 40, 'usd buy  ', '2024-10-04 21:57:22'),
  (240, 1, 41, 'usd buy  ', '2024-10-04 21:57:22'),
  (241, 1, 42, 'usd buy  ', '2024-10-04 21:57:22'),
  (242, 1, 43, 'usd buy  ', '2024-10-04 21:57:22'),
  (243, 1, 48, 'usd buy  ', '2024-10-04 21:57:22'),
  (244, 1, 51, 'usd buy  ', '2024-10-04 21:57:22'),
  (245, 1, 52, 'usd buy  ', '2024-10-04 21:57:22'),
  (246, 1, 56, 'usd buy  ', '2024-10-04 21:57:22'),
  (247, 1, 57, 'usd buy  ', '2024-10-04 21:57:22'),
  (248, 1, 59, 'usd buy  ', '2024-10-04 21:57:22'),
  (249, 1, 64, 'usd buy  ', '2024-10-04 21:57:22'),
  (250, 1, 79, 'usd buy  ', '2024-10-04 21:57:22'),
  (251, 1, 81, 'usd buy  ', '2024-10-04 21:57:22'),
  (252, 1, 84, 'usd buy  ', '2024-10-04 21:57:22'),
  (253, 1, 85, 'usd buy  ', '2024-10-04 21:57:22'),
  (254, 1, 88, 'usd buy  ', '2024-10-04 21:57:22'),
  (255, 1, 89, 'usd buy  ', '2024-10-04 21:57:22'),
  (256, 1, 92, 'usd buy  ', '2024-10-04 21:57:22'),
  (257, 1, 98, 'usd buy  ', '2024-10-04 21:57:22'),
  (258, 1, 106, 'usd buy  ', '2024-10-04 21:57:22'),
  (259, 1, 108, 'usd buy  ', '2024-10-04 21:57:22'),
  (260, 1, 133, 'usd buy  ', '2024-10-04 21:57:22'),
  (261, 1, 135, 'usd buy  ', '2024-10-04 21:57:22'),
  (262, 1, 136, 'usd buy  ', '2024-10-04 21:57:22'),
  (263, 1, 139, 'usd buy  ', '2024-10-04 21:57:22'),
  (264, 1, 140, 'usd buy  ', '2024-10-04 21:57:22'),
  (265, 1, 142, 'usd buy  ', '2024-10-04 21:57:22'),
  (266, 1, 143, 'usd buy  ', '2024-10-04 21:57:22'),
  (267, 1, 144, 'usd buy  ', '2024-10-04 21:57:22'),
  (268, 1, 145, 'usd buy  ', '2024-10-04 21:57:22'),
  (269, 1, 149, 'usd buy  ', '2024-10-04 21:57:22'),
  (270, 1, 151, 'usd buy  ', '2024-10-04 21:57:22'),
  (271, 1, 152, 'usd buy  ', '2024-10-04 21:57:22'),
  (272, 1, 153, 'usd buy  ', '2024-10-04 21:57:22'),
  (273, 1, 154, 'usd buy  ', '2024-10-04 21:57:22'),
  (274, 1, 155, 'usd buy  ', '2024-10-04 21:57:22'),
  (275, 1, 156, 'usd buy  ', '2024-10-04 21:57:22'),
  (276, 1, 157, 'usd buy  ', '2024-10-04 21:57:22'),
  (277, 1, 158, 'usd buy  ', '2024-10-04 21:57:22'),
  (278, 1, 161, 'usd buy  ', '2024-10-04 21:57:22'),
  (279, 1, 162, 'usd buy  ', '2024-10-04 21:57:22'),
  (280, 1, 163, 'usd buy  ', '2024-10-04 21:57:22'),
  (281, 1, 164, 'usd buy  ', '2024-10-04 21:57:22'),
  (282, 1, 165, 'usd buy  ', '2024-10-04 21:57:22'),
  (283, 1, 166, 'usd buy  ', '2024-10-04 21:57:22'),
  (284, 1, 167, 'usd buy  ', '2024-10-04 21:57:22'),
  (285, 1, 168, 'usd buy  ', '2024-10-04 21:57:22'),
  (286, 1, 9, 'mamboo', '2024-11-14 09:50:04'),
  (287, 9, 1, 'teddy', '2024-11-19 08:42:16'),
  (288, 1, 37, 'hellow', '2024-12-04 14:37:45'),
  (289, 9, 1, 'john neo', '2024-12-04 14:38:51');

-- --------------------------------------------------------
--
-- Table structure for table `migrations`
--
CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--
INSERT INTO
  `migrations` (`id`, `migration`, `batch`)
VALUES
  (
    2,
    '2014_10_12_100000_create_password_resets_table',
    1
  ),
  (
    3,
    '2016_06_01_000001_create_oauth_auth_codes_table',
    1
  ),
  (
    4,
    '2016_06_01_000002_create_oauth_access_tokens_table',
    1
  ),
  (
    5,
    '2016_06_01_000003_create_oauth_refresh_tokens_table',
    1
  ),
  (
    6,
    '2016_06_01_000004_create_oauth_clients_table',
    1
  ),
  (
    7,
    '2016_06_01_000005_create_oauth_personal_access_clients_table',
    1
  ),
  (
    8,
    '2019_08_19_000000_create_failed_jobs_table',
    1
  ),
  (9, '2020_06_08_125324_create_roles_table', 1),
  (
    10,
    '2020_06_10_050542_create_unit_convertions_table',
    1
  ),
  (
    11,
    '2020_06_10_053321_create_user_bills_table',
    1
  ),
  (
    12,
    '2020_06_10_071725_create_user_bill_progress_table',
    1
  ),
  (
    16,
    '2020_06_17_072553_create_assigned_specializations_table',
    2
  ),
  (
    17,
    '2020_06_17_072636_create_specialization_lists_table',
    2
  ),
  (
    18,
    '2020_06_23_120448_create_qc_manages_table',
    3
  ),
  (
    21,
    '2020_07_01_113408_create_user_accesses_table',
    4
  ),
  (
    22,
    '2020_07_02_165932_create_user_works_table',
    5
  ),
  (
    24,
    '2020_07_18_044632_create_work_statuses_table',
    6
  ),
  (
    25,
    '2020_07_19_200314_create_admin_task_processes_table',
    7
  ),
  (
    30,
    '2020_07_21_235724_create_task_rollups_table',
    8
  ),
  (
    32,
    '2020_07_10_204139_create_user_work_progress_table',
    9
  ),
  (
    33,
    '2020_08_18_193002_create_task_credits_table',
    10
  ),
  (34, '2014_10_12_000000_create_users_table', 11),
  (
    35,
    '2020_12_13_192734_create_task_verification_rolled_ups_table',
    12
  ),
  (
    38,
    '2020_12_28_092540_create_cron_instructions_table',
    13
  ),
  (
    39,
    '2020_12_28_102111_create_new_account_verifications_table',
    13
  ),
  (
    40,
    '2020_12_29_192024_create_transaction_details_table',
    14
  ),
  (
    41,
    '2020_12_30_064642_create_payment_methods_table',
    15
  ),
  (
    42,
    '2021_01_09_162221_create_point_conversions_table',
    16
  ),
  (
    43,
    '2021_02_17_191250_create_payments_table',
    17
  ),
  (
    44,
    '2021_02_17_203351_create_work_credits_table',
    18
  ),
  (
    45,
    '2021_03_14_233724_create_withdraw_requests_table',
    19
  ),
  (46, '2021_05_02_214250_create_jobs_table', 20);

-- --------------------------------------------------------
--
-- Table structure for table `new_account_verifications`
--
CREATE TABLE `new_account_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_sending_status` int(11) NOT NULL DEFAULT 0,
  `token_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `new_account_verifications`
--
INSERT INTO
  `new_account_verifications` (
    `id`,
    `user_id`,
    `verification_token`,
    `verification_sending_status`,
    `token_status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    192,
    138,
    'sB7j9dlry6MJiQ2fsWZi95hD6WkzkPjWWRP3gNjPXv3vFa96vrSaZCjbZOEdJCoDHnqKJTlvF1b6WH2v6brDRqINfeCxpLtLIUOM',
    1,
    1,
    '2022-06-20 16:29:26',
    '2022-06-20 16:37:49'
  ),
  (
    193,
    139,
    'XHxKEnPEaKkDM70mbwEf2gwQaf5uhwX1D2pX6aQtMKMeonhhMUyJT1GA5944KN0J5IpKlgC8EjxUqGQ1DqFyiRTXvpGIF5h5owtb',
    1,
    1,
    '2022-06-22 06:41:56',
    '2022-06-22 06:48:18'
  ),
  (
    195,
    141,
    '3aceSXnaEl29mSu7dWDX9X2nUAxiq2wNN2kv83jJB66moxBpkWGXfymeGJ1p6KIvGqYyN3jDceC4wZzifkeMV8EoVgSV1HfpGqhM',
    1,
    1,
    '2022-06-30 14:27:09',
    '2022-06-30 14:45:33'
  ),
  (
    196,
    142,
    '27oEuOlJofI456L3tLgCz8tu503gVNfWYq7gjTOKdd7FeWyMgxS4M5pjsXXUkIxmKo65oBBS54tnbNMZ5L4EGdHbZQoyh7miHRyf',
    1,
    1,
    '2022-06-30 14:27:09',
    '2022-06-30 14:47:14'
  ),
  (
    208,
    146,
    'JmShK6nmM0UedNSIsDjnLWjz9wtVjbFHG8qIo5RTCJDJynGjjFYE0omoVJb6GvogQY2NPpXRq7AFFwyPEphehscxczAooh63JSs0',
    1,
    1,
    '2022-07-02 16:50:58',
    '2022-07-02 16:58:22'
  ),
  (
    226,
    159,
    'dzrhOx4Z0pMQwh49R583gVv7bSVu21cz8w7S8mu11VujWgWIRgycrEX3em9bBjOuxw1stAM0zbwjBEIo7CVJqh9p1i4YPlrZvsn8',
    1,
    1,
    '2022-07-04 06:55:07',
    '2022-07-04 06:55:55'
  ),
  (
    227,
    140,
    'L7Gxvuv6Ksyay3Aq94Lpg3OvIKWWeT3Ea4BWkkxLaGcPAJcEo4PzrfZWJT3Dlnm302VCMwbMERIjkfze5Vz8m7jSya3y5p9qS98O',
    1,
    0,
    '2022-07-04 06:55:08',
    '2022-07-04 06:55:08'
  ),
  (
    228,
    143,
    'oUYV5U1QfUvGiPZQscY4bhieGDDOKEyH8D2W1zIkKC6Rmbrqk7Ehk8M3uNax8wcIYp6KASUH8QRFMadH9lWwJsTFZjNbDRjcstsh',
    1,
    0,
    '2022-07-04 06:55:08',
    '2022-07-04 06:55:08'
  ),
  (
    229,
    144,
    '8xK7Idxiby39D4UiVDuf14yBv9bxIDuDd3Y22XwpJzjx52D5Jw7KTDxmFLityLwCmZu94tAnMUveRkRLf8OpLn7D7rEnlkVlarvv',
    1,
    0,
    '2022-07-04 06:55:08',
    '2022-07-04 06:55:09'
  ),
  (
    230,
    145,
    '1h20ZAlw8nLMlb21twsfP4ENk99b922pPmZA1U9m5AMkf7MPt9ZPrFOY6oZE4K0i9ggDShcIprazah0SXfhEuQ8UEuaztzewYdqH',
    1,
    0,
    '2022-07-04 06:55:09',
    '2022-07-04 06:55:09'
  ),
  (
    231,
    147,
    'QKzUT8bGF91xujxlJ0cwpbWvA30tF2nyN2GDRdavolkeoCDjeXfiJkyr7bHHbjQUjtgxwDFYAcCp1lChXjNlF2HBHNbOzTST6CMV',
    1,
    0,
    '2022-07-04 06:55:09',
    '2022-07-04 06:55:09'
  ),
  (
    232,
    149,
    'gBUEk7YahFiXLnl68hm4s1KxdUfikUFDHZD4YYaoNcrb0bcd0oRRURtIV443nNTOtdjlGvdvWPKX2tsMIl1cZunQQ2nvdzaa0xwh',
    1,
    0,
    '2022-07-04 06:55:09',
    '2022-07-04 06:55:09'
  ),
  (
    233,
    150,
    'NjbohJYUMgSoAJEXOUWRbq2brbl8DGFk2qhETLvd0YeN94OyzoFfoVtlZzlU2WxI1EVXwSTzqycqzfpbxFxiJvJVkVNMAziNrijp',
    1,
    0,
    '2022-07-04 06:55:09',
    '2022-07-04 10:22:37'
  ),
  (
    234,
    151,
    '0pVMXj5TwJRkxGZrelkdPEtkNqHjYKlgMKiDy2a1mWW3V3nRqW37r7ztsdwTpZbJTh408yen2gGCkAnxfyGgYODuuBOpWuWRKDSr',
    1,
    0,
    '2022-07-04 06:55:09',
    '2022-07-04 06:55:09'
  ),
  (
    235,
    152,
    'TF3MciiWoDD4Lz4cyTlk0SpMMieFjRkBxB7dOgL3PVRLfL5b4Q2vc2oLHyzVkxzUTVB19GEVDc7giErnUIzPhm64gx6O2ItWmfaq',
    1,
    0,
    '2022-07-04 06:55:09',
    '2022-07-04 06:55:10'
  ),
  (
    236,
    153,
    'yWaQ0Uc6J8ZPdL2cTMEkap70OWx45f6YqA6rdw9BhVkWqIALxHSBYUj9yoJMLmb8kHDCqyjI7F8qAWz8Ojdr2cw2pDUkVsRO5Abj',
    1,
    1,
    '2022-07-04 06:55:10',
    '2022-07-04 18:20:52'
  ),
  (
    237,
    154,
    'OApvZRQRm5d8Ix3w4s7C3uk9fXzFBs2bYUJU5558PAZixitutfw5fYwMupDx5Jq1vu2sUkx9Zrs2s3Akogrt4iCUG5so3md6G7r0',
    1,
    0,
    '2022-07-04 06:55:10',
    '2022-07-04 06:55:10'
  ),
  (
    238,
    155,
    'E2rWv9QVzRxCJwX3gcSAmB2Z3Wx9B4SB5Un8TJI1pE5b6cVWf64KYp58HSGUbCfOwQ0VrMDxcwaGsZNQoRneoyN56KYq1Ga2N2zq',
    1,
    0,
    '2022-07-04 06:55:10',
    '2022-07-04 06:55:10'
  ),
  (
    239,
    156,
    'YQd6KJatAHVIWGow55MNaCedXvS6BuRitT6KgP2mYeEhxrQvCCmBjsoJEIkw4GQ3wU4KBKDhnOpYdWZVLLNzl2LhdNLVeC4wdghr',
    1,
    0,
    '2022-07-04 06:55:10',
    '2022-07-04 06:55:10'
  ),
  (
    240,
    158,
    'B1WTAoSal4Ru0pebRnfpqSbkIhnmIy5N0nl4D6hgkos017a89j6PTmIImugv2wyaHlHOfxPOBaXaiKrPgBA7EuOMX26t2tJHjjpO',
    1,
    1,
    '2022-07-04 06:55:10',
    '2022-07-04 08:47:14'
  ),
  (
    241,
    160,
    'jSqKSeQu79TVMYtMkISZS8jH9qeofiK8lKi8HVpuXy8rofXhHRG75fyRdJINWRkqPE6hD7bqswrcm5HPAOLhWs5Ys20FkD9w7wEK',
    1,
    1,
    '2022-07-04 06:58:13',
    '2022-07-04 06:59:53'
  ),
  (
    242,
    161,
    'GqzzO3J9RDwpyRN4pV0mXQlsjPzicY2QIy3eRexoxe86kEF6uTsx2ph3TTmMNfhRbRghpGGAHMBfa8ugijUksa5jIZx9ykUWVBNp',
    1,
    1,
    '2022-07-04 07:08:58',
    '2022-07-04 07:13:25'
  ),
  (
    243,
    162,
    '1paQWIYXL6s1BA0AxVIonEisFiYUzKSVLKObqWb0v7MpCfPmVlmAPeLNmNsyPAG7R0Nj98rdMu9STuL1LvMVzSMamxkfIWLgv51H',
    1,
    0,
    '2022-07-04 15:42:06',
    '2022-07-04 15:42:06'
  ),
  (
    244,
    163,
    'hE0K5estwH0eyHkWPCwaOvwxRRIytSXiknd0gNlVCvwfhQLND00FPcZ3qA2Acdvuqu95I9MbrLU3mqCyq7clOSN0hlefC030CL5v',
    1,
    0,
    '2022-07-05 17:33:44',
    '2022-07-05 17:37:33'
  ),
  (
    245,
    164,
    '4BbS6GP2y7FllGuq9AtvTnJ0KKxMziH1mdBH5UqfdsSaIRTlRhXerJYp4GkfvBCrsMNL76O7MtYzHjoGKWTsOYXh0GIqndAazvoC',
    1,
    0,
    '2022-07-05 20:11:09',
    '2022-07-05 20:11:09'
  ),
  (
    246,
    165,
    'FK32266deAZb1NBLAK1WW2QBl2voyice1ASewPl9NdzCk4vfBnzatYjNayYSxTLx3Hf7n8Gzgts2olQJwdIeaHotL44OSBqfMfws',
    1,
    1,
    '2022-07-06 09:18:24',
    '2022-07-06 09:29:19'
  ),
  (
    247,
    166,
    'vJstaRy2Q2t1TJxCHjrpmyQLYa6ERMdiDLLn8GzX8w5kqxqKSDb62EVqHQT3s8hgOyV2Q1sEKXBbThkwaCJ0wS7iic6SwLks83fc',
    1,
    1,
    '2022-07-07 08:25:15',
    '2022-07-07 08:26:52'
  ),
  (
    248,
    167,
    'HU2WLGB70YRUEENjtHUBuT2FLzgYnakVMLCdJbDDzFet20zWSvfxBdNQFMoe3mnjnyfN5PrVO1Dv9gZTcOCX6YX2HONhnYEVBJpt',
    1,
    0,
    '2022-07-07 11:56:22',
    '2022-07-07 11:56:22'
  ),
  (
    249,
    168,
    '6RSnIc8Yy9uhxcHSJ9P1BIBFMpyRjXb3G9fBWfp57jPBmsuNcKPnxpUK3YV9l8ht195Ew5HxZmf278NrfYUJIJ2SLoknVVnJai1V',
    1,
    1,
    '2022-07-08 07:54:42',
    '2022-07-08 08:29:19'
  );

-- --------------------------------------------------------
--
-- Table structure for table `notify_unverified_users`
--
CREATE TABLE `notify_unverified_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `notified_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `notify_unverified_users`
--
INSERT INTO
  `notify_unverified_users` (
    `id`,
    `user_id`,
    `notified_status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    140,
    1,
    '2022-07-01 14:41:18',
    '2022-07-01 14:41:18'
  ),
  (
    8,
    143,
    1,
    '2022-07-01 14:41:19',
    '2022-07-01 14:41:19'
  ),
  (
    9,
    144,
    1,
    '2022-07-01 14:41:19',
    '2022-07-01 14:41:19'
  ),
  (
    10,
    145,
    1,
    '2022-07-01 14:41:19',
    '2022-07-01 14:41:19'
  ),
  (
    11,
    146,
    1,
    '2022-07-01 14:41:19',
    '2022-07-01 14:41:19'
  ),
  (
    12,
    147,
    1,
    '2022-07-01 14:41:19',
    '2022-07-01 14:41:19'
  ),
  (
    13,
    148,
    1,
    '2022-07-01 14:41:19',
    '2022-07-01 14:41:19'
  ),
  (
    14,
    149,
    1,
    '2022-07-03 00:05:02',
    '2022-07-03 00:05:02'
  ),
  (
    15,
    150,
    1,
    '2022-07-03 00:05:02',
    '2022-07-03 00:05:02'
  ),
  (
    16,
    151,
    1,
    '2022-07-03 00:05:03',
    '2022-07-03 00:05:03'
  ),
  (
    17,
    152,
    1,
    '2022-07-04 00:05:03',
    '2022-07-04 00:05:03'
  ),
  (
    18,
    153,
    1,
    '2022-07-04 00:05:03',
    '2022-07-04 00:05:03'
  ),
  (
    19,
    154,
    1,
    '2022-07-04 00:05:03',
    '2022-07-04 00:05:03'
  ),
  (
    20,
    155,
    1,
    '2022-07-04 00:05:03',
    '2022-07-04 00:05:03'
  ),
  (
    21,
    156,
    1,
    '2022-07-04 00:05:03',
    '2022-07-04 00:05:03'
  ),
  (
    22,
    158,
    1,
    '2022-07-04 00:05:03',
    '2022-07-04 00:05:03'
  ),
  (
    23,
    162,
    1,
    '2022-07-05 00:05:04',
    '2022-07-05 00:05:04'
  ),
  (
    24,
    163,
    1,
    '2022-07-09 00:05:04',
    '2022-07-09 00:05:04'
  ),
  (
    25,
    164,
    1,
    '2022-07-09 00:05:04',
    '2022-07-09 00:05:04'
  ),
  (
    26,
    167,
    1,
    '2022-07-09 00:05:04',
    '2022-07-09 00:05:04'
  );

-- --------------------------------------------------------
--
-- Table structure for table `oauth_access_tokens`
--
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--
INSERT INTO
  `oauth_access_tokens` (
    `id`,
    `user_id`,
    `client_id`,
    `name`,
    `scopes`,
    `revoked`,
    `created_at`,
    `updated_at`,
    `expires_at`
  )
VALUES
  (
    '00086ad36186afbdda2f3b43dd15e7a3d55036d7724f6e963490c5b3f59e9c1e6a1b0d579fa5dde6',
    12,
    3,
    NULL,
    '[]',
    0,
    '2021-08-03 09:18:50',
    '2021-08-03 09:18:50',
    '2022-08-03 12:18:50'
  ),
  (
    '0c24914426f9017d1bcb4d9cac8c2a273dae13b7f826a4b1958fa02337df5ade545b89d9fc139f0f',
    12,
    4,
    'authToken',
    '[]',
    0,
    '2021-08-03 11:07:37',
    '2021-08-03 11:07:37',
    '2022-08-03 14:07:37'
  ),
  (
    '0fe9c7f72300cccf072b11b0c73e2724fbf0757e94c0e8b496bcfef3a4a4981bb35f1208b4980e74',
    12,
    4,
    'Laravel Password Grant Client',
    '[]',
    0,
    '2021-08-03 10:05:29',
    '2021-08-03 10:05:29',
    '2022-08-03 13:05:29'
  ),
  (
    '20ee2413b8cf07da3b5e62bed67a9e864d1f0214118c7172b40c3e4c447d2179aeb70d99b65f8456',
    12,
    4,
    'authToken',
    '[]',
    0,
    '2021-08-03 17:31:51',
    '2021-08-03 17:31:51',
    '2022-08-03 20:31:51'
  ),
  (
    '234084e784a91d5fdafea8c8436d83752f1e4ee543c4a780b02a37af35a8b944c9d583c2809a7470',
    12,
    4,
    'API Token',
    '[]',
    0,
    '2021-08-03 10:13:00',
    '2021-08-03 10:13:00',
    '2022-08-03 13:13:00'
  ),
  (
    '4194849d988f8e42fe26d57feb3298b897a0ca6b2e746121e7de2be0ca72b063f09a36ea2af7d91f',
    12,
    3,
    NULL,
    '[]',
    0,
    '2021-08-03 09:15:32',
    '2021-08-03 09:15:32',
    '2022-08-03 12:15:32'
  ),
  (
    '62305cbec3b10701c3c42bc1d06075a53b9cdae27e81e94703846c6866cc7c364e553e5c105a7b84',
    12,
    3,
    NULL,
    '[]',
    0,
    '2021-08-03 09:35:17',
    '2021-08-03 09:35:17',
    '2022-08-03 12:35:17'
  ),
  (
    'ae00e94dfaa5ddc9d8c629485aef02ca1193c21540f741ad130b72009ed8f40f0a11723c9b4f0471',
    12,
    3,
    NULL,
    '[]',
    0,
    '2021-08-03 09:45:31',
    '2021-08-03 09:45:31',
    '2022-08-03 12:45:31'
  ),
  (
    'bc6bd38a97151257c99d51e9808ebfecdbe91458e5d6092eac77ae60bfe685465d9ec6673a642d39',
    12,
    4,
    NULL,
    '[]',
    0,
    '2021-08-03 09:49:19',
    '2021-08-03 09:49:19',
    '2022-08-03 12:49:19'
  ),
  (
    'c2558cb5ee39133299373fd3a66ff3ecc1f468d237169a9914acd2fdf80ca6395e1eff9ff84850b1',
    12,
    4,
    'Laravel Password Grant Client',
    '[]',
    0,
    '2021-08-03 10:06:14',
    '2021-08-03 10:06:14',
    '2022-08-03 13:06:14'
  ),
  (
    'cc827c82f31532e1b26cc1dbf09353922bac0fac8ff4e3e69420b680c208d6f547e3ba8a781d7ff3',
    12,
    4,
    'Laravel Password Grant Client',
    '[]',
    0,
    '2021-08-03 10:01:24',
    '2021-08-03 10:01:24',
    '2022-08-03 13:01:24'
  ),
  (
    'e2e591017db41ce2885bd3d860798f46378acd0dbf086f181d742d731e4cf00d8d3ce34c5e6be4e2',
    12,
    3,
    NULL,
    '[]',
    0,
    '2021-08-03 09:39:35',
    '2021-08-03 09:39:35',
    '2022-08-03 12:39:35'
  ),
  (
    'eb218852b33731c04077978740c881ad1134205d6922b5724d508c23ba477e3847656390d722ddc3',
    12,
    3,
    NULL,
    '[]',
    0,
    '2021-08-03 09:35:02',
    '2021-08-03 09:35:02',
    '2022-08-03 12:35:02'
  );

-- --------------------------------------------------------
--
-- Table structure for table `oauth_auth_codes`
--
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Table structure for table `oauth_clients`
--
CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--
INSERT INTO
  `oauth_clients` (
    `id`,
    `user_id`,
    `name`,
    `secret`,
    `provider`,
    `redirect`,
    `personal_access_client`,
    `password_client`,
    `revoked`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    NULL,
    'Laravel Personal Access Client',
    'Fin7nDG69E9ryj7OHWHCtPY0uNgOYQx5wpcICMNz',
    NULL,
    'http://localhost',
    1,
    0,
    0,
    '2021-08-02 17:27:45',
    '2021-08-02 17:27:45'
  ),
  (
    2,
    NULL,
    'Laravel Password Grant Client',
    'IrSJUa8MWSvh7gDOlQgCkSJ7Uczcw7fCzsU9zRO8',
    'users',
    'http://localhost',
    0,
    1,
    0,
    '2021-08-02 17:27:45',
    '2021-08-02 17:27:45'
  ),
  (
    3,
    NULL,
    'Surveying',
    '8x5arQ6JxSLnMx8XYFQW9VA0i3hYc72bIDTUiDel',
    NULL,
    'http://localhost',
    1,
    0,
    0,
    '2021-08-02 18:59:16',
    '2021-08-02 18:59:16'
  ),
  (
    4,
    NULL,
    'Laravel Personal Access Client',
    'qLSKpnv6qF7AxqrQDlTfpoxPHvgJ0sYLpGeoeHyA',
    NULL,
    'http://localhost',
    1,
    0,
    0,
    '2021-08-03 09:47:22',
    '2021-08-03 09:47:22'
  ),
  (
    5,
    NULL,
    'Laravel Password Grant Client',
    'MUCooUqtmpLsv7F4h61sxJIjEgOQasPtS6EbeKvx',
    'users',
    'http://localhost',
    0,
    1,
    0,
    '2021-08-03 09:47:22',
    '2021-08-03 09:47:22'
  ),
  (
    6,
    NULL,
    'Api Token',
    'GPHyxGb3RNIVOLD1jcuqaGW5GUhTd9yq8t4FR8lw',
    NULL,
    'http://surveying_project.test/auth/callback',
    0,
    0,
    0,
    '2021-08-03 10:32:42',
    '2021-08-03 10:32:42'
  );

-- --------------------------------------------------------
--
-- Table structure for table `oauth_personal_access_clients`
--
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--
INSERT INTO
  `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
  (
    1,
    1,
    '2021-08-02 17:27:45',
    '2021-08-02 17:27:45'
  ),
  (
    2,
    3,
    '2021-08-02 18:59:16',
    '2021-08-02 18:59:16'
  ),
  (
    3,
    4,
    '2021-08-03 09:47:22',
    '2021-08-03 09:47:22'
  );

-- --------------------------------------------------------
--
-- Table structure for table `oauth_refresh_tokens`
--
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Table structure for table `password_resets`
--
CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Table structure for table `payments`
--
CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL,
  `total_amount` decimal(15, 2) NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--
INSERT INTO
  `payments` (
    `id`,
    `customer_user`,
    `task_id`,
    `total_amount`,
    `payment_status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    '8',
    19,
    '265000.00',
    'PAID',
    '2021-12-22 18:17:23',
    '2021-12-22 18:17:23'
  ),
  (
    2,
    '8',
    23,
    '26500.00',
    'PAID',
    '2022-06-19 14:18:00',
    '2022-06-19 14:18:00'
  ),
  (
    3,
    '8',
    24,
    '265000.00',
    'PAID',
    '2022-06-20 10:20:47',
    '2022-06-20 10:20:47'
  ),
  (
    5,
    '8',
    25,
    '2650000.00',
    'PAID',
    '2022-06-20 16:30:46',
    '2022-06-20 16:30:46'
  ),
  (
    6,
    '8',
    28,
    '29150.00',
    'PAID',
    '2022-06-25 14:43:32',
    '2022-06-25 14:43:32'
  ),
  (
    7,
    '8',
    28,
    '29150.00',
    'PAID',
    '2022-06-25 14:43:45',
    '2022-06-25 14:43:45'
  ),
  (
    8,
    '8',
    26,
    '424000.00',
    'PAID',
    '2022-06-26 11:00:34',
    '2022-06-26 11:00:34'
  ),
  (
    9,
    '8',
    26,
    '424000.00',
    'PAID',
    '2022-06-26 11:14:03',
    '2022-06-26 11:14:03'
  ),
  (
    10,
    '8',
    27,
    '251220.00',
    'PAID',
    '2022-06-26 11:31:03',
    '2022-06-26 11:31:03'
  );

-- --------------------------------------------------------
--
-- Table structure for table `payment_methods`
--
CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--
INSERT INTO
  `payment_methods` (
    `id`,
    `payment_name`,
    `currency`,
    `image`,
    `status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'Paypal',
    'Usd',
    'https://pngimg.com/uploads/paypal/paypal_PNG12.png',
    1,
    '2021-01-07 16:43:12',
    '2021-04-10 20:49:50'
  ),
  (
    3,
    'Vodacom',
    'Tsh',
    'https://download.logo.wine/logo/Vodacom/Vodacom-Logo.wine.png',
    1,
    '2021-01-09 07:03:48',
    '2021-04-10 21:00:55'
  ),
  (
    4,
    'Tigo',
    'Tsh',
    'https://upload.wikimedia.org/wikipedia/commons/6/69/Logo_Tigo.svg',
    1,
    '2021-01-09 07:04:28',
    '2021-04-10 21:01:20'
  ),
  (
    5,
    'Airtel',
    'Tsh',
    'https://download.logo.wine/logo/Airtel_Tanzania/Airtel_Tanzania-Logo.wine.png',
    1,
    '2021-04-10 21:02:46',
    '2021-04-10 21:02:46'
  ),
  (
    6,
    'Halotel',
    'Tsh',
    'https://upload.wikimedia.org/wikipedia/en/3/37/Viettel_Tanzania_Halotel_logo.png',
    1,
    '2021-04-10 21:05:20',
    '2021-04-10 21:05:20'
  ),
  (
    7,
    'TTCL',
    'Tsh',
    'https://allo.monisnap.com/assets/images/generated_operators/ttcl.png',
    1,
    '2021-04-10 21:06:56',
    '2021-04-10 21:06:56'
  ),
  (
    8,
    'Zantel',
    'Tsh',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx_wp2TVIy2qUe1-h7swe7w0NFuItFK5srsg&usqp=CAU',
    1,
    '2021-04-10 21:10:57',
    '2021-04-10 21:10:57'
  );

-- --------------------------------------------------------
--
-- Table structure for table `point_conversions`
--
CREATE TABLE `point_conversions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `points` int(11) NOT NULL,
  `conversion_in_tzs` int(11) NOT NULL,
  `conversion_in_usd` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `point_conversions`
--
INSERT INTO
  `point_conversions` (
    `id`,
    `points`,
    `conversion_in_tzs`,
    `conversion_in_usd`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    1,
    2500,
    1,
    '2021-01-09 16:07:29',
    '2021-06-08 08:45:44'
  );

-- --------------------------------------------------------
--
-- Table structure for table `qc_manages`
--
CREATE TABLE `qc_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `qc_assigned` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `qc_manages`
--
INSERT INTO
  `qc_manages` (
    `id`,
    `user_id`,
    `qc_assigned`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    11,
    11,
    1,
    '2020-12-13 14:56:38',
    '2020-12-13 14:56:38'
  ),
  (
    14,
    118,
    1,
    '2021-11-30 05:45:11',
    '2021-11-30 05:45:11'
  );

-- --------------------------------------------------------
--
-- Table structure for table `roles`
--
CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--
INSERT INTO
  `roles` (`id`, `role_name`, `created_at`, `updated_at`)
VALUES
  (1, 'admin', NULL, NULL),
  (2, 'user', NULL, NULL),
  (3, 'client', NULL, NULL);

-- --------------------------------------------------------
--
-- Table structure for table `specialization_lists`
--
CREATE TABLE `specialization_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `specialization_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `specialization_lists`
--
INSERT INTO
  `specialization_lists` (
    `id`,
    `specialization_name`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Cadastral Surveying',
    NULL,
    '2021-03-06 19:52:19'
  ),
  (
    2,
    'Engineering Surveying',
    NULL,
    '2021-03-06 19:49:35'
  ),
  (
    4,
    'Geodesy and Control Survey',
    '2020-06-30 14:30:05',
    '2021-03-06 19:51:16'
  ),
  (
    5,
    'Mining Surveying',
    '2020-06-30 14:30:26',
    '2021-03-06 19:50:50'
  ),
  (
    7,
    'Geology Surveying',
    '2020-07-02 12:00:02',
    '2021-03-06 19:51:46'
  ),
  (
    12,
    'Topographical Surveying',
    '2021-03-06 19:52:44',
    '2021-03-06 19:52:44'
  ),
  (
    13,
    'Route Surveying',
    '2021-03-06 19:54:49',
    '2021-03-06 19:54:49'
  ),
  (
    14,
    'Chain Surveying',
    '2021-03-06 19:55:13',
    '2021-03-06 19:55:13'
  ),
  (
    15,
    'Mapping',
    '2021-03-06 19:56:09',
    '2021-03-06 19:56:09'
  ),
  (
    16,
    'Site Planning Survey',
    '2021-03-06 19:56:46',
    '2021-03-06 19:56:46'
  ),
  (
    17,
    'GIS',
    '2021-03-06 19:57:30',
    '2021-03-06 19:57:30'
  ),
  (
    18,
    'Modelling',
    '2021-03-06 19:57:52',
    '2021-03-06 19:57:52'
  ),
  (
    19,
    'Hydrographic Surveying',
    '2021-03-06 19:59:18',
    '2021-03-06 19:59:18'
  ),
  (
    20,
    'Instrument Operator',
    '2021-03-06 20:02:53',
    '2021-03-06 20:02:53'
  ),
  (
    21,
    'Vectorization',
    '2021-03-06 20:26:19',
    '2021-03-06 20:26:19'
  ),
  (
    22,
    'Digitazation',
    '2021-03-07 15:15:28',
    '2021-03-07 15:15:28'
  ),
  (
    23,
    'Geology',
    '2021-03-11 05:11:11',
    '2021-03-11 05:11:11'
  ),
  (
    24,
    'Construction',
    '2021-03-11 05:11:31',
    '2021-03-11 05:11:31'
  ),
  (
    25,
    'Engineering',
    '2021-03-11 05:11:39',
    '2021-03-11 05:11:39'
  ),
  (
    26,
    'Image processing',
    '2021-04-02 06:54:06',
    '2021-04-02 06:54:06'
  ),
  (
    27,
    'Statistics',
    '2021-04-17 06:39:19',
    '2021-04-17 06:39:19'
  ),
  (
    28,
    'Data mining',
    '2021-11-08 03:12:03',
    '2021-11-08 03:12:03'
  ),
  (
    29,
    'Data VISUALIZATION',
    '2021-11-08 04:45:34',
    '2021-11-08 04:45:34'
  ),
  (
    30,
    'Equipments',
    '2021-11-27 06:31:34',
    '2021-11-27 06:31:34'
  ),
  (
    31,
    'Xfrey',
    '2021-11-29 16:38:22',
    '2021-11-29 16:38:22'
  ),
  (
    32,
    'Taxation',
    '2022-06-20 17:08:51',
    '2022-06-20 17:08:51'
  ),
  (
    34,
    'Enviromnent',
    '2022-07-02 16:18:37',
    '2022-07-02 16:18:37'
  ),
  (
    35,
    'Finance',
    '2022-07-04 08:35:25',
    '2022-07-04 08:35:25'
  ),
  (
    36,
    'Auditing',
    '2022-07-04 08:35:35',
    '2022-07-04 08:35:35'
  ),
  (
    37,
    'Equipment hiring',
    '2022-07-04 08:35:49',
    '2022-07-04 08:35:49'
  ),
  (
    38,
    'Marketing',
    '2022-07-04 08:50:24',
    '2022-07-04 08:50:24'
  ),
  (
    39,
    'Community Development',
    '2022-07-04 08:51:31',
    '2022-07-04 08:51:31'
  ),
  (
    40,
    'Developer',
    '2022-07-04 09:43:05',
    '2022-07-04 09:43:05'
  ),
  (
    41,
    'Cartographer',
    '2022-07-08 08:49:12',
    '2022-07-08 08:49:12'
  );

-- --------------------------------------------------------
--
-- Table structure for table `task_credits`
--
CREATE TABLE `task_credits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_credits` decimal(7, 2) NOT NULL,
  `qc_credits` decimal(7, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `task_credits`
--
INSERT INTO
  `task_credits` (
    `id`,
    `assigned_by`,
    `task_id`,
    `category_id`,
    `user_credits`,
    `qc_credits`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    25,
    1,
    24,
    1,
    '10.00',
    '10.00',
    '2022-06-20 09:48:21',
    '2022-06-20 09:48:21'
  ),
  (
    26,
    1,
    24,
    2,
    '1.00',
    '1.00',
    '2022-06-20 10:23:53',
    '2022-06-20 10:23:53'
  ),
  (
    27,
    1,
    25,
    1,
    '20.00',
    '20.00',
    '2022-06-20 15:55:34',
    '2022-06-20 15:55:34'
  ),
  (
    28,
    1,
    26,
    32,
    '80.00',
    '80.00',
    '2022-06-22 08:59:17',
    '2022-06-22 09:11:35'
  ),
  (
    29,
    1,
    27,
    32,
    '80.00',
    '14.80',
    '2022-06-22 09:09:57',
    '2022-06-22 09:09:57'
  ),
  (
    30,
    1,
    28,
    1,
    '1.00',
    '1.00',
    '2022-06-25 10:26:41',
    '2022-06-25 10:26:41'
  );

-- --------------------------------------------------------
--
-- Table structure for table `task_rollups`
--
CREATE TABLE `task_rollups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `rolled_up_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `task_rollups`
--
INSERT INTO
  `task_rollups` (
    `id`,
    `task_id`,
    `category_id`,
    `rolled_up_by`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    10,
    24,
    1,
    9,
    '2022-06-20 10:03:22',
    '2022-06-20 10:03:22'
  ),
  (
    11,
    24,
    2,
    9,
    '2022-06-20 10:24:37',
    '2022-06-20 10:24:37'
  ),
  (
    13,
    25,
    1,
    9,
    '2022-06-20 15:57:41',
    '2022-06-20 15:57:41'
  ),
  (
    14,
    26,
    32,
    139,
    '2022-06-24 12:14:22',
    '2022-06-24 12:14:22'
  ),
  (
    15,
    27,
    32,
    139,
    '2022-06-24 12:20:53',
    '2022-06-24 12:20:53'
  ),
  (
    20,
    28,
    1,
    9,
    '2022-06-25 14:34:33',
    '2022-06-25 14:34:33'
  ),
  (
    21,
    29,
    31,
    9,
    '2022-07-12 11:00:57',
    '2022-07-12 11:00:57'
  );

-- --------------------------------------------------------
--
-- Table structure for table `task_verification_rolled_ups`
--
CREATE TABLE `task_verification_rolled_ups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `rolledup_tasks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `task_verification_rolled_ups`
--
INSERT INTO
  `task_verification_rolled_ups` (
    `id`,
    `user_id`,
    `rolledup_tasks`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    11,
    '2,1,4,5,7,32,31',
    '2022-05-14 20:16:10',
    '2022-07-12 11:44:55'
  );

-- --------------------------------------------------------
--
-- Table structure for table `transaction_details`
--
CREATE TABLE `transaction_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `initiated_by` int(11) NOT NULL,
  `payments_method` int(11) NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `initiated_on` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2020-12-29 19:51:25',
  `processed_on` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Table structure for table `unit_convertions`
--
CREATE TABLE `unit_convertions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `units` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `firstname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_verification` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` int(255) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (
    `id`,
    `role_id`,
    `firstname`,
    `lastname`,
    `email`,
    `phone`,
    `gender`,
    `profile`,
    `password`,
    `account_verification`,
    `remember_token`,
    `created_at`,
    `updated_at`,
    `unique_id`,
    `status`
  )
VALUES
  (
    1,
    1,
    'First',
    'Admin',
    'admin@surveying.com',
    '07680454353',
    'Male',
    '1656923766.png',
    '$2y$10$E15xmzeKoIYWZeDa3UN6bOLMc1KyH5cdJPHi6XHC9eqHVr87txGuu',
    1,
    NULL,
    NULL,
    '2022-07-04 09:36:06',
    0,
    ''
  ),
  (
    8,
    3,
    'Imani',
    'XAVERY',
    'xfrey@live.com',
    '75999',
    'Male',
    '1655711917.png',
    '$2y$10$y/oBdLqw/cBK4rJNTeN9wObmjibx1VSRzbkQsdA4nDDFYgCEb6Mre',
    1,
    NULL,
    '2020-09-09 04:22:05',
    '2022-06-20 08:58:38',
    0,
    ''
  ),
  (
    9,
    2,
    'Super',
    'User',
    'surveying@xfrey.co.tz',
    '0683162556',
    'Male',
    '1652556461.png',
    '$2y$10$nzkNxpb95AY4okff45DRWu2C640OLGZnUmexuYT1qqTLIO3xdImxS',
    1,
    NULL,
    '2020-09-18 02:41:01',
    '2022-05-14 19:27:41',
    0,
    ''
  ),
  (
    11,
    2,
    'Super',
    'QC',
    'superqc@xfrey.co.tz',
    '0683162556',
    'Male',
    '1656848627.png',
    '$2y$10$nzkNxpb95AY4okff45DRWu2C640OLGZnUmexuYT1qqTLIO3xdImxS',
    1,
    NULL,
    '2020-09-18 06:13:16',
    '2022-07-03 12:43:48',
    0,
    ''
  ),
  (
    12,
    1,
    'Super',
    'Admin',
    'superadmin@xfrey.co.tz',
    '0683162556',
    'Male',
    'pop.jpg',
    '$2y$10$5TXpcNRKMc7ITe6LICF4kOwGwJjfIYEMlsigKKdngUVv2ChpLsYBW',
    1,
    NULL,
    '2020-09-25 08:02:42',
    '2021-12-10 07:46:15',
    0,
    ''
  ),
  (
    13,
    2,
    'Erasto',
    'Mashauri',
    'erastomasha@gmail.com',
    '0787450364',
    'Male',
    '-',
    '$2y$10$A0Cw6iycSGZ5dHJkjTktdewsZ7a4Uxxufo9fAmYvSQqBWjfT4Ax9G',
    1,
    NULL,
    '2020-09-25 12:54:58',
    '2020-09-25 12:59:45',
    0,
    ''
  ),
  (
    27,
    2,
    'Nicas',
    'Mboya',
    'nicasmboya@gmail.com',
    '0653044805',
    'Male',
    '-',
    '$2y$10$NZvQeo153WpZA26h00FEge4hD68zmcR2iN2iaTes5dK3pQ1FxVeD.',
    1,
    NULL,
    '2021-02-16 09:26:42',
    '2021-02-16 11:52:43',
    0,
    ''
  ),
  (
    30,
    2,
    'Mwanahamisi',
    'Gogo',
    'gogomwanahamisi@gmail.com',
    '+255783054014',
    'Female',
    '-',
    '$2y$10$oQyGB5qp6YbkWR1UBh27KOtY1Ny7QYitt1tBivSkh10gT8Mk5plg2',
    1,
    NULL,
    '2021-02-17 00:31:13',
    '2021-02-17 00:35:20',
    0,
    ''
  ),
  (
    31,
    2,
    'Frank',
    'Mwandi',
    'frankmwandi93@gmail.com',
    '+255767444346',
    'Male',
    '-',
    '$2y$10$H9uc22k0a6AP5qGDlvhMvuYLu99IuzW15B5whxONqoTRZsJqxztki',
    1,
    NULL,
    '2021-02-17 04:15:35',
    '2021-02-17 04:26:03',
    0,
    ''
  ),
  (
    33,
    2,
    'nadya',
    'mziray',
    'mziraynadya272@gmail.com',
    '0742304086',
    'Female',
    '-',
    '$2y$10$cZkr1.oFvffmSvmTgRNk3.ZEEM85/Wgp46MEJwHsNPMXano1kTm/C',
    1,
    NULL,
    '2021-02-17 10:28:23',
    '2021-02-17 10:32:47',
    0,
    ''
  ),
  (
    37,
    2,
    'Iddi',
    'Sinze',
    'iddisinze09@gmail.com',
    '0753633854',
    'Male',
    '-',
    '$2y$10$N46hN2NFofs7bIsB9/HdAeM9Q22t5UraSoaSw2UoieHQG5nP4Ic.O',
    1,
    NULL,
    '2021-02-17 14:25:24',
    '2021-02-17 14:55:05',
    0,
    ''
  ),
  (
    38,
    2,
    'Marea',
    'mohabe',
    'mohabejaphet5@gmail.com',
    '0678461942',
    'Male',
    '-',
    '$2y$10$HmanETkkbBZ05OcHwmcNpuFWjnkzAeb9QH28Uc3AqTLyhBboJlrV.',
    1,
    NULL,
    '2021-02-17 15:13:29',
    '2021-02-17 15:23:28',
    0,
    ''
  ),
  (
    40,
    2,
    'Tofiq',
    'Joseph Yusuph',
    'tawfiqjoseph30@gmail.com',
    '0688815679',
    'Male',
    '-',
    '$2y$10$YB1z0hNSVC5uNYBDwwgLjetUV0i.j9yw5qVSWpKNVBPxkWu1hYIwq',
    1,
    NULL,
    '2021-02-19 02:07:05',
    '2021-02-19 02:33:40',
    0,
    ''
  ),
  (
    41,
    2,
    'mhujo',
    'aloyce',
    'mikoaloyce@gmail.com',
    '+255629753240',
    'Male',
    '-',
    '$2y$10$gwwMJsD4hEJQ2bQIPZXOVO78mmjX3Kvli3ltMlMH/75xT0/xvFvNK',
    1,
    NULL,
    '2021-02-19 04:59:03',
    '2021-03-07 15:18:33',
    0,
    ''
  ),
  (
    42,
    2,
    'Dorcas',
    'Mnkande',
    'dorriemainda@gmail.com',
    '+255 788 932782',
    'Female',
    '-',
    '$2y$10$/rWbJR5J3OZ0ct.3xUvTyOhJCK.RYwJdNVBZ6CIY1fJLKx.iiUfzS',
    1,
    NULL,
    '2021-02-19 07:05:52',
    '2021-02-19 07:09:21',
    0,
    ''
  ),
  (
    43,
    2,
    'Ibrahim',
    'Nkinzo',
    'ibrankinzo@gmail.com',
    '0718338666',
    'Male',
    '-',
    '$2y$10$bhf6XFaBiC0COiMTMcuNNetoOp5jwYe/O9jIFXcJRacTt2rFkhBSm',
    1,
    NULL,
    '2021-02-20 05:47:51',
    '2021-02-20 05:52:14',
    0,
    ''
  ),
  (
    48,
    2,
    'Emmanuel',
    'Satongima',
    'satongimaemmanuel@gmail.com',
    '+255758484411',
    'Male',
    '-',
    '$2y$10$yponAYq4Po1qlohGwgEHZ.bKuFKiRi6Vjuzmxsc2Rj8Ko8lTMbnnm',
    1,
    NULL,
    '2021-02-22 20:32:51',
    '2021-02-22 20:35:43',
    0,
    ''
  ),
  (
    51,
    2,
    'Hiltruda',
    'Misango',
    'hiltrudamisango@gmail.com',
    '0746111123',
    'Female',
    '-',
    '$2y$10$Rqec/oh691MTjdzR0x1x4uVoF9QeW8QgP8IgWd71J/KXftUwrxxZO',
    1,
    NULL,
    '2021-02-23 19:10:06',
    '2021-02-23 19:16:43',
    0,
    ''
  ),
  (
    52,
    2,
    'Kevin',
    'Shoo',
    'kevinneville6@gmail.com',
    '+255764795595',
    'Male',
    '-',
    '$2y$10$g5EH3EmqAgtv8AHJb1CFwOPwK3lmffWMHhwuiAk2rzxJPL5Ef4STC',
    1,
    NULL,
    '2021-02-23 19:40:45',
    '2022-04-17 00:47:25',
    0,
    ''
  ),
  (
    56,
    2,
    'Nathan',
    'Ndaki',
    'nathaninyahu@outlook.com',
    '+255758571996',
    'Male',
    '-',
    '$2y$10$YMUWDOCMu4RL12EHFge.oep5AqCrcQZqZsRsm1Jmu8jPCv31dYUpi',
    1,
    NULL,
    '2021-02-25 16:59:21',
    '2021-02-25 17:01:58',
    0,
    ''
  ),
  (
    57,
    2,
    'Rashidi',
    'Shabani',
    'chidyaongarashidi@gmail.com',
    '0692282504',
    'Male',
    '-',
    '$2y$10$rLRnECfQ5njUWflBhtpguuGtUpv0V4wi4.oMBoRpFPl1MmpVEW86G',
    1,
    NULL,
    '2021-02-26 17:04:06',
    '2021-02-26 17:10:40',
    0,
    ''
  ),
  (
    59,
    2,
    'Stella',
    'Lameck',
    'stellalameck2013@gmail.com',
    '+255757066208',
    'Female',
    '-',
    '$2y$10$NYWpg7Lb2Qrls.CRBp14XehW/yj3WA9igjT6cUa71d4eINetmnuBi',
    1,
    NULL,
    '2021-02-28 07:30:06',
    '2021-03-01 02:51:54',
    0,
    ''
  ),
  (
    64,
    2,
    'LUKONGE',
    'RAJABU',
    'rajabulukonge02@gmail.com',
    '0747898987',
    'Male',
    '-',
    '$2y$10$hoewlKKRhRCvxNLAqZHoGOxnW3jOjex9OZLGJ5OawlDFL6S6EV1EK',
    1,
    NULL,
    '2021-03-04 12:49:55',
    '2021-03-04 13:04:08',
    0,
    ''
  ),
  (
    79,
    2,
    'Thadeus',
    'Bartholomew',
    'thadeushirima@gmail.com',
    '0689185705',
    '-- Options --',
    '-',
    '$2y$10$crUP9rxuR2kiZjBcHy3x6.dPwRAZy04E200NlpMfoVo.3qdX9EvuC',
    1,
    NULL,
    '2021-03-08 13:07:20',
    '2021-03-08 13:13:11',
    0,
    ''
  ),
  (
    81,
    2,
    'Louisa',
    'John',
    'louisajohn44@gmail.com',
    '0625498784',
    'Female',
    '-',
    '$2y$10$6iR9gdkc0XA81XsHtvLUj.wtilzvR2HUVpTjbjphNL.507mQnWJm6',
    1,
    NULL,
    '2021-03-14 09:29:11',
    '2021-03-14 09:32:43',
    0,
    ''
  ),
  (
    84,
    2,
    'Abdul',
    'Hamza',
    'abdul.m.hamza@gmail.com',
    '0714872761',
    'Male',
    '-',
    '$2y$10$yMZlUthmPI4xua68jHI7QONTAljylazdyNjgk13.s6LBhv/XXrvgC',
    1,
    NULL,
    '2021-03-15 05:33:31',
    '2021-03-17 09:21:05',
    0,
    ''
  ),
  (
    85,
    2,
    'Goodluck',
    'Makori',
    'goodluck.makori23@gmail.com',
    '0783557587',
    'Male',
    '-',
    '$2y$10$VtiN.tyXHs5KVqYcJuu/T.WUrXKV87RyDsvN7WUpqyuE.AYEFB1UO',
    1,
    NULL,
    '2021-03-15 07:19:32',
    '2021-03-15 07:23:00',
    0,
    ''
  ),
  (
    88,
    2,
    'Abraham',
    'Kavana',
    'abramskavana@gmail.com',
    '0762702332',
    'Male',
    '-',
    '$2y$10$ZKJhIYiOxSU2b2aJ9IHElewaXDTI/OUWSfl5SEy.v3HKTjMYsyzVG',
    1,
    NULL,
    '2021-03-16 00:58:44',
    '2021-03-17 00:35:06',
    0,
    ''
  ),
  (
    89,
    2,
    'Habiba',
    'Kigoda',
    'HabibaKigoda@yahoo.com',
    '+255693298197',
    'Female',
    '-',
    '$2y$10$ZsysQk8DAp/U1zuHQARRmeBP8KT186ONva/dVGMsEBdblKtI.Z95S',
    1,
    NULL,
    '2021-03-22 03:56:05',
    '2021-03-22 03:59:16',
    0,
    ''
  ),
  (
    92,
    2,
    'Joycelinda',
    'Augustine',
    'Lindaaugustine96@gmail.com',
    '+255655698882',
    'Female',
    '-',
    '$2y$10$F6veNHv81Gln9F30Bqieiuclr404Wap4oC/7BAbd9BnzrBtU/Offq',
    1,
    NULL,
    '2021-03-28 01:53:32',
    '2021-03-28 01:56:41',
    0,
    ''
  ),
  (
    98,
    2,
    'Sita',
    'Masunga',
    'sitamasunga00@gmail.com',
    '0759204065',
    'Male',
    '-',
    '$2y$10$JD/rI2OU3GnH6hZVYON30Ok3cUn7.3Y7F8CviYxc5l5Xi/aeHGIp6',
    1,
    NULL,
    '2021-04-01 08:53:19',
    '2021-04-01 09:00:27',
    0,
    ''
  ),
  (
    106,
    2,
    'Chukwudi',
    'Okoko',
    'chukwudichiemezie@gmail.com',
    '+2348053976754',
    'Male',
    '-',
    '$2y$10$7EuC00XTa3JRMrwLZPalzuEUEcj.a1ygVucMrsHgGnwL9x8eD8Nmy',
    1,
    NULL,
    '2021-04-10 08:26:15',
    '2021-04-10 08:31:03',
    0,
    ''
  ),
  (
    108,
    2,
    'Belinda',
    'Mrisho',
    'belindajsph97@gmail.com',
    '0746198235',
    'Female',
    '-',
    '$2y$10$1cVDf9PR3gxyrlSEoPgpX.NjcteorTfrEmWcRxsyN6shNMsZuRrW2',
    1,
    NULL,
    '2021-04-13 10:26:42',
    '2021-04-14 04:24:39',
    0,
    ''
  ),
  (
    110,
    3,
    'Joseph',
    'B',
    'bannatarimo@gmail.com',
    '0758793801',
    'Male',
    '-',
    '$2y$10$jAC.9kSmkS1wVNj74O9us.jxOsf2h0KPfqniPFhhNZ5M44I2F7EcK',
    1,
    NULL,
    '2021-04-28 08:45:58',
    '2021-04-28 09:23:10',
    0,
    ''
  ),
  (
    131,
    1,
    'Databank',
    'Super Admin',
    'info@databenki.com',
    '136',
    '-- Options --',
    '-',
    '$2y$10$aPJ0Sg8Obd5kjnhKfvdhzO/IX9A6h6GCwPnEJ7OqkxejZX.iZd.AO',
    1,
    NULL,
    '2021-12-19 06:28:20',
    '2022-07-04 08:47:16',
    0,
    ''
  ),
  (
    133,
    2,
    'Prinx',
    'Kacs',
    'prinxkacs01@gmail.com',
    '0659400136',
    'Male',
    '-',
    '$2y$10$4TJbbNUq4uAPHjMuVntRNudevHjhbHOu4qbM3M.Qb3GvNoO4tUUya',
    1,
    NULL,
    '2022-01-25 21:47:07',
    '2022-01-25 21:56:11',
    0,
    ''
  ),
  (
    135,
    2,
    'Ipyana',
    'KYENGE',
    'tech.ipyana01@gmail.com',
    '0752470155',
    'Male',
    '-',
    '$2y$10$BOTwE9XYNYMA634pjp0R1.fRRnStPpGTygpjIgWaTyE3XEh8PuOdO',
    1,
    NULL,
    '2022-04-26 21:38:57',
    '2022-04-26 21:42:08',
    0,
    ''
  ),
  (
    136,
    2,
    'Arnold',
    'Katwe',
    'arnoldlucius4@gmail.com',
    '0745006233',
    'Male',
    '-',
    '$2y$10$1apC9awNbegr6JZ2s8912eeVTUIgPyUPEAb1nTzCugPyIAQudm60K',
    1,
    NULL,
    '2022-06-19 13:47:28',
    '2022-06-19 16:06:10',
    0,
    ''
  ),
  (
    138,
    3,
    'Emmanuel',
    'Evance',
    'Eminja7@gmail.com',
    '0657548785',
    'Male',
    '-',
    '$2y$10$FlfBqHn.7TQ.YLxNSbVSVeuWCv7voqlT7RMRK2u03lr5Jfpzp5/d.',
    1,
    NULL,
    '2022-06-20 16:29:25',
    '2022-06-20 16:38:06',
    0,
    ''
  ),
  (
    139,
    2,
    'john',
    'kusaya',
    'johnkusaya12@gmail.com',
    '0742502356',
    'Male',
    '-',
    '$2y$10$QdIdXJKROUI662opyRcikuNpW5eNrtzUuycLugu62m3WJKQWUMg/e',
    1,
    NULL,
    '2022-06-22 06:41:55',
    '2022-06-22 06:48:18',
    0,
    ''
  ),
  (
    140,
    2,
    'Support',
    'User',
    'support@databenki.com',
    '+255758899901',
    'Male',
    '-',
    '$2y$10$vEGGj6QctBvhvMUsDfZ4Rew88227knWnZsWJa.oIAtA1AU1eiOBCS',
    0,
    NULL,
    '2022-06-30 14:00:04',
    '2022-06-30 14:00:04',
    0,
    ''
  ),
  (
    141,
    1,
    'Supporrt',
    'User',
    'support@xfrey.co.tz',
    '+255683162556',
    '-- Options --',
    '-',
    '$2y$10$rlbUUuU19rxnChFYqJu6K.fc4R49LGRX0vyZldzfR97HQPYzXw5RK',
    1,
    NULL,
    '2022-06-30 14:02:30',
    '2022-06-30 16:38:17',
    0,
    ''
  ),
  (
    142,
    2,
    'X.FREY',
    'USER',
    'X.frey@aol.com',
    '+255758899901',
    '-- Options --',
    '-',
    '$2y$10$aeSoqx7pSbVzTB4/zMk7i.R7EkprgI0PUioSOhDkSuf6.o6iPC1le',
    1,
    NULL,
    '2022-06-30 14:19:43',
    '2022-06-30 14:47:14',
    0,
    ''
  ),
  (
    143,
    2,
    'Gaudence',
    'Mwaipungu',
    'mwaipungug@gmail.com',
    '0713942154',
    'Male',
    '-',
    '$2y$10$koC7sB/fSXdQAcM42YoHquAUoW6a8v/6UAde3V/1ybR1Wboi1kCvu',
    0,
    NULL,
    '2022-06-30 15:18:04',
    '2022-06-30 15:18:04',
    0,
    ''
  ),
  (
    144,
    2,
    'Taala',
    'Hassan',
    'taalasharif88@yahoo.com',
    '0712800177',
    'Female',
    '-',
    '$2y$10$OGGFc3pOlgxKyXhZ30al5urZoqb1/7KSwkhgw.Fl83YiWARiiOXoW',
    0,
    NULL,
    '2022-06-30 15:19:17',
    '2022-06-30 15:22:10',
    0,
    ''
  ),
  (
    145,
    2,
    'Humphrey',
    'Mchome',
    'hraymchome@gmail.com',
    '0788161657',
    'Male',
    '-',
    '$2y$10$blI6tl0Rrcu/.UsCTrz.HOui9evnM51MmEaunQGnWzIVdA9dkw2xW',
    0,
    NULL,
    '2022-06-30 16:05:35',
    '2022-06-30 16:05:35',
    0,
    ''
  ),
  (
    146,
    3,
    'Super',
    'Client',
    'client@xfrey.co.tz',
    '+255683162556',
    'Male',
    '-',
    '$2y$10$bXoZy.W6te5G4p.gLL5.ueZkmKf5OLvWGHMzyyKOpgx.8haZ/4LZ6',
    1,
    NULL,
    '2022-06-30 16:40:01',
    '2022-07-02 16:58:22',
    0,
    ''
  ),
  (
    147,
    3,
    'Nickson',
    'Mtemi',
    'mteminickson@gmail.com',
    '0745944600',
    'Male',
    '-',
    '$2y$10$lUpQaluc8a3hEX/Q3XNmSe1SblSz0yyIwjMVB0.nhmC59Vbharona',
    0,
    NULL,
    '2022-07-01 07:03:36',
    '2022-07-01 14:57:05',
    0,
    ''
  ),
  (
    148,
    3,
    'Chiza',
    'Hamis',
    'shizahamisi@gmail.com',
    '255693343431',
    'Male',
    '-',
    '$2y$10$wpqA.uA1emchIXRZRoJYb.Ksnt4Kx3mDxlcwWxr7KVv6kFDwqbuH.',
    1,
    NULL,
    '2022-07-01 14:04:49',
    '2022-07-01 15:10:49',
    0,
    ''
  ),
  (
    149,
    2,
    'Abdullah',
    'Bahadi',
    'a.moh.bahadi@gmail.com',
    '+966597831598',
    'Male',
    '-',
    '$2y$10$5Ungycu46/z3.WXHTKV85OyVgCciz1iZ61tstOOPgQOQG7Yhlro2q',
    0,
    NULL,
    '2022-07-02 09:02:15',
    '2022-07-02 09:02:15',
    0,
    ''
  ),
  (
    151,
    2,
    'Youdahe',
    'Gebremariam',
    'yodgis@gmail.com',
    '0913228350',
    'Male',
    '-',
    '$2y$10$RvlHTXYzsJqJoVZp66Dqd.ZDEmUT3mLrNPtF5XAzBJcks.c/bF5Ua',
    0,
    NULL,
    '2022-07-02 16:00:28',
    '2022-07-02 16:00:28',
    0,
    ''
  ),
  (
    152,
    2,
    'mustafazadk@gmail.com',
    'Mohammed',
    'mustafazadk@gmail.com',
    '+249996777570',
    'Male',
    '-',
    '$2y$10$noscuQGgdC5Le6zlAOPS1uFnBaIcVX38xvWMQV.TQnRn1FiLuXRIm',
    0,
    NULL,
    '2022-07-03 05:12:07',
    '2022-07-03 05:12:07',
    0,
    ''
  ),
  (
    153,
    2,
    'vasco',
    'Kikoti',
    'vascokido@gmail.com',
    '+255753264942',
    'Male',
    '-',
    '$2y$10$JKxUi117JqR7phQihg.58.J3GZr6I/.9xh.hV1J77u0brZcaeVIUq',
    1,
    NULL,
    '2022-07-03 12:15:07',
    '2022-07-04 18:20:52',
    0,
    ''
  ),
  (
    154,
    2,
    'Redegunda',
    'Muro',
    'rademateru@gmail.com',
    '0655 651842',
    'Female',
    '-',
    '$2y$10$5rVAdYfAKMfoNeuJlpWSduCDpYHpMoVBPkicD0naS9fD/zhRx4Nsy',
    0,
    NULL,
    '2022-07-03 14:52:40',
    '2022-07-05 16:18:00',
    0,
    ''
  ),
  (
    155,
    2,
    'Jasmine',
    'Humphrey',
    'gogolajasmine@gmail.com',
    '0733509965',
    'Female',
    '-',
    '$2y$10$9icSxpwO7MocqUOXGj/SkuEIw6.29WaWblrvyDUDc4w.RKZIM/xAK',
    0,
    NULL,
    '2022-07-03 15:21:32',
    '2022-07-03 15:25:26',
    0,
    ''
  ),
  (
    156,
    2,
    'Enock',
    'Sunzu',
    'enodis02@gmail.com',
    '0687148638',
    'Male',
    '-',
    '$2y$10$kMD2nvQ0vmJAyoiF/tmgKe.n.2v2EgcwQRUOeMHVANgC.SOCFmqyW',
    0,
    NULL,
    '2022-07-03 20:39:04',
    '2022-07-03 20:39:04',
    0,
    ''
  ),
  (
    157,
    2,
    'Godson',
    'Mandla',
    'godsonmandla@gmail.com',
    '255768064878',
    'Male',
    '-',
    '$2y$10$3KXYm1Qc/oFhwIs4.hJmRerCiiLgegEPsFadTEEVe88AfR34A37jq',
    1,
    NULL,
    '2022-07-03 20:39:47',
    '2022-07-03 20:41:47',
    0,
    ''
  ),
  (
    158,
    2,
    'BEATRICE',
    'BETABULA',
    'beatriceerastus15@gmail.com',
    '0621038896',
    'Female',
    '-',
    '$2y$10$qdxQoDSqG2jVv7/9Umk9heGgnz1lLn1IAAiGoJPUbejfD2NpvZKHK',
    1,
    NULL,
    '2022-07-03 21:26:25',
    '2022-07-04 08:47:14',
    0,
    ''
  ),
  (
    161,
    2,
    'Amina',
    'Feisal',
    'aminafeisal679@gmail.com',
    '0719773705',
    'Female',
    '-',
    '$2y$10$l35C0bO.RAxd0qEJ6nSI6O.c2tZfFeirbkN.8A7yS7wVpkoDBd8K.',
    1,
    NULL,
    '2022-07-04 07:08:58',
    '2022-07-04 08:37:15',
    0,
    ''
  ),
  (
    162,
    2,
    'Vasco',
    'Kikoti',
    'vascokido26@gmail.com',
    '0713524475',
    'Male',
    '-',
    '$2y$10$wIupObB/4/FpYRqdAdk/aeO0ERfJ03.7Q0A3bQGtg8obt6q9IyG7C',
    0,
    NULL,
    '2022-07-04 15:42:04',
    '2022-07-04 15:44:18',
    0,
    ''
  ),
  (
    163,
    2,
    'Masifu',
    'Staphord',
    'mstar.bugale@gmail.com',
    '0753978467',
    'Male',
    '-',
    '$2y$10$yeOPBddnGM7X0PwfksENJ.b.VCf8MlHFRJn4LTqf.xOeTzENWw9zi',
    0,
    NULL,
    '2022-07-05 17:33:42',
    '2022-07-05 17:33:42',
    0,
    ''
  ),
  (
    164,
    2,
    'Patrick Joseph',
    'Msango',
    'msangopatrick78@gmail.com',
    '0719822324',
    'Male',
    '-',
    '$2y$10$6nPLtu.IQXXvSuMdE1P1KeFt7nk5UrJfJT9owm6bn8PSNdX2YANxC',
    0,
    NULL,
    '2022-07-05 20:11:08',
    '2022-07-12 18:07:57',
    0,
    ''
  ),
  (
    165,
    2,
    'Christian Brel',
    'Tani',
    'christianbreltani60@gmail.com',
    '+237696821328',
    'Male',
    '-',
    '$2y$10$JMBUTwzUHp6kVW2tAgQPfOmM2jiOlexpQG.RVqtY1cI5SJ4j.bGWO',
    1,
    NULL,
    '2022-07-06 09:18:20',
    '2022-07-06 09:29:19',
    0,
    ''
  ),
  (
    166,
    2,
    'Imani',
    'Xavery',
    'imanixavery@gmail.com',
    '+255683162556',
    'Male',
    '1657179867.jpeg',
    '$2y$10$o5CpTi17BE4xXsyUOdVDqufAndADQtwTMCuSGemdXx2./UlGLegGq',
    1,
    NULL,
    '2022-07-07 08:25:14',
    '2022-07-07 08:44:27',
    0,
    ''
  ),
  (
    167,
    2,
    'SAMUEL',
    'NDEDA',
    'sam.dad@live.com',
    '+254729317864',
    'Male',
    '-',
    '$2y$10$.bp/5sKGNBgPgkh48pgk2e.EgcA9hZCRe/YMG1IgSvDFycB8EaF3u',
    0,
    NULL,
    '2022-07-07 11:56:20',
    '2022-07-07 11:56:20',
    0,
    ''
  ),
  (
    168,
    2,
    'Atrianus',
    'Mutungi',
    'atrianus06tz@yahoo.com',
    '+255714054420',
    'Male',
    '-',
    '$2y$10$fKcl9blu8yk0M6e3wRkgOOLCRh0IRp.V6TG4OJuYfW68AjlCRiy1m',
    1,
    NULL,
    '2022-07-08 07:54:40',
    '2022-07-08 08:44:13',
    0,
    ''
  ),
  (
    169,
    0,
    'Juma',
    'Rashid',
    'rashid@gmail.com',
    '',
    '',
    '1723556017Screenshot (31).png',
    '202cb962ac59075b964b07152d234b70',
    0,
    NULL,
    NULL,
    NULL,
    362845832,
    'Active now'
  ),
  (
    170,
    0,
    'Juliana',
    'George',
    'george@gmail.com',
    '',
    '',
    '1723556252Screenshot (3).png',
    '202cb962ac59075b964b07152d234b70',
    0,
    NULL,
    NULL,
    NULL,
    603309100,
    'Active now'
  ),
  (
    171,
    0,
    'paul',
    'mwasile',
    'popermwasile173@gmail.com',
    '',
    '',
    '17245300291.jpg',
    'cf79ae6addba60ad018347359bd144d2',
    0,
    NULL,
    NULL,
    NULL,
    1211251293,
    'Active now'
  );

-- --------------------------------------------------------
--
-- Table structure for table `user_accesses`
--
CREATE TABLE `user_accesses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` smallint(6) NOT NULL,
  `menu_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `user_accesses`
--
INSERT INTO
  `user_accesses` (
    `id`,
    `user_id`,
    `menu_name`,
    `access`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    2,
    'home_menu',
    1,
    '2020-07-01 17:19:01',
    '2020-07-01 17:19:26'
  ),
  (
    2,
    2,
    'my_profile',
    1,
    '2020-07-01 17:19:01',
    '2020-07-01 17:19:39'
  ),
  (
    3,
    5,
    'home_menu',
    0,
    '2020-07-14 15:04:54',
    '2020-07-14 15:04:54'
  ),
  (
    4,
    5,
    'my_profile',
    1,
    '2020-07-14 15:04:54',
    '2020-07-14 15:05:08'
  ),
  (
    5,
    5,
    'my_specialization',
    1,
    '2020-07-14 15:14:47',
    '2020-07-14 15:14:47'
  ),
  (
    6,
    2,
    'my_specialization',
    1,
    '2020-09-07 09:02:10',
    '2020-09-07 09:02:10'
  ),
  (
    7,
    3,
    'my_specialization',
    1,
    '2020-09-07 10:37:45',
    '2020-09-07 10:37:45'
  ),
  (
    8,
    4,
    'my_specialization',
    1,
    '2020-09-07 10:39:41',
    '2020-09-07 10:39:41'
  ),
  (
    9,
    5,
    'my_specialization',
    1,
    '2020-09-07 12:00:23',
    '2020-09-07 12:00:23'
  ),
  (
    10,
    6,
    'my_specialization',
    1,
    '2020-09-07 12:02:36',
    '2020-09-07 12:02:36'
  ),
  (
    12,
    8,
    'my_specialization',
    1,
    '2020-09-09 04:22:05',
    '2020-09-09 04:22:05'
  ),
  (
    13,
    9,
    'my_specialization',
    1,
    '2020-09-18 02:41:01',
    '2020-09-18 02:41:01'
  ),
  (
    15,
    11,
    'my_specialization',
    1,
    '2020-09-18 06:13:16',
    '2020-09-18 06:13:16'
  ),
  (
    16,
    11,
    'home_menu',
    0,
    '2020-09-18 09:00:29',
    '2020-09-19 04:05:26'
  ),
  (
    17,
    12,
    'my_specialization',
    1,
    '2020-09-25 08:02:42',
    '2020-09-25 08:02:42'
  ),
  (
    18,
    13,
    'my_specialization',
    1,
    '2020-09-25 12:54:58',
    '2020-09-25 12:54:58'
  ),
  (
    19,
    14,
    'my_specialization',
    1,
    '2020-12-28 12:26:30',
    '2020-12-28 12:26:30'
  ),
  (
    21,
    40,
    'my_specialization',
    1,
    '2021-02-19 02:07:05',
    '2021-02-19 02:07:05'
  ),
  (
    22,
    41,
    'my_specialization',
    1,
    '2021-02-19 04:59:03',
    '2021-02-19 04:59:03'
  ),
  (
    23,
    42,
    'my_specialization',
    1,
    '2021-02-19 07:05:52',
    '2021-02-19 07:05:52'
  ),
  (
    24,
    43,
    'my_specialization',
    1,
    '2021-02-20 05:47:51',
    '2021-02-20 05:47:51'
  ),
  (
    27,
    44,
    'my_specialization',
    1,
    '2021-02-21 16:33:21',
    '2021-02-21 16:33:21'
  ),
  (
    28,
    45,
    'my_specialization',
    1,
    '2021-02-21 23:59:47',
    '2021-02-21 23:59:47'
  ),
  (
    29,
    46,
    'my_specialization',
    1,
    '2021-02-22 16:32:09',
    '2021-02-22 16:32:09'
  ),
  (
    30,
    47,
    'my_specialization',
    1,
    '2021-02-22 17:41:48',
    '2021-02-22 17:41:48'
  ),
  (
    31,
    48,
    'my_specialization',
    1,
    '2021-02-22 20:32:51',
    '2021-02-22 20:32:51'
  ),
  (
    32,
    49,
    'my_specialization',
    1,
    '2021-02-23 04:00:35',
    '2021-02-23 04:00:35'
  ),
  (
    33,
    50,
    'my_specialization',
    1,
    '2021-02-23 04:12:42',
    '2021-02-23 04:12:42'
  ),
  (
    34,
    51,
    'my_specialization',
    1,
    '2021-02-23 19:10:06',
    '2021-02-23 19:10:06'
  ),
  (
    35,
    52,
    'my_specialization',
    1,
    '2021-02-23 19:40:45',
    '2021-02-23 19:40:45'
  ),
  (
    36,
    53,
    'my_specialization',
    1,
    '2021-02-24 10:30:55',
    '2021-02-24 10:30:55'
  ),
  (
    37,
    54,
    'my_specialization',
    1,
    '2021-02-25 12:19:05',
    '2021-02-25 12:19:05'
  ),
  (
    38,
    55,
    'my_specialization',
    1,
    '2021-02-25 12:20:24',
    '2021-02-25 12:20:24'
  ),
  (
    39,
    56,
    'my_specialization',
    1,
    '2021-02-25 16:59:21',
    '2021-02-25 16:59:21'
  ),
  (
    40,
    57,
    'my_specialization',
    1,
    '2021-02-26 17:04:06',
    '2021-02-26 17:04:06'
  ),
  (
    41,
    58,
    'my_specialization',
    1,
    '2021-02-28 05:36:53',
    '2021-02-28 05:36:53'
  ),
  (
    42,
    59,
    'my_specialization',
    1,
    '2021-02-28 07:30:06',
    '2021-02-28 07:30:06'
  ),
  (
    44,
    61,
    'my_specialization',
    1,
    '2021-03-01 14:52:21',
    '2021-03-01 14:52:21'
  ),
  (
    45,
    62,
    'my_specialization',
    1,
    '2021-03-01 17:03:58',
    '2021-03-01 17:03:58'
  ),
  (
    46,
    63,
    'my_specialization',
    1,
    '2021-03-03 19:10:17',
    '2021-03-03 19:10:17'
  ),
  (
    47,
    64,
    'my_specialization',
    1,
    '2021-03-04 12:49:55',
    '2021-03-04 12:49:55'
  ),
  (
    48,
    65,
    'my_specialization',
    1,
    '2021-03-05 11:07:39',
    '2021-03-05 11:07:39'
  ),
  (
    49,
    66,
    'my_specialization',
    1,
    '2021-03-06 13:08:13',
    '2021-03-06 13:08:13'
  ),
  (
    59,
    68,
    'my_specialization',
    1,
    '2021-03-07 12:26:40',
    '2021-03-07 12:26:40'
  ),
  (
    60,
    69,
    'my_specialization',
    1,
    '2021-03-07 12:27:43',
    '2021-03-07 12:27:43'
  ),
  (
    62,
    71,
    'my_specialization',
    1,
    '2021-03-07 12:31:29',
    '2021-03-07 12:31:29'
  ),
  (
    63,
    72,
    'my_specialization',
    1,
    '2021-03-07 12:34:42',
    '2021-03-07 12:34:42'
  ),
  (
    64,
    73,
    'my_specialization',
    1,
    '2021-03-07 12:39:10',
    '2021-03-07 12:39:10'
  ),
  (
    65,
    74,
    'my_specialization',
    1,
    '2021-03-07 13:25:04',
    '2021-03-07 13:25:04'
  ),
  (
    66,
    75,
    'my_specialization',
    1,
    '2021-03-07 13:35:10',
    '2021-03-07 13:35:10'
  ),
  (
    67,
    76,
    'my_specialization',
    1,
    '2021-03-07 16:48:45',
    '2021-03-07 16:48:45'
  ),
  (
    68,
    77,
    'my_specialization',
    1,
    '2021-03-08 07:33:18',
    '2021-03-08 07:33:18'
  ),
  (
    70,
    79,
    'my_specialization',
    1,
    '2021-03-08 13:07:20',
    '2021-03-08 13:07:20'
  ),
  (
    71,
    80,
    'my_specialization',
    1,
    '2021-03-10 06:08:32',
    '2021-03-10 06:08:32'
  ),
  (
    72,
    81,
    'my_specialization',
    1,
    '2021-03-14 09:29:11',
    '2021-03-14 09:29:11'
  ),
  (
    73,
    82,
    'my_specialization',
    1,
    '2021-03-15 02:11:41',
    '2021-03-15 02:11:41'
  ),
  (
    74,
    83,
    'my_specialization',
    1,
    '2021-03-15 04:34:46',
    '2021-03-15 04:34:46'
  ),
  (
    75,
    84,
    'my_specialization',
    1,
    '2021-03-15 05:33:31',
    '2021-03-15 05:33:31'
  ),
  (
    76,
    85,
    'my_specialization',
    1,
    '2021-03-15 07:19:32',
    '2021-03-15 07:19:32'
  ),
  (
    77,
    86,
    'my_specialization',
    1,
    '2021-03-15 08:52:14',
    '2021-03-15 08:52:14'
  ),
  (
    78,
    87,
    'my_specialization',
    1,
    '2021-03-15 12:41:35',
    '2021-03-15 12:41:35'
  ),
  (
    79,
    88,
    'my_specialization',
    1,
    '2021-03-16 00:58:44',
    '2021-03-16 00:58:44'
  ),
  (
    80,
    89,
    'my_specialization',
    1,
    '2021-03-22 03:56:05',
    '2021-03-22 03:56:05'
  ),
  (
    81,
    90,
    'my_specialization',
    1,
    '2021-03-23 13:47:49',
    '2021-03-23 13:47:49'
  ),
  (
    82,
    91,
    'my_specialization',
    1,
    '2021-03-25 09:32:21',
    '2021-03-25 09:32:21'
  ),
  (
    83,
    92,
    'my_specialization',
    1,
    '2021-03-28 01:53:32',
    '2021-03-28 01:53:32'
  ),
  (
    84,
    93,
    'my_specialization',
    1,
    '2021-03-28 12:04:02',
    '2021-03-28 12:04:02'
  ),
  (
    85,
    94,
    'my_specialization',
    1,
    '2021-03-28 12:14:05',
    '2021-03-28 12:14:05'
  ),
  (
    86,
    95,
    'my_specialization',
    1,
    '2021-03-30 00:34:03',
    '2021-03-30 00:34:03'
  ),
  (
    87,
    96,
    'my_specialization',
    1,
    '2021-03-30 06:26:00',
    '2021-03-30 06:26:00'
  ),
  (
    88,
    97,
    'my_specialization',
    1,
    '2021-03-31 10:57:03',
    '2021-03-31 10:57:03'
  ),
  (
    89,
    98,
    'my_specialization',
    1,
    '2021-04-01 08:53:19',
    '2021-04-01 08:53:19'
  ),
  (
    90,
    99,
    'my_specialization',
    1,
    '2021-04-01 13:44:18',
    '2021-04-01 13:44:18'
  ),
  (
    91,
    100,
    'my_specialization',
    1,
    '2021-04-05 04:12:53',
    '2021-04-05 04:12:53'
  ),
  (
    92,
    101,
    'my_specialization',
    1,
    '2021-04-05 04:54:19',
    '2021-04-05 04:54:19'
  ),
  (
    93,
    102,
    'my_specialization',
    1,
    '2021-04-05 05:21:31',
    '2021-04-05 05:21:31'
  ),
  (
    94,
    103,
    'my_specialization',
    1,
    '2021-04-05 15:33:34',
    '2021-04-05 15:33:34'
  ),
  (
    95,
    104,
    'my_specialization',
    1,
    '2021-04-06 09:29:16',
    '2021-04-06 09:29:16'
  ),
  (
    96,
    105,
    'my_specialization',
    1,
    '2021-04-08 12:52:09',
    '2021-04-08 12:52:09'
  ),
  (
    97,
    106,
    'my_specialization',
    1,
    '2021-04-10 08:26:15',
    '2021-04-10 08:26:15'
  ),
  (
    98,
    107,
    'my_specialization',
    1,
    '2021-04-11 01:07:45',
    '2021-04-11 01:07:45'
  ),
  (
    99,
    108,
    'my_specialization',
    1,
    '2021-04-13 10:26:42',
    '2021-04-13 10:26:42'
  ),
  (
    101,
    110,
    'my_specialization',
    1,
    '2021-04-28 08:45:58',
    '2021-04-28 08:45:58'
  ),
  (
    102,
    111,
    'my_specialization',
    1,
    '2021-06-08 06:22:53',
    '2021-06-08 06:22:53'
  ),
  (
    103,
    112,
    'my_specialization',
    1,
    '2021-06-08 06:24:12',
    '2021-06-08 06:24:12'
  ),
  (
    104,
    146,
    'my_specialization',
    1,
    '2022-06-30 16:40:01',
    '2022-06-30 16:40:01'
  );

-- --------------------------------------------------------
--
-- Table structure for table `user_works`
--
CREATE TABLE `user_works` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` smallint(6) NOT NULL,
  `work_unique_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `work_category_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_upload` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actual_file_names` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `user_works`
--
INSERT INTO
  `user_works` (
    `id`,
    `user_id`,
    `work_unique_id`,
    `work_description`,
    `work_category_description`,
    `file_upload`,
    `actual_file_names`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    26,
    8,
    'INV-000002',
    '<p><strong>AMIGO POLYCLINIC COMPANY LIMITED</strong></p>\n\n<p>Capital 30m</p>\n\n<p>Debitor 0</p>\n\n<p>Creditor 0</p>\n\n<p>Expenses : Provided</p>\n\n<p>Income: Provided</p>\n\n<p>Assets : To e extracted from Expences</p>\n\n<p><strong>Required to Prepare and Submit Audited report to TRA</strong></p>',
    '32',
    '1656517165.pdf,1656517097.pdf,1656517050.pdf,1656516935.xlsm',
    'Report (5).pdf,Amigo Tax.pdf,Amigo.pdf,Amigo.pdf',
    '2022-06-22 08:57:12',
    '2022-06-29 16:39:33'
  ),
  (
    27,
    8,
    'INV-000003',
    '<p><strong>SKYLITE ATTORNEYS&nbsp;</strong></p>\r\n\r\n<p>HIZI NDIO TAARIFA ZA LAWFIRM&nbsp;</p>\r\n\r\n<p>AMBAYO NI <strong>SOLE PROPRIETOR</strong></p>\r\n\r\n<p>OWNER: EMMANUEL EVANCE MINJA</p>\r\n\r\n<p>Capital: 2m</p>\r\n\r\n<p>Debitor 0</p>\r\n\r\n<p>Creditor 0</p>\r\n\r\n<p>Expenses : Provided</p>\r\n\r\n<p>Income: Provided</p>\r\n\r\n<p>Assets : To e extracted from Expences</p>\r\n\r\n<p><strong>Required to Prepare and Submit Audited report to TRA</strong></p>',
    '32',
    '1656517288.pdf,1655885166.xlsx,1656517305.pdf,1655885166.xlsx',
    'Skylite Tax_opt.pdf,Skylite Attorneys Accounting.xlsx,Skylite_opt.pdf,Skylite Attorneys Accounting.xlsx',
    '2022-06-22 09:08:15',
    '2022-06-29 16:41:56'
  ),
  (
    29,
    146,
    'INV-000004',
    '<p>Kiluvya file compalition</p>',
    '31',
    '1657619895.CSV',
    'Harii.csv',
    '2022-07-12 10:58:16',
    '2022-07-12 10:58:16'
  );

-- --------------------------------------------------------
--
-- Table structure for table `user_work_progress`
--
CREATE TABLE `user_work_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `confirm_verification` int(11) NOT NULL DEFAULT 0,
  `report_files` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `actual_file_reports` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewed_by` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `client_message_view` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `user_work_progress`
--
INSERT INTO
  `user_work_progress` (
    `id`,
    `work_id`,
    `category_id`,
    `confirm_verification`,
    `report_files`,
    `actual_file_reports`,
    `comment`,
    `reviewed_by`,
    `status`,
    `client_message_view`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    24,
    1,
    1,
    '1655736209.xml',
    'Ruangwa_tarura.xml',
    '-',
    0,
    0,
    0,
    '2022-06-20 15:43:33',
    '2022-06-20 15:44:31'
  ),
  (
    8,
    24,
    2,
    1,
    '1655736314.xlsx',
    'Data Maintanence.xlsx',
    '-',
    0,
    0,
    0,
    '2022-06-20 15:45:18',
    '2022-06-20 15:45:27'
  ),
  (
    9,
    25,
    1,
    1,
    '1655737093.PNG',
    'Capture.png',
    '<p>Complited</p>',
    11,
    1,
    1,
    '2022-06-20 15:58:25',
    '2022-06-20 16:02:04'
  ),
  (
    10,
    26,
    32,
    1,
    '1656069297.docx',
    'Amigo Fs.docx',
    '<p>NO</p>',
    11,
    2,
    1,
    '2022-06-24 12:15:14',
    '2022-06-29 16:31:26'
  ),
  (
    11,
    27,
    32,
    1,
    '1656069826.docx,1656069687.docx',
    'Skylite Atnys.docx,Skylite Atnys.docx',
    '<p>OK</p>',
    11,
    1,
    1,
    '2022-06-24 12:21:42',
    '2022-06-29 16:32:03'
  ),
  (
    14,
    28,
    1,
    1,
    '1656164092.jpg',
    '1628731260_logo.jpg',
    '<p>ok</p>',
    11,
    1,
    1,
    '2022-06-25 14:34:54',
    '2022-06-25 14:41:26'
  ),
  (
    15,
    29,
    31,
    1,
    '1657622414.docx,1657622036.pdf,1657621988.pdf,1657621968.pdf,1657621796.pdf,1657621705.pdf,1657621705.pdf,1657621798.pdf,1657621705.pdf,1657621705.pdf',
    'Mabwe Reaport 01.docx,Kivule Datum.pdf,Kivule Coordinate List.pdf,Observation Kivule Comps.pdf,Area.pdf,Kivule.pdf,Sketch Plan Kivule.pdf,Inquired.pdf,Kivule.pdf,Sketch Plan Kivule.pdf',
    '<p>COMPLETED</p>',
    11,
    1,
    1,
    '2022-07-12 11:28:39',
    '2022-07-12 11:46:05'
  );

-- --------------------------------------------------------
--
-- Table structure for table `withdraw_requests`
--
CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requested_by` int(11) NOT NULL,
  `confirmed_by` int(11) NOT NULL,
  `withdraw_method` int(11) NOT NULL,
  `points` double(8, 4) NOT NULL,
  `proof_payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-',
  `status` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--
INSERT INTO
  `withdraw_requests` (
    `id`,
    `requested_by`,
    `confirmed_by`,
    `withdraw_method`,
    `points`,
    `proof_payment`,
    `status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    9,
    1,
    3,
    20.0000,
    '-',
    1,
    '2022-06-25 14:49:44',
    '2022-07-02 16:19:02'
  );

-- --------------------------------------------------------
--
-- Table structure for table `work_credits`
--
CREATE TABLE `work_credits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_amount` decimal(7, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `work_credits`
--
INSERT INTO
  `work_credits` (
    `id`,
    `task_id`,
    `task_amount`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    15,
    24,
    '2000.00',
    '2022-06-20 09:48:01',
    '2022-06-20 10:23:06'
  ),
  (
    16,
    25,
    '1000.00',
    '2022-06-20 15:55:01',
    '2022-06-20 15:55:01'
  ),
  (
    17,
    26,
    '160.00',
    '2022-06-22 08:58:49',
    '2022-06-22 09:11:24'
  ),
  (
    18,
    27,
    '95.00',
    '2022-06-22 09:09:38',
    '2022-07-03 11:29:14'
  ),
  (
    19,
    28,
    '11.00',
    '2022-06-25 10:26:00',
    '2022-06-25 10:26:00'
  ),
  (
    20,
    29,
    '20.00',
    '2022-07-12 10:59:32',
    '2022-07-12 10:59:32'
  );

-- --------------------------------------------------------
--
-- Table structure for table `work_statuses`
--
CREATE TABLE `work_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `work_id` int(11) NOT NULL,
  `rolled_up_by` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `admin_task_processes`
--
ALTER TABLE
  `admin_task_processes`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `assigned_specializations`
--
ALTER TABLE
  `assigned_specializations`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `cron_instructions`
--
ALTER TABLE
  `cron_instructions`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE
  `failed_jobs`
ADD
  PRIMARY KEY (`id`, `uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE
  `jobs`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE
  `messages`
ADD
  PRIMARY KEY (`message_id`),
ADD
  KEY `sender_id` (`sender_id`),
ADD
  KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE
  `migrations`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `new_account_verifications`
--
ALTER TABLE
  `new_account_verifications`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `notify_unverified_users`
--
ALTER TABLE
  `notify_unverified_users`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE
  `oauth_access_tokens`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE
  `oauth_auth_codes`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE
  `oauth_clients`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE
  `oauth_personal_access_clients`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE
  `oauth_refresh_tokens`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE
  `password_resets`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE
  `payments`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE
  `payment_methods`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `point_conversions`
--
ALTER TABLE
  `point_conversions`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `qc_manages`
--
ALTER TABLE
  `qc_manages`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE
  `roles`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `specialization_lists`
--
ALTER TABLE
  `specialization_lists`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `task_credits`
--
ALTER TABLE
  `task_credits`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `task_rollups`
--
ALTER TABLE
  `task_rollups`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `task_verification_rolled_ups`
--
ALTER TABLE
  `task_verification_rolled_ups`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE
  `transaction_details`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `unit_convertions`
--
ALTER TABLE
  `unit_convertions`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `user_accesses`
--
ALTER TABLE
  `user_accesses`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `user_works`
--
ALTER TABLE
  `user_works`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `user_work_progress`
--
ALTER TABLE
  `user_work_progress`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE
  `withdraw_requests`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `work_credits`
--
ALTER TABLE
  `work_credits`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `work_statuses`
--
ALTER TABLE
  `work_statuses`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `admin_task_processes`
--
ALTER TABLE
  `admin_task_processes`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 32;

--
-- AUTO_INCREMENT for table `assigned_specializations`
--
ALTER TABLE
  `assigned_specializations`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 12;

--
-- AUTO_INCREMENT for table `cron_instructions`
--
ALTER TABLE
  `cron_instructions`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 52;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE
  `failed_jobs`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE
  `jobs`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 260;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE
  `messages`
MODIFY
  `message_id` bigint(20) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 290;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE
  `migrations`
MODIFY
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 47;

--
-- AUTO_INCREMENT for table `new_account_verifications`
--
ALTER TABLE
  `new_account_verifications`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 250;

--
-- AUTO_INCREMENT for table `notify_unverified_users`
--
ALTER TABLE
  `notify_unverified_users`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 27;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE
  `password_resets`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE
  `payments`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE
  `payment_methods`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 9;

--
-- AUTO_INCREMENT for table `point_conversions`
--
ALTER TABLE
  `point_conversions`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `qc_manages`
--
ALTER TABLE
  `qc_manages`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE
  `roles`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `specialization_lists`
--
ALTER TABLE
  `specialization_lists`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 42;

--
-- AUTO_INCREMENT for table `task_credits`
--
ALTER TABLE
  `task_credits`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 31;

--
-- AUTO_INCREMENT for table `task_rollups`
--
ALTER TABLE
  `task_rollups`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 22;

--
-- AUTO_INCREMENT for table `task_verification_rolled_ups`
--
ALTER TABLE
  `task_verification_rolled_ups`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE
  `transaction_details`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_convertions`
--
ALTER TABLE
  `unit_convertions`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 172;

--
-- AUTO_INCREMENT for table `user_accesses`
--
ALTER TABLE
  `user_accesses`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 107;

--
-- AUTO_INCREMENT for table `user_works`
--
ALTER TABLE
  `user_works`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 30;

--
-- AUTO_INCREMENT for table `user_work_progress`
--
ALTER TABLE
  `user_work_progress`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 16;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE
  `withdraw_requests`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 8;

--
-- AUTO_INCREMENT for table `work_credits`
--
ALTER TABLE
  `work_credits`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 21;

--
-- AUTO_INCREMENT for table `work_statuses`
--
ALTER TABLE
  `work_statuses`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `messages`
--
ALTER TABLE
  `messages`
ADD
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
ADD
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`);

--
-- Database: `fa`
--
CREATE DATABASE IF NOT EXISTS `fa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `fa`;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (
    `id`,
    `username`,
    `email`,
    `password`,
    `otp`,
    `otp_expiry`
  )
VALUES
  (
    16,
    'mwasilee',
    'popermwasile173@gmail.com',
    '$2y$10$JPaTFlPXI1Kt4LfIgpWz4uZcmgGzJ7bm1qs3o.CL7TocosD6tb5Ya',
    '892319',
    '2024-09-11 10:39:31'
  ),
  (
    17,
    'tomaa',
    'saimalythomas@gmail.com',
    '$2y$10$ceFw.T08O0/x4hyx4u5oNO6pawdityQ7yY/ChOw4E72IsY2hrbRRi',
    NULL,
    NULL
  ),
  (
    18,
    'tomaa',
    'saimalyethomas@gmail.com',
    '$2y$10$y9zpBsTNW5vv7CM2aSVXRe7Y0G5k.B4Xh.He.h2zD2WTJVIhF28zG',
    NULL,
    NULL
  ),
  (
    19,
    'mwasile',
    'popermwasile173@gmail.com',
    '$2y$10$uAr1RV6UjPb4MDKQ6Xvcd.PdFZOFz7UBBRow/ZdMNkHRtN4SAFMU6',
    NULL,
    NULL
  ),
  (
    20,
    'bulldog',
    'princemduwile177@gmail.com',
    '$2y$10$Od3nUX9ERmqfq1O.Re3yf.vQKhqZ5Dd6ag3GO5gX9e757nGAdf2NO',
    NULL,
    NULL
  ),
  (
    21,
    'poper',
    'popermwasile173@gmail.com',
    '$2y$10$WJewuyPaShvsyi3MrPVNYeu3yS1H3/2iCtCgd2WzmxJ/LPevM8WGC',
    NULL,
    NULL
  ),
  (
    22,
    'tomaa',
    'popermwasile173@gmail.com',
    '$2y$10$xj2rL2ksbBwLgtoS5vvaeOsB9nEKlWiEe9gJcqDaaiibBXzeGf2R6',
    NULL,
    NULL
  ),
  (
    23,
    'tomaa',
    'saimalyethomas@gmail.com',
    '$2y$10$iiZ0TJnuxklvXAzxPREeFuU91mFcJ6NUVyFhfJSGHS06yb6O2e.yK',
    NULL,
    NULL
  ),
  (
    24,
    'poper',
    'popermwasile173@gmail.com',
    '$2y$10$NFyH85wp7630xSG0N/0uIuF1griru8sG1gtrw/wV3YJeoIxPIkqey',
    NULL,
    NULL
  ),
  (
    25,
    'prosper',
    'popermwasile173@gmail.com',
    '$2y$10$QHIXVr8Xg7PQrxcg.416qebrJA6ekOxEugX.6bVJqdwn0nLne4ROS',
    NULL,
    NULL
  ),
  (
    26,
    'mwasile',
    'popermwasile173@gmail.com',
    '$2y$10$mzvyxTfeppzPHO/WZiHskeITCnmqX4q0.fSsdJ6EGDcQvFjmh9F1i',
    NULL,
    NULL
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 27;

--
-- Database: `hope`
--
CREATE DATABASE IF NOT EXISTS `hope` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `hope`;

-- --------------------------------------------------------
--
-- Table structure for table `notifications`
--
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE
  `notifications`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Database: `hostel`
--
CREATE DATABASE IF NOT EXISTS `hostel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `hostel`;

--
-- Database: `hostel_management`
--
CREATE DATABASE IF NOT EXISTS `hostel_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `hostel_management`;

-- --------------------------------------------------------
--
-- Table structure for table `bookings`
--
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `hostel_id` int(11) DEFAULT NULL,
  `guest_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `payment_status` enum('Unpaid', 'Paid') DEFAULT 'Unpaid'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `bookings`
--
INSERT INTO
  `bookings` (
    `id`,
    `hostel_id`,
    `guest_name`,
    `email`,
    `phone`,
    `check_in`,
    `check_out`,
    `room_type`,
    `payment_status`
  )
VALUES
  (
    1,
    3,
    'prosper',
    'poper@gmail.com',
    '0758673420',
    '2024-11-06',
    '2025-02-25',
    'Dorm',
    'Unpaid'
  ),
  (
    2,
    2,
    'prosper',
    'bdbdb@gmail.com',
    '0758673420',
    NULL,
    NULL,
    NULL,
    'Unpaid'
  );

-- --------------------------------------------------------
--
-- Table structure for table `hostels`
--
CREATE TABLE `hostels` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `room_types` varchar(255) DEFAULT NULL,
  `price_range` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `contact_info` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `hostels`
--
INSERT INTO
  `hostels` (
    `id`,
    `name`,
    `location`,
    `room_types`,
    `price_range`,
    `description`,
    `images`,
    `contact_info`
  )
VALUES
  (
    1,
    'The Nest Haven Hostel',
    '37 Hisiakwanza, Dar es Salaam',
    'Dorms, Private Rooms',
    '$10 - $20',
    'Affordable and cozy stay.',
    'https://example.com/nest.jpg',
    'contact@nesthaven.com'
  ),
  (
    2,
    'Gallivanters Hostel',
    'House Number 7 Mlali Road, Masaki',
    'Dorms, Double Rooms',
    '$8 - $15',
    'Perfect for budget travelers.',
    'https://example.com/gallivanters.jpg',
    'contact@gallivanters.com'
  ),
  (
    3,
    'Cefa Hostel',
    'Usagara Street House MK/MCB 1059',
    'Dorms, Private Rooms',
    '$12 - $25',
    'A home away from home.',
    'https://example.com/cefa.jpg',
    'contact@cefa.com'
  );

-- --------------------------------------------------------
--
-- Table structure for table `payments`
--
CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `amount` decimal(10, 2) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `status` enum('Success', 'Failed') DEFAULT 'Success'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `bookings`
--
ALTER TABLE
  `bookings`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `hostel_id` (`hostel_id`);

--
-- Indexes for table `hostels`
--
ALTER TABLE
  `hostels`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE
  `payments`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `booking_id` (`booking_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE
  `bookings`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `hostels`
--
ALTER TABLE
  `hostels`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE
  `payments`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `bookings`
--
ALTER TABLE
  `bookings`
ADD
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostels` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE
  `payments`
ADD
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`);

--
-- Database: `hotel_management`
--
CREATE DATABASE IF NOT EXISTS `hotel_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `hotel_management`;

-- --------------------------------------------------------
--
-- Table structure for table `bookings`
--
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_in_date` date DEFAULT NULL,
  `check_out_date` date DEFAULT NULL,
  `total_cost` decimal(10, 2) DEFAULT NULL,
  `status` enum('Confirmed', 'Cancelled') DEFAULT 'Confirmed'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `customers`
--
CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `feedback`
--
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `rooms`
--
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL,
  `room_rate` decimal(10, 2) DEFAULT NULL,
  `status` enum('Available', 'Occupied', 'Maintenance') DEFAULT 'Available'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `bookings`
--
ALTER TABLE
  `bookings`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `customer_id` (`customer_id`),
ADD
  KEY `room_id` (`room_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE
  `customers`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `email` (`email`);

--
-- Indexes for table `feedback`
--
ALTER TABLE
  `feedback`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `customer_id` (`customer_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE
  `rooms`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE
  `bookings`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE
  `customers`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE
  `feedback`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE
  `rooms`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `bookings`
--
ALTER TABLE
  `bookings`
ADD
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
ADD
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE
  `feedback`
ADD
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Database: `hotel_system`
--
CREATE DATABASE IF NOT EXISTS `hotel_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `hotel_system`;

-- --------------------------------------------------------
--
-- Table structure for table `bookings`
--
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `bookings`
--
INSERT INTO
  `bookings` (`id`, `customer_name`, `room_id`, `booking_date`)
VALUES
  (1, 'PROSPER MWASILE', 1, '4232-03-01'),
  (2, 'PROSPER MWASILE', 1, '4232-03-01'),
  (3, 'PROSPER MWASILE', 1, '4232-03-01'),
  (4, 'PROSPER MWASILE', 8, '2024-11-23'),
  (5, 'PROSPER MWASILE', 2, '2024-11-10');

-- --------------------------------------------------------
--
-- Table structure for table `customers`
--
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `id_number` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `passport_id` varchar(50) DEFAULT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `customers`
--
INSERT INTO
  `customers` (
    `customer_id`,
    `id_number`,
    `email`,
    `full_name`,
    `address`,
    `passport_id`,
    `registered_at`
  )
VALUES
  (
    1,
    '1',
    'popermwasile173@gmail.com',
    'PROSPER MWASILE',
    'kibaha',
    '45',
    '2024-11-14 11:28:23'
  ),
  (
    2,
    '2',
    'iddiamirially24tz@gmail.com',
    'jamaa',
    'kigogo',
    '234',
    '2024-11-14 11:52:48'
  ),
  (
    3,
    '3',
    'mmm@gmail.com',
    'IDDI ALLY',
    'yuy',
    '45',
    '2024-11-14 12:12:26'
  );

-- --------------------------------------------------------
--
-- Table structure for table `rooms`
--
CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_type` varchar(50) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `status` varchar(20) DEFAULT 'Available'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `rooms`
--
INSERT INTO
  `rooms` (
    `id`,
    `room_type`,
    `room_name`,
    `price`,
    `status`
  )
VALUES
  (1, 'Single', 'Single Room', '50.00', 'Booked'),
  (2, 'Single', 'Single Room 1', '50.00', 'Booked'),
  (3, 'Double', 'Double Room', '75.00', 'Available'),
  (
    4,
    'Double',
    'Double Room -59',
    '75.00',
    'Available'
  ),
  (
    5,
    'Double',
    'Double Room -58',
    '75.00',
    'Available'
  ),
  (
    6,
    'Double',
    'Double Room -57',
    '75.00',
    'Available'
  ),
  (7, 'Suite', 'Suite Room', '150.00', 'Available'),
  (8, 'Suite', 'Suite Room -79', '150.00', 'Booked'),
  (
    9,
    'Suite',
    'Suite Room -78',
    '150.00',
    'Available'
  ),
  (
    10,
    'Suite',
    'Suite Room -77',
    '150.00',
    'Available'
  ),
  (
    11,
    'Suite',
    'Suite Room -76',
    '150.00',
    'Available'
  ),
  (
    12,
    'Suite',
    'Suite Room -75',
    '150.00',
    'Available'
  ),
  (
    13,
    'Suite',
    'Suite Room -74',
    '150.00',
    'Available'
  ),
  (
    14,
    'Suite',
    'Suite Room -73',
    '150.00',
    'Available'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `bookings`
--
ALTER TABLE
  `bookings`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `room_id` (`room_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE
  `customers`
ADD
  PRIMARY KEY (`customer_id`),
ADD
  UNIQUE KEY `id_number` (`id_number`),
ADD
  UNIQUE KEY `email` (`email`);

--
-- Indexes for table `rooms`
--
ALTER TABLE
  `rooms`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE
  `bookings`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE
  `customers`
MODIFY
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 20;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE
  `rooms`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 15;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `bookings`
--
ALTER TABLE
  `bookings`
ADD
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Database: `jobsearch`
--
CREATE DATABASE IF NOT EXISTS `jobsearch` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `jobsearch`;

-- --------------------------------------------------------
--
-- Table structure for table `category`
--
CREATE TABLE `category` (
  `name` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  `nopost` int(3) NOT NULL,
  `id` int(3) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `deadline` date NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `feedback`
--
CREATE TABLE `feedback` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `comment` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index1`
--
CREATE TABLE `index1` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index2`
--
CREATE TABLE `index2` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index3`
--
CREATE TABLE `index3` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index4`
--
CREATE TABLE `index4` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index5`
--
CREATE TABLE `index5` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index6`
--
CREATE TABLE `index6` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index7`
--
CREATE TABLE `index7` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index8`
--
CREATE TABLE `index8` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index9`
--
CREATE TABLE `index9` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index10`
--
CREATE TABLE `index10` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index11`
--
CREATE TABLE `index11` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index12`
--
CREATE TABLE `index12` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index13`
--
CREATE TABLE `index13` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index14`
--
CREATE TABLE `index14` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index15`
--
CREATE TABLE `index15` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index16`
--
CREATE TABLE `index16` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index17`
--
CREATE TABLE `index17` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index18`
--
CREATE TABLE `index18` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index19`
--
CREATE TABLE `index19` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `index20`
--
CREATE TABLE `index20` (
  `id` int(10) NOT NULL,
  `post` varchar(50) NOT NULL,
  `employer` varchar(50) NOT NULL,
  `timeline` date NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `duties` mediumtext NOT NULL,
  `qualification` varchar(10000) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `job_categories`
--
CREATE TABLE `job_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `job_count` int(11) DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `job_categories`
--
INSERT INTO
  `job_categories` (`id`, `category_name`, `job_count`)
VALUES
  (2, ' Medical professions', 100),
  (3, 'Physical & Natural Sciences', 4),
  (4, 'Creative and Design', 2),
  (5, 'Education and Training', 7),
  (6, 'Engineering and Construction', 19),
  (7, 'IT and Telecoms', 5),
  (8, 'Healthcare and Pharmaceutical', 3),
  (22, 'Accounting ', 20);

-- --------------------------------------------------------
--
-- Table structure for table `user`
--
CREATE TABLE `user` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(16) NOT NULL,
  `role` text NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `vacancies`
--
CREATE TABLE `vacancies` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `vacancies` int(11) DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `vacancies`
--
INSERT INTO
  `vacancies` (`id`, `category_name`, `vacancies`)
VALUES
  (1, 'Accounting and Auditing', 2),
  (
    2,
    'Banking, Economics and Financial Services',
    2
  ),
  (3, 'Physical & Natural Sciences', 1),
  (4, 'Creative and Design', 2),
  (5, 'Education and Training', 7),
  (6, 'Engineering and Construction', 22),
  (7, 'IT and Telecoms', 12),
  (8, 'Healthcare and Pharmaceutical', 3),
  (9, ' Medical professions', 5),
  (10, ' Medical professions', 5),
  (11, ' Medical professions', 5),
  (12, ' Medical professions', 5),
  (13, ' Medical professions', 5),
  (14, ' Medical professions', 5),
  (15, ' Medical professions', 5),
  (16, ' Medical professions', 5),
  (17, ' Medical professions', 5),
  (18, ' Medical professions', 5),
  (19, 'IT and Telecoms', 10),
  (20, 'IT and Telecoms', 10),
  (21, 'IT and Telecoms', 10),
  (22, 'IT and Telecoms', 10),
  (23, 'IT and Telecoms', 10),
  (24, 'IT and Telecoms', 10);

--
-- Indexes for dumped tables
--
--
-- Indexes for table `category`
--
ALTER TABLE
  `category`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE
  `feedback`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index1`
--
ALTER TABLE
  `index1`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index2`
--
ALTER TABLE
  `index2`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index3`
--
ALTER TABLE
  `index3`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index4`
--
ALTER TABLE
  `index4`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index5`
--
ALTER TABLE
  `index5`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index6`
--
ALTER TABLE
  `index6`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index7`
--
ALTER TABLE
  `index7`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index8`
--
ALTER TABLE
  `index8`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index9`
--
ALTER TABLE
  `index9`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index10`
--
ALTER TABLE
  `index10`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index11`
--
ALTER TABLE
  `index11`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index12`
--
ALTER TABLE
  `index12`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index13`
--
ALTER TABLE
  `index13`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index14`
--
ALTER TABLE
  `index14`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index15`
--
ALTER TABLE
  `index15`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index16`
--
ALTER TABLE
  `index16`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index17`
--
ALTER TABLE
  `index17`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index18`
--
ALTER TABLE
  `index18`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index19`
--
ALTER TABLE
  `index19`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `index20`
--
ALTER TABLE
  `index20`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE
  `job_categories`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE
  `user`
ADD
  PRIMARY KEY (`email`);

--
-- Indexes for table `vacancies`
--
ALTER TABLE
  `vacancies`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE
  `category`
MODIFY
  `id` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE
  `feedback`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index1`
--
ALTER TABLE
  `index1`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index2`
--
ALTER TABLE
  `index2`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index3`
--
ALTER TABLE
  `index3`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index4`
--
ALTER TABLE
  `index4`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index5`
--
ALTER TABLE
  `index5`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index6`
--
ALTER TABLE
  `index6`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index7`
--
ALTER TABLE
  `index7`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index8`
--
ALTER TABLE
  `index8`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index9`
--
ALTER TABLE
  `index9`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index10`
--
ALTER TABLE
  `index10`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index11`
--
ALTER TABLE
  `index11`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index12`
--
ALTER TABLE
  `index12`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index13`
--
ALTER TABLE
  `index13`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index14`
--
ALTER TABLE
  `index14`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index15`
--
ALTER TABLE
  `index15`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index16`
--
ALTER TABLE
  `index16`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index17`
--
ALTER TABLE
  `index17`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index18`
--
ALTER TABLE
  `index18`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index19`
--
ALTER TABLE
  `index19`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `index20`
--
ALTER TABLE
  `index20`
MODIFY
  `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE
  `job_categories`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 24;

--
-- AUTO_INCREMENT for table `vacancies`
--
ALTER TABLE
  `vacancies`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 25;

--
-- Database: `jobseek`
--
CREATE DATABASE IF NOT EXISTS `jobseek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `jobseek`;

-- --------------------------------------------------------
--
-- Table structure for table `applications`
--
CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `cover_letter` text DEFAULT NULL,
  `resume_path` varchar(255) DEFAULT NULL,
  `status` enum(
    'pending',
    'reviewed',
    'shortlisted',
    'rejected',
    'hired'
  ) DEFAULT 'pending',
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `application_analytics`
--
CREATE TABLE `application_analytics` (
  `analytics_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `applicant_id` int(11) NOT NULL,
  `status` enum(
    'pending',
    'reviewed',
    'shortlisted',
    'rejected',
    'hired'
  ) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `application_status_logs`
--
CREATE TABLE `application_status_logs` (
  `status_log_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `status` enum(
    'pending',
    'reviewed',
    'shortlisted',
    'rejected',
    'hired'
  ) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `employers`
--
CREATE TABLE `employers` (
  `employer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_description` text DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `employer_subscriptions`
--
CREATE TABLE `employer_subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `employer_id` int(11) NOT NULL,
  `plan_name` varchar(50) DEFAULT NULL,
  `plan_description` text DEFAULT NULL,
  `price` decimal(10, 2) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active', 'expired') DEFAULT 'active'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `jobs`
--
CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `company_admin_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `job_title` varchar(100) NOT NULL,
  `job_description` text NOT NULL,
  `job_type` enum('full-time', 'part-time', 'internship', 'contract') NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `salary_range` varchar(50) DEFAULT NULL,
  `application_deadline` date NOT NULL,
  `status` enum('open', 'closed', 'draft') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `job_analytics`
--
CREATE TABLE `job_analytics` (
  `analytics_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `views` int(11) DEFAULT 0,
  `applications` int(11) DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `job_categories`
--
CREATE TABLE `job_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `job_category_skill`
--
CREATE TABLE `job_category_skill` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `job_requirements`
--
CREATE TABLE `job_requirements` (
  `requirement_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `requirement_text` text NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `job_skills`
--
CREATE TABLE `job_skills` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `notifications`
--
CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `payments`
--
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `payment_methods`
--
CREATE TABLE `payment_methods` (
  `method_id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL,
  `details` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `roles`
--
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` enum('applicant', 'super_admin', 'company_admin') NOT NULL,
  `description` text DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `skills`
--
CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` enum('active', 'inactive', 'suspended') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `user_details`
--
CREATE TABLE `user_details` (
  `detail_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `user_security`
--
CREATE TABLE `user_security` (
  `security_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_expiry` datetime DEFAULT NULL,
  `login_attempts` int(11) DEFAULT 0,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `applications`
--
ALTER TABLE
  `applications`
ADD
  PRIMARY KEY (`application_id`),
ADD
  KEY `job_id` (`job_id`),
ADD
  KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `application_analytics`
--
ALTER TABLE
  `application_analytics`
ADD
  PRIMARY KEY (`analytics_id`),
ADD
  KEY `job_id` (`job_id`),
ADD
  KEY `applicant_id` (`applicant_id`);

--
-- Indexes for table `application_status_logs`
--
ALTER TABLE
  `application_status_logs`
ADD
  PRIMARY KEY (`status_log_id`),
ADD
  KEY `application_id` (`application_id`),
ADD
  KEY `updated_by` (`updated_by`);

--
-- Indexes for table `employers`
--
ALTER TABLE
  `employers`
ADD
  PRIMARY KEY (`employer_id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `employer_subscriptions`
--
ALTER TABLE
  `employer_subscriptions`
ADD
  PRIMARY KEY (`subscription_id`),
ADD
  KEY `employer_id` (`employer_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE
  `jobs`
ADD
  PRIMARY KEY (`job_id`),
ADD
  KEY `company_admin_id` (`company_admin_id`),
ADD
  KEY `category_id` (`category_id`);

--
-- Indexes for table `job_analytics`
--
ALTER TABLE
  `job_analytics`
ADD
  PRIMARY KEY (`analytics_id`),
ADD
  KEY `job_id` (`job_id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE
  `job_categories`
ADD
  PRIMARY KEY (`category_id`),
ADD
  UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `job_category_skill`
--
ALTER TABLE
  `job_category_skill`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `category_id` (`category_id`),
ADD
  KEY `skill_id` (`skill_id`);

--
-- Indexes for table `job_requirements`
--
ALTER TABLE
  `job_requirements`
ADD
  PRIMARY KEY (`requirement_id`),
ADD
  KEY `job_id` (`job_id`);

--
-- Indexes for table `job_skills`
--
ALTER TABLE
  `job_skills`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `job_id` (`job_id`),
ADD
  KEY `skill_id` (`skill_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  PRIMARY KEY (`notification_id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE
  `payments`
ADD
  PRIMARY KEY (`payment_id`),
ADD
  KEY `user_id` (`user_id`),
ADD
  KEY `subscription_id` (`subscription_id`),
ADD
  KEY `payment_method` (`payment_method`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE
  `payment_methods`
ADD
  PRIMARY KEY (`method_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE
  `roles`
ADD
  PRIMARY KEY (`role_id`),
ADD
  UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `skills`
--
ALTER TABLE
  `skills`
ADD
  PRIMARY KEY (`skill_id`),
ADD
  UNIQUE KEY `skill_name` (`skill_name`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`user_id`),
ADD
  UNIQUE KEY `username` (`username`),
ADD
  UNIQUE KEY `email` (`email`),
ADD
  KEY `role_id` (`role_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE
  `user_details`
ADD
  PRIMARY KEY (`detail_id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `user_security`
--
ALTER TABLE
  `user_security`
ADD
  PRIMARY KEY (`security_id`),
ADD
  KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE
  `applications`
MODIFY
  `application_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `application_analytics`
--
ALTER TABLE
  `application_analytics`
MODIFY
  `analytics_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `application_status_logs`
--
ALTER TABLE
  `application_status_logs`
MODIFY
  `status_log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employers`
--
ALTER TABLE
  `employers`
MODIFY
  `employer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employer_subscriptions`
--
ALTER TABLE
  `employer_subscriptions`
MODIFY
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE
  `jobs`
MODIFY
  `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_analytics`
--
ALTER TABLE
  `job_analytics`
MODIFY
  `analytics_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE
  `job_categories`
MODIFY
  `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_category_skill`
--
ALTER TABLE
  `job_category_skill`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_requirements`
--
ALTER TABLE
  `job_requirements`
MODIFY
  `requirement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_skills`
--
ALTER TABLE
  `job_skills`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE
  `notifications`
MODIFY
  `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE
  `payments`
MODIFY
  `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE
  `payment_methods`
MODIFY
  `method_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE
  `roles`
MODIFY
  `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE
  `skills`
MODIFY
  `skill_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE
  `user_details`
MODIFY
  `detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_security`
--
ALTER TABLE
  `user_security`
MODIFY
  `security_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `applications`
--
ALTER TABLE
  `applications`
ADD
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`applicant_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `application_analytics`
--
ALTER TABLE
  `application_analytics`
ADD
  CONSTRAINT `application_analytics_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `application_analytics_ibfk_2` FOREIGN KEY (`applicant_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `application_status_logs`
--
ALTER TABLE
  `application_status_logs`
ADD
  CONSTRAINT `application_status_logs_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `applications` (`application_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `application_status_logs_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `employers`
--
ALTER TABLE
  `employers`
ADD
  CONSTRAINT `employers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `employer_subscriptions`
--
ALTER TABLE
  `employer_subscriptions`
ADD
  CONSTRAINT `employer_subscriptions_ibfk_1` FOREIGN KEY (`employer_id`) REFERENCES `employers` (`employer_id`) ON DELETE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE
  `jobs`
ADD
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`company_admin_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`category_id`) ON DELETE
SET
  NULL;

--
-- Constraints for table `job_analytics`
--
ALTER TABLE
  `job_analytics`
ADD
  CONSTRAINT `job_analytics_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE;

--
-- Constraints for table `job_category_skill`
--
ALTER TABLE
  `job_category_skill`
ADD
  CONSTRAINT `job_category_skill_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`category_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `job_category_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE CASCADE;

--
-- Constraints for table `job_requirements`
--
ALTER TABLE
  `job_requirements`
ADD
  CONSTRAINT `job_requirements_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE;

--
-- Constraints for table `job_skills`
--
ALTER TABLE
  `job_skills`
ADD
  CONSTRAINT `job_skills_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `job_skills_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE
  `payments`
ADD
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`subscription_id`) REFERENCES `employer_subscriptions` (`subscription_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`method_id`) ON DELETE
SET
  NULL;

--
-- Constraints for table `users`
--
ALTER TABLE
  `users`
ADD
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE
  `user_details`
ADD
  CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_security`
--
ALTER TABLE
  `user_security`
ADD
  CONSTRAINT `user_security_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Database: `job_portal`
--
CREATE DATABASE IF NOT EXISTS `job_portal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `job_portal`;

--
-- Database: `login_system`
--
CREATE DATABASE IF NOT EXISTS `login_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `login_system`;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin', 'user') NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (`id`, `username`, `password`, `role`)
VALUES
  (1, 'admin_user', 'admin123', 'admin'),
  (2, 'normal_user', 'user123', 'user');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- Database: `msg`
--
CREATE DATABASE IF NOT EXISTS `msg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `msg`;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_2fa_enabled` tinyint(1) DEFAULT 0,
  `secret_code` varchar(10) NOT NULL,
  `token_expiry` datetime NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` int(25) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `is_2fa_enabled`,
    `secret_code`,
    `token_expiry`,
    `fullname`,
    `phone`
  )
VALUES
  (
    1,
    'mwasile',
    '$2y$10$1c5CifH6yZfZVhMW6nZBt.GR1DqsDS2rvd9hLXPmrrMGMhlb6tqEG',
    'popermwasile173@gmail.com',
    0,
    '',
    '0000-00-00 00:00:00',
    '',
    0
  ),
  (
    9,
    'Ally',
    '$2y$10$yJU3h26IzCgAt5JboojHj.DGvZNqcF4r9YuL2FYJFm9ChsyX66Jm6',
    'iddiamirially24tz@gmail.com',
    0,
    '',
    '0000-00-00 00:00:00',
    'ALLY A',
    672586994
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `username` (`username`),
ADD
  UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

--
-- Database: `mwasile`
--
CREATE DATABASE IF NOT EXISTS `mwasile` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `mwasile`;

--
-- Database: `mydata`
--
CREATE DATABASE IF NOT EXISTS `mydata` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `mydata`;

--
-- Database: `mydatabase`
--
CREATE DATABASE IF NOT EXISTS `mydatabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `mydatabase`;

-- --------------------------------------------------------
--
-- Table structure for table `notifications`
--
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `notifications`
--
INSERT INTO
  `notifications` (`id`, `message`, `created_at`)
VALUES
  (
    1,
    'New notification received!',
    '2024-08-14 11:08:35'
  ),
  (2, 'i love my self!', '2024-08-14 11:08:35'),
  (3, 'how  are you!', '2024-08-14 11:08:35');

-- --------------------------------------------------------
--
-- Table structure for table `notification_log`
--
CREATE TABLE `notification_log` (
  `id` int(11) NOT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `log_message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `notification_log`
--
ALTER TABLE
  `notification_log`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE
  `notifications`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `notification_log`
--
ALTER TABLE
  `notification_log`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Database: `notification`
--
CREATE DATABASE IF NOT EXISTS `notification` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `notification`;

-- --------------------------------------------------------
--
-- Table structure for table `notifications`
--
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `notifications`
--
INSERT INTO
  `notifications` (
    `id`,
    `user_id`,
    `message`,
    `is_read`,
    `created_at`
  )
VALUES
  (
    1,
    1,
    'Welcome to our website!',
    0,
    '2024-08-13 13:30:18'
  ),
  (
    2,
    2,
    'You have a new message from John Doe.',
    0,
    '2024-08-13 13:30:18'
  ),
  (
    3,
    3,
    'Your profile has been updated.',
    0,
    '2024-08-13 13:30:18'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE
  `notifications`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 11;

--
-- Database: `notification_system`
--
CREATE DATABASE IF NOT EXISTS `notification_system` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `notification_system`;

-- --------------------------------------------------------
--
-- Table structure for table `notifications`
--
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `notifications`
--
INSERT INTO
  `notifications` (`id`, `user_id`, `message`, `timestamp`)
VALUES
  (
    3,
    1,
    'This is a notification for user1',
    '2024-08-16 08:59:43'
  ),
  (
    4,
    2,
    'This is a notification for user2',
    '2024-08-16 08:59:44'
  ),
  (
    5,
    3,
    'This is a notification for user3',
    '2024-08-16 08:59:44'
  ),
  (
    6,
    1,
    'Another notification for user1',
    '2024-08-16 08:59:44'
  );

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (`id`, `username`, `password`)
VALUES
  (1, 'user1', 'password1'),
  (2, 'user2', 'password2'),
  (3, 'user3', 'password3'),
  (5, 'user', '$'),
  (7, 'user10', '$'),
  (8, 'user20', '$2'),
  (9, 'user30', '$2a');

--
-- Indexes for dumped tables
--
--
-- Indexes for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE
  `notifications`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 10;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `notifications`
--
ALTER TABLE
  `notifications`
ADD
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

USE `phpmyadmin`;

-- --------------------------------------------------------
--
-- Table structure for table `pma__bookmark`
--
CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Bookmarks';

-- --------------------------------------------------------
--
-- Table structure for table `pma__central_columns`
--
CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Central list of columns';

-- --------------------------------------------------------
--
-- Table structure for table `pma__column_info`
--
CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Column information for phpMyAdmin';

-- --------------------------------------------------------
--
-- Table structure for table `pma__designer_settings`
--
CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--
INSERT INTO
  `pma__designer_settings` (`username`, `settings_data`)
VALUES
  (
    'root',
    '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\"}'
  );

-- --------------------------------------------------------
--
-- Table structure for table `pma__export_templates`
--
CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--
INSERT INTO
  `pma__export_templates` (
    `id`,
    `username`,
    `export_type`,
    `template_name`,
    `template_data`
  )
VALUES
  (
    1,
    'root',
    'table',
    'user_db',
    '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'
  ),
  (
    2,
    'root',
    'table',
    'databas',
    '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'
  ),
  (
    3,
    'root',
    'database',
    'user_db',
    '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"job_postings\",\"users\"],\"table_structure[]\":[\"job_postings\",\"users\"],\"table_data[]\":[\"job_postings\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'
  ),
  (
    5,
    'root',
    'database',
    'user',
    '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"job_postings\",\"uploaded_files\",\"users\"],\"table_structure[]\":[\"job_postings\",\"uploaded_files\",\"users\"],\"table_data[]\":[\"job_postings\",\"uploaded_files\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'
  );

-- --------------------------------------------------------
--
-- Table structure for table `pma__favorite`
--
CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Favorite tables';

-- --------------------------------------------------------
--
-- Table structure for table `pma__history`
--
CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'SQL history for phpMyAdmin';

-- --------------------------------------------------------
--
-- Table structure for table `pma__navigationhiding`
--
CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--
INSERT INTO
  `pma__navigationhiding` (
    `username`,
    `item_name`,
    `item_type`,
    `db_name`,
    `table_name`
  )
VALUES
  ('root', 'sales', 'table', 'storemanagement', '');

-- --------------------------------------------------------
--
-- Table structure for table `pma__pdf_pages`
--
CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------
--
-- Table structure for table `pma__recent`
--
CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--
INSERT INTO
  `pma__recent` (`username`, `tables`)
VALUES
  (
    'root',
    '[{\"db\":\"a@beche\",\"table\":\"users\"},{\"db\":\"a@beche\",\"table\":\"applications\"},{\"db\":\"a@beche\",\"table\":\"notifications\"},{\"db\":\"a@beche\",\"table\":\"job_postings\"},{\"db\":\"a@beche\",\"table\":\"feedback\"},{\"db\":\"a@beche\",\"table\":\"categories\"},{\"db\":\"a@beche\",\"table\":\"settings\"},{\"db\":\"a@beche\",\"table\":\"search_logs\"},{\"db\":\"a@beche\",\"table\":\"pages\"},{\"db\":\"a@beche\",\"table\":\"jobs\"}]'
  );

-- --------------------------------------------------------
--
-- Table structure for table `pma__relation`
--
CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Relation table';

-- --------------------------------------------------------
--
-- Table structure for table `pma__savedsearches`
--
CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Saved searches';

-- --------------------------------------------------------
--
-- Table structure for table `pma__table_coords`
--
CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------
--
-- Table structure for table `pma__table_info`
--
CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Table information for phpMyAdmin';

-- --------------------------------------------------------
--
-- Table structure for table `pma__table_uiprefs`
--
CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--
INSERT INTO
  `pma__table_uiprefs` (
    `username`,
    `db_name`,
    `table_name`,
    `prefs`,
    `last_update`
  )
VALUES
  (
    'root',
    'a@beche',
    'job_postings',
    '{\"sorted_col\":\"`job_postings`.`Location` DESC\"}',
    '2025-01-16 11:24:13'
  ),
  (
    'root',
    'a@beche',
    'users',
    '{\"CREATE_TIME\":\"2025-01-15 21:54:13\",\"col_order\":[1,0,2,3,4,5,6,7],\"col_visib\":[1,1,1,1,1,1,1,1]}',
    '2025-01-15 21:33:35'
  ),
  (
    'root',
    'notification',
    'notifications',
    '{\"sorted_col\":\"`notifications`.`user_id` DESC\"}',
    '2024-08-13 14:24:09'
  ),
  (
    'root',
    'user_db',
    'job_postings',
    '{\"sorted_col\":\"`job_postings`.`id` DESC\"}',
    '2024-12-19 14:27:24'
  ),
  (
    'root',
    'user_db',
    'users',
    '{\"CREATE_TIME\":\"2024-12-05 10:47:28\",\"col_order\":[0,1,2,3,4],\"col_visib\":[1,1,1,1,1]}',
    '2024-12-07 23:34:06'
  );

-- --------------------------------------------------------
--
-- Table structure for table `pma__tracking`
--
CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking`
  set
(
      'UPDATE',
      'REPLACE',
      'INSERT',
      'DELETE',
      'TRUNCATE',
      'CREATE DATABASE',
      'ALTER DATABASE',
      'DROP DATABASE',
      'CREATE TABLE',
      'ALTER TABLE',
      'RENAME TABLE',
      'DROP TABLE',
      'CREATE INDEX',
      'DROP INDEX',
      'CREATE VIEW',
      'ALTER VIEW',
      'DROP VIEW'
    ) COLLATE utf8_bin DEFAULT NULL,
    `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------
--
-- Table structure for table `pma__userconfig`
--
CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--
INSERT INTO
  `pma__userconfig` (`username`, `timevalue`, `config_data`)
VALUES
  (
    'root',
    '2025-01-16 22:03:14',
    '{\"Console\\/Mode\":\"collapse\"}'
  );

-- --------------------------------------------------------
--
-- Table structure for table `pma__usergroups`
--
CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y', 'N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'User groups with configured menu items';

-- --------------------------------------------------------
--
-- Table structure for table `pma__users`
--
CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_bin COMMENT = 'Users and their assignments to user groups';

--
-- Indexes for dumped tables
--
--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE
  `pma__bookmark`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE
  `pma__central_columns`
ADD
  PRIMARY KEY (`db_name`, `col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE
  `pma__column_info`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `db_name` (`db_name`, `table_name`, `column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE
  `pma__designer_settings`
ADD
  PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE
  `pma__export_templates`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `u_user_type_template` (`username`, `export_type`, `template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE
  `pma__favorite`
ADD
  PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE
  `pma__history`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `username` (`username`, `db`, `table`, `timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE
  `pma__navigationhiding`
ADD
  PRIMARY KEY (
    `username`,
    `item_name`,
    `item_type`,
    `db_name`,
    `table_name`
  );

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE
  `pma__pdf_pages`
ADD
  PRIMARY KEY (`page_nr`),
ADD
  KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE
  `pma__recent`
ADD
  PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE
  `pma__relation`
ADD
  PRIMARY KEY (`master_db`, `master_table`, `master_field`),
ADD
  KEY `foreign_field` (`foreign_db`, `foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE
  `pma__savedsearches`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `u_savedsearches_username_dbname` (`username`, `db_name`, `search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE
  `pma__table_coords`
ADD
  PRIMARY KEY (`db_name`, `table_name`, `pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE
  `pma__table_info`
ADD
  PRIMARY KEY (`db_name`, `table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE
  `pma__table_uiprefs`
ADD
  PRIMARY KEY (`username`, `db_name`, `table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE
  `pma__tracking`
ADD
  PRIMARY KEY (`db_name`, `table_name`, `version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE
  `pma__userconfig`
ADD
  PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE
  `pma__usergroups`
ADD
  PRIMARY KEY (`usergroup`, `tab`, `allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE
  `pma__users`
ADD
  PRIMARY KEY (`username`, `usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE
  `pma__bookmark`
MODIFY
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE
  `pma__column_info`
MODIFY
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE
  `pma__export_templates`
MODIFY
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE
  `pma__history`
MODIFY
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE
  `pma__pdf_pages`
MODIFY
  `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE
  `pma__savedsearches`
MODIFY
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Database: `poper`
--
CREATE DATABASE IF NOT EXISTS `poper` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `poper`;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (`id`, `email`, `fullname`, `phone`)
VALUES
  (
    1,
    'example1@gmail.com',
    'John Doe',
    '1234567890'
  ),
  (
    2,
    'example2@gmail.com',
    'Jane Smith',
    '9876543210'
  ),
  (
    3,
    'popermwasile@gmail.com',
    'jane wooh',
    '06467890'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- Database: `storemanagement`
--
CREATE DATABASE IF NOT EXISTS `storemanagement` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `storemanagement`;

-- --------------------------------------------------------
--
-- Table structure for table `categories`
--
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `categories`
--
INSERT INTO
  `categories` (`id`, `name`)
VALUES
  (1, 'Shoes'),
  (2, 'Clothing'),
  (3, 'Accessories');

-- --------------------------------------------------------
--
-- Table structure for table `products`
--
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10, 2) NOT NULL,
  `cost` decimal(10, 2) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `products`
--
INSERT INTO
  `products` (
    `id`,
    `name`,
    `description`,
    `price`,
    `cost`,
    `stock`,
    `category_id`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Nike Air Max',
    'Comfortable running shoes',
    '120.00',
    '80.00',
    20,
    1,
    '2024-11-23 23:00:49',
    '2024-11-23 23:00:49'
  ),
  (
    2,
    'Adidas T-Shirt',
    'Lightweight sports t-shirt',
    '35.00',
    '20.00',
    50,
    2,
    '2024-11-23 23:00:49',
    '2024-11-23 23:00:49'
  );

-- --------------------------------------------------------
--
-- Table structure for table `sales`
--
CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` decimal(10, 2) NOT NULL,
  `sale_date` date DEFAULT curdate()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `categories`
--
ALTER TABLE
  `categories`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE
  `products`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `category_id` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE
  `sales`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE
  `categories`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE
  `products`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE
  `sales`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `products`
--
ALTER TABLE
  `products`
ADD
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE
  `sales`
ADD
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Database: `test_db`
--
CREATE DATABASE IF NOT EXISTS `test_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `test_db`;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Database: `tinna_db`
--
CREATE DATABASE IF NOT EXISTS `tinna_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `tinna_db`;

-- --------------------------------------------------------
--
-- Table structure for table `student`
--
CREATE TABLE `student` (
  `regno` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `address` char(15) NOT NULL,
  `GPA` decimal(1, 1) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `student`
--
ALTER TABLE
  `student`
ADD
  PRIMARY KEY (`regno`);

--
-- Database: ` two_factor_auth`
--
CREATE DATABASE IF NOT EXISTS ` two_factor_auth` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE ` two_factor_auth`;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `is_2fa_enabled` tinyint(1) DEFAULT 0,
  `secret_code` varchar(10) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password`,
    `email`,
    `is_2fa_enabled`,
    `secret_code`,
    `token_expiry`
  )
VALUES
  (
    1,
    'mwasile',
    '$2y$10$w8rnOfDtQ/T424DnRxKfQOe6somI0JSTnrrb10Vl9XfOYtIN5ddMm',
    'popermwasile173@gmail.com',
    0,
    '211404',
    '2024-08-28 14:34:38'
  ),
  (
    2,
    'stephen',
    '$2y$10$87X8aV0NhQJJFamJXxJJleb7h/3/z5nQxJLjtLEokBtASrbiA9dQS',
    'steph@gmail.com',
    1,
    NULL,
    NULL
  ),
  (
    3,
    'iddiamirially24tz@gmail.com',
    '$2y$10$8V1UmZqohWxERKs5/nzCfu6Y142eArkkxMVh550IbbhlCX8hHFtfC',
    'iddiamirially24tz@gmail.com',
    0,
    '599419',
    '2024-08-28 14:11:25'
  ),
  (
    6,
    'IDDI',
    '$2y$10$adk/fCSLYsfyxt5iNpQdo.8HqWWr4bjz3lXEifvOh8sbwNZBYCgLO',
    'gerge@gmail.com',
    0,
    NULL,
    NULL
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `username` (`username`),
ADD
  UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 7;

--
-- Database: ` two_step_verification;`
--
CREATE DATABASE IF NOT EXISTS ` two_step_verification;` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE ` two_step_verification;`;

-- --------------------------------------------------------
--
-- Table structure for table `password_resets`
--
CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `verification_codes`
--
CREATE TABLE `verification_codes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `password_resets`
--
ALTER TABLE
  `password_resets`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `verification_codes`
--
ALTER TABLE
  `verification_codes`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE
  `password_resets`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verification_codes`
--
ALTER TABLE
  `verification_codes`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `verification_codes`
--
ALTER TABLE
  `verification_codes`
ADD
  CONSTRAINT `verification_codes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Database: `user_db`
--
CREATE DATABASE IF NOT EXISTS `user_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `user_db`;

-- --------------------------------------------------------
--
-- Table structure for table `applications`
--
CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position` varchar(100) NOT NULL,
  `education` text NOT NULL,
  `experience` text NOT NULL,
  `skills` text NOT NULL,
  `resume` varchar(255) NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `applications`
--
INSERT INTO
  `applications` (
    `id`,
    `fullName`,
    `email`,
    `phone`,
    `position`,
    `education`,
    `experience`,
    `skills`,
    `resume`,
    `submitted_at`
  )
VALUES
  (
    2,
    'PROSPER MWASILE',
    'popermwasile173@gmail.com',
    '071890399',
    'account and auditing',
    'degree  in IT dar es salaaam campus',
    'hahahahhahhahhaha',
    'hhwhhw',
    'uploads\\1736693835047.pdf',
    '2025-01-12 14:57:15'
  ),
  (
    3,
    'nasra juma',
    'naah@gmail.com',
    '071890399',
    'public health',
    'degree in environmental science and technology',
    'five years',
    'cooking\r\neating\r\nmany many',
    'uploads\\1736694619799.pdf',
    '2025-01-12 15:10:19'
  ),
  (
    4,
    'nasra juma mwishee',
    'naah@gmail.com',
    '929292992',
    'public health',
    'hhhwheh',
    'nhehhe',
    'wwjjwjwj',
    'uploads\\1736695123549.pdf',
    '2025-01-12 15:18:43'
  ),
  (
    5,
    'mwasile prosper',
    'naah@gmail.com',
    '929292992',
    'public health',
    'nwnwnnw',
    'nwnnwn',
    'jwjjwjw',
    'uploads\\1736762936904.pdf',
    '2025-01-13 10:08:57'
  ),
  (
    6,
    'mwasile prosper',
    'naah@gmail.com',
    '929292992',
    'public health',
    'nwnwnnw',
    'nwnnwn',
    'jwjjwjw',
    'uploads\\1736762992705.pdf',
    '2025-01-13 10:09:52'
  ),
  (
    7,
    'mwasile prosper',
    'naah@gmail.com',
    '929292992',
    'public health',
    'nwnwnnw',
    'nwnnwn',
    'jwjjwjw',
    'uploads\\1736762998719.pdf',
    '2025-01-13 10:09:58'
  );

-- --------------------------------------------------------
--
-- Table structure for table `job_postings`
--
CREATE TABLE `job_postings` (
  `id` int(11) NOT NULL,
  `post_name` varchar(255) NOT NULL,
  `post_number` int(11) NOT NULL,
  `employer` varchar(255) NOT NULL,
  `application_start` date NOT NULL,
  `application_end` date NOT NULL,
  `duties` text NOT NULL,
  `qualifications` text NOT NULL,
  `salary` decimal(10, 2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `job_postings`
--
INSERT INTO
  `job_postings` (
    `id`,
    `post_name`,
    `post_number`,
    `employer`,
    `application_start`,
    `application_end`,
    `duties`,
    `qualifications`,
    `salary`,
    `created_at`
  )
VALUES
  (
    4,
    'account and auditing',
    5,
    'ABC Accounting Firm Location: Dar es Salaam, Tanzania',
    '2024-12-12',
    '2024-12-14',
    ' I. Ripoti za Kifedha: Kuandaa, kupitia na kuchambua taarifa za kifedha kuhakikisha usahihi na ufuatiliaji wa viwango vya udhibiti.                                                                   \r\n                                                                                                                                                                          \r\nII. Michakato ya Ukaguzi: Kufanya ukaguzi wa ndani na nje ili kutathmini udhibiti wa kifedha na kiutendaji, kutambua hatari na kupendekeza maboresho.\r\n   \r\nIII. Usimamizi wa Bajeti: Kuandaa na kufuatilia bajeti, kufuatilia utendaji wa kifedha, na kushauri juu ya mipango ya kupunguza gharama.\r\n',
    'I. Elimu: Shahada ya Kwanza katika Uhasibu, Fedha, au fani inayohusiana. Cheti cha CPA au ACCA ni faida.\n\nII. Uzoefu: Uzoefu wa angalau miaka 3 katika uhasibu, ukaguzi, au nafasi inayohusiana, ikiwezekana katika kampuni ya huduma za kitaaluma.\n\nIII. Ujuzi wa Kiufundi: Uwezo wa kutumia programu za uhasibu (mfano, QuickBooks, SAP) na maarifa thabiti ya GAAP na IFRS.',
    '300.00',
    '2024-12-19 14:14:29'
  ),
  (
    5,
    'PHYSICAL &  NATURAL SCIENCE',
    2,
    'Taasisi ya Utafiti wa Sayansi Asilia Mahali: Dar es Salaam, Tanzania',
    '2024-12-26',
    '2025-01-02',
    '\nI. Kufundisha environmentall sccience na mambo yote yanayohusu kozi.\nII. kulea wanafunzi kuifanya practically kozi.\nIII. Kutangaza vizuri chuo kwenye kozi hii kuandaa matamasha na mihadhara inayohusu mazingira.',
    '\nI. Utafiti wa Maabara: Kuendesha na kusimamia majaribio ya maabara ili kuchunguza na kuelewa mifumo ya kimaumbile na asili.\n\nII. Ukusanyaji wa Takwimu: Kukusanya, kuchambua, na kutafsiri data za kisayansi kutoka kwenye tafiti za shambani na maabara.\n\nIII.  Uandishi wa Ripoti: Kuandaa ripoti za kina kuhusu matokeo ya utafiti na kutoa mapendekezo kwa ajili ya matumizi ya kisayansi na viwanda.',
    '1000.00',
    '2024-12-19 14:26:29'
  ),
  (
    7,
    'Data Analyst',
    102,
    'DataCorp',
    '2024-01-05',
    '2024-01-20',
    'Analyze and interpret data.',
    'BSc in Statistics',
    '4500.00',
    '2024-12-27 21:54:24'
  ),
  (
    8,
    'UI/UX Designer',
    103,
    'DesignHub',
    '2024-01-10',
    '2024-01-25',
    'Design user interfaces.',
    'Diploma in Design',
    '4000.00',
    '2024-12-27 21:54:24'
  ),
  (
    9,
    'testing',
    34,
    'mimi',
    '2024-12-27',
    '2024-12-29',
    '\nI. jjjj',
    '\nI. jjjjhhfhhf',
    '2335.00',
    '2024-12-27 22:47:55'
  ),
  (
    10,
    'environmental health',
    23,
    'muhass',
    '2024-12-28',
    '2025-01-01',
    '\nI. teaching',
    '\nI. doing ',
    '300.00',
    '2024-12-28 20:31:10'
  ),
  (
    11,
    'Software Engineer',
    5,
    'Tech Corp',
    '2024-01-01',
    '2024-02-01',
    'Develop software and collaborate with teams.',
    'BSc in Computer Science and 3 years experience.',
    '5000.00',
    '2024-12-28 21:24:01'
  ),
  (
    12,
    'Data Analyst',
    3,
    'Analytics Ltd.',
    '2024-02-01',
    '2024-03-01',
    'Analyze data and create reports.',
    'BSc in Statistics and 2 years experience.',
    '4000.00',
    '2024-12-28 21:24:01'
  ),
  (
    13,
    'Banking and Finance',
    34,
    'CRDB',
    '2025-01-04',
    '2025-01-11',
    '\nI. Banking\nII. financing\nIII. money management',
    '\nI. degree in banking and finance, account from any known insttution',
    '65.00',
    '2025-01-04 10:11:37'
  ),
  (
    14,
    'health',
    20,
    'mimi',
    '2025-01-06',
    '2025-01-16',
    '\nI. no news\nII. no others',
    '\nI. hey yooh',
    '65.00',
    '2025-01-05 10:27:36'
  ),
  (
    15,
    'try',
    34,
    'tryin',
    '2025-01-10',
    '2025-01-11',
    '\nI. kejje',
    '\nI. ieiie',
    '30.00',
    '2025-01-05 10:38:06'
  );

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_picture` varchar(255) NOT NULL,
  `reset_otp` varchar(6) DEFAULT NULL,
  `otp_expiration` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `users`
--
INSERT INTO
  `users` (
    `id`,
    `name`,
    `email`,
    `password`,
    `created_at`,
    `profile_picture`,
    `reset_otp`,
    `otp_expiration`
  )
VALUES
  (
    1,
    'PROSPER MWASILE',
    'popermwasile173@gmail.com',
    'Hunter2020',
    '2024-12-05 07:51:58',
    '',
    '949431',
    '2025-01-05 18:39:34'
  ),
  (
    2,
    'madam Gee',
    'gee123@gmail.com',
    '8989898',
    '2024-12-05 08:35:02',
    '',
    NULL,
    NULL
  ),
  (
    3,
    'hosea mwammountain',
    'hosea@gmail.com',
    '12345678',
    '2024-12-05 11:35:22',
    '',
    NULL,
    NULL
  ),
  (
    5,
    'yanga',
    'kufungwa@gmail.com',
    '1234567',
    '2024-12-07 21:17:20',
    '',
    NULL,
    NULL
  ),
  (
    9,
    'david',
    'mwampisa@gmail.com',
    'homemade',
    '2024-12-07 22:00:01',
    '',
    NULL,
    NULL
  ),
  (
    10,
    'ADMIN',
    'admin173@gmail.com',
    'Hunter@2024',
    '2024-12-07 22:59:59',
    '',
    NULL,
    NULL
  ),
  (
    12,
    'poper',
    'hales@gmail.com',
    'ggggggggg',
    '2024-12-07 23:25:03',
    '',
    NULL,
    NULL
  ),
  (
    21,
    'PROSPER MWASILE',
    'baraka@gmail.com',
    '12345',
    '2024-12-14 19:12:04',
    '',
    NULL,
    NULL
  ),
  (
    22,
    'roma',
    'mkatoliki@gmail.com',
    'Warioba',
    '2024-12-16 08:40:41',
    '',
    NULL,
    NULL
  ),
  (
    23,
    'me',
    'me@gmail.com',
    'makosa',
    '2024-12-16 08:50:03',
    '',
    NULL,
    NULL
  ),
  (
    24,
    'dickson madenge',
    'tuma@gmail.com',
    'maderfacker',
    '2024-12-16 09:16:28',
    '',
    NULL,
    NULL
  ),
  (
    25,
    'Tembeko',
    'Tembeko@gmail.com',
    '12345',
    '2024-12-17 06:48:18',
    '',
    NULL,
    NULL
  ),
  (
    26,
    'john mwamliima',
    'johnneo@gmail.com',
    '2024',
    '2024-12-17 13:17:38',
    '',
    NULL,
    NULL
  ),
  (
    27,
    'Naah',
    'Mpenzi@gmail.com',
    '1234567',
    '2024-12-18 08:31:31',
    '',
    NULL,
    NULL
  ),
  (
    28,
    'tinnah',
    'tinnah@gmail.com',
    '1234567',
    '2024-12-18 09:39:02',
    '',
    NULL,
    NULL
  ),
  (
    29,
    'praygod kivuyo',
    'praygod@gmail.com',
    'P12345',
    '2024-12-29 20:37:58',
    '',
    NULL,
    NULL
  ),
  (
    30,
    'kukom',
    'kukom@gmail.com',
    'strong',
    '2024-12-30 22:54:36',
    '',
    NULL,
    NULL
  ),
  (
    31,
    'IDDI ALLY',
    'pray@gmail.com',
    'kinondoni',
    '2024-12-30 23:18:30',
    '',
    NULL,
    NULL
  ),
  (
    32,
    'new user',
    'newuser@gmail.com',
    '4567890',
    '2024-12-30 23:58:43',
    '',
    NULL,
    NULL
  ),
  (
    33,
    'mpyaaa',
    'apewe@gmail.com',
    'uwiii345',
    '2025-01-03 16:05:21',
    '',
    NULL,
    NULL
  ),
  (
    34,
    'masai',
    'Mollels772@gmail.com',
    '1234567890',
    '2025-01-05 14:35:14',
    '',
    '889371',
    '2025-01-05 18:22:15'
  ),
  (
    35,
    'naah',
    'naah@gmail.com',
    '7890765',
    '2025-01-08 11:53:04',
    '',
    NULL,
    NULL
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `applications`
--
ALTER TABLE
  `applications`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE
  `job_postings`
ADD
  PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE
  `applications`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 8;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE
  `job_postings`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 70;

--
-- Database: `zelast_one`
--
CREATE DATABASE IF NOT EXISTS `zelast_one` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `zelast_one`;

-- --------------------------------------------------------
--
-- Table structure for table `companies`
--
CREATE TABLE `companies` (
  `company_id` int(11) NOT NULL,
  `company_admin_id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `jobs`
--
CREATE TABLE `jobs` (
  `job_id` int(11) NOT NULL,
  `company_admin_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `job_description` text NOT NULL,
  `job_type` enum('full-time', 'part-time', 'internship', 'contract') NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `salary_range` varchar(50) DEFAULT NULL,
  `application_deadline` date NOT NULL,
  `status` enum('open', 'closed', 'draft') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `job_categories`
--
CREATE TABLE `job_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `password_resets`
--
CREATE TABLE `password_resets` (
  `reset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reset_token` varchar(255) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `payments`
--
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `payment_methods`
--
CREATE TABLE `payment_methods` (
  `method_id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `roles`
--
CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `roles`
--
INSERT INTO
  `roles` (`role_id`, `role_name`)
VALUES
  (1, 'applicant'),
  (2, 'company_admin'),
  (3, 'super_admin');

-- --------------------------------------------------------
--
-- Table structure for table `users`
--
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status` enum('active', 'inactive', 'suspended') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------
--
-- Table structure for table `verifications`
--
CREATE TABLE `verifications` (
  `verification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `form_four_index` varchar(20) DEFAULT NULL,
  `form_six_index` varchar(20) DEFAULT NULL,
  `university_certificate_number` varchar(50) DEFAULT NULL,
  `graduation_year` year(4) DEFAULT NULL,
  `gpa` decimal(3, 2) DEFAULT NULL,
  `division` varchar(10) DEFAULT NULL,
  `verified` enum('pending', 'verified', 'rejected') DEFAULT 'pending'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

--
-- Indexes for dumped tables
--
--
-- Indexes for table `companies`
--
ALTER TABLE
  `companies`
ADD
  PRIMARY KEY (`company_id`),
ADD
  UNIQUE KEY `company_admin_id` (`company_admin_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE
  `jobs`
ADD
  PRIMARY KEY (`job_id`),
ADD
  KEY `company_admin_id` (`company_admin_id`),
ADD
  KEY `category_id` (`category_id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE
  `job_categories`
ADD
  PRIMARY KEY (`category_id`),
ADD
  UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE
  `password_resets`
ADD
  PRIMARY KEY (`reset_id`),
ADD
  KEY `user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE
  `payments`
ADD
  PRIMARY KEY (`payment_id`),
ADD
  KEY `user_id` (`user_id`),
ADD
  KEY `payment_method` (`payment_method`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE
  `payment_methods`
ADD
  PRIMARY KEY (`method_id`),
ADD
  UNIQUE KEY `method_name` (`method_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE
  `roles`
ADD
  PRIMARY KEY (`role_id`),
ADD
  UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `users`
--
ALTER TABLE
  `users`
ADD
  PRIMARY KEY (`user_id`),
ADD
  UNIQUE KEY `username` (`username`),
ADD
  UNIQUE KEY `email` (`email`),
ADD
  KEY `role_id` (`role_id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE
  `verifications`
ADD
  PRIMARY KEY (`verification_id`),
ADD
  KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--
--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE
  `companies`
MODIFY
  `company_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE
  `jobs`
MODIFY
  `job_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE
  `job_categories`
MODIFY
  `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE
  `password_resets`
MODIFY
  `reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE
  `payments`
MODIFY
  `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE
  `payment_methods`
MODIFY
  `method_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE
  `roles`
MODIFY
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE
  `users`
MODIFY
  `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE
  `verifications`
MODIFY
  `verification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
--
-- Constraints for table `companies`
--
ALTER TABLE
  `companies`
ADD
  CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`company_admin_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE
  `jobs`
ADD
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`company_admin_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE
  `password_resets`
ADD
  CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE
  `payments`
ADD
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
ADD
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`method_id`) ON DELETE
SET
  NULL;

--
-- Constraints for table `users`
--
ALTER TABLE
  `users`
ADD
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE;

--
-- Constraints for table `verifications`
--
ALTER TABLE
  `verifications`
ADD
  CONSTRAINT `verifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;