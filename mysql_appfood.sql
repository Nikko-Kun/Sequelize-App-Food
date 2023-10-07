-- -------------------------------------------------------------
-- TablePlus 5.4.0(504)
--
-- https://tableplus.com/
--
-- Database: mysql_appfood
-- Generation Time: 2023-10-07 2:39:29.4110 CH
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(200) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(300) DEFAULT NULL,
  `arr_sub_id` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(200) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(150) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Bánh mỳ nướng', 'https://example.com/images/banh_my.jpg', 2.5, 'Bánh mỳ nướng giòn thơm', 3),
(2, 'Pizza hải sản', 'https://example.com/images/pizza_hai_san.jpg', 15.99, 'Pizza hải sản thơm ngon', 2),
(3, 'Gà nướng', 'https://example.com/images/ga_nuong.jpg', 10.5, 'Gà nướng hương thơm', 5),
(4, 'Bún chả', 'https://example.com/images/bun_cha.jpg', 8.75, 'Bún chả Hà Nội truyền thống', 2),
(5, 'Súp hải sản', 'https://example.com/images/sup_hai_san.jpg', 6.25, 'Súp hải sản đậm đà', 1);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Món Tráng Miệng'),
(2, 'Món Chính'),
(3, 'Món Ăn Nhanh'),
(4, 'Món Hấp'),
(5, 'Món Chiên'),
(6, 'Món Hầm'),
(7, 'Món Lẩu'),
(8, 'Món Xào'),
(9, 'Món Nướng'),
(10, 'Món Gỏi');

INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 1, '2023-08-02 10:15:00'),
(2, 2, 1, '2023-08-02 11:30:00'),
(3, 3, 2, '2023-08-02 12:45:00'),
(4, 1, 3, '2023-08-01 08:30:00'),
(5, 4, 2, '2023-08-01 20:00:00'),
(6, 1, 4, '2023-08-02 10:15:00'),
(7, 5, 1, '2023-08-03 11:30:00'),
(8, 5, 2, '2023-07-02 12:45:00'),
(9, 9, 3, '2023-06-01 08:30:00'),
(10, 14, 2, '2023-05-01 20:00:00'),
(11, 4, 5, '2023-04-02 11:30:00'),
(12, 5, 5, '2023-03-02 12:45:00'),
(13, 9, 1, '2023-02-01 08:30:00'),
(14, 8, 2, '2023-01-01 20:00:00');

INSERT INTO `orders` (`order_id`, `user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
(1, 1, 1, 2, 'ORDER1234', '1,3'),
(2, 2, 2, 1, 'ORDER5678', '2'),
(3, 3, 1, 3, 'ORDER91011', '2,4,5'),
(4, 4, 3, 1, 'ORDER1213', '1,3'),
(5, 1, 2, 2, 'ORDER1415', '2,5');

INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 4, '2023-08-02 12:30:00'),
(2, 2, 1, 5, '2023-08-02 13:45:00'),
(3, 3, 2, 3, '2023-08-02 10:15:00'),
(4, 1, 3, 2, '2023-08-01 08:00:00'),
(5, 4, 2, 5, '2023-08-01 19:30:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Nhà hàng A', 'https://example.com/images/a.jpg', 'Đây là mô tả về nhà hàng A.'),
(2, 'Nhà hàng B', 'https://example.com/images/b.jpg', 'Đây là mô tả về nhà hàng B.'),
(3, 'Nhà hàng C', 'https://example.com/images/c.jpg', 'Đây là mô tả về nhà hàng C.'),
(4, 'Nhà hàng D', 'https://example.com/images/d.jpg', 'Đây là mô tả về nhà hàng D.'),
(5, 'Nhà hàng E', 'https://example.com/images/e.jpg', 'Đây là mô tả về nhà hàng E.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Rau', 10.5, 1),
(2, 'Khăn giấy', 25, 2),
(3, 'Sốt', 5, 3),
(4, 'Món ăn phụ', 7.5, 1),
(5, 'Phô mai thêm', 12.25, 2);

INSERT INTO `user` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'john.doe@example.com', 'hashed_password_1'),
(2, 'Jane Smith', 'jane.smith@example.com', 'hashed_password_2'),
(3, 'Michael Johnson', 'michael.johnson@example.com', 'hashed_password_3'),
(4, 'Emily Brown', 'emily.brown@example.com', 'hashed_password_4'),
(5, 'Robert Lee', 'robert.lee@example.com', 'hashed_password_5'),
(6, 'David Williams', 'david.williams@example.com', 'hashed_password_6'),
(7, 'Sarah Davis', 'sarah.davis@example.com', 'hashed_password_7'),
(8, 'Daniel Martinez', 'daniel.martinez@example.com', 'hashed_password_8'),
(9, 'Jennifer Taylor', 'jennifer.taylor@example.com', 'hashed_password_9'),
(10, 'Christopher Anderson', 'christopher.anderson@example.com', 'hashed_password_10'),
(11, 'Lisa Thomas', 'lisa.thomas@example.com', 'hashed_password_11'),
(12, 'Matthew Jackson', 'matthew.jackson@example.com', 'hashed_password_12'),
(13, 'Elizabeth White', 'elizabeth.white@example.com', 'hashed_password_13'),
(14, 'Kevin Harris', 'kevin.harris@example.com', 'hashed_password_14'),
(15, 'Jessica Wilson', 'jessica.wilson@example.com', 'hashed_password_15'),
(16, 'William Martin', 'william.martin@example.com', 'hashed_password_16'),
(17, 'Megan Garcia', 'megan.garcia@example.com', 'hashed_password_17'),
(18, 'Richard Rodriguez', 'richard.rodriguez@example.com', 'hashed_password_18'),
(19, 'Amanda Martinez', 'amanda.martinez@example.com', 'hashed_password_19'),
(20, 'Thomas Hernandez', 'thomas.hernandez@example.com', 'hashed_password_20');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;