-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2019 at 10:32 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `authors_fk` int(11) NOT NULL,
  `text` varchar(3000) NOT NULL,
  `date` date NOT NULL,
  `images_fk` int(11) NOT NULL,
  `category_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `title`, `authors_fk`, `text`, `date`, `images_fk`, `category_fk`) VALUES
(2, 'KFC runs out of chicken!', 2, 'No more chicken. UK in serious problems.', '2019-06-10', 2, 7),
(3, 'Campaign costs 2 million', 4, 'The brexit campaign is estimated to now cost more than 2 million pounds so far.', '2019-06-06', 5, 4),
(6, 'Russia invades Denmark', 2, 'After the new Chernobly disaster, the russians have now decided to invade Denmark.', '2019-06-12', 3, 5),
(7, 'Kasper Schmeichel changes club', 2, 'Danish football player has decided to relocate his job and change to a different club. ', '2019-06-06', 1, 1),
(8, 'Brexit: 97 Million!', 4, 'According to the Cabinet Office, £65m had been earmarked for consultancy services between April 2018 and April 2019.', '2019-06-10', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `job/position` varchar(50) NOT NULL,
  `avatar_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `job/position`, `avatar_fk`) VALUES
(1, 'Torben', 'Author', 1),
(2, 'Andre Acimann', 'Journalist', 1),
(3, 'Armie Hammer', 'Journalist', 1),
(4, 'Timothée Chalamet', 'Journalist', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Sport'),
(2, 'Finance'),
(4, 'Politics'),
(5, 'Travel'),
(7, 'Breaking News');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL,
  `text` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `article_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_fk`, `text`, `date`, `article_fk`) VALUES
(2, 1, 'Foook', '2019-06-04', 3),
(5, 1, 'Noooo', '2019-06-10', 2),
(6, 3, 'Wow...', '2019-06-11', 3),
(7, 2, 'CRAZY!', '2019-06-12', 6),
(8, 4, 'Amazing..', '2019-06-14', 7),
(9, 2, 'So much money.', '2019-06-13', 8),
(10, 4, 'All the chicken...', '2019-06-12', 2),
(11, 3, 'Well...', '2019-06-10', 3),
(12, 2, 'RUSSIA!!', '2019-06-12', 6),
(13, 1, 'Cool...', '2019-06-11', 7);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `src` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `src`) VALUES
(1, '1.jpg'),
(2, '32.jpg'),
(3, '30.jpg'),
(4, '31.jpg'),
(5, '29.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar_fk` int(11) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `age`, `email`, `avatar_fk`, `password`) VALUES
(1, 'Anders', 17, 'anders@gmail.com', 1, '123'),
(2, 'Lars', 25, 'lars.larsen@gamil.com', 3, 'dagfcugwefH'),
(3, 'Jonas', 26, 'jojo@gmail.com', 2, 'myfirstcat'),
(4, 'Phoebe', 45, 'learnguitar@gmail.com', 4, 'smellycat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authors_fk` (`authors_fk`),
  ADD KEY `images_fk` (`images_fk`),
  ADD KEY `category_fk` (`category_fk`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `avatar_fk` (`avatar_fk`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_fk`),
  ADD KEY `article_fk` (`article_fk`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `avatar_fk` (`avatar_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category_fk`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`authors_fk`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `articles_ibfk_3` FOREIGN KEY (`images_fk`) REFERENCES `images` (`id`);

--
-- Constraints for table `authors`
--
ALTER TABLE `authors`
  ADD CONSTRAINT `authors_ibfk_1` FOREIGN KEY (`avatar_fk`) REFERENCES `images` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_fk`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`article_fk`) REFERENCES `articles` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`avatar_fk`) REFERENCES `images` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
