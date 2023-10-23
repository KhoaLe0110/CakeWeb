-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: cakedb
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `cate_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (2,'Bánh kem cỡ nhỏ',NULL),(3,'Bánh kem hình vuông',NULL),(4,'Bánh kem ít đường',NULL),(5,'Bánh kem cỡ lớn',NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `cake_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_cake_idx` (`cake_id`),
  KEY `fk_user_idx` (`user_id`),
  CONSTRAINT `fk_cake` FOREIGN KEY (`cake_id`) REFERENCES `product` (`cake_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `cake_id` int NOT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `num` int DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `fk_orerdetail_product_idx` (`cake_id`),
  KEY `fk_orderdetail_order_idx` (`order_id`),
  CONSTRAINT `fk_orderdetail_order` FOREIGN KEY (`order_id`) REFERENCES `sale_order` (`order_id`),
  CONSTRAINT `fk_orerdetail_product` FOREIGN KEY (`cake_id`) REFERENCES `product` (`cake_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_tag`
--

DROP TABLE IF EXISTS `prod_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cake_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk2_idx` (`tag_id`) /*!80000 INVISIBLE */,
  KEY `fk1_idx` (`cake_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`cake_id`) REFERENCES `product` (`cake_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_tag`
--

LOCK TABLES `prod_tag` WRITE;
/*!40000 ALTER TABLE `prod_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `cake_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`cake_id`),
  KEY `fk_product_cate_idx` (`category_id`),
  CONSTRAINT `fk_product_cate` FOREIGN KEY (`category_id`) REFERENCES `category` (`cate_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (12,'Bánh kem hình mặt cười ','Bánh kem cỡ nhỏ hình mặt cười',100000,'https://banhkemngonghinh.com/wp-content/uploads/2018/05/18-banh-kem-sinh-nhat-tao-hinh-icon-mat-cuoi.jpg',NULL,NULL,2),(13,'Bánh kem hình quả bóng','Bánh kem cỡ nhỏ hình quả bóng',70000,'https://banhkemcaocap.com/wp-content/uploads/2021/10/banh-kem-sinh-nhat-hinh-qua-bong-trang-xanh-dep-mat-tang-be-trai.jpg',NULL,NULL,2),(14,'Bánh kem hình pokemon','Bánh kem cỡ nhỏ hình pokemon',90000,'https://tinyprettycake.com/wp-content/uploads/2021/05/Banh-kem-bo-pikachu-va-pokemon-picture_wp.png',NULL,NULL,2),(22,'Bánh kem hình quả bóng','Bánh kem hình quả bóng cỡ nhỏ',100000,'https://res.cloudinary.com/dqgwwuamo/image/upload/v1697203524/g0srybkghyqf4cbxtawc.jpg',NULL,NULL,2),(24,'Bánh kem người nhện ','Bánh kem hình người nhện màu đỏ dành cho bé trai',450000,'https://res.cloudinary.com/dqgwwuamo/image/upload/v1697435788/iafetpi4ggvp8eqrggcr.jpg',NULL,NULL,2),(25,'Bánh kem naruto','Bánh kem hình naruto cỡ lớn cho các bé trai',400000,'https://res.cloudinary.com/dqgwwuamo/image/upload/v1697435935/rvxxridbijhjdcnmv8bh.jpg',NULL,NULL,5),(26,'Bánh kem sinh nhật hình vuông','Bánh kem hình vuông góc cạnh thích hợp cho người thích sự thẳng thắn',300000,'https://res.cloudinary.com/dqgwwuamo/image/upload/v1697782619/elxjbe3pms4rdn8yntsj.jpg',NULL,NULL,3),(27,'Bánh kem ít ngọt cho người tiểu đường','Bánh kem với hàm lượng đường vừa đủ dành cho người tiểu đường',250000,'https://res.cloudinary.com/dqgwwuamo/image/upload/v1697783544/yt1dndrti6p5fph031ej.jpg',NULL,NULL,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `ammount` decimal(10,0) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user_idx` (`user_id`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `user_role` varchar(45) DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Khoa','Lê','khoaln@gmail.com','0789066173','khoaln','$2a$10$TaB.dca3XpLONjUSLRVkturEpwUOfBiSyBpoBEv0d74pewNesg4KG',NULL,'ROLE_STAFF','https://res.cloudinary.com/dqgwwuamo/image/upload/v1695455945/st6kkb9swulexstdybiu.png'),(4,'Khoa','Le','khoakhung@gmail.com','0789066175','Khoa1','$2a$10$THqKolI0z29Z1bEo113RF.ywuZV3DOfSgCHG9Bg6LxkeZAx6zpUhO',NULL,'ROLE_USER','https://res.cloudinary.com/dqgwwuamo/image/upload/v1696607491/sszuy112woekkxctaq5f.jpg'),(5,'Quỳnh','Đỗ Ngọc Diễm','quynh@gmail.com','0789066113','quynhcute','$2a$10$sn6CI1vAYFET2Mye933r2.IlfDfdX0TCg4znBOB8VO6EuMReKxCA2',NULL,'ROLE_USER','https://res.cloudinary.com/dqgwwuamo/image/upload/v1697109266/n4xmc0bdnuncwyoinx93.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-23 23:47:09
