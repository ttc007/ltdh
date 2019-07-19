-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 19, 2019 at 11:19 AM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ltdh`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `chapter` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `choose` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `subject`, `chapter`, `question`, `answer`, `choose`, `level`, `type`) VALUES
(1, 'Chemistry', '9', '<p>Kim loại n&agrave;o sau đ&acirc;y dẫn nhiệt k&eacute;m nhất:</p>\n\n<ul>\n	<li>&nbsp;A. Fe</li>\n	<li>B. Al</li>\n	<li>C. Ag</li>\n	<li>D. Cu</li>\n</ul>\n', '<p>C. Ag</p>\n', 'C', 0, 'Theory'),
(2, 'Chemistry', '10', '<p>Axit HCl v&agrave; HNO3 đều phản ứng được với:</p>\n\n<ul>\n	<li>&nbsp;A. Ag</li>\n	<li>B. Na<sub>2</sub>CO<sub>3</sub></li>\n	<li>C. Ag v&agrave; Na<sub>2</sub>CO<sub>3</sub></li>\n	<li>D. Cu</li>\n</ul>\n', '<p>B. Na<sub>2</sub>CO<sub>3</sub></p>\n', 'B', 0, 'Theory'),
(3, 'Chemistry', '4', '<p>Chất c&oacute; khả năng tham gia phản ứng tr&aacute;ng gương l&agrave;:</p>\n\n<ul>\n	<li>&nbsp;A. CH<sub>4</sub>CO</li>\n	<li>B. CH<sub>3</sub>CHO</li>\n	<li>C. CH<sub>3</sub>COOH</li>\n	<li>D. C<sub>2</sub>H<sub>5</sub>OH</li>\n</ul>\n', '<p>B. CH<sub>3</sub>CHO</p>\n', 'B', 0, 'Theory'),
(4, 'Chemistry', '2', '<p>Chất n&agrave;o l&agrave; este:</p>\n\n<ul>\n	<li>A. CH<sub>3</sub>CHO</li>\n	<li>B. C<sub>2</sub>H<sub>5</sub>OCH<sub>3</sub></li>\n	<li>C. CH<sub>3</sub>COOC<sub>2</sub>H<sub>5 </sub></li>\n	<li>D. CH<sub>3</sub>COOH</li>\n</ul>\n', '<p>&nbsp;A. CH<sub>3</sub>COOC<sub>2</sub>H<sub>5</sub></p>\n', 'C', 0, 'Theory'),
(5, 'Chemistry', '8', '<p>Tơ n&agrave;o l&agrave; tơ thi&ecirc;n nhi&ecirc;n:</p>\n\n<ul>\n	<li>&nbsp;A. Tơ Nilon 6,6</li>\n	<li>B. Tơ tằm</li>\n	<li>C. Tơ Visco&nbsp;</li>\n	<li>D. Tơ Lapsan</li>\n</ul>\n', '<p>B. Tơ tằm</p>\n', 'B', 0, 'Theory'),
(6, 'Chemistry', '9', '<p>Cho m gam&nbsp; Fe v&agrave;o H<sub>2</sub>SO4 lo&atilde;ng dư , thu được 2,24 l&iacute;t kh&iacute; H<sub>2</sub>. Khối lượng m l&agrave;:</p>\n\n<ul>\n	<li>A. 2,80</li>\n	<li>B. 1,12</li>\n	<li>C. 5,60</li>\n	<li>D. 2,24</li>\n</ul>\n', '<p>Fe + H<sub>2</sub>SO4 -&gt; FeSO4 + H<sub>2</sub></p>\n\n<p>n<sub>H2</sub> = 2,24/22,4 = 0,1(mol)</p>\n\n<p>n<sub>Fe</sub> = n<sub>H2</sub> = 0,1(mol)</p>\n\n<p>m = 0,1 X 56 = 5,6(g)</p>\n\n<p>&nbsp;</p>\n', 'C', 0, 'Exercise'),
(7, 'Chemistry', '11', '<p>Chất n&agrave;o sau đ&acirc;y l&agrave;m mềm nước cứng vĩnh cữu:</p>\n\n<ul>\n	<li>A. NaNO<sub>3</sub></li>\n	<li>B. NaCl</li>\n	<li>C. Na<sub>2</sub>CO<sub>3</sub></li>\n	<li>D. Na<sub>2</sub>SO<sub>4</sub></li>\n</ul>\n', '<p>C. Na<sub>2</sub>CO<sub>3</sub></p>\n', 'C', 0, 'Theory'),
(8, 'Chemistry', '10', '<p>Th&agrave;nh phần ch&iacute;nh của muối ăn l&agrave;:</p>\n\n<ul>\n	<li>A. BaCl<sub>2</sub></li>\n	<li>B Ma(NO<sub>3</sub>)<sub>2</sub></li>\n	<li>C. NaCl</li>\n	<li>D. CaCO<sub>3</sub></li>\n</ul>\n', '<p>C. NaCl</p>\n', 'C', 0, 'Theory'),
(9, 'Chemistry', '8', '<p>Tơ n&agrave;o sau đ&acirc;y thuộc tơ nh&acirc;n tạo:</p>\n\n<ul>\n	<li>A. Tơ Nilon-6,6</li>\n	<li>B. Tơ Nilon -6</li>\n	<li>C. Tơ Visco</li>\n	<li>D. Tơ tằm</li>\n</ul>\n', '<p>A. Tơ Nilon-6,6</p>\n', 'A', 0, 'Theory'),
(10, 'Chemistry', '9', '<p>Kim loại n&agrave;o sau đ&acirc;y kh&ocirc;ng tan được trong H<sub>2</sub>SO<sub>4</sub> lo&atilde;ng</p>\n\n<ul>\n	<li>A. Mg</li>\n	<li>B. Fe</li>\n	<li>C. Al</li>\n	<li>D. Cu</li>\n</ul>\n', '<p>D. Cu</p>\n', 'D', 0, 'Theory'),
(11, 'Chemistry', '6', '<p>Chất n&agrave;o thuộc đisacarit:</p>\n\n<ul>\n	<li>A. Sacarozơ</li>\n	<li>B. Glucozơ</li>\n	<li>C. Tinh bột</li>\n	<li>C. Fructozơ</li>\n</ul>\n', '<p>A. Sacarozơ</p>\n', 'A', 0, 'Theory'),
(12, 'Chemistry', '1', '<p>Kim loại n&agrave;o sau đ&acirc;y điều chế bằng nhiệt luyện với chất khử CO:</p>\n\n<ul>\n	<li>A. K</li>\n	<li>B. Ca</li>\n	<li>C. Ba</li>\n	<li>D. Cu</li>\n</ul>\n', '<p>D. Cu</p>\n', 'D', 0, 'Exercise'),
(13, 'Chemistry', '9', '<p>C&ocirc;ng thức h&oacute;a học của Săt(II) oxit l&agrave;:</p>\n\n<ul>\n	<li>A. Fe(OH)<sub>2</sub></li>\n	<li>B. FeO</li>\n	<li>C. Fe<sub>2</sub>O<sub>3</sub></li>\n	<li>D. Fe(OH)<sub>3</sub></li>\n</ul>\n', '<p>B. FeO</p>\n', 'B', 0, 'Theory'),
(14, 'Chemistry', '5', '<p>C&ocirc;ng thức của Triolein l&agrave;:</p>\n\n<ul>\n	<li>A. (C<sub>2</sub>H<sub>5</sub>COO)<sub>3</sub>C<sub>3</sub>H<sub>5&nbsp;</sub></li>\n	<li>B. (C<sub>17</sub>H<sub>33</sub>COO)<sub>3</sub>C<sub>3</sub>H<sub>5</sub></li>\n	<li>C. (HCOO)<sub>3</sub>C<sub>3</sub>H<sub>5</sub></li>\n	<li>D. (CH<sub>3</sub>COO)<sub>3</sub>C<sub>3</sub>H<sub>5</sub></li>\n</ul>\n', '<p>B.&nbsp;(C<sub>17</sub>H<sub>33</sub>COO)<sub>3</sub>C<sub>3</sub>H<sub>5</sub></p>\n', 'B', 0, 'Theory'),
(15, 'Chemistry', '9', '<p>Dung dịch n&agrave;o sau đ&acirc;y h&ograve;a tan được Cr(OH)<sub>3&nbsp;</sub>:</p>\n\n<ul>\n	<li>A. NaOH</li>\n	<li>B. K<sub>2</sub>SO<sub>4</sub></li>\n	<li>C. KCl</li>\n	<li>D. NaNO<sub>3</sub></li>\n</ul>\n\n<p>&nbsp;</p>\n', '<p>B. K<sub>2</sub>SO<sub>4</sub></p>\n', 'B', 0, 'Theory'),
(16, 'Chemistry', '2', '<p>Ở thể răn hợp chất X tạo th&agrave;nh 1 khối trắng gọi l&agrave; &quot;nước đ&aacute; kh&ocirc;&quot;. Nước đ&aacute; kh&ocirc; kh&ocirc;ng n&oacute;ng chảy m&agrave; thăng hoa để tạo m&ocirc;i trường lạnh m&agrave; kh&ocirc;ng c&oacute; hơi ẩm. Hợp chất X l&agrave;:</p>\n\n<ul>\n	<li>A. H<sub>2</sub>O</li>\n	<li>B. CO<sub>2</sub></li>\n	<li>C. N<sub>2</sub></li>\n	<li>D. O<sub>2</sub></li>\n</ul>\n', '<p>B. CO<sub>2</sub></p>\n', 'B', 0, 'Theory'),
(17, 'Chemistry', '9', '<p>Dung dịch n&agrave;o sau đ&acirc;y h&ograve;a tan được Al<sub>2</sub>O<sub>3</sub>:</p>\n\n<ul>\n	<li>A. HCl</li>\n	<li>B. NaCl</li>\n	<li>C. MgCl<sub>2</sub></li>\n	<li>D. KNO<sub>3</sub></li>\n</ul>\n', '<p>A. HCl</p>\n', 'A', 0, 'Theory'),
(18, 'Chemistry', '10', '<p>Nhiệt ph&acirc;n ho&agrave;n to&agrave;n 10 gam CaCO<sub>3</sub>. Khối lượng CaO thu được l&agrave;:</p>\n\n<ul>\n	<li>A. 7,2 gam</li>\n	<li>B. 8,4 gam</li>\n	<li>C. 5,6 gam</li>\n	<li>D. 4,4 gam</li>\n</ul>\n', '<p>C. 5,6 gam</p>\n', 'C', 0, 'Exercise'),
(19, 'Chemistry', '1', '<p>Cho 1ml AgNO<sub>3</sub> 1% v&agrave;o ống nghiệm sạch, lắc nhẹ sau đ&oacute; nhỏ từ từ từng giọt dung dịch&nbsp;NH<sub>3</sub> 2M v&agrave;o cho đến khi kết tủa tan hết. Nhỏ tiếp 3-5 giọt dung dịch X, đun n&oacute;ng nhẹ khoảng 60-60 độ trong khoảng 35 ph&uacute;t tr&ecirc;n th&agrave;nh ống xuất hiện lớp s&aacute;ng bạc, Chất X l&agrave;:</p>\n\n<ul>\n	<li>A. Glixerol</li>\n	<li>B. Axit acetic</li>\n	<li>C. Ancol etylic</li>\n	<li>D. Andehic fomit</li>\n</ul>\n', '<p>D. Andehit fomit</p>\n', 'D', 0, 'Exercise'),
(20, 'Chemistry', '8', '<p>Ph&aacute;t biểu n&agrave;o sau đ&acirc;y sai:</p>\n\n<ul>\n	<li>A. Cao su lưu h&oacute;a cấu tr&uacute;c mạch kh&ocirc;ng gian</li>\n	<li>B.&nbsp;Tơ nitron được điều chế bằng phản ứng tr&ugrave;ng ngưng</li>\n	<li>C. Tơ tằm thuộc loại tơ thi&ecirc;n nhi&ecirc;n</li>\n	<li>D. Tơ nitron 6,6 được điều chế bằng phản ứng tr&ugrave;ng ngưng</li>\n</ul>\n', '<p>B. Tơ nitron được điều chế bằng phản ứng tr&ugrave;ng ngưng</p>\n', 'B', 0, 'Theory'),
(21, 'Chemistry', '7', '<p>Cho 4,5 gam amin X ( no, đơn chức, mạch hở) t&aacute;c dụng hết với dd HCl dư, thu được 8,15 gam muối. Số nguy&ecirc;n tử Hidro trong ph&acirc;n tử X l&agrave;:</p>\n\n<ul>\n	<li>A. 11</li>\n	<li>B. 5</li>\n	<li>C. 9</li>\n	<li>D. 7</li>\n</ul>\n', '<p>C. 9</p>\n', 'C', 0, 'Exercise'),
(22, 'Chemistry', '3', '<p>Cho 54 gam Glucozơ l&ecirc;n men rươu với hiệu suất 75% thu được m gam C<sub>2</sub>H<sub>5</sub>OH . Gi&aacute; trị của m l&agrave;:</p>\n\n<ul>\n	<li>A. 36,80</li>\n	<li>B. 27,60</li>\n	<li>C. 20,70</li>\n	<li>D. 10,35</li>\n</ul>\n', '<p>C. 20,70</p>\n\n<p>B&agrave;i giải đang được cập nhật</p>\n', 'C', 0, 'Exercise'),
(23, 'Chemistry', '1', '<p>Tinh thể chất rắn X vị ngọt, kh&ocirc;ng m&agrave;u, dễ tan trong nước. X c&oacute; nhiều trong quả nho ch&iacute;n n&ecirc;n gọi l&agrave; đường nho. Khử chất hữu cơ X bằng H2 thu được chất hữu cơ Y. X, Y lần lượt l&agrave;:</p>\n\n<ul>\n	<li>A. Sacarozơ v&agrave; Glucozơ</li>\n	<li>B. Fructozơ v&agrave; Sobitol</li>\n	<li>C. Glucozơ v&agrave; Sobitol</li>\n	<li>D. Glucozơ v&agrave; Fructozơ&nbsp;</li>\n</ul>\n', '<p>C.&nbsp; Glucozơ v&agrave; Sobitol</p>\n', 'C', 0, 'Theory');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
