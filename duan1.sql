-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th3 28, 2024 lúc 10:53 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(299) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_product` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `avatar`, `total_product`, `status`, `created_at`) VALUES
(13, 'Giày NIKE', 'product-06.webp', 8, 0, '2024-03-22 13:57:01'),
(14, 'Giày MLB', 'product-01.webp', 7, 0, '2024-03-22 13:57:12'),
(15, 'Giày ADIDAS', 'product-05.webp', 9, 0, '2024-03-22 13:57:22'),
(16, 'Giày HES', 'product-02.webp', 7, 0, '2024-03-22 13:57:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments_product`
--

CREATE TABLE `comments_product` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `rating_products` tinyint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments_product`
--

INSERT INTO `comments_product` (`id`, `product_id`, `user_id`, `content`, `rating_products`, `created_at`) VALUES
(15, 106, 17, 'Áo đẹp', 3, '2022-12-06 06:20:53'),
(27, 106, 28, 'Giày đẹp', 5, '2024-03-22 13:56:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `payment` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `total_price` int NOT NULL,
  `note` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment`, `status`, `total_price`, `note`, `address`, `created_at`) VALUES
(65, 31, 0, 6, 1218600, '', 'Phú Thọ', '2024-03-22 10:03:13'),
(68, 24, 2, 6, 6701000, '', 'Hà Nội', '2022-12-03 08:07:11'),
(70, 28, 0, 6, 1349000, '', 'Nam định', '2024-03-05 12:51:20'),
(71, 25, 2, 6, 2106000, '', 'Hà Nội', '2022-12-05 12:56:49'),
(72, 17, 0, 6, 2634000, '', 'Hà Nội', '2022-12-05 10:04:45'), 
(73, 17, 0, 6, 612000, '', 'Nam định', '2022-12-05 10:11:10'),
(74, 16, 0, 6, 665000, '', 'Nam định', '2022-12-06 12:24:04'),
(80, 16, 0, 6, 1368000, '', 'Nam định', '2022-12-06 12:49:48'),
(93, 16, 0, 1, 2740000, '', 'Nam định', '2022-12-08 06:06:20'),
(96, 30, 2, 6, 1863000, '', 'Hà Nội', '2022-12-08 10:20:52'),
(97, 31, 2, 6, 2592000, '', 'Khánh Hòa', '2022-12-08 10:32:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_product` int NOT NULL,
  `size` varchar(23) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders_detail`
--

INSERT INTO `orders_detail` (`id`, `order_id`, `product_id`, `quantity`, `price_product`, `size`) VALUES
(220, 96, 102, 2, 486000, 'M'),
(221, 96, 102, 1, 486000, 'S');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` int NOT NULL,
  `avatar` varchar(199) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `discount` float DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `hot_product` tinyint NOT NULL DEFAULT '0',
  `comment_total` int DEFAULT NULL,
  `rating_total` int DEFAULT NULL,
  `amount_views` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `avatar`, `description`, `quantity`, `price`, `discount`, `status`, `hot_product`, `comment_total`, `rating_total`, `amount_views`, `created_at`, `updated_at`) VALUES
