-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 11, 2021 at 02:52 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='Menu for sites';

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `type`, `parent_id`, `order_number`, `status`) VALUES
(46, '', 0, 1, 1),
(47, 'post', 0, 2, 1),
(48, '', 47, 1, 1),
(49, '', 47, 2, 1),
(50, '', 47, 3, 1),
(51, '', 47, 4, 1),
(52, '', 47, 5, 1),
(53, 'post', 47, 6, 1),
(54, 'painter', 0, 3, 1),
(55, 'painter', 54, 1, 1),
(56, 'painter', 54, 2, 1),
(57, 'painter', 54, 3, 1),
(58, 'painter', 54, 4, 1),
(59, 'painter', 54, 5, 1),
(60, 'painter', 54, 6, 1),
(61, 'painter', 54, 7, 1),
(62, 'post', 0, 4, 1),
(63, 'post', 62, 1, 1),
(64, 'post', 62, 2, 1),
(65, '', 0, 5, 1),
(66, 'post', 0, 6, 1),
(67, 'post', 66, 1, 1),
(68, 'post', 66, 2, 1),
(69, 'post', 66, 3, 1),
(70, '', 0, 7, 1),
(71, 'post', 66, 4, 0);

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
(46, 1, 'Æsas sÉ™hifÉ™', 'esas-sehife'),
(46, 2, 'Home page', 'home-page'),
(47, 1, 'BÃ¶lmÉ™lÉ™r', 'bolmeler'),
(47, 2, 'Sections', 'sections'),
(48, 1, 'Struktur', 'struktur'),
(48, 2, 'Structure', 'structure'),
(49, 1, 'SÉ™rÉ™ncamlar', 'serencamlar'),
(49, 2, 'Disposal', 'disposal'),
(50, 1, 'ÃœzvlÉ™r', 'uzvler'),
(50, 2, 'Members', 'members'),
(51, 1, 'GÉ™nclÉ™r bÃ¶lmÉ™si', 'gencler-bolmesi'),
(51, 2, 'Youth department', 'youth-department'),
(52, 1, 'FÉ™xri Ã¼zvlÉ™r', 'fexri-uzvler'),
(52, 2, 'Honorary members', 'honorary-members'),
(53, 1, 'Festival', 'festival'),
(53, 2, 'Festival', 'festival'),
(54, 1, 'NRB kataloq', 'nrb-kataloq'),
(54, 2, 'NRB catalog', 'nrb-catalog'),
(55, 1, 'RÉ™ngkarlÄ±q', 'rengkarliq'),
(55, 2, 'Painting', 'painting'),
(56, 1, 'HeykÉ™ltÉ™raÅŸlÄ±q', 'heykelterasliq'),
(56, 2, 'Sculpture', 'sculpture'),
(57, 1, 'Dekorativ tÉ™tbiqi sÉ™nÉ™t', 'dekorativ-tetbiqi-senet'),
(57, 2, 'Decorative applied art', 'decorative-applied-art'),
(58, 1, 'Teatr kino vÉ™ TV', 'teatr-kino-ve-tv'),
(58, 2, 'Theater cinema and tv', 'theater cinema and tv'),
(59, 1, 'SÉ™nÉ™tÅŸÃ¼naslÄ±q', 'senetsunasliq'),
(59, 2, 'Study of art', 'study-of-art'),
(60, 1, 'KÃ¶hnÉ™ ustadlar', 'kohne-ustadlar'),
(60, 2, 'Old masters', 'old-masters'),
(61, 1, 'Qrafika', 'qrafika'),
(61, 2, 'Graphics', 'graphics'),
(62, 1, 'Arxiv', 'arxiv'),
(62, 2, 'Archive', 'archive'),
(63, 1, 'Tarixi fotolar', 'tarixi-fotolar'),
(63, 2, 'Historical photos', 'historical-photos'),
(65, 1, 'ÆlaqÉ™', 'elaqe'),
(65, 2, 'Contact', 'contact'),
(66, 1, 'FÉ™aliyyÉ™t', 'fealiyyet'),
(66, 2, 'Activities', 'activities'),
(67, 1, 'SÉ™rgilÉ™r', 'sergiler'),
(67, 2, 'Exhibitions', 'exhibitions'),
(68, 1, 'TÉ™dbirlÉ™r', 'tedbirler'),
(68, 2, 'Events', 'events'),
(69, 1, 'Elanlar', 'elanlar'),
(69, 2, 'Announcements', 'announcements'),
(71, 1, 'XÉ™bÉ™rlÉ™r', 'xeberler'),
(71, 2, 'News', 'news'),
(70, 1, 'SatÄ±ÅŸ', 'satis'),
(70, 2, 'Sale', 'sale'),
(64, 1, 'KÃ¶hnÉ™ afiÅŸalar', 'kohne-afisalar'),
(64, 2, 'Old posters', 'old-posters');

