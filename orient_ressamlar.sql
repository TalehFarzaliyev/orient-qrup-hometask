-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 08, 2021 at 08:16 PM
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
  `slug` varchar(250) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu_translation`
--

INSERT INTO `menu_translation` (`menu_id`, `lang_id`, `name`, `slug`) VALUES
(54, 1, 'NRB kataloq', 'nrb-kataloq'),
(54, 2, 'NRB catalog', 'nrb-catalog'),
(75, 1, 'Birliyin profili', 'birliyin-profili'),
(75, 2, 'Association profile', 'association-profile'),
(62, 1, 'Arxiv', 'arxiv'),
(62, 2, 'Archive', 'archive'),
(63, 1, 'Tarixi fotolar', 'post-catalog.php?category=historical-photos'),
(63, 2, 'Historical photos', 'post-catalog.php?category=historical-photos'),
(61, 1, 'Qrafika', 'catalog.php?category=graphics'),
(61, 2, 'Graphics', 'catalog.php?category=graphics'),
(53, 1, 'Festival', 'post-list.php?category=festival'),
(53, 2, 'Festival', 'post-list.php?category=festival'),
(48, 1, 'Struktur', 'post-list.php?category=structure'),
(48, 2, 'Structure', 'post-list.php?category=structure'),
(68, 1, 'Tədbirlər', 'post-list.php?category=events'),
(68, 2, 'Events', 'post-list.php?category=events'),
(67, 1, 'Sərgilər', 'post-list.php?category=exhibitions'),
(67, 2, 'Exhibitions', 'post-list.php?category=exhibitions'),
(66, 1, 'Fəaliyyət', 'fealiyyet'),
(66, 2, 'Activities', 'activities'),
(65, 1, 'Əlaqə', 'contact.php'),
(65, 2, 'Contact', 'contact.php'),
(64, 1, 'Köhnə afişalar', 'post-catalog.php?category=old-posters'),
(64, 2, 'Old posters', 'post-catalog.php?category=old-posters'),
(60, 1, 'Köhnə ustadlar', 'catalog.php?category=old-masters'),
(60, 2, 'Old masters', 'catalog.php?category=old-masters'),
(58, 1, 'Teatr kino və TV', 'catalog.php?category=theater-cinema-and-tv'),
(58, 2, 'Theater cinema and tv', 'catalog.php?category=theater-cinema-and-tv'),
(57, 1, 'Dekorativ tətbiqi sənət', 'catalog.php?category=decorative-applied-art'),
(57, 2, 'Decorative applied art', 'catalog.php?category=decorative-applied-art'),
(56, 1, 'Heykəltəraşlıq', 'catalog.php?category=sculpture'),
(56, 2, 'Sculpture', 'catalog.php?category=sculpture'),
(55, 1, 'Rəngkarlıq', 'catalog.php?category=painting'),
(55, 2, 'Painting', 'catalog.php?category=painting'),
(52, 1, 'Fəxri üzvlər', 'catalog.php?category=honorary-members'),
(52, 2, 'Honorary members', 'catalog.php?category=honorary-members'),
(51, 1, 'Gənclər bölməsi', 'catalog.php?category=youth-department'),
(51, 2, 'Youth department', 'catalog.php?category=youth-department'),
(50, 1, 'Üzvlər', 'catalog.php?category=members'),
(50, 2, 'Members', 'catalog.php?category=members'),
(49, 1, 'Sərəncamlar', 'post-list.php?category=disposal'),
(49, 2, 'Disposal', 'post-list.php?category=disposal'),
(47, 1, 'Bölmələr', 'bolmeler'),
(47, 2, 'Sections', 'sections'),
(46, 1, 'Əsas səhifə', 'index.php'),
(46, 2, 'Home page', 'index.php'),
(59, 1, 'Sənətşünaslıq', 'catalog.php?category=study-of-art'),
(59, 2, 'Study of art', 'catalog.php?category=study-of-art'),
(74, 1, 'Rəsm texnikaları', 'resm-texnikalari'),
(74, 2, 'Drawing techniques', 'drawing-techniques'),
(69, 1, 'Elanlar', 'post-list.php?category=announcements'),
(69, 2, 'Announcements', 'post-list.php?category=announcements'),
(70, 2, 'Shop', 'shop.php'),
(70, 1, 'Satış', 'shop.php');

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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `painters`
--

INSERT INTO `painters` (`id`, `painter_name`, `painter_surname`, `categories`, `painter_image`, `status`) VALUES
(40, 'Röya', 'Abdullayeva', '51', '7deea7f5-b7d6-4559-bb93-4fbe6b3df5ca.jpg', 1),
(41, 'Xangül', 'Abdullayeva', '51', 'IMG_9006.jpg', 1),
(43, 'Nihad', 'Aslanov', '51', 'IMG_1301.jpg', 1),
(44, 'Özcan', 'Babayev', '51', '8d9f29d9-254a-4539-b5ee-71ad34c2d752.jpg', 1),
(45, 'Türkan', 'Əsədova', '51', 'IMG_0998.jpg', 1),
(46, 'Əzizə', 'Hacıyeva', '51', 'IMG-20200130-WA0206.jpg', 1),
(47, 'Ələsgər', 'Əsgərli', '57', 'Screenshot 2021-07-22 143617.png', 1),
(48, 'Ülviyyə', 'Həmzəyeva', '52', 'IMG_9444.JPG', 1),
(49, 'Telman', 'Abdinov', '52', '_DSC0022.JPG', 1),
(50, 'Məhəmmədəli', 'Ələkbərov', '52', 'mehemmedeli.jpg', 1),
(51, 'Cavid', 'İsmayılov', '52', 'cavid.jpg', 1),
(52, 'Həsən', 'Qurbanov', '52', 'hesen.jpg', 1),
(54, 'Akif', 'Həsənov', '57', 'IMG_20201008_145718.jpg', 1),
(55, 'Afət', 'Əhmədova', '57', 'IMG_20201008_145713.jpg', 1),
(56, 'Ədalət', 'İsmayılov', '57', 'IMG_20201008_145419.jpg', 1),
(57, 'Səriyyə', 'Hüseynova', '57', 'IMG_9426.JPG', 1),
(58, 'Tapdıq', 'Həmzəyev', '57', '_DSC2984.JPG', 1),
(59, 'Akif', 'Əsgərov', '56', 'akif.jpg', 1),
(60, 'Elman', 'Cəfərov', '56', 'ELman.PNG', 1),
(61, 'Emil', 'Babayev', '56', 'IMG-20200915-WA0032.jpg', 1),
(62, 'Hüseynqulu', 'Əliyev', '56', 'DSC_0013.jpg', 1),
(63, 'Əyyub', 'Hüseynov', '60', '800px-Eyyub_Huseynov.jpg', 1),
(64, 'Şamil', 'Qazıyev', '60', '260px-Şamil_Qazıyev.jpg', 1),
(65, 'Hökümə', 'Məmmədli', '61', '102705715_921964321604794_2735625267268758300_o.jpg', 1),
(66, 'Şəmsiyyə', 'Zalova', '61', '_DSC0008.jpg', 1),
(67, 'Araz', 'Xudiyev', '61', 'DSC_0389.jpg', 1),
(68, 'Arzu', 'Novruzov', '55', 'IMG_9435.JPG', 1),
(69, 'Anar', 'Əlizadə', '55', 'IMG-20200926-WA0023.jpg', 1);

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
(49, 1, '<p>ABDİNOV Telman Manaf oğlu. 01.07.1954-c&uuml; ildə Şahbuz rayonunun K&uuml;l&uuml;s kəndində anadan olmuşdur. Rəssam &ndash; qrafik. Azərbaycan Respublikasının əməkdar rəssamı (2002). Əzim Əzimzadə adına Azərbaycan D&ouml;vlət Rəssamlıq məktəbini bitirmişdir (1978). 1988-ci ildən Azərbaycan Rəssamlar İttifaqının, 2012-ci ildən isə Nax&ccedil;ıvan MR Rəssamlar Birliyinin &uuml;zv&uuml;d&uuml;r. Rəngkarlıq və qrafika janrlarında bir &ccedil;ox əsərlərin m&uuml;əllifidir. Yaradıcılığında portret janrı m&uuml;h&uuml;m yer tutur. Xalqımızın &uuml;mummilli lideri Heydər Əliyevin, Azərbaycan Respublikasının prezidenti İlham Əliyevin, oftalmoloq alim, Akademik Zərifə xanım Əliyevanın, Məhəmməd H&uuml;seyn Şəhriyarın, Xəlil Rza Ulut&uuml;rk&uuml;n, Bəhruz bəy Kəngərlinin, Əziz Şərifin, Yusif Məmmədəliyevin, Eynəli bəy Sultanovun, H&uuml;seyn Cavidin, Turan Cavidin,Əkbər xan Nax&ccedil;ıvanckinin, Kalbalı xanın, Əcəmi Nax&ccedil;ıvaninin, Nemətulla Nax&ccedil;ıvaninin, Şəhid anasının, Məhəmməd ağa Şahtaxtinskinin və digər g&ouml;rkəmli şəxsiyyətlərin portretləri emosional təsiri, rəng &ccedil;alarlarının poetik cazibəsi ilə diqqəti cəlb edir. Tematik kompozisiyalı və təbiət təsvirli əsərləri &ndash; &ldquo;Gənc qız şanapipik ilə&rdquo;, &ldquo;Həyəcan yaddaş&rdquo;, &ldquo;Bir d&ouml;vlət iki millət&rdquo;, &ldquo;Axşam qələmələri&rdquo;, &ldquo;Ay işığında nat&uuml;rmort&rdquo;, &ldquo;Dəniz&rdquo;, &ldquo;Şahbuzda qış&rdquo;, &ldquo;Terrorist g&uuml;lləsi&rdquo;, &ldquo;Goy qurşağı&rdquo;, &ldquo;Axşam&rdquo;, &ldquo;Batabat&rdquo;, &ldquo;Mənzərə&rdquo;, &ldquo;Qış&rdquo;, &ldquo;Nax&ccedil;ıvan baharı&rdquo;, &ldquo;Nax&ccedil;ıvan abidələri&rdquo; və s. Moskva, Paris, Praqa, Sankt-Peterburq, Yekaterinbuq, İstanbul, Ankara, Bodrum, Ərzurum, Qars, Tehran, Bakı, Nax&ccedil;ıvan şəhərlərində ke&ccedil;irilən sərgilərdə uğurla n&uuml;mayiş olunmuşdur. 2002, 2004, 2005, 2014, 2019-cu illərdə fədi yaradıcılıq sərgiləri ke&ccedil;irmişdir. O, 2012, 2014, 2016, 2018-ci illərdə &nbsp;Nax&ccedil;ıvan Bəşəriyyətin Beşiyi Beynəlxalq Rəsm festivalınında da fəal iştirak etmişdir. Əsərləri Heydər Əliyev Muzeyi, H&uuml;seyn Cavidin EV Muzeyi, Nax&ccedil;ıvan D&ouml;vlət Rəsm Qalereyası, Məmməd Arazın Ev Muzeyi, Ədəbiyyat Muzeyi, Cəmşid Nax&ccedil;ıvanski Muzeyi, Milli Dəyərlər Muzeyi, &ldquo;Xan Sarayı&rdquo; D&ouml;vlət Tarix &ndash; Memarlıq M&ouml;minə Xatın və A&ccedil;ıq Səma Altında Muzey Kompleksi, Şahbuz Rayonu Tarix &ndash; Diyarş&uuml;naslıq Muzeyi, Bəhruz Kəngərli Muzeyi, Cəlil Məmmədquluzadənin Ev Muzeyi, Nax&ccedil;ıvan D&ouml;vlət Tarix Muzeyi, Nax&ccedil;ıvan D&ouml;vlət Xalca Muzeyi, Xatirə Muzeyi, Yusif Məmmədəliyevin Ev Muzeyi, Şahtaxtinskilərin Muzeyi, Məmməd Tağı Sidqinin Ev Muzeyi və bir &ccedil;ox şəxsi kolleksiyalarda qorunub saxlanılır.</p>\r\n'),
(49, 2, '<p>ABDINOV Telman Manaf oglu. He was born on July 1, 1954 in Kulus village of Shahbuz region. Artist - graphic artist. Honored Artist of the Republic of Azerbaijan (2002). He graduated from the Azerbaijan State Art School named after Azim Azimzade (1978). He has been a member of the Union of Artists of Azerbaijan since 1988, and the Union of Artists of Nakhchivan AR since 2012. He is the author of many works in the genres of painting and graphics. The portrait genre plays an important role in his work. National leader of our people Heydar Aliyev, President of the Republic of Azerbaijan Ilham Aliyev, ophthalmologist, Academician Zarifa Aliyeva, Muhammad Huseyn Shahriyar, Khalil Rza Uluturk, Bahruz bey Kangarli, Aziz Sharif, Yusif Mammadaliyev, Eynali bey Sultanov, Huseyn Javid, Turan Javid, Akbar khan The portraits of Nakhchivanchi, Kalbali khan, Ajami Nakhchivani, Nematulla Nakhchivani, Shahid&#39;s mother, Mohammad agha Shahtakhtinsky and other prominent personalities attract attention with their emotional impact and poetic charm of color shades. Works with thematic composition and description of nature - &quot;Young girl with honeymoon&quot;, &quot;Exciting memory&quot;, &quot;One state, two nations&quot;, &quot;Evening pens&quot;, &quot;Still life in the moonlight&quot;, &quot;Sea&quot;, &quot;Winter in Shahbuz&quot;, &quot;Terrorist bullet&quot; , &ldquo;Goy belt&rdquo;, &ldquo;Evening&rdquo;, &ldquo;Batabat&rdquo;, &ldquo;Landscape&rdquo;, &ldquo;Winter&rdquo;, &ldquo;Nakhchivan spring&rdquo;, &ldquo;Nakhchivan monuments&rdquo; and others. It has been successfully demonstrated at exhibitions in Moscow, Paris, Prague, St. Petersburg, Yekaterinburg, Istanbul, Ankara, Bodrum, Erzurum, Kars, Tehran, Baku, Nakhchivan. He held exhibitions in 2002, 2004, 2005, 2014, 2019. He also took an active part in the Nakhchivan Cradle of Humanity International Art Festival in 2012, 2014, 2016 and 2018. Works Heydar Aliyev Museum, Huseyn Javid&#39;s House Museum, Nakhchivan State Art Gallery, Mammad Araz&#39;s House Museum, Literature Museum, Jamshid Nakhchivanski Museum, Museum of National Values, &quot;Khan Palace&quot; State Historical-Architectural Faithful Woman and Open-Air Museum Complex, History - Ethnography Museum, Bahruz Kangarli Museum, Jalil Mammadguluzadeh&#39;s House Museum, Nakhchivan State History Museum, Nakhchivan State Carpet Museum, Memorial Museum, Yusif Mammadaliyev&#39;s House Museum, Shakhtakhtinsky Museum, Mammad Tagi Sidgi&#39;s House Museum and many private collections.</p>\r\n'),
(48, 1, '<p>&Uuml;lviyyə Həmzəyeva. Azərbaycan Respublikasının Əməkdar rəssamı, Nax&ccedil;ıvan Muxtar Respublikasının Əməkdar Rəssamı, Nax&ccedil;ıvan Rəssamlar Birliyinin sədri, &quot;Yeni Era&quot; D&uuml;nya Rəssamlıq Akademiyasının həqiqi &uuml;zv&uuml;</p>\r\n'),
(48, 2, '<p>Ulviya Hamzayeva. Honored Artist of the Republic of Azerbaijan, Honored Artist of the Nakhchivan Autonomous Republic, Chairman of the Nakhchivan Artists&#39; Union, full member of the &quot;New Era&quot; World Academy of Arts</p>\r\n'),
(50, 1, '<p>Nax&ccedil;ıvan Muxtar Respublikasının əməkdar rəssamı</p>\r\n'),
(50, 2, '<p>Honored Artist of the Nakhchivan Autonomous Republic</p>\r\n'),
(51, 1, '<p>Nax&ccedil;ıvan Muxtar Respublikasının Əməkdar rəssamı</p>\r\n'),
(51, 2, '<p>Honored Artist of the Nakhchivan Autonomous Republic</p>\r\n'),
(52, 1, '<p>Azərbaycan Respublikasının Əməkdar rəssamı</p>\r\n'),
(52, 2, '<p>Honored Artist of the Republic of Azerbaijan</p>\r\n'),
(46, 1, '<p><span style=\"font-size:12px\">Hacıyeva Əzizə Telman qızı 2003-c&uuml; ildə Nax&ccedil;ıvan şəhərində anadan olmuşdur. 2009 &ndash; cu ildə Afiyəddin Cəlilov adına 12 saylı tam orta məktəbin 1-ci sinifinə daxil olmuş. Halhazırda həmin məktəbin 11-ci &nbsp;sinifində oxuyur.<br />\r\nİştirak etdiyim &nbsp;m&uuml;sabiqələr:<br />\r\n1.Azərbaycan Respublikası Mədəniyyət və turizm nazirliyi, Azərbaycan d&ouml;vlət Rəsm Qalareysı, Xətai Sənət Mərkəzi tərəfindən ke&ccedil;irilən &nbsp;&ldquo;Mənim Yay Tətilim-2017&rdquo; &nbsp;respublika uşaq rəsm m&uuml;sabiqəsinin yekun sərgisində &nbsp;iştirak etmiş və &nbsp;təltif olunub.&nbsp;<br />\r\n2.Azərbaycan Respublikası Mədəniyyət və Turizm nazirliyi, Azərbaycan Respublikası Təhsil Nazirliyi, Azərbaycan Televiziyası, Xətai Rayon İcra Hakimiyyəti, Azərbaycan Rəssamlar İttifaqı, Azərbaycan D&ouml;vlət Rəsm Qalareyası, &nbsp;Xətai Sənət Mərkəzi tərəfindən ke&ccedil;ırılən &ldquo;Mənim Yay Tətilim-2018&rdquo; &nbsp;respublika uşaq rəsm m&uuml;sabiqəsinin yekun sərgisində &nbsp;iştirak etmiş &nbsp;və &nbsp; təltif olunub.<br />\r\n3. Nax&ccedil;ıvan Şəhərində ke&ccedil;rilən &nbsp;&ldquo;Yaradıcı Gənclər Festivalı&rdquo; nda iştirak etmiş və &ldquo;Rəsm&rdquo;nominasiyası &uuml;zrə &nbsp; Nax&ccedil;ıvan şəhər Təhsil ş&ouml;bəsi tərəfindən &nbsp;təltif olunub.<br />\r\n4.Muxtar Respublika umumitəhsil məktəblərinin şagirdləri və məktəbdənkənar tərbiyə &nbsp;m&uuml;əssisələrinin dərnək &uuml;zvləri arasında &nbsp;28 May &ndash;Respublika G&uuml;n&uuml;nə həsr olunmuş &ldquo;Azərbaycan-yurdum mənim&rdquo;m&ouml;vzusunda ke&ccedil;rilən rəsm m&uuml;sabiqəsində &nbsp;iştirak etmiş və I yerə layiq g&ouml;r&uuml;l&uuml;b.<br />\r\n5.Nax&ccedil;ıvan MR &nbsp;Gənclər və İdman nazirliyi tərəfindən ke&ccedil;irilən &ldquo;Yaradıcı Gənclər Festivalı&rdquo;nda iştirak etmiş və &nbsp; &ldquo;Rəsm&rdquo;nomunasiyası &uuml;zrə III yerlə &nbsp;təltif edilib.<br />\r\n6.Nax&ccedil;ıvan Muxtar Respublikasının &nbsp;95 &nbsp;illikyubleyi ilə əlaqədar muxtar respublika &nbsp;Təhsil Nazirliyi tərəfindən umumitəhsil məktəblərinin şagirdləri arasinda ke&ccedil;irilən rəsm m&uuml;sabiqəsində &nbsp;II yerə layiq g&ouml;r&uuml;l&uuml;b.<br />\r\n7. Naxcıvan MR Təhsil nazirliyi və Rəssamlar birliyi tərəfindən ke&ccedil;irilən &nbsp;&ldquo;Milli-mənəvi dəyərlərimiz: Novruz bayramı&rdquo;m&ouml;vzusunda muxtar respublika umumitəhsil məktəblərinin şagirdləri arasında ke&ccedil;irilən rəsm m&uuml;sabiqəsində iştirak etmiş və III yerə layıq g&ouml;r&uuml;l&uuml;b.</span></p>\r\n\r\n<p><span style=\"font-size:12px\">8.Nax&ccedil;ıvan Muxtar Respublikası Gənclər Fondu və Rəssamlar Birliyiyinin birgə təşkilat&ccedil;ılığı ilə Nax&ccedil;ıvan Muxtar Respublikasının yaradılmasının &nbsp;95 illiyinə həsr olunmuş &nbsp;&ldquo;Gənc rəssamların pleneri&rdquo;adlı m&uuml;sabiqədə &nbsp;I yeri tutduğuma g&ouml;rə təltif olunub<br />\r\n9. Rəssamlar Birliyi tərəfindən ke&ccedil;rilən, Nax&ccedil;ıvan Muxtar Respublikasının &nbsp;95 &nbsp;illik &nbsp;yubleyi ilə əlaqədar &nbsp;umumitəhsil məktəblərinin şagirdləri arasinda ke&ccedil;irilən rəsm m&uuml;sabiqəsində &nbsp;II yerə layiq g&ouml;r&uuml;l&uuml;b.<br />\r\n10. Nax&ccedil;ıvan MR Təhsil Nazirliyi və Heydər Əliyev uşaq-gənclər yaradıcılıq mərkəzi tərəfindən ke&ccedil;irilən &nbsp;Nax&ccedil;ıvan Muxtar Respublikasının &nbsp;95 &nbsp;illikyubleyinə həsr olnmuş rəsm m&uuml;sabiqəsində fəal iştirakıma g&ouml;rə təltif olunub.<br />\r\n11. &nbsp;Bakı şəhəri &nbsp;&ldquo;Moolight art house&rdquo; &nbsp;dərnəyinin təşkil etdiyi &nbsp; &ldquo;Narkomaniya uşaqların g&ouml;z&uuml; ilə &rdquo; rəsm sərgisində iştirak etmişəm və diploma laiq g&ouml;r&uuml;l&uuml;b.<br />\r\n12.Heydər Əliyev adına uşaq-gənclər yaradıcılıq mərkəzinin təşkil etdiyi Bəhruz Kəngərlinin 128 illik y&uuml;bleyinə həsr olunmuş rəsm m&uuml;sabiqəsində I yerə layıq g&ouml;r&uuml;l&uuml;b.<br />\r\nNax&ccedil;ıvan MR Rəssamlar Birliyinin Gənc Rəssamlar Ş&ouml;bəsinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;ıvan MR-da ke&ccedil;irilən bir &ccedil;ox sərgi və m&uuml;sabiqələrdə iştirak etmişdir.</span></p>\r\n'),
(46, 2, '<p><span style=\"font-size:12px\">Hajiyeva Aziza Telman was born in 2003 in the city of Nakhchivan. In 2009 he entered the 1st grade of secondary school No. 12 named after Afiyaddin Jalilov. He is currently studying in the 11th grade of that school.<br />\r\nCompetitions in which I participated: Participated in and was awarded at the final exhibition of the republican children&#39;s drawing competition &quot;My Summer Holiday-2017&quot; held by the Ministry of Culture and Tourism of the Republic of Azerbaijan, Azerbaijan State Art Gallery, Khatai Art Center. Participation in the final exhibition of the republican children&#39;s art competition &quot;My Summer Holiday 2018&quot; held by the Ministry of Culture and Tourism of the Republic of Azerbaijan, the Ministry of Education of the Republic of Azerbaijan, Azerbaijan Television, Khatai District Executive Power, Azerbaijan Artists Union, Azerbaijan State Art Gallery, Khatai Art Center made and awarded. Participated in the &quot;Creative Youth Festival&quot; held in Nakhchivan and was awarded by the Nakhchivan City Education Department in the &quot;Painting&quot; nomination. Participated in the drawing competition &quot;Azerbaijan is my country&quot; dedicated to May 28 - Republic Day among students of secondary schools of the Autonomous Republic and members of the association of out-of-school educational institutions and was awarded first place. Participated in the &quot;Creative Youth Festival&quot; held by the Ministry of Youth and Sports of Nakhchivan AR and was awarded the third place in the &quot;Painting&quot; nomination.&nbsp;In connection with the 95th anniversary of the Nakhchivan Autonomous Republic, he was awarded the second place in the drawing competition held by the Ministry of Education of the Autonomous Republic among the students of secondary schools. Participated in the drawing competition among students of secondary schools of the Autonomous Republic on &quot;Our national and moral values: Novruz holiday&quot; held by the Ministry of Education and the Artists&#39; Union of Nakhchivan AR and was awarded the third place.&nbsp;&nbsp;Awarded for the first place in the competition &quot;Plein air of young artists&quot; dedicated to the 95th anniversary of the Nakhchivan Autonomous Republic, jointly organized by the Youth Foundation of the Nakhchivan Autonomous Republic and the Union of Artists&nbsp;He was awarded the second place in the drawing competition held among the students of secondary schools in connection with the 95th anniversary of the Nakhchivan Autonomous Republic, held by the Union of Artists.&nbsp;Nakhchivan AR Ministry of Education and Heydar Aliyev Children and Youth Creativity Center awarded for active participation in the drawing competition dedicated to the 95th anniversary of the Nakhchivan Autonomous Republic.&nbsp;I took part in the exhibition &quot;Drugs through the eyes of children&quot; organized by the Moolight art house in Baku and was awarded a diploma.&nbsp;He won the first place in the drawing competition dedicated to the 128th anniversary of Bahruz Kangarli, organized by the Heydar Aliyev Children and Youth Creativity Center.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</span></p>\r\n'),
(45, 1, '<p>Əsədova T&uuml;rkan İlham qızı<br />\r\n15 may 2002-ci ildə Nax&ccedil;ıvan şəhərində anadan olmuşdur.<br />\r\n2005-2019-cu illər ərzində M.T.Sidqi adına 4 n&ouml;mrəli tam orta məktəbdə təhsil almışdır.<br />\r\n2019-cu ildə Nax&ccedil;ıvan D&ouml;vlət Universitetinin İncəsənət fakultəsinin Təsviri İncəsənət &nbsp;ixtisasına qəbul olmuş və hal-hazırda həmin ixtisas &uuml;zrə təhsil alır.<br />\r\nNax&ccedil;ıvan MR Rəssamlar Birliyinin Gənc Rəssamlar Ş&ouml;bəsinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;ıvan MR-da ke&ccedil;irilən bir &ccedil;ox sərgi və m&uuml;sabiqələrdə iştirak etmişdir.</p>\r\n'),
(45, 2, '<p>She was born on May 15, 2002 in the city of Nakhchivan. From 2005 to 2019, he studied at the secondary school No. 4 named after MT Sidgi. In 2019, he was admitted to the Faculty of Fine Arts of Nakhchivan State University, majoring in Fine Arts, and is currently studying in that specialty. He is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR. He participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(44, 1, '<p>Babayev &Ouml;zcan Fərmayıl oğlu<br />\r\n14 yanvar 2003-c&uuml; ildə Şərur rayonu Tənənəm kəndində anadan olmuşdur.<br />\r\n2009-2020-ci illər ərzində Tənənəm kənd tam orta məktəbində təhsil almışdır.<br />\r\n2019-cu ildə Nax&ccedil;ıvan D&ouml;vlət Universitetinin Pedoqoji fakultəsində təhsil alır.<br />\r\nNax&ccedil;ıvan MR Rəssamlar Birliyinin Gənc Rəssamlar Ş&ouml;bəsinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;ıvan MR-da ke&ccedil;irilən bir &ccedil;ox sərgi və m&uuml;sabiqələrdə iştirak etmişdir.</p>\r\n'),
(44, 2, '<p>He was born on January 14, 2003 in Tananam village of Sharur region.<br />\r\nDuring 2009-2020, he studied at the Tananam village secondary school.<br />\r\nIn 2019, he is studying at the Pedagogical Faculty of Nakhchivan State University.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(43, 1, '<p>Aslanov Nihad Oruc oğlu<br />\r\n26 avqust 1997-ci ildə Nax&ccedil;ıvan şəhərində anadan olmuşdur.<br />\r\n2003-2014-c&uuml; illər ərzində Nax&ccedil;ıvan şəhər E.Sultanov adına 7№-li tam orta məktəbdə təhsil almışdır.<br />\r\n2018-ci ildə Nax&ccedil;ıvan D&ouml;vlət Universiteti İncəsənət fakultəsinin Təsviri incəsənət m&uuml;əllimliyi ixtisasına qəbul olmuş və hal-hazırda həmin ixtisas &uuml;zrə təhsil alır.<br />\r\nNax&ccedil;ıvan MR Rəssamlar Birliyinin Gənc Rəssamlar Ş&ouml;bəsinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;ıvan MR-da ke&ccedil;irilən bir &ccedil;ox sərgi və m&uuml;sabiqələrdə iştirak etmişdir.</p>\r\n'),
(43, 2, '<p>He was born on August 26, 1997 in the city of Nakhchivan.<br />\r\nFrom 2003 to 2014 he studied at the secondary school No. 7 named after E.Sultanov in Nakhchivan.<br />\r\nIn 2018, he was admitted to the Faculty of Fine Arts of Nakhchivan State University, majoring in Fine Arts, and is currently studying in that specialty.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(41, 1, '<p>Abdullayeva Xangul Zahar qızı&nbsp;<br />\r\n18.01.2000-ci ildə Kəngərli rayon &Ccedil;alxanqala Kəndində Anadan olub.&nbsp;<br />\r\n2006-2017-ci illərdə &Ccedil;alxanqala kənd tam orta məktəbində təhsil alıb&nbsp;<br />\r\n2017-ci ildə Naxcivan Dovlət Texniki Kollecinin Elektrik Təchizati Sőbəsinə daxil olub.<br />\r\nNax&ccedil;ıvan MR Rəssamlar Birliyinin Gənc Rəssamlar Ş&ouml;bəsinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;ıvan MR-da ke&ccedil;irilən bir &ccedil;ox sərgi və m&uuml;sabiqələrdə iştirak etmişdir.</p>\r\n'),
(41, 2, '<p>She was born on January 18, 2000 in Chalkhangala village of Kangarli region.<br />\r\nIn 2006-2017 he studied at the Chalkhangala village secondary school<br />\r\nIn 2017, he entered the Power Supply Department of Nakhchivan State Technical College.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(40, 1, '<p>Abdullayeva R&ouml;ya Pərviz qızı<br />\r\n28 iyun 2001-ci ildə Rusiya Federasiyasının Kostroma şəhərində anadan olmuşdur.<br />\r\n2007-2018-ci illər ərzində M.Seyidov adına 15 n&ouml;mrəli tam orta məktəbdə təhsil almışdır.<br />\r\n2018-ci ildə Nax&ccedil;ıvan D&ouml;vlət Universitetinin Təbiətş&uuml;naslıq və Kənd Təsərr&uuml;fatı Fak&uuml;ltəsinin Biologiya ixtisasına qəbul olmuş və hal-hazırda həmin ixtisas &uuml;zrə təhsil alır.<br />\r\nNax&ccedil;ıvan MR Rəssamlar Birliyinin Gənc Rəssamlar Ş&ouml;bəsinin &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;ıvan MR-da ke&ccedil;irilən bir &ccedil;ox sərgi və m&uuml;sabiqələrdə iştirak etmişdir.</p>\r\n'),
(40, 2, '<p>She was born on June 28, 2001 in Kostroma, Russian Federation.<br />\r\nFrom 2007 to 2018 he studied at the secondary school No. 15 named after M. Seyidov.<br />\r\nIn 2018, he was admitted to Nakhchivan State University, Faculty of Natural Sciences and Agriculture, majoring in Biology, and is currently studying in that specialty.<br />\r\nHe is a member of the Young Artists Department of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe participated in many exhibitions and competitions held in Nakhchivan AR.</p>\r\n'),
(47, 1, '<p>ƏSGƏRLİ Ələsgər Qasım oğlu (04.02.1960 Nax&ccedil;ıvan ş.) &ndash; rəssam. Bakı şəhərində rəssamlıq məktəbi reklam tərtibatı &uuml;zrə tərtibat&ccedil;ı rəssam ixtisası (1981 -1983). Nax&ccedil;ıvan şəhərində Ş&uuml;şə qablar zavodunun keramika sexində keramika&ccedil;ı rəssam (1983 - 1990). Nax&ccedil;ıvan D&ouml;vlət Rəsm Qalereyasında rəssam (1990). Ərtoğrol Cavid adına Musiqi və Bədii Sənətkarlıq Məktəbində rəsm m&uuml;əllimi (1992 - 2020). Nax&ccedil;ıvan Rəssamlar Birliyinin &uuml;zv&uuml; (2013). Nax&ccedil;ıvan MR Rəssamlar Birliyinin sərgilərində iştirak (2013-c&uuml; ildən bu g&uuml;nə kimi).</p>\r\n'),
(47, 2, '<p>ASGERLI Alasgar Gasim oglu (04.02.1960 Nakhchivan) - artist. School of Art in Baku, majoring in advertising design (1981-1983). Ceramic artist in the ceramic workshop of the Glassware Factory in Nakhchivan (1983-1990). Artist at the Nakhchivan State Art Gallery (1990). Art teacher at the Ertogrul Javid School of Music and Fine Arts (1992 - 2020). Member of Nakhchivan Artists Union (2013). Participation in exhibitions of the Union of Artists of Nakhchivan AR (since 2013).</p>\r\n'),
(54, 1, '<p>HƏSƏNOV Akif &nbsp;İsgəndər oğlu (28.06.1960 Nax&ccedil;ıvan ş.) - taxta &uuml;zərində oyma, rəssam. Sumqayıt məktəbindəki 91 n&ouml;mrəli Texniki Peşə məktəbini torna&ccedil;ı peşəsi (1980). &nbsp;Nax&ccedil;ıvan şəhərindəki elektrotexnika zavodunda işləmişdir (1981). Tokar kordinastik, prizləyici, alət&ccedil;i &ccedil;ilingər, qolvanika vəzifələrində &ccedil;alışıb. Nax&ccedil;ıvan MR Rəssamlar Birliyinin təşkil etdiyi Nax&ccedil;ıvan &ndash; 95 &ldquo;Yurdum Mənim&rdquo; m&uuml;sabiqəsində dekorativ tətbiqi sənət &nbsp;&uuml;zrə II yer qalibi (2019). Nax&ccedil;ıvan MR Rəssamlar Birliyinin sərgilərində iştirak (2011-ci ildən). Tətbiqi sənətin bir &ccedil;ox sahələrində fərdi fəaliyyət g&ouml;stərib (1989- bu g&uuml;nə kimi).</p>\r\n'),
(54, 2, '<p>HASANOV Akif Iskender oglu (28.06.1960 Nakhchivan) - wood carver, artist. Turning profession of Technical Vocational School No. 91 in Sumgayit school (1980). He worked at the electrical plant in Nakhchivan (1981). He worked as a lathe coordinator, printer, tool locksmith, and galvanic. Winner of the 2nd place in decorative-applied art in Nakhchivan-95 &ldquo;My Country&rdquo; competition organized by the Artists&#39; Union of Nakhchivan AR (2019). Participation in exhibitions of the Union of Artists of Nakhchivan AR (since 2011). He has worked individually in many fields of applied art (1989- to date).</p>\r\n'),
(55, 1, '<p>ƏHMƏDOVA Afət Qafar qızı (08.04.1973 Nax&ccedil;ıvan MR Şahbuz r. Qarababa k.) &ndash; rəssam, oyma ustası. Nax&ccedil;ıvan Tibb Kolleci (1990). T&uuml;rkiyə Respublikasına getmişdir (2004). Nax&ccedil;ıvan MR Rəssamlar Birliyinin sərgilərində iştirak (2013-c&uuml; ildən bu g&uuml;nə kimi).</p>\r\n'),
(55, 2, '<p>AHMADOVA Afet Gafar gizi (08.04.1973 Nakhchivan AR Shahbuz district Garababa village) - artist, carver. Nakhchivan Medical College (1990). Went to the Republic of Turkey (2004). Participation in exhibitions of the Union of Artists of Nakhchivan AR (from 2013 to present).</p>\r\n'),
(56, 1, '<p>İSMAYILOV Ədalət oğlu (23.04.1957 Nax&ccedil;ıvan ş). &ndash; keramika rəssamı, oyma&ccedil;ı. Bakı 84 n&ouml;mrəli texniki rəssamlıq məktəbi (1977-1979). Lenin adına rayonda rəssam işləyib (1978). Sumqayıt şəhərinə k&ouml;&ccedil;m&uuml;ş orda rəssamlıq etmişdir (1979). Almaniyanın Leyp&ccedil;ik şəhərində D&uuml;nya Xalqları sərgi salonunda iştirak edib (1980). Nax&ccedil;ıvan ş&uuml;şə qablar zavodunda keramika sexində baş rəssam (1983). Moskva şəhər &ldquo;VDENXA&rdquo; sərgi salonunda iştirak (1984). Yuqoslavyanın Azərbaycana verdiyi &ldquo;Nax&ccedil;ıvanski&rdquo; gəminin a&ccedil;ılışında əl işini hədiyyə edib (1984). Fransada ke&ccedil;irilən Azərbaycan İncəsənət g&uuml;nlərinə g&ouml;ndərdiyi &ccedil;ini g&uuml;labşan Fransanın &ldquo;Luvr&rdquo; Muzeyinə təqdim olunub (1990). T&uuml;rkiyənin Qars şəhərində ke&ccedil;miş ordu evində restorvrasiya işləri aparıb (1996). Nax&ccedil;ıvan &ndash; Culfa şəhər Dəmir yol vağzalının fasadını bərpa edib (2008). Nax&ccedil;ıvan MR Rəssamlar Birliyinin sərgilərində iştirak (2013-c&uuml; ildən bu g&uuml;nə kimi). Rəşadətli əməyə g&ouml;rə d&ouml;ş nişanı ilə təltif edilmişdir (2015). Nax&ccedil;ıvanın Əməkdar rəssamı (2019). &nbsp;Nax&ccedil;ıvan Duzdağ Hoteldə &nbsp;Duz Mzeyinin yaradıb (2018).</p>\r\n'),
(56, 2, '<p>ISMAYILOV Adalat oglu (23.04.1957 Nakhchivan). - ceramic artist, engraver. Baku Technical Art School No. 84 (1977-1979). He worked as an artist in the Lenin district (1978). He moved to Sumgayit and worked there (1979). Participated in the Exhibition Hall of the Peoples of the World in Leipzig, Germany (1980). Chief artist in the ceramics workshop of Nakhchivan glassware factory (1983). Participation in the exhibition hall &quot;VDENXA&quot; in Moscow (1984). He presented a handicraft at the opening of the ship &quot;Nakhchivanski&quot; given to Azerbaijan by Yugoslavia (1984). The porcelain rose sent to the Days of Azerbaijani Art in France was presented to the Louvre Museum in France (1990). He carried out restoration work on a former army house in the Turkish city of Kars (1996). Restored the facade of the Nakhchivan-Julfa railway station (2008). Participation in exhibitions of the Union of Artists of Nakhchivan AR (from 2013 to present). He was awarded a badge for valiant work (2015). Honored Artist of Nakhchivan (2019). He created the Salt Museum at the Nakhchivan Duzdag Hotel (2018).</p>\r\n'),
(57, 1, '<p>H&uuml;seynova Səriyyə &nbsp;Yaşar qızı (02.06.1978 Nax&ccedil;ıvan ş.) &ndash; rəssam, dekorativ tətbiqi sənət ustası. Əzim Əzimzadə adına Azərbaycan D&ouml;vlət Rəssamlıq Məktəbi (1993-1997). Nax&ccedil;ıvan D&ouml;vlət Universiteti (1997-2002). Nax&ccedil;ıvan M&uuml;əllimlər İnstitutu (2013-2016 magistr). Azərbaycan Rəssamlar İttifaqına &uuml;zv (2017). Nax&ccedil;ıvan Rəsssamlar Birliyinə &uuml;zv (2014). Nax&ccedil;ıvan D&ouml;vlət Universitetinin aspirantı. Rəşadətli əməyə g&ouml;rə nişan ilə təltif olunub (2015). 11 il Nax&ccedil;ıvan M&uuml;əllimlər İnstitutunda 22 illik isə orta məktəbdə və məktəbdən kənar m&uuml;əssisədə m&uuml;əllim vəzifəsində &ccedil;alışmışdır. Nax&ccedil;ıvan MR Rəssamlar Birliyinin sərgilərində iştirak (2014-c&uuml; ildən bu g&uuml;nə kimi).</p>\r\n'),
(57, 2, '<p>Huseynova Sariya Yashar gizi (02.06.1978 Nakhchivan) - artist, master of decorative applied art. Azerbaijan State Art School named after Azim Azimzade (1993-1997). Nakhchivan State University (1997-2002). Nakhchivan Teachers&#39; Institute (2013-2016 master). Member of the Union of Artists of Azerbaijan (2017). Member of Nakhchivan Artists Union (2014). Postgraduate student of Nakhchivan State University. He was awarded a badge for valiant work (2015). He worked as a teacher at the Nakhchivan Teachers&#39; Institute for 11 years and at a secondary school and an out-of-school institution for 22 years. Participation in exhibitions of the Union of Artists of Nakhchivan AR (from 2014 to present).</p>\r\n'),
(58, 1, '<p>1956-cı ildə Kazaxstan Respublikası Kirov vilayətinin Taldı Kurqan rayonunda anadan olmuşdur.<br />\r\n1974-c&uuml; ildə Bakı şəhərində 84 №- li İncəsənət peşə məktəbinə qəbul olmuş, orada metal &uuml;zərində d&ouml;ymə (rəssam-dekorator) peşəsinə yiyələnmişdir.<br />\r\nƏsərləri bir &ccedil;ox &ouml;kələrdə sərgilənmişdir.<br />\r\nBir sıra qarışıq və fərdi sərgilərin iştirak&ccedil;ısıdır.<br />\r\nNax&ccedil;ıvan MR Rəssamlar Birliyinin &uuml;zv&uuml;d&uuml;r.</p>\r\n'),
(58, 2, '<p>He was born in 1956 in Taldy Kurgan district of Kirov region of the Republic of Kazakhstan.<br />\r\nIn 1974, he was admitted to the 84th Art Vocational School in Baku, where he mastered the profession of metal forging (painter-decorator).<br />\r\nHis works have been exhibited in many countries.<br />\r\nHe is a participant in a number of mixed and individual exhibitions.<br />\r\nHe is a member of the Artists&#39; Union of Nakhchivan AR.</p>\r\n'),
(59, 1, '<p>ƏSGƏROV Akif İzzətulla oğlu (01.05.1940 Nax&ccedil;ıvan ş ) &ndash; heykəltaraş rəssam. Azərbaycan Respublikasının əməkdar incəsənət xadimi (2002), İncəsənət Kollecinin direktoru, &nbsp;Rəssamlıq Akademiyasının dosenti, Əzim Əzimzadə adına Bakı Rəssamlıq Məktəbinin heykəltaraşlıq fak&uuml;ltəsi (1966), İ.Repin adına Sankt-Peterburq (ke&ccedil;miş Leninqrad) Rəs&not;samlıq Akademiyasını (1968) bitirmişdir. Moskvada SSRİ Elmlər Akademiyasında &Ouml;.Eldarovun rəh&not;bərliyi ilə yaradıcılıq emalatxanasında olmuş&not;dur. Azərbaycan Rəssamlar İttifaqının &uuml;zv&uuml; (1972). &ldquo;Bulaq başında&rdquo; əsərinə g&ouml;rə SSRİ Rəssamlıq Akademiyasının diplomunu al&not;mışdır (1978). Cənubi Qafqaz Respublikaları sərgisində n&uuml;mayiş etdirilən &ldquo;Rəfiqələr&rdquo; əsərinə g&ouml;rə &ldquo;Qızıl medal&rdquo; (1982) almışdır. &ldquo;Mənim qızım&rdquo; əsəri Volqaqrad İncəsənət Muzeyində, &ldquo;H&uuml;seyn Cavid&rdquo; əsəri Tretyakov qalereyasında (1989) n&uuml;mayiş etdirilmişdir. &ldquo;Oturan qız&rdquo; (1992) ilin ən yaxşı əsəri se&ccedil;ilmişdir. Tehranda ke&ccedil;irilən Azərbaycan rəssamlarının sərgisində &ldquo;D&uuml;ş&uuml;ncələrə dalan qız&rdquo; əsəri (1994), Fransada &uuml;mumi sərgidə &ldquo;Xal&ccedil;a &uuml;st&uuml;ndə oğlanlar&rdquo;, &ldquo;&Ccedil;ılpaq&rdquo;, &ldquo;Ayaq &uuml;stə duran qız&rdquo; (1994) əsərləri, İranın Urmiya şəhərindəki sərgisində &ldquo;Həlak olanların abidəsi&rdquo; (1996), T&uuml;rkiyə sərgisində &ldquo;Balerina&rdquo;, &ldquo;Səhnə&rdquo; əsərləri (1996) n&uuml;mayiş etdirilmişdir. &ldquo;Ən yaxşı memarlıq əsərləri&rdquo; m&uuml;sabiqəsində &ldquo;akademik Y.Məmmədəliyev abi&not;dəsi&rdquo; əsərinin layihəsinə g&ouml;rə &ldquo;Beynəlxalq ba&not;xış&rdquo; diplomuna layiq g&ouml;r&uuml;lm&uuml;şd&uuml;r (1998). Akademik Y.Məmmədəliyevin, Azərbaycan xalq artisti Şəmsi Bədəlbəylinin qəbir&uuml;st&uuml; abidələ&not;rini hazırlamışdır (2004).&nbsp;</p>\r\n'),
(59, 2, '<p>ASGAROV Akif Izzatulla oglu (01.05.1940 Nakhchivan) - sculptor artist. Honored Art Worker of the Republic of Azerbaijan (2002), Director of the College of Arts, Associate Professor of the Academy of Arts, Graduated from the Sculpture Faculty of the Baku Art School named after Azim Azimzade (1966), St. Petersburg Academy of Arts named after I. Repin (former Leningrad) (1968). In Moscow, he visited the creative workshop at the USSR Academy of Sciences under the leadership of O. Eldarov. Member of the Union of Artists of Azerbaijan (1972). He received a diploma from the USSR Academy of Arts for his work &quot;At the spring&quot; (1978). She received the Gold Medal (1982) for her work &quot;Friends&quot; displayed at the exhibition of the South Caucasus Republics. &quot;My daughter&quot; was exhibited at the Volgograd Museum of Art, &quot;Huseyn Javid&quot; at the Tretyakov Gallery (1989). &quot;Sitting Girl&quot; (1992) was named the best work of the year. &quot;Girl on the Thought&quot; at the exhibition of Azerbaijani artists in Tehran (1994), &quot;Boys on the carpet&quot;, &quot;Naked&quot;, &quot;Girl on foot&quot; (1994) at the general exhibition in France, &quot;Monument to the Dead&quot; at the exhibition in Urmia, Iran (1996) ), &quot;Ballerina&quot;, &quot;Stage&quot; works (1996) were demonstrated at the Turkish exhibition. In the competition &quot;The best architectural works&quot; he was awarded the diploma &quot;International Vision&quot; for the project &quot;Monument to academician Y. Mammadaliyev&quot; (1998). He prepared tombstones of academician Y. Mammadaliyev, People&#39;s Artist of Azerbaijan Shamsi Badalbeyli (2004).</p>\r\n'),
(60, 1, '<p>1951 Nax&ccedil;ıvan<br />\r\nHeykəltəraş &ndash;rəssam<br />\r\nElman Məhərrəm oğlu Cəfərov Əzim Əzimzadə adına Azərbaycan D&ouml;vlət Rəssamlıq Məktəbində (1968-1972) və Mirzə Ağa Əliyev adına Azərbaycan D&ouml;vlət İncəsənət İnstitutunun Rəssamlıq fak&uuml;ltəsində (1975-1980) təhsil almışdır. Monumetal heykəltaraşlıq, rəngkarlıq və dəzgah qrafikasının m&uuml;xtəlif janrlarında işləyir. &ldquo;Babək&rdquo;in atlı heykəli (Nax&ccedil;ıvan ş. ), &ldquo;Babək&rdquo;in tək fiqurlu heykəli ( Babək r.), &ldquo;Dədə Qurqud&rdquo;un manumental heykəli (Nax&ccedil;ıvan ş.), &ldquo;M.H.Şəhriyar&rdquo;ın manumental heykəl (İran İslam Respublikasının Poldəş ş) &ldquo;İdris Məmmədov&rdquo;un baralyefi (Nax&ccedil;ıvan ş.) və s. heykəllərinin m&uuml;əllifidir. Onun &ldquo;Şah İsmayıl Xətai&rdquo;, &ldquo;Mirzə Ələkbər Sabir&rdquo;, &ldquo;M&uuml;sl&uuml;m Moqamayev&rdquo;, &ldquo;H&uuml;seyn Cavid&rdquo;, &ldquo;Babək&rdquo; adlı portretləri, &ldquo;Vətənə&rdquo;, &ldquo;Novruz bayramı Sona b&uuml;lb&uuml;llər&rdquo;, &ldquo;Duz mədənində&rdquo;, &ldquo;Misgər&rdquo;, &ldquo;Taxıl pi&ccedil;imi&rdquo; &ldquo;&Ccedil;arıx tikənlər&rdquo;kompozisiyaları və &ldquo;Sabah &ccedil;ağı&rdquo;, &ldquo;&Uuml;z&uuml;m bağları&rdquo;, &ldquo;&Uuml;z&uuml;m yığımı&rdquo;, &ldquo;Nax&ccedil;ıvan mənzərəsi&rdquo;, &ldquo;Xudafərin k&ouml;rp&uuml;s&uuml;&rdquo; kimi mənzərələri tamaşa&ccedil;ıların rəğbətini qazanmışdşr. &Uuml;mumittifaq və Respublikada ke&ccedil;irilən sərgilərinin fəal iştirak&ccedil;ısı olmuşdur. Bir &ccedil;ox kitab iliustrasiyaların m&uuml;əllifidir.<br />\r\nƏsərləri: Nax&ccedil;ıvan D&ouml;vlət Rəsm Qalereyası, Nax&ccedil;ıvan D&ouml;vlət Tarix Muzeyi,H&uuml;seyn Cavidin ev Muzeyi, Cəmşid Nax&ccedil;ıvanskinin ev Muzeyi və Babək Rayon Tarix-Diyarş&uuml;naslıq Muzeyində saxlanılır<br />\r\nElman Cəfərov SSRİ rəssamlar ittifaqının Gənclər B&ouml;lməsinin &uuml;zv&uuml; (1980). Azərbaycan Rəssamlar İttifaqının &uuml;zv&uuml; (1988). Nax&ccedil;ıvan MR Əməkdar İncəsənət Xadimi (1989). Nax&ccedil;ıvan MR Rəssamlar Birliyinin &uuml;zv&uuml; (2012)</p>\r\n'),
(60, 2, '<p>1951 Nakhchivan<br />\r\nSculptor-artist<br />\r\nElman Maharram oglu Jafarov studied at the Azerbaijan State Art School named after Azim Azimzade (1968-1972) and at the Art Faculty of the Azerbaijan State Institute of Arts named after Mirza Aga Aliyev (1975-1980). Works in various genres of monumental sculpture, painting and bench graphics. Equestrian statue of &ldquo;Babek&rdquo; (Nakhchivan), single-figure statue of &ldquo;Babek&rdquo; (Babek district), monumental statue of &ldquo;Dada Gurgud&rdquo; (Nakhchivan city), monumental statue of &ldquo;MHShahriyar&rdquo; (Poldash of the Islamic Republic of Iran) sh) Bas-relief of &quot;Idris Mammadov&quot; (Nakhchivan) and others. is the author of his sculptures. His portraits &quot;Shah Ismail Khatai&quot;, &quot;Mirza Alakbar Sabir&quot;, &quot;Muslim Mogamayev&quot;, &quot;Huseyn Javid&quot;, &quot;Babek&quot;, &quot;Homeland&quot;, &quot;Novruz holiday Sona nightingales&quot;, &quot;Salt mine&quot;, &quot;Copper&quot;, The compositions &ldquo;Grain-cutter&rdquo;, &ldquo;Wheel-makers&rdquo; and such scenes as &ldquo;Morning age&rdquo;, &ldquo;Vineyards&rdquo;, &ldquo;Grape harvest&rdquo;, &ldquo;Nakhchivan landscape&rdquo;, &ldquo;Khudaferin bridge&rdquo; won the sympathy of the spectators. He was an active participant in exhibitions held in the All-Union and the Republic. He is the author of many books and illustrations.<br />\r\nWorks: Nakhchivan State Art Gallery, Nakhchivan State History Museum, Huseyn Javid&#39;s House Museum, Jamshid Nakhchivanski&#39;s House Museum and Babek District History and Ethnography Museum<br />\r\nElman Jafarov Member of the Youth Department of the USSR Union of Artists (1980). Member of the Union of Artists of Azerbaijan (1988). Honored Art Worker of Nakhchivan AR (1989). Member of the Artists&#39; Union of Nakhchivan AR (2012)</p>\r\n'),
(61, 1, '<p>BABAYEV Emil Baba oğlu &ndash; (28.07.1968 Nax&ccedil;ıvan ş.) &ndash; heykəltaraş. Əzim Əzimzadə adına Azərbaycan D&ouml;vlət Rəssamlıq Məktəbi, heykəltaraşlıq fak&uuml;ltəsi (1983-1987). Azərbaycan Rəssamlar İttifaqına &uuml;zv (2005). T&uuml;rkiyə, Almaniya, İngiltərə, Polşa və s. &ouml;lkələrdə yaradıcılıq sərgilərinin iştirak&ccedil;ısı.</p>\r\n'),
(61, 2, '<p>BABAYEV Emil Baba oglu - (28.07.1968 Nakhchivan) - sculptor. Azerbaijan State School of Art named after Azim Azimzade, Faculty of Sculpture (1983-1987). Member of the Union of Artists of Azerbaijan (2005). Turkey, Germany, England, Poland, etc. participant of creative exhibitions in countries.</p>\r\n'),
(62, 1, '<p>1949-cu ildə Ordubad rayonu Bist kəndində anadan olmuşdur.<br />\r\nBist kənd orta məktəbində təhsil almışdır.<br />\r\n1971-75-ci illərdə Əzim Əzimzadə adına rəssamlıq məktəbində təhsil almışdır. 1977-82-ci illərdə Azərbaycan D&ouml;vlət İncəsənət İnstitutunun Rəssamlıq Fakultəsini fərqlənmə diplomu ilə bitirmişdir.<br />\r\n1982-89-cu illərdə Nax&ccedil;ıvan D&ouml;vlət Rəsm Qalareyasında Fond m&uuml;diri, 1989-2019-cu illərdə C.Məmmədquluzadə adına Nax&ccedil;ıvan D&ouml;vlət Musiqili Dram Teatrının Baş rəssamı olmuşdur.<br />\r\n2000-2011-ci illərdə Nax&ccedil;ıvan Rəssamlar Birliyinin sədri olmuşdur.<br />\r\n2003-2019-cu illərdə Nax&ccedil;ıvan D&ouml;vlət Universitetində Təsviri sənət kafedrasının m&uuml;diri haliyədə isə həmin kafedranın professorudur.<br />\r\n1988-ci ildə Nax&ccedil;ıvan Muxtar Respublikasının Əməkdar incəsənət xadimi adına layiq g&ouml;r&uuml;lm&uuml;şd&uuml;r.<br />\r\n1999-cu ildə Azərbaycanın Əməkdar rəssamı, 2002-ci ildə Xalq rəssamı fəxri adına layiq g&ouml;r&uuml;lm&uuml;şd&uuml;r.<br />\r\n2008-ci ildə Dosent elmi adını, 2017-ci ildə isə Professor elmi adı almışdır.<br />\r\n1986-cı ildən Azərbaycan Rəssamlar İttifaqı, 2000-ci ildən Azərbaycan Teatr Xadimləri İttifaqının &uuml;zv&uuml;d&uuml;r.<br />\r\nƏzim Əzimzadə adına Rəssamlıq məktəbini bitirdikdən sonra Respublika, &Uuml;mumittifaq və Beynəlxalq sərgilərdə iştirak etmişdir.<br />\r\n&Ouml;lkəmizdə və xarici &ouml;lkə muzeylərində rəngkarlıq, qrafika və karikatura əsərləri saxlanılır.<br />\r\nNax&ccedil;ıvanda &ldquo;Koroğlu&rdquo;, &ldquo;Ana&rdquo;,&ldquo;Diskatan&rdquo;, &ldquo;B.Kəngərli&rdquo;, və &ccedil;oxlu şəhid abidələrinin m&uuml;əllifidir.</p>\r\n'),
(62, 2, '<p>He was born in 1949 in Bist village of Ordubad region.<br />\r\nHe studied at Bist village secondary school.<br />\r\nIn 1971-75 he studied at the art school named after Azim Azimzade. In 1977-82 he graduated with honors from the Art Faculty of the Azerbaijan State Institute of Arts.<br />\r\nIn 1982-89 he was the director of the Foundation at the Nakhchivan State Art Gallery, in 1989-2019 he was the chief artist of the Nakhchivan State Musical Drama Theater named after J. Mammadguluzade.<br />\r\nIn 2000-2011 he was the chairman of the Nakhchivan Artists&#39; Union.<br />\r\nIn 2003-2019, the head of the Department of Fine Arts at Nakhchivan State University is still a professor of the same department.<br />\r\nIn 1988 he was awarded the title of Honored Art Worker of the Nakhchivan Autonomous Republic.<br />\r\nIn 1999 he was awarded the title of Honored Artist of Azerbaijan, in 2002 - People&#39;s Artist.<br />\r\nIn 2008 he was awarded the title of Associate Professor, and in 2017 he was awarded the title of Professor.<br />\r\nHe has been a member of the Union of Artists of Azerbaijan since 1986 and the Union of Theater Figures of Azerbaijan since 2000.<br />\r\nAfter graduating from the Art School named after Azim Azimzade, he participated in the Republican, All-Union and International exhibitions.<br />\r\nPaintings, graphics and cartoons are kept in our country and foreign museums.<br />\r\nHe is the author of &quot;Koroglu&quot;, &quot;Ana&quot;, &quot;Diskatan&quot;, &quot;B.Kangarli&quot; and many martyrs&#39; monuments in Nakhchivan.</p>\r\n'),
(63, 1, '<p>H&Uuml;SEYNOV Əyyub M&uuml;seyib oğlu (03.09.1916 Kəngərli r. Xok k.- 17.04.1998, Bakı) - boyakar. Azərbaycan Respublikası əməkdar incə&not;sənət xadimi (1980). Azərbaycan Rəssamlıq Tex&not;nikumunu (1935) və Tbilisi Rəssamlıq Akademiyasını (1941) bitirmişdir. 1948-1998 il&not;lərdə Əzim Əzimzadə adına Azərbaycan D&ouml;vlət Rəs&not;samlıq Məktəbində (indiki Rəssamlıq Akademiyası) dərs demişdir (1956-1965 illərdə direktor). Məişət janrında və əmək m&ouml;vzu&not;sunda tabloların (&ldquo;Nax&ccedil;ıvan duz mədənin&not;də&rdquo;, 1947; &ldquo;Yaylaqda. Axşam &ccedil;ağı&rdquo;, 1982), mənzərələrin (&ldquo;Şahbuz &ccedil;ayının mənzərəsi&rdquo;, 1957; &ldquo;Yağışdan sonra&rdquo;, 1972; &ldquo;Neft daşları&rdquo;, 1979), s&uuml;jetli (&ldquo;Araz vadisində&rdquo;, 1984; &ldquo;Sər&not;həddə&rdquo;, 1985) və tarixi-inqilabi kompozisiya&not;ların, eləcə də portretlərin m&uuml;əllifidir.</p>\r\n'),
(63, 2, '<p>HUSEYNOV Eyyub Museyib oglu (03.09.1916 Kangarli district, Khok village - 17.04.1998, Baku) - painter. Honored Art Worker of the Republic of Azerbaijan (1980). He graduated from the Azerbaijan Art College (1935) and the Tbilisi Academy of Arts (1941). In 1948-1998 he taught at the Azerbaijan State Art School named after Azim Azimzade (now the Academy of Arts) (director in 1956-1965). Paintings on the theme of domestic genre and labor (&quot;Nakhchivan in the salt mine&quot;, 1947; &quot;On the plateau. Evening&quot;, 1982), landscapes (&quot;Landscape of Shahbuz river&quot;, 1957; &quot;After the rain&quot;, 1972; &quot;Oil stones&quot; , 1979), plot (&quot;In the Araz Valley&quot;, 1984; &quot;On the Border&quot;, 1985) and the author of historical-revolutionary compositions, as well as portraits.</p>\r\n'),
(64, 1, '<p>QAZIYEV Şamil Həsən oğlu (30.03.1908, İrə&not;van - 13.07.1980, Bakı) - rəssam. Əməkdar in&not;cəsənət xadimi (1944). Bakı Rəssamlıq Mək&not;təbini bitirmişdir (1929). Nax&ccedil;ıvan Pedaqoji Texnikumunda m&uuml;əllim (1929-1932), &ldquo;Kom&not;munist&rdquo; (Bakı) qəzetində rəssam (1932-1934) işləmişdir. 1934 ildən &ldquo;Şərq qapısı&rdquo; qəzetinin baş rəssamı, eyni zamanda C.Məmmədqulu&not;zadə ad. Nax&ccedil;ıvan Musiqili Dram Teatrının baş rəssamı (1934-1948) olmuş, burada 120-dən &ccedil;ox tamaşaya (&ldquo;Şeyx Sənan&rdquo;, H.Cavid; &ldquo;Ley&not;li və Məcnun&rdquo;, &Uuml;.Hacıbəyov; &ldquo;Aydın&rdquo;, &ldquo;Od gəlini&rdquo;, C.Cabbarlı; &ldquo;Vaqif&rsquo;, &ldquo;Fərhad və Şi&not;rin&rdquo;, S.Vurğun; &ldquo;Qa&ccedil;aq Nəbi&rdquo;, S.R&uuml;stəm; &ldquo;Həyat&rdquo;, M. İbrahimov; &ldquo;Otello&rdquo;, &ldquo;Hamlet&rdquo;, U.Şekspir və s.) bədii tərtibat vermişdir. SSRİ Rəssamlar İttifaqının &uuml;zv&uuml; idi (1940 il&not;dən). 1940-1941 illərdə Nax&ccedil;ıvan Rəssamlıq Məktəbinin direktoru olmuşdur. 1948 ildən &ouml;mr&uuml;n&uuml;n sonunadək &ldquo;Azərbaycan gəncləri&rdquo; qəzetində rəssam işləmişdir. Qrafik əsərlərin, et&uuml;d, nat&uuml;rmort, portret və s. əsərlərin m&uuml;əlli&not;fidir. Onun &ldquo;&Ccedil;oban&rdquo; portreti Tretyakov qale&not;reyasında (Moskva) saxlanılır (1931; SSRİ rəssamlarının 1931 ildə Tiflisdə ke&ccedil;irilən səyyar sərgisində n&uuml;mayiş etdirilmişdir) . Yaradıcılığnda Nax&ccedil;ıvanın tarixi, təbiəti, həyat və məi&not;şəti ilə bağlı əsərlər əsas yer tutur (&ldquo;K&ouml;hnə Nax&ccedil;ıvan&rdquo;, &ldquo;Əlincəqala&rdquo;, &ldquo;Qa&ccedil;qınlar&rdquo;, &ldquo;Xıncov məhəlləsi&rdquo;, &ldquo;Beş qardaş dağı&rdquo;, &ldquo;&Ccedil;&ouml;rəkbi-şirənlər&rdquo;, &ldquo;Qalay&ccedil;ılar&rdquo;, &ldquo;Hamam&rdquo;, &ldquo;&Ccedil;arıq ti&not;kənlər&rdquo;, &ldquo;Nalbənd&rdquo; və s.). Əsərlərinin &ccedil;oxu Nax&ccedil;ıvan D&ouml;vlət Tarix Muzeyində saxlanılır. Nax&ccedil;ıvanda fərdi sərgisi ke&ccedil;irilmişdir (1978).</p>\r\n'),
(64, 2, '<p>GAZIYEV Shamil Hasan oglu (March 30, 1908, Yerevan - July 13, 1980, Baku) - artist. Honored Art Worker (1944). He graduated from the Baku Art School (1929). He worked as a teacher at the Nakhchivan Pedagogical College (1929-1932) and an artist at the &quot;Communist&quot; (Baku) newspaper (1932-1934). Since 1934, he has been the chief artist of the Sharq Qapisi newspaper, as well as J. Mammadguluzadeh. He was the chief artist of the Nakhchivan Musical Drama Theater (1934-1948), where he performed more than 120 performances (&quot;Sheikh Sanan&quot;, H.Javid; &quot;Leyli and Majnun&quot;, U.Hajibeyov; &quot;Aydin&quot;, &quot;Bride of Fire&quot;, J. Jabbarli; &quot;Vagif&quot;, &quot;Farhad and Shirin&quot;, S. Vurgun; &quot;Fugitive Nabi&quot;, S. Rustam; &quot;Life&quot;, M. Ibrahimov; &quot;Othello&quot;, &quot;Hamlet&quot;, U. Shakespeare and others. .) gave an artistic design. He was a member of the USSR Artists&#39; Union (since 1940). In 1940-1941 he was the director of Nakhchivan Art School. From 1948 to the end of his life he worked as an artist in the &quot;Azerbaijan Youth&quot; newspaper. Graphic works, studies, still lifes, portraits, etc. He is the author of works. His portrait of the &quot;Shepherd&quot; is kept in the Tretyakov Gallery (Moscow) (1931; exhibited at a traveling exhibition of Soviet artists in Tbilissi (Georgia) in 1931). Works related to the history, nature, life and way of life of Nakhchivan occupy a central place in his work (&ldquo;Old Nakhchivan&rdquo;, &ldquo;Alinjagala&rdquo;, &ldquo;Refugees&rdquo;, &ldquo;Khinjov neighborhood&rdquo;, &ldquo;Five brothers mountain&rdquo;, &ldquo;Bread-jurors&rdquo;, &ldquo;Tin-makers&rdquo; &quot;,&quot; Bath &quot;,&quot; Shoes &quot;,&quot; Nalband &quot;, etc.). Most of his works are kept in the Nakhchivan State History Museum. A solo exhibition was held in Nakhchivan (1978).</p>\r\n'),
(65, 1, '<p>MƏMMƏDLİ H&ouml;k&uuml;mə Əsgər qızı (12.03.1975 Nax&ccedil;ıvan ş) &ndash; rəssam. Əzim Əzimzadə adına Azərbaycan Rəssamlıq Texnikumun dekorativ tədbiqi &nbsp;sənət fakultəsi (1994-1997). Nax&ccedil;ıvan D&ouml;vlət Universitetinin Təsviri İncəsənət və Rəsm m&uuml;əllimliyi fakultəsi (2003-2007). Nax&ccedil;ıvan D&ouml;vlət Rəsm Qalereyasının direktor vəzifəsi (2016). Nax&ccedil;ıvan MR Rəssamlar Birliyinin &uuml;zv&uuml; (2014). Nax&ccedil;ıvan MR Rəssamlar Birliyinin təşkil etdiyi Nax&ccedil;ıvan &ndash; 95 &ldquo;Yurdum Mənim&rdquo; m&uuml;sabiqəsində qrafika &uuml;zrə II yer qalibi (2019). Nax&ccedil;ıvan MR Rəssamlar Birliyinin sərgilərində iştirak (2001-ci ildən bu g&uuml;nə kimi).</p>\r\n'),
(65, 2, '<p>MAMMADLI Hokuma Asgar gizi (March 12, 1975 in Nakhchivan) - artist. Faculty of Decorative and Applied Arts of Azerbaijan Art College named after Azim Azimzade (1994-1997). Faculty of Fine Arts and Painting, Nakhchivan State University (2003-2007). Director of Nakhchivan State Art Gallery (2016). Member of the Artists&#39; Union of Nakhchivan AR (2014). Winner of the second place in graphics in the competition &quot;Nakhchivan - 95 My Country&quot; organized by the Union of Artists of Nakhchivan AR (2019). Participation in exhibitions of the Union of Artists of Nakhchivan AR (since 2001).</p>\r\n'),
(66, 1, '<p>Şəmsiyyə Zalova</p>\r\n'),
(66, 2, '<p>Şəmsiyyə Zalova</p>\r\n'),
(67, 1, '<p>Araz Xudiyev</p>\r\n'),
(67, 2, '<p>Araz Xudiyev</p>\r\n'),
(68, 1, '<p>NOVRUZOV Arzu Zakir (26.06.1986 &nbsp;Nax&ccedil;ıvan ş) &ndash;rəssam. Nax&ccedil;ıvan D&ouml;vlət Universitetinin İncəsənət fak&uuml;ltəsinin Təsviri İncəsənət və rəsmxət ixtisası ( 2005-2008). Azərbaycan Rəssamlar İttifaqının &uuml;zv&uuml; (2011). Nax&ccedil;ıvan MR Rəssamlar Biriyinin &uuml;zv&uuml; (2012). Nax&ccedil;ıvan Muxtar Respublikası D&ouml;vlət Televiziya və Radio verlişləri Komitəsində baş rəssam (2009), Məhəmməd Tağı Sidqi adına Nax&ccedil;ıvan D&ouml;vlət Kukla Teatrında rəssam (2009). Prezident təqa&uuml;d&uuml;nə laiq g&ouml;r&uuml;l&uuml;b (2012-2014). İran İslam Respublikasının Urmiya şəhərində 14 Beynəlxalq rəsm festivalında iştirak (2007). İran İslam respublikasında Beynəlxalq konfransda iştirak (2007). Polşada Rembrandt Van Rijna &nbsp;həsr olunmuş sərgidə iştirak (2007). Nax&ccedil;ıvan Gənclər və İdman Nazirliyi tərəfindənke&ccedil;irilən tədbirlərdə &ldquo;İlin gənc, fəal rəssamı (2010, 2011, 2013). Bakı şəhərində Azərbaycanın İstedadlı və yaradıcı gənclərin II Respublika toplantısında iştirak (2012). Nax&ccedil;ıvan MR Rəssamlar Birliyinin təşkil etdiyi sərgilərdə iştirak (2012- ci ildən bu g&uuml;nə kimi). Azərbaycan rəssamlarının Bakı şəhərində qurultayında iştirak (2013). ADEX Beynəlxalq M&uuml;dafiə Sənayesi və Beynəlxalq S&uuml;lh &ccedil;ər&ccedil;ivəsində ke&ccedil;irilən forumda iştirak (2014). Nax&ccedil;ıvan Qalada ke&ccedil;irilən &Uuml;mummilli Lider Heydər Əliyevin anadan olmasını 93-c&uuml; il d&ouml;n&uuml;m&uuml;nə həsr olunmuş &ldquo;Yaradıcı əllər festivalının qalibi (2016). T&uuml;rkiyənin Mersin şəhərində II Beynəlxalq &nbsp;rəsm festivalında iştirak (2016). Nax&ccedil;ıvan Muxtar Respublikası Ali Məclisinin Sədri Yanında Bilik Fondu &ldquo;Nax&ccedil;ıvan: d&uuml;nən və bug&uuml;n&rdquo; yaradıcılıq m&uuml;sabiqəsində iştirakına g&ouml;rə rəsm əsəri ilə rejissor kimi film &uuml;zrə qalib (2016). Gənclər g&uuml;n&uuml; m&uuml;nasibəti ilə tədbirdə ilin ən gənc &nbsp;fəal rəssamı və rejissoru (2017). Adanada Uluslararası T&uuml;rkd&uuml;nyası Rəsm Festivalının iştirak&ccedil;ısı (2018). Nax&ccedil;ıvan MR Rəssamlar Birliyinin təşkil etdiyi Nax&ccedil;ıvan Bəşəriyyətin Beşiyi Rəsm festivalının iştirak&ccedil;ısı (2012, 2014, 2016, 2018). T&uuml;rkiyə Fethiyə Beynəlxalq ilk sualtı rəsm Festivalında iştirak (2018). T&uuml;rkiyə Respublikasının Ərzurum şəhərində Azərbaycan Xalq C&uuml;mhuriyyətinin yaranmasının 101 illiyi, Nax&ccedil;ıvan Muxtar Respublikasının yaradılmasının 95-ci ild&ouml;n&uuml;m&uuml;, Milli Qurtuluş g&uuml;n&uuml; m&uuml;nasibətilə tədbirlərin iştirak&ccedil;ısı (2019). BAKU EXPO CENTER rəsm əsəri sərgilənmişdir (2019). Nax&ccedil;ıvan MR Rəssamlar Birliyinin təşkil etdiyi Nax&ccedil;ıvan &ndash; 95 &ldquo;Yurdum Mənim&rdquo; m&uuml;sabiqəsində qrafika &uuml;zrə III yer qalibi (2019). T&uuml;rkiyə Fethiyə II &ldquo;Dənizlərimiz və Rənglərimiz&quot; Beynəlxalq Rəsm Festivalında &nbsp;iştirak (2019). Onun əsərləri Amerika, Almaniya, Rumuniya, Rusiya, T&uuml;rkiyə, İtaliya, İran, Polşada n&uuml;mayiş &nbsp;olunmuşdur. Əsərləri &nbsp;Nax&ccedil;ıvan D&ouml;vlət Rəsm Qalereyasında və şəxsi kolleksiyalarda saxlanılır. Əsəri Kazım Qarabəkir paşa Muzeyinə hədiyyə edilmişdir (2017). Quruluşcu Rejissor olduğu sənədli filmlər Baba &nbsp;Nemətullah Nax&ccedil;ıvaniyə həsr olunmuş &nbsp;olunmuş &ldquo;Təsvir alimi&rdquo; digəri isə Bəhruz Kəngərliyə həsr olunmuş &ldquo;Yarım&ccedil;ıq şəkildir&rdquo;. &nbsp;Həm&ccedil;inin Ərtoğrul Cavid, Şəmil Qazıyev, Mirzə Vahab Həsənzadə, Cəlil Məmmədquluzadə, Mirzə Cəlil Seyidov, Yavuz Axundlu və Əyyub H&uuml;seynov &nbsp;kimi ziyalıların həyat və fəaliyyətinə həsr olunan filmlərin də m&uuml;əllifidir.&nbsp;</p>\r\n');
INSERT INTO `painter_translation` (`painter_id`, `lang_id`, `about_painter`) VALUES
(68, 2, '<p>NOVRUZOV Arzu Zakir (June 26, 1986 in Nakhchivan) - artist. Nakhchivan State University, Faculty of Arts, specialty Fine Arts and Painting (2005-2008). Member of the Union of Artists of Azerbaijan (2011). Member of the Union of Artists of Nakhchivan AR (2012). Chief artist at the State Committee for Television and Radio Broadcasting of the Nakhchivan Autonomous Republic (2009), artist at the Nakhchivan State Puppet Theater named after Mohammad Taghi Sidgi (2009). He was awarded the Presidential Scholarship (2012-2014). Participation in 14 International Art Festivals in Urmia, Islamic Republic of Iran (2007). Participation in the International Conference in the Islamic Republic of Iran (2007). Participation in the exhibition dedicated to Rembrandt Van Rijna in Poland (2007). Young, active artist of the year at the events organized by the Ministry of Youth and Sports of Nakhchivan (2010, 2011, 2013). Participation in the II Republican Meeting of Talented and Creative Youth of Azerbaijan in Baku (2012). Participation in exhibitions organized by the Artists&#39; Union of Nakhchivan AR (since 2012). Participation in the Congress of Azerbaijani Artists in Baku (2013). Participation in the ADEX International Defense Industry and International Peace Forum (2014). Winner of the Festival of Creative Hands (2016) dedicated to the 93rd birthday of National Leader Heydar Aliyev in Nakhchivan Gala. Participation in the II International Art Festival in Mersin, Turkey (2016). The Knowledge Foundation under the Chairman of the Supreme Assembly of the Nakhchivan Autonomous Republic won the film competition as a director for his participation in the creative competition &quot;Nakhchivan: yesterday and today&quot; (2016). The youngest active artist and director of the year at the event on the occasion of Youth Day (2017). Participant of the International Turkic Art Festival in Adana (2018). Participant of Nakhchivan Cradle of Humanity Art Festival organized by Nakhchivan AR Artists Union (2012, 2014, 2016, 2018). Participation in the first International Underwater Art Festival in Fethiye, Turkey (2018). Participant of events on the occasion of the 101st anniversary of the Azerbaijan Democratic Republic, the 95th anniversary of the Nakhchivan Autonomous Republic, the Day of National Salvation in the city of Erzurum, the Republic of Turkey (2019). BAKU EXPO CENTER painting was exhibited (2019). Winner of the 3rd place in graphics in the Nakhchivan-95 &ldquo;My Country&rdquo; competition organized by the Artists&#39; Union of Nakhchivan AR (2019). Turkey Fethiye II Participation in the International Art Festival &quot;Our Seas and Colors&quot; (2019). His works have been exhibited in the United States, Germany, Romania, Russia, Turkey, Italy, Iran, Poland. His works are kept in the Nakhchivan State Art Gallery and private collections. Presented to the Museum (2017). Documentary films directed by Baba Nematullah Nakhchivani, &quot;Descriptive Scientist&quot; and &quot;Incomplete Picture&quot; dedicated to Bahruz Kangarli. Also Ertogrul Javid, Shamil Gaziyev, Mirza Vahab Hasanzadeh, Jalil Mammadguluzade, Mirza Jalil. , Is also the author of films dedicated to the life and work of intellectuals such as Yavuz Akhundlu and Eyyub Huseynov.</p>\r\n'),
(69, 1, '<p>ƏLİZADƏ Anar Əbil oğlu - &nbsp;(26.04.1978 Nax&ccedil;ıvan ş ) &ndash; rəssam. Əzim Əzimzadə adına Azərbaycan D&ouml;vlət Rəssamlıq Məktəbi (1993-1997). Nax&ccedil;ıvan D&ouml;vlət Universitetinin Təsviri İncəsənət fak&uuml;ltəsi (1997-2001). Azərbaycan Rəssamlar İttifaqına &uuml;zv (2006). Nax&ccedil;ıvan MR Rəssamlar Birliyinə &uuml;zv (2012). T&uuml;rkmənistanda sərgidə iştirak (2009). Dizayn MMC reklam tərtibatı &uuml;zrə rəssam (2007). Nax&ccedil;ıvan MR Rəssamlar Birliyinin sərgilərində iştirak (2017-ci ildən bu g&uuml;nə kimi).</p>\r\n'),
(69, 2, '<p>ALIZADE Anar Abil oglu - (April 26, 1978 in Nakhchivan) - artist. Azerbaijan State Art School named after Azim Azimzade (1993-1997). Faculty of Fine Arts of Nakhchivan State University (1997-2001). Member of the Union of Artists of Azerbaijan (2006). Member of the Artists&#39; Union of Nakhchivan AR (2012). Participation in the exhibition in Turkmenistan (2009). Design LLC advertising design artist (2007). Participation in exhibitions of the Union of Artists of Nakhchivan AR (from 2017 to present).</p>\r\n');

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
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `image`, `created_date`, `category_id`, `status`) VALUES
(25, 'artbattle1.jpg', '2021-07-22 11:39:43', 64, 1),
(26, 'irs2.jpg', '2021-07-22 11:41:31', 64, 1),
(27, 'qehremanlar unudlumur1.jpg', '2021-07-22 11:43:04', 64, 1),
(29, '1.jpg', '2021-07-22 11:50:16', 63, 1),
(30, '2.jpg', '2021-07-22 11:50:45', 63, 1),
(31, '3.jpg', '2021-07-22 11:51:13', 63, 1),
(32, '4ce2f919-9146-4dc4-94b1-8d4b69335944.jpg', '2021-07-22 11:51:33', 63, 1),
(33, '5b9a7119-c892-4e7c-9bbe-01ae9fb5af45.jpg', '2021-07-22 11:51:56', 63, 1),
(34, '10.1.jpg', '2021-07-22 11:52:36', 63, 1),
(35, '10.2.jpg', '2021-07-22 11:53:01', 63, 1),
(36, '10.jpg', '2021-07-22 11:53:21', 63, 1),
(37, '15iyun2011-4.gif', '2021-07-22 11:53:43', 63, 1),
(38, '24c7a15a-c73f-4178-ab56-a3e38bcf1e86.jpg', '2021-07-22 11:54:06', 63, 1),
(39, '41.jpg', '2021-07-22 11:55:12', 63, 1),
(40, '42c774b9-fd9f-4674-8f5a-415cc4beb5b0.jpg', '2021-07-22 11:55:34', 63, 1),
(41, '42e760e3-4310-4ec7-afe5-70080cd297c8.jpg', '2021-07-22 11:59:38', 63, 1),
(42, '7582a253-af74-498d-a4e5-407bfade18f1.jpg', '2021-07-22 12:00:14', 63, 1),
(43, 'DSC05503.jpg', '2021-07-22 12:00:46', 63, 1),
(44, 'DSC05508.jpg', '2021-07-22 12:01:09', 63, 1),
(45, 'DSC05510.jpg', '2021-07-22 12:01:31', 63, 1),
(46, 'DSC05514.jpg', '2021-07-22 12:01:54', 63, 1),
(47, 'DSC05516.jpg', '2021-07-22 12:02:22', 63, 1),
(50, 'DSC05527.jpg', '2021-07-22 12:03:40', 63, 1),
(51, 'DSC05541.jpg', '2021-07-22 12:04:03', 63, 1),
(52, 'DSC05547.jpg', '2021-07-22 12:05:02', 63, 1),
(54, 'eb60b2d5-6e55-46ec-888e-8905626969bb.jpg', '2021-07-22 12:05:45', 63, 1),
(58, 'IMG_4430.JPG', '2021-07-22 13:24:28', 48, 1),
(59, 'abdinov.jpg', '2021-07-22 13:27:24', 48, 1),
(60, 'IMG_9444.JPG', '2021-07-22 13:28:35', 48, 1),
(62, '59873614_1518860578251360_2796498088833843200_n.jpg', '2021-07-22 13:38:48', 69, 1),
(65, 'DSC_0013.jpg', '2021-07-22 17:04:05', 48, 1),
(79, 'sb1.jpg', '2021-07-27 12:03:10', 74, 1),
(80, 'yb1.jpg', '2021-07-27 12:07:15', 74, 1),
(81, 'h1.png', '2021-07-27 12:16:10', 74, 1),
(82, 'q4.jpg', '2021-07-27 12:21:10', 74, 1),
(83, 'dts3.jpg', '2021-07-27 12:36:22', 74, 1),
(120, '29597303_1205793806224707_748832734378875198_n.jpg', '2021-07-29 13:17:11', 68, 1),
(122, '31171518_1224654771005277_2012397529152356352_n.jpg', '2021-08-07 13:08:25', 68, 1),
(123, '36730233_1273631102774310_7765306952841691136_n.jpg', '2021-08-07 13:55:05', 68, 1),
(124, '45570115_1382800405190712_3140398263413243904_n.jpg', '2021-08-07 13:59:02', 68, 1),
(125, '40814678_1340834472720639_4209409296900816896_n.jpg', '2021-08-07 14:13:21', 67, 1),
(126, '36671374_1275368115933942_4900716615705821184_n.jpg', '2021-08-07 14:27:24', 67, 1),
(127, '32087227_1227003774103710_8457759404417089536_n.jpg', '2021-08-08 17:43:21', 67, 1),
(128, '48215747_1410357582434994_7491861056713654272_n.jpg', '2021-08-08 17:48:06', 67, 1),
(129, '44034107_1365919896878763_4539787587287515136_n.jpg', '2021-08-08 18:02:24', 69, 1),
(130, '39900521_1330635913740495_1693926125060751360_o.jpg', '2021-08-08 18:06:15', 69, 1),
(131, '55937554_1490381184432633_703856826696859648_o (1).jpg', '2021-08-08 18:12:48', 69, 1),
(132, '77104889_1732713146866101_1109280548070621184_o.jpg', '2021-08-08 18:18:26', 69, 1),
(133, '69925652_1630740350396715_3714569437370646528_o.jpg', '2021-08-08 18:22:09', 69, 1),
(134, 'u1 (4).jpg', '2021-08-08 22:25:02', 64, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_gallery`
--

