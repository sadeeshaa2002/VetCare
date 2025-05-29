-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2025 at 01:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adopt me`
--
CREATE DATABASE IF NOT EXISTS `adopt me` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `adopt me`;

-- --------------------------------------------------------

--
-- Table structure for table `pet_chat`
--

CREATE TABLE `pet_chat` (
  `chat_id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `sender_type` enum('vet','adopter') NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pet_chat`
--
ALTER TABLE `pet_chat`
  ADD PRIMARY KEY (`chat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pet_chat`
--
ALTER TABLE `pet_chat`
  MODIFY `chat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `chat`
--
CREATE DATABASE IF NOT EXISTS `chat` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `chat`;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `message_id` int(11) NOT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `sender_type` enum('adopter','owner') NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `pet_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pet_id`, `name`, `type`, `age`, `description`, `image_path`) VALUES
(1, 'Buddy', 'Dog', 2, 'Friendly golden retriever', 'uploads/dog1.jpg'),
(2, 'Mittens', 'Cat', 1, 'Playful kitten', 'uploads/cat1.jpg'),
(3, 'Tweety', 'Bird', 3, 'Yellow canary, loves to sing', 'uploads/bird1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`pet_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`);
--
-- Database: `contact_form`
--
CREATE DATABASE IF NOT EXISTS `contact_form` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `contact_form`;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'sadeesha', 'sadeeshaaa25@gmail.com', 'hey', '2025-03-06 18:20:21'),
(2, 'sadeesha', 'sadeeshaaa25@email.com', 'hi', '2025-03-06 18:20:36'),
(3, 'HPA sadeesha', 'sadeeshaaa25@email.com', 'fffgjjg', '2025-03-10 05:18:09'),
(4, 'Test Name', 'test@example.com', 'This is a test message.', '2025-03-10 05:32:48'),
(5, 'HPA sadeesha', 'sadeeshaaa25@email.com', 'fffgjjg', '2025-03-10 05:33:59'),
(6, 'HPA sadeesha', 'sadeeshaaa25@email.com', '3/10', '2025-03-10 06:10:33'),
(7, 'Ayeshani', 'sadeeshaaa25@email.com', 'qqqq', '2025-03-10 06:12:42'),
(8, 'Ayeshani', 'sadeeshaaa25@email.com', 'qqqq', '2025-03-10 06:16:46'),
(9, 'Ayeshani', 'sadeeshaaa25@email.com', 'qqqq', '2025-03-10 06:16:55'),
(10, 'Ayeshani', 'sadeeshaaa25@email.com', 'qqqq', '2025-03-10 06:16:57'),
(11, 'HPA sadeesha', 'sadeeshaaa25@email.com', '3/10', '2025-03-10 06:19:21'),
(12, 'HPA sadeesha', 'sadeeshaaa25@email.com', '3/10', '2025-03-10 06:24:55'),
(13, 'HPA sadeesha', 'sadeeshaaa25@email.com', '3/10', '2025-03-10 06:24:59'),
(14, 'HPA sadeesha', 'sadeeshaaa25@email.com', '3/10', '2025-03-10 06:25:34'),
(15, 'HPA sadeesha', 'sadeeshaaa25@email.com', '3/10', '2025-03-10 06:25:37'),
(16, 'sadeesha', 'sadeeshaa25@email.com', 'hi', '2025-03-10 06:35:12'),
(17, 'mail', 'sadeeshaa25@email.com', 'fnnjndsj', '2025-03-10 06:50:19'),
(18, 'mail', 'sadeeshaa25@email.com', 'fnnjndsj', '2025-03-10 06:54:07'),
(19, 'sadeesha', 'sadeeshaa25@email.com', 'mmmm', '2025-03-10 07:14:20'),
(20, 'sadeesha', 'sadeeshaaa25@email.com', 'kkkkk', '2025-03-10 07:14:39'),
(21, 'sadeesha', 'sadeeshaaa25@email.com', 'kkkkk', '2025-03-10 08:22:43'),
(22, 'sadeesha', 'sadeeshaa25@email.com', 'dfghj', '2025-03-10 08:28:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Database: `eventmanagement`
--
CREATE DATABASE IF NOT EXISTS `eventmanagement` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eventmanagement`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`) VALUES
(1, 'sadeeshaa25@gmail.com', '$2y$10$E4OjvJesA1i8um7KUZF5VOpJ9xnMzzwj/D9YEeDy9Ptz.qWfPh7SG', '2024-10-22 05:22:22'),
(2, 'angika@gmail.com', '$2y$10$MgKwkl84ULZux.5tqiudeOv9K7dLtunPZ17WfxE4zfjyAMXhen0IG', '2024-10-22 05:27:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `moviedemo`
--
CREATE DATABASE IF NOT EXISTS `moviedemo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `moviedemo`;

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`id`, `name`) VALUES
(1, 'Leonardo DiCaprio'),
(2, 'Joseph Gordon-Levitt'),
(3, 'Christian Bale'),
(4, 'Heath Ledger'),
(5, 'Matthew McConaughey'),
(6, 'Anne Hathaway'),
(7, 'Kate Winslet'),
(8, 'Keanu Reeves'),
(9, 'Carrie-Anne Moss'),
(10, 'Laurence Fishburne'),
(11, 'Robert Downey Jr.'),
(12, 'Chris Evans'),
(13, 'Scarlett Johansson'),
(14, 'Tom Holland'),
(15, 'Chadwick Boseman'),
(16, 'Benedict Cumberbatch'),
(17, 'Chris Hemsworth'),
(18, 'Joaquin Phoenix'),
(19, 'Hugh Jackman'),
(20, 'Brad Pitt'),
(21, 'Morgan Freeman'),
(22, 'Denzel Washington'),
(23, 'Tom Hanks'),
(24, 'Meryl Streep'),
(25, 'Ryan Gosling'),
(26, 'Emma Stone'),
(27, 'Daniel Radcliffe'),
(28, 'Emma Watson'),
(29, 'Johnny Depp'),
(30, 'Al Pacino'),
(31, 'Robert De Niro'),
(32, 'Samuel L. Jackson'),
(33, 'Matt Damon'),
(34, 'Mark Wahlberg'),
(35, 'Will Smith'),
(36, 'Angelina Jolie'),
(37, 'Jennifer Lawrence'),
(38, 'Jake Gyllenhaal'),
(39, 'Chris Pratt'),
(40, 'John Krasinski'),
(41, 'Florence Pugh'),
(42, 'Timothée Chalamet'),
(43, 'Anya Taylor-Joy'),
(44, 'Jordan Peele'),
(45, 'Bill Skarsgård'),
(46, 'Jack Nicholson'),
(47, 'Harrison Ford'),
(48, 'Anthony Hopkins'),
(49, 'Viola Davis'),
(50, 'Rami Malek');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `director` varchar(255) NOT NULL,
  `yearReleased` int(11) NOT NULL,
  `genre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `director`, `yearReleased`, `genre`) VALUES