(91, 'NIKE AIR ZOOM MERCURIAL SUPERFLY ELITE 9 FG LUCENT - YELLOW STRIKE/SUNSET GLOW/BARELY GRAPE', 13, 'product-01.webp', 'Chưa có mô tả', 12341, 7895000, 10, 0, 1, 1, 5, NULL, '2024-03-27 08:05:00', NULL),
(92, 'PUMA ULTRA ULTIMATE CAGE - FIZZY LIGHT/PARISIAN NIGHT/BLUE GLIMMER', 14, 'product-02.webp', 'chưa có mô tả', 1234, 3600000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 08:05:23', NULL),
(93, 'MIZUNO MORELIA NEO III PRO TF LẠC VIỆT - RED/YELLOW LIMITED EDITION', 13, 'product-03.webp', 'Chưa có mô tả', 1230, 3339000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 08:07:27', NULL),
(94, 'MIZUNO MORELIA NEO III BETA FG SERGIO RAMOS 4 VOL. I - WHITE/GOLD', 15, 'product-04.webp', 'Chưa có mô tả', 12314, 3990000, 5, 0, 1, NULL, NULL, NULL, '2024-03-27 08:07:45', NULL),
(95, 'MIZUNO MORELIA SALA MADE IN JAPAN TF PASSION RED - HIGH RISK RED/WHITE LIMITED EDITION', 13, 'product-05.webp', 'Năm nay ch&uacute;ng ta đ&atilde; được chi&ecirc;m ngưỡng nhiều phi&ecirc;n bản solo từ Mizuno, như thiết kế &#039;Under Zero&#039;, &#039;Origami&#039; tr&ecirc;n Morelia Neo III &beta; v&agrave; Morelia Neo III &beta; &#039;SR4&#039; - đ&ocirc;i gi&agrave;y đặc trưng đầu ti&ecirc;n của Sergio Ramos từ thương hiệu Nhật Bản. Tuy nhi&ecirc;n, &#039;Passion Red Pack&#039; l&agrave; bộ sưu tập ch&iacute;nh thức được ph&aacute;t h&agrave;nh tr&ecirc;n s&acirc;n đầu ti&ecirc;n sau một khoảng thời gian kh&aacute; l&acirc;u. BST n&agrave;y hiện đang rất được c&aacute;c t&iacute;n đồ y&ecirc;u gi&agrave;y Mizuno hoan ngh&ecirc;nh, chờ đ&oacute;n. \r\nMizuno Morelia Sala Made in Japan TF Passion Red - High Risk Red/White Limited Edition l&agrave; d&ograve;ng sản phẩm cao cấp nhất của MIZUNO d&agrave;nh cho s&acirc;n cỏ nh&acirc;n tạo 5-7 người được sản xuất tại Nhật Bản. Nằm trong BST &#039; Passion Red&#039; với m&agrave;u sắc ch&iacute;nh thức l&agrave; &ldquo;High Risk Red / White&rdquo; - bao gồm 2 gam m&agrave;u đỏ trắng kết hợp ấn tượng với m&agrave;u đỏ chủ đạo bao phủ phần upper v&agrave; c&aacute;c chi tiết m&agrave;u trắng nổi bật qua thương hiệu Runbird v&agrave; tr&ecirc;n mặt đế.\r\nĐối với s&acirc;n chơi phong tr&agrave;o tại Việt Nam th&igrave; mặt cỏ nh&acirc;n tạo l&agrave; phổ biến nhất v&agrave; Mizuno cũng rất kịp thời khi cho ra mắt rất nhiều d&ograve;ng gi&agrave;y s&acirc;n cỏ nh&acirc;n tạo để phục vụ đ&ocirc;ng đảo c&aacute;c cầu thủ. \r\n\r\nĐể tiếp nối c&aacute;c mẫu gi&agrave;y trước đ&acirc;y, Mizuno tiếp tục n&acirc;ng cấp v&agrave; cho ra mắt mẫu gi&agrave;y Morelia Sala Japan TF với những ưu điểm c&ocirc;ng nghệ v&ocirc; c&ugrave;ng nổi bật:\r\n\r\nChất liệu da Kangaroo si&ecirc;u mềm đ&atilde; được Mizuno sử dụng hiệu quả ở phần Upper gi&agrave;y, hỗ trợ tối đa cho c&aacute;c cầu thủ khi nhận b&oacute;ng, đi b&oacute;ng, những pha s&uacute;t mu uy lực v&agrave; tạo cảm gi&aacute;c như đi ch&acirc;n trần.\r\n\r\n Phần mũi gi&agrave;y được gia cố bằng lớp da lộn đặc biệt, n&acirc;ng cao độ bền chung của sản phẩm.\r\n\r\n Form gi&agrave;y đặc biệt ph&ugrave; hợp với b&agrave;n ch&acirc;n người Việt, những cầu thủ ch&acirc;n b&egrave; ho&agrave;n to&agrave;n c&oacute; thể sử dụng m&agrave; kh&ocirc;ng gặp ch&uacute;t kh&oacute; khăn n&agrave;o.\r\n\r\n Morelia Sala Japan TF được trang bị lớp đệm giảm chấn, tạo sự &ecirc;m &aacute;i thoải m&aacute;i cho c&aacute;c cầu thủ trong suốt trận đấu.\r\n\r\n Phần g&oacute;t gi&agrave;y chắc chắn, cứng c&aacute;p, tạo điểm nhấn v&agrave; bảo vệ tối đa g&oacute;t ch&acirc;n cầu thủ.\r\n\r\n L&oacute;t gi&agrave;y &ecirc;m &aacute;i, chống trượt hiệu quả v&agrave; c&oacute; thể th&aacute;o rời.\r\n\r\n Hệ thống đinh dăm tr&ecirc;n Morelia Sala Japan TF l&agrave; dạng chữ L quen thuộc với ưu điểm gi&uacute;p c&aacute;c cầu thủ c&oacute; thể đổi hướng linh hoạt v&agrave; rất b&aacute;m s&acirc;n ngay cả khi thời tiết kh&ocirc;ng thuận lợi.\r\n', 12345, 4300000, 20, 0, 1, NULL, NULL, NULL, '2024-03-20 12:14:49', NULL),
(96, 'PUMA FUTURE Z 1.4 CREATIVITY PRO CAGE TF - SUNSET PINK/WHITE/OCEAN DIVE', 13, 'product-06.webp', 'PUMA đ&atilde; đưa Future Z l&ecirc;n một tầm cao mới v&agrave; trở th&agrave;nh một trong những đ&ocirc;i gi&agrave;y đ&aacute; banh được t&igrave;m kiếm nhiều nhất tr&ecirc;n thị trường hiện nay. Để ăn mừng cho sự th&agrave;nh c&ocirc;ng của silo gi&agrave;y n&agrave;y, PUMA đ&atilde; tạo ra một phi&ecirc;n bản giới hạn ấn tượng. \r\nPuma Future Z 1.4 Create Pro Cage TF - Sunset Pink/White/Ocean dive l&agrave; phi&ecirc;n bản gi&agrave;y cao cấp d&agrave;nh cho s&acirc;n cỏ nh&acirc;n tạo 5-7 người. Nằm trong BST &#039;Creativity&#039; với thiết kế m&agrave;u sắc của đ&ocirc;i gi&agrave;y rất s&aacute;ng tạo. Lấy m&agrave;u xanh v&agrave; m&agrave;u hồng neon h&agrave;o nho&aacute;ng l&agrave;m phối m&agrave;u chủ đạo, nổi bật bởi c&aacute;c chi tiết m&agrave;u đen ph&aacute; vỡ những đường viền m&agrave;u xung quanh cổ gi&agrave;y v&agrave; d&acirc;y buộc. PUMA FUTURE Z Creativity được ra mắt nhằm t&ocirc;n vinh những người chơi th&uacute; vị nhất của m&ocirc;n thể thao vua, những người s&aacute;ng tạo nổi bật với kỹ năng v&agrave; tư duy tốc độ, định h&igrave;nh tr&ograve; chơi theo đ&uacute;ng tầm nh&igrave;n của họ bằng mỗi lần ra s&acirc;n tr&ecirc;n mỗi bước chạy.\r\nVề c&ocirc;ng nghệ của phi&ecirc;n bản PUMA Future Z 1.4 PRO CAGE TT:\r\n\r\nSản phẩm được c&aacute;c cầu thủ nổi tiếng đại diện gồm c&oacute; James Maddison, Luis Suarez, Neymar Jr...\r\n\r\nPhần upper của gi&agrave;y được l&agrave;m từ lớp vật liệu dệt kim s&aacute;ng tạo được phủ một lớp mỏng GripControl Pro để cung cấp khả năng kiểm so&aacute;t b&oacute;ng v&agrave; cảm ứng vượt trội.\r\n\r\nĐể hỗ trợ th&ecirc;m cho c&aacute;c chuyển động đa hướng, Future Z tự h&agrave;o c&oacute; đế ngo&agrave;i h&igrave;nh chữ &#039;Z&#039; s&aacute;ng tạo. \r\n\r\nC&ocirc;ng nghệ ACZ Elite mới ở thế hệ thứ 4 cung cấp khả năng cảm b&oacute;ng tốt v&agrave; kiểm so&aacute;t b&oacute;ng tinh tế hơn trong những đường chuyền cũng như c&aacute;c pha dứt điểm.  \r\n\r\nHệ thống đế ngo&agrave;i với thiết kế bất đối xứng với c&aacute;c đinh cao su c&oacute; h&igrave;nh dạng độc đ&aacute;o cho ph&eacute;p thay đổi hướng si&ecirc;u nhanh v&agrave; tăng lực k&eacute;o khi r&ecirc; b&oacute;ng.\r\n\r\nDải băng n&eacute;n FUZIONFIT + ở giữa ch&acirc;n th&iacute;ch ứng cho cảm gi&aacute;c vừa vặn, thoải m&aacute;i, tối ưu chuyển động.\r\n\r\nCổ gi&agrave;y EvoKNIT Pro dạng vớ đem đến sự vừa vặn nhất định.', 1254, 3600000, 5, 0, 1, NULL, NULL, NULL, '2024-03-20 12:15:56', NULL),
(97, 'NIKE AIR ZOOM MERCURIAL VAPOR 15 ELITE FG MBAPPÉ PERSONAL EDITION - DARK BEETROOT/METALLIC VIVID GOLD', 13, 'product-07.webp', 'Lần đầu ti&ecirc;n Nike tung ra phi&ecirc;n bản đặc biệt tr&ecirc;n silo Air Zoom Mercurial d&agrave;nh cho tiền đạo người Ph&aacute;p - Kylian Mbapp&eacute; của PSG. Thiết kế mới n&agrave;y l&agrave; phi&ecirc;n bản độc quyền thứ năm m&agrave; Nike d&agrave;nh ri&ecirc;ng cho Mbapp&eacute;, được lấy cảm hứng từ Jordan 7 v&agrave; Parisian afropop. Kylian Mbapp&eacute; được đ&aacute;nh gi&aacute; l&agrave; một gương mặt đại diện tiềm năng nhất của Nike trong tương lai gần. Do đ&oacute;, kh&ocirc;ng ngạc nhi&ecirc;n khi anh ch&agrave;ng thường xuy&ecirc;n nhận được những đ&ocirc;i gi&agrave;y độc quyền ấn tượng.\r\nNike Air Zoom Mercurial Vapor 15 Elite FG Mbapp&eacute; Personal Edition - Dark Beetroot/Metallic Vivid Gold l&agrave; mẫu gi&agrave;y phi&ecirc;n bản cao cấp chuy&ecirc;n cho s&acirc;n tự nhi&ecirc;n 11 người. Gi&agrave;y đ&aacute; b&oacute;ng Nike Zoom Mercurial Mbappe 2022 c&oacute; vẻ ngo&agrave;i sang trọng với logo Swoosh đặc biệt v&agrave; biểu tượng KM kim cương. Thiết kế c&oacute; m&agrave;u t&iacute;m củ dền l&agrave;m chủ đạo, với c&aacute;c điểm nhấn m&agrave;u v&agrave;ng nổi bật. Tr&ecirc;n logo Nike kh&eacute;o l&eacute;o thiết kế th&ecirc;m một đường gấp kh&uacute;c tạo th&agrave;nh chữ &#039;M&#039; - viết tắt của Mbappe. Ngo&agrave;i ra, c&ograve;n c&oacute; th&ecirc;m một số biểu tượng &#039;KM&#039; - đặc trưng của Kylian Mbapp&eacute; nổi bật tr&ecirc;n cổ gi&agrave;y v&agrave; v&ugrave;ng cổ thun truyền thống. Logo thương hiệu Air tr&ecirc;n mu b&agrave;n ch&acirc;n cũng c&oacute; họa tiết thiết kế th&ocirc;ng minh. Phần g&oacute;t gi&agrave;y c&oacute; thiết kế tương phản độc đ&aacute;o với m&agrave;u xanh lam v&agrave; c&aacute;c điểm nhấn m&agrave;u t&iacute;m, đỏ ấn tượng.\r\nVề c&ocirc;ng nghệ của phi&ecirc;n bản Nike Mercurial Vapor 15 Elite FG:\r\n\r\nĐ&ocirc;i gi&agrave;y vẫn sở hữu thiết kế tối giản với số vật liệu tối thiểu, chỉ bao gồm những chi tiết cần thiết để đảm bảo giảm tối đa trọng lượng của gi&agrave;y. Ngo&agrave;i ra, Nike Mercurial được những cầu thủ nổi tiếng đại diện như CR7, Rashford, Mbappe...\r\n\r\nUpper được l&agrave;m từ chất liệu Vaporposite+ kết hợp sợi Flyknit. C&ocirc;ng nghệ mới ra đời vừa đảm bảo y&ecirc;u cầu tăng tốc cho c&aacute;c cầu thủ, vừa tối ưu h&oacute;a khả năng kiểm so&aacute;t b&oacute;ng, sự ổn định v&agrave; vừa vặn, chắc chắn khi mang.\r\n\r\nThế hệ mới được trang bị hệ thống Speed Cage, được thiết kế theo đường ch&eacute;o cho khả năng &ocirc;m ch&acirc;n tốt hơn, đồng thời cũng gi&uacute;p gi&agrave;y nhẹ hơn v&agrave; tho&aacute;ng kh&iacute; hơn.\r\n\r\nKiểm so&aacute;t mọi điều kiện (ACC) cho cảm ứng đ&aacute;ng tin cậy trong mọi thời tiết.\r\n\r\nBộ đệm Zoom Air t&acirc;n tiến với c&aacute;c r&atilde;nh uốn cong mang lại sự linh hoạt cho c&aacute;c chuyển động tự nhi&ecirc;n của b&agrave;n ch&acirc;n để ph&ugrave; hợp hơn với nhu cầu vận động nhanh, mạnh với cường độ cao trong b&oacute;ng đ&aacute;. \r\n\r\nKhu&ocirc;n đế Aerotrak mới được bổ sung đinh Tri-Star ở bề mặt đế gi&uacute;p c&aacute;c cầu thủ dễ d&agrave;ng di chuyển linh hoạt để điều khiển b&oacute;ng nhanh hơn theo mọi hướng.\r\n\r\nMiếng l&oacute;t gi&agrave;y được trang bị c&ocirc;ng nghệ Nike Grip gi&uacute;p loại bỏ trơn trượt b&ecirc;n trong gi&agrave;y.\r\n\r\n', 5678, 7895000, 20, 0, 1, NULL, NULL, NULL, '2024-03-20 12:16:56', NULL),
(98, 'NIKE TIEMPO LEGEND 9 ELITE FG LUCENT - GUAVA ICE/YELLOW STRIKE/SUNSET GLOW', 13, 'product-08.webp', 'Nike vừa ph&aacute;t h&agrave;nh bộ sưu tập gi&agrave;y đ&aacute; b&oacute;ng đầu ti&ecirc;n trong m&ugrave;a giải mới 22/23 ngay tuần m&agrave; Premier League bắt đầu khởi tranh. Bộ sưu tập gi&agrave;y đ&aacute; b&oacute;ng Nike Lucent Pack sở hữu gam m&agrave;u gi&agrave;u năng lượng với thẩm mỹ t&aacute;o bạo, g&oacute;p th&ecirc;m ch&uacute;t sắc m&agrave;u s&ocirc;i động cho m&ugrave;a h&egrave; th&ecirc;m rực rỡ.\r\nNike Tiempo Legend 9 Elite FG Lucent - Guava Ice/Yellow Strike/Sunset Glow l&agrave; phi&ecirc;n bản gi&agrave;y cao cấp d&agrave;nh chuy&ecirc;n cho s&acirc;n cỏ tự nhi&ecirc;n 11 người. Về thiết kế, nằm trong BST &#039;Lucent&#039; Pack, bảng m&agrave;u ch&iacute;nh của thiết kế lần n&agrave;y l&agrave; m&agrave;u hồng sữa &quot;Guava Ice&quot; nhẹ nh&agrave;ng tr&ecirc;n upper, l&agrave;m nổi bật gam m&agrave;u cam đ&agrave;o &quot;Sunset Glow&quot; kết hợp c&ugrave;ng một số chi tiết m&agrave;u v&agrave;ng, đen đem đến một thiết kế bắt mắt.\r\nVề c&ocirc;ng nghệ cuả phi&ecirc;n bản Nike Tiempo Legend 9 Elite FG:\r\n\r\nSản phẩm Nike Tiempo Legend 9 được c&aacute;c cầu thủ nổi tiếng đại diện gồm c&oacute; Piqu&eacute;, Van Dijk v&agrave; Jordan Henderson.....\r\n\r\nPhần cổ thun tuyệt vời của thế hệ thứ 9 được kế thừa từ phi&ecirc;n bản thứ 8, đảm bảo độ co gi&atilde;n vừa gi&uacute;p &ocirc;m ch&acirc;n vừa đảm bảo tho&aacute;ng kh&iacute; hơn khi mang gi&agrave;y. \r\n\r\nChất liệu từ da Kangaroo cao cấp cho cảm gi&aacute;c &ecirc;m mềm, thoải m&aacute;i, thật ch&acirc;n, cảm gi&aacute;c b&oacute;ng tốt v&agrave; độ bền cao.\r\n\r\nC&aacute;c hạt kiểm so&aacute;t b&oacute;ng tr&ecirc;n upper đặt ở những vị tr&iacute; tiếp x&uacute;c b&oacute;ng gi&uacute;p tối ưu cảm gi&aacute;c b&oacute;ng cho người chơi.\r\n\r\nL&oacute;t gi&agrave;y c&ocirc;ng nghệ Nike-Grip nổi tiếng chống trượt của Nike.\r\n\r\nKhu&ocirc;n đế Control được cải tiến với mục đ&iacute;ch tối ưu sức mạnh, lực k&eacute;o v&agrave; xoay chuyển gi&uacute;p trọng lượng gi&agrave;y nhẹ hơn, b&aacute;m s&acirc;n hơn.', 896, 6739000, 5, 0, 1, NULL, NULL, NULL, '2024-03-20 12:18:08', NULL),
(99, 'MIZUNO MONARCIDA NEO II SELECT AS TF - BLACK/BLACK', 16, 'product-09.webp', 'Mizuno được biết đến l&agrave; 1 trong những thương hiệu l&acirc;u đời nhất tại Nhật Bản. MONARCIDA NEO II SELECT AS l&agrave; d&ograve;ng sản phẩm c&oacute; Form truyền thống với upper được l&agrave;m bằng chất liệu da tổng hợp mềm v&agrave; &ocirc;m ch&acirc;n đem lại cảm gi&aacute;c v&ocirc; c&ugrave;ng thoải m&aacute;i khi chơi b&oacute;ng.\r\nMIZUNO MONARCIDA NEO II SELECT AS TF - BLACK/BLACK l&agrave; sản phẩm d&agrave;nh cho s&acirc;n cỏ nh&acirc;n tạo 5-7 người. Được thiết kế với m&agrave;u sắc ch&iacute;nh thức l&agrave; &ldquo;BLACK/BLACK&rdquo; - gồm c&oacute; gam m&agrave;u đen chủ đạo v&agrave; đặc biệt với hiệu ửng chuyển m&agrave;u từ t&iacute;m sang xanh l&agrave;m nổi bật qua thương hiệu Runbird. Monarcida Neo II Select AS sẽ mang lại những trải nghiệm mới, thuận lợi hơn cho c&aacute;c cầu thủ trong c&aacute;c pha xử l&yacute; b&oacute;ng. Nếu bạn đang t&igrave;m kiếm một mẫu gi&agrave;y b&oacute;ng đ&aacute; s&acirc;n cỏ nh&acirc;n tạo c&oacute; sự bền bỉ, chắc chắn v&agrave; c&oacute; mức gi&aacute; hợp l&yacute; th&igrave; Monarcida Neo II Select AS ch&iacute;nh l&agrave; mẫu gi&agrave;y d&agrave;nh cho bạn.\r\nVề c&ocirc;ng nghệ của phi&ecirc;n bản Mizuno MONARCIDA NEO II SELECT AS:\r\n\r\nChất liệu da tổng hợp si&ecirc;u mềm đ&atilde; được Mizuno sử dụng hiệu quả ở phần Upper gi&agrave;y, hỗ trợ tối đa cho c&aacute;c cầu thủ khi nhận b&oacute;ng, đi b&oacute;ng, những pha s&uacute;t mu uy lực v&agrave; tạo cảm gi&aacute;c như đi ch&acirc;n trần.\r\n\r\nCổ gi&agrave;y của phi&ecirc;n bản Monarcida Neo II Select thoải m&aacute;i v&agrave; dễ d&agrave;ng xỏ v&agrave;o.\r\n\r\nThiết kế &ldquo;Wide Fitting&rdquo;, c&aacute;c cầu thủ d&ugrave; ch&acirc;n b&egrave; nhiều hay trung b&igrave;nh đều c&oacute; thể đi gi&agrave;y vừa vặn, thoải m&aacute;i.\r\n\r\nL&oacute;t gi&agrave;y &ecirc;m &aacute;i, chống trượt hiệu quả v&agrave; c&oacute; thể th&aacute;o rời.\r\n\r\nD&agrave;n đinh dăm được bố tr&iacute; khoa học v&agrave; bền bỉ, b&aacute;m s&acirc;n rất tốt ngay cả khi điều kiện thời tiết kh&ocirc;ng thật sự thuận lợi. \r\n', 3245, 8000000, 20, 0, 1, NULL, NULL, NULL, '2024-03-20 12:19:40', NULL),
(100, 'GIÀY ĐÁ BÓNG KAMITO VELOCIDAD LEGEND TF - AQUA BLUE/WHITE', 14, 'product-10.webp', 'Sau thời gian vắng b&oacute;ng, ch&uacute; ngựa chiến &quot;Tốc Độ&quot; huyền thoại Velocidad ch&iacute;nh thức trở lại với phong c&aacute;ch Cool ngầu - nhẹ nh&agrave;ng v&agrave; thanh tho&aacute;t nhưng vẫn giữ nguy&ecirc;n form gi&agrave;y thuần Việt. Phi&ecirc;n bản mới nhất n&agrave;y được mang t&ecirc;n Velocidad Legend. \r\nGi&agrave;y đ&aacute; b&oacute;ng Kamito Velocidad Legend TF - Aqua Blue/White l&agrave; một trong những sản phẩm đầu ti&ecirc;n của Kamito, Velocidad với kiểu d&aacute;ng đơn giản c&ugrave;ng form gi&agrave;y thuần Việt đ&atilde; trở th&agrave;nh d&ograve;ng gi&agrave;y b&oacute;ng đ&aacute; được y&ecirc;u th&iacute;ch v&agrave; săn t&igrave;m tr&ecirc;n thị trường. Sau ba phi&ecirc;n bản đ&atilde; được ra mắt, Velocidad đ&atilde; dần trở th&agrave;nh một mẫu gi&agrave;y &ldquo;quốc d&acirc;n&rdquo; xuất hiện ở mọi s&acirc;n b&oacute;ng. Với thiết kế quen thuộc v&agrave; được bổ sung th&ecirc;m c&aacute;c họa tiết Camo ẩn hiện tr&ecirc;n th&acirc;n gi&agrave;y, Velocidad Legend c&oacute; d&aacute;ng vẻ Cool Ngầu đầy mạnh mẽ. B&ecirc;n cạnh đ&oacute;, phi&ecirc;n bản đặc biệt n&agrave;y cũng c&oacute; rất nhiều m&agrave;u sắc nổi bật, c&aacute; t&iacute;nh, mang tới nhiều sự lựa chọn cho người d&ugrave;ng. \r\nNhững đặc điểm nổi bật của Velocidad Legend: \r\n\r\nPhom gi&agrave;y được nghi&ecirc;n cứu dựa tr&ecirc;n những mẫu b&agrave;n ch&acirc;n thật của người Việt, lu&ocirc;n mang tới sự thoải m&aacute;i, &ocirc;m ch&acirc;n cho d&ugrave; người chơi c&oacute; b&agrave;n ch&acirc;n b&egrave;, d&agrave;y. \r\n\r\nThiết kế mới ấn tượng với những họa tiết Camo ẩn hiện c&ugrave;ng nhiều m&agrave;u sắc nổi bật, mang tới nhiều sự lựa chọn cho người d&ugrave;ng. \r\n\r\nChất liệu da được tinh chỉnh mang tới sự mềm mại v&agrave; cảm gi&aacute;c b&oacute;ng tốt hơn. B&ecirc;n cạnh đ&oacute;, độ bền của gi&agrave;y cũng được n&acirc;ng l&ecirc;n một tầm cao mới. \r\n\r\nD&agrave;n đinh dăm được sắp xếp khoa học gi&uacute;p b&aacute;m s&acirc;n hiệu quả ngay cả khi trời mưa s&acirc;n trơn b&oacute;ng ướt. Bộ đế ngo&agrave;i của Velocidad được l&agrave;m từ cao su cao cấp, bền bỉ, gi&uacute;p c&aacute;c cầu thủ di chuyển dễ d&agrave;ng trong những pha xử l&yacute; kh&oacute;.\r\n', 4567, 560000, 20, 0, 1, NULL, NULL, NULL, '2024-03-20 12:20:58', NULL),
(101, 'ADIDAS X SPEEDFLOW .3 TF DIAMOND EDGE - FOOTWEAR WHITE/LEGEND INK/HI-RES BLUE KIDS', 14, 'product-14.webp', 'adidas X Speedflow .3 TF Diamond Edge - Footwear White/Legend Ink/Hi-Res Blue Kids l&agrave; mẫu gi&agrave;y size Kids d&agrave;nh cho s&acirc;n cỏ nh&acirc;n tạo 5-7 người. Về thiết kế Adidas X Speedflow .3 TF sở hữu gam m&agrave;u trắng - xanh h&agrave;i h&ograve;a đầy phong c&aacute;ch. Phi&ecirc;n bản n&agrave;y l&agrave; một phần của bộ sưu tập Diamond Edge - BST gi&agrave;y đ&aacute; b&oacute;ng cuối c&ugrave;ng của Adidas trong m&ugrave;a giải 21-22. Colorway ch&iacute;nh thức của Adidas X Speedflow Diamond Edge l&agrave; &#039;White / Legacy Indigo / Sky Rush&#039; với gam m&agrave;u trắng chủ đạo, nổi bật với c&aacute;c chi tiết m&agrave;u xanh da trời ở logo 3 dọc, phần tr&ecirc;n upper v&agrave; đinh gi&agrave;y.\r\nVề c&ocirc;ng nghệ của phi&ecirc;n bản Adidas X Speedflow .3 TF Kids:\r\n\r\nSản phẩm Adidas X Speedflow .3 được c&aacute;c cầu thủ nổi tiếng đại diện gồm c&oacute; Lionel Messi, Karim Benzema, Marcelo, Mohamed Salah, Son Hueng Min v&agrave; Timo Werner...\r\n\r\nCổ thun liền tạo n&ecirc;n sự chắc chắn hơn v&agrave; bảo về cổ ch&acirc;n tốt hơn.\r\n\r\nChất liệu từ da tổng hợp mới co gi&atilde;n v&agrave; tối ưu trọng lượng.\r\n\r\nK&yacute; hiệu &#039;&gt; 299 792 458 m/s&#039;, c&oacute; &yacute; nghĩa nhanh hơn cả vận tốc &aacute;nh s&aacute;ng. Đ&ocirc;i gi&agrave;y vẫn tự h&agrave;o với vẻ ngo&agrave;i đặc trưng của một đ&ocirc;i gi&agrave;y bứt tốc, đặc biệt th&iacute;ch hợp d&agrave;nh cho những cầu thủ đam m&ecirc; tốc độ. \r\n\r\nPhần đế của  X SpeedFlow TF thiết kế giống ho&agrave;n to&agrave;n phi&ecirc;n bản X Ghosted với 2 mảng đế liền nhau to&agrave;n bộ gh&eacute;p r&otilde; r&agrave;ng bổ trợ độ b&aacute;m cho phần đệm g&oacute;t v&agrave; gang b&agrave;n ch&acirc;n khi trụ.\r\n', 453, 1490000, 15, 0, 1, NULL, NULL, NULL, '2024-03-20 12:22:19', NULL),
(102, 'ADIDAS COPA SENSE .1 FG GAME DATA - SOLAR YELLOW/SOLAR RED/CORE BLACK', 14, 'product-11.webp', 'Bộ sưu tập gi&agrave;y đ&aacute; b&oacute;ng adidas &lsquo;Game Data&rsquo; ch&iacute;nh thức được tung ra thị trường với c&aacute;c t&ugrave;y chọn m&agrave;u sắc rực rỡ, bao gồm sự xuất hiện của Predator Edge, COPA Sense v&agrave; X Speedportal ho&agrave;n to&agrave;n mới. Đ&acirc;y l&agrave; một trong những bộ sưu tập kh&oacute; bỏ lỡ trong năm nay với những thiết kế đặc sắc, nổi bật sẽ xuất hiện ở s&acirc;n cỏ tr&ecirc;n khắp nước Anh trong Euro 2022. \r\n\r\nadidas Copa Sense .1 FG Game Data - Solar Yellow/Solar Red/Core Black l&agrave; phi&ecirc;n bản cao cấp s&acirc;n cỏ tự nhi&ecirc;n 7-11 người. Nằm trong BST &#039;Game Data&#039; với gam m&agrave;u v&agrave;ng chanh chủ đạo nổi bật, kết hợp c&ugrave;ng c&aacute;c chi tiết m&agrave;u đen, đỏ nổi bật ở cổ gi&agrave;y v&agrave; đế gi&agrave;y. \r\nVề c&ocirc;ng nghệ của phi&ecirc;n bản Adidas Copa Sense .1:\r\n\r\nSản phẩm Adidas Copa Sense được c&aacute;c cầu thủ nổi tiếng đại diện gồm c&oacute; Paulo Dybala, Pedri Gonzalez, Lorenzo Insigne v&agrave; Joao Felix...\r\n\r\nCổ gi&agrave;y rời tạo n&ecirc;n sự thoải m&agrave;i v&agrave; dễ d&agrave;ng xỏ gi&agrave;y hơn cho những người chơi c&oacute; form ch&acirc;n b&egrave;.\r\n\r\nChất liệu từ da Kangaroo nguy&ecirc;n khối tự nhi&ecirc;n cao cấp kết hợp những đường s&oacute;ng Fusionskin cho cảm gi&aacute;c &ecirc;m mềm, thoải m&aacute;i, thật ch&acirc;n, tối ưu khả năng cảm b&oacute;ng tốt, độ bền cao v&agrave; cải thiện t&iacute;nh linh hoạt cho người chơi khi mang gi&agrave;y.\r\n\r\nC&ocirc;ng nghệ Sensepods một cải tiến mới được thiết kế để gia tăng cảm gi&aacute;c vừa vặn v&agrave; thoải m&aacute;i khi mang. \r\n\r\nC&ocirc;ng nghệ Touchpods phần đệm l&oacute;t được đặt ở cả giữa v&agrave; mặt b&ecirc;n của đ&ocirc;i gi&agrave;y với mục đ&iacute;ch tối ưu khả năng kiểm so&aacute;t v&agrave; chuyền b&oacute;ng tốt hơn cho c&aacute;c cầu thủ.\r\n\r\nKhu&ocirc;n đế Sense Frame b&aacute;m s&acirc;n c&ugrave;ng với 2 đinh Soft-Stud được bổ sung gi&uacute;p người chơi xoay chuyển tốt hơn cũng như kh&oacute;a ch&acirc;n chắc chắn.\r\n\r\nTrọng lượng: 246 gram/chiếc (Size 41).\r\n', 456, 560000, 10, 0, 1, NULL, NULL, NULL, '2024-03-20 12:23:24', NULL),
(103, 'MIZUNO MORELIA NEO III PRO IN LẠC VIỆT - RED/YELLOW LIMITED EDITION', 14, 'product-12.webp', 'Để kỉ niệm 7 năm Mizuno c&oacute; mặt tại thị trường Việt Nam v&agrave; để tri &acirc;n người chơi b&oacute;ng đ&aacute; y&ecirc;u mến Mizuno, ch&uacute;ng t&ocirc;i xin giới thiệu phi&ecirc;n bản gi&agrave;y b&oacute;ng đ&aacute; giới hạn đặc biệt: Morelia Neo III Lac Viet Limited Edition. \r\nMizuno Morelia Neo III Pro IN Lạc Việt - Red/Yellow Limited Edition l&agrave; phi&ecirc;n bản d&agrave;nh cho b&oacute;ng đ&aacute; đường phố v&agrave; s&acirc;n Futsal d&agrave;nh ri&ecirc;ng cho thị trường Việt Nam với những họa tiết h&igrave;nh chim Lạc được thiết kế tinh tế chạy theo th&acirc;n gi&agrave;y. Chim Lạc l&agrave; h&igrave;nh ảnh mang đậm dấu ấn Việt Nam, biểu tượng cho sự kh&aacute;t vọng vươn cao, vượt qua mọi giới hạn. Phần hộp gi&agrave;y cũng được sử dụng c&aacute;c họa tiết n&agrave;y c&ugrave;ng t&ocirc;ng m&agrave;u đỏ nổi bật tạo n&ecirc;n điểm nhấn cho tổng thể sản phẩm. \r\nVề c&ocirc;ng nghệ của phi&ecirc;n bản Mizuno Morelia Neo III Pro IN:\r\n\r\nSản phẩm Mizuno Morelia Neo III được c&aacute;c cầu thủ nổi tiếng đại diện gồm c&oacute; Roberto Carlos, Rivaldo, Fernando Torres&hellip;. \r\n\r\nChất liệu da Kangaroo si&ecirc;u mềm đ&atilde; được Mizuno sử dụng hiệu quả ở phần Upper gi&agrave;y, hỗ trợ tối đa cho c&aacute;c cầu thủ khi nhận b&oacute;ng, đi b&oacute;ng, những pha s&uacute;t mu uy lực v&agrave; tạo cảm gi&aacute;c như đi ch&acirc;n trần.\r\n\r\nCổ gi&agrave;y ở phi&ecirc;n bản Morelia Neo III Pro AS khi đ&atilde; được tinh chỉnh gọn nhẹ hơn, mỏng hơn v&agrave; phần cổ chun co gi&atilde;n ở ph&iacute;a g&oacute;t ch&acirc;n mang lại sự linh hoạt nhưng vẫn đầy chắc chắn khi xỏ gi&agrave;y.\r\n\r\nL&oacute;t gi&agrave;y &ecirc;m &aacute;i, chống trượt hiệu quả v&agrave; c&oacute; thể th&aacute;o rời.\r\n\r\nBề mặt đế được l&agrave;m từ cao su cao cấp, rất b&aacute;m s&acirc;n, gi&uacute;p c&aacute;c cầu thủ c&oacute; thể đổi hướng linh hoạt.', 2345, 830000, 20, 0, 1, NULL, NULL, NULL, '2024-03-20 12:24:18', NULL),
(104, 'ADIDAS X SPEEDFLOW .3 TF DIAMOND EDGE - FOOTWEAR WHITE/LEGEND INK/HI-RES BLUE KIDS', 14, 'product-14.webp', 'adidas X Speedflow .3 TF Diamond Edge - Footwear White/Legend Ink/Hi-Res Blue Kids l&agrave; mẫu gi&agrave;y size Kids d&agrave;nh cho s&acirc;n cỏ nh&acirc;n tạo 5-7 người. Về thiết kế Adidas X Speedflow .3 TF sở hữu gam m&agrave;u trắng - xanh h&agrave;i h&ograve;a đầy phong c&aacute;ch. Phi&ecirc;n bản n&agrave;y l&agrave; một phần của bộ sưu tập Diamond Edge - BST gi&agrave;y đ&aacute; b&oacute;ng cuối c&ugrave;ng của Adidas trong m&ugrave;a giải 21-22. Colorway ch&iacute;nh thức của Adidas X Speedflow Diamond Edge l&agrave; &#039;White / Legacy Indigo / Sky Rush&#039; với gam m&agrave;u trắng chủ đạo, nổi bật với c&aacute;c chi tiết m&agrave;u xanh da trời ở logo 3 dọc, phần tr&ecirc;n upper v&agrave; đinh gi&agrave;y.\r\nVề c&ocirc;ng nghệ của phi&ecirc;n bản Adidas X Speedflow .3 TF Kids:\r\n\r\nSản phẩm Adidas X Speedflow .3 được c&aacute;c cầu thủ nổi tiếng đại diện gồm c&oacute; Lionel Messi, Karim Benzema, Marcelo, Mohamed Salah, Son Hueng Min v&agrave; Timo Werner...\r\n\r\nCổ thun liền tạo n&ecirc;n sự chắc chắn hơn v&agrave; bảo về cổ ch&acirc;n tốt hơn.\r\n\r\nChất liệu từ da tổng hợp mới co gi&atilde;n v&agrave; tối ưu trọng lượng.\r\n\r\nK&yacute; hiệu &#039;&gt; 299 792 458 m/s&#039;, c&oacute; &yacute; nghĩa nhanh hơn cả vận tốc &aacute;nh s&aacute;ng. Đ&ocirc;i gi&agrave;y vẫn tự h&agrave;o với vẻ ngo&agrave;i đặc trưng của một đ&ocirc;i gi&agrave;y bứt tốc, đặc biệt th&iacute;ch hợp d&agrave;nh cho những cầu thủ đam m&ecirc; tốc độ. \r\n\r\nPhần đế của  X SpeedFlow TF thiết kế giống ho&agrave;n to&agrave;n phi&ecirc;n bản X Ghosted với 2 mảng đế liền nhau to&agrave;n bộ gh&eacute;p r&otilde; r&agrave;ng bổ trợ độ b&aacute;m cho phần đệm g&oacute;t v&agrave; gang b&agrave;n ch&acirc;n khi trụ.\r\n', 2345, 1490000, 10, 0, 1, NULL, NULL, NULL, '2024-03-20 12:25:18', NULL),
(105, 'ADIDAS X SPEEDFLOW .3 TF SAPPHIRE EDGE - SKY RUSH/SHOCK PINK/FOOTWEAR WHITE KIDS', 14, 'product-15.webp', 'adidas X Speedflow .3 TF Sapphire Edge - Sky Rush/Shock Pink/Footwear White Kids l&agrave; mẫu gi&agrave;y d&agrave;nh cho s&acirc;n cỏ nh&acirc;n tạo 5-7 người. Nằm trong BST mới Sapphire Edge, adidas X Speedflow .3 sở hữu phối m&agrave;u Sky Rush / Team Shock Pink / White với gam m&agrave;u xanh da trời tươi m&aacute;t l&agrave;m chủ đạo, nổi bật với c&aacute;c chi tiết m&agrave;u trắng v&agrave; hồng l&agrave;m điểm nhất ở logo 3 sọc. Adidas X SpeedFlow .3 TF chắc chắn sẽ l&agrave; đ&ocirc;i gi&agrave;y tốc độ cho c&aacute;c t&iacute;n đồ đam m&ecirc; cỏ nh&acirc;n tạo kh&ocirc;ng thể bỏ qua.\r\nVề c&ocirc;ng nghệ của phi&ecirc;n bản Adidas X Speedflow .3 Kids TF:\r\n\r\nSản phẩm Adidas X Speedflow .3 được c&aacute;c cầu thủ nổi tiếng đại diện gồm c&oacute; Lionel Messi, Karim Benzema, Marcelo, Mohamed Salah, Son Hueng Min v&agrave; Timo Werner...\r\n\r\nCổ thun liền tạo n&ecirc;n sự chắc chắn hơn v&agrave; bảo về cổ ch&acirc;n tốt hơn.\r\n\r\nChất liệu từ da tổng hợp mới co gi&atilde;n v&agrave; tối ưu trọng lượng.\r\n\r\nK&yacute; hiệu &#039;&gt; 299 792 458 m/s&#039;, c&oacute; &yacute; nghĩa nhanh hơn cả vận tốc &aacute;nh s&aacute;ng. Đ&ocirc;i gi&agrave;y vẫn tự h&agrave;o với vẻ ngo&agrave;i đặc trưng của một đ&ocirc;i gi&agrave;y bứt tốc, đặc biệt th&iacute;ch hợp d&agrave;nh cho những cầu thủ đam m&ecirc; tốc độ. \r\n\r\nPhần đế của  X SpeedFlow TF thiết kế giống ho&agrave;n to&agrave;n phi&ecirc;n bản X Ghosted với 2 mảng đế liền nhau to&agrave;n bộ gh&eacute;p r&otilde; r&agrave;ng bổ trợ độ b&aacute;m cho phần đệm g&oacute;t v&agrave; gang b&agrave;n ch&acirc;n khi trụ.\r\n', 2344, 1500000, 5, 0, 1, 1, 3, NULL, '2024-03-20 12:26:21', NULL),
(106, 'NIKE FOOTBALL FLIGHT PREMIER LEAGUE - WHITE/GOLD/BLUE', 15, 'product-16.webp', 'Để kỷ niệm 30 năm th&agrave;nh lập giải đấu Premier League, Nike đ&atilde; c&ocirc;ng bố quả b&oacute;ng thi đấu ch&iacute;nh thức cho m&ugrave;a giải 22/23, gợi nhắc lại một số phong c&aacute;ch retro cổ điển để vinh danh sự kiện lần n&agrave;y.\r\nNike Football Flight Premier League - White/Gold/Blue l&agrave; phi&ecirc;n bản banh cao cấp d&agrave;nh cho s&acirc;n cỏ tự nhi&ecirc;n 7-11 người. Phi&ecirc;n bản b&oacute;ng Nike Flight d&agrave;nh cho m&ugrave;a giải 22/23 l&agrave; một bản cập nhật thẩm mỹ ấn tượng nh&acirc;n dịp kỷ niệm 30 năm ng&agrave;y giải đấu Premier League ch&iacute;nh thức xuất hiện kể từ năm 1992. Để t&aacute;i hiện bối cảnh của năm 1992, Nike đ&atilde; lấy &yacute; tưởng từ những chi tiết đồ họa cổ điển để thiết kế quả b&oacute;ng lần n&agrave;y. Bao gồm thương hiệu &quot;NIKE&quot; được viết bằng ph&ocirc;ng chữ cổ điển c&ugrave;ng c&aacute;c đồ họa chữ X lớn được đặt một c&aacute;ch nổi bật tr&ecirc;n nền trắng gi&uacute;p b&oacute;ng dễ d&agrave;ng được quan s&aacute;t v&agrave; theo d&otilde;i tr&ecirc;n s&acirc;n cỏ. Ngo&agrave;i ra, ở phần nền m&agrave;u trắng của quả b&oacute;ng l&agrave; v&ocirc; số c&aacute;c biểu tượng vương miện Premier League được lặp đi lặp lại với số 30 b&ecirc;n trong đại diện cho 30 năm kể từ ng&agrave;y th&agrave;nh lập giải đấu lịch sử.\r\nVề mặt c&ocirc;ng nghệ, b&oacute;ng đ&aacute; Nike Football Flight: \r\n\r\n- Những c&ocirc;ng nghệ b&oacute;ng Nike mang t&iacute;nh đột ph&aacute;, đ&atilde; được ph&aacute;t triển trong hơn 8 năm v&agrave; 1.700 giờ thử nghiệm. \r\n\r\n- C&ocirc;ng nghệ Nike Aerow Sculpt sử dụng c&aacute;c r&atilde;nh kh&iacute; động học để giảm lực cản của kh&ocirc;ng kh&iacute;, gi&uacute;p đường bay ch&iacute;nh x&aacute;c v&agrave; ổn định hơn 30% so với b&oacute;ng c&oacute; bề mặt phẳng. C&ocirc;ng nghệ n&agrave;y gi&uacute;p banh của Nike đặc biệt nổi bật so với c&aacute;c h&atilde;ng kh&aacute;c.\r\n\r\n- C&ocirc;ng nghệ Kiểm so&aacute;t mọi điều kiện (ACC - All Condition Control) l&agrave; c&ocirc;ng nghệ tạo ra bề mặt phủ l&ecirc;n b&oacute;ng. Bề mặt n&agrave;y gi&uacute;p c&aacute;c cầu thủ dễ kiếm so&aacute;t b&oacute;ng hơn trong mọi điều kiện thời tiết &ldquo;kh&oacute; chịu&rdquo; như mưa, tuyết.\r\n\r\n- C&aacute;c v&acirc;n nổi 3D l&agrave;m tăng khả năng tiếp b&oacute;ng của c&aacute;c cầu thủ, gi&uacute;p họ c&oacute; cảm gi&aacute;c banh v&agrave; điều khiển b&oacute;ng dễ d&agrave;ng hơn. \r\n\r\n- Chứng nhận FIFA Quality Pro: Đ&acirc;y l&agrave; chứng nhận chất lượng tốt nhất theo đ&aacute;nh gi&aacute; của FIFA sau c&aacute;c thử nghiệm về độ chuẩn của chu vi, c&acirc;n nặng, độ nảy v&agrave; độ thấm nước.\r\nC&aacute;c sản phẩm b&oacute;ng ch&iacute;nh h&atilde;ng NIKE, ADIDAS, MOLTEN sẽ &aacute;p dụng ch&iacute;nh s&aacute;ch bảo h&agrave;nh như sau:\r\n\r\n&ndash; C&Aacute;C LỖI ĐƯỢC BẢO H&Agrave;NH:\r\n\r\nBảo h&agrave;nh 1 đổi 1 trong 7 ng&agrave;y đầu t&iacute;nh từ ng&agrave;y mua h&agrave;ng với c&aacute;c lỗi sau (lỗi đến từ nh&agrave; sản xuất) với 2 lỗi sau: \r\n\r\n1. Thụt van, van bơm hỏng. \r\n\r\n2. X&igrave; lỗ mọt, giảm hơi nhanh kh&ocirc;ng r&otilde; nguy&ecirc;n nh&acirc;n, kh&ocirc;ng phải do bị vật sắc nhọn đ&acirc;m thủng \r\n\r\nLƯU &Yacute;: C&Aacute;C LỖI CHỦ QUAN CỦA KH&Aacute;CH H&Agrave;NG TRONG QU&Aacute; TR&Igrave;NH SỬ DỤNG V&Agrave; THI ĐẤU NHƯ BỊ VẬT SẮC NHỌN Đ&Acirc;M THỦNG, MA S&Aacute;T VỚI NỀN S&Acirc;N CỨNG G&Acirc;Y HAO M&Ograve;N, HƯ HỎNG, BONG TR&Oacute;C, TRẦY R&Aacute;CH BỀ MẶT QUẢ B&Oacute;NG HOẶC C&Aacute;C VẤN ĐỀ LI&Ecirc;N QUAN ĐẾN THẨM MỸ SẼ KH&Ocirc;NG THỂ BẢO H&Agrave;NH.', 2324, 900000, 10, 0, 1, 2, 8, NULL, '2024-03-20 12:27:41', NULL),
(107, 'ADIDAS FOOTBALL CHAMPIONS LEAGUE 2022 PRO MATCH BALL - WHITE/SILVER METALLIC/BRIGHT CYAN', 15, 'product-17.webp', 'Quả b&oacute;ng adidas Champions League 22/23 mới đ&atilde; ch&iacute;nh thức được tung ra thị trường v&agrave; nhanh ch&oacute;ng đ&atilde; xuất hiện tại Neymarsport. Đ&acirc;y l&agrave; quả b&oacute;ng thi đấu ch&iacute;nh thức sẽ được sử dụng trong v&ograve;ng bảng của giải đấu UEFA Champions League 2022-2023. Phi&ecirc;n bản mới t&ecirc;n l&agrave; Adidas UCL Pro Void, c&oacute; thiết kế lấy cảm hứng từ &ldquo;vũ trụ s&acirc;u&rdquo; - trong kh&ocirc;ng gian tối đen như mực, c&aacute;c ng&ocirc;i sao c&agrave;ng tỏa s&aacute;ng hơn. \r\nadidas Football Champions League 2022 Pro Match Ball - White/Silver Metallic/Bright Cyan l&agrave; quả b&oacute;ng cao cấp d&agrave;nh cho s&acirc;n cỏ tự nhi&ecirc;n 11 người. Về thiết kế, c&oacute; kiểu d&aacute;ng hiện đại v&agrave; nổi bật với vẻ ngo&agrave;i của b&oacute;ng được thiết kế bắt mắt với phần đế m&agrave;u trắng kết hợp c&ugrave;ng c&aacute;c logo m&agrave;u đen v&agrave; những ng&ocirc;i sao nhiều m&agrave;u kết nối quen thuộc tượng trưng cho sự đo&agrave;n kết - đại diện cho tinh thần của m&ocirc;n thể thao vua. Lấy cảm hứng từ Deep Space &ndash; &ldquo;vũ trụ s&acirc;u&rdquo; adidas kết hợp h&agrave;i h&ograve;a nhiều gam m&agrave;u nổi bật ấn tượng đại diện cho v&ugrave;ng s&acirc;u thẳm nhất của thi&ecirc;n h&agrave; rộng lớn với nhiều h&agrave;nh tinh tỏa s&aacute;ng tr&ecirc;n thiết kế của quả b&oacute;ng Champion League năm nay.\r\nVề c&ocirc;ng nghệ của quả b&oacute;ng adidas Football Champions League 2022 Pro Match Ball :\r\n\r\nBề mặt nối gh&eacute;p bằng nhiệt: B&oacute;ng được thiết kế đặc biệt với bề mặt kh&ocirc;ng đường may, cho quỹ đạo ch&iacute;nh x&aacute;c hơn, tối ưu khả năng chạm b&oacute;ng tốt hơn v&agrave; &iacute;t thấm nước hơn.\r\n\r\nLớp phủ bề mặt: Cao b&oacute;ng.\r\n\r\nChất liệu vỏ: Da PU chống ma s&aacute;t v&agrave; b&agrave;o m&ograve;n bề mặt.\r\n\r\nRuột b&oacute;ng: Cao su non tự nhi&ecirc;n Latex gi&uacute;p đảm bảo độ nẩy v&agrave; đ&agrave;n hồi ti&ecirc;u chuẩn.\r\n\r\nC&ocirc;ng nghệ ACENTEC được sản xuất ho&agrave;n to&agrave;n từ d&acirc;y chuyền sản xuất ti&ecirc;n tiến tự động l&agrave;m cho bề mặt b&oacute;ng đồng đều tr&ograve;n trịa nhất, đạt được ti&ecirc;u chuẩn cao nhất, cho người chơi cảm gi&aacute;c tốt nhất với quả b&oacute;ng.\r\n\r\nChứng nhận FIFA Quality Pro: Đ&acirc;y l&agrave; chứng nhận chất lượng tốt nhất theo đ&aacute;nh gi&aacute; của FIFA sau c&aacute;c thử nghiệm về độ chuẩn của chu vi, c&acirc;n nặng, độ nảy v&agrave; độ thấm nước.\r\n\r\nHuy hiệu in UEFA Champions League: Huy hiệu chỉ d&agrave;nh ri&ecirc;ng cho những tr&aacute;i b&oacute;ng đ&atilde; đạt chuẩn thi đấu v&agrave; sẽ ch&iacute;nh thức xuất hiện trong c&aacute;c trận đấu của giải UEFA Champions League.\r\n\r\nM&agrave;u sắc nổi bật, bắt mắt: White / Silver metallic / Bright cyan / Pantone.\r\nVề c&ocirc;ng nghệ của quả b&oacute;ng adidas Football Champions League 2022 Pro Match Ball :\r\n\r\nBề mặt nối gh&eacute;p bằng nhiệt: B&oacute;ng được thiết kế đặc biệt với bề mặt kh&ocirc;ng đường may, cho quỹ đạo ch&iacute;nh x&aacute;c hơn, tối ưu khả năng chạm b&oacute;ng tốt hơn v&agrave; &iacute;t thấm nước hơn.\r\n\r\nLớp phủ bề mặt: Cao b&oacute;ng.\r\n\r\nChất liệu vỏ: Da PU chống ma s&aacute;t v&agrave; b&agrave;o m&ograve;n bề mặt.\r\n\r\nRuột b&oacute;ng: Cao su non tự nhi&ecirc;n Latex gi&uacute;p đảm bảo độ nẩy v&agrave; đ&agrave;n hồi ti&ecirc;u chuẩn.\r\n\r\nC&ocirc;ng nghệ ACENTEC được sản xuất ho&agrave;n to&agrave;n từ d&acirc;y chuyền sản xuất ti&ecirc;n tiến tự động l&agrave;m cho bề mặt b&oacute;ng đồng đều tr&ograve;n trịa nhất, đạt được ti&ecirc;u chuẩn cao nhất, cho người chơi cảm gi&aacute;c tốt nhất với quả b&oacute;ng.\r\n\r\nChứng nhận FIFA Quality Pro: Đ&acirc;y l&agrave; chứng nhận chất lượng tốt nhất theo đ&aacute;nh gi&aacute; của FIFA sau c&aacute;c thử nghiệm về độ chuẩn của chu vi, c&acirc;n nặng, độ nảy v&agrave; độ thấm nước.\r\n\r\nHuy hiệu in UEFA Champions League: Huy hiệu chỉ d&agrave;nh ri&ecirc;ng cho những tr&aacute;i b&oacute;ng đ&atilde; đạt chuẩn thi đấu v&agrave; sẽ ch&iacute;nh thức xuất hiện trong c&aacute;c trận đấu của giải UEFA Champions League.\r\n\r\nM&agrave;u sắc nổi bật, bắt mắt: White / Silver metallic / Bright cyan / Pantone.', 3456, 380000, 10, 0, 1, NULL, NULL, NULL, '2024-03-20 12:28:35', NULL),
(108, 'NIKE PHANTOM GT 2 ELITE DF FG THE PROGRESS - FOOTBALL GREY/BLACKENED BLUE', 13, 'product-25.webp', 'Chưa c&oacute; m&ocirc; tả cho sản phẩm n&agrave;y', 1234, 0, 0, 0, 1, NULL, NULL, NULL, '2024-03-20 12:39:55', NULL),
(109, 'NIKE AIR ZOOM MERCURIAL SUPERFLY ELITE 10 FG LUCENT - YELLOW STRIKE/SUNSET GLOW/BARELY GRAPE', 13, 'product-16.webp', 'chưa có mô tả', 12, 320000, 30, 0, 1, NULL, NULL, NULL, '2024-03-27 08:08:59', NULL),
(110, 'MIZUNO MONARCIDA NEO II HAHAHA', 15, 'product-05.webp', 'Chưa có mô tả', 1234, 540000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:24:26', NULL),
(111, 'MIZUNO MONARCIDA NEO II HEHE', 14, 'product-02.webp', 'chưa có mô tả', 121, 230000, 0, 0, 1, NULL, NULL, NULL, '2024-03-27 12:26:34', NULL),
(112, 'MIZUNO MONARCIDA NEO', 15, 'product-04.webp', 'chưa có mô tả', 1235, 340000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:27:51', NULL),
(113, 'MIZUNO MONARCIDA NEO II SELECT AS TF - ', 15, 'product-09.webp', 'Chưa có mô tả', 890, 345000, 15, 0, 1, NULL, NULL, NULL, '2024-03-27 12:28:28', NULL),
(114, ' NEO II SELECT AS TF - BLACK/BLACK', 15, 'product-17.webp', 'Chưa có mô tả', 1254, 390000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:32:52', NULL),
(115, 'MIZUNO MONARCIDA NEO II SELECT AS TF - BLACK/BLACK', 16, 'product-19.webp', 'Chưa có mô tả', 1200, 360000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:33:44', NULL),
(116, 'AKLRF73-1 3 Light Gray', 16, 'product-17.webp', 'chưa có mô tả', 4345, 560000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:32:20', NULL),
(117, 'AKLRF73-3 Li-Ning White', 16, 'product-17.webp', 'chưa có mô tả', 456, 760000, 20, 0, 1, NULL, NULL, NULL, '2024-03-27 12:31:34', NULL),
(118, 'AKLS015-1 Li-Ning Black', 16, 'product-17.webp', 'chưa có mo tả', 453, 810000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:29:36', NULL),
(119, 'AKLS093-6 Gray Light', 16, 'product-17.webp', 'chưa có mô tả', 543, 540000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:31:04', NULL),
(120, 'AKLR315-2 Li-Ning POM', 16, 'product-18.webp', 'chưa có mô tả', 2350, 540000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:30:37', NULL),
(126, 'AKLSB85-1 Li-Ning co dãn', 16, 'product-15.webp', 'chưa có mô tả', 782, 450000, 10, 0, 1, NULL, NULL, NULL, '2024-03-27 12:30:06', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `images` varchar(299) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `images`) VALUES
(257, 91, 'product-04.webp'),
(258, 91, 'product-04.webp'),
(259, 91, 'product-04.webp'),
(260, 91, 'product-04.webp'),
(261, 91, 'product-02.webp'),
(267, 92, 'product-02.webp'),
(268, 92, 'product-02.webp'),
(269, 92, 'product-02.webp'),
(270, 92, 'product-02.webp'),
(271, 92, 'product-02.webp'),
(272, 93, 'product-03.webp'),
(273, 93, 'product-03.webp'),
(274, 93, 'product-03.webp'),
(275, 93, 'product-03.webp'),
(276, 93, 'product-03.webp'),
(277, 94, 'product-05.webp'),
(278, 94, 'product-05.webp'),
(279, 94, 'product-05.webp'),
(280, 94, 'product-05.webp'),
(281, 94, 'product-05.webp'),
(282, 95, 'product-06.webp'),
(283, 95, 'product-06.webp\r\n'),
(284, 95, 'product-06.webp'),
(285, 95, 'product-06.webp'),
(286, 95, 'product-06.webp'),
(287, 96, 'sp6-1.png'),
(288, 96, 'sp6-2.png'),
(289, 96, 'sp6-3.png'),
(290, 96, 'sp6-4.png'),
(291, 96, 'sp6-5.png'),
(292, 97, 'sp7-1.png'),
(293, 97, 'sp7-2.png'),
(294, 97, 'sp7-3.png'),
(295, 97, 'sp7-4.png'),
(296, 97, 'sp7-5.png'),
(297, 98, 'sp8-1.png'),
(298, 98, 'sp8-2.png'),
(299, 98, 'sp8-3.png'),
(300, 98, 'sp8-4.png'),
(301, 98, 'sp8-5.png'),
(302, 99, 'cl1-1.png'),
(303, 99, 'cl1-2.png'),
(304, 99, 'cl1-3.png'),
(305, 99, 'cl1-4.png'),
(306, 99, 'cl1-5.png'),
(307, 100, 'cl2-1.png'),
(308, 100, 'cl2-2.png'),
(309, 100, 'cl2-3.png'),
(310, 100, 'cl2-4.png'),
(311, 100, 'cl2-5.png'),
(312, 101, 'cl3-1.png'),
(313, 101, 'cl3-2.png'),
(314, 101, 'cl3-3.png'),
(315, 101, 'cl3-4.png'),
(316, 101, 'cl3-5.png'),
(317, 102, 'cl4-1.png'),
(318, 102, 'cl4-2.png'),
(319, 102, 'cl4-3.png'),
(320, 102, 'cl4-4.png'),
(321, 102, 'cl4-5.png'),
(322, 103, 'cl5-1.png'),
(323, 103, 'cl5-2.png'),
(324, 103, 'cl5-3.png'),
(325, 103, 'cl5-4.png'),
(326, 103, 'cl5-5.png'),
(327, 104, 'cl6-1.png'),
(328, 104, 'cl6-2.png'),
(329, 104, 'cl6-3.png'),
(330, 104, 'cl6-4.png'),
(331, 104, 'cl6-5.png'),
(332, 104, 'cl6-6.png'),
(333, 104, 'cl6-7.png'),
(334, 104, 'cl6-8.png'),
(335, 105, 'cl7-1.png'),
(336, 105, 'cl7-2.png'),
(337, 105, 'cl7-3.png'),
(338, 105, 'cl7-4.png'),
(339, 105, 'cl7-5.png'),
(340, 105, 'cl7-6.png'),
(341, 106, 'thun1-1.png'),
(342, 106, 'thun1-2.png'),
(343, 106, 'thun1-3.png'),
(344, 107, 'thun2-1.png'),
(345, 107, 'thun2-2.png'),
(346, 107, 'thun2-3.png'),
(347, 107, 'thun2-4.png'),
(348, 108, 'thun3-1.png'),
(349, 108, 'thun3-2.png'),
(350, 108, 'thun3-3.png'),
(351, 109, 'thun4-1.png'),
(352, 109, 'thun4-2.png'),
(353, 109, 'thun4-3.png'),
(354, 109, 'thun4-4.png'),
(355, 110, 'thun5-1.png'),
(356, 110, 'thun5-2.png'),
(357, 110, 'thun5-3.png'),
(358, 110, 'thun5-4.png'),
(359, 111, 'thun6-1.png'),
(360, 111, 'thun6-2.png'),
(361, 111, 'thun6-3.png'),
(362, 111, 'thun6-4.png'),
(363, 112, 'thun7-1.png'),
(364, 112, 'thun7-2.png'),
(365, 112, 'thun7-3.png'),
(366, 112, 'thun7-4.png'),
(367, 113, 'thun8-1.png'),
(368, 113, 'thun8-2.png'),
(369, 113, 'thun8-3.png'),
(370, 113, 'thun8-4.png'),
(371, 113, 'thun8-5.png'),
(372, 113, 'thun8-6.png'),
(373, 114, 'thun9-1.png'),
(374, 114, 'thun9-2.png'),
(375, 114, 'thun9-3.png'),
(376, 114, 'thun9-4.png'),
(377, 115, 'ni1-1.png'),
(378, 115, 'ni1-2.png'),
(379, 115, 'ni1-3.png'),
(380, 115, 'ni1-4.png'),
(381, 116, 'ni2-1.png'),
(382, 116, 'ni2-2.png'),
(383, 116, 'ni2-3.png'),
(384, 116, 'ni2-4.png'),
(385, 117, 'ni3-4.png'),
(386, 117, 'ni3-5.png'),
(387, 117, 'ni3-6.png'),
(388, 117, 'ni3-7.png'),
(389, 118, 'ni4-1.png'),
(390, 118, 'ni4-2.png'),
(391, 118, 'ni4-3.png'),
(392, 118, 'ni4-4.png'),
(393, 118, 'ni4-5.png'),
(394, 119, 'ni5-1.png'),
(395, 119, 'ni5-2.png'),
(396, 119, 'ni5-3.png'),
(397, 119, 'ni5-4.png'),
(398, 119, 'ni5-5.png'),
(399, 119, 'ni5-6.png'),
(400, 119, 'ni5-7.png'),
(401, 119, 'ni5-8.png'),
(402, 120, 'ni6-1.png'),
(403, 120, 'ni6-2.png'),
(404, 120, 'ni6-3.png'),
(405, 120, 'ni6-4.png'),
(418, 126, 'nisp1.png'),
(419, 126, 'nisp2.png'),
(420, 126, 'nisp3.png'),
(421, 126, 'nisp4.png'),
(422, 126, 'nisp5.png'),
(423, 126, 'nisp6.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `unspecified_orders_detail`
--

CREATE TABLE `unspecified_orders_detail` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_product` int NOT NULL,
  `size` varchar(15) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `unspecified_orders_detail`
--

INSERT INTO `unspecified_orders_detail` (`id`, `order_id`, `product_id`, `quantity`, `price_product`, `size`) VALUES
(34, 83, 128, 2, 12, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `unspecified_products`
--

CREATE TABLE `unspecified_products` (
  `id` int NOT NULL,
  `id_product` int DEFAULT NULL,
  `name_product` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price_product` int NOT NULL,
  `id_category` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `unspecified_products`
--

INSERT INTO `unspecified_products` (`id`, `id_product`, `name_product`, `avatar`, `price_product`, `id_category`) VALUES
(62, 127, 'sádasdasd', 'avatar.jpg', 120, 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(399) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(199) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` tinyint NOT NULL,
  `status` varchar(199) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `image`, `role`, `status`, `created_at`) VALUES
(16, 'Hoàng Tuấn', 'admin@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0868894724', 'Nam định', 'z2865098634298_f81f6c237617a253049c3463fe38351d.jpg', 1, '0', '2022-12-06 15:53:20'),
(17, 'trung kieu', 'admin2@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', '', '', 0, '0', '2022-12-05 06:07:01'),
(24, 'nam', '', NULL, '0326514789', 'Hà Nội', NULL, 3, '3', '2022-12-03 13:12:39'),
(25, 'Ba', '123@gmail.com', NULL, '0632145987', 'Hà Nội', NULL, 3, '3', '2022-12-05 05:56:49'),
(26, 'tuan', 'admin23@gmail.com', '25f9e794323b453885f5181f1b624d0b', '0968354123', 'Hà Nam', 'anh1.jpg', 0, '0', '2022-12-08 08:34:56'),
(27, 'tuan', 'tuan@gmail.com', '25d55ad283aa400af464c76d713c07ad', '0123456789', 'á đù vãi cả', 'anhlonhon2mb.png', 0, '0', '2022-12-06 06:29:07'),
(28, '', '', NULL, '', '', NULL, 3, '3', '2022-12-08 11:20:56'),
(29, 'hung quang trieu', 'hung1234@gmail.com', NULL, '0986889575', 'Nam định', NULL, 3, '3', '2022-12-08 15:11:06'),
(30, 'Hoàng Mạnh Tú', 'tu@gmail.com', NULL, '0321456987', 'Hà Nội', NULL, 3, '3', '2022-12-08 15:20:52'),
(31, 'quan', 'quanquat@gmail.com', NULL, '0389030093', 'Phú Thọ', NULL, 3, '3', '2024-03-22 13:59:09'),
(33, 'Do Quân', 'quanquay721@gmail.com', '25f9e794323b453885f5181f1b624d0b', '', '', '', 0, '0', '2024-03-22 14:38:02');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments_product`
--
ALTER TABLE `comments_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_product_id_cm` (`product_id`),
  ADD KEY `FK_user_id_cm` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_user_id_ord` (`user_id`);

--
-- Chỉ mục cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_order_id_ord` (`order_id`),
  ADD KEY `FK_product_id_ordetail` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_id_categories` (`category_id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_product_images` (`product_id`);

--
-- Chỉ mục cho bảng `unspecified_orders_detail`
--
ALTER TABLE `unspecified_orders_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `unspecified_products`
--
ALTER TABLE `unspecified_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `comments_product`
--
ALTER TABLE `comments_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT cho bảng `unspecified_orders_detail`
--
ALTER TABLE `unspecified_orders_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `unspecified_products`
--
ALTER TABLE `unspecified_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments_product`
--
ALTER TABLE `comments_product`
  ADD CONSTRAINT `FK_product_id_cm` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK_user_id_cm` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_user_id_ord` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `FK_order_id_ord` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FK_product_id_ordetail` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_id_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `FK_product_images` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