INSERT INTO `posts_gallery` (`id`, `post_id`, `gallery_image`) VALUES
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
(261, 83, 'uploaded-60ffc5944b1f18.04114010.jpg'),
(262, 120, 'uploaded-610e369c3e9a11.29902677.jpg'),
(263, 120, 'uploaded-610e369c3e9a15.29196010.jpg'),
(264, 120, 'uploaded-610e369cb4ac16.84310659.jpg'),
(265, 120, 'uploaded-610e36a33e2b04.41333851.jpg'),
(267, 122, 'uploaded-610e4da3d0e196.20923357.jpg'),
(268, 122, 'uploaded-610e4da3d2ce36.84838292.jpg'),
(269, 122, 'uploaded-610e4da3efaab1.93347443.jpg'),
(270, 122, 'uploaded-610e4da3ee6752.65027297.jpg'),
(271, 123, 'uploaded-610e588c9974e9.71190023.jpg'),
(272, 123, 'uploaded-610e588c996748.08880100.jpg'),
(273, 123, 'uploaded-610e588cc59561.07651817.jpg'),
(274, 123, 'uploaded-610e588cc8db09.71269082.jpg'),
(275, 123, 'uploaded-610e588cd2d916.39092892.jpg'),
(276, 123, 'uploaded-610e588ce27319.95983251.jpg'),
(277, 123, 'uploaded-610e588cf17228.15007015.jpg'),
(278, 123, 'uploaded-610e588d04d283.70501006.jpg'),
(279, 123, 'uploaded-610e588d0b3fe3.33693809.jpg'),
(280, 123, 'uploaded-610e588d178325.40911614.jpg'),
(281, 123, 'uploaded-610e588d30bb21.49652571.jpg'),
(282, 123, 'uploaded-610e588d558337.26599223.jpg'),
(283, 123, 'uploaded-610e588d5818c0.28157751.jpg'),
(284, 124, 'uploaded-610e59772a0a64.78166869.jpg'),
(285, 124, 'uploaded-610e59772a0977.90379413.jpg'),
(286, 124, 'uploaded-610e59773f15e4.90627159.jpg'),
(287, 124, 'uploaded-610e597740c586.46691349.jpg'),
(288, 124, 'uploaded-610e59774b99d3.48566215.jpg'),
(289, 124, 'uploaded-610e597757e5c3.80145504.jpg'),
(290, 124, 'uploaded-610e59775cc3c3.28025919.jpg'),
(291, 124, 'uploaded-610e597764d4d3.87149830.jpg'),
(292, 125, 'uploaded-610e5cde1ae8f4.17680009.jpg'),
(293, 125, 'uploaded-610e5cde1bbe15.98934931.jpg'),
(294, 125, 'uploaded-610e5cde38d5d2.95489523.jpg'),
(295, 125, 'uploaded-610e5cde423314.30410174.jpg'),
(296, 125, 'uploaded-610e5cde4cf011.95128299.jpg'),
(297, 125, 'uploaded-610e5cde4f5935.54609120.jpg'),
(298, 125, 'uploaded-610e5cde739912.47741022.jpg'),
(299, 125, 'uploaded-610e5cde768287.35408808.jpg'),
(300, 125, 'uploaded-610e5cde8d42d6.47005081.jpg'),
(301, 125, 'uploaded-610e5cde95c7a9.55010125.jpg'),
(302, 125, 'uploaded-610e5cde9e41f3.94874265.jpg'),
(303, 125, 'uploaded-610e5cdeaf9ec3.74451587.jpg'),
(304, 125, 'uploaded-610e5cdebcc330.01919411.jpg'),
(305, 125, 'uploaded-610e5cdec47200.19262100.jpg'),
(306, 125, 'uploaded-610e5cded18708.48900130.jpg'),
(307, 125, 'uploaded-610e5cdedb1294.85200213.jpg'),
(308, 125, 'uploaded-610e5cdee37f38.04229484.jpg'),
(309, 125, 'uploaded-610e5cdeeff912.42137991.jpg'),
(310, 125, 'uploaded-610e5cdef175a7.74844318.jpg'),
(311, 125, 'uploaded-610e5cdf14fcf6.15083659.jpg'),
(312, 126, 'uploaded-610e69ba079ed0.41996413.jpg'),
(313, 126, 'uploaded-610e69ba17da89.04194554.jpg'),
(314, 126, 'uploaded-610e69ba337411.91003628.jpg'),
(315, 126, 'uploaded-610e69ba347914.84924244.jpg'),
(316, 126, 'uploaded-610e69ba55f6a0.43276553.jpg'),
(317, 126, 'uploaded-610e69ba5f4f35.93726295.jpg'),
(318, 126, 'uploaded-610e69ba6edcd6.11052162.jpg'),
(319, 126, 'uploaded-610e69ba779c25.16727272.jpg'),
(320, 126, 'uploaded-610e69ba7d8c74.82077335.jpg'),
(321, 126, 'uploaded-610e69ba8697b8.22793642.jpg'),
(322, 126, 'uploaded-610e69ba984710.37066759.jpg'),
(323, 126, 'uploaded-610e69baa8ad07.01253622.jpg'),
(324, 126, 'uploaded-610e69bab6b187.00099458.jpg'),
(325, 126, 'uploaded-610e69bac140b7.99825206.jpg'),
(326, 126, 'uploaded-610e69bad01b77.65172390.jpg'),
(327, 127, 'uploaded-610fdf96571e43.83708184.jpg'),
(328, 127, 'uploaded-610fdf96571fd2.63625407.jpg'),
(329, 127, 'uploaded-610fdf96732107.51475885.jpg'),
(330, 127, 'uploaded-610fdf9673a8c0.58840332.jpg'),
(331, 127, 'uploaded-610fdf969ac869.06450692.jpg'),
(332, 127, 'uploaded-610fdf969b0ba4.87797220.jpg'),
(333, 127, 'uploaded-610fdf96a74141.17267770.jpg'),
(334, 127, 'uploaded-610fdf96a70bb0.67009772.jpg'),
(335, 127, 'uploaded-610fdf96b37b74.71796798.jpg'),
(336, 127, 'uploaded-610fdf96b52977.40594123.jpg'),
(337, 127, 'uploaded-610fdf96b6d9a8.98310986.jpg'),
(338, 127, 'uploaded-610fdf96c3d721.43280870.jpg'),
(339, 129, 'uploaded-610fe419238aa9.84519984.jpg'),
(340, 129, 'uploaded-610fe419268f10.83283812.jpg'),
(341, 129, 'uploaded-610fe419426a21.66825397.jpg'),
(342, 129, 'uploaded-610fe419439ae1.45254079.jpg'),
(343, 129, 'uploaded-610fe419457f31.17362342.jpg'),
(344, 129, 'uploaded-610fe4195d98b3.59205950.jpg'),
(345, 129, 'uploaded-610fe4195ddc03.21955550.jpg'),
(346, 129, 'uploaded-610fe419706293.90494846.jpg'),
(347, 129, 'uploaded-610fe4197367e3.52505178.jpg'),
(348, 129, 'uploaded-610fe41980fb84.22414684.jpg'),
(349, 129, 'uploaded-610fe419864c81.23816391.jpg'),
(350, 129, 'uploaded-610fe419909eb8.97296743.jpg'),
(351, 129, 'uploaded-610fe41991c3f4.67413277.jpg'),
(352, 129, 'uploaded-610fe41993de08.71284430.jpg'),
(353, 132, 'uploaded-610fe7c6eb08c9.34187244.jpg'),
(354, 132, 'uploaded-610fe7c6eb0942.56573714.jpg'),
(355, 132, 'uploaded-610fe7c70e0139.65049105.jpg'),
(356, 132, 'uploaded-610fe7c7135148.31062508.jpg'),
(357, 132, 'uploaded-610fe7c728b2a0.63585892.jpg'),
(358, 132, 'uploaded-610fe7c729df68.54074093.jpg'),
(359, 132, 'uploaded-610fe7c7316f19.10066447.jpg'),
(360, 132, 'uploaded-610fe7c73ea3d8.19214957.jpg'),
(361, 132, 'uploaded-610fe7c73fc938.97967047.jpg'),
(362, 132, 'uploaded-610fe7c74195e5.64428002.jpg'),
(363, 132, 'uploaded-610fe7c74e9a62.30976510.jpg');

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
(126, 1, 'Hikmət Barutçugilin əsərlərindən ibarət “Allahın gözəl adlar” adlı fərdi yaradıcılıq sərgisi', '<p>6 iyul 2018-ci il tarixdə saat 11:00-da Nax&ccedil;ıvan Muxtar Respublikası Rəssamlar Birliyinin Bəhruz Kəngərli adına sərgi salonunda Nax&ccedil;ıvan MR Mədəniyyət Nazirliyi və Nax&ccedil;ıvan MR Rəssamlar Birliyinin birgə ke&ccedil;irdikləri &ldquo;Nax&ccedil;ıvan İslam Mədəniyyətinin Paytaxtı-2018&rdquo; mədəniyyət ilinə həsr olunmuş g&ouml;rkəmli ebru ustası, Hikmət Barut&ccedil;ugilin əsərlərindən ibarət &ldquo;Allahın g&ouml;zəl adları&rdquo; adlı fərdi yaradıcılıq sərgisi ke&ccedil;irilmişdir. Ekspozisiyada rəssamın 47 ebru &uuml;zərində xətt sənətinin ahəngdar n&uuml;munələri sərgilənir. Ebruda Esma-i H&uuml;sna adlı bu sərgi ilk &ouml;ncə T&uuml;rkiyənin bir &ccedil;ox şəhərlərində və Nax&ccedil;ıvan Muxtar Respublikasından başlayaraq Azərbaycanın digər b&ouml;lgələrində n&uuml;mayış olunacaqdır.<br />\r\nEkspozisiya, n&ouml;vbəti sərgiyədək davam edəcəkdir.</p>\r\n'),
(126, 2, 'Individual art exhibition \"Beautiful names of God\" by Hikmet Barutchugil', '<p>On July 6, 2018 at 11:00 in the exhibition hall of the Artists &#39;Union of the Nakhchivan Autonomous Republic named after Bahruz Kangarli, the Ministry of Culture of the Nakhchivan Autonomous Republic and the Artists&#39; Union of the Nakhchivan Autonomous Republic held a joint marbling ceremony dedicated to the &quot;Capital of Islamic Culture 2018&quot; A solo exhibition entitled &quot;God&#39;s Beautiful Names&quot; featuring the works of Hikmet Barutchugil was held. The exposition features harmonious examples of the artist&#39;s calligraphy on 47 marbles. This exhibition, called Ebruda Esma-i Husna, will first be shown in many cities of Turkey and other regions of Azerbaijan, starting with the Nakhchivan Autonomous Republic.<br />\r\nThe exposition will last until the next exhibition.</p>\r\n'),
(125, 1, 'Naxçıvan MR Rəssamlar Birliyinin Bəhruz Kəngərli adına sərgi salonunda 15 sentyabr Bilik Gününə həsr olunmuş İRS “Mənim yaradıcılığım” adlı sərgi keçirmişdir.', '<p>3 sentyabr Nax&ccedil;ıvan MR Rəssamlar Birliyinin Bəhruz Kəngərli adına sərgi salonunda Nax&ccedil;ıvan MR Rəssamlar Birliyi və Nax&ccedil;ıvan MR Təhsil Nazirliyinin birgə təşkil etdikləri 15 sentyabr Bilik G&uuml;n&uuml;nə həsr olunmuş İRS &ldquo;Mənim yaradıcılığım&rdquo; adlı sərgi ke&ccedil;irmişdir.<br />\r\nNax&ccedil;ıvan Muxtar Respublikası Rəssamlar Birliyinin sədri, Əməkdar rəssam, Milli Məclisin deputatı &Uuml;lviyyə Həmzəyeva &ccedil;ıxış edib. O, ulu &ouml;ndər Heydər Əliyevin &ldquo;Uşaqlar bizim gələcəyimizdir. Gələcəyimizi nə c&uuml;r tərbiyə edəcəyiksə, b&ouml;y&uuml;dəcəyiksə, &ouml;lkəmizin, millətimizin, d&ouml;vlətimizin gələcəyi bundan asılı olacaqdlr&rdquo; m&uuml;drik kəlamlarını xatırladaraq bildirib ki, uşaqların rəssamlığa maraq g&ouml;stərmələri &ccedil;ox sevindirici haldır. Onların istedadlarının &uuml;zə &ccedil;ıxarılması, d&uuml;zg&uuml;n formalaşdırılması &uuml;&ccedil;&uuml;n muxtar respublikada hər tərəfli şərait yaradılıb.<br />\r\nTəhsil Nazirliyinin əməkdaşı Ayşən Əsgərova &ccedil;ıxış edərək vurğulayıb ki, muxtar respublikamızda uşaqlar milli-mənəvi dəyərlərimizə h&ouml;rmət ruhunda tərbiyə olunur, təhsil, idman, mədəniyyət, incəsənət və digər sahələrdə uğurlar əldə edirlər. Onlar rəssamlıq sənətinə də b&ouml;y&uuml;k maraq g&ouml;stərirlər. Uşaqların gələcəkdə yaxşı sənət adamı kimi formalaşmasında bu qəbildən tədbirlər əhəmiyyətli rol oynayır.</p>\r\n\r\n<p>Ekspozisiyada 38 uşağın 100-ə yaxın rəsm əsəri sərgilənmişdir. Burada qara qələm, ebru, yağlı boya, tuş, sulu boya texnikasında, mənzərə, animasiya, nat&uuml;rmort, animalistik janrlarında, vətənpərvərlik, kənd həyatı, doğma Nax&ccedil;ıvan, su altı həyat və. s kimi m&uuml;xtəlif kompozisiyalı əsərlər n&uuml;mayış olunmuşdur.</p>\r\n\r\n<p>Sərgidə iştitak edən balaca rəssamlara fəal iştiraklarına g&ouml;rə təşkilat&ccedil;ılar tərəfindən diplomlar təqdim olunmuşdur.</p>\r\n\r\n<p>Sərgi &ccedil;ər&ccedil;ivəsində Ayxan Əliyev nağarada birliyə, dostluğa səsləyən yallı və digər milli musiqilərimizə istenad edərək maraqlı n&ouml;mrələr ifa etmişdir. Musiqi n&ouml;mrəsindən sonra sərgiyə baxış ke&ccedil;irildi. Burada T&uuml;kəz Ələkbərli, Şəmil Ələkbərli, Ayxan Qəhramanov, Şəhrizad Quluzadə, İlknur Əlizadə, Kənan Zamanov, El&ccedil;in Cabbarov, Fərhad Şirinov, Nil&uuml;fər Quluzadə və digər uşaqların əsərləri maraq doğurmuşdur.</p>\r\n\r\n<p>Sonda Nax&ccedil;ıvan MR Rəssamlar Birliyinin təşkilat&ccedil;ılığı ilə uşaqlara, onların da marağına səbəb olan ebru haqqında məlumat verilmiş, ustad dərsi ke&ccedil;irilmişdir.</p>\r\n\r\n<p>Sərgimiz 20 sentyabra-dək davam edəcək.</p>\r\n'),
(125, 2, 'IRS held an exhibition entitled \"My creativity\" dedicated to the September 15 Knowledge Day in the exhibition hall named after Bahruz Kangarli of the Artists\' Union of Nakhchivan AR.', '<p>September 3 In the exhibition hall named after Bahruz Kangarli of the Artists &#39;Union of Nakhchivan AR, IRS held an exhibition entitled &quot;My creativity&quot; dedicated to the Knowledge Day on September 15, jointly organized by the Artists&#39; Union of Nakhchivan AR and the Ministry of Education of Nakhchivan AR.<br />\r\nChairman of the Artists&#39; Union of the Nakhchivan Autonomous Republic, Honored Artist, MP Ulviya Hamzayeva spoke. He quoted the great leader Heydar Aliyev as saying, &ldquo;Children are our future. The future of our country, our nation, our state will depend on how we educate and grow our future, &rdquo;he said, noting that it is very gratifying that children are interested in painting. All-round conditions have been created in the autonomous republic for the revelation and proper formation of their talents.<br />\r\nEmployee of the Ministry of Education Ayshan Askerova stressed that in our autonomous republic, children are brought up in the spirit of respect for our national and spiritual values, achieve success in education, sports, culture, art and other fields. They are also very interested in painting. Such events play an important role in the formation of children as good artists in the future.<br />\r\nAbout 100 paintings by 38 children were exhibited at the exhibition. Here in black pencil, marbling, oil paint, mascara, watercolor technique, landscape, animation, still life, animalistic genres, patriotism, rural life, native Nakhchivan, underwater life and. s, works of various compositions were demonstrated.<br />\r\nThe young artists participating in the exhibition were awarded diplomas by the organizers for their active participation.<br />\r\nWithin the framework of the exhibition, Aykhan Aliyev performed interesting numbers on the drum, referring to our yalli and other national music calling for unity and friendship. After the music number, the exhibition was viewed. The works of Tukaz Alakbarli, Shamil Alakbarli, Aykhan Gahramanov, Shahrizad Guluzade, Ilknur Alizade, Kanan Zamanov, Elchin Jabbarov, Farhad Shirinov, Nilufar Guluzade and other children aroused interest here.<br />\r\nAt the end, organized by the Artists&#39; Union of Nakhchivan AR, the children were informed about marbling, which is of interest to them, and a master class was held.<br />\r\nOur exhibition will last until September 20.</p>\r\n'),
(120, 1, '“Beynəlxalq uşaq kitab günü”-nə , Naxçıvan şəhərində yerləşən məktəbdənkənar təhsil müəssisələrinin “Rəsm” dərnəyi üzvlərinə Bəhruz Kəngərli adına sərgi salonunda “Şamil Qazıyev 110” mövzusunda açıq dərs keçirmişdir.', '<p>Nax&ccedil;ıvan MR Rəssamlar Birliyi 2 aprel &ldquo;Beynəlxalq uşaq kitab g&uuml;n&uuml;&rdquo;-nə , Nax&ccedil;ıvan şəhərində yerləşən məktəbdənkənar təhsil m&uuml;əssisələrinin &ldquo;Rəsm&rdquo; dərnəyi &uuml;zvlərinə Bəhruz Kəngərli adına sərgi salonunda &ldquo;Şamil Qazıyev 110&rdquo; m&ouml;vzusunda a&ccedil;ıq dərs ke&ccedil;irmişdir. Dərs, g&ouml;rkəmli fır&ccedil;a ustasının həyat və yaradıcılığına, əsərlərinə g&ouml;stərilən diqqət və qayğıdan, ən əsası əsərlərin təhlilinə həsr olunmuşdur. Balaca rəssamlara, rəng və m&ouml;vzunun daha yaxşı qavramaları &uuml;&ccedil;&uuml;n, sərgilənən əsərlərdən əks etməyə icazə verilmişdir. Dərsi, Azərbyacanın Əməkdar rəssamı &Uuml;lviyyə Həmzəyeva ke&ccedil;mişdir.</p>\r\n'),
(120, 2, 'On the occasion of the International Children\'s Book Day, he held an open lesson on \"Shamil Gaziyev 110\" in the exhibition hall named after Bahruz Kangarli for the members of the \"Painting\" circle of out-of-school educational institutions in Nakhchivan.', '<p>On April 2, the Artists&#39; Union of Nakhchivan Autonomous Republic held an open lesson on &quot;Shamil Gaziyev 110&quot; in the exhibition hall named after Bahruz Kangarli for the members of the &quot;Painting&quot; circle of out-of-school educational institutions located in Nakhchivan. The lesson is dedicated to the life and work of the famous artist, the attention and care paid to his works, and most importantly, the analysis of the works. Young artists are allowed to reflect on the exhibited works for a better understanding of color and theme.<br />\r\nThe lesson was given by the Honored Artist of Azerbaijan Ulviya Hamzayeva.</p>\r\n'),
(124, 1, 'Yurdumuz da, Millətimiz də Bayrağımız kimi daim ucalarda olsun!', '<p>Nax&ccedil;ıvan MR Rəssamlar Birliyinin &uuml;zvləri Bayraq G&uuml;n&uuml; m&uuml;nasibətilə Bayraq Meydanına y&uuml;r&uuml;ş etmiş və Bayraq muzeyinə ekskurs etmişlər.</p>\r\n'),
(124, 2, 'May our country and nation always be as high as our flag!', '<p>Members of the Artists&#39; Union of Nakhchivan AR marched to the Flag Square on the occasion of Flag Day and took an excursion to the Flag Museum.</p>\r\n'),
(123, 1, 'Rəssamlar Birliyi istedadlar sorağında!', '<p>Gənc istedad Ənvər Kazımovun rənglər d&uuml;nyası. M&ouml;htəşəm rəng duyumu.<br />\r\nTəbrik edir, uğurlar arzu edirik!</p>\r\n'),
(123, 2, 'Artists\' Union in search of talent!', '<p>The world of colors of young talent Anvar Kazimov. Spectacular sense of color.<br />\r\nCongratulations, good luck!</p>\r\n'),
(122, 1, '4 may Şərur şəhər Uşaq Yaradıcılıq Mərkəzinin Rəsm dərnəyi üzvlərinə növbəti ustad dərsi keçirilmişdir.', '<p>Dərsi, Nax&ccedil;ıvan MR Rəssamlar Birliyinin &uuml;zv&uuml;, Sabir Məmmədov icra etmiş, sulu boya ilə nat&uuml;rmortun &ccedil;əkilişini &ouml;yrətmişdir. Şagirdlərə maraqlı dərs ke&ccedil;miş, dərs əsasında dərnək &uuml;zvləri ilə incəsənət haqqında s&ouml;hbətlər aparmışdır.<br />\r\nMəktəb direktoruna, dərnək rəhbərinə, şagirdlərə və rəssam Sabir Məmmədova təşəkk&uuml;r&uuml;m&uuml;z&uuml; bildiririk.</p>\r\n'),
(122, 2, 'On May 4, the next master class was held for the members of the Art Club of Sharur Children\'s Creativity Center.', '<p>The lesson was performed by Sabir Mammadov, a member of the Artists&#39; Union of Nakhchivan AR, who taught him to draw a still life with watercolors. He gave an interesting lesson to the students and talked about art with the members of the circle.<br />\r\nWe thank the school principal, the head of the club, the students and the artist Sabir Mammadov.</p>\r\n'),
(127, 1, 'Naxçıvan MR Rəssamlar Birliyinin B.Kəngərli adına sərgi salonunda Ulu Öndər Heydər Əliyevin 95 illik yubileyinə həsr olunmuş sərgi keçirilmişdir', '<p>Sərgidə Azərbaycan Respublikasının Əməkdar rəssamı, Nax&ccedil;ıvan MR Rəssamlar Birliyinin sədri, Milli Məclisin deputatı &Uuml;lviyyə Həmzəyeva, Yazı&ccedil;ılar Birliyinin sədri, Nax&ccedil;ıvan Ali Məclisinin deputatı Asim Yadigar, Qızlar Məktəbinin direktoru, Ali Məclisinin deputatı Aidə Allahverdiyeva və digər iştirak&ccedil;ılar Dahi şəxsiyyət Heydər Əliyev haqqında hazırladıqları m&ouml;vzu &uuml;zrə &ccedil;ıxış etmişlər.<br />\r\nEkspozisiyada 20 rəssamın 50 yaxın əsəri sərgilənir.</p>\r\n'),
(127, 2, 'An exhibition dedicated to the 95th anniversary of National Leader Heydar Aliyev was held at the exhibition hall named after B. Kangarli of the Artists\' Union of Nakhchivan AR', '<p>Honored Artist of the Republic of Azerbaijan, Chairman of the Union of Artists of Nakhchivan AR, MP Ulviya Hamzayeva, Chairman of the Writers &#39;Union, MP of the Nakhchivan Supreme Assembly Asim Yadigar, Director of the Girls&#39; School, MP Aida Allahverdiyeva and other participants spoke on the topic of genius Heydar Aliyev have done.<br />\r\nThe exhibition features about 50 works by 20 artists.</p>\r\n'),
(128, 1, '“Ustad dərslərinin uğurlu nəticəsi” adlı İncəsənət Məktəbi və Rəsm dərnəyi üzvlərinin yekun sərgisi keçirilmişdir.', '<p>14 dekabr , 2018-ci il tarixində , 16 dekabr, tarixinə həsr olunmuş, Nax&ccedil;ıvan MR Rəssamlar Birliyinin Bəhruz Kəngərli adına sərgi salonunda Gənclər Fondu , Nax&ccedil;ıvan MR Təhsil Nazirliyi, Nax&ccedil;ıvan MR Mədəniyyət Nazirliyi , Nax&ccedil;ıvan MR Rəssamlar Birliyinin birgə təşkilat&ccedil;ılığı ilə<br />\r\n&ldquo;Ustad dərslərinin uğurlu nəticəsi&rdquo; adlı İncəsənət Məktəbi və Rəsm dərnəyi &uuml;zvlərinin yekun sərgisi ke&ccedil;irilmişdir.<br />\r\nSərgiyə 50 yaxın şagirdin, 100 yaxın rəsmi sərgilənmişdir.<br />\r\nUstad dərslərimiz davam edir!<br />\r\nHər kəsə təşəkk&uuml;r edirik!</p>\r\n'),
(128, 2, 'The final exhibition of the members of the School of Arts and the Art Club \"Successful results of master classes\" was held.', '<p>On December 14, 2018, dedicated to the date of December 16, 2018 in the exhibition hall of the Artists&#39; Union of Nakhchivan AR named after Bahruz Kangarli by the Youth Foundation, Nakhchivan AR Ministry of Education, Nakhchivan AR Ministry of Culture, Nakhchivan AR Artists Union<br />\r\nThe final exhibition of the members of the School of Arts and the Art Club &quot;Successful results of master classes&quot; was held.<br />\r\nAbout 50 students and about 100 paintings were exhibited at the exhibition.<br />\r\nOur master classes continue!<br />\r\nThank you everyone!</p>\r\n'),
(129, 1, '18 oktyabr Dövlət Müstəqilliyi Gününə həsr olunmuş sərgi', '<p>H&ouml;rmətli sənətsevərlər !<br />\r\n18 oktyabr D&ouml;vlət M&uuml;stəqilliyi G&uuml;n&uuml; m&uuml;nasibəti ilə<br />\r\n17 oktyabr 2018- ci il tarixində, saat 15:00- da Nax&ccedil;ıvan MR Rəssamlar Birliyinin Bəhruz Kəngərli adına sərgi salonunda Sizləri sərgimizə g&ouml;zləyirik!<br />\r\nEkspozisiyamız artıq hazırdır.<br />\r\nSərgidə İştirak edən b&uuml;t&uuml;n rəssamlara təşəkk&uuml;r edirik!</p>\r\n'),
(129, 2, 'Exhibition dedicated to the Independence Day on October 18', '<p>Dear art lovers!<br />\r\nOctober 18 on the occasion of Independence Day<br />\r\nWe look forward to seeing you at our exhibition on October 17, 2018, at 15:00 in the exhibition hall named after Bahruz Kangarli of the Artists&#39; Union of Nakhchivan AR!<br />\r\nOur exposition is ready.<br />\r\nThank you to all the artists participating in the exhibition!</p>\r\n'),
(130, 1, 'İRS Bilik Günü B.Kəngərli adına sərgi salonu 4 sentyabr 2018-ci il saat 15:00', '<p>H&ouml;rmətli valideynlər, m&uuml;əllimlər və şəhərimizin sakinləri!</p>\r\n\r\n<p>Nax&ccedil;ıvan MR Rəssamlar Birliyi yenə də İstedadlı Rəssamlar Sorağında.<br />\r\n04 sentyabr 2018-ci il tarixində saat 15:00-da NRB-nin Bəhruz Kəngərli adına sərgi salonunda &ldquo;Mənim Yaradıcılığım&rdquo; adlı rəsm sərgisi ke&ccedil;iriləcək.<br />\r\n1.Rəsmlər m&uuml;xtəlif &ouml;l&ccedil;&uuml;də, istənilən texnikada təqdim oluna bilər<br />\r\n2. Hər m&uuml;əllif &ouml;z əsərini adlandırmalıdır<br />\r\n3. Yaş məhdudiyyəti 5-15<br />\r\n3. Rəsmlər 27 avqust 2018-ci il tarixədək NRB-nə təqdim olunmalıdır<br />\r\n&Ouml;ncədən qeydiyyatdan ke&ccedil;ə bilərsiniz (036)5455899</p>\r\n\r\n<p>Dəyişikliklər və əlavələr nəzərinizə &ccedil;atdırılacaq.</p>\r\n\r\n<p>DİQQƏT! Əvvəlki sərgilərimizdə sərgilənən rəsmlər ekspozisiyadan &ccedil;ıxarılacaq.</p>\r\n'),
(130, 2, 'IRS Knowledge Day Exhibition Hall named after B. Kangarli September 4, 2018 at 15:00', '<p>Dear parents, teachers and residents of our city!</p>\r\n\r\n<p>Nakhchivan AR Artists Union is again in the Talented Artists Questionnaire.<br />\r\nOn September 4, 2018, at 15:00, an exhibition entitled &ldquo;My Creativity&rdquo; will be held at the Bahruz Kangarli Exhibition Hall of NRB.<br />\r\n1. Pictures can be presented in different sizes, in any technique<br />\r\n2. Each author must name his work<br />\r\n3. Age limit 5-15<br />\r\n3. Drawings must be submitted to the NRB by August 27, 2018<br />\r\nYou can register in advance by calling (036) 5455899</p>\r\n\r\n<p>Changes and additions will be brought to your attention.</p>\r\n\r\n<p>ATTENTION! The paintings exhibited in our previous exhibitions will be removed from the exposition.</p>\r\n'),
(62, 1, 'Ulu Öndər Heydər Əliyevin 96-cı il dönümü', '<p>8 may, saat 11.00-da Nax&ccedil;ıvan MR Rəssamlar Birliyinin Bəhruz Kəngərli adına sərgi salonunda &ldquo;Ulu &Ouml;ndər Heydər Əliyevin 96-cı&nbsp;il d&ouml;n&uuml;m&uuml;&rdquo;-nə&nbsp;həsr olunmuş, əməkdar rəssam Səyyad Bayramovun fərdi yaradıcılıq sərgisi.<br />\r\nDƏVƏT EDİRİK!</p>\r\n'),
(62, 2, '96th anniversary of the Great Leader Heydar Aliyev', '<p>On May 8, at 11.00 in the exhibition hall of the Union of Artists of Nakhchivan AR named after Bahruz Kangarli, a personal art exhibition of the Honored Artist Sayyad Bayramov, dedicated to the &quot;96th anniversary of the Great Leader Heydar Aliyev&quot;.<br />\r\nWE INVITE!</p>\r\n'),
(131, 1, 'Gənc rəssamların sənət döyüşü', '<p>Gənc rəssamların nəzərinə!</p>\r\n\r\n<p>Nax&ccedil;ıvan Muxtar Respublikasında fəaliyyət g&ouml;stərən ali və orta ixtisas təhsili m&uuml;əssisələrinin tələbələri arasında ke&ccedil;iriləcək &ldquo;Art Battle&rdquo;- I &ldquo;İncəsənət D&ouml;y&uuml;ş&uuml;&rdquo; İncəsənət yarışı ke&ccedil;irilir</p>\r\n\r\n<p>I Məqsəd<br />\r\n.........................<br />\r\n1.1 Gənc istedadların tanıdılması, və onlar arasında sağlam rəqabətin formalaşdırılması.</p>\r\n\r\n<p>II M&uuml;sabiqənin ke&ccedil;irilməsinə rəhbərlik<br />\r\n......................<br />\r\n2.1 Nax&ccedil;ıvan Muxtar Respublikasının Rəssamlar Birliyi, Nax&ccedil;ıvan Muxtar Respublikasının Gənclər və İdman Nazirliyi, Nax&ccedil;ıvan Muxtar Respublikasının Gənclər Fondu rəhbərlik edir.</p>\r\n\r\n<p>III İştirak&ccedil;ılar və m&uuml;sabiqənin ke&ccedil;irilmə qaydaları<br />\r\n........................<br />\r\n3.1 M&uuml;sabiqədə Nax&ccedil;ıvan Muxtar Respublikası Rəssamlar Birliyinin hamiliyinə verilmiş Nax&ccedil;ıvan D&ouml;vlət Universitetinin və Nax&ccedil;ıvan M&uuml;əllimlər İnstitutunun Təsviri İncəsənət və Rəngkarlıq ixtisasında təhsil alan tələbələr və m&uuml;sabiqələrdə iştirak edən, istedadlı gənclər dəvət olunur;</p>\r\n\r\n<p>3.2 Rəsm m&uuml;sabiqəsinin yaradıcılıq hissəsi 4 aprel 2019-cu il tarixdə saat 11:00-dan, 17:00-dək B.Kəngərli adına Rəssamlar Parkında ke&ccedil;iriləcəkdir; (hava şəraiti ilə əlaqədar Nax&ccedil;ıvan MR Rəssamlar Birliyində də ke&ccedil;irilə bilər)</p>\r\n\r\n<p>3.3 Tədbirin yekun hissəsi: 5 aprel 2019-cu il tarixində, saat 11:00 &ndash; da Rəssamlar Birliyinin B.Kəngərli adına sərgi salonunda ke&ccedil;iriləcəkdir.</p>\r\n\r\n<p>3.4 Tədbir boyu &ccedil;əkilən əsərlərdən ibarət sərgi</p>\r\n\r\n<p>IV Qaliblərin se&ccedil;ilməsi<br />\r\n............................<br />\r\n4.1 İştirak edən hər gənc &ouml;z&uuml;n&uuml; &ccedil;ıxmaq şərti ilə digərinə səs verəcək.</p>\r\n\r\n<p>4.2 M&uuml;nsiflər heyəti: 1 nəfər Gənclər və İdman Nazirliyindən, 1 nəfər Gənclər Fondundan, 3 nəfər Rəssamlar Birliyinin &uuml;zvlərindən təyin ediləcəklər.</p>\r\n\r\n<p>V Qaliblərin m&uuml;kafatlandırılması<br />\r\n...........................<br />\r\n5.1 Qaliblərin m&uuml;kafatlandırılması 5 aprel 2019-cu il tarixdə saat 11:00-da Nax&ccedil;ıvan Muxtar Respublikası Rəssamlar Birliyinin B.Kəngərli adına sərgi salonunda ke&ccedil;iriləcəkdir.</p>\r\n\r\n<p>5.2 I - I yer</p>\r\n\r\n<p>I - II yer</p>\r\n\r\n<p>I - III yer</p>\r\n\r\n<p>5.3 Təşkilat&ccedil;ılar tərəfindən iştirak edən hər gənc rəssama 1 ədəd kətan və yağlı boya dəsti hədiyyə olunacaq (M&uuml;sabiqə boyu işləmək &uuml;&ccedil;&uuml;n).</p>\r\n\r\n<p>Qaliblər, təşkilat&ccedil;ılar tərəfindən diplomlarla təltif olunacaqlar.</p>\r\n\r\n<p>5.4 Gənc rəssamlar tərəfindən işlənən əsərlər, m&uuml;hafizə olunmaq &uuml;&ccedil;&uuml;n, tədbir təşkilat&ccedil;ılarına təhvil veriləcəkdir.</p>\r\n\r\n<p>QEYD: &quot;Art battle&quot; İncəsənıt d&ouml;y&uuml;ş&uuml;ndə iştirak etmək istəyən gənc rəssamlar, bu g&uuml;n 2 aptel tarixində saat 17:00 dək ( 036)5455899 əlaqə n&ouml;mrəsinə zəng edərək qeydiyyatdan ke&ccedil;məlidir.<br />\r\nQeydiyyat olunmayan gənclər tədbirdə iştirak edə bilməyəcəklər.<br />\r\nRəssamlar Birliyinin rəsmi Facebook səhifəsində yerləşdirilən elanın altında da ad, soyad yazmaqla qeydiyyat oluna bilərlər.</p>\r\n\r\n<p>İŞTİRAK&Ccedil;ILAR 04 Mart SAAT 9:00-da RƏSSAMLAR BİRLİYİNDƏ SƏRBƏST GEYİMDƏ (libaslarınızın boya olma ehtimalını nəzərə alın) OLMALIDIRLAR...</p>\r\n\r\n<p>Dəvət olunan gənclər:<br />\r\nNax&ccedil;ıvan D&ouml;vlət Universiteti<br />\r\n1.Kazımlı K&ouml;n&uuml;l<br />\r\n2.Salaylı Mələk<br />\r\n3.Aslanov Nihad<br />\r\n4.Nəsirli V&uuml;sal<br />\r\n5.Əliyev Murad<br />\r\n6.Əliyeva G&uuml;lnar<br />\r\n7.Həsənli G&uuml;nay<br />\r\n8.Məmmədli R&ouml;ya</p>\r\n\r\n<p>Nax&ccedil;ıvan M&uuml;əllimlər İnstitutu<br />\r\n1.Allahverdiyev Fərhad<br />\r\n2.Nəbiyev Səbrəli<br />\r\n3.Haclyev &Ccedil;inar<br />\r\n4.Həsəniva Ayrən<br />\r\n5.Həsənli Abutalıb<br />\r\n6.Fərzəliyev Tofiq</p>\r\n\r\n<p>&quot;Nax&ccedil;ıvan&quot; Universitetinin, Nax&ccedil;ıvan D&ouml;vlət Texniki Kollecinin, Nax&ccedil;ıvan Tibb Kollecinin və Heydər Əliyev adına Hərbi Liseyin istedadlı gənclərini də yarışmaya dəvət edirik.</p>\r\n'),
(131, 2, 'Art battle of young artists', '<p>To the attention of young artists!</p>\r\n\r\n<p>Art Battle - I &ldquo;Art Battle&rdquo; art competition to be held among students of higher and secondary special education institutions operating in Nakhchivan Autonomous Republic</p>\r\n\r\n<p>I Goal<br />\r\n.........................<br />\r\n1.1 Recognition of young talents, and formation of healthy competition between them.</p>\r\n\r\n<p>Management of the II Competition<br />\r\n......................<br />\r\n2.1 Headed by the Artists&#39; Union of the Nakhchivan Autonomous Republic, the Ministry of Youth and Sports of the Nakhchivan Autonomous Republic, the Youth Foundation of the Nakhchivan Autonomous Republic.</p>\r\n\r\n<p>III Participants and rules of the competition<br />\r\n........................<br />\r\n3.1 Students of Nakhchivan State University and Nakhchivan Teachers&#39; Institute majoring in Fine Arts and Painting and talented young people participating in the competitions are invited to the competition;</p>\r\n\r\n<p>3.2 The creative part of the drawing competition will be held on April 4, 2019 from 11:00 to 17:00 in the Artists Park named after B. Kangarli; (Due to weather conditions, it can be held at the Artists&#39; Union of Nakhchivan AR)</p>\r\n\r\n<p>3.3 The final part of the event will be held on April 5, 2019 at 11:00 in the exhibition hall of the Artists&#39; Union named after B. Kangarli.</p>\r\n\r\n<p>3.4 An exhibition of works taken during the event</p>\r\n\r\n<p>IV Selection of winners<br />\r\n............................<br />\r\n4.1 Each participant will vote for the other, provided he / she withdraws.</p>\r\n\r\n<p>4.2 Jury: 1 person will be appointed from the Ministry of Youth and Sports, 1 person from the Youth Foundation, 3 members from the Artists&#39; Union.</p>\r\n\r\n<p>V Awarding the winners<br />\r\n...........................<br />\r\n5.1 Awarding of winners will be held on April 5, 2019 at 11:00 in the exhibition hall of the Artists&#39; Union of the Nakhchivan Autonomous Republic named after B. Kangarli.</p>\r\n\r\n<p>5.2 I - I place</p>\r\n\r\n<p>I - II place</p>\r\n\r\n<p>I - III place</p>\r\n\r\n<p>5.3 Each young artist participating will be presented with a set of canvas and oil paints by the organizers (to work throughout the competition).</p>\r\n\r\n<p>The winners will be awarded diplomas by the organizers.</p>\r\n\r\n<p>5.4 Works by young artists will be handed over to the event organizers for protection.</p>\r\n\r\n<p>NOTE: Young artists wishing to take part in the &quot;Art battle&quot; must register by calling (036) 5455899 until 17:00 today, April 2.<br />\r\nUnregistered youth will not be able to attend the event.<br />\r\nYou can also register by writing your name and surname under the announcement posted on the official Facebook page of the Artists&#39; Union.</p>\r\n\r\n<p>PARTICIPANTS MUST BE IN FREEDOM CLOTHING (consider the possibility of dyeing your clothes) at the ARTISTS &#39;UNION on March 4 at 9:00 ...</p>\r\n\r\n<p>Invited youth:<br />\r\nNakhchivan State University<br />\r\n1.Kazımlı K&ouml;n&uuml;l<br />\r\n2. The Angel of Peace<br />\r\n3.Aslanov Nihad<br />\r\n4. Nasirli Vusal<br />\r\n5. Aliyev Murad<br />\r\n6. Aliyeva Gulnar<br />\r\n7. Hasanli Gunay<br />\r\n8. Mammadli Roya</p>\r\n\r\n<p>Nakhchivan Teachers&#39; Institute<br />\r\n1.Allahverdiyev Farhad<br />\r\n2. Nabiyev Sabrali<br />\r\n3.Haclyev Chinar<br />\r\n4. Hasaniva Ayran<br />\r\n5. Hasanli Abutalib<br />\r\n6. Farzaliyev Tofig</p>\r\n\r\n<p>We also invite talented young people from Nakhchivan University, Nakhchivan State Technical College, Nakhchivan Medical College and Military Lyceum named after Heydar Aliyev to the competition.</p>\r\n'),
(132, 1, 'Ustad dərslərinin yekun sərgisi', '<p>H&ouml;rmətli sənətsevərlər!<br />\r\n16 dekabr, saat 16:00-da Nax&ccedil;ıvan MR Rəssamlar Birliyinin Bəhruz Kəngərli adına sərgi salonunda ustad rəssamların əsərlərindən belə, geri qalmayan balaca rəssamlarımızın sərgisinə g&ouml;zləyirik!</p>\r\n'),
(132, 2, 'Final exhibition of master classes', '<p>Dear art lovers!<br />\r\nOn December 16, at 16:00 in the exhibition hall of the Union of Artists of Nakhchivan AR named after Bahruz Kangarli, we are waiting for the exhibition of our young artists, who are not far behind even the works of master artists!</p>\r\n'),
(133, 1, 'Gənc rəssamların açıq havada pleneri və rəsm işlərindən ibarət sərgi-satışı', '<p>21 sentyabr, şənbə g&uuml;n&uuml; istirahətinizi Saat Meydanına salın!<br />\r\nGənc Rəssamların Plenerini izləmə və &ccedil;əkilən əsərləri əldə etmə şansını qa&ccedil;ırmayın.</p>\r\n'),
(133, 2, 'Open-air exhibition and sale of paintings by young artists', '<p>Rest on Saturday, September 21 at Clock Square!<br />\r\nDon&#39;t miss the chance to watch the Young Artists&#39; Player and get the works shot.</p>\r\n'),
(65, 1, 'Hüseynqulu Əliyev', '<p>1949- cu ildə&nbsp;Ordubad Rayonunun Bist kəndində&nbsp;anadan olmuşdur.<br />\r\n1982- ci ildə&nbsp;Mirzə&nbsp;Ağa Əliyev adına Azərbaycan D&ouml;vlət İncəsənət İnstitutunun&nbsp;Rəssamlıq fak&uuml;ltəsini bitirmişdir.<br />\r\nAzərbaycan Rəssamlar İttifaqının &uuml;zv&uuml;d&uuml;r.<br />\r\nAzərbaycanın Xalq Rəssamıdır.</p>\r\n'),
(65, 2, 'Hüseynqulu Əliyev', '<p>He was born in 1949 in Bist village of Ordubad region.<br />\r\nIn 1982 he graduated from the Art Faculty of the Azerbaijan State Institute of Arts named after Mirza Aga Aliyev.<br />\r\nHe is a member of the Artists&#39; Union of Azerbaijan.<br />\r\nHe is the People&#39;s Artist of Azerbaijan.</p>\r\n'),
(60, 1, 'Ülviyyə Həmzəyeva', '<p>&Uuml;lviyyə&nbsp;Həmzəyeva</p>\r\n'),
(60, 2, 'Ülviyyə Həmzəyeva', '<p>&Uuml;lviyyə Həmzəyeva</p>\r\n'),
(59, 1, 'Telman Abdinov', '<p>ABDİNOV Telman Manaf oğlu. 01.07.1954-c&uuml; ildə Şahbuz rayonunun K&uuml;l&uuml;s kəndində anadan olmuşdur. Rəssam &ndash; qrafik. Azərbaycan Respublikasının əməkdar rəssamı (2002). Əzim Əzimzadə adına Azərbaycan D&ouml;vlət Rəssamlıq məktəbini bitirmişdir (1978). 1988-ci ildən Azərbaycan Rəssamlar İttifaqının, 2012-ci ildən isə Nax&ccedil;ıvan MR Rəssamlar Birliyinin &uuml;zv&uuml;d&uuml;r. Rəngkarlıq və qrafika janrlarında bir &ccedil;ox əsərlərin m&uuml;əllifidir. Yaradıcılığında portret janrı m&uuml;h&uuml;m yer tutur. Xalqımızın &uuml;mummilli lideri Heydər Əliyevin, Azərbaycan Respublikasının prezidenti İlham Əliyevin, oftalmoloq alim, Akademik Zərifə xanım Əliyevanın, Məhəmməd H&uuml;seyn Şəhriyarın, Xəlil Rza Ulut&uuml;rk&uuml;n, Bəhruz bəy Kəngərlinin, Əziz Şərifin, Yusif Məmmədəliyevin, Eynəli bəy Sultanovun, H&uuml;seyn Cavidin, Turan Cavidin,Əkbər xan Nax&ccedil;ıvanckinin, Kalbalı xanın, Əcəmi Nax&ccedil;ıvaninin, Nemətulla Nax&ccedil;ıvaninin, Şəhid anasının, Məhəmməd ağa Şahtaxtinskinin və digər g&ouml;rkəmli şəxsiyyətlərin portretləri emosional təsiri, rəng &ccedil;alarlarının poetik cazibəsi ilə diqqəti cəlb edir. Tematik kompozisiyalı və təbiət təsvirli əsərləri &ndash; &ldquo;Gənc qız şanapipik ilə&rdquo;, &ldquo;Həyəcan yaddaş&rdquo;, &ldquo;Bir d&ouml;vlət iki millət&rdquo;, &ldquo;Axşam qələmələri&rdquo;, &ldquo;Ay işığında nat&uuml;rmort&rdquo;, &ldquo;Dəniz&rdquo;, &ldquo;Şahbuzda qış&rdquo;, &ldquo;Terrorist g&uuml;lləsi&rdquo;, &ldquo;Goy qurşağı&rdquo;, &ldquo;Axşam&rdquo;, &ldquo;Batabat&rdquo;, &ldquo;Mənzərə&rdquo;, &ldquo;Qış&rdquo;, &ldquo;Nax&ccedil;ıvan baharı&rdquo;, &ldquo;Nax&ccedil;ıvan abidələri&rdquo; və s. Moskva, Paris, Praqa, Sankt-Peterburq, Yekaterinbuq, İstanbul, Ankara, Bodrum, Ərzurum, Qars, Tehran, Bakı, Nax&ccedil;ıvan şəhərlərində ke&ccedil;irilən sərgilərdə uğurla n&uuml;mayiş olunmuşdur. 2002, 2004, 2005, 2014, 2019-cu illərdə fədi yaradıcılıq sərgiləri ke&ccedil;irmişdir. O, 2012, 2014, 2016, 2018-ci illərdə &nbsp;Nax&ccedil;ıvan Bəşəriyyətin Beşiyi Beynəlxalq Rəsm festivalınında da fəal iştirak etmişdir. Əsərləri Heydər Əliyev Muzeyi, H&uuml;seyn Cavidin EV Muzeyi, Nax&ccedil;ıvan D&ouml;vlət Rəsm Qalereyası, Məmməd Arazın Ev Muzeyi, Ədəbiyyat Muzeyi, Cəmşid Nax&ccedil;ıvanski Muzeyi, Milli Dəyərlər Muzeyi, &ldquo;Xan Sarayı&rdquo; D&ouml;vlət Tarix &ndash; Memarlıq M&ouml;minə Xatın və A&ccedil;ıq Səma Altında Muzey Kompleksi, Şahbuz Rayonu Tarix &ndash; Diyarş&uuml;naslıq Muzeyi, Bəhruz Kəngərli Muzeyi, Cəlil Məmmədquluzadənin Ev Muzeyi, Nax&ccedil;ıvan D&ouml;vlət Tarix Muzeyi, Nax&ccedil;ıvan D&ouml;vlət Xalca Muzeyi, Xatirə Muzeyi, Yusif Məmmədəliyevin Ev Muzeyi, Şahtaxtinskilərin Muzeyi, Məmməd Tağı Sidqinin Ev Muzeyi və bir &ccedil;ox şəxsi kolleksiyalarda qorunub saxlanılır.</p>\r\n'),
(59, 2, 'Telman Abdinov', '<p>ABDINOV Telman Manaf oglu. He was born on July 1, 1954 in Kulus village of Shahbuz region. Artist - graphic. Honored Artist of the Republic of Azerbaijan (2002). He graduated from the Azerbaijan State Art School named after Azim Azimzade (1978). He has been a member of the Union of Artists of Azerbaijan since 1988, and the Union of Artists of Nakhchivan AR since 2012. He is the author of many works in the genres of painting and graphics. The portrait genre plays an important role in his work. National leader of our people Heydar Aliyev, President of the Republic of Azerbaijan Ilham Aliyev, ophthalmologist, Academician Zarifa Aliyeva, Muhammad Huseyn Shahriyar, Khalil Rza Uluturk, Bahruz bey Kangarli, Aziz Sharif, Yusif Mammadaliyev, Eynali bey Sultanov, Huseyn Javid, Turan Javid, Akbar khan The portraits of Nakhchivanchi, Kalbali khan, Ajami Nakhchivani, Nematulla Nakhchivani, Shahid&#39;s mother, Mohammad agha Shahtakhtinski and other prominent personalities attract attention with their emotional impact and poetic charm of color shades. Works with thematic composition and description of nature - &quot;Young girl with honeymoon&quot;, &quot;Exciting memory&quot;, &quot;One state, two nations&quot;, &quot;Evening pens&quot;, &quot;Still life in the moonlight&quot;, &quot;Sea&quot;, &quot;Winter in Shahbuz&quot;, &quot;Terrorist bullet&quot; , &ldquo;Goy belt&rdquo;, &ldquo;Evening&rdquo;, &ldquo;Batabat&rdquo;, &ldquo;Landscape&rdquo;, &ldquo;Winter&rdquo;, &ldquo;Nakhchivan spring&rdquo;, &ldquo;Nakhchivan monuments&rdquo; and others. It has been successfully demonstrated at exhibitions in Moscow, Paris, Prague, St. Petersburg, Yekaterinburg, Istanbul, Ankara, Bodrum, Erzurum, Kars, Tehran, Baku, Nakhchivan. He held exhibitions in 2002, 2004, 2005, 2014, 2019. He also took an active part in the Nakhchivan Cradle of Humanity International Art Festival in 2012, 2014, 2016 and 2018. Works Heydar Aliyev Museum, Huseyn Javid&#39;s House Museum, Nakhchivan State Art Gallery, Mammad Araz&#39;s House Museum, Literature Museum, Jamshid Nakhchivanski Museum, Museum of National Values, &quot;Khan Palace&quot; State Historical-Architectural Faithful Woman and Open-Air Museum Complex, History - Ethnography Museum, Bahruz Kangarli Museum, Jalil Mammadguluzadeh&#39;s House Museum, Nakhchivan State History Museum, Nakhchivan State Carpet Museum, Memorial Museum, Yusif Mammadaliyev&#39;s House Museum, Shakhtakhtinsky Museum, Mammad Tagi Sidgi&#39;s House Museum and many other private colleges.</p>\r\n'),
(27, 1, 'Qəhrəmanlar unudulmur', '<p>B.Kəngərli adına sərgi salonu. 23 fevral 2021-ci il saat 15:00-da</p>\r\n'),
(27, 2, 'Heroes are not forgotten', '<p>Exhibition hall in the name of B. Canary. February 23, 2021 at 3:00 p.m.</p>\r\n'),
(26, 1, 'İRS', '<p>Bilik g&uuml;n&uuml;nə&nbsp;həsr olunmuş&nbsp;uşaqların əl işlərindən ibarət rəsm sərgisi</p>\r\n'),
(26, 2, 'IRS', '<p>Painting exhibition of children&#39;s handiwork dedicated to Knowledge Day</p>\r\n'),
(25, 1, 'Gənc rəssamların sənət döyüşü', '<p>Nax&ccedil;ıvanda gənc rəssamların sənət d&ouml;y&uuml;ş&uuml;</p>\r\n'),
(25, 2, 'Art battle', '<p>Art battle Nakhchivan</p>\r\n'),
(83, 1, 'Dekorativ tətbiqi sənət', '<p>Bu sənətə el arasında &quot;xalq sənəti&quot; də deyirlər. Bu sənətin xal&ccedil;a&ccedil;ılıq, batik (kəlağayı), qobelen, dulus&ccedil;uluq (keramika), toxuma və bədii tikmə, zərgərlik, bədii ş&uuml;şə, bədii oyma (ağac, metal, daş, s&uuml;m&uuml;k &uuml;zərində oyma) və digər n&ouml;vləri vardır.</p>\r\n\r\n<p>Dekorativ -tətbiqi sənət, həm&ccedil;inin bədii sənətin m&uuml;xtəlif n&ouml;vlərini əhatə edir. Onların arasında d&ouml;ymə sənəti və zərgərlik, metal &uuml;zərində işləmələr, ağac, daş və s&uuml;m&uuml;k &uuml;zərində oyma naxış, xal&ccedil;a&ccedil;ılıq, h&ouml;rmə sənəti, ornamental toxuculuq və basmanaxış, toxuma və bədii tikmələr və bir &ccedil;ox digərlərini g&ouml;stərə bilərik.</p>\r\n\r\n<p>Xal&ccedil;a&ccedil;ılıq</p>\r\n\r\n<p>qədim toxunmuş xal&ccedil;a<br />\r\nAzərbaycan xal&ccedil;a&ccedil;ılıq sənəti &mdash; bədii yaradıcılığın xalqın mənəvi həyatı və məişəti ilə sıx bağlı &ccedil;oxəsrlik ənənələri olan ən maraqlı sənətdən biridir. Azərbaycanda Qarabağ, Qazax, Gəncə, Təbriz, Şirvan, Abşeron və Quba kimi b&ouml;y&uuml;k xal&ccedil;a&ccedil;ılıq məktəbləri olub.</p>\r\n\r\n<p>Batik</p>\r\n\r\n<p>Kəlağayı<br />\r\nQədim sənət n&ouml;v&uuml; olub, kəlağayı mənasını verir. Kəlağayı &mdash; ipək sapdan toxunmuş d&ouml;rdk&uuml;nc formalı qadın baş &ouml;rt&uuml;y&uuml;d&uuml;r. Azərbaycanın qərb zonasında buna &quot;&ccedil;arqat&quot; da deyilir. Kəlağayı istehsalı Azərbaycanda qədimdən məlumdur.</p>\r\n\r\n<p>Şəki və Basqal kəlağayıları sırasında &quot;Şah buta&quot;, &quot;Saya buta&quot; , &quot;Xırda buta&quot; &ccedil;eşidlərindən daha &ccedil;ox istifadə olunub . &quot;Heyratı&quot;, &quot;Soğanı&quot;, &quot;İstiotu &quot;, &quot;Albuxarı&quot;, &quot;Abi&quot;, &quot;Yeləni&quot; adlı əlvan kəlağayılar b&ouml;y&uuml;k ş&ouml;hrət qazanmışdı.</p>\r\n\r\n<p>Qobelen<br />\r\nHiss və duyğuların sənətidir, d&uuml;ş&uuml;ncə tərzidir. Qobelen d&uuml;nyada geniş yayılmış, Azərbaycanda isə qədim xalq mədəniyyətinə aid s&uuml;jetli xal&ccedil;a sənətidir. Qobelenin hazırlanma texnikasının əsasını &ouml;ncədən &ccedil;əkilmiş eskiz, fikir, ideya təşkil edir.</p>\r\n\r\n<p>Toxuma və bədii tikmə<br />\r\nBədii tikmə &uuml;&ccedil;&uuml;n yerli ipək və yun saplardan və yerli basmaqəliblərdən istifadə olunub. XIX - XX əsrin əvvəllərində bədii tikmələr &uuml;&ccedil;&uuml;n əsas rol oynayan material yerli istehsal olan qonovuz, [[darai] və məxmər idi.</p>\r\n\r\n<p>Boyama &uuml;&ccedil;&uuml;n bitki mənşəli boyayıcılardan istifadə olunur. Azərbaycan bədii tikmələrində ən &ccedil;ox işlədilən bitki motivləri qızılg&uuml;l, nərgiz, qərənfil, lalə, zanbaq, meyvə ağaclarının yarpaqları &mdash; nar, heyva, al&ccedil;a &ccedil;i&ccedil;əkləri, eləcə də s&uuml;nb&uuml;l və m&uuml;xtəlif formalı yarpaqlardı. Bədii tikmələrdə əsasən quşların təsvirinə &uuml;st&uuml;nl&uuml;k verirlər. Bədii tikmə n&ouml;v&uuml;ndən ən geniş yayılmış forması piləktikmədir.</p>\r\n\r\n<p>Bədii ş&uuml;şə<br />\r\nDekorativ əşyaların, vitrajların interyerdə &ouml;z əksini tapmasıdır. Təsviri sənətin qədim n&uuml;munələri arasında Mingə&ccedil;evirdən, Şamaxıdan tapılmış m&uuml;xtəlif tipli və formalı bədii ş&uuml;şə məmulatı n&uuml;munələri Azərbaycanda ş&uuml;şə istehsalının da m&ouml;vcud olduğunu g&ouml;stərir.</p>\r\n\r\n<p>Bədii oyma</p>\r\n\r\n<p>Bədii Oyma<br />\r\nAğac, metal, daş, s&uuml;m&uuml;k &uuml;zərində oyma. Bədii oyma &mdash; dekorativ sənətin ən qədim və ən geniş yayılmış n&ouml;vlərindən biridi. Daş, ağac, s&uuml;m&uuml;k və başqa materiallar &uuml;zərində işlənir. Azərbaycanın ən qədim yaşayış məskənlərindən olan (Qobustan, Gəmiqaya və s.) daş &uuml;zərində oymaları bədii oyma sənətinin ilkin n&uuml;munələri kimi g&ouml;stərmək olar.</p>\r\n'),
(83, 2, 'Decorative applied art', '<p>This art is also called &quot;folk art&quot;. This art includes carpet weaving, batik (kalagai), tapestry, pottery (ceramics), weaving and embroidery, jewelry, artistic glass, artistic carving (carving on wood, metal, stone, bone) and other types.</p>\r\n\r\n<p>Decorative-applied art also covers various types of art. Among them are forging and jewelry, metalwork, wood, stone and bone carving, carpet weaving, wicker, ornamental weaving and embroidery, weaving and embroidery, and many others.</p>\r\n\r\n<p>Carpet weaving</p>\r\n\r\n<p>ancient woven carpet<br />\r\nAzerbaijani carpet weaving is one of the most interesting arts with centuries-old traditions of artistic creation closely connected with the spiritual life and life of the people. There were large carpet-weaving schools in Azerbaijan, such as Karabakh, Gazakh, Ganja, Tabriz, Shirvan, Absheron and Guba.</p>\r\n\r\n<p>Batik</p>\r\n\r\n<p>The future<br />\r\nIt is an ancient art form and means kalagai. Kalagayi is a rectangular women&#39;s headdress woven from silk thread. In the western part of Azerbaijan, it is also called &quot;chargat&quot;. The production of kalagai has long been known in Azerbaijan.</p>\r\n\r\n<p>&quot;Shah buta&quot;, &quot;Saya buta&quot;, &quot;Khirda buta&quot; varieties were mostly used among Sheki and Basgal kalagai. &quot;Heyratı&quot;, &quot;Onanı&quot;, &quot;Pepper&quot;, &quot;Albuxarı&quot;, &quot;Abi&quot;, &quot;Yeleni&quot; were very popular.</p>\r\n\r\n<p>Qobelen<br />\r\nIt is the art of feelings and emotions, the way of thinking. Tapestry is a widespread carpet art in the world, and in Azerbaijan it is a subject of ancient folk culture. The basis of the technique of making tapestries is a pre-drawn sketch, idea.</p>\r\n\r\n<p>Textile and embroidery<br />\r\nLocal silk and wool threads and local printing patterns were used for embroidery. In the 19th and early 20th centuries, the main materials used for embroidery were locally produced gonovuz, [[darai] and velvet.</p>\r\n\r\n<p>Herbal dyes are used for coloring. The most widely used plant motifs in Azerbaijani embroidery were roses, daffodils, carnations, tulips, lilies, leaves of fruit trees - pomegranate, quince, cherry blossoms, as well as spikes and leaves of various shapes. In art embroidery, they mainly prefer the depiction of birds. The most common form of embroidery is embroidery.</p>\r\n\r\n<p>Art glass<br />\r\nIt is the reflection of decorative items, stained glass in the interior. Among the ancient examples of fine arts, samples of artistic glass products of different types and shapes found in Mingachevir and Shamakhi show that there is glass production in Azerbaijan.</p>\r\n\r\n<p>Artistic carving</p>\r\n\r\n<p>Artistic Engraving<br />\r\nCarving on wood, metal, stone, bone. Art carving was one of the oldest and most widespread types of decorative art. Worked on stone, wood, bone and other materials. One of the oldest settlements in Azerbaijan (Gobustan, Gamigaya, etc.) stone carvings can be considered as the first examples of artistic carving.</p>\r\n'),
(82, 1, 'Qrafika', '<p><strong>Qrafika</strong>&nbsp;təsviri sənətin bir n&ouml;v&uuml;d&uuml;r. Bura m&uuml;xtəlif texniki &uuml;sullarla işlənmiş sənət əsərləri daxildir. Yunanca &ldquo;graphike&rdquo; &ndash; rəsm, şəkil deməkdir.</p>\r\n\r\n<p>XIX əsrdə qrafikanın əsasını yalnız cizgilər, yaxud ağ və qara xətlər təşkil edirdi. Sonradan bu sənət n&ouml;v&uuml; daha da təkmilləşib. Kontur xətlər, cizgi, ləkə, həm&ccedil;inin rəsm &ccedil;əkilən əsas materialın ağ yerliyi qrafikanın əsas bədii vasitələrindən olub. İşlənmə texnikasına g&ouml;rə qrafika sənəti iki hissəyə ayrılır &ndash; rəsm və &ccedil;ap qrafikası. Onlardan ən qədim və ənənəvi n&ouml;v&uuml; rəsmdir. Karandaşla işlənilən rəsm əsasən kağızda, bəzən isə par&ccedil;a &uuml;zərində &ccedil;əkilir. Bu rəsmlər yalnız bir n&uuml;sxədə yaranır. Bəzi əsərlər rəng baxımından zəngin olduğuna g&ouml;rə, onların boyakarlıqla yaxınlığı var: bunlar sulu boyalarla &ccedil;əkilən (akvarel, quaş, tempera) və yaxud pastel (rəngli karandaş) texnikasında &ccedil;əkilmiş rəsmlərdir. Qrafika &uuml;sulu ilə əsər, portret, mənzərə və s. janrlarda rəsmlər yaratmaq m&uuml;mk&uuml;nd&uuml;r. Qrafikanın digər bir n&ouml;v&uuml; olan &ccedil;ap qrafikasını rəsmdən fərqləndirən əsas cəhət odur ki, &ccedil;ap qrafikası əsərlərindən eyni keyfiyyətdə istənilən qədər n&uuml;sxə almaq m&uuml;mk&uuml;nd&uuml;r. Buraya metal, ağac, daş və maqnezium &uuml;zərində qazılmış və ya həkk olunmuş rəsmlər daxildir. &Ccedil;ap qrafikasında qrafik l&ouml;vhənin materialından asılı olaraq m&uuml;xtəlif texnikalar yaranıb. Metal, yəni mis &uuml;zərində iynə ilə cızılmış və sonra basma &uuml;sulu ilə yaranmış qrav&uuml;rlərə ofort deyilir. Daş &uuml;zərində həkk olunmuş qrafikaya litoqrafiya ( &ldquo;lito&rdquo; yunanca &ldquo;daş&rdquo; deməkdir), ağac &uuml;zərindəki qrafikaya isə ksiloqrafiya (&ldquo;ksilo&rdquo; &ndash; yunanca &ldquo;ağac&rdquo; deməkdir) deyilir. Nisbətən sonra yaranmış linoqrav&uuml;r &ndash; linoleumu qazımaqla işlənilir. Sahəsinə g&ouml;rə qrafikanın kitab qrafikası (kitabın tərtibatı), elmi-tədqiqat qrafikası (elmi cədvəllər, &ccedil;ertyojlar, sxemlər, xəritələr), plakat qrafikası, sənaye qrafikası (məhsulun tərkibini bildirən a&ccedil;ıqcalar, dəvətnamələr, paltar etiketləri) və s. kimi n&ouml;vləri var.</p>\r\n\r\n<p><strong>Qrafik</strong>&nbsp;&ndash; [yun. graphikos &ndash; əks olunmuş, &ccedil;əkilmiş] 1)m&uuml;xtəlif proseslərin kəmiyyətcə vəziyyətinin cizgilərlə (xətlərlə) təsviri. Məsələn, hava təzyiqinin dəyişməsini g&ouml;stərən qrafik; 2)istehsalatda, nəqliyyatda və s.-də işlərin g&ouml;r&uuml;ləcək m&uuml;ddətini və normaları dəqiq g&ouml;stərən cədvəl, plan. Məsələn, qrafik &uuml;zrə işləmək; 3)təsviri incəsənətin n&ouml;v&uuml;. Reklam qrafiki şəkildən yerinə yetirilmə &uuml;sulu ilə fərqlənir. Hal-hazırda kompy&uuml;ter metoduna əsaslanır; 4)m&uuml;xtəlif prosesləri əyri xətlərlə g&ouml;stərən diaqram, cədvəl; 5)funksional asılılığın xətlər vasitəsilə m&uuml;stəvi &uuml;zərində həndəsi təsviri; 6)m&uuml;xtəlif proseslərin kəmiyyətcə vəziyyətinin cizgilərlə (xətlərlə) təsviri.</p>\r\n'),
(82, 2, 'Graphics', '<p>Graphics are a form of fine art. This includes works of art developed in various technical ways. The Greek word &quot;graphike&quot; means a picture.<br />\r\nIn the nineteenth century, graphics were based only on lines or black and white lines. Later, this art form was further improved. Contour lines, cartoons, spots, as well as the white background of the main material painted were the main artistic means of graphics. According to the design technique, the art of graphics is divided into two parts - drawing and printing graphics. The oldest and most traditional of them is painting. A pencil drawing is drawn mainly on paper and sometimes on fabric. These drawings appear in only one copy. Because some works are rich in color, they are closely related to painting: these are watercolor (watercolor, gouache, tempera) or pastel (colored pencil) paintings. Works, portraits, landscapes, etc. by graphics. It is possible to create drawings in genres. The main thing that distinguishes printing, which is another type of graphics, from drawing is that it is possible to get as many copies of printed graphics as you want. This includes paintings carved or engraved on metal, wood, stone and magnesium. Depending on the material of the graphic board, different techniques have emerged in print graphics. Engravings on metal, ie copper, drawn with a needle and then created by printing, are called etching. The graphics engraved on the stone are called lithography (&quot;lito&quot; means &quot;stone&quot; in Greek), and the graphics on the tree are called xylography (&quot;xylo&quot; means &quot;tree&quot; in Greek). The relatively later linocut is processed by digging linoleum. According to the field of graphics, book graphics (book design), research graphics (scientific tables, drawings, diagrams, maps), poster graphics, industrial graphics (postcards, invitations, clothing labels), etc. There are types like.</p>\r\n');
INSERT INTO `posts_translation` (`post_id`, `lang_id`, `title`, `content`) VALUES
(81, 1, 'Heykəltəraşlıq', '<p>Heykəltəraşlıq əsasən 2 n&ouml;və ayrılır: həcmli və ya dayirəvi relyef (barelyef,qorelyef) Heykəlin daha yaxşı alınması &uuml;&ccedil;&uuml;n əsas plan, işıq m&uuml;stəvisi, k&uuml;tlə və həcm b&ouml;y&uuml;k rol oynayır.</p>\r\n\r\n<p>Heykəllərin hazırlanması<br />\r\nHeykəllərin hazırlanmasında m&uuml;xtəlf materiallardan istifadə olunur: daş (mərmər, əhəngdaşı, qumdaşı, qranit və s.), taxta, s&uuml;m&uuml;k, metal (b&uuml;r&uuml;nc, dəmir, tunc və s.), gil, yanmış gil, keramika (terrakota, mayolika, saxsı, &ccedil;ini və s.) gips və digərləri. Ənənəvi materiallarla yanaşı, m&uuml;asir heykəltəraşlıqda tamamilə fərqli materiallardan da istifadə olunur: ş&uuml;şədən, buzdan, qardan, kağızdan da heykəl hazırlanır.</p>\r\n\r\n<p>Sahələri<br />\r\nHeykəltəraşlıq sənətinin ən qədim d&ouml;vrlərdən bəri &uuml;&ccedil; sahəsi məlumdur: monumental, dekorativ və dəzgah heykəltəraşlığı. Monumental heykəltəraşlıq əsərləri əksər hallarda a&ccedil;ıq havada, b&ouml;y&uuml;k şəhərlərin meydanlarında, bağlarda və bəzən isə ictimai binaların daxilində qoyulur. İri şəhərlərin meydanlarında m&uuml;h&uuml;m tarixi hadisələrin, siyasi xadimlərin, sərkərdələrin, m&uuml;təfəkkirlərin, yazı&ccedil;ıların, xalqın rəğbətini və h&ouml;rmətini qazanmış şəxsiyyətlərin şərəfinə m&ouml;htəşəm heykəltəraşlıq abidələri y&uuml;ksəlir. Sərgilərdə n&uuml;mayiş etdirilən 3 &ouml;l&ccedil;&uuml;l&uuml; heykəllər dəzgah heykəltəraşlığı n&uuml;munələri sayılır. Heykəltəraşlığın ən ibtidai forması &ndash; daşdan hazırlanan fiqurlardır. Orta əsrlərə aid edilən, Şamaxı və Ağdam şəhərləri ətrafında tapılmış daş insan fiqurları heykəltəraşlığımızın daha təkmilləşmiş n&uuml;munəsi hesab edilir. Bayıl qəsrindəki daşoyma n&uuml;munələri (XIII əsr), məzarlar &uuml;zərinə qoyulan at və qo&ccedil; fiqurlarını (XV&ndash;XIX əsrlər) da bu qəbildən saymaq olar. . Heykəltəraşlıq sənətinin ən məşhur n&uuml;munələri arasında XIII əsrdə Bakı limanında tikilmiş Şirvanşahlar sarayını, &quot;Bayıl qəsri&quot;, yaxud &quot;Səbayıl&quot; adlanan memarlıq abidəsini g&ouml;stərmək olar.</p>\r\n\r\n<p>Azərbaycanın professional heykəltəraşlığı<br />\r\nAzərbaycanın professional heykəltəraşlığı XX əsrin əvvəlində formalaşaraq inkişaf etmişdir.Daha dəqiq, milli heykəltəraşlığımızın əsas inkişafı 1930&ndash;1940-cı illərə təsad&uuml;f edir. Cəlal Qaryağdı , Fuad Əbd&uuml;lrəhmanova, Pyotr Sabsay, Mirəli Mirqasımov , Tokay Məmmədov, &Ouml;mər Eldarovun adı ilən bağlı olmuşdur. Fuad Əbd&uuml;lrəhmanov hələ otuzuncu illərdə yaratdığı obarazlarda monumental formalara &uuml;st&uuml;nl&uuml;k verirdi.Firdovsinin Şahnamə poemasındakısurətlərdən biri &quot;Ox atan gənc&quot; fiquru buna g&ouml;zəl n&uuml;m&uuml;nə ola bilər.Fuad Əbd&uuml;lrəhmanovun &quot;Nizami&quot; abidəsi x&uuml;susilə diqqət &ccedil;əkəndir. Cəlal Qaryağdının yaradıcılığında &quot;Xosrov və Şirin&quot; poemasının motivləri əsasında &quot;Fərhad dağı yarır&quot; qorelyefini x&uuml;susi qeyd etmək lazımdır.</p>\r\n\r\n<p>M&uuml;asir d&ouml;vrdə Azərbaycan heykəltəraşlığı<br />\r\nM&uuml;asir d&ouml;vrdə Azərbaycan heykəltəraşlığı &Ouml;mər Eldarov (H.Cavid, Bakı, 1993, tunc; Atat&uuml;rk, Bakı, 2010, tunc), Tokay Məmmədov (Koroğlu, Bakı, 2012, tunc) kimi klassiklərlə yanaşı, Fuad Salayev (R.Behbudov, Bakı, 2016, tunc), Fazil Nəcəfov (Q.Qarayev, Bakı, 2014, qranit), Akif Əsgərov (akad. Y.Məmmədəliyev, Bakı, 1998, tunc), Natiq Əliyev (Zivər bəy Əhmədbəyov, Bakı, 2011, tunc), G&ouml;r&uuml;ş Babayev (Dədə Qorqud, Bakı, 2013, tunc) və başqalarının yaradıcılığı ilə təmsil olunur. M&uuml;stəqillik d&ouml;vr&uuml;ndə paytaxt Bakı ilə yanaşı, b&ouml;lgələrdə də yaddaqalan heykəllər qoyulmuşdu. Şərif Şərifovun Gəncədə (Həyat ağacı, 2015, tunc), Elman Cəfərovun Nax&ccedil;ıvanda (Dədə Qorqud, 1999, tunc) ucaltdığı monumental əsərləri maraqlı kompozisiya həlli ilə se&ccedil;ilir. Azərbaycanın bir &ccedil;ox heykəltəraşlarının &ouml;lkəmizin h&uuml;dudlarından kənarda da əsərləri ucaldılmışdı. &Ouml;mər Eldarovun(&Uuml;.Hacıbəyli, Vyana, Avstriya, 2006, tunc, mərmər), Səlhab Məmmədov və Əli İbadullayevin (Nizami Gəncəvi, Roma, İtaliya, 2012, tunc), İmran Mehdiyevin (Xurşudbanu Natəvan, Vaterloo, Bel&ccedil;ika, 2016, tunc) yaratdığı əsərlər məhz bu qəbildəndir. M&uuml;asir d&ouml;vr Azərbaycan heykəltaraşlığı XX əsr heykəltaraşlıq ənənlələrindən bəhrələnərək yeni formalar axtarışındadır</p>\r\n'),
(81, 2, 'Sculpture', '<p>There are two main types of sculpture: volumetric or circular relief (bas-relief, high-relief).</p>\r\n\r\n<p>Making sculptures<br />\r\nVarious materials are used in the manufacture of sculptures: stone (marble, limestone, sandstone, granite, etc.), wood, bone, metal (bronze, iron, bronze, etc.), clay, burnt clay, ceramics (terracotta, majolica, pottery, porcelain, etc.) gypsum and others. In addition to traditional materials, modern sculpture uses completely different materials: glass, ice, snow and paper.</p>\r\n\r\n<p>Fields<br />\r\nThree areas of sculpture have been known since ancient times: monumental, decorative, and bench sculpture. Monumental sculptures are often placed outdoors, in large city squares, gardens, and sometimes inside public buildings. In the squares of large cities, magnificent sculptural monuments are erected in honor of important historical events, political figures, commanders, thinkers, writers, people who have won the sympathy and respect of the people. The three-dimensional sculptures displayed at the exhibitions are examples of bench sculpture. The most primitive form of sculpture is stone figures. Stone human figures dating back to the Middle Ages, found around the cities of Shamakhi and Agdam, are considered to be a more perfect example of our sculpture. Examples of stone carvings in Bayil Castle (13th century) and horse and ram figures on tombs (15th-19th centuries) can be considered as such. . Among the most famous examples of sculpture are the Palace of the Shirvanshahs, built in the 13th century in the port of Baku, and an architectural monument called &quot;Bayil Castle&quot; or &quot;Sabail&quot;.</p>\r\n\r\n<p>Professional sculpture of Azerbaijan<br />\r\nAzerbaijan&#39;s professional sculpture was formed and developed in the early twentieth century. More precisely, the main development of our national sculpture dates back to the 1930s and 1940s. It was connected with the names of Jalal Qaryagdi, Fuad Abdulrahmanova, Peter Sabsay, Mirali Mirgasimov, Tokay Mammadov, Omar Eldarov. Fuad Abdulrahmanov preferred monumental forms in the images he created in the thirties. One of the images in Firdovsi&#39;s poem Shahnameh, the figure &quot;Young archer&quot; can be a good example of this. The monument to Fuad Abdulrahmanov &quot;Nizami&quot; is especially noteworthy. In the work of Jalal Qaryagdi, based on the motives of the poem &quot;Khosrov and Shirin&quot;, the high-relief &quot;Farhad Mountain splits&quot; should be especially noted.</p>\r\n\r\n<p>Azerbaijani sculpture in modern times<br />\r\nAlong with such classics as modern Azerbaijani sculpture Omar Eldarov (H.Javid, Baku, 1993, bronze; Ataturk, Baku, 2010, bronze), Tokay Mammadov (Koroglu, Baku, 2012, bronze), Fuad Salayev (R.Behbudov, Baku, 2016, bronze), Fazil Najafov (G.Garayev, Baku, 2014, granite), Akif Asgarov (acad. Y. Mammadaliyev, Baku, 1998, bronze), Natig Aliyev (Ziver bey Ahmadbeyov, Baku, 2011, bronze), Meeting It is represented by the works of Babayev (Dada Gorgud, Baku, 2013, bronze) and others. During the independence period, memorable statues were erected in the regions along with the capital Baku. The monumental works erected by Sharif Sharifov in Ganja (Tree of Life, 2015, bronze) and Elman Jafarov in Nakhchivan (Dada Gorgud, 1999, bronze) are distinguished by an interesting compositional solution. Works of many Azerbaijani sculptors were erected outside our country. Omar Eldarov (U.Hajibeyli, Vienna, Austria, 2006, bronze, marble), Salhab Mammadov and Ali Ibadullayev (Nizami Ganjavi, Rome, Italy, 2012, bronze), Imran Mehdiyev (Khurshudbanu Natavan, Waterloo, Belgium, 2016, bronze) His works are of this kind. Modern Azerbaijani sculpture is looking for new forms, taking advantage of the twentieth-century sculptural traditions.</p>\r\n'),
(80, 1, 'Yağlı boya', '<p>Yağlı boya rəssamlığı haqqında ilkin məlumat bizans sənətkarı, keşiş Teofilin kitabında (&ldquo;M&uuml;xtəlif incəsənət siyahısı&rdquo; &mdash; lat. &ldquo;Schedula diversarum artium&rdquo; yaxud lat. &ldquo;De diversibus artibus&rdquo;) verilmişdir.[1]</p>\r\n\r\n<p>Avropada yağlı boya rəssamlığının ibtidai n&uuml;munələri tarixi XIII əsrə gedib &ccedil;ıxır. İntibah d&ouml;vr&uuml;, 1420 ci ildən başlayaraq yağlı boya rəssamlığı yayılmağa başlayır.[1] Sonralar XV əsrdə bu texniki &uuml;sul niderland rəssamı Yan van Eyk tərəfindən daha da təkmilləşdirilmişdir.[2] Buna onun bu d&ouml;vrdə yağlı boya texnikası ilə &ccedil;əkmiş olduğu &ldquo;&Ccedil;almalı adam portreti&rdquo; əsəri tipik misaldır.[2] XV əsrdə (1460-1470) italyan rəssamı Antonello da Messina bu rəssamlıq n&ouml;v&uuml;n&uuml; İtaliyaya gətirmiş olur. XVI əsrdə Piter Paul Rubens tərəfindən yağlı boya rəssamlığı tempera texnikası ilə kombinə edilir.</p>\r\n\r\n<p>Ən qədim yağlı boya işi isə VII əsrin ortalarına aiddir. Talib vandalizminin qurbanı olmuş, partladılaraq dağıdılmış Babyan Budda heykəlləri yaxınlığındakı 50 mağaradan on ikisində m&ouml;vcud olan divar rəsmləri bunu bir daha s&uuml;but edir.[3]</p>\r\n\r\n<p>Texnologiyası<br />\r\nYağlı boyaların tərkibi quru piqment və bitki yağdan ibarətdir. Bu məqsədlə əsasən kətan toxumu, xaşxaş və yaxud qoz yağlarından istifadə edilir.</p>\r\n\r\n<p>Piqmentlər<br />\r\nPiqmentlər iki c&uuml;r, a&ccedil;ıq (şəffaf) və t&uuml;nd (qeyri şəffaf) olurlar. A&ccedil;ıq piqmentlər &ouml;z-&ouml;zl&uuml;y&uuml;ndə şəffaf olmaqla rəng laylarına parıltı və bir dərinlik verir. T&uuml;nd qeyri şəffaf piqmentlər isə qapayıcı və &ouml;rt&uuml;k funksiya daşıyır və onları bərk durulaşdırdıqda işıq ke&ccedil;irməyə qabil olsalar da dərinlikvermə qabiliyyətli deyillər. a&ccedil;ıq (şəffaf) piqmentlər demək olar ki, durulaşdırılmada belə dolğunluqlarını itirmirlər. T&uuml;nd (qeyri şəffaf) piqmentlərin tərkibi m&uuml;xtəlif rənglər qatışığından ibarət olduqda tez bozarmağa məruz qalırlar. Qədim ustalar əsasən a&ccedil;ıq piqmentli boyalara &uuml;st&uuml;nl&uuml;k verirdilər. İmpressionistlər isə əksinə ultramarindən başqa t&uuml;nd (qeyri şəffaf) piqmentli boyalardan istifadə edirdilər. Tərkibi maksimal qatılıqlı bir piqmentə malik olanlar yaxşı boyalar hesab edilir. Lakin bəzən toksikliyi, davamsızlığı aradan qaldırmaq eləcə də bahalı piqmentə qənaət etmək məqsədilə piqment qatışıqlarından da istifadə edilirdi. Bu qatışıqlar s&ouml;zs&uuml;z ki, orijinal piqment boyasından, saflığına və parlaqlığına g&ouml;rə geri qalırlar. Belə qatışıq piqmentli boyaların tərkibində gərək ağ qurğuşun duzu (2PbCO3&middot;Pb(OH)2) olmasın. Əks təqdirdə boya zil t&uuml;nd rənglər &uuml;&ccedil;&uuml;n yararsız sayılır.</p>\r\n'),
(80, 2, 'Oil painting', '<p>Preliminary information about oil painting is given in the book of the Byzantine artist, the priest Theophilus (&quot;List of various arts&quot; - lat. &quot;Schedula diversarum artium&quot; or lat. &quot;De diversibus artibus&quot;). [1]</p>\r\n\r\n<p>The earliest examples of oil painting in Europe date back to the 13th century. During the Renaissance, oil painting began to spread in 1420. [1] Later, in the 15th century, this technique was further refined by the Dutch artist Jan van Eyck. [2] A typical example of this is his portrait of a man with a turban, painted with oil paints at this time. [2] In the 15th century (1460-1470), the Italian artist Antonello da Messina brought this type of painting to Italy. In the 16th century, oil paintings by Peter Paul Rubens were combined with temperament techniques.</p>\r\n\r\n<p>The oldest oil painting dates back to the middle of the 7th century. The murals in twelve of the 50 caves near the Babyan Buddha statues, which were blown up by Taliban vandalism, prove this once again. [3]</p>\r\n\r\n<p>Technology<br />\r\nOil paints contain dry pigment and vegetable oil. For this purpose, mainly flaxseed, poppy or walnut oils are used.</p>\r\n\r\n<p>Pigments<br />\r\nThere are two types of pigments, light (transparent) and dark (opaque). Light pigments are transparent in themselves, giving shine and depth to color layers. Dark opaque pigments, on the other hand, have a coating and coating function, and although they are able to transmit light when diluted, they are not capable of transmitting depth. clear (transparent) pigments almost do not lose their fullness even in dilution. Dark (opaque) pigments are easily discolored when they contain a mixture of different colors. Ancient masters mainly preferred light pigmented paints. The Impressionists, on the other hand, used dark (opaque) pigment dyes other than ultramarine. Good dyes are those that have a pigment with the maximum density. However, pigment mixtures were sometimes used to reduce toxicity, instability, and to save on expensive pigments. These mixtures, of course, lag behind the original pigment dye in terms of purity and brightness. Such mixed pigmented paints should not contain white lead salt (2PbCO3 &middot; Pb (OH) 2). Otherwise, the paint is considered unsuitable for dark colors.</p>\r\n'),
(58, 1, 'Səyyad Bayramov', '<p>1958- ci ildə&nbsp;Şahbuz rayonunun Ke&ccedil;ili kəndində&nbsp;anadan olmuşdur.<br />\r\n1983- c&uuml; ildə&nbsp;Əzim Əzimzadə&nbsp;adına Bakı D&ouml;vlət Rəssamlıq məktəbinin &ldquo; Bədii tərtibat&rdquo; fak&uuml;ltəsini bitirmişdir.<br />\r\nNax&ccedil;ıvan MR Rəssamlar Birliyinin &uuml;zv&uuml;d&uuml;r.<br />\r\nAzərbaycan Rəssamlar İttifaqının &uuml;zv&uuml;d&uuml;r.<br />\r\nNax&ccedil;ıvan Muxtar Respublikasının Əməkdar rəssamıdır.</p>\r\n'),
(58, 2, 'Səyyad Bayramov', '<p>He was born in 1958 in Kechili village of Shahbuz region.<br />\r\nIn 1983, he graduated from the Baku State Art School named after Azim Azimzade, &quot;Art Design&quot; faculty.<br />\r\nHe is a member of the Artists&#39; Union of Nakhchivan AR.<br />\r\nHe is a member of the Artists&#39; Union of Azerbaijan.<br />\r\nHe is an Honored Artist of the Nakhchivan Autonomous Republic.</p>\r\n'),
(79, 1, 'Sulu boya', '<p>Akvarel (və ya&nbsp;<em>sulu boya</em>)&nbsp;(fr&nbsp;Aquarelle&nbsp;&mdash; sulu;&nbsp;acquarello)&nbsp;&mdash; Canlı meymun texnikasıdır. Su&nbsp;ilə birgə istifadə olunan akvarel boyaları incə piqmentli rənglər əmələ gətirməklə m&uuml;xtəlif rəngkarlıq məqsədləri ilə, adətən kağız &uuml;zərində rəsmlər &ccedil;əkmək &uuml;&ccedil;&uuml;n istifadə olunur.</p>\r\n'),
(79, 2, 'Watercolor', '<p>Watercolor (or watercolor) (fr. Aquarelle - watery; it. Acquarello) - is a living ape technique. Watercolors used in combination with water are usually used for painting on paper for a variety of painting purposes, creating subtle pigmented colors.</p>\r\n'),
(134, 1, 'Qadınlar və güllər', '<p>Qadınlar və g&uuml;llər</p>\r\n'),
(134, 2, 'Women and flowers', '<p>Women and flowers</p>\r\n');

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
(1, 'https://az-az.facebook.com/NaxcivanRessamlarBirliyi/', 'https://instagram.com/_naxcivan_ressamlar_birliyi?utm_medium=copy_link', 'https://www.youtube.com/channel/UCDz3FhqwRi2dmwkjP7SbhoQ', 'nrb.nakhchivan@gmail.com', '36 545 58 99');

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
(1, 1, 'Rəssamlar birliyi', 'Naxçıvan Muxtar Respublikası Rəssamlar Birliyi', 'rəssamlar', 'Naxçıvan şəhəri, Heydər Əliyev küçəsi 38', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n'),
(1, 2, 'Union of artists', 'Nakhchivan Autonomous Republic Union Of Artists', 'artists', 'Nakhchivan city, Heydar Aliyev street 38', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id`, `painter_id`, `image`, `status`) VALUES
(46, 0, 'main1.png', 1),
(51, 48, 'ulviyye.jpg', 1),
(52, 49, 'unknown.jpg', 1),
(53, 50, 'mehemmedeli.jpg', 1),
(54, 51, 'cavid.jpg', 1),
(55, 52, 'hesen.jpg', 1);

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
(46, 1, 'RƏSSAMLAR BİRLİYİ'),
(46, 2, 'UNION OF ARTISTS'),
(51, 1, 'SEÇİLƏN ƏSƏRLƏR'),
(51, 2, ' SELECTED WORKS'),
(52, 1, 'SEÇİLƏN ƏSƏRLƏR'),
(52, 2, 'SELECTED WORKS'),
(53, 1, 'SEÇİLƏN ƏSƏRLƏR'),
(53, 2, 'SELECTED WORKS'),
(54, 1, 'SEÇİLƏN ƏSƏRLƏR'),
(54, 2, 'SELECTED WORKS'),
(55, 1, 'SEÇİLƏN ƏSƏRLƏR'),
(55, 2, 'SELECTED WORKS');

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
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `painter_id`, `work_image`, `status`) VALUES
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
(73, 47, 'Qız Qalası - Dəri  üzərində  qrafika 1.jpg', 1),
(74, 47, 'IMG-20200828-WA0054.jpg', 1),
(75, 47, 'Səsin  möcüzəsi - Dəri  üzərində  yandırma  1.jpg', 1),
(76, 47, 'Divanxananın  darvazası - Dəri  üzərində  qrafika 1.jpg', 1),
(77, 49, '6.jpg', 1),
(78, 49, '5.jpg', 1),
(79, 49, '4.jpg', 1),
(80, 49, '3.jpg', 1),
(81, 49, '2.jpg', 1),
(82, 49, '1.jpg', 1),
(83, 48, '6rtyrty.jpg', 1),
(84, 48, '5yuyt.jpg', 1),
(85, 48, '4tyyt.jpg', 1),
(86, 48, '3tr.jpg', 1),
(87, 48, '2y6.jpg', 1),
(88, 48, '1ty.jpg', 1),
(89, 50, 'mehemmedeli1.jpg', 1),
(90, 50, 'mehemmedeli2.jpg', 1),
(91, 50, 'mehemmedeli3.jpg', 1),
(92, 50, 'mehemmedeli4.jpg', 1),
(93, 50, 'mehemmedeli5.jpg', 1),
(94, 50, 'mehemmedeli6.jpg', 1),
(95, 51, 'cavid1.jpg', 1),
(96, 51, 'cavid2.jpg', 1),
(97, 51, 'cavid3.jpg', 1),
(98, 51, 'cavid4.jpg', 1),
(99, 51, 'cavid5.jpg', 1),
(100, 52, 'hesen1.jpg', 1),
(101, 52, 'hesen2.jpg', 1),
(102, 52, 'hesen3.jpg', 1),
(103, 52, 'hesen4.jpg', 1),
(104, 52, 'hesen5.jpg', 1),
(106, 54, 'Capture.PNG', 1),
(107, 55, 'IMG-20200830-WA0066.jpg', 1),
(108, 55, 'IMG-20200830-WA0067.jpg', 1),
(109, 55, 'IMG-20200830-WA0068.jpg', 1),
(110, 55, 'IMG-20200830-WA0069.jpg', 1),
(111, 56, 'IMG-20181026-WA0073-1.jpg', 1),
(112, 56, 'IMG-20181026-WA0076-1.jpg', 1),
(113, 56, 'IMG-20181026-WA0078-1.jpg', 1),
(114, 56, 'IMG-20181026-WA0079.jpg', 1),
(115, 56, 'IMG-20181026-WA0085-1.jpg', 1),
(116, 56, 'IMG-20181026-WA0093.jpg', 1),
(117, 56, 'SnapPic Collage_201810261224457.jpg', 1),
(118, 56, 'SnapPic Collage_2018102611543359.jpg', 1),
(119, 56, 'SnapPic Collage_2018102612014926.jpg', 1),
(120, 56, 'SnapPic Collage_2018102612110796.jpg', 1),
(121, 56, 'SnapPic Collage_2018102612185943.jpg', 1),
(122, 56, 'SnapPic Collage_2018102612255903.jpg', 1),
(123, 56, 'SnapPic Collage_2018102612431163.jpg', 1),
(124, 56, 'SnapPic Collage_2018102612524108.jpg', 1),
(125, 56, 'SnapPic Collage_2018102612842354.jpg', 1),
(126, 56, 'SnapPic Collage_2018102612935970.jpg', 1),
(127, 56, 'SnapPic Collage_20181026115541929.jpg', 1),
(128, 56, 'SnapPic Collage_20181026115835857.jpg', 1),
(129, 56, 'SnapPic Collage_20181026115928615.jpg', 1),
(130, 56, 'SnapPic Collage_20181026121045759.jpg', 1),
(131, 56, 'SnapPic Collage_20181026121140888.jpg', 1),
(132, 56, 'SnapPic Collage_20181026121327750.jpg', 1),
(133, 56, 'SnapPic Collage_20181026121424828.jpg', 1),
(134, 56, 'SnapPic Collage_20181026121719156.jpg', 1),
(135, 56, 'SnapPic Collage_20181026121922696.jpg', 1),
(136, 56, 'SnapPic Collage_20181026122016246.jpg', 1),
(137, 57, 'IMG_20200831_104849.jpg', 1),
(138, 57, 'IMG_20200831_104914.jpg', 1),
(139, 57, 'IMG_20200831_104936.jpg', 1),
(140, 57, 'IMG_20200831_104956.jpg', 1),
(141, 57, 'IMG_20200831_105010.jpg', 1),
(142, 57, 'received_135719410987060.jpeg', 1),
(143, 57, 'received_185962969360667.jpeg', 1),
(144, 57, 'received_365423644340854.jpeg', 1),
(145, 58, 'Buğa bürcü aliminium podnos, döymə..jpg', 1),
(146, 58, 'FB_IMG_1582896816205.jpg', 1),
(147, 58, 'FB_IMG_1582896820263.jpg', 1),
(148, 58, 'FB_IMG_1582896825055.jpg', 1),
(149, 58, 'FB_IMG_1582896830496.jpg', 1),
(150, 58, 'FB_IMG_1582896834092.jpg', 1),
(151, 58, 'FB_IMG_1582896838995.jpg', 1),
(152, 58, 'FB_IMG_1582896843156.jpg', 1),
(153, 58, 'Qadın məclisi mis üzərində döymə..jpg', 1),
(154, 58, 'Yaranış Mis üzərində döymə.jpg', 1),
(155, 59, '8998c7585dd4b7cd67ad6a2e9ddb4dd3.jpg', 1),
(156, 60, 'IMG_6654.jpg', 1),
(157, 60, 'IMG_6655.jpg', 1),
(158, 60, 'IMG_6656.jpg', 1),
(159, 60, 'IMG_6657.jpg', 1),
(160, 60, 'IMG_6658.jpg', 1),
(161, 60, 'IMG_6659.jpg', 1),
(163, 61, 'IMG-20200915-WA0022.jpg', 1),
(164, 61, 'IMG-20200915-WA0023.jpg', 1),
(165, 61, 'IMG-20200915-WA0024.jpg', 1),
(166, 61, 'IMG-20200915-WA0025.jpg', 1),
(167, 61, 'IMG-20200915-WA0026.jpg', 1),
(168, 61, 'IMG-20200915-WA0027.jpg', 1),
(169, 61, 'IMG-20200915-WA0028.jpg', 1),
(170, 61, 'IMG-20200915-WA0030.jpg', 1),
(171, 61, 'IMG-20200915-WA0031.jpg', 1),
(172, 62, 'B.Kengerli mezarustu abidesi 1989 tonlandirilmis beton.jpg', 1),
(173, 62, 'bulaq basinda qizlar heykel qrupu 1983 gips.JPG', 1),
(174, 62, 'cc.JPG', 1),
(175, 62, 'diplom isi menim naxcivanim barelyef.JPG', 1),
(176, 62, 'diskatan heykeli 2002 beton.jpg', 1),
(177, 62, 'etdirse pisik hani. molla nesreddinle bagli hekayelerden goturulmus sujetli dekorativ heykel 1983 gips.JPG', 1),
(178, 62, 'etud 1983.plastilin.JPG', 1),
(179, 62, 'kerim simiyevin qebrustu qorelyefi 1996 tunc nax seher.JPG', 1),
(180, 62, 'koroglu 2008 tunc.jpg', 1),
(181, 62, 'mehdi muellimin qebrustu bustu 2012 tunc nax seh.JPG', 1),
(182, 62, 'memar ecemi ebubekir oglu naxcivani. kompozisiyali barelyefi 183 tonlandirilmis gips. nax tarix muz.jpg', 1),
(183, 62, 'sovet ittifaqi qehremani abbas sahbaz oglu quliyevin qebirustu bust-abidesi 1997 tunc.JPG', 1),
(184, 62, 'sulh barelyef-panno 1982 gips.azerbaycan medeniyyet ve incesenet universiteti.JPG', 1),
(185, 62, 'vv.JPG', 1),
(186, 62, 'vvv.JPG', 1),
(187, 63, '20160301_154345-1.jpg', 1),
(188, 63, '20160301_154503-1.jpg', 1),
(189, 63, '20160301_154657-1.jpg', 1),
(190, 63, '20160301_154839-1.jpg', 1),
(191, 63, '20160301_155622-1.jpg', 1),
(192, 63, '20160301_155717-1.jpg', 1),
(193, 63, '20160301_155745-1.jpg', 1),
(194, 63, '20160301_165127-1.jpg', 1),
(195, 63, '20160301_165747-1.jpg', 1),
(196, 63, '20160301_165832-1.jpg', 1),
(197, 63, '20160301_170002-1.jpg', 1),
(198, 63, '20160301_171834-1.jpg', 1),
(199, 63, '20160301_172328-1.jpg', 1),
(200, 63, '20160301_174420-1.jpg', 1),
(201, 65, '20200820_170845.jpg', 1),
(202, 65, '20200820_170956.jpg', 1),
(203, 65, '20200820_171033.jpg', 1),
(204, 66, '_DSC2888.JPG', 1),
(205, 66, '_DSC2896.JPG', 1),
(206, 66, '_DSC2898.JPG', 1),
(207, 66, '_DSC2899.JPG', 1),
(208, 66, '_DSC2904.JPG', 1),
(209, 66, '_DSC2902.JPG', 1),
(210, 66, '_DSC2912.JPG', 1),
(211, 66, '_DSC2913.JPG', 1),
(212, 68, '_DSC1650.JPG', 1),
(213, 68, '0.jpg', 1),
(214, 68, '1 A .İnkişaf.jpg', 1),
(215, 68, '5Nursu kənd  mnzərsi.jpg', 1),
(216, 68, '6 Haçadağ.jpg', 1),
(217, 68, '7Naxcivan menzeresi1111111111.jpg', 1),
(218, 68, '8 Yaddaş.jpg', 1),
(219, 69, 'IMG-20200829-WA0066.jpg', 1),
(220, 69, 'IMG-20200829-WA0067.jpg', 1),
(221, 69, 'IMG-20200829-WA0068.jpg', 1),
(222, 69, 'IMG-20200829-WA0069.jpg', 1),
(223, 69, 'IMG-20200829-WA0070.jpg', 1),
(224, 69, 'IMG-20200829-WA0071.jpg', 1),
(225, 69, 'IMG-20200829-WA0072.jpg', 1),
(226, 69, 'IMG-20200829-WA0073.jpg', 1),
(227, 69, 'IMG-20200829-WA0074.jpg', 1),
(228, 69, 'IMG-20200829-WA0075.jpg', 1);

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
(82, 1, 'Əsərin adı'),
(82, 2, 'The name of the work'),
(81, 1, 'Əsərin adı'),
(81, 2, 'The name of the work'),
(80, 1, 'Əsərin adı'),
(80, 2, 'The name of the work'),
(77, 1, 'Əsərin adı'),
(77, 2, 'The name of the work'),
(79, 1, 'Əsərin adı'),
(79, 2, 'The name of the work'),
(78, 1, 'Əsərin adı'),
(78, 2, 'The name of the work'),
(88, 1, 'Əsərin adı'),
(88, 2, 'The name of the work'),
(87, 1, 'Əsərin adı'),
(87, 2, 'The name of the work'),
(86, 1, 'Əsərin adı'),
(86, 2, 'The name of the work'),
(85, 1, 'Əsərin adı'),
(85, 2, 'The name of the work'),
(84, 1, 'Əsərin adı'),
(84, 2, 'The name of the work'),
(83, 1, 'Əsərin adı'),
(83, 2, 'The name of the work'),
(89, 1, 'Əsərin adı'),
(89, 2, 'The name of the work'),
(90, 1, 'Əsərin adı'),
(90, 2, 'The name of the work'),
(91, 1, 'Əsərin adı'),
(91, 2, 'The name of the work'),
(92, 1, 'Əsərin adı'),
(92, 2, 'The name of the work'),
(93, 1, 'Əsərin adı'),
(93, 2, 'The name of the work'),
(94, 1, 'Əsərin adı'),
(94, 2, 'The name of the work'),
(95, 1, 'Əsərin adı'),
(95, 2, 'The name of the work'),
(96, 1, 'Əsərin adı'),
(96, 2, 'The name of the work'),
(97, 1, 'Əsərin adı'),
(97, 2, 'The name of the work'),
(98, 1, 'Əsərin adı'),
(98, 2, 'The name of the work'),
(99, 1, 'Əsərin adı'),
(99, 2, 'The name of the work'),
(100, 1, 'Əsərin adı'),
(100, 2, 'The name of the work'),
(101, 1, 'Əsərin adı'),
(101, 2, 'The name of the work'),
(102, 1, 'Əsərin adı'),
(102, 2, 'The name of the work'),
(103, 1, 'Əsərin adı'),
(103, 2, 'The name of the work'),
(104, 1, 'Əsərin adı'),
(104, 2, 'The name of the work'),
(76, 1, 'Əsərin adı'),
(76, 2, 'The name of the work'),
(75, 1, 'Əsərin adı'),
(75, 2, 'The name of the work'),
(74, 1, 'Əsərin adı'),
(74, 2, 'The name of the work'),
(73, 1, 'Əsərin adı'),
(73, 2, 'The name of the work'),
(72, 1, 'Əsərin adı'),
(72, 2, 'The name of the work'),
(71, 1, 'Əsərin adı'),
(71, 2, 'The name of the work'),
(70, 1, 'Əsərin adı'),
(70, 2, 'The name of the work'),
(69, 1, 'Əsərin adı'),
(69, 2, 'The name of the work'),
(68, 1, 'Əsərin adı'),
(68, 2, 'The name of the work'),
(67, 1, 'Əsərin adı'),
(67, 2, 'The name of the work'),
(66, 1, 'Əsərin adı'),
(66, 2, 'The name of the work'),
(65, 1, 'Əsərin adı'),
(65, 2, 'The name of the work'),
(64, 1, 'Əsərin adı'),
(64, 2, 'The name of the work'),
(63, 1, 'Əsərin adı'),
(63, 2, 'The name of the work'),
(62, 1, 'Əsərin adı'),
(62, 2, 'The name of the work'),
(61, 1, 'Əsərin adı'),
(61, 2, 'The name of the work'),
(60, 1, 'Əsərin adı'),
(60, 2, 'The name of the work'),
(59, 1, 'Əsərin adı'),
(59, 2, 'The name of the work'),
(58, 1, 'Əsərin adı'),
(58, 2, 'The name of the work'),
(57, 1, 'Əsərin adı'),
(57, 2, 'The name of the work'),
(56, 1, 'Əsərin adı'),
(56, 2, 'The name of the work'),
(55, 1, 'Əsərin adı'),
(55, 2, 'The name of the work'),
(54, 1, 'Əsərin adı'),
(54, 2, 'The name of the work'),
(53, 1, 'Əsərin adı'),
(53, 2, 'The name of the work'),
(52, 1, 'Əsərin adı'),
(52, 2, 'The name of the work'),
(51, 1, 'Əsərin adı'),
(51, 2, 'The name of the work'),
(50, 1, 'Əsərin adı'),
(50, 2, 'The name of the work'),
(49, 1, 'Əsərin adı'),
(49, 2, 'The name of the work'),
(48, 1, 'Əsərin adı'),
(48, 2, 'The name of the work'),
(47, 1, 'Əsərin adı'),
(47, 2, 'The name of the work'),
(46, 1, 'Əsərin adı'),
(46, 2, 'The name of the work'),
(45, 1, 'Əsərin adı'),
(45, 2, 'The name of the work'),
(44, 1, 'Əsərin adı'),
(44, 2, 'The name of the work'),
(43, 1, 'Əsərin adı'),
(43, 2, 'The name of the work'),
(42, 1, 'Əsərin adı'),
(42, 2, 'The name of the work'),
(41, 1, 'Əsərin adı'),
(41, 2, 'The name of the work'),
(40, 1, 'Əsərin adı'),
(40, 2, 'The name of the work'),
(39, 1, 'Əsərin adı'),
(39, 2, 'The name of the work'),
(38, 1, 'Əsərin adı'),
(38, 2, 'The name of the work'),
(37, 1, 'Əsərin adı'),
(37, 2, 'The name of the work'),
(36, 1, 'Əsərin adı'),
(36, 2, 'The name of the work'),
(35, 1, 'Əsərin adı'),
(35, 2, 'The name of the work'),
(34, 1, 'Əsərin adı'),
(34, 2, 'The name of the work'),
(33, 1, 'Əsərin adı'),
(33, 2, 'The name of the work'),
(32, 1, 'Əsərin adı'),
(32, 2, 'The name of the work'),
(106, 1, 'Əsərin adı'),
(106, 2, 'The name of work'),
(107, 1, 'Əsərin adı'),
(107, 2, 'The name of work'),
(108, 1, 'Əsərin adı'),
(108, 2, 'The name of work'),
(109, 1, 'Əsərin adı'),
(109, 2, 'The name of work'),
(110, 1, 'Əsərin adı'),
(110, 2, 'The name of work'),
(111, 1, 'Əsərin adı'),
(111, 2, 'The name of work'),
(112, 1, 'Əsərin adı'),
(112, 2, 'The name of work'),
(113, 1, 'Əsərin adı'),
(113, 2, 'The name of work'),
(114, 1, 'Əsərin adı'),
(114, 2, 'The name of work'),
(115, 1, 'Əsərin adı'),
(115, 2, 'The name of work'),
(116, 1, 'Əsərin adı'),
(116, 2, 'The name of work'),
(117, 1, 'Əsərin adı'),
(117, 2, 'The name of work'),
(118, 1, 'Əsərin adı'),
(118, 2, 'The name of work'),
(119, 1, 'Əsərin adı'),
(119, 2, 'The name of work'),
(120, 1, 'Əsərin adı'),
(120, 2, 'The name of work'),
(121, 1, 'Əsərin adı'),
(121, 2, 'The name of work'),
(122, 1, 'Əsərin adı'),
(122, 2, 'The name of work'),
(123, 1, 'Əsərin adı'),
(123, 2, 'The name of work'),
(124, 1, 'Əsərin adı'),
(124, 2, 'The name of work'),
(125, 1, 'Əsərin adı'),
(125, 2, 'The name of work'),
(126, 1, 'Əsərin adı'),
(126, 2, 'The name of work'),
(127, 1, 'Əsərin adı'),
(127, 2, 'The name of work'),
(128, 1, 'Əsərin adı'),
(128, 2, 'The name of work'),
(129, 1, 'Əsərin adı'),
(129, 2, 'The name of work'),
(130, 1, 'Əsərin adı'),
(130, 2, 'The name of work'),
(131, 1, 'Əsərin adı'),
(131, 2, 'The name of work'),
(132, 1, 'Əsərin adı'),
(132, 2, 'The name of work'),
(133, 1, 'Əsərin adı'),
(133, 2, 'The name of work'),
(134, 1, 'Əsərin adı'),
(134, 2, 'The name of work'),
(135, 1, 'Əsərin adı'),
(135, 2, 'The name of work'),
(136, 1, 'Əsərin adı'),
(136, 2, 'The name of work'),
(137, 1, 'Əsərin adı'),
(137, 2, 'The name of work'),
(138, 1, 'Əsərin adı'),
(138, 2, 'The name of work'),
(139, 1, 'Əsərin adı'),
(139, 2, 'The name of work'),
(140, 1, 'Əsərin adı'),
(140, 2, 'The name of work'),
(141, 1, 'Əsərin adı'),
(141, 2, 'The name of work'),
(142, 1, 'Əsərin adı'),
(142, 2, 'The name of work'),
(143, 1, 'Əsərin adı'),
(143, 2, 'The name of work'),
(144, 1, 'Əsərin adı'),
(144, 2, 'The name of work'),
(145, 1, 'Əsərin adı'),
(145, 2, 'The name of work'),
(146, 1, 'Əsərin adı'),
(146, 2, 'The name of work'),
(147, 1, 'Əsərin adı'),
(147, 2, 'The name of work'),
(148, 1, 'Əsərin adı'),
(148, 2, 'The name of work'),
(149, 1, 'Əsərin adı'),
(149, 2, 'The name of work'),
(150, 1, 'Əsərin adı'),
(150, 2, 'The name of work'),
(151, 1, 'Əsərin adı'),
(151, 2, 'The name of work'),
(152, 1, 'Əsərin adı'),
(152, 2, 'The name of work'),
(153, 1, 'Əsərin adı'),
(153, 2, 'The name of work'),
(154, 1, 'Əsərin adı'),
(154, 2, 'The name of work'),
(155, 1, 'Əsərin adı'),
(155, 2, 'The name of work'),
(156, 1, 'Əsərin adı'),
(156, 2, 'The name of work'),
(157, 1, 'Əsərin adı'),
(157, 2, 'The name of work'),
(158, 1, 'Əsərin adı'),
(158, 2, 'The name of work'),
(159, 1, 'Əsərin adı'),
(159, 2, 'The name of work'),
(160, 1, 'Əsərin adı'),
(160, 2, 'The name of work'),
(161, 1, 'Əsərin adı'),
(161, 2, 'The name of work'),
(163, 1, 'Əsərin adı'),
(163, 2, 'The name of work'),
(164, 1, 'Əsərin adı'),
(164, 2, 'The name of work'),
(165, 1, 'Əsərin adı'),
(165, 2, 'The name of work'),
(166, 1, 'Əsərin adı'),
(166, 2, 'The name of work'),
(167, 1, 'Əsərin adı'),
(167, 2, 'The name of work'),
(168, 1, 'Əsərin adı'),
(168, 2, 'The name of work'),
(169, 1, 'Əsərin adı'),
(169, 2, 'The name of work'),
(170, 1, 'Əsərin adı'),
(170, 2, 'The name of work'),
(171, 1, 'Əsərin adı'),
(171, 2, 'The name of work'),
(172, 1, 'Əsərin adı'),
(172, 2, 'The name of work'),
(173, 1, 'Əsərin adı'),
(173, 2, 'The name of work'),
(174, 1, 'Əsərin adı'),
(174, 2, 'The name of work'),
(175, 1, 'Əsərin adı'),
(175, 2, 'The name of work'),
(176, 1, 'Əsərin adı'),
(176, 2, 'The name of work'),
(177, 1, 'Əsərin adı'),
(177, 2, 'The name of work'),
(178, 1, 'Əsərin adı'),
(178, 2, 'The name of work'),
(179, 1, 'Əsərin adı'),
(179, 2, 'The name of work'),
(180, 1, 'Əsərin adı'),
(180, 2, 'The name of work'),
(181, 1, 'Əsərin adı'),
(181, 2, 'The name of work'),
(182, 1, 'Əsərin adı'),
(182, 2, 'The name of work'),
(183, 1, 'Əsərin adı'),
(183, 2, 'The name of work'),
(184, 1, 'Əsərin adı'),
(184, 2, 'The name of work'),
(185, 1, 'Əsərin adı'),
(185, 2, 'The name of work'),
(186, 1, 'Əsərin adı'),
(186, 2, 'The name of work'),
(187, 1, 'Əsərin adı'),
(187, 2, 'The name of work'),
(188, 1, 'Əsərin adı'),
(188, 2, 'The name of work'),
(189, 1, 'Əsərin adı'),
(189, 2, 'The name of work'),
(190, 1, 'Əsərin adı'),
(190, 2, 'The name of work'),
(191, 1, 'Əsərin adı'),
(191, 2, 'The name of work'),
(192, 1, 'Əsərin adı'),
(192, 2, 'The name of work'),
(193, 1, 'Əsərin adı'),
(193, 2, 'The name of work'),
(194, 1, 'Əsərin adı'),
(194, 2, 'The name of work'),
(195, 1, 'Əsərin adı'),
(195, 2, 'The name of work'),
(196, 1, 'Əsərin adı'),
(196, 2, 'The name of work'),
(197, 1, 'Əsərin adı'),
(197, 2, 'The name of work'),
(198, 1, 'Əsərin adı'),
(198, 2, 'The name of work'),
(199, 1, 'Əsərin adı'),
(199, 2, 'The name of work'),
(200, 1, 'Əsərin adı'),
(200, 2, 'The name of work'),
(201, 1, 'Əsərin adı'),
(201, 2, 'The name of work'),
(202, 1, 'Əsərin adı'),
(202, 2, 'The name of work'),
(203, 1, 'Əsərin adı'),
(203, 2, 'The name of work'),
(204, 1, 'Əsərin adı'),
(204, 2, 'The name of work'),
(205, 1, 'Əsərin adı'),
(205, 2, 'The name of work'),
(206, 1, 'Əsərin adı'),
(206, 2, 'The name of work'),
(207, 1, 'Əsərin adı'),
(207, 2, 'The name of work'),
(208, 1, 'Əsərin adı'),
(208, 2, 'The name of work'),
(209, 1, 'Əsərin adı'),
(209, 2, 'The name of work'),
(210, 1, 'Əsərin adı'),
(210, 2, 'The name of work'),
(211, 1, 'Əsərin adı'),
(211, 2, 'The name of work'),
(212, 1, 'Əsərin adı'),
(212, 2, 'The name of work'),
(213, 1, 'Əsərin adı'),
(213, 2, 'The name of work'),
(214, 1, 'Əsərin adı'),
(214, 2, 'The name of work'),
(215, 1, 'Əsərin adı'),
(215, 2, 'The name of work'),
(216, 1, 'Əsərin adı'),
(216, 2, 'The name of work'),
(217, 1, 'Əsərin adı'),
(217, 2, 'The name of work'),
(218, 1, 'Əsərin adı'),
(218, 2, 'The name of work'),
(219, 1, 'Əsərin adı'),
(219, 2, 'The name of work'),
(220, 1, 'Əsərin adı'),
(220, 2, 'The name of work'),
(221, 1, 'Əsərin adı'),
(221, 2, 'The name of work'),
(222, 1, 'Əsərin adı'),
(222, 2, 'The name of work'),
(223, 1, 'Əsərin adı'),
(223, 2, 'The name of work'),
(224, 1, 'Əsərin adı'),
(224, 2, 'The name of work'),
(225, 1, 'Əsərin adı'),
(225, 2, 'The name of work'),
(226, 1, 'Əsərin adı'),
(226, 2, 'The name of work'),
(227, 1, 'Əsərin adı'),
(227, 2, 'The name of work'),
(228, 1, 'Əsərin adı'),
(228, 2, 'The name of work');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
