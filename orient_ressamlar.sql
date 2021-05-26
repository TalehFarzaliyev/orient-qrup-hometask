-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 26, 2021 at 01:34 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orient_ressamlar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Site Admins';

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `surname`, `username`, `email`, `password`, `status`) VALUES
(1, 'Taleh', 'Farzaliyev', 'tano', 'ftaleh96@gmail.com', 'cf6aa2d1f513eb224c5878bd986a093e', NULL),
(2, 'Aytən', 'Seyidova', 'Ayten', 'seyidova.ayten1999@gmail.com', '9679147eea4a0895d6686d16c4796936', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `default` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `flag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Languages Data for Site';

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `default`, `status`, `flag`) VALUES
(1, 'az', 'Azerbaycan dili', 1, 1, 'azerbaijan'),
(2, 'en', 'English', 0, 1, 'united-kingdom');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='All media files';

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `order_number` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='Menu for sites';

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `type`, `parent_id`, `order_number`, `status`) VALUES
(40, NULL, 0, 1, 1),
(41, NULL, 0, 2, 1),
(42, NULL, 41, 1, 1),
(43, NULL, 41, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_translation`
--

DROP TABLE IF EXISTS `menu_translation`;
CREATE TABLE IF NOT EXISTS `menu_translation` (
  `menu_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_translation`
--

INSERT INTO `menu_translation` (`menu_id`, `lang_id`, `name`, `slug`) VALUES
(40, 1, 'Æsas sÉ™hifÉ™', 'esas-sehife'),
(40, 2, 'Home page', 'home-page'),
(41, 1, 'NRB kataloq', ''),
(41, 2, 'NRB catalog', ''),
(42, 1, 'rengkarliq', ''),
(42, 2, 'painting', ''),
(43, 1, 'Heykelterasliq', ''),
(43, 2, 'Sculpture', '');

-- --------------------------------------------------------

--
-- Table structure for table `painters`
--

DROP TABLE IF EXISTS `painters`;
CREATE TABLE IF NOT EXISTS `painters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `painter_name` varchar(45) DEFAULT NULL,
  `painter_surname` varchar(45) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `painters`
--

INSERT INTO `painters` (`id`, `painter_name`, `painter_surname`, `image`, `status`) VALUES
(1, 'Ayten', 'Seyidova', 'banner1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `painters_to_category`
--

DROP TABLE IF EXISTS `painters_to_category`;
CREATE TABLE IF NOT EXISTS `painters_to_category` (
  `painter_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`painter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `painter_translation`
--

DROP TABLE IF EXISTS `painter_translation`;
CREATE TABLE IF NOT EXISTS `painter_translation` (
  `painter_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `about_painter` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `painter_translation`
--

INSERT INTO `painter_translation` (`painter_id`, `lang_id`, `about_painter`) VALUES
(1, 1, 'haqqinda melumat'),
(1, 2, 'information about painter');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ressam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `painter_name` varchar(45) DEFAULT NULL,
  `painter_surname` varchar(45) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `image`, `painter_name`, `painter_surname`, `status`) VALUES
(41, '47878.jpg', 'Puste', 'Aghayeva', 1),
(42, '32833.jpg', 'Metin', 'Quliyev', 1),
(43, 'ebe39def5ad5e741b9bf510c8a96120e.jpg', 'Ayten', 'Seyidova', 1);

-- --------------------------------------------------------

--
-- Table structure for table `slider_translation`
--

DROP TABLE IF EXISTS `slider_translation`;
CREATE TABLE IF NOT EXISTS `slider_translation` (
  `slider_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider_translation`
--

INSERT INTO `slider_translation` (`slider_id`, `lang_id`, `title`) VALUES
(41, 1, 'basliq basliq'),
(41, 2, 'ingilis basliq'),
(42, 1, 'bu bir basliqdir'),
(42, 2, 'this is a title'),
(43, 1, 'Basliq elave etmek'),
(43, 2, 'Add title');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
CREATE TABLE IF NOT EXISTS `works` (
  `id` int(11) DEFAULT NULL,
  `ressam_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `works_translation`
--

DROP TABLE IF EXISTS `works_translation`;
CREATE TABLE IF NOT EXISTS `works_translation` (
  `work_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `work_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
