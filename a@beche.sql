-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2025 at 08:44 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `a@beche`
--

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

CREATE TABLE `applications` (
  `application_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position` varchar(100) NOT NULL,
  `education` text NOT NULL,
  `experience` text NOT NULL,
  `skills` text NOT NULL,
  `job_posting_id` int(11) NOT NULL,
  `resume` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applications`
--

INSERT INTO `applications` (`application_id`, `email`, `fullName`, `phone`, `position`, `education`, `experience`, `skills`, `job_posting_id`, `resume`) VALUES
(7, 'jaydanjohn79@gmail.com', 'john temu', '0757303007', 'account and auditing', 'hhHh', 'AAGAGGA', 'AAGAG', 0, 'uploads\\6cc1bcfe591bb5bbe5acdcac9fa089ac'),
(10, 'madenge@gmail.com', 'akeela', '0616966911', 'ceo', 'hshshs', 'shhshs', 'sgsgsggs', 0, 'uploads\\d9c3f3c1fe473f801e0884f5991f7013'),
(12, 'praygod@gmail.com', 'praygod kivuyo', '0757303007', 'hzhzhhzh', 'bhhshsh', 'sgsggsg', 'sggsggs', 0, 'uploads\\06e2efae228cd38ae04ab5ac055d1d9a'),
(20, 'mdudu@gmail.com', 'mdudu', '0929292992', 'account and auditing', 'vgvvvv', 'dddddd', 'dddddd', 0, 'uploads\\1ce48805090dcc922c228ab297b5bfff'),
(23, 'hassan@gmail.com', 'mdudu', '0929292992', 'account and auditing', 'aahahaha', 'shsshshhs', 'sgsggsgs', 0, 'uploads\\46850258c3e4492cae871bd770914305'),
(32, 'pra@gmail.com', 'praygod kivuyo', '0757303007', 'biomedical engineering', 'bgggg', 'vgggg', 'ghhhh', 0, 'uploads\\c69e5583d30c4c7d37f91554e532c8f7'),
(35, 'praygodkivuyo@gmail.com', 'praygod kivuyo', '0757303007', 'ggggg', 'ccccc', 'ccccc', 'ccccc', 0, 'uploads\\f4aa19671c9e282855fd3eec0f5068b3'),
(37, 'popermwasile173@gmail.com', 'PROSPER MWASILE', '071890399', 'IT', 'shshsh', 'svvsgsgg', 'vsgsggsg', 0, 'uploads\\91e2d1f12cd7771565c8efe2f60165cd');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `email` int(11) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `salary_range` decimal(10,2) NOT NULL,
  `Location` varchar(1000) NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_postings`
--

INSERT INTO `job_postings` (`id`, `post_name`, `post_number`, `employer`, `application_start`, `application_end`, `duties`, `qualifications`, `salary_range`, `Location`, `application_id`, `created_at`) VALUES
(6, 'ACCOUNTANCY', 2, 'DAM MICROFINANCE', '2025-01-18', '2025-02-09', '\nI. LOI\nII. LUI', '\nI. POI\nII. LOP', '230000.00', 'DASM', 2147483647, '2025-01-16 10:41:08');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `search_logs`
--

CREATE TABLE `search_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `query` text NOT NULL,
  `searched_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('job_seeker','employer','admin') DEFAULT 'job_seeker',
  `profile_picture` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `role`, `profile_picture`, `bio`, `created_at`) VALUES
(2, 'popermwasile173@gmail.com', 'admin', 'password', 'employer', NULL, NULL, '2025-01-15 18:26:31'),
(4, 'poper173@gmail.com', 'PROSPER', 'password', 'admin', NULL, NULL, '2025-01-15 18:30:24'),
(6, 'mwasile173@gmail.com', 'ubaya ubwela', '', 'job_seeker', NULL, NULL, '2025-01-15 18:32:44'),
(7, 'naah@gmail.com', 'nasra juma', '123456', 'job_seeker', NULL, NULL, '2025-01-15 18:59:46'),
(8, 'iddyone173@gmail.com', 'IDDI ALLY', 'newuser@1234', 'job_seeker', NULL, NULL, '2025-01-15 19:02:09'),
(9, 'mlima173@gmail.com', 'mwamlima poper', '1234567', 'job_seeker', NULL, NULL, '2025-01-15 19:09:04'),
(10, 'mwamposa173@gmail.com', 'mwamposa', '123456', 'job_seeker', NULL, NULL, '2025-01-16 05:05:54'),
(15, 'doreen123@gmail.com', 'doreen', 'dodo', 'job_seeker', NULL, NULL, '2025-01-16 11:41:06'),
(19, 'muu173@gmail.com', 'muu', '45678', 'job_seeker', NULL, NULL, '2025-01-16 11:42:33'),
(20, 'mwarabu173@gmail.com', 'mwarabu', '45678', 'job_seeker', NULL, NULL, '2025-01-16 11:44:15'),
(21, 'inniester@gmail.com', 'new  user ', '12345', 'job_seeker', NULL, NULL, '2025-01-16 17:18:35'),
(29, 'madenge@gmail.com', 'madenge mbaya', 'mshenzi', 'job_seeker', NULL, NULL, '2025-01-20 18:31:54'),
(31, 'praygodkivuyo@gmail.com', 'praygod kivuyo', '12345', 'job_seeker', NULL, NULL, '2025-01-20 18:40:52'),
(32, 'mdudu@gmail.com', 'john temu', '12345', 'job_seeker', NULL, NULL, '2025-01-20 18:57:01'),
(33, 'hassan@gmail.com', 'hassan mdumange', '12345', 'job_seeker', NULL, NULL, '2025-01-20 19:04:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`application_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `application_id` (`application_id`),
  ADD KEY `job_postings` (`job_posting_id`),
  ADD KEY `email_2` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_id` (`email`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_posting_id` (`application_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_logs`
--
ALTER TABLE `search_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
  MODIFY `application_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_postings`
--
ALTER TABLE `job_postings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_logs`
--
ALTER TABLE `search_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `search_logs`
--
ALTER TABLE `search_logs`
  ADD CONSTRAINT `search_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
