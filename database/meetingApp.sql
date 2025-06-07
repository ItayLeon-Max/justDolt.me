-- my server database

-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Mar 24, 2025 at 07:42 PM
-- Server version: 9.2.0
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `meetingApp`
--
CREATE DATABASE IF NOT EXISTS `meetingApp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `meetingApp`;

-- --------------------------------------------------------

--
-- Table structure for table `development_groups`
--

CREATE TABLE `development_groups` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `development_groups`
--

INSERT INTO `development_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
('23d465d4-42c3-45de-bb7c-16df59496447', 'DevOps Team Delta-2', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('39df32c8-4eb2-4c02-bc80-535bb33c44f6', 'Mobile Team Sigma', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('5620a114-d4a1-47e4-abb6-21e42f15664c', 'QA Team Gamma', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('7856aae5-4061-4d59-ba01-171ba7ef61b3', 'Backend Team Beta', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('9515492d-d286-4843-b20e-9bad78225db6', 'Frontend Team Alpha', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('a030ef9e-9f6f-443d-97a6-6f0bc395a75d', 'UX/UI Team Omega', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('caaaebaa-2ba2-4026-aae5-933e5be026e6', 'metrix development', '2025-03-14 22:28:20', '2025-03-14 22:28:20'),
('e7bf34a8-77fc-4c54-9129-6ce33d6d2957', 'QA Team Gamma', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('f37c60bf-3367-4bdf-bae9-33e1bf52876b', 'Frontend Team Alpha-2', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('fb00850f-3a08-47c3-94db-1c3f66f3f796', 'Analytics Team Theta', '2025-03-13 19:09:28', '2025-03-13 19:09:28'),
('ffb774de-b79b-4f66-bfcc-79e7b27a8c6f', 'DevOps Team Delta', '2025-03-13 19:09:28', '2025-03-13 19:09:28');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE `meetings` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `development_group_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `meeting_room` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `development_group_id`, `start_time`, `end_time`, `description`, `meeting_room`, `created_at`, `updated_at`) VALUES
('33ee0aa6-b493-4619-8982-6389a6f3c974', '5620a114-d4a1-47e4-abb6-21e42f15664c', '2025-05-03 10:00:00', '2025-05-03 12:00:00', 'Design Discussion', 'Room C', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('3dd9b9a8-7f07-4cf9-b1b2-6d9db9e74891', '9515492d-d286-4843-b20e-9bad78225db6', '2025-05-01 10:00:00', '2025-05-01 12:00:00', 'Sprint Planning', 'Room A', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('5f9b8c2d-21a9-4984-80f5-3957b9cde34e', 'a030ef9e-9f6f-443d-97a6-6f0bc395a75d', '2025-05-05 10:00:00', '2025-05-05 12:00:00', 'UX Workshop', 'Room E', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('852d08f5-2d6f-4d8a-b1e2-c66f746fda48', '7856aae5-4061-4d59-ba01-171ba7ef61b3', '2025-05-02 10:00:00', '2025-05-02 12:00:00', 'Code Review', 'Room B', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('8a16b66b-1e59-4e7a-8516-8b7b1238c61a', 'f37c60bf-3367-4bdf-bae9-33e1bf52876b', '2025-05-09 10:00:00', '2025-05-09 12:00:00', 'AI Model Review', 'Room I', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('9b8471df-04a2-4d6d-8c42-3b7a9b2c4e8d', 'fb00850f-3a08-47c3-94db-1c3f66f3f796', '2025-05-10 10:00:00', '2025-05-10 12:00:00', 'Roadmap Meeting', 'Room J', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('a1c3f238-c7a4-4ef9-b3e8-2e07d332e9c8', 'ffb774de-b79b-4f66-bfcc-79e7b27a8c6f', '2025-05-04 10:00:00', '2025-05-04 12:00:00', 'Retrospective', 'Room D', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('b6c8f1a0-cb7e-41d2-ae33-0c9461c891a7', '39df32c8-4eb2-4c02-bc80-535bb33c44f6', '2025-05-06 10:00:00', '2025-05-06 12:00:00', 'Bug Bash', 'Room F', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('d1778804-c2ab-491b-83e1-18049329e687', 'e7bf34a8-77fc-4c54-9129-6ce33d6d2957', '2025-05-07 10:00:00', '2025-05-07 12:00:00', 'Security Audit', 'Room G', '2025-03-13 19:09:45', '2025-03-13 19:09:45'),
('ef48232b-3a9f-47a6-90a4-78b38c5ff5a2', '23d465d4-42c3-45de-bb7c-16df59496447', '2025-05-08 10:00:00', '2025-05-08 12:00:00', 'Data Analysis', 'Room H', '2025-03-13 19:09:45', '2025-03-13 19:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `reminders`
--

CREATE TABLE `reminders` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `meeting_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `reminder_to` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reminders`
--

INSERT INTO `reminders` (`id`, `meeting_id`, `reminder_to`, `created_at`, `updated_at`) VALUES
('1c6ebe63-0767-43b2-a50a-21749cd8af68', '8a16b66b-1e59-4e7a-8516-8b7b1238c61a', 'yosico190@gmail.com', '2025-03-14 19:18:33', '2025-03-14 19:18:33'),
('7ff296e8-1f28-42cc-a391-8b2114f440b3', '33ee0aa6-b493-4619-8982-6389a6f3c974', 'chenSha1@gmail.com', '2025-03-16 11:00:30', '2025-03-16 11:00:30'),
('8503b88f-83ae-46a0-9157-fa7dcda81dbd', '3dd9b9a8-7f07-4cf9-b1b2-6d9db9e74891', 'yosico190@gmail.com', '2025-03-15 10:31:45', '2025-03-15 10:31:45'),
('abb5bf6c-fdda-4742-b6f2-50ca1c5f1cf4', '33ee0aa6-b493-4619-8982-6389a6f3c974', 'yosico190@gmail.com', '2025-03-16 10:07:19', '2025-03-16 10:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `meeting_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sent_from` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(255) NOT NULL,
  `assigned_to` varchar(255) NOT NULL,
  `status` enum('open','in-progress','done') NOT NULL DEFAULT 'open',
  `deadline` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `meeting_id`, `sent_from`, `description`, `assigned_to`, `status`, `deadline`, `created_at`, `updated_at`) VALUES
('03bf1590-68c7-4048-bf53-43256020d2e7', '8a16b66b-1e59-4e7a-8516-8b7b1238c61a', '8f9690c8-a23b-4b7c-a7c2-2291cffccd65', 'Finish project documentation', 'fc9d97af-531c-4e0d-8767-970dc4b17ad1', 'open', '2025-03-25 18:00:00', '2025-03-16 11:31:02', '2025-03-16 11:31:02'),
('e2dde346-0209-45ac-ac3a-cb08e9dbd1b7', '8a16b66b-1e59-4e7a-8516-8b7b1238c61a', '8f9690c8-a23b-4b7c-a7c2-2291cffccd65', 'Finish project documentation', 'fc9d97af-531c-4e0d-8767-970dc4b17ad1', 'open', '2025-03-25 18:00:00', '2025-03-16 17:56:13', '2025-03-16 17:56:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `password`, `email`, `role`, `created_at`, `updated_at`) VALUES
('8f9690c8-a23b-4b7c-a7c2-2291cffccd65', 'itay leon', 'itayleon81', 'd0e1acaa52e70b836c3ace5a3c23a3dd79e24a0e471a30ac41ae9e49bc794594', 'itayleonconceot14@gmail.com', 'Admin', '2025-03-14 16:37:49', '2025-03-14 16:37:49'),
('bd043d32-92d7-4421-b276-cf8e300a2dd3', 'Chen Shalev', 'chenSh123', '1a7cbbf5b8ef4ff1c4ba35f75d5291bdf6fc5d240a1b834bc87ee002d6d3031b', 'chenSha1@gmail.com', 'User', '2025-03-15 11:19:33', '2025-03-15 11:19:33'),
('fc9d97af-531c-4e0d-8767-970dc4b17ad1', 'yosi cohen', 'yosico190', '189a55fc35d53aa51cb191b2721a997a50757dd4ff02b8be537ea0ab35bde56f', 'yosico190@gmail.com', 'User', '2025-03-14 18:54:46', '2025-03-14 18:54:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `development_groups`
--
ALTER TABLE `development_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `development_group_id` (`development_group_id`);

--
-- Indexes for table `reminders`
--
ALTER TABLE `reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_id` (`meeting_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meeting_id` (`meeting_id`),
  ADD KEY `sent_from` (`sent_from`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `meetings`
--
ALTER TABLE `meetings`
  ADD CONSTRAINT `meetings_ibfk_1` FOREIGN KEY (`development_group_id`) REFERENCES `development_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reminders`
--
ALTER TABLE `reminders`
  ADD CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`sent_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
