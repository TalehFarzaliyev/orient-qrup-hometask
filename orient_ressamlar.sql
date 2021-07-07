-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 07, 2021 at 12:02 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='Menu for sites';

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
  `slug` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_translation`
--

INSERT INTO `menu_translation` (`menu_id`, `lang_id`, `name`, `slug`) VALUES
(47, 1, 'BÃ¶lmÉ™lÉ™r', 'bolmeler'),
(47, 2, 'Sections', 'sections'),
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
(64, 1, 'KÃ¶hnÉ™ afiÅŸalar', 'kohne-afisalar'),
(64, 2, 'Old posters', 'old-posters'),
(70, 2, 'Sale', 'sale'),
(70, 1, 'SatÄ±ÅŸ', 'satis'),
(74, 1, 'RÉ™sm texnikalarÄ±', 'rÉ™sm-texnikalari'),
(74, 2, 'Drawing techniques', 'drawing-techniques'),
(49, 1, 'SÉ™rÉ™ncamlar', 'serencamlar'),
(49, 2, 'Disposal', 'disposal'),
(48, 1, 'Struktur', 'struktur'),
(48, 2, 'Structure', 'structure'),
(46, 1, 'Æsas sÉ™hifÉ™', ' '),
(46, 2, 'Home page', ' '),
(75, 1, 'Birliyin profili', 'birliyin-profili'),
(75, 2, 'Association profile', 'association-profile'),
(50, 1, 'ÃœzvlÉ™r', 'uzvler'),
(50, 2, 'Members', 'members'),
(51, 1, 'GÉ™nclÉ™r bÃ¶lmÉ™si', 'gencler-bolmesi'),
(51, 2, 'Youth department', 'youth-department'),
(52, 1, 'FÉ™xri Ã¼zvlÉ™r', 'fexri-uzvler'),
(52, 2, 'Honorary members', 'honorary-members');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `painters`
--

INSERT INTO `painters` (`id`, `painter_name`, `painter_surname`, `categories`, `painter_image`, `status`) VALUES
(11, 'Metin', 'Quliyev', '55,56', '95+-Funky-Computer-4K-Wallpapers-WallpaperYou.jpg', 1),
(22, 'Puste', 'Agayeva', '55,57,58', '235506.jpg', 1),
(36, 'Ayten', 'Seyidova', '55,57,60', '7wcFi9.jpg', 1),
(37, 'Gunel', 'Mehnetli', '56,60', '4.jpg', 1);

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
(11, 1, '<p>Bu ressam haqqinda melumatdir</p>\r\n'),
(11, 2, '<p>This is information about painter</p>\r\n'),
(36, 1, '<p>eterte</p>\r\n'),
(36, 2, '<p>tryrtyr</p>\r\n'),
(37, 1, '<p>gnghnjg</p>\r\n'),
(37, 2, '<p>gfhfgnjgn</p>\r\n'),
(22, 1, '<p>melumat</p>\r\n'),
(22, 2, '<p>information</p>\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `image`, `created_date`, `category_id`, `hits`, `status`) VALUES
(5, '4WUfMQ.jpg', '2021-06-02 10:56:11', 48, 0, 1),
(8, '6aa71bd6f3444a9df44593129cce1fba.jpg', '2021-06-11 16:22:27', 67, 0, 1),
(13, 'Parallel-Universe-Wallpaper.jpg', '2021-06-11 17:49:29', 75, 0, 1),
(15, '268e0b01144607b38cec0309896893c7.png', '2021-06-12 10:12:33', 74, 0, 1),
(16, '95+-Funky-Computer-4K-Wallpapers-WallpaperYou.jpg', '2021-06-26 00:12:47', 74, 0, 1),
(17, '413607.jpg', '2021-06-26 00:13:18', 75, 0, 1),
(18, '12212.jpg', '2021-06-26 00:14:00', 74, 0, 1),
(19, '3o3vcn0.jpg', '2021-06-26 00:14:32', 69, 0, 1),
(20, '2c56685f7698b00db68846979259230a.jpg', '2021-07-07 15:45:19', 49, 0, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_gallery`
--