-- --------------------------------------------------------

--
-- Table structure for table `painters`
--

DROP TABLE IF EXISTS `painters`;
CREATE TABLE IF NOT EXISTS `painters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `painter_name` varchar(45) DEFAULT NULL,
  `painter_surname` varchar(45) DEFAULT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `painter_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `painters`
--

INSERT INTO `painters` (`id`, `painter_name`, `painter_surname`, `categories`, `painter_image`, `status`) VALUES
(11, 'Metin', 'Quliyev', '55,56', '95+-Funky-Computer-4K-Wallpapers-WallpaperYou.jpg', 1),
(22, 'Kateqoriya ucun', 'soyad', '57,58', '235506.jpg', 1),
(25, 'Puste1', 'Aghayeva1', '57,58', 'noPhoto.png', 1),
(26, 'Ayten', 'Seyidova', '59,60', '268e0b01144607b38cec0309896893c7.png', 1),
(27, 'ad', 'Aghayeva', '58,60', '', 1),
(28, 'Kateqoriyali', 'Kateqoriyayev', '55,61', 'bPxRtJf.jpg', 1),
(29, 'test', 'test', '59,60', '6aa71bd6f3444a9df44593129cce1fba.jpg', 1),
(30, 'iujh', 'hukhu', '58,57', '6aa71bd6f3444a9df44593129cce1fba.jpg', 1),
(31, 'ytutyity', 'tyityityiy', '56,58,61', '', 1),
(32, '8uyou8', 'uioiuo', '58,61', '95+-Funky-Computer-4K-Wallpapers-WallpaperYou.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `painters_to_category`
--

DROP TABLE IF EXISTS `painters_to_category`;
CREATE TABLE IF NOT EXISTS `painters_to_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `painter_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `painters_to_category`
--

INSERT INTO `painters_to_category` (`id`, `painter_id`, `category_id`) VALUES
(40, 11, 59),
(69, 22, 56),
(70, 25, 57),
(72, 26, 58);

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
(25, 1, 'metn metn metng'),
(25, 2, 'text text textg'),
(26, 1, '<p><s><em>Ressam ressam ressam</em></s></p>\r\n'),
(26, 2, '<p><strong>Painter artist</strong></p>\r\n'),
(27, 1, '<p>sss</p>\r\n'),
(27, 2, '<p>fdgdg</p>\r\n'),
(28, 1, '<p>kateqoriya cox ola biler</p>\r\n'),
(28, 2, '<p>it is possible</p>\r\n'),
(29, 1, '<p>yutyu</p>\r\n'),
(29, 2, '<p>tutyut</p>\r\n'),
(31, 1, '<p>ftuyu</p>\r\n'),
(31, 2, '<p>tyutyiuty</p>\r\n'),
(30, 1, '<p>huiyui</p>\r\n'),
(30, 2, '<p>uyiyi</p>\r\n'),
(22, 1, '<p>melumat</p>\r\n'),
(22, 2, '<p>information</p>\r\n'),
(11, 1, '<p>Bu ressam haqqinda melumatdir</p>\r\n'),
(11, 2, '<p>This is information about painter</p>\r\n'),
(32, 1, '<p>uiu</p>\r\n'),
(32, 2, '<p>olsun</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) DEFAULT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `image`, `created_date`, `category_id`, `hits`, `status`) VALUES
(5, '4WUfMQ.jpg', '2021-06-02 10:56:11', 1, 0, 1),
(8, '', '2021-06-11 16:22:27', 0, 0, 1),
(13, '0-2505_galaxy-wallpaper-22-galaxie-fond-d-cran.jpg', '2021-06-11 17:49:29', 53, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts_gallery`
--

DROP TABLE IF EXISTS `posts_gallery`;
CREATE TABLE IF NOT EXISTS `posts_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `gallery_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_gallery`
--

INSERT INTO `posts_gallery` (`id`, `post_id`, `gallery_image`) VALUES
(66, 13, '../uploads/4WUfMQ.jpg'),
(67, 13, '../uploads/6.jpg'),
(68, 13, '../uploads/5.jpg'),
(69, 13, '../uploads/7wcFi9.jpg'),
(70, 13, '../uploads/8.jpg'),
(71, 13, '../uploads/95+-Funky-Computer-4K-Wallpapers-WallpaperYou.jpg'),
(72, 13, '../uploads/268e0b01144607b38cec0309896893c7.png');

-- --------------------------------------------------------

--
-- Table structure for table `posts_translation`
--

DROP TABLE IF EXISTS `posts_translation`;
CREATE TABLE IF NOT EXISTS `posts_translation` (
  `post_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_translation`
--

INSERT INTO `posts_translation` (`post_id`, `lang_id`, `title`, `content`) VALUES
(5, 1, 'bu bir basliqdir11', 'mezmun haqqinda'),
(5, 2, 'this is a title11', 'content '),
(8, 1, 'ghjgj', '<p>ghjgh</p>\r\n'),
(8, 2, 'ghjgjg', '<p>ghjhgjg</p>\r\n'),
(13, 1, 'sdfsdsdf', '<p>sdfdsf</p>\r\n'),
(13, 2, 'sdfsdf', '<p>sdfsdfs</p>\r\n');

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
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  `instagram` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  `youtube` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  `gmail` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `facebook`, `instagram`, `youtube`, `gmail`, `phone`) VALUES
(1, 'facebook?links edit', 'instagram?link', 'youtube?link', 'gmail?link', '555235442');

-- --------------------------------------------------------

--
-- Table structure for table `settings_translation`
--

DROP TABLE IF EXISTS `settings_translation`;
CREATE TABLE IF NOT EXISTS `settings_translation` (
  `settings_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings_translation`
--

INSERT INTO `settings_translation` (`settings_id`, `lang_id`, `title`, `description`, `keywords`, `address`) VALUES
(1, 1, 'az titleyuiyiyui', 'az description', 'az keywords', 'az adres'),
(1, 2, 'en title', 'en description', 'en keywords', 'en address');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `image`, `painter_name`, `painter_surname`, `status`) VALUES
(41, '47878.jpg', 'Puste', 'Aghayeva', 1),
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
(43, 1, 'Basliq elave etmek'),
(43, 2, 'Add title');

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
CREATE TABLE IF NOT EXISTS `works` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `painter_id` int(11) DEFAULT NULL,
  `work_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `painter_id`, `work_image`, `status`) VALUES
(10, 20, 'banner2.jpg', 1),
(22, 22, '4WUfMQ.jpg', 1);

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

--
-- Dumping data for table `works_translation`
--

INSERT INTO `works_translation` (`work_id`, `lang_id`, `work_name`) VALUES
(10, 1, 'eserin adi eserin adi'),
(10, 2, 'work name work name'),
(22, 1, 'ad ad ad1'),
(22, 2, 'name name name1');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
