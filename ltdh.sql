-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 20, 2019 lúc 01:26 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ltdh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chapters`
--

CREATE TABLE `chapters` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `chapter` smallint(5) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `chapters`
--

INSERT INTO `chapters` (`id`, `subject`, `chapter`, `name`) VALUES
(1, 'Chemistry', 1, 'Sự điện li'),
(2, 'Chemistry', 2, 'Phi kim - Phân bón hóa học'),
(3, 'Chemistry', 3, 'Đại cương hóa hữu cơ. Hidrocacbon'),
(4, 'Chemistry', 4, 'Ancol - Phenol - Andehit - Axit Cacboxylic'),
(5, 'Chemistry', 5, 'Este - Lipit'),
(6, 'Chemistry', 6, 'Cacbohidrat'),
(7, 'Chemistry', 7, 'Amin - Amino Axit - Peptit - Protein'),
(8, 'Chemistry', 8, 'Polime'),
(9, 'Chemistry', 9, 'Đại cương Kim loại'),
(10, 'Chemistry', 10, 'Kim loại IA, IIA, A1, Fe, Cr'),
(11, 'Chemistry', 11, 'Nhận biết hóa học. Hóa học với vấn đề Kinh tế - Xã hội - Môi trường'),
(12, 'Physics', 1, 'Dao động cơ'),
(13, 'Physics', 2, 'Sóng cơ'),
(14, 'Physics', 3, 'Dòng điện xoay chiều'),
(15, 'Physics', 4, 'Dao động điện từ'),
(16, 'Physics', 5, 'Sóng ánh sáng'),
(17, 'Physics', 6, 'Lượng tử ánh sáng'),
(18, 'Physics', 7, 'Hạt nhân nguyên tử'),
(19, 'Physics', 8, 'Điện tích - Điện trường'),
(20, 'Physics', 9, 'Dòng điện không đổi'),
(21, 'Physics', 10, 'Cảm ứng điện từ'),
(22, 'Physics', 11, 'Mắt và các dụng cụ quang'),
(23, 'Math', 1, 'Ứng dụng đạo hàm khảo sát hàm số'),
(24, 'Math', 2, 'Mũ - Logarit'),
(25, 'Math', 3, 'Nguyên hàm - Tích phân'),
(26, 'Math', 4, 'Số phức'),
(27, 'Math', 5, 'Lượng giác'),
(28, 'Math', 6, 'Dãy số - Cấp số'),
(29, 'Math', 7, 'Giới hạn'),
(30, 'Math', 8, 'Phép biến hình'),
(31, 'Math', 9, 'Quan hệ song song'),
(32, 'Math', 10, 'Quan hệ vuông góc'),
(33, 'Math', 11, 'Khối đa diện, thể tích khối đa diện'),
(34, 'Math', 12, 'Khối xoay tròn, thể tích khối xoay tròn'),
(35, 'Math', 13, 'Hình học giải tích Oxyz'),
(36, 'Math', 14, 'Hình học giải tích Oxy'),
(37, 'Math', 15, 'Tổ hợp - Xác suất'),
(38, 'Biological', 1, 'L12 - P5 - C1: Cơ chế di truyền và biến dị'),
(39, 'Biological', 2, 'L12 - P5 - C2: Tính quy luật của hiện tượng di truyền'),
(40, 'Biological', 3, 'L12 - P5 - C3: Di truyền học quần thể'),
(41, 'Biological', 4, 'L12 - P5 - C4: Ứng dụng di truyền học vào chọn giống'),
(42, 'Biological', 5, 'L12 - P5 - C5: Di truyền học người'),
(43, 'Biological', 6, 'L12 - P6: Tiến hóa'),
(44, 'Biological', 7, 'L12 - P57: Sinh thái học'),
(45, 'Biological', 8, 'L11 - P4 - C1: Chuyển hóa vật chất và năng lượng'),
(46, 'English', 1, 'Pronunciation (Phát âm)'),
(47, 'English', 2, 'Stress (Trọng âm)'),
(48, 'English', 3, 'Sentence completion (Hoàn thành câu): Ngữ pháp + Từ vựng'),
(49, 'English', 4, 'Closest meaning (Đồng nghĩa)'),
(50, 'English', 5, 'Opposite meaning (Trái nghĩa)'),
(51, 'English', 6, 'Communication (Câu giao tiếp)'),
(52, 'English', 7, 'Error finding (Tìm lỗi sai)'),
(53, 'English', 8, 'Sentence transformation (Biến đổi câu):  Chọn câu đồng nghĩa'),
(54, 'English', 9, 'Sentence transformation (Biến đổi câu):Kết hợp câu'),
(55, 'English', 10, 'Text completion (Hoàn thành đoạn văn)'),
(56, 'English', 11, 'Reading comprehension (Đọc hiểu) - 5 sentence'),
(57, 'English', 12, 'Reading comprehension (Đọc hiểu) - 8 sentence');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `chapter` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_vietnamese_ci,
  `choose` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`id`, `subject`, `chapter`, `question`, `answer`, `choose`, `level`, `type`) VALUES
(1, 'Chemistry', '9', '<p>Kim loại n&agrave;o sau đ&acirc;y dẫn nhiệt k&eacute;m nhất:</p>\n\n<ul>\n	<li>&nbsp;A. Fe</li>\n	<li>B. Al</li>\n	<li>C. Ag</li>\n	<li>D. Cu</li>\n</ul>\n', '<p>C. Ag</p>\n', '2', 0, 'Theory'),
(2, 'Chemistry', '10', '<p>Axit HCl v&agrave; HNO3 đều phản ứng được với:</p>\n\n<ul>\n	<li>&nbsp;A. Ag</li>\n	<li>B. Na<sub>2</sub>CO<sub>3</sub></li>\n	<li>C. Ag v&agrave; Na<sub>2</sub>CO<sub>3</sub></li>\n	<li>D. Cu</li>\n</ul>\n', '<p>B. Na<sub>2</sub>CO<sub>3</sub></p>\n', '1', 0, 'Theory'),
(3, 'Chemistry', '4', '<p>Chất c&oacute; khả năng tham gia phản ứng tr&aacute;ng gương l&agrave;:</p>\n\n<ul>\n	<li>&nbsp;A. CH<sub>4</sub>CO</li>\n	<li>B. CH<sub>3</sub>CHO</li>\n	<li>C. CH<sub>3</sub>COOH</li>\n	<li>D. C<sub>2</sub>H<sub>5</sub>OH</li>\n</ul>\n', '<p>B. CH<sub>3</sub>CHO</p>\n', '1', 0, 'Theory'),
(4, 'Chemistry', '5', '<p>Chất n&agrave;o l&agrave; este:</p>\n\n<ul>\n	<li>A. CH<sub>3</sub>CHO</li>\n	<li>B. C<sub>2</sub>H<sub>5</sub>OCH<sub>3</sub></li>\n	<li>C. CH<sub>3</sub>COOC<sub>2</sub>H<sub>5 </sub></li>\n	<li>D. CH<sub>3</sub>COOH</li>\n</ul>\n', '<p>&nbsp;A. CH<sub>3</sub>COOC<sub>2</sub>H<sub>5</sub></p>\n', '2', 0, 'Theory'),
(5, 'Chemistry', '8', '<p>Tơ n&agrave;o l&agrave; tơ thi&ecirc;n nhi&ecirc;n:</p>\n\n<ul>\n	<li>&nbsp;A. Tơ Nilon 6,6</li>\n	<li>B. Tơ tằm</li>\n	<li>C. Tơ Visco&nbsp;</li>\n	<li>D. Tơ Lapsan</li>\n</ul>\n', '<p>B. Tơ tằm</p>\n', '1', 0, 'Theory'),
(6, 'Chemistry', '9', '<p>Cho m gam&nbsp; Fe v&agrave;o H<sub>2</sub>SO4 lo&atilde;ng dư , thu được 2,24 l&iacute;t kh&iacute; H<sub>2</sub>. Khối lượng m l&agrave;:</p>\n\n<ul>\n	<li>A. 2,80</li>\n	<li>B. 1,12</li>\n	<li>C. 5,60</li>\n	<li>D. 2,24</li>\n</ul>\n', '<p>Fe + H<sub>2</sub>SO4 -&gt; FeSO4 + H<sub>2</sub></p>\n\n<p>n<sub>H2</sub> = 2,24/22,4 = 0,1(mol)</p>\n\n<p>n<sub>Fe</sub> = n<sub>H2</sub> = 0,1(mol)</p>\n\n<p>m = 0,1 X 56 = 5,6(g)</p>\n\n<p>&nbsp;</p>\n', '2', 0, 'Exercise'),
(7, 'Chemistry', '11', '<p>Chất n&agrave;o sau đ&acirc;y l&agrave;m mềm nước cứng vĩnh cữu:</p>\n\n<ul>\n	<li>A. NaNO<sub>3</sub></li>\n	<li>B. NaCl</li>\n	<li>C. Na<sub>2</sub>CO<sub>3</sub></li>\n	<li>D. Na<sub>2</sub>SO<sub>4</sub></li>\n</ul>\n', '<p>C. Na<sub>2</sub>CO<sub>3</sub></p>\n', '2', 0, 'Theory'),
(8, 'Chemistry', '10', '<p>Th&agrave;nh phần ch&iacute;nh của muối ăn l&agrave;:</p>\n\n<ul>\n	<li>A. BaCl<sub>2</sub></li>\n	<li>B Ma(NO<sub>3</sub>)<sub>2</sub></li>\n	<li>C. NaCl</li>\n	<li>D. CaCO<sub>3</sub></li>\n</ul>\n', '<p>C. NaCl</p>\n', '2', 0, 'Theory'),
(9, 'Chemistry', '8', '<p>Tơ n&agrave;o sau đ&acirc;y thuộc tơ nh&acirc;n tạo:</p>\n\n<ul>\n	<li>A. Tơ Nilon-6,6</li>\n	<li>B. Tơ Nilon -6</li>\n	<li>C. Tơ Visco</li>\n	<li>D. Tơ tằm</li>\n</ul>\n', '<p>A. Tơ Nilon-6,6</p>\n', '0', 0, 'Theory'),
(10, 'Chemistry', '9', '<p>Kim loại n&agrave;o sau đ&acirc;y kh&ocirc;ng tan được trong H<sub>2</sub>SO<sub>4</sub> lo&atilde;ng</p>\n\n<ul>\n	<li>A. Mg</li>\n	<li>B. Fe</li>\n	<li>C. Al</li>\n	<li>D. Cu</li>\n</ul>\n', '<p>D. Cu</p>\n', '3', 0, 'Theory'),
(11, 'Chemistry', '6', '<p>Chất n&agrave;o thuộc đisacarit:</p>\n\n<ul>\n	<li>A. Sacarozơ</li>\n	<li>B. Glucozơ</li>\n	<li>C. Tinh bột</li>\n	<li>C. Fructozơ</li>\n</ul>\n', '<p>A. Sacarozơ</p>\n', '0', 0, 'Theory'),
(12, 'Chemistry', '9', '<p>Kim loại n&agrave;o sau đ&acirc;y điều chế bằng nhiệt luyện với chất khử CO:</p>\n\n<ul>\n	<li>A. K</li>\n	<li>B. Ca</li>\n	<li>C. Ba</li>\n	<li>D. Cu</li>\n</ul>\n', '<p>D. Cu</p>\n', '3', 0, 'Exercise'),
(13, 'Chemistry', '9', '<p>C&ocirc;ng thức h&oacute;a học của Săt(II) oxit l&agrave;:</p>\n\n<ul>\n	<li>A. Fe(OH)<sub>2</sub></li>\n	<li>B. FeO</li>\n	<li>C. Fe<sub>2</sub>O<sub>3</sub></li>\n	<li>D. Fe(OH)<sub>3</sub></li>\n</ul>\n', '<p>B. FeO</p>\n', '1', 0, 'Theory'),
(14, 'Chemistry', '5', '<p>C&ocirc;ng thức của Triolein l&agrave;:</p>\n\n<ul>\n	<li>A. (C<sub>2</sub>H<sub>5</sub>COO)<sub>3</sub>C<sub>3</sub>H<sub>5&nbsp;</sub></li>\n	<li>B. (C<sub>17</sub>H<sub>33</sub>COO)<sub>3</sub>C<sub>3</sub>H<sub>5</sub></li>\n	<li>C. (HCOO)<sub>3</sub>C<sub>3</sub>H<sub>5</sub></li>\n	<li>D. (CH<sub>3</sub>COO)<sub>3</sub>C<sub>3</sub>H<sub>5</sub></li>\n</ul>\n', '<p>B.&nbsp;(C<sub>17</sub>H<sub>33</sub>COO)<sub>3</sub>C<sub>3</sub>H<sub>5</sub></p>\n', '1', 0, 'Theory'),
(15, 'Chemistry', '9', '<p>Dung dịch n&agrave;o sau đ&acirc;y h&ograve;a tan được Cr(OH)<sub>3&nbsp;</sub>:</p>\n\n<ul>\n	<li>A. NaOH</li>\n	<li>B. K<sub>2</sub>SO<sub>4</sub></li>\n	<li>C. KCl</li>\n	<li>D. NaNO<sub>3</sub></li>\n</ul>\n\n<p>&nbsp;</p>\n', '<p>B. K<sub>2</sub>SO<sub>4</sub></p>\n', '1', 0, 'Theory'),
(16, 'Chemistry', '2', '<p>Ở thể răn hợp chất X tạo th&agrave;nh 1 khối trắng gọi l&agrave; &quot;nước đ&aacute; kh&ocirc;&quot;. Nước đ&aacute; kh&ocirc; kh&ocirc;ng n&oacute;ng chảy m&agrave; thăng hoa để tạo m&ocirc;i trường lạnh m&agrave; kh&ocirc;ng c&oacute; hơi ẩm. Hợp chất X l&agrave;:</p>\n\n<ul>\n	<li>A. H<sub>2</sub>O</li>\n	<li>B. CO<sub>2</sub></li>\n	<li>C. N<sub>2</sub></li>\n	<li>D. O<sub>2</sub></li>\n</ul>\n', '<p>B. CO<sub>2</sub></p>\n', '1', 0, 'Theory'),
(17, 'Chemistry', '9', '<p>Dung dịch n&agrave;o sau đ&acirc;y h&ograve;a tan được Al<sub>2</sub>O<sub>3</sub>:</p>\n\n<ul>\n	<li>A. HCl</li>\n	<li>B. NaCl</li>\n	<li>C. MgCl<sub>2</sub></li>\n	<li>D. KNO<sub>3</sub></li>\n</ul>\n', '<p>A. HCl</p>\n', '0', 0, 'Theory'),
(18, 'Chemistry', '10', '<p>Nhiệt ph&acirc;n ho&agrave;n to&agrave;n 10 gam CaCO<sub>3</sub>. Khối lượng CaO thu được l&agrave;:</p>\n\n<ul>\n	<li>A. 7,2 gam</li>\n	<li>B. 8,4 gam</li>\n	<li>C. 5,6 gam</li>\n	<li>D. 4,4 gam</li>\n</ul>\n', '<p>C. 5,6 gam</p>\n', '2', 0, 'Exercise'),
(19, 'Chemistry', '4', '<p>Cho 1ml AgNO<sub>3</sub> 1% v&agrave;o ống nghiệm sạch, lắc nhẹ sau đ&oacute; nhỏ từ từ từng giọt dung dịch&nbsp;NH<sub>3</sub> 2M v&agrave;o cho đến khi kết tủa tan hết. Nhỏ tiếp 3-5 giọt dung dịch X, đun n&oacute;ng nhẹ khoảng 60-60 độ trong khoảng 35 ph&uacute;t tr&ecirc;n th&agrave;nh ống xuất hiện lớp s&aacute;ng bạc, Chất X l&agrave;:</p>\n\n<ul>\n	<li>A. Glixerol</li>\n	<li>B. Axit acetic</li>\n	<li>C. Ancol etylic</li>\n	<li>D. Andehic fomit</li>\n</ul>\n', '<p>D. Andehit fomit</p>\n', '3', 0, 'Exercise'),
(20, 'Chemistry', '8', '<p>Ph&aacute;t biểu n&agrave;o sau đ&acirc;y sai:</p>\n\n<ul>\n	<li>A. Cao su lưu h&oacute;a cấu tr&uacute;c mạch kh&ocirc;ng gian</li>\n	<li>B.&nbsp;Tơ nitron được điều chế bằng phản ứng tr&ugrave;ng ngưng</li>\n	<li>C. Tơ tằm thuộc loại tơ thi&ecirc;n nhi&ecirc;n</li>\n	<li>D. Tơ nitron 6,6 được điều chế bằng phản ứng tr&ugrave;ng ngưng</li>\n</ul>\n', '<p>B. Tơ nitron được điều chế bằng phản ứng tr&ugrave;ng ngưng</p>\n', '2', 0, 'Theory'),
(21, 'Chemistry', '7', '<p>Cho 4,5 gam amin X ( no, đơn chức, mạch hở) t&aacute;c dụng hết với dd HCl dư, thu được 8,15 gam muối. Số nguy&ecirc;n tử Hidro trong ph&acirc;n tử X l&agrave;:</p>\n\n<ul>\n	<li>A. 11</li>\n	<li>B. 5</li>\n	<li>C. 9</li>\n	<li>D. 7</li>\n</ul>\n', '<p>C. 9</p>\n', '2', 0, 'Exercise'),
(22, 'Chemistry', '3', '<p>Cho 54 gam Glucozơ l&ecirc;n men rươu với hiệu suất 75% thu được m gam C<sub>2</sub>H<sub>5</sub>OH . Gi&aacute; trị của m l&agrave;:</p>\n\n<ul>\n	<li>A. 36,80</li>\n	<li>B. 27,60</li>\n	<li>C. 20,70</li>\n	<li>D. 10,35</li>\n</ul>\n', '<p>C. 20,70</p>\n\n<p>B&agrave;i giải đang được cập nhật</p>\n', '2', 0, 'Exercise'),
(23, 'Chemistry', '3', '<p>Tinh thể chất rắn X vị ngọt, kh&ocirc;ng m&agrave;u, dễ tan trong nước. X c&oacute; nhiều trong quả nho ch&iacute;n n&ecirc;n gọi l&agrave; đường nho. Khử chất hữu cơ X bằng H2 thu được chất hữu cơ Y. X, Y lần lượt l&agrave;:</p>\n\n<ul>\n	<li>A. Sacarozơ v&agrave; Glucozơ</li>\n	<li>B. Fructozơ v&agrave; Sobitol</li>\n	<li>C. Glucozơ v&agrave; Sobitol</li>\n	<li>D. Glucozơ v&agrave; Fructozơ&nbsp;</li>\n</ul>\n', '<p>C.&nbsp; Glucozơ v&agrave; Sobitol</p>\n', '2', 0, 'Theory'),
(24, 'Physics', '1', '<p>Một vật dao động điều h&ograve;a theo phương tr&igrave;nh:&nbsp;&nbsp;<strong>x = Acos(&omega;t +&nbsp;&phi;)</strong>&nbsp;<strong>( A &gt; 0,&nbsp;&omega; &gt; 0 ). </strong>Pha của dao động ở thời điểm t l&agrave;:</p>\n\n<ul>\n	<li>A.&nbsp;&omega;</li>\n	<li>B<strong>.&nbsp;</strong>cos(&omega;t +&nbsp;&phi;)</li>\n	<li>C.&nbsp;&omega;t +&nbsp;&phi;</li>\n	<li>D.&nbsp;&phi;</li>\n</ul>\n', '<p>C.&nbsp;&nbsp;&omega;t +&nbsp;&phi;</p>\n', '2', 0, 'Theory');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `structure` text COLLATE utf8mb4_vietnamese_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `structures`
--

INSERT INTO `structures` (`id`, `subject`, `structure`) VALUES
(1, 'Chemistry', '[{\"chapter\":1,\"type\":\"Theory\",\"amount\":1},{\"chapter\":2,\"type\":\"Theory\",\"amount\":1},{\"chapter\":3,\"type\":\"Theory\",\"amount\":1},{\"chapter\":3,\"type\":\"Exercise\",\"amount\":1},{\"chapter\":5,\"type\":\"Theory\",\"amount\":4},{\"chapter\":5,\"type\":\"Exercise\",\"amount\":3},{\"chapter\":6,\"type\":\"Theory\",\"amount\":2},{\"chapter\":6,\"type\":\"Exercise\",\"amount\":1},{\"chapter\":7,\"type\":\"Theory\",\"amount\":3},{\"chapter\":7,\"type\":\"Exercise\",\"amount\":2},{\"chapter\":8,\"type\":\"Theory\",\"amount\":2},{\"chapter\":9,\"type\":\"Theory\",\"amount\":3},{\"chapter\":9,\"type\":\"Exercise\",\"amount\":2},{\"chapter\":10,\"type\":\"Theory\",\"amount\":7},{\"chapter\":10,\"type\":\"Exercise\",\"amount\":5},{\"chapter\":11,\"type\":\"Theory\",\"amount\":2}]'),
(2, 'Physics', '[{\"chapter\":1,\"type\":\"Theory\",\"amount\":3},{\"chapter\":1,\"type\":\"Exercise\",\"amount\":4},{\"chapter\":2,\"type\":\"Theory\",\"amount\":2},{\"chapter\":2,\"type\":\"Exercise\",\"amount\":3},{\"chapter\":3,\"type\":\"Theory\",\"amount\":1},{\"chapter\":3,\"type\":\"Exercise\",\"amount\":6},{\"chapter\":4,\"type\":\"Theory\",\"amount\":1},{\"chapter\":4,\"type\":\"Exercise\",\"amount\":2},{\"chapter\":5,\"type\":\"Theory\",\"amount\":3},{\"chapter\":5,\"type\":\"Exercise\",\"amount\":2},{\"chapter\":6,\"type\":\"Theory\",\"amount\":1},{\"chapter\":6,\"type\":\"Theory\",\"amount\":3},{\"chapter\":7,\"type\":\"Exercise\",\"amount\":2},{\"chapter\":7,\"type\":\"Theory\",\"amount\":3},{\"chapter\":8,\"type\":\"Exercise\",\"amount\":1},{\"chapter\":9,\"type\":\"Exercise\",\"amount\":1},{\"chapter\":10,\"type\":\"Exercise\",\"amount\":1}]');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