(1, 'Inception', 'Christopher Nolan', 2010, 'Sci-Fi'),
(2, 'The Dark Knight', 'Christopher Nolan', 2008, 'Action'),
(3, 'Interstellar', 'Christopher Nolan', 2014, 'Sci-Fi'),
(4, 'Titanic', 'James Cameron', 1997, 'Romance'),
(5, 'The Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, 'Sci-Fi'),
(6, 'Avatar', 'James Cameron', 2009, 'Sci-Fi'),
(7, 'The Godfather', 'Francis Ford Coppola', 1972, 'Crime'),
(8, 'The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama'),
(9, 'Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime'),
(10, 'The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 2001, 'Fantasy'),
(11, 'The Lord of the Rings: The Two Towers', 'Peter Jackson', 2002, 'Fantasy'),
(12, 'The Lord of the Rings: The Return of the King', 'Peter Jackson', 2003, 'Fantasy'),
(13, 'Fight Club', 'David Fincher', 1999, 'Drama'),
(14, 'Forrest Gump', 'Robert Zemeckis', 1994, 'Drama'),
(15, 'The Lion King', 'Roger Allers, Rob Minkoff', 1994, 'Animation'),
(16, 'Gladiator', 'Ridley Scott', 2000, 'Action'),
(17, 'Saving Private Ryan', 'Steven Spielberg', 1998, 'War'),
(18, 'The Avengers', 'Joss Whedon', 2012, 'Superhero'),
(19, 'Iron Man', 'Jon Favreau', 2008, 'Superhero'),
(20, 'Spider-Man: No Way Home', 'Jon Watts', 2021, 'Superhero'),
(21, 'Black Panther', 'Ryan Coogler', 2018, 'Superhero'),
(22, 'Doctor Strange', 'Scott Derrickson', 2016, 'Superhero'),
(23, 'Thor: Ragnarok', 'Taika Waititi', 2017, 'Superhero'),
(24, 'The Batman', 'Matt Reeves', 2022, 'Superhero'),
(25, 'Joker', 'Todd Phillips', 2019, 'Thriller'),
(26, 'The Prestige', 'Christopher Nolan', 2006, 'Thriller'),
(27, 'Django Unchained', 'Quentin Tarantino', 2012, 'Western'),
(28, 'Once Upon a Time in Hollywood', 'Quentin Tarantino', 2019, 'Drama'),
(29, 'The Wolf of Wall Street', 'Martin Scorsese', 2013, 'Biography'),
(30, 'Shutter Island', 'Martin Scorsese', 2010, 'Mystery'),
(31, 'Goodfellas', 'Martin Scorsese', 1990, 'Crime'),
(32, 'The Irishman', 'Martin Scorsese', 2019, 'Crime'),
(33, 'Parasite', 'Bong Joon-ho', 2019, 'Thriller'),
(34, 'The Grand Budapest Hotel', 'Wes Anderson', 2014, 'Comedy'),
(35, 'Whiplash', 'Damien Chazelle', 2014, 'Drama'),
(36, 'La La Land', 'Damien Chazelle', 2016, 'Musical'),
(37, 'Mad Max: Fury Road', 'George Miller', 2015, 'Action'),
(38, 'John Wick', 'Chad Stahelski', 2014, 'Action'),
(39, 'Deadpool', 'Tim Miller', 2016, 'Superhero'),
(40, 'The Revenant', 'Alejandro G. Iñárritu', 2015, 'Adventure'),
(41, 'A Quiet Place', 'John Krasinski', 2018, 'Horror'),
(42, 'Get Out', 'Jordan Peele', 2017, 'Horror'),
(43, 'Us', 'Jordan Peele', 2019, 'Horror'),
(44, 'The Conjuring', 'James Wan', 2013, 'Horror'),
(45, 'It', 'Andy Muschietti', 2017, 'Horror'),
(46, 'The Exorcist', 'William Friedkin', 1973, 'Horror'),
(47, 'Schindler’s List', 'Steven Spielberg', 1993, 'Biography'),
(48, 'The Social Network', 'David Fincher', 2010, 'Drama'),
(49, 'The Truman Show', 'Peter Weir', 1998, 'Drama'),
(50, 'American Beauty', 'Sam Mendes', 1999, 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE `movie_cast` (
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_cast`
--

INSERT INTO `movie_cast` (`movie_id`, `actor_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 7),
(5, 8),
(5, 9),
(5, 10),
(6, 8),
(6, 12),
(7, 30),
(7, 31),
(8, 21),
(8, 22),
(9, 31),
(9, 32),
(10, 40),
(10, 41),
(11, 40),
(11, 41),
(12, 40),
(12, 41),
(13, 38),
(13, 39),
(14, 23),
(14, 24),
(15, 25),
(15, 26),
(16, 11),
(16, 13),
(17, 11),
(17, 12),
(17, 13),
(18, 13),
(18, 14),
(19, 15),
(19, 16),
(20, 17),
(20, 18),
(21, 18),
(21, 19),
(22, 27),
(22, 28),
(23, 37),
(23, 38),
(24, 43),
(24, 44),
(25, 46),
(25, 47);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`movie_id`,`actor_id`),
  ADD KEY `actor_id` (`actor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE;
--
-- Database: `mydatabase`
--
CREATE DATABASE IF NOT EXISTS `mydatabase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mydatabase`;
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
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"chat\",\"table\":\"pets\"},{\"db\":\"chat\",\"table\":\"chat_messages\"},{\"db\":\"adopt me\",\"table\":\"pet_chat\"},{\"db\":\"vet_chat_db\",\"table\":\"users\"},{\"db\":\"vet_chat_db\",\"table\":\"chat_messages\"},{\"db\":\"vet_chat_db\",\"table\":\"pets\"},{\"db\":\"vet_app\",\"table\":\"chat_messages\"},{\"db\":\"vet_app\",\"table\":\"pets\"},{\"db\":\"vet_app\",\"table\":\"users\"},{\"db\":\"contact_form\",\"table\":\"contacts\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-05-20 11:21:04', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `vet_chat_db`
--
CREATE DATABASE IF NOT EXISTS `vet_chat_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vet_chat_db`;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `message_id` int(11) NOT NULL,
  `pet_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sender_role` enum('vet','owner') NOT NULL,
  `message` text NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`message_id`, `pet_id`, `sender_id`, `sender_role`, `message`, `file_path`, `timestamp`) VALUES
(1, 1, 1, '', 'hi', NULL, '2025-05-16 07:46:40'),
(2, 1, 1, 'vet', 'hi', NULL, '2025-05-18 05:27:23'),
(3, 1, 1, 'vet', 'hi', NULL, '2025-05-18 05:30:27'),
(4, 1, 1, 'vet', 'hello', NULL, '2025-05-18 05:30:36'),
(5, 1, 1, 'vet', 'hello', NULL, '2025-05-18 05:31:31'),
(6, 1, 1, 'vet', 'hello', NULL, '2025-05-18 05:31:57'),
(7, 1, 1, 'vet', '[File] <a href=\'uploads/1747546656_SpiceTrail Kitchen Delights.png\' target=\'_blank\'>SpiceTrail Kitchen Delights.png</a>', NULL, '2025-05-18 05:37:36'),
(8, 1, 1, 'vet', 'hi', NULL, '2025-05-18 05:37:51'),
(9, 1, 1, 'vet', '[File] <a href=\'uploads/1747546682_KAHNDISM241F-017 _VIRTUSA.pdf\' target=\'_blank\'>KAHNDISM241F-017 _VIRTUSA.pdf</a>', NULL, '2025-05-18 05:38:02'),
(10, 1, 1, 'vet', 'hi', NULL, '2025-05-18 05:38:12');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `pet_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pet_id`, `name`, `owner_id`) VALUES
(1, 'Fluffy', 2),
(22, 'Buddy', NULL),
(23, 'Whiskers', NULL),
(24, 'Tweety', NULL),
(25, 'Bruno', NULL),
(26, 'Fifi', NULL),
(27, 'Lu Lu', NULL),
(28, 'Kojo', NULL),
(29, 'Mikey', NULL),
(30, 'Nola', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('vet','owner','client','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`) VALUES
(1, 'vetuser', '1234', 'vet'),
(2, 'adopter', '1234', 'owner'),
(3, 'client1', 'pass123', ''),
(4, 'client2', 'pass123', ''),
(5, 'client3', 'pass123', ''),
(6, 'client4', 'pass123', ''),
(7, 'client5', 'pass123', ''),
(8, 'client6', 'pass123', ''),
(9, 'client7', 'pass123', ''),
(10, 'client8', 'pass123', ''),
(11, 'client9', 'pass123', ''),
(12, 'client10', 'pass123', ''),
(13, 'vet_amy', '1234', 'vet'),
(14, 'vet_lee', '1234', 'vet'),
(15, 'adopter_mina', '1234', 'owner'),
(16, 'adopter_john', '1234', 'owner'),
(17, 'adopter_sue', '1234', 'owner'),
(18, 'client_max', '1234', ''),
(19, 'client_lisa', '1234', ''),
(20, 'client_nick', '1234', ''),
(21, 'vet_amy', '1234', 'vet'),
(22, 'vet_lee', '1234', 'vet'),
(23, 'adopter_mina', '1234', 'owner'),
(24, 'adopter_john', '1234', 'owner'),
(25, 'adopter_sue', '1234', 'owner'),
(26, 'client_max', '1234', 'client'),
(27, 'client_lisa', '1234', 'client'),
(28, 'client_nick', '1234', 'client'),
(29, 'admin1', 'admin123', 'admin'),
(30, 'admin2', 'admin123', 'admin'),
(31, 'admin3', 'admin123', 'admin'),
(32, 'admin4', 'admin123', 'admin'),
(33, 'admin5', 'admin123', 'admin'),
(34, 'admin6', 'admin123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `pet_id` (`pet_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`pet_id`);

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
