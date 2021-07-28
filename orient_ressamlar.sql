-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 28, 2021 at 01:23 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='Menu for sites';

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `type`, `parent_id`, `order_number`, `status`) VALUES
(46, '', 0, 1, 1),
(47, 'post', 0, 2, 1),
(48, 'post', 47, 1, 1),
(49, 'post', 47, 2, 1),
(50, 'painter', 47, 3, 1),
(51, 'painter', 47, 4, 1),
(52, 'painter', 47, 5, 1),
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
(73, '', 0, 90, 1),
(74, 'post', 66, 5, 0),
(75, 'post', 66, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menu_translation`
--

DROP TABLE IF EXISTS `menu_translation`;
CREATE TABLE IF NOT EXISTS `menu_translation` (
  `menu_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `slug` varchar(250) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_translation`
--

INSERT INTO `menu_translation` (`menu_id`, `lang_id`, `name`, `slug`) VALUES
(54, 1, 'NRB kataloq', 'nrb-kataloq'),
(54, 2, 'NRB catalog', 'nrb-catalog'),
(66, 1, 'FÉ™aliyyÉ™t', 'fealiyyet'),
(66, 2, 'Activities', 'activities'),
(74, 1, 'RÉ™sm texnikalarÄ±', 'rÉ™sm-texnikalari'),
(74, 2, 'Drawing techniques', 'drawing-techniques'),
(75, 1, 'Birliyin profili', 'birliyin-profili'),
(75, 2, 'Association profile', 'association-profile'),
(65, 1, 'ÆlaqÉ™', 'contact.php'),
(65, 2, 'Contact', 'contact.php'),
(70, 2, 'Shop', 'shop.php'),
(70, 1, 'SatÄ±ÅŸ', 'shop.php'),
(46, 1, 'Æsas sÉ™hifÉ™', 'index.php'),
(46, 2, 'Home page', 'index.php'),
(62, 1, 'Arxiv', 'arxiv'),
(62, 2, 'Archive', 'archive'),
(47, 1, 'BÃ¶lmÉ™lÉ™r', 'bolmeler'),
(47, 2, 'Sections', 'sections'),
(67, 1, 'SÉ™rgilÉ™r', 'post-list.php?category=exhibitions'),
(67, 2, 'Exhibitions', 'post-list.php?category=exhibitions'),
(69, 1, 'Elanlar', 'post-list.php?category=announcements'),
(69, 2, 'Announcements', 'post-list.php?category=announcements'),
(68, 1, 'TÉ™dbirlÉ™r', 'post-list.php?category=events'),
(68, 2, 'Events', 'post-list.php?category=events'),
(64, 1, 'KÃ¶hnÉ™ afiÅŸalar', 'post-catalog.php?category=old-posters'),
(64, 2, 'Old posters', 'post-catalog.php?category=old-posters'),
(63, 1, 'Tarixi fotolar', 'post-catalog.php?category=historical-photos'),
(63, 2, 'Historical photos', 'post-catalog.php?category=historical-photos'),
(61, 1, 'Qrafika', 'catalog.php?category=graphics'),
(61, 2, 'Graphics', 'catalog.php?category=graphics'),
(60, 1, 'KÃ¶hnÉ™ ustadlar', 'catalog.php?category=old-masters'),
(60, 2, 'Old masters', 'catalog.php?category=old-masters'),
(59, 1, 'SÉ™nÉ™tÅŸÃ¼naslÄ±q', 'catalog.php?category=study-of-art'),
(59, 2, 'Study of art', 'catalog.php?category=study-of-art'),
(56, 1, 'HeykÉ™ltÉ™raÅŸlÄ±q', 'catalog.php?category=sculpture'),
(56, 2, 'Sculpture', 'catalog.php?category=sculpture'),
(55, 1, 'RÉ™ngkarlÄ±q', 'catalog.php?category=painting'),
(55, 2, 'Painting', 'catalog.php?category=painting'),
(53, 1, 'Festival', 'post-list.php?category=festival'),
(53, 2, 'Festival', 'post-list.php?category=festival'),
(52, 1, 'FÉ™xri Ã¼zvlÉ™r', 'catalog.php?category=honorary-members'),
(52, 2, 'Honorary members', 'catalog.php?category=honorary-members'),
(51, 1, 'GÉ™nclÉ™r bÃ¶lmÉ™si', 'catalog.php?category=youth-department'),
(51, 2, 'Youth department', 'catalog.php?category=youth-department'),
(50, 1, 'ÃœzvlÉ™r', 'catalog.php?category=members'),
(50, 2, 'Members', 'catalog.php?category=members'),
(49, 1, 'SÉ™rÉ™ncamlar', 'post-list.php?category=disposal'),
(49, 2, 'Disposal', 'post-list.php?category=disposal'),
(48, 1, 'Struktur', 'post-list.php?category=structure'),
(48, 2, 'Structure', 'post-list.php?category=structure'),
(57, 1, 'Dekorativ tÉ™tbiqi sÉ™nÉ™t', 'catalog.php?category=decorative-applied-art'),
(57, 2, 'Decorative applied art', 'catalog.php?category=decorative-applied-art'),
(58, 1, 'Teatr kino vÉ™ TV', 'catalog.php?category=theater-cinema-and-tv'),
(58, 2, 'Theater cinema and tv', 'catalog.php?category=theater-cinema-and-tv');

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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `painters`
--

INSERT INTO `painters` (`id`, `painter_name`, `painter_surname`, `categories`, `painter_image`, `status`) VALUES
(37, 'Gunel', 'Mehnetli', '56,60', '4.jpg', 1),
(40, 'RÃ¶ya', 'Abdullayeva', '51', '7deea7f5-b7d6-4559-bb93-4fbe6b3df5ca.jpg', 1),
(41, 'XangÃ¼l', 'Abdullayeva', '51', 'IMG_9006.jpg', 1),
(42, 'Nihad', 'Aslanov', '', 'IMG_1301.jpg', 1),
(43, 'Nihad', 'Aslanov', '51', 'IMG_1301.jpg', 1),
(44, 'Ã–zcan', 'Babayev', '51', '8d9f29d9-254a-4539-b5ee-71ad34c2d752.jpg', 1),
(45, 'TÃ¼rkan', 'ÆsÉ™dova', '51', 'IMG_0998.jpg', 1),
(46, 'ÆzizÉ™', 'HacÄ±yeva', '51', 'IMG-20200130-WA0206.jpg', 1),
(47, 'ÆlÉ™sgÉ™r', 'ÆsgÉ™rli', '57', 'Screenshot 2021-07-22 143617.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `painter_translation`
--

DROP TABLE IF EXISTS `painter_translation`;
CREATE TABLE IF NOT EXISTS `painter_translation` (
  `painter_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `about_painter` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `painter_translation`
--

INSERT INTO `painter_translation` (`painter_id`, `lang_id`, `about_painter`) VALUES
(37, 1, '<p>gnghnjg</p>\r\n'),
(37, 2, '<p>gfhfgnjgn</p>\r\n'),
(41, 1, '<p>18.01.2000-ci ildÉ™ KÉ™ngÉ™rli rayon &Ccedil;alxanqala kÉ™ndindÉ™ anadan olub.&nbsp;<br />\r\n2006-2017-ci illÉ™rdÉ™ &Ccedil;alxanqala kÉ™nd tam orta mÉ™ktÉ™bindÉ™ tÉ™hsil alÄ±b&nbsp;<br />\r\n2017-ci ildÉ™ Naxcivan DovlÉ™t Texniki Kollecinin Elektrik TÉ™chizati SÅ‘bÉ™sinÉ™ daxil olub.<br />\r\nNax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin GÉ™nc RÉ™ssamlar Åž&ouml;bÉ™sinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;Ä±van MR-da ke&ccedil;irilÉ™n bir &ccedil;ox sÉ™rgi vÉ™ m&uuml;sabiqÉ™lÉ™rdÉ™ iÅŸtirak etmiÅŸdir.</p>\r\n'),
(41, 2, '<p>She was born on January 18, 2000 in Chalkhangala village of Kangarli region.<br />\r\nIn 2006-2017 he studied at the Chalkhangala village secondary school<br />\r\nIn 2017, he entered the Power Supply Department of Nakhchivan State Technical College.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(40, 1, '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\">28 iyun 2001-ci ildÉ™ Rusiya FederasiyasÄ±nÄ±n Kostroma ÅŸÉ™hÉ™rindÉ™ anadan olmuÅŸdur.<br />\r\n2007-2018-ci illÉ™r É™rzindÉ™ M.Seyidov adÄ±na 15 n&ouml;mrÉ™li tam orta mÉ™ktÉ™bdÉ™ tÉ™hsil almÄ±ÅŸdÄ±r.<br />\r\n2018-ci ildÉ™ Nax&ccedil;Ä±van D&ouml;vlÉ™t Universitetinin TÉ™biÉ™tÅŸ&uuml;naslÄ±q vÉ™ KÉ™nd TÉ™sÉ™rr&uuml;fatÄ± Fak&uuml;ltÉ™sinin Biologiya ixtisasÄ±na qÉ™bul olmuÅŸ vÉ™ hal-hazÄ±rda hÉ™min ixtisas &uuml;zrÉ™ tÉ™hsil alÄ±r.<br />\r\nNax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin GÉ™nc RÉ™ssamlar Åž&ouml;bÉ™sinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;Ä±van MR-da ke&ccedil;irilÉ™n bir &ccedil;ox sÉ™rgi vÉ™ m&uuml;sabiqÉ™lÉ™rdÉ™ iÅŸtirak etmiÅŸdir.</span></span></span></p>\r\n'),
(40, 2, '<p>She was born on June 28, 2001 in Kostroma, Russian Federation.<br />\r\nFrom 2007 to 2018 he studied at the secondary school No. 15 named after M. Seyidov.<br />\r\nIn 2018, he was admitted to Nakhchivan State University, Faculty of Natural Sciences and Agriculture, majoring in Biology, and is currently studying in that specialty.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(42, 1, '<p>&nbsp;</p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,sans-serif\"><span style=\"font-size:14.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,serif\">26 avqust 1997-ci ildÉ™ Nax&ccedil;Ä±van ÅŸÉ™hÉ™rindÉ™ anadan olmuÅŸdur.<br />\r\n2003-2014-c&uuml; illÉ™r É™rzindÉ™ Nax&ccedil;Ä±van ÅŸÉ™hÉ™r E.Sultanov adÄ±na 7â„–-li tam orta mÉ™ktÉ™bdÉ™ tÉ™hsil almÄ±ÅŸdÄ±r.<br />\r\n2018-ci ildÉ™ Nax&ccedil;Ä±van D&ouml;vlÉ™t Universiteti Ä°ncÉ™sÉ™nÉ™t fakultÉ™sinin TÉ™sviri incÉ™sÉ™nÉ™t m&uuml;É™llimliyi ixtisasÄ±na qÉ™bul olmuÅŸ vÉ™ hal-hazÄ±rda hÉ™min ixtisas &uuml;zrÉ™ tÉ™hsil alÄ±r.<br />\r\nNax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin GÉ™nc RÉ™ssamlar Åž&ouml;bÉ™sinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;Ä±van MR-da ke&ccedil;irilÉ™n bir &ccedil;ox sÉ™rgi vÉ™ m&uuml;sabiqÉ™lÉ™rdÉ™ iÅŸtirak etmiÅŸdir.</span></span></span></span></p>\r\n'),
(42, 2, '<p>He was born on August 26, 1997 in the city of Nakhchivan.<br />\r\nFrom 2003 to 2014 he studied at the secondary school No. 7 named after E.Sultanov in Nakhchivan.<br />\r\nIn 2018, he was admitted to the Faculty of Fine Arts of Nakhchivan State University, majoring in Fine Arts, and is currently studying in that specialty.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(43, 1, '<p>26 avqust 1997-ci ildÉ™ Nax&ccedil;Ä±van ÅŸÉ™hÉ™rindÉ™ anadan olmuÅŸdur.<br />\r\n2003-2014-c&uuml; illÉ™r É™rzindÉ™ Nax&ccedil;Ä±van ÅŸÉ™hÉ™r E.Sultanov adÄ±na 7â„–-li tam orta mÉ™ktÉ™bdÉ™ tÉ™hsil almÄ±ÅŸdÄ±r.<br />\r\n2018-ci ildÉ™ Nax&ccedil;Ä±van D&ouml;vlÉ™t Universiteti Ä°ncÉ™sÉ™nÉ™t fakultÉ™sinin TÉ™sviri incÉ™sÉ™nÉ™t m&uuml;É™llimliyi ixtisasÄ±na qÉ™bul olmuÅŸ vÉ™ hal-hazÄ±rda hÉ™min ixtisas &uuml;zrÉ™ tÉ™hsil alÄ±r.<br />\r\nNax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin GÉ™nc RÉ™ssamlar Åž&ouml;bÉ™sinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;Ä±van MR-da ke&ccedil;irilÉ™n bir &ccedil;ox sÉ™rgi vÉ™ m&uuml;sabiqÉ™lÉ™rdÉ™ iÅŸtirak etmiÅŸdir.</p>\r\n'),
(43, 2, '<p>He was born on August 26, 1997 in the city of Nakhchivan.<br />\r\nFrom 2003 to 2014 he studied at the secondary school No. 7 named after E.Sultanov in Nakhchivan.<br />\r\nIn 2018, he was admitted to the Faculty of Fine Arts of Nakhchivan State University, majoring in Fine Arts, and is currently studying in that specialty.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(44, 1, '<p>14 yanvar 2003-c&uuml; ildÉ™ ÅžÉ™rur rayonu TÉ™nÉ™nÉ™m kÉ™ndindÉ™ anadan olmuÅŸdur.<br />\r\n2009-2020-ci illÉ™r É™rzindÉ™ TÉ™nÉ™nÉ™m kÉ™nd tam orta mÉ™ktÉ™bindÉ™ tÉ™hsil almÄ±ÅŸdÄ±r.<br />\r\n2019-cu ildÉ™ Nax&ccedil;Ä±van D&ouml;vlÉ™t Universitetinin Pedoqoji fakultÉ™sindÉ™ tÉ™hsil alÄ±r.<br />\r\nNax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin GÉ™nc RÉ™ssamlar Åž&ouml;bÉ™sinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;Ä±van MR-da ke&ccedil;irilÉ™n bir &ccedil;ox sÉ™rgi vÉ™ m&uuml;sabiqÉ™lÉ™rdÉ™ iÅŸtirak etmiÅŸdir.</p>\r\n'),
(44, 2, '<p>He was born on January 14, 2003 in Tananam village of Sharur region.<br />\r\nDuring 2009-2020, he studied at the Tananam village secondary school.<br />\r\nIn 2019, he is studying at the Pedagogical Faculty of Nakhchivan State University.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(45, 1, '<p>15 may 2002-ci ildÉ™ Nax&ccedil;Ä±van ÅŸÉ™hÉ™rindÉ™ anadan olmuÅŸdur.<br />\r\n2005-2019-cu illÉ™r É™rzindÉ™ M.T.Sidqi adÄ±na 4 n&ouml;mrÉ™li tam orta mÉ™ktÉ™bdÉ™ tÉ™hsil almÄ±ÅŸdÄ±r.<br />\r\n2019-cu ildÉ™ Nax&ccedil;Ä±van D&ouml;vlÉ™t Universitetinin Ä°ncÉ™sÉ™nÉ™t fakultÉ™sinin TÉ™sviri Ä°ncÉ™sÉ™nÉ™t &nbsp;ixtisasÄ±na qÉ™bul olmuÅŸ vÉ™ hal-hazÄ±rda hÉ™min ixtisas &uuml;zrÉ™ tÉ™hsil alÄ±r.<br />\r\nNax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin GÉ™nc RÉ™ssamlar Åž&ouml;bÉ™sinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;Ä±van MR-da ke&ccedil;irilÉ™n bir &ccedil;ox sÉ™rgi vÉ™ m&uuml;sabiqÉ™lÉ™rdÉ™ iÅŸtirak etmiÅŸdir.</p>\r\n'),
(45, 2, '<p>She was born on May 15, 2002 in the city of Nakhchivan. From 2005 to 2019, he studied at the secondary school No. 4 named after MT Sidgi. In 2019, he was admitted to the Faculty of Fine Arts of Nakhchivan State University, majoring in Fine Arts, and is currently studying in that specialty. He is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR. He participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(46, 1, '<p><span style=\"font-size:12px\">HacÄ±yeva ÆzizÉ™ Telman qÄ±zÄ± 2003-c&uuml; ildÉ™ Nax&ccedil;Ä±van ÅŸÉ™hÉ™rindÉ™ anadan olmuÅŸdur. 2009 &ndash; cu ildÉ™ AfiyÉ™ddin CÉ™lilov adÄ±na 12 saylÄ± tam orta mÉ™ktÉ™bin 1-ci sinifinÉ™ daxil olmuÅŸ. HalhazÄ±rda hÉ™min mÉ™ktÉ™bin 11-ci &nbsp;sinifindÉ™ oxuyur.<br />\r\nÄ°ÅŸtirak etdiyim &nbsp;m&uuml;sabiqÉ™lÉ™r: AzÉ™rbaycan RespublikasÄ± MÉ™dÉ™niyyÉ™t vÉ™ turizm nazirliyi, AzÉ™rbaycan d&ouml;vlÉ™t RÉ™sm QalareysÄ±, XÉ™tai SÉ™nÉ™t MÉ™rkÉ™zi tÉ™rÉ™findÉ™n ke&ccedil;irilÉ™n &nbsp;&ldquo;MÉ™nim Yay TÉ™tilim-2017&rdquo; &nbsp;respublika uÅŸaq rÉ™sm m&uuml;sabiqÉ™sinin yekun sÉ™rgisindÉ™ &nbsp;iÅŸtirak etmiÅŸ vÉ™ &nbsp;tÉ™ltif olunub. AzÉ™rbaycan RespublikasÄ± MÉ™dÉ™niyyÉ™t vÉ™ Turizm nazirliyi, AzÉ™rbaycan RespublikasÄ± TÉ™hsil Nazirliyi, AzÉ™rbaycan TeleviziyasÄ±, XÉ™tai Rayon Ä°cra HakimiyyÉ™ti, AzÉ™rbaycan RÉ™ssamlar Ä°ttifaqÄ±, AzÉ™rbaycan D&ouml;vlÉ™t RÉ™sm QalareyasÄ±, &nbsp;XÉ™tai SÉ™nÉ™t MÉ™rkÉ™zi tÉ™rÉ™findÉ™n ke&ccedil;Ä±rÄ±lÉ™n &ldquo;MÉ™nim Yay TÉ™tilim-2018&rdquo; &nbsp;respublika uÅŸaq rÉ™sm m&uuml;sabiqÉ™sinin yekun sÉ™rgisindÉ™ &nbsp;iÅŸtirak etmiÅŸ &nbsp;vÉ™ &nbsp; tÉ™ltif olunub. Nax&ccedil;Ä±van ÅžÉ™hÉ™rindÉ™ ke&ccedil;rilÉ™n &nbsp;&ldquo;YaradÄ±cÄ± GÉ™nclÉ™r FestivalÄ±&rdquo; nda iÅŸtirak etmiÅŸ vÉ™ &ldquo;RÉ™sm&rdquo;nominasiyasÄ± &uuml;zrÉ™ &nbsp; Nax&ccedil;Ä±van ÅŸÉ™hÉ™r TÉ™hsil ÅŸ&ouml;bÉ™si tÉ™rÉ™findÉ™n &nbsp;tÉ™ltif olunub. Muxtar Respublika umumitÉ™hsil mÉ™ktÉ™blÉ™rinin ÅŸagirdlÉ™ri vÉ™ mÉ™ktÉ™bdÉ™nkÉ™nar tÉ™rbiyÉ™ &nbsp;m&uuml;É™ssisÉ™lÉ™rinin dÉ™rnÉ™k &uuml;zvlÉ™ri arasÄ±nda &nbsp;28 May &ndash;Respublika G&uuml;n&uuml;nÉ™ hÉ™sr olunmuÅŸ &ldquo;AzÉ™rbaycan-yurdum mÉ™nim&rdquo;m&ouml;vzusunda ke&ccedil;rilÉ™n rÉ™sm m&uuml;sabiqÉ™sindÉ™ &nbsp;iÅŸtirak etmiÅŸ vÉ™ I yerÉ™ layiq g&ouml;r&uuml;l&uuml;b. Nax&ccedil;Ä±van MR &nbsp;GÉ™nclÉ™r vÉ™ Ä°dman nazirliyi tÉ™rÉ™findÉ™n ke&ccedil;irilÉ™n &ldquo;YaradÄ±cÄ± GÉ™nclÉ™r FestivalÄ±&rdquo;nda iÅŸtirak etmiÅŸ vÉ™ &nbsp; &ldquo;RÉ™sm&rdquo;nomunasiyasÄ± &uuml;zrÉ™ III yerlÉ™ &nbsp;tÉ™ltif edilib. Nax&ccedil;Ä±van Muxtar RespublikasÄ±nÄ±n &nbsp;95 &nbsp;illikyubleyi ilÉ™ É™laqÉ™dar muxtar respublika &nbsp;TÉ™hsil Nazirliyi tÉ™rÉ™findÉ™n umumitÉ™hsil mÉ™ktÉ™blÉ™rinin ÅŸagirdlÉ™ri arasinda ke&ccedil;irilÉ™n rÉ™sm m&uuml;sabiqÉ™sindÉ™ &nbsp;II yerÉ™ layiq g&ouml;r&uuml;l&uuml;b. NaxcÄ±van MR TÉ™hsil nazirliyi vÉ™ RÉ™ssamlar birliyi tÉ™rÉ™findÉ™n ke&ccedil;irilÉ™n &nbsp;&ldquo;Milli-mÉ™nÉ™vi dÉ™yÉ™rlÉ™rimiz: Novruz bayramÄ±&rdquo;m&ouml;vzusunda muxtar respublika umumitÉ™hsil mÉ™ktÉ™blÉ™rinin ÅŸagirdlÉ™ri arasÄ±nda ke&ccedil;irilÉ™n rÉ™sm m&uuml;sabiqÉ™sindÉ™ iÅŸtirak etmiÅŸ vÉ™ III yerÉ™ layÄ±q g&ouml;r&uuml;l&uuml;b. Nax&ccedil;Ä±van Muxtar RespublikasÄ± GÉ™nclÉ™r Fondu vÉ™ RÉ™ssamlar Birliyiyinin birgÉ™ tÉ™ÅŸkilat&ccedil;Ä±lÄ±ÄŸÄ± ilÉ™ Nax&ccedil;Ä±van Muxtar RespublikasÄ±nÄ±n yaradÄ±lmasÄ±nÄ±n &nbsp;95 illiyinÉ™ hÉ™sr olunmuÅŸ &nbsp;&ldquo;GÉ™nc rÉ™ssamlarÄ±n pleneri&rdquo;adlÄ± m&uuml;sabiqÉ™dÉ™ &nbsp;I yeri tutduÄŸuma g&ouml;rÉ™ tÉ™ltif olunub. RÉ™ssamlar Birliyi tÉ™rÉ™findÉ™n ke&ccedil;rilÉ™n, Nax&ccedil;Ä±van Muxtar RespublikasÄ±nÄ±n &nbsp;95 &nbsp;illik &nbsp;yubleyi ilÉ™ É™laqÉ™dar &nbsp;umumitÉ™hsil mÉ™ktÉ™blÉ™rinin ÅŸagirdlÉ™ri arasinda ke&ccedil;irilÉ™n rÉ™sm m&uuml;sabiqÉ™sindÉ™ &nbsp;II yerÉ™ layiq g&ouml;r&uuml;l&uuml;b. Nax&ccedil;Ä±van MR TÉ™hsil Nazirliyi vÉ™ HeydÉ™r Æliyev uÅŸaq-gÉ™nclÉ™r yaradÄ±cÄ±lÄ±q mÉ™rkÉ™zi tÉ™rÉ™findÉ™n ke&ccedil;irilÉ™n &nbsp;Nax&ccedil;Ä±van Muxtar RespublikasÄ±nÄ±n &nbsp;95 &nbsp;illikyubleyinÉ™ hÉ™sr olnmuÅŸ rÉ™sm m&uuml;sabiqÉ™sindÉ™ fÉ™al iÅŸtirakÄ±ma g&ouml;rÉ™ tÉ™ltif olunub. BakÄ± ÅŸÉ™hÉ™ri &nbsp;&ldquo;Moolight art house&rdquo; &nbsp;dÉ™rnÉ™yinin tÉ™ÅŸkil etdiyi &nbsp; &ldquo;Narkomaniya uÅŸaqlarÄ±n g&ouml;z&uuml; ilÉ™ &rdquo; rÉ™sm sÉ™rgisindÉ™ iÅŸtirak etmiÅŸÉ™m vÉ™ diploma laiq g&ouml;r&uuml;l&uuml;b. HeydÉ™r Æliyev adÄ±na uÅŸaq-gÉ™nclÉ™r yaradÄ±cÄ±lÄ±q mÉ™rkÉ™zinin tÉ™ÅŸkil etdiyi BÉ™hruz KÉ™ngÉ™rlinin 128 illik y&uuml;bleyinÉ™ hÉ™sr olunmuÅŸ rÉ™sm m&uuml;sabiqÉ™sindÉ™ I yerÉ™ layÄ±q g&ouml;r&uuml;l&uuml;b.<br />\r\nNax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin GÉ™nc RÉ™ssamlar Åž&ouml;bÉ™sinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;Ä±van MR-da ke&ccedil;irilÉ™n bir &ccedil;ox sÉ™rgi vÉ™ m&uuml;sabiqÉ™lÉ™rdÉ™ iÅŸtirak etmiÅŸdir.</span></p>\r\n'),
(46, 2, '<p><span style=\"font-size:12px\">Hajiyeva Aziza Telman was born in 2003 in the city of Nakhchivan. In 2009 he entered the 1st grade of secondary school No. 12 named after Afiyaddin Jalilov. He is currently studying in the 11th grade of that school.<br />\r\nCompetitions in which I participated: Participated in and was awarded at the final exhibition of the republican children&#39;s drawing competition &quot;My Summer Holiday-2017&quot; held by the Ministry of Culture and Tourism of the Republic of Azerbaijan, Azerbaijan State Art Gallery, Khatai Art Center. Participation in the final exhibition of the republican children&#39;s art competition &quot;My Summer Holiday 2018&quot; held by the Ministry of Culture and Tourism of the Republic of Azerbaijan, the Ministry of Education of the Republic of Azerbaijan, Azerbaijan Television, Khatai District Executive Power, Azerbaijan Artists Union, Azerbaijan State Art Gallery, Khatai Art Center made and awarded. Participated in the &quot;Creative Youth Festival&quot; held in Nakhchivan and was awarded by the Nakhchivan City Education Department in the &quot;Painting&quot; nomination. Participated in the drawing competition &quot;Azerbaijan is my country&quot; dedicated to May 28 - Republic Day among students of secondary schools of the Autonomous Republic and members of the association of out-of-school educational institutions and was awarded first place. Participated in the &quot;Creative Youth Festival&quot; held by the Ministry of Youth and Sports of Nakhchivan AR and was awarded the third place in the &quot;Painting&quot; nomination.&nbsp;In connection with the 95th anniversary of the Nakhchivan Autonomous Republic, he was awarded the second place in the drawing competition held by the Ministry of Education of the Autonomous Republic among the students of secondary schools. Participated in the drawing competition among students of secondary schools of the Autonomous Republic on &quot;Our national and moral values: Novruz holiday&quot; held by the Ministry of Education and the Artists&#39; Union of Nakhchivan AR and was awarded the third place.&nbsp;&nbsp;Awarded for the first place in the competition &quot;Plein air of young artists&quot; dedicated to the 95th anniversary of the Nakhchivan Autonomous Republic, jointly organized by the Youth Foundation of the Nakhchivan Autonomous Republic and the Union of Artists&nbsp;He was awarded the second place in the drawing competition held among the students of secondary schools in connection with the 95th anniversary of the Nakhchivan Autonomous Republic, held by the Union of Artists.&nbsp;Nakhchivan AR Ministry of Education and Heydar Aliyev Children and Youth Creativity Center awarded for active participation in the drawing competition dedicated to the 95th anniversary of the Nakhchivan Autonomous Republic.&nbsp;I took part in the exhibition &quot;Drugs through the eyes of children&quot; organized by the Moolight art house in Baku and was awarded a diploma.&nbsp;He won the first place in the drawing competition dedicated to the 128th anniversary of Bahruz Kangarli, organized by the Heydar Aliyev Children and Youth Creativity Center.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</span></p>\r\n'),
(47, 1, '<p>ÆSGÆRLÄ° ÆlÉ™sgÉ™r QasÄ±m oÄŸlu (04.02.1960 Nax&ccedil;Ä±van ÅŸ.) &ndash; rÉ™ssam. BakÄ± ÅŸÉ™hÉ™rindÉ™ rÉ™ssamlÄ±q mÉ™ktÉ™bi reklam tÉ™rtibatÄ± &uuml;zrÉ™ tÉ™rtibat&ccedil;Ä± rÉ™ssam ixtisasÄ± (1981 -1983). Nax&ccedil;Ä±van ÅŸÉ™hÉ™rindÉ™ Åž&uuml;ÅŸÉ™ qablar zavodunun keramika sexindÉ™ keramika&ccedil;Ä± rÉ™ssam (1983 - 1990). Nax&ccedil;Ä±van D&ouml;vlÉ™t RÉ™sm QalereyasÄ±nda rÉ™ssam (1990). ÆrtoÄŸrol Cavid adÄ±na Musiqi vÉ™ BÉ™dii SÉ™nÉ™tkarlÄ±q MÉ™ktÉ™bindÉ™ rÉ™sm m&uuml;É™llimi (1992 - 2020). Nax&ccedil;Ä±van RÉ™ssamlar Birliyinin &uuml;zv&uuml; (2013). Nax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin sÉ™rgilÉ™rindÉ™ iÅŸtirak (2013-c&uuml; ildÉ™n bu g&uuml;nÉ™ kimi).</p>\r\n'),
(47, 2, '<p>ASGERLI Alasgar Gasim oglu (04.02.1960 Nakhchivan) - artist. School of Art in Baku, majoring in advertising design (1981-1983). Ceramic artist in the ceramic workshop of the Glassware Factory in Nakhchivan (1983-1990). Artist at the Nakhchivan State Art Gallery (1990). Art teacher at the Ertogrul Javid School of Music and Fine Arts (1992 - 2020). Member of Nakhchivan Artists Union (2013). Participation in exhibitions of the Union of Artists of Nakhchivan AR (since 2013).</p>\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `image`, `created_date`, `category_id`, `hits`, `status`) VALUES
(20, '2c56685f7698b00db68846979259230a.jpg', '2021-07-07 15:45:19', 49, 0, 1),
(25, 'artbattle1.jpg', '2021-07-22 11:39:43', 64, 0, 1),
(26, 'irs2.jpg', '2021-07-22 11:41:31', 64, 0, 1),
(27, 'qehremanlar unudlumur1.jpg', '2021-07-22 11:43:04', 64, 0, 1),
(29, '1.jpg', '2021-07-22 11:50:16', 63, 0, 1),
(30, '2.jpg', '2021-07-22 11:50:45', 63, 0, 1),
(31, '3.jpg', '2021-07-22 11:51:13', 63, 0, 1),
(32, '4ce2f919-9146-4dc4-94b1-8d4b69335944.jpg', '2021-07-22 11:51:33', 63, 0, 1),
(33, '5b9a7119-c892-4e7c-9bbe-01ae9fb5af45.jpg', '2021-07-22 11:51:56', 63, 0, 1),
(34, '10.1.jpg', '2021-07-22 11:52:36', 63, 0, 1),
(35, '10.2.jpg', '2021-07-22 11:53:01', 63, 0, 1),
(36, '10.jpg', '2021-07-22 11:53:21', 63, 0, 1),
(37, '15iyun2011-4.gif', '2021-07-22 11:53:43', 63, 0, 1),
(38, '24c7a15a-c73f-4178-ab56-a3e38bcf1e86.jpg', '2021-07-22 11:54:06', 63, 0, 1),
(39, '41.jpg', '2021-07-22 11:55:12', 63, 0, 1),
(40, '42c774b9-fd9f-4674-8f5a-415cc4beb5b0.jpg', '2021-07-22 11:55:34', 63, 0, 1),
(41, '42e760e3-4310-4ec7-afe5-70080cd297c8.jpg', '2021-07-22 11:59:38', 63, 0, 1),
(42, '7582a253-af74-498d-a4e5-407bfade18f1.jpg', '2021-07-22 12:00:14', 63, 0, 1),
(43, 'DSC05503.jpg', '2021-07-22 12:00:46', 63, 0, 1),
(44, 'DSC05508.jpg', '2021-07-22 12:01:09', 63, 0, 1),
(45, 'DSC05510.jpg', '2021-07-22 12:01:31', 63, 0, 1),
(46, 'DSC05514.jpg', '2021-07-22 12:01:54', 63, 0, 1),
(47, 'DSC05516.jpg', '2021-07-22 12:02:22', 63, 0, 1),
(50, 'DSC05527.jpg', '2021-07-22 12:03:40', 63, 0, 1),
(51, 'DSC05541.jpg', '2021-07-22 12:04:03', 63, 0, 1),
(52, 'DSC05547.jpg', '2021-07-22 12:05:02', 63, 0, 1),
(54, 'eb60b2d5-6e55-46ec-888e-8905626969bb.jpg', '2021-07-22 12:05:45', 63, 0, 1),
(55, 'IMG_1301.jpg', '2021-07-22 12:11:17', 75, 0, 1),
(56, 'u1 (2).jpg', '2021-07-22 12:12:30', 75, 0, 1),
(58, 'IMG_4430.JPG', '2021-07-22 13:24:28', 48, 0, 1),
(59, 'abdinov.jpg', '2021-07-22 13:27:24', 48, 0, 1),
(60, 'IMG_9444.JPG', '2021-07-22 13:28:35', 48, 0, 1),
(61, '44034107_1365919896878763_4539787587287515136_n.jpg', '2021-07-22 13:33:30', 69, 0, 1),
(62, '59873614_1518860578251360_2796498088833843200_n.jpg', '2021-07-22 13:38:48', 69, 0, 1),
(65, 'DSC_0013.jpg', '2021-07-22 17:04:05', 48, 0, 1),
(67, '29792114_1205794299557991_3304706763341782440_n.jpg', '2021-07-23 12:15:40', 68, 0, 1),
(69, '29694779_1205794162891338_8655184027827176129_n.jpg', '2021-07-23 12:18:34', 68, 0, 1),
(72, '29597303_1205793806224707_748832734378875198_n.jpg', '2021-07-23 12:43:51', 68, 0, 1),
(73, '29597649_1205794592891295_7828484519267055324_n.jpg', '2021-07-23 12:45:41', 68, 0, 1),
(79, 'sb1.jpg', '2021-07-27 12:03:10', 74, 0, 1),
(80, 'yb1.jpg', '2021-07-27 12:07:15', 74, 0, 1),
(81, 'h1.png', '2021-07-27 12:16:10', 74, 0, 1),
(82, 'q4.jpg', '2021-07-27 12:21:10', 74, 0, 1),
(83, 'dts3.jpg', '2021-07-27 12:36:22', 74, 0, 1),
(92, '31939634_1224654517671969_3413085908834975744_n.jpg', '2021-07-27 17:09:59', 68, 0, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_gallery`
--

INSERT INTO `posts_gallery` (`id`, `post_id`, `gallery_image`) VALUES
(213, 61, 'uploaded-60f93bfac3bac8.83254351.jpg'),
(215, 61, 'uploaded-60f93bfb211520.70244536.jpg'),
(216, 61, 'uploaded-60f93bfb2115f3.61449821.jpg'),
(217, 61, 'uploaded-60f93bfb3e4868.48706142.jpg'),
(218, 61, 'uploaded-60f93bfb3deb50.22683173.jpg'),
(219, 61, 'uploaded-60f93bfb6fdc33.16445506.jpg'),
(220, 61, 'uploaded-60f93bfb73e7c7.39746718.jpg'),
(221, 61, 'uploaded-60f93bfb818ea9.85922317.jpg'),
(222, 61, 'uploaded-60f93bfb7fbf32.33847339.jpg'),
(223, 61, 'uploaded-60f93bfbec4792.44653278.jpg'),
(224, 61, 'uploaded-60f93bfbedd940.82100726.jpg'),
(225, 61, 'uploaded-60f93c0b77e855.44902942.jpg'),
(226, 61, 'uploaded-60f93c0b7d3176.35481309.jpg'),
(227, 61, 'uploaded-60f93c0b86e861.16122485.jpg'),
(228, 62, 'uploaded-60f93cae690669.01530353.jpg'),
(249, 79, 'uploaded-60ffbde1d7e4e3.99624697.png'),
(250, 79, 'uploaded-60ffbde1d69ae5.12773821.jpg'),
(251, 80, 'uploaded-60ffbeb9e48b32.35632160.jpg'),
(252, 80, 'uploaded-60ffbeb9e9df62.22667999.jpg'),
(253, 81, 'uploaded-60ffc0d50304e7.20741419.png'),
(254, 81, 'uploaded-60ffc0d504ebb0.84991161.jpg'),
(256, 82, 'uploaded-60ffc2009eda98.25356603.jpg'),
(257, 82, 'uploaded-60ffc200ab30d5.31435086.jpg'),
(258, 82, 'uploaded-60ffc282762d53.43935752.jpg'),
(259, 83, 'uploaded-60ffc59422fcc7.62635518.jpg'),
(260, 83, 'uploaded-60ffc5942510c1.28053162.jpg'),
(261, 83, 'uploaded-60ffc5944b1f18.04114010.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts_translation`
--

DROP TABLE IF EXISTS `posts_translation`;
CREATE TABLE IF NOT EXISTS `posts_translation` (
  `post_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` text,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_translation`
--

INSERT INTO `posts_translation` (`post_id`, `lang_id`, `title`, `content`) VALUES
(20, 1, 'bu bir basliqdir', '<p>gfdgfdgdfg</p>\r\n'),
(20, 2, 'this is a title11', '<p>dgdfgfg</p>\r\n'),
(25, 1, 'GÉ™nc rÉ™ssamlarÄ±n sÉ™nÉ™t dÃ¶yÃ¼ÅŸÃ¼', '<p>Nax&ccedil;Ä±vanda gÉ™nc rÉ™ssamlarÄ±n sÉ™nÉ™t d&ouml;y&uuml;ÅŸ&uuml;</p>\r\n'),
(25, 2, 'Art battle', '<p>Art battle Nakhchivan</p>\r\n'),
(26, 1, 'Ä°RS', '<p>Bilik g&uuml;n&uuml;nÉ™ hÉ™sr olunmuÅŸ uÅŸaqlarÄ±n É™l iÅŸlÉ™rindÉ™n ibarÉ™t rÉ™sm sÉ™rgisi</p>\r\n'),
(26, 2, 'Ä°RS', '<p>Painting exhibition of children&#39;s handiwork dedicated to Knowledge Day</p>\r\n'),
(27, 1, 'QÉ™hrÉ™manlar unudulmur', '<p>B.KÉ™ngÉ™rli adÄ±na sÉ™rgi salonu. 23 fevral 2021-ci il saat 15:00-da</p>\r\n'),
(27, 2, 'Heroes are not forgotten', '<p>Exhibition hall in the name of B. Canary. February 23, 2021 at 3:00 p.m.</p>\r\n'),
(29, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(29, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(30, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(30, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(31, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(31, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(32, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(32, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(33, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(33, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(34, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(34, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(35, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(35, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(36, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(36, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(37, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(37, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(38, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(38, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(39, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(39, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(40, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(40, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(41, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(41, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(42, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(42, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(43, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(43, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(44, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(44, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(45, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(45, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(46, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(46, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(47, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(47, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(50, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(50, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(51, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(51, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(52, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(52, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(54, 1, 'Tarixi fotolar', '<p>Tarixi fotolar</p>\r\n'),
(54, 2, 'Historical photos', '<p>Historical photos</p>\r\n'),
(56, 1, 'Birliyin profili', '<p>Birliyin profili</p>\r\n'),
(56, 2, 'Association profile', '<p>Association profile</p>\r\n'),
(55, 1, 'Birliyin profili', '<p>Birliyin profili</p>\r\n'),
(55, 2, 'Association profile', '<p>Association profile</p>\r\n'),
(58, 1, 'SÉ™yyad Bayramov', '<p>1958- ci ildÉ™ Åžahbuz rayonunun Ke&ccedil;ili kÉ™ndindÉ™ anadan olmuÅŸdur.<br />\r\n1983- c&uuml; ildÉ™ Æzim ÆzimzadÉ™ adÄ±na BakÄ± D&ouml;vlÉ™t RÉ™ssamlÄ±q mÉ™ktÉ™binin &ldquo; BÉ™dii tÉ™rtibat&rdquo; fak&uuml;ltÉ™sini bitirmiÅŸdir.<br />\r\nNax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin &uuml;zv&uuml;d&uuml;r.<br />\r\nAzÉ™rbaycan RÉ™ssamlar Ä°ttifaqÄ±nÄ±n &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;Ä±van Muxtar RespublikasÄ±nÄ±n ÆmÉ™kdar rÉ™ssamÄ±dÄ±r.</p>\r\n'),
(58, 2, 'SÉ™yyad Bayramov', '<p>He was born in 1958 in Kechili village of Shahbuz region.<br />\r\nIn 1983, he graduated from the Baku State Art School named after Azim Azimzade, &quot;Art Design&quot; faculty.<br />\r\nHe is a member of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe is a member of the Artists&#39; Union of Azerbaijan.<br />\r\nHe is an Honored Artist of the Nakhchivan Autonomous Republic.</p>\r\n'),
(59, 1, 'Telman Abdinov', '<p>ABDÄ°NOV Telman Manaf oÄŸlu. 01.07.1954-c&uuml; ildÉ™ Åžahbuz rayonunun K&uuml;l&uuml;s kÉ™ndindÉ™ anadan olmuÅŸdur. RÉ™ssam &ndash; qrafik. AzÉ™rbaycan RespublikasÄ±nÄ±n É™mÉ™kdar rÉ™ssamÄ± (2002). Æzim ÆzimzadÉ™ adÄ±na AzÉ™rbaycan D&ouml;vlÉ™t RÉ™ssamlÄ±q mÉ™ktÉ™bini bitirmiÅŸdir (1978). 1988-ci ildÉ™n AzÉ™rbaycan RÉ™ssamlar Ä°ttifaqÄ±nÄ±n, 2012-ci ildÉ™n isÉ™ Nax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin &uuml;zv&uuml;d&uuml;r. RÉ™ngkarlÄ±q vÉ™ qrafika janrlarÄ±nda bir &ccedil;ox É™sÉ™rlÉ™rin m&uuml;É™llifidir. YaradÄ±cÄ±lÄ±ÄŸÄ±nda portret janrÄ± m&uuml;h&uuml;m yer tutur. XalqÄ±mÄ±zÄ±n &uuml;mummilli lideri HeydÉ™r Æliyevin, AzÉ™rbaycan RespublikasÄ±nÄ±n prezidenti Ä°lham Æliyevin, oftalmoloq alim, Akademik ZÉ™rifÉ™ xanÄ±m ÆliyevanÄ±n, MÉ™hÉ™mmÉ™d H&uuml;seyn ÅžÉ™hriyarÄ±n, XÉ™lil Rza Ulut&uuml;rk&uuml;n, BÉ™hruz bÉ™y KÉ™ngÉ™rlinin, Æziz ÅžÉ™rifin, Yusif MÉ™mmÉ™dÉ™liyevin, EynÉ™li bÉ™y Sultanovun, H&uuml;seyn Cavidin, Turan Cavidin,ÆkbÉ™r xan Nax&ccedil;Ä±vanckinin, KalbalÄ± xanÄ±n, ÆcÉ™mi Nax&ccedil;Ä±vaninin, NemÉ™tulla Nax&ccedil;Ä±vaninin, ÅžÉ™hid anasÄ±nÄ±n, MÉ™hÉ™mmÉ™d aÄŸa Åžahtaxtinskinin vÉ™ digÉ™r g&ouml;rkÉ™mli ÅŸÉ™xsiyyÉ™tlÉ™rin portretlÉ™ri emosional tÉ™siri, rÉ™ng &ccedil;alarlarÄ±nÄ±n poetik cazibÉ™si ilÉ™ diqqÉ™ti cÉ™lb edir. Tematik kompozisiyalÄ± vÉ™ tÉ™biÉ™t tÉ™svirli É™sÉ™rlÉ™ri &ndash; &ldquo;GÉ™nc qÄ±z ÅŸanapipik ilÉ™&rdquo;, &ldquo;HÉ™yÉ™can yaddaÅŸ&rdquo;, &ldquo;Bir d&ouml;vlÉ™t iki millÉ™t&rdquo;, &ldquo;AxÅŸam qÉ™lÉ™mÉ™lÉ™ri&rdquo;, &ldquo;Ay iÅŸÄ±ÄŸÄ±nda nat&uuml;rmort&rdquo;, &ldquo;DÉ™niz&rdquo;, &ldquo;Åžahbuzda qÄ±ÅŸ&rdquo;, &ldquo;Terrorist g&uuml;llÉ™si&rdquo;, &ldquo;Goy qurÅŸaÄŸÄ±&rdquo;, &ldquo;AxÅŸam&rdquo;, &ldquo;Batabat&rdquo;, &ldquo;MÉ™nzÉ™rÉ™&rdquo;, &ldquo;QÄ±ÅŸ&rdquo;, &ldquo;Nax&ccedil;Ä±van baharÄ±&rdquo;, &ldquo;Nax&ccedil;Ä±van abidÉ™lÉ™ri&rdquo; vÉ™ s. Moskva, Paris, Praqa, Sankt-Peterburq, Yekaterinbuq, Ä°stanbul, Ankara, Bodrum, Ærzurum, Qars, Tehran, BakÄ±, Nax&ccedil;Ä±van ÅŸÉ™hÉ™rlÉ™rindÉ™ ke&ccedil;irilÉ™n sÉ™rgilÉ™rdÉ™ uÄŸurla n&uuml;mayiÅŸ olunmuÅŸdur. 2002, 2004, 2005, 2014, 2019-cu illÉ™rdÉ™ fÉ™di yaradÄ±cÄ±lÄ±q sÉ™rgilÉ™ri ke&ccedil;irmiÅŸdir. O, 2012, 2014, 2016, 2018-ci illÉ™rdÉ™ &nbsp;Nax&ccedil;Ä±van BÉ™ÅŸÉ™riyyÉ™tin BeÅŸiyi BeynÉ™lxalq RÉ™sm festivalÄ±nÄ±nda da fÉ™al iÅŸtirak etmiÅŸdir. ÆsÉ™rlÉ™ri HeydÉ™r Æliyev Muzeyi, H&uuml;seyn Cavidin EV Muzeyi, Nax&ccedil;Ä±van D&ouml;vlÉ™t RÉ™sm QalereyasÄ±, MÉ™mmÉ™d ArazÄ±n Ev Muzeyi, ÆdÉ™biyyat Muzeyi, CÉ™mÅŸid Nax&ccedil;Ä±vanski Muzeyi, Milli DÉ™yÉ™rlÉ™r Muzeyi, &ldquo;Xan SarayÄ±&rdquo; D&ouml;vlÉ™t Tarix &ndash; MemarlÄ±q M&ouml;minÉ™ XatÄ±n vÉ™ A&ccedil;Ä±q SÉ™ma AltÄ±nda Muzey Kompleksi, Åžahbuz Rayonu Tarix &ndash; DiyarÅŸ&uuml;naslÄ±q Muzeyi, BÉ™hruz KÉ™ngÉ™rli Muzeyi, CÉ™lil MÉ™mmÉ™dquluzadÉ™nin Ev Muzeyi, Nax&ccedil;Ä±van D&ouml;vlÉ™t Tarix Muzeyi, Nax&ccedil;Ä±van D&ouml;vlÉ™t Xalca Muzeyi, XatirÉ™ Muzeyi, Yusif MÉ™mmÉ™dÉ™liyevin Ev Muzeyi, ÅžahtaxtinskilÉ™rin Muzeyi, MÉ™mmÉ™d TaÄŸÄ± Sidqinin Ev Muzeyi vÉ™ bir &ccedil;ox ÅŸÉ™xsi kolleksiyalarda qorunub saxlanÄ±lÄ±r.</p>\r\n'),
(59, 2, 'Telman Abdinov', '<p>ABDINOV Telman Manaf oglu. He was born on July 1, 1954 in Kulus village of Shahbuz region. Artist - graphic. Honored Artist of the Republic of Azerbaijan (2002). He graduated from the Azerbaijan State Art School named after Azim Azimzade (1978). He has been a member of the Union of Artists of Azerbaijan since 1988, and the Union of Artists of Nakhchivan AR since 2012. He is the author of many works in the genres of painting and graphics. The portrait genre plays an important role in his work. National leader of our people Heydar Aliyev, President of the Republic of Azerbaijan Ilham Aliyev, ophthalmologist, Academician Zarifa Aliyeva, Muhammad Huseyn Shahriyar, Khalil Rza Uluturk, Bahruz bey Kangarli, Aziz Sharif, Yusif Mammadaliyev, Eynali bey Sultanov, Huseyn Javid, Turan Javid, Akbar khan The portraits of Nakhchivanchi, Kalbali khan, Ajami Nakhchivani, Nematulla Nakhchivani, Shahid&#39;s mother, Mohammad agha Shahtakhtinski and other prominent personalities attract attention with their emotional impact and poetic charm of color shades. Works with thematic composition and description of nature - &quot;Young girl with honeymoon&quot;, &quot;Exciting memory&quot;, &quot;One state, two nations&quot;, &quot;Evening pens&quot;, &quot;Still life in the moonlight&quot;, &quot;Sea&quot;, &quot;Winter in Shahbuz&quot;, &quot;Terrorist bullet&quot; , &ldquo;Goy belt&rdquo;, &ldquo;Evening&rdquo;, &ldquo;Batabat&rdquo;, &ldquo;Landscape&rdquo;, &ldquo;Winter&rdquo;, &ldquo;Nakhchivan spring&rdquo;, &ldquo;Nakhchivan monuments&rdquo; and others. It has been successfully demonstrated at exhibitions in Moscow, Paris, Prague, St. Petersburg, Yekaterinburg, Istanbul, Ankara, Bodrum, Erzurum, Kars, Tehran, Baku, Nakhchivan. He held exhibitions in 2002, 2004, 2005, 2014, 2019. He also took an active part in the Nakhchivan Cradle of Humanity International Art Festival in 2012, 2014, 2016 and 2018. Works Heydar Aliyev Museum, Huseyn Javid&#39;s House Museum, Nakhchivan State Art Gallery, Mammad Araz&#39;s House Museum, Literature Museum, Jamshid Nakhchivanski Museum, Museum of National Values, &quot;Khan Palace&quot; State Historical-Architectural Faithful Woman and Open-Air Museum Complex, History - Ethnography Museum, Bahruz Kangarli Museum, Jalil Mammadguluzadeh&#39;s House Museum, Nakhchivan State History Museum, Nakhchivan State Carpet Museum, Memorial Museum, Yusif Mammadaliyev&#39;s House Museum, Shakhtakhtinsky Museum, Mammad Tagi Sidgi&#39;s House Museum and many other private colleges.</p>\r\n'),
(60, 1, 'ÃœlviyyÉ™ HÉ™mzÉ™yeva', '<p>&Uuml;lviyyÉ™ HÉ™mzÉ™yeva</p>\r\n'),
(60, 2, 'ÃœlviyyÉ™ HÉ™mzÉ™yeva', '<p>&Uuml;lviyyÉ™ HÉ™mzÉ™yeva</p>\r\n'),
(61, 1, '18 oktyabr DÃ¶vlÉ™t MÃ¼stÉ™qilliyi gÃ¼nÃ¼', '<p>H&ouml;rmÉ™tli sÉ™nÉ™tsevÉ™rlÉ™r !<br />\r\n18 oktyabr D&ouml;vlÉ™t M&uuml;stÉ™qilliyi G&uuml;n&uuml; m&uuml;nasibÉ™ti ilÉ™<br />\r\n17 oktyabr 2018- ci il tarixindÉ™, saat 15:00- da Nax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin BÉ™hruz KÉ™ngÉ™rli adÄ±na sÉ™rgi salonunda SizlÉ™ri sÉ™rgimizÉ™ g&ouml;zlÉ™yirik!<br />\r\nEkspozisiyamÄ±z artÄ±q hazÄ±rdÄ±r.<br />\r\nSÉ™rgidÉ™ Ä°ÅŸtirak edÉ™n b&uuml;t&uuml;n rÉ™ssamlara tÉ™ÅŸÉ™kk&uuml;r edirik!</p>\r\n'),
(61, 2, 'October 18 State Independence Day', '<p>Dear art lovers!<br />\r\nOn the occasion of October 18 Independence Day<br />\r\nWe are waiting for you at our exhibition on October 17, 2018, at 15:00 in the exhibition hall named after Bahruz Kangarli of the Artists&#39; Union of Nakhchivan AR!<br />\r\nOur exposition is ready.<br />\r\nThank you to all the artists participating in the exhibition!</p>\r\n'),
(62, 1, 'Ulu Ã–ndÉ™r HeydÉ™r Æliyevin 96-cÄ± il dÃ¶nÃ¼mÃ¼', '<p>8 may, saat 11.00-da Nax&ccedil;Ä±van MR RÉ™ssamlar Birliyinin BÉ™hruz KÉ™ngÉ™rli adÄ±na sÉ™rgi salonunda &ldquo;Ulu &Ouml;ndÉ™r HeydÉ™r Æliyevin 96-cÄ± il d&ouml;n&uuml;m&uuml;&rdquo;-nÉ™ hÉ™sr olunmuÅŸ, ÆmÉ™kdar rÉ™ssam SÉ™yyad Bayramovun fÉ™rdi yaradÄ±cÄ±lÄ±q sÉ™rgisi.<br />\r\nDÆVÆT EDÄ°RÄ°K!</p>\r\n'),
(62, 2, '96th anniversary of the Great Leader Heydar Aliyev', '<p>On May 8, at 11.00 in the exhibition hall of the Union of Artists of Nakhchivan AR named after Bahruz Kangarli, a personal art exhibition of the Honored Artist Sayyad Bayramov, dedicated to the &quot;96th anniversary of the Great Leader Heydar Aliyev&quot;.<br />\r\nWE INVITE!</p>\r\n'),
(65, 1, 'HÃ¼seynqulu Æliyev', '<p>1949- cu ildÉ™ Ordubad Rayonunun Bist kÉ™ndindÉ™ anadan olmuÅŸdur.<br />\r\n1982- ci ildÉ™ MirzÉ™ AÄŸa Æliyev adÄ±na AzÉ™rbaycan D&ouml;vlÉ™t Ä°ncÉ™sÉ™nÉ™t Ä°nistitutunun &nbsp;RÉ™ssamlÄ±q fak&uuml;ltÉ™sini bitirmiÅŸdir.<br />\r\nAzÉ™rbaycan RÉ™ssamlar Ä°ttifaqÄ±nÄ±n &uuml;zv&uuml;d&uuml;r.<br />\r\nAzÉ™rbaycanÄ±n Xalq RÉ™ssamÄ±dÄ±r.</p>\r\n'),
(65, 2, 'HÃ¼seynqulu Æliyev', '<p>He was born in 1949 in Bist village of Ordubad region.<br />\r\nIn 1982 he graduated from the Art Faculty of the Azerbaijan State Institute of Arts named after Mirza Aga Aliyev.<br />\r\nHe is a member of the Artists&#39; Union of Azerbaijan.<br />\r\nHe is the People&#39;s Artist of Azerbaijan.</p>\r\n'),
(79, 1, 'Sulu boya', '<p>Akvarel (vÉ™ ya sulu boya) (fr. Aquarelle &mdash; sulu; it. acquarello) &mdash; CanlÄ± meymun texnikasÄ±dÄ±r. Su ilÉ™ birgÉ™ istifadÉ™ olunan akvarel boyalarÄ± incÉ™ piqmentli rÉ™nglÉ™r É™mÉ™lÉ™ gÉ™tirmÉ™klÉ™ m&uuml;xtÉ™lif rÉ™ngkarlÄ±q mÉ™qsÉ™dlÉ™ri ilÉ™, adÉ™tÉ™n kaÄŸÄ±z &uuml;zÉ™rindÉ™ rÉ™smlÉ™r &ccedil;É™kmÉ™k &uuml;&ccedil;&uuml;n istifadÉ™ olunur.</p>\r\n'),
(79, 2, 'Watercolor', '<p>Watercolor (or watercolor) (fr. Aquarelle - watery; it. Acquarello) - is a living ape technique. Watercolors used in combination with water are usually used for painting on paper for a variety of painting purposes, creating subtle pigmented colors.</p>\r\n'),
(80, 1, 'YaÄŸlÄ± boya', '<p>YaÄŸlÄ± boya rÉ™ssamlÄ±ÄŸÄ± (it. Pittura a olio) &mdash; tÉ™sviri incÉ™sÉ™nÉ™tin rÉ™ssamlÄ±q n&ouml;v&uuml;ndÉ™ texniki bir &uuml;slub olub, burada istifadÉ™ olunan boyaq maddÉ™lÉ™ri bitki yaÄŸÄ±nda hÉ™ll edilÉ™rÉ™k hazÄ±rlanÄ±r. YaÄŸlÄ± boyalarÄ±n tÉ™rkibi quru piqment vÉ™ bitki yaÄŸdan ibarÉ™tdir. Bu mÉ™qsÉ™dlÉ™ É™sasÉ™n kÉ™tan toxumu, xaÅŸxaÅŸ vÉ™ yaxud qoz yaÄŸlarÄ±ndan istifadÉ™ edilir.</p>\r\n'),
(80, 2, 'Oil painting', '<p>Oil painting (it. Pittura a olio) is a technical style of painting in which the dyes used are made by dissolving in vegetable oil. Oil paints contain dry pigment and vegetable oil. For this purpose, mainly flaxseed, poppy or walnut oils are used.</p>\r\n'),
(81, 1, 'HeykÉ™ltÉ™raÅŸlÄ±q', '<p>HeykÉ™ltÉ™raÅŸlÄ±q &mdash; tÉ™sviri sÉ™nÉ™tin n&ouml;vlÉ™rindÉ™n biridir. HeykÉ™ltÉ™raÅŸlÄ±qda insan vÉ™ ya hÉ™r hansÄ± tÉ™svir obyekt hÉ™cmli formada yaradÄ±lÄ±r. HeykÉ™ltÉ™raÅŸlÄ±q É™sasÉ™n 2 n&ouml;vÉ™ ayrÄ±lÄ±r: hÉ™cmli vÉ™ ya dayirÉ™vi relyef (barelyef,qorelyef) HeykÉ™lin daha yaxÅŸÄ± alÄ±nmasÄ± &uuml;&ccedil;&uuml;n É™sas plan, iÅŸÄ±q m&uuml;stÉ™visi, k&uuml;tlÉ™ vÉ™ hÉ™cm b&ouml;y&uuml;k rol oynayÄ±r. HeykÉ™llÉ™rin hazÄ±rlanmasÄ±nda m&uuml;xtÉ™lf materiallardan istifadÉ™ olunur: daÅŸ (mÉ™rmÉ™r, É™hÉ™ngdaÅŸÄ±, qumdaÅŸÄ±, qranit vÉ™ s.), taxta, s&uuml;m&uuml;k, metal (b&uuml;r&uuml;nc, dÉ™mir, tunc vÉ™ s.), gil, yanmÄ±ÅŸ gil, keramika (terrakota, mayolika, saxsÄ±, &ccedil;ini vÉ™ s.) gips vÉ™ digÉ™rlÉ™ri. ÆnÉ™nÉ™vi materiallarla yanaÅŸÄ±, m&uuml;asir heykÉ™ltÉ™raÅŸlÄ±qda tamamilÉ™ fÉ™rqli materiallardan da istifadÉ™ olunur: ÅŸ&uuml;ÅŸÉ™dÉ™n, buzdan, qardan, kaÄŸÄ±zdan da heykÉ™l hazÄ±rlanÄ±r.</p>\r\n'),
(81, 2, 'Sculpture', '<p>Sculpture is one of the types of fine arts. In sculpture, a person or any depicted object is created in a three-dimensional form. Sculpture is mainly divided into 2 types: volumetric or circular relief (bas-relief, high-relief). Various materials are used in the production of sculptures: stone (marble, limestone, sandstone, granite, etc.), wood, bone, metal (bronze, iron, bronze, etc.), clay, burnt clay, ceramics (terracotta, majolica, pottery, porcelain, etc.) gypsum and others. In addition to traditional materials, modern sculpture uses completely different materials: glass, ice, snow and paper.</p>\r\n'),
(82, 1, 'Qrafika', '<p>Qrafika tÉ™sviri sÉ™nÉ™tin bir n&ouml;v&uuml;d&uuml;r. Bura m&uuml;xtÉ™lif texniki &uuml;sullarla iÅŸlÉ™nmiÅŸ sÉ™nÉ™t É™sÉ™rlÉ™ri daxildir. Yunanca &ldquo;graphike&rdquo; &ndash; rÉ™sm, ÅŸÉ™kil demÉ™kdir.<br />\r\nXIX É™srdÉ™ qrafikanÄ±n É™sasÄ±nÄ± yalnÄ±z cizgilÉ™r, yaxud aÄŸ vÉ™ qara xÉ™tlÉ™r tÉ™ÅŸkil edirdi. Sonradan bu sÉ™nÉ™t n&ouml;v&uuml; daha da tÉ™kmillÉ™ÅŸib. Kontur xÉ™tlÉ™r, cizgi, lÉ™kÉ™, hÉ™m&ccedil;inin rÉ™sm &ccedil;É™kilÉ™n É™sas materialÄ±n aÄŸ yerliyi qrafikanÄ±n É™sas bÉ™dii vasitÉ™lÉ™rindÉ™n olub. Ä°ÅŸlÉ™nmÉ™ texnikasÄ±na g&ouml;rÉ™ qrafika sÉ™nÉ™ti iki hissÉ™yÉ™ ayrÄ±lÄ±r &ndash; rÉ™sm vÉ™ &ccedil;ap qrafikasÄ±. Onlardan É™n qÉ™dim vÉ™ É™nÉ™nÉ™vi n&ouml;v&uuml; rÉ™smdir. KarandaÅŸla iÅŸlÉ™nilÉ™n rÉ™sm É™sasÉ™n kaÄŸÄ±zda, bÉ™zÉ™n isÉ™ par&ccedil;a &uuml;zÉ™rindÉ™ &ccedil;É™kilir. Bu rÉ™smlÉ™r yalnÄ±z bir n&uuml;sxÉ™dÉ™ yaranÄ±r. BÉ™zi É™sÉ™rlÉ™r rÉ™ng baxÄ±mÄ±ndan zÉ™ngin olduÄŸuna g&ouml;rÉ™, onlarÄ±n boyakarlÄ±qla yaxÄ±nlÄ±ÄŸÄ± var: bunlar sulu boyalarla &ccedil;É™kilÉ™n (akvarel, quaÅŸ, tempera) vÉ™ yaxud pastel (rÉ™ngli karandaÅŸ) texnikasÄ±nda &ccedil;É™kilmiÅŸ rÉ™smlÉ™rdir. Qrafika &uuml;sulu ilÉ™ É™sÉ™r, portret, mÉ™nzÉ™rÉ™ vÉ™ s. janrlarda rÉ™smlÉ™r yaratmaq m&uuml;mk&uuml;nd&uuml;r. QrafikanÄ±n digÉ™r bir n&ouml;v&uuml; olan &ccedil;ap qrafikasÄ±nÄ± rÉ™smdÉ™n fÉ™rqlÉ™ndirÉ™n É™sas cÉ™hÉ™t odur ki, &ccedil;ap qrafikasÄ± É™sÉ™rlÉ™rindÉ™n eyni keyfiyyÉ™tdÉ™ istÉ™nilÉ™n qÉ™dÉ™r n&uuml;sxÉ™ almaq m&uuml;mk&uuml;nd&uuml;r. Buraya metal, aÄŸac, daÅŸ vÉ™ maqnezium &uuml;zÉ™rindÉ™ qazÄ±lmÄ±ÅŸ vÉ™ ya hÉ™kk olunmuÅŸ rÉ™smlÉ™r daxildir. &Ccedil;ap qrafikasÄ±nda qrafik l&ouml;vhÉ™nin materialÄ±ndan asÄ±lÄ± olaraq m&uuml;xtÉ™lif texnikalar yaranÄ±b. Metal, yÉ™ni mis &uuml;zÉ™rindÉ™ iynÉ™ ilÉ™ cÄ±zÄ±lmÄ±ÅŸ vÉ™ sonra basma &uuml;sulu ilÉ™ yaranmÄ±ÅŸ qrav&uuml;rlÉ™rÉ™ ofort deyilir. DaÅŸ &uuml;zÉ™rindÉ™ hÉ™kk olunmuÅŸ qrafikaya litoqrafiya ( &ldquo;lito&rdquo; yunanca &ldquo;daÅŸ&rdquo; demÉ™kdir), aÄŸac &uuml;zÉ™rindÉ™ki qrafikaya isÉ™ ksiloqrafiya (&ldquo;ksilo&rdquo; &ndash; yunanca &ldquo;aÄŸac&rdquo; demÉ™kdir) deyilir. NisbÉ™tÉ™n sonra yaranmÄ±ÅŸ linoqrav&uuml;r &ndash; linoleumu qazÄ±maqla iÅŸlÉ™nilir. SahÉ™sinÉ™ g&ouml;rÉ™ qrafikanÄ±n kitab qrafikasÄ± (kitabÄ±n tÉ™rtibatÄ±), elmi-tÉ™dqiqat qrafikasÄ± (elmi cÉ™dvÉ™llÉ™r, &ccedil;ertyojlar, sxemlÉ™r, xÉ™ritÉ™lÉ™r), plakat qrafikasÄ±, sÉ™naye qrafikasÄ± (mÉ™hsulun tÉ™rkibini bildirÉ™n a&ccedil;Ä±qcalar, dÉ™vÉ™tnamÉ™lÉ™r, paltar etiketlÉ™ri) vÉ™ s. kimi n&ouml;vlÉ™ri var.</p>\r\n'),
(82, 2, 'Graphics', '<p>Graphics are a form of fine art. This includes works of art developed in various technical ways. The Greek word &quot;graphike&quot; means a picture.<br />\r\nIn the nineteenth century, graphics were based only on lines or black and white lines. Later, this art form was further improved. Contour lines, cartoons, spots, as well as the white background of the main material painted were the main artistic means of graphics. According to the design technique, the art of graphics is divided into two parts - drawing and printing graphics. The oldest and most traditional of them is painting. A pencil drawing is drawn mainly on paper and sometimes on fabric. These drawings appear in only one copy. Because some works are rich in color, they are closely related to painting: these are watercolor (watercolor, gouache, tempera) or pastel (colored pencil) paintings. Works, portraits, landscapes, etc. by graphics. It is possible to create drawings in genres. The main thing that distinguishes printing, which is another type of graphics, from drawing is that it is possible to get as many copies of printed graphics as you want. This includes paintings carved or engraved on metal, wood, stone and magnesium. Depending on the material of the graphic board, different techniques have emerged in print graphics. Engravings on metal, ie copper, drawn with a needle and then created by printing, are called etching. The graphics engraved on the stone are called lithography (&quot;lito&quot; means &quot;stone&quot; in Greek), and the graphics on the tree are called xylography (&quot;xylo&quot; means &quot;tree&quot; in Greek). The relatively later linocut is processed by digging linoleum. According to the field of graphics, book graphics (book design), research graphics (scientific tables, drawings, diagrams, maps), poster graphics, industrial graphics (postcards, invitations, clothing labels), etc. There are types like.</p>\r\n'),
(83, 1, 'Dekorativ tÉ™tbiqi sÉ™nÉ™t', '<p>Bu sÉ™nÉ™tÉ™ el arasÄ±nda &quot;xalq sÉ™nÉ™ti&quot; dÉ™ deyirlÉ™r. Bu sÉ™nÉ™tin xal&ccedil;a&ccedil;Ä±lÄ±q, batik (kÉ™laÄŸayÄ±), qobelen, dulus&ccedil;uluq (keramika), toxuma vÉ™ bÉ™dii tikmÉ™, zÉ™rgÉ™rlik, bÉ™dii ÅŸ&uuml;ÅŸÉ™, bÉ™dii oyma (aÄŸac, metal, daÅŸ, s&uuml;m&uuml;k &uuml;zÉ™rindÉ™ oyma) vÉ™ digÉ™r n&ouml;vlÉ™ri vardÄ±r. Dekorativ -tÉ™tbiqi sÉ™nÉ™t, hÉ™m&ccedil;inin bÉ™dii sÉ™nÉ™tin m&uuml;xtÉ™lif n&ouml;vlÉ™rini É™hatÉ™ edir. OnlarÄ±n arasÄ±nda d&ouml;ymÉ™ sÉ™nÉ™ti vÉ™ zÉ™rgÉ™rlik, metal &uuml;zÉ™rindÉ™ iÅŸlÉ™mÉ™lÉ™r, aÄŸac, daÅŸ vÉ™ s&uuml;m&uuml;k &uuml;zÉ™rindÉ™ oyma naxÄ±ÅŸ, xal&ccedil;a&ccedil;Ä±lÄ±q, h&ouml;rmÉ™ sÉ™nÉ™ti, ornamental toxuculuq vÉ™ basmanaxÄ±ÅŸ, toxuma vÉ™ bÉ™dii tikmÉ™lÉ™r vÉ™ bir &ccedil;ox digÉ™rlÉ™rini g&ouml;stÉ™rÉ™ bilÉ™rik. AzÉ™rbaycan xal&ccedil;a&ccedil;Ä±lÄ±q sÉ™nÉ™ti &mdash; bÉ™dii yaradÄ±cÄ±lÄ±ÄŸÄ±n xalqÄ±n mÉ™nÉ™vi hÉ™yatÄ± vÉ™ mÉ™iÅŸÉ™ti ilÉ™ sÄ±x baÄŸlÄ± &ccedil;oxÉ™srlik É™nÉ™nÉ™lÉ™ri olan É™n maraqlÄ± sÉ™nÉ™tdÉ™n biridir. AzÉ™rbaycanda QarabaÄŸ, Qazax, GÉ™ncÉ™, TÉ™briz, Åžirvan, AbÅŸeron vÉ™ Quba kimi b&ouml;y&uuml;k xal&ccedil;a&ccedil;Ä±lÄ±q mÉ™ktÉ™blÉ™ri olub. QÉ™dim sÉ™nÉ™t n&ouml;v&uuml; olub, kÉ™laÄŸayÄ± mÉ™nasÄ±nÄ± verir. KÉ™laÄŸayÄ± &mdash; ipÉ™k sapdan toxunmuÅŸ d&ouml;rdk&uuml;nc formalÄ± qadÄ±n baÅŸ &ouml;rt&uuml;y&uuml;d&uuml;r. AzÉ™rbaycanÄ±n qÉ™rb zonasÄ±nda buna &quot;&ccedil;arqat&quot; da deyilir. KÉ™laÄŸayÄ± istehsalÄ± AzÉ™rbaycanda qÉ™dimdÉ™n mÉ™lumdur. ÅžÉ™ki vÉ™ Basqal kÉ™laÄŸayÄ±larÄ± sÄ±rasÄ±nda &quot;Åžah buta&quot;, &quot;Saya buta&quot; , &quot;XÄ±rda buta&quot; &ccedil;eÅŸidlÉ™rindÉ™n daha &ccedil;ox istifadÉ™ olunub . &quot;HeyratÄ±&quot;, &quot;SoÄŸanÄ±&quot;, &quot;Ä°stiotu &quot;, &quot;AlbuxarÄ±&quot;, &quot;Abi&quot;, &quot;YelÉ™ni&quot; adlÄ± É™lvan kÉ™laÄŸayÄ±lar b&ouml;y&uuml;k ÅŸ&ouml;hrÉ™t qazanmÄ±ÅŸdÄ±.</p>\r\n'),
(83, 2, 'Decorative applied art', '<p>This art is also called &quot;folk art&quot;. This art includes carpet weaving, batik (kalagai), tapestry, pottery (ceramics), weaving and embroidery, jewelry, artistic glass, artistic carving (carving on wood, metal, stone, bone) and other types. Decorative-applied art also covers various types of art. Among them are forging and jewelry, metalwork, wood, stone and bone carving, carpet weaving, wicker, ornamental weaving and embroidery, weaving and embroidery, and many others. Azerbaijani carpet weaving is one of the most interesting arts with centuries-old traditions of artistic creation closely connected with the spiritual life and life of the people. There were large carpet-weaving schools in Azerbaijan, such as Karabakh, Gazakh, Ganja, Tabriz, Shirvan, Absheron and Guba. It is an ancient art form and means kalagai. Kalagayi is a rectangular women&#39;s headdress woven from silk thread. In the western part of Azerbaijan, it is also called &quot;chargat&quot;. The production of kalagai has long been known in Azerbaijan. &quot;Shah buta&quot;, &quot;Saya buta&quot;, &quot;Khirda buta&quot; varieties were mostly used among Sheki and Basgal kalagai. &quot;HeyratÄ±&quot;, &quot;OnanÄ±&quot;, &quot;Pepper&quot;, &quot;AlbuxarÄ±&quot;, &quot;Abi&quot;, &quot;Yeleni&quot; were very popular.</p>\r\n'),
(92, 1, 'ujkiuhy', '<p>uyyuouyo</p>\r\n'),
(92, 2, 'yuhoyo', '<p>yuoyoy</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `painter_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `painter_id`, `image`, `price`, `status`) VALUES
(2, 22, '268e0b01144607b38cec0309896893c7.png', '2500', 1),
(3, 11, '4.jpg', 'hgghj', 1),
(5, 37, '3-35629_wallpapers-hd-full-hd-outer-space-wallpaper-hd.jpg', '2500', 1),
(6, 36, '7046.jpg', '500', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales_translation`
--

DROP TABLE IF EXISTS `sales_translation`;
CREATE TABLE IF NOT EXISTS `sales_translation` (
  `sales_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `technique` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales_translation`
--

INSERT INTO `sales_translation` (`sales_id`, `lang_id`, `name`, `size`, `technique`) VALUES
(2, 1, 'ad aztyut', '25sm ytuyt', 'az texyutyu'),
(2, 2, 'ad en', '22cm', 'texnika en'),
(3, 1, 'hgjghj', 'ghjhgjgh', 'ghjghjgh'),
(3, 2, 'ghjgh', 'ghjgh', 'ghjgh'),
(5, 1, 'SatÄ±lan mÉ™hsulun adÄ±', '255 sm x 500 sm', 'texnikanÄ±n adÄ±'),
(5, 2, 'iuouio', 'ouiiuo', 'iouoiu'),
(6, 1, 'MÉ™hsulun adÄ±', '1024 sm x 2048 sm', 'texnikanÄ±n adÄ±'),
(6, 2, 'name ', '1024 cm x 2048 cm', 'technique');

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
  `gmail_link` varchar(255) DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf32 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `facebook`, `instagram`, `youtube`, `gmail`, `gmail_link`, `phone`) VALUES
(1, 'https://az-az.facebook.com/NaxcivanRessamlarBirliyi/', 'https://instagram.com/_naxcivan_ressamlar_birliyi?utm_medium=copy_link', 'https://www.youtube.com/channel/UCDz3FhqwRi2dmwkjP7SbhoQ', 'nrb.nakhchivan@gmail.com', 'https://mail.google.com/mail/u/0/#inbox?compose=CllgCKCDCjVnfwNvDvDpFlDWfrpJBqZwsBQLvjLFqMFFVNWBLjslJXvxkzhpPjbjpKNnGnFtvhg', '36 545 58 99');

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
  `address` varchar(255) DEFAULT NULL,
  `privacy_policy` text,
  `terms_of_use` text,
  `faq` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings_translation`
--

INSERT INTO `settings_translation` (`settings_id`, `lang_id`, `title`, `description`, `keywords`, `address`, `privacy_policy`, `terms_of_use`, `faq`) VALUES
(1, 1, 'RÉ™ssamlar birliyi', 'NaxÃ§Ä±van Muxtar RespublikasÄ± RÉ™ssamlar Birliyi', 'rÉ™ssamlar', 'NaxÃ§Ä±van ÅŸÉ™hÉ™ri, HeydÉ™r Æliyev kÃ¼Ã§É™si 38', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n'),
(1, 2, 'Union of artists', 'Nakhchivan Autonomous Republic Union Of Artists', 'artists', 'Nakhchivan city, Heydar Aliyev street 38', '<p><u>gizlilik LOREM LOREM LOREM EN</u></p>\r\n', '<p><em>terms</em></p>\r\n', '<p><strong>faq faq</strong></p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `painter_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `painter_id`, `image`, `status`) VALUES
(46, 0, 'main1.png', 1),
(50, 47, 'Untitled-1.jpg', 1);

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
(47, 1, 'oioggg'),
(47, 2, 'oiooioigggg'),
(46, 1, 'RÆSSAMLAR BÄ°RLÄ°YÄ°'),
(46, 2, 'UNÄ°ON OF ARTÄ°STS'),
(50, 1, 'SEÃ‡Ä°LÆN ÆSÆRLÆR'),
(50, 2, 'SELECTED WORKS');

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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `painter_id`, `work_image`, `status`) VALUES
(28, 37, '5.jpg', 1),
(32, 40, '213cc5d1-d928-4269-81a4-abd4638a6753.jpg', 1),
(33, 40, 'c3c1d1fc-b412-4138-932e-d6e79190f026.jpg', 1),
(34, 40, 'IMG_5273.jpg', 1),
(35, 40, 'IMG_5274.jpg', 1),
(36, 41, 'IMG_1270.jpg', 1),
(37, 41, 'IMG_3868.jpg', 1),
(38, 41, 'IMG_5304.jpg', 1),
(39, 41, 'IMG_5305.jpg', 1),
(40, 41, 'IMG_8333.jpg', 1),
(41, 41, 'IMG_9123.jpg', 1),
(42, 41, 'IMG-20200130-WA0070.jpg', 1),
(43, 41, 'IMG-20200130-WA0079.jpg', 1),
(44, 43, 'IMG_1286.jpg', 1),
(45, 43, 'IMG_5334.jpg', 1),
(46, 43, 'IMG_5335.jpg', 1),
(47, 44, 'IMG_5276.jpg', 1),
(48, 44, 'IMG_5277.jpg', 1),
(49, 44, 'IMG_5278.jpg', 1),
(50, 44, 'IMG_5279.jpg', 1),
(51, 44, 'IMG_5309.jpg', 1),
(52, 45, '0f75a4a5-cdec-407b-a7ba-f20a18d14e13.jpg', 1),
(53, 45, '2e5e7fd3-4644-408b-9761-93aba2f6ad41.jpg', 1),
(54, 45, '3bf95489-45f2-40eb-b3e8-bcae2442fba7.jpg', 1),
(55, 45, '8e53266f-0896-46a3-a48a-4ecf5efa5f2a.jpg', 1),
(56, 45, '14f44195-66a7-4a44-9bb1-4b99dc091425.jpg', 1),
(57, 45, '26cb9a94-7155-4749-848d-f0620062b4d4.jpg', 1),
(58, 45, '72cb10bc-f3a5-44fb-b8c2-9ef225d42333.jpg', 1),
(59, 45, '4736770e-b60d-4473-8acb-f202bdf77f89.jpg', 1),
(60, 45, 'aaec881b-bacb-4f29-8a93-b8ea8aa57175.jpg', 1),
(61, 45, 'e7f624aa-5096-4bef-abd1-fe299564a2ec.jpg', 1),
(62, 45, 'fc688db9-5ebf-4229-bf96-db136cb034f6.jpg', 1),
(63, 45, 'fd194a39-e324-4c8b-a2b6-35d817e33c1c.jpg', 1),
(64, 45, 'IMG_5296.jpg', 1),
(65, 45, 'IMG_5297.jpg', 1),
(66, 45, 'IMG_5298.jpg', 1),
(67, 45, 'IMG_5299.jpg', 1),
(68, 46, 'IMG_5271.jpg', 1),
(69, 46, 'IMG-20200130-WA0205.jpg', 1),
(70, 46, 'IMG-20200130-WA0207.jpg', 1),
(71, 46, 'IMG-20200130-WA0210.jpg', 1),
(72, 46, 'IMG-20200130-WA0215.jpg', 1),
(73, 47, 'DivanxananÄ±n  darvazasÄ± - DÉ™ri  Ã¼zÉ™rindÉ™  qrafika 1.jpg', 1),
(74, 47, 'IMG-20200828-WA0054.jpg', 1),
(75, 47, 'QÄ±z QalasÄ± - DÉ™ri  Ã¼zÉ™rindÉ™  qrafika 1.jpg', 1),
(76, 47, 'SÉ™sin  mÃ¶cÃ¼zÉ™si - DÉ™ri  Ã¼zÉ™rindÉ™  yandÄ±rma  1.jpg', 1);

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
(28, 1, 'dsfsdf'),
(28, 2, 'dsdsf'),
(32, 1, 'ÆsÉ™rin adÄ±'),
(32, 2, 'The name of the work'),
(33, 1, 'ÆsÉ™rin adÄ±'),
(33, 2, 'The name of the work'),
(34, 1, 'ÆsÉ™rin adÄ±'),
(34, 2, 'The name of the work'),
(35, 1, 'ÆsÉ™rin adÄ±'),
(35, 2, 'The name of the work'),
(36, 1, 'ÆsÉ™rin adÄ±'),
(36, 2, 'The name of the work'),
(37, 1, 'ÆsÉ™rin adÄ±'),
(37, 2, 'The name of the work'),
(38, 1, 'ÆsÉ™rin adÄ±'),
(38, 2, 'The name of the work'),
(39, 1, 'ÆsÉ™rin adÄ±'),
(39, 2, 'The name of the work'),
(40, 1, 'ÆsÉ™rin adÄ±'),
(40, 2, 'The name of the work'),
(41, 1, 'ÆsÉ™rin adÄ±'),
(41, 2, 'The name of the work'),
(42, 1, 'ÆsÉ™rin adÄ±'),
(42, 2, 'The name of the work'),
(43, 1, 'ÆsÉ™rin adÄ±'),
(43, 2, 'The name of the work'),
(44, 1, 'ÆsÉ™rin adÄ±'),
(44, 2, 'The name of the work'),
(45, 1, 'ÆsÉ™rin adÄ±'),
(45, 2, 'The name of the work'),
(46, 1, 'ÆsÉ™rin adÄ±'),
(46, 2, 'The name of the work'),
(47, 1, 'ÆsÉ™rin adÄ±'),
(47, 2, 'The name of the work'),
(48, 1, 'ÆsÉ™rin adÄ±'),
(48, 2, 'The name of the work'),
(49, 1, 'ÆsÉ™rin adÄ±'),
(49, 2, 'The name of the work'),
(50, 1, 'ÆsÉ™rin adÄ±'),
(50, 2, 'The name of the work'),
(51, 1, 'ÆsÉ™rin adÄ±'),
(51, 2, 'The name of the work'),
(52, 1, 'ÆsÉ™rin adÄ±'),
(52, 2, 'The name of the work'),
(53, 1, 'ÆsÉ™rin adÄ±'),
(53, 2, 'The name of the work'),
(54, 1, 'ÆsÉ™rin adÄ±'),
(54, 2, 'The name of the work'),
(55, 1, 'ÆsÉ™rin adÄ±'),
(55, 2, 'The name of the work'),
(56, 1, 'ÆsÉ™rin adÄ±'),
(56, 2, 'The name of the work'),
(57, 1, 'ÆsÉ™rin adÄ±'),
(57, 2, 'The name of the work'),
(58, 1, 'ÆsÉ™rin adÄ±'),
(58, 2, 'The name of the work'),
(59, 1, 'ÆsÉ™rin adÄ±'),
(59, 2, 'The name of the work'),
(60, 1, 'ÆsÉ™rin adÄ±'),
(60, 2, 'The name of the work'),
(62, 1, 'ÆsÉ™rin adÄ±'),
(62, 2, 'The name of the work'),
(61, 1, 'ÆsÉ™rin adÄ±'),
(61, 2, 'The name of the work'),
(63, 1, 'ÆsÉ™rin adÄ±'),
(63, 2, 'The name of the work'),
(64, 1, 'ÆsÉ™rin adÄ±'),
(64, 2, 'The name of the work'),
(65, 1, 'ÆsÉ™rin adÄ±'),
(65, 2, 'The name of the work'),
(66, 1, 'ÆsÉ™rin adÄ±'),
(66, 2, 'The name of the work'),
(67, 1, 'ÆsÉ™rin adÄ±'),
(67, 2, 'The name of the work'),
(68, 1, 'ÆsÉ™rin adÄ±'),
(68, 2, 'The name of the work'),
(69, 1, 'ÆsÉ™rin adÄ±'),
(69, 2, 'The name of the work'),
(70, 1, 'ÆsÉ™rin adÄ±'),
(70, 2, 'The name of the work'),
(71, 1, 'ÆsÉ™rin adÄ±'),
(71, 2, 'The name of the work'),
(72, 1, 'ÆsÉ™rin adÄ±'),
(72, 2, 'The name of the work'),
(73, 1, 'ÆsÉ™rin adÄ±'),
(73, 2, 'The name of the work'),
(74, 1, 'ÆsÉ™rin adÄ±'),
(74, 2, 'The name of the work'),
(75, 1, 'ÆsÉ™rin adÄ±'),
(75, 2, 'The name of the work'),
(76, 1, 'ÆsÉ™rin adÄ±'),
(76, 2, 'The name of the work');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