INSERT INTO `posts_gallery` (`id`, `post_id`, `gallery_image`) VALUES
(92, 13, '../uploads/2.jpg'),
(138, 13, '../uploads/2c56685f7698b00db68846979259230a.jpg'),
(143, 8, '../uploads/0-2505_galaxy-wallpaper-22-galaxie-fond-d-cran.jpg'),
(144, 8, '../uploads/0f959e9c31917d40344c5da33622e14a.jpg'),
(145, 8, '../uploads/2.jpg'),
(148, 15, '../uploads/95+-Funky-Computer-4K-Wallpapers-WallpaperYou.jpg'),
(151, 5, '../uploads/95+-Funky-Computer-4K-Wallpapers-WallpaperYou.jpg'),
(152, 5, '../uploads/7wcFi9.jpg'),
(153, 5, '../uploads/268e0b01144607b38cec0309896893c7.png'),
(154, 5, '../uploads/419VKu.jpg'),
(156, 5, '../uploads/7wcFi9.jpg'),
(157, 5, '../uploads/Parallel-Universe-Wallpaper.jpg'),
(158, 5, '../uploads/Earth-1920x1080-Wallpaper-Hd-Space-Wallpapers-Galaxy-.jpg'),
(159, 5, '../uploads/gtZv0Y.jpg'),
(160, 5, '../uploads/wp2078937.jpg'),
(161, 5, '../uploads/1080P-Space-Wallpapers-84+-background-pictures-.jpg'),
(162, 5, '../uploads/planet-with-rings-supernova-satellite-gas-giant.jpg'),
(163, 5, '../uploads/qgFt3J.webp'),
(164, 5, '../uploads/S2-3840x2160.jpg'),
(165, 5, '../uploads/419VKu.jpg'),
(166, 5, '../uploads/b9a5d7d68e5851cbd363044a8a2ce77d.jpg'),
(167, 8, '../uploads/3o3vcn0.jpg'),
(192, 15, 'uploaded-60d5d29385a8a1.37260876.jpg'),
(193, 15, 'uploaded-60d5d30f87a9a3.61452814.jpg'),
(194, 15, 'uploaded-60d5d53cbc28c3.92560179.jpg'),
(195, 15, 'uploaded-60d5d559399f53.58447827.jpg'),
(196, 15, 'uploaded-60d5d559496f85.64899311.jpg'),
(197, 15, 'uploaded-60d5d5594a9be4.11992486.jpg'),
(198, 15, 'uploaded-60d5d886bd6401.52616722.jpg'),
(199, 15, 'uploaded-60d5d91fd7fb82.57723366.jpg'),
(200, 13, 'uploaded-60d612ecb873d5.73614072.jpg'),
(201, 18, 'uploaded-60e55a87b7f5a8.58321577.jpg'),
(202, 18, 'uploaded-60e55a87b99077.87611247.jpg'),
(203, 18, 'uploaded-60e55a8807fe24.35633116.jpg'),
(204, 18, 'uploaded-60e55a880f26b9.10206956.jpg'),
(205, 16, 'uploaded-60e55a9e411816.69538001.jpg'),
(206, 16, 'uploaded-60e55a9e4d2f66.91382389.jpg'),
(207, 16, 'uploaded-60e55a9e640aa7.44082382.jpg'),
(208, 16, 'uploaded-60e55a9e74b915.62770107.png'),
(209, 16, 'uploaded-60e58999679b59.87292808.jpg'),
(210, 16, 'uploaded-60e589998bcb39.01991149.jpg'),
(211, 16, 'uploaded-60e58999eabf63.98387816.jpg'),
(212, 16, 'uploaded-60e5899a64f945.82193767.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts_translation`
--

DROP TABLE IF EXISTS `posts_translation`;
CREATE TABLE IF NOT EXISTS `posts_translation` (
  `post_id` int(11) DEFAULT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_translation`
--

INSERT INTO `posts_translation` (`post_id`, `lang_id`, `title`, `content`) VALUES
(15, 1, '2', '<p>fdgdf</p>\r\n'),
(15, 2, 'gfdgdf', '<p>dfgdf</p>\r\n'),
(5, 1, 'Where does it come from?', '<p>Ä°t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n'),
(5, 2, 'this is a title11', '<p>content</p>\r\n'),
(17, 1, 'Where can I get some?', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n'),
(17, 2, 'wdwcw', '<p>ewewffe</p>\r\n'),
(13, 1, 'sdfsdsdf', '<p>sdfdsf</p>\r\n'),
(13, 2, 'sdfsdf', '<p>sdfsdfs</p>\r\n'),
(18, 1, 'Where does it come from?', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n'),
(18, 2, 'wfewwe', '<p>ewfwef</p>\r\n'),
(19, 1, 'Where can I get some?', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n'),
(19, 2, 'weefew', '<p>ewfwe</p>\r\n'),
(16, 1, 'Where does it come from?', '<p>Vestibulum non laoreet diam. Vivamus bibendum, nisi sed pulvinar varius, eros velit dapibus ante, ut vulputate nisl neque sit amet neque. Phasellus rutrum in ex sit amet porttitor. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis convallis non mi nec viverra. Pellentesque ut leo tempor ipsum scelerisque aliquet. Suspendisse mi libero, luctus tristique erat vitae, cursus dignissim arcu. Duis eget ligula sed elit vestibulum tincidunt. Pellentesque tristique sem sed aliquam semper. Maecenas lacus sapien, lacinia eu venenatis quis, sagittis eu urna. Donec fringilla sit amet nisi vitae fermentum. Vivamus sodales dolor eu ligula rhoncus, quis convallis tortor pellentesque. Sed quis diam euismod leo consectetur mattis id tempor leo. Aenean non nulla at arcu ultricies congue.</p>\r\n\r\n<p>Duis vehicula scelerisque lectus auctor luctus. Nunc mattis quis mi in aliquam. Vestibulum placerat risus diam, eget sagittis quam aliquam eget. Donec non mi mi. Proin sagittis suscipit mi, a dictum neque consequat id. In hendrerit iaculis eleifend. Sed efficitur finibus vestibulum.</p>\r\n'),
(16, 2, 'edefew', '<p>eewfwe</p>\r\n'),
(8, 1, 'ghjgj', '<p>ghjgh</p>\r\n'),
(8, 2, 'ghjgjg en', '<p>ghjhgjg en</p>\r\n'),
(20, 1, 'bu bir basliqdir', '<p>gfdgfdgdfg</p>\r\n'),
(20, 2, 'this is a title11', '<p>dgdfgfg</p>\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `painter_id`, `image`, `price`, `status`) VALUES
(2, 22, '268e0b01144607b38cec0309896893c7.png', '2500', 1),
(3, 11, '4.jpg', 'hgghj', 1),
(4, 36, '32833.jpg', '255', 1),
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
(4, 1, 'ikuyoi', 'yoyuo', 'yuoyuou'),
(4, 2, 'yoyu', 'uyoyuo', 'uyoyoy'),
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
  `address` varchar(255) DEFAULT NULL,
  `privacy_policy` text,
  `terms_of_use` text,
  `faq` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings_translation`
--

INSERT INTO `settings_translation` (`settings_id`, `lang_id`, `title`, `description`, `keywords`, `address`, `privacy_policy`, `terms_of_use`, `faq`) VALUES
(1, 1, 'az titleyuiyiyui', 'az description', 'az keywords', 'NaxÃ§Ä±van ÅŸÉ™hÉ™ri, HeydÉ™r Æliyev kÃ¼Ã§É™si 38', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n'),
(1, 2, 'en title', 'en description', 'en keywords', 'en address', '<p><u>gizlilik LOREM LOREM LOREM EN</u></p>\r\n', '<p><em>terms</em></p>\r\n', '<p><strong>faq faq</strong></p>\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `painter_id`, `image`, `status`) VALUES
(41, 11, '8.jpg', 1),
(45, 36, '419VKu.jpg', 1),
(46, 0, 'main1.png', 1),
(48, 22, '6aa71bd6f3444a9df44593129cce1fba.jpg', 1),
(49, 11, '3o3vcn0.jpg', 1),
(50, 22, 'main2.jpg', 1);

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
(45, 1, 'ghhgyhghjhhj'),
(45, 2, 'ggjhgghggjg'),
(47, 1, 'oioggg'),
(47, 2, 'oiooioigggg'),
(48, 1, 'guiyiyu'),
(48, 2, 'ingilis basliq'),
(49, 1, 'ioÄ±piop'),
(49, 2, 'uipiupiu'),
(41, 1, 'basliq basliq'),
(41, 2, 'ingilis basliq'),
(46, 1, 'RÆSSAMLAR BÄ°RLÄ°YÄ°'),
(46, 2, 'UNÄ°ON OF ARTÄ°STS'),
(50, 1, 'SEÃ‡Ä°LÆN ÆSÆRLÆR'),
(50, 2, 'this is a title');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `painter_id`, `work_image`, `status`) VALUES
(9, 11, '2-3.jpg', 1),
(22, 22, '4WUfMQ.jpg', 1),
(25, 22, 'blog-img6.jpg', 1),
(26, 22, '6.jpg', 1),
(27, 22, 'blog-img3.jpg', 1),
(28, 37, '5.jpg', 1),
(29, 36, '2-6.jpg', 1),
(30, 22, '2-3.jpg', 1),
(31, 22, '2-4.jpg', 1);

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
(22, 2, 'name name name1'),
(26, 1, 'fdgf'),
(26, 2, 'fdhfh'),
(9, 1, 'eser adik'),
(9, 2, 'work namek'),
(28, 1, 'dsfsdf'),
(28, 2, 'dsdsf'),
(29, 1, 'sfdsf'),
(29, 2, 'dsfdsf'),
(27, 1, 'fdhfdh'),
(27, 2, 'dfhfdh'),
(25, 1, '22'),
(25, 2, 'dsafsd'),
(30, 1, 'scs'),
(30, 2, 'sdsd'),
(31, 1, 'sdsd'),
(31, 2, 'sdsda');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
