Terminal close -- exit!
trib 9.3.0, for macos14.7 (x86_64)
--
-- Host: localhost    Database: db_library
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `logs_book_acc`
--

DROP TABLE IF EXISTS `logs_book_acc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_book_acc` (
  `id_logs_book_acc` int NOT NULL AUTO_INCREMENT,
  `id_book_entry` int NOT NULL,
  `inserted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepted_at` timestamp NULL DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_logs_book_acc`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_book_acc`
--

LOCK TABLES `logs_book_acc` WRITE;
/*!40000 ALTER TABLE `logs_book_acc` DISABLE KEYS */;
INSERT INTO `logs_book_acc` VALUES (1,1,'2024-11-06 11:01:59','2024-11-09 11:02:27',NULL),(2,2,'2024-11-06 11:41:03','2024-11-08 11:43:34',NULL),(4,4,'2024-11-06 11:50:36',NULL,'2024-11-11 11:50:56'),(5,5,'2024-11-06 12:03:15','2024-11-06 12:03:21',NULL);
/*!40000 ALTER TABLE `logs_book_acc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_books`
--

DROP TABLE IF EXISTS `logs_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_books` (
  `id_logs_books` int NOT NULL AUTO_INCREMENT,
  `source_id` int DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `column_affected` varchar(60) DEFAULT NULL,
  `data_changes` json DEFAULT NULL,
  `date_affected` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_logs_books`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_books`
--

LOCK TABLES `logs_books` WRITE;
/*!40000 ALTER TABLE `logs_books` DISABLE KEYS */;
INSERT INTO `logs_books` VALUES (1,10,'UPDATEX','tb_books','{\"genre\": null, \"title\": \"Harry Potter : The Mystery of Azkaban II\", \"author_id\": null, \"publication_year\": null}','2024-10-08 07:57:51'),(2,1,'UPDATE','tb_books','{\"genre\": \"Dystopian\", \"title\": \"1984 Years\", \"author_id\": 1, \"publication_year\": 1949}','2024-10-08 07:58:42'),(3,NULL,'INSERT','tb_books',NULL,NULL),(4,4,'TESTX','tb_books',NULL,NULL),(6,12,'UPDATE','tb_books','{\"genre\": \"Software Engineering\", \"title\": \"Clean Code\", \"author_id\": 1, \"publication_year\": 2008}','2025-09-22 06:24:21'),(7,12,'UPDATE','tb_books','{\"genre\": \"Software Engineering (Updated)\", \"title\": \"Clean Code (2nd Edition)\", \"author_id\": 1, \"publication_year\": 2021}','2025-09-22 06:24:59'),(8,15,'UPDATE','tb_books','{\"genre\": \"Software Engineering\", \"title\": \"Domain-Driven Design\", \"author_id\": 2, \"publication_year\": 2004}','2025-09-22 06:36:12'),(9,15,'UPDATE','tb_books','{\"genre\": \"Software Engineering\", \"title\": \"Domain-Driven Design\", \"author_id\": 2, \"publication_year\": 2004}','2025-09-22 06:36:28'),(11,15,'UPDATE','tb_books','{\"genre\": \"Software Engineering\", \"title\": \"Domain-Driven Design Updated\", \"author_id\": 2, \"publication_year\": 2004}','2025-09-22 06:37:54');
/*!40000 ALTER TABLE `logs_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_borrowed_books`
--

DROP TABLE IF EXISTS `logs_borrowed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_borrowed_books` (
  `id_logs_borrowed_books` int NOT NULL AUTO_INCREMENT,
  `borrow_id` int NOT NULL,
  `status_trigger` enum('UPDATE','INSERT','DELETE') DEFAULT NULL,
  `data_changes` json DEFAULT NULL,
  `date_affected` timestamp NOT NULL,
  PRIMARY KEY (`id_logs_borrowed_books`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_borrowed_books`
--

LOCK TABLES `logs_borrowed_books` WRITE;
/*!40000 ALTER TABLE `logs_borrowed_books` DISABLE KEYS */;
INSERT INTO `logs_borrowed_books` VALUES (1,17,'INSERT',NULL,'2024-11-06 09:22:38'),(2,17,'UPDATE','{\"book_id\": 5, \"borrow_id\": 17, \"borrow_date\": \"2024-11-06\", \"borrower_id\": 2, \"return_date\": null}','2024-11-06 09:27:19'),(3,20,'INSERT',NULL,'2024-11-06 11:19:11'),(4,20,'UPDATE','{\"book_id\": 5, \"borrow_id\": 20, \"borrow_date\": \"2024-11-04\", \"borrower_id\": 1, \"return_date\": null}','2024-11-06 11:20:25'),(5,20,'UPDATE','{\"book_id\": 5, \"borrow_id\": 20, \"borrow_date\": \"2024-11-04\", \"borrower_id\": 1, \"return_date\": \"2024-11-13\"}','2024-11-06 11:21:01');
/*!40000 ALTER TABLE `logs_borrowed_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_authors`
--

DROP TABLE IF EXISTS `tb_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `tb_authors_last_name_index` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Store the master data for The authors of books';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_authors`
--

LOCK TABLES `tb_authors` WRITE;
/*!40000 ALTER TABLE `tb_authors` DISABLE KEYS */;
INSERT INTO `tb_authors` VALUES (1,'George','Orwell','2024-09-02 04:43:34','2024-09-02 04:43:34',NULL),(2,'J.K.','Rowling','2024-09-02 04:43:34','2024-09-02 04:43:34',NULL),(3,'Mark','Twain','2024-09-02 04:43:34','2024-09-02 04:43:34',NULL),(4,'Mysterio','Seniorita','2024-09-02 05:06:53','2024-09-02 05:06:53',NULL),(5,'Ricardo','Santos','2024-09-09 09:50:25','2024-09-09 09:50:25',NULL);
/*!40000 ALTER TABLE `tb_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_books`
--

DROP TABLE IF EXISTS `tb_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author_id` int DEFAULT NULL,
  `publication_year` int DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `author_id` (`author_id`),
  KEY `tb_books_publication_year_index` (`publication_year`),
  CONSTRAINT `tb_books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `tb_authors` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tables master to list the books';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_books`
--

LOCK TABLES `tb_books` WRITE;
/*!40000 ALTER TABLE `tb_books` DISABLE KEYS */;
INSERT INTO `tb_books` VALUES (1,'1984 Years Old',1,1949,'Dystopian','2024-09-02 04:45:04','2024-09-02 04:45:04',NULL),(2,'Animal Farm',1,1945,'Political Satire','2024-09-02 04:45:04','2024-09-02 04:45:04',NULL),(3,'Harry Potter and the Sorcerer\'s Stone',2,1997,'Fantasy','2024-09-02 04:45:04','2024-09-02 04:45:04',NULL),(4,'Adventures of Huckleberry Finn Update',3,1884,'Adventure','2024-09-02 04:45:04','2024-09-02 04:45:04',NULL),(5,'The Adventure of Batman and Robin',NULL,2024,'Thriller','2024-09-02 05:05:58','2024-09-02 05:05:58',NULL),(8,'Batman: The Dark Side II',NULL,NULL,NULL,'2024-09-09 09:50:06','2024-09-09 09:50:06',NULL),(9,'Romeo and Juliet',5,NULL,NULL,'2024-09-09 09:50:06','2024-09-09 09:50:06',NULL),(10,'Harry Potter : The Mystery of Azkaban',NULL,NULL,NULL,'2024-09-09 09:54:47','2024-09-09 09:54:47',NULL),(11,'Test insert book',2,2000,'fiction','2024-11-06 12:03:21','2024-11-06 12:03:21',NULL),(12,'Clean Code (2nd Edition)',1,2021,'Software Engineering (Updated)','2025-09-22 06:24:04','2025-09-22 06:24:59',NULL),(13,'Clean Code',1,2008,'Software Engineering','2025-09-22 06:24:21','2025-09-22 06:24:21',NULL),(14,'Clean Code',1,2008,'Software Engineering','2025-09-22 06:24:59','2025-09-22 06:24:59',NULL),(15,'Domain-Driven Design Updated',2,2004,'Software Engineering','2025-09-22 06:32:49','2025-09-22 06:36:28','2025-09-22 06:37:54');
/*!40000 ALTER TABLE `tb_books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `watch_data_books` BEFORE UPDATE ON `tb_books` FOR EACH ROW INSERT INTO logs_books
        SET source_id = OLD.book_id,
            status = "UPDATE",
            column_affected = "tb_books",
            date_affected = now(),
            data_changes = JSON_OBJECT(
                    "title", OLD.title,
                    "publication_year", OLD.publication_year,
                    "author_id", OLD.author_id,
                    "genre", OLD.genre
                    ) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_books_entry`
--

DROP TABLE IF EXISTS `tb_books_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_books_entry` (
  `id_book_entry` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `author_id` int DEFAULT NULL,
  `publication_year` int DEFAULT NULL,
  `genre` varchar(60) DEFAULT NULL,
  `status` enum('ACCEPTED','REJECTED','NEW') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_book_entry`),
  KEY `tb_books_entry_tb_authors_author_id_fk` (`author_id`),
  CONSTRAINT `tb_books_entry_tb_authors_author_id_fk` FOREIGN KEY (`author_id`) REFERENCES `tb_authors` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_books_entry`
--

LOCK TABLES `tb_books_entry` WRITE;
/*!40000 ALTER TABLE `tb_books_entry` DISABLE KEYS */;
INSERT INTO `tb_books_entry` VALUES (1,'test',1,2022,'romance','ACCEPTED','2024-11-06 11:01:59','2024-11-06 11:01:59',NULL),(2,'manbd',2,2023,'romance','ACCEPTED','2024-11-06 11:41:03','2024-11-06 11:41:03',NULL),(3,'bookreject',2,1980,'fiction','NEW','2024-11-06 11:49:08','2024-11-06 11:49:08',NULL),(4,'adsad',2,1980,'dsada','REJECTED','2024-11-06 11:50:36','2024-11-06 11:50:36',NULL),(5,'Test insert book',2,2000,'fiction','ACCEPTED','2024-11-06 12:03:15','2024-11-06 12:03:15',NULL);
/*!40000 ALTER TABLE `tb_books_entry` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `watch_book_new` AFTER INSERT ON `tb_books_entry` FOR EACH ROW INSERT INTO logs_book_acc SET id_book_entry = NEW.id_book_entry, inserted_at = now() */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `watch_book_acc` AFTER UPDATE ON `tb_books_entry` FOR EACH ROW IF OLD.status = 'NEW' AND new.status='ACCEPTED' THEN
        UPDATE logs_book_acc set accepted_at = now() where id_book_entry = OLD.id_book_entry;
    ELSEIF OLD.status = 'NEW' AND new.status='REJECTED' THEN
        UPDATE logs_book_acc set rejected_at = now() where id_book_entry = OLD.id_book_entry;
    END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `watch_book_acc_rejected` AFTER UPDATE ON `tb_books_entry` FOR EACH ROW IF OLD.status = 'NEW' AND new.status='REJECTED' THEN
        UPDATE logs_book_acc set rejected_at = now() where id_book_entry = OLD.id_book_entry;
    END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_to_tb_books` AFTER UPDATE ON `tb_books_entry` FOR EACH ROW IF NEW.status='ACCEPTED' THEN
            INSERT INTO tb_books(title, author_id, publication_year, genre)
                VALUES (NEW.title, NEW.author_id, NEW.publication_year, NEW.genre);
    END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_borrowed_books`
--

DROP TABLE IF EXISTS `tb_borrowed_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_borrowed_books` (
  `borrow_id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `borrower_id` int DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`borrow_id`),
  KEY `book_id` (`book_id`),
  KEY `borrower_id` (`borrower_id`),
  CONSTRAINT `tb_borrowed_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `tb_books` (`book_id`),
  CONSTRAINT `tb_borrowed_books_ibfk_2` FOREIGN KEY (`borrower_id`) REFERENCES `tb_borrowers` (`borrower_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Transactional tables, support to historical record of books transaction (borrow the books)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_borrowed_books`
--

LOCK TABLES `tb_borrowed_books` WRITE;
/*!40000 ALTER TABLE `tb_borrowed_books` DISABLE KEYS */;
INSERT INTO `tb_borrowed_books` VALUES (1,1,1,'2024-09-01','2024-09-15','2024-09-02 04:48:05','2024-09-02 04:48:05',NULL),(2,3,1,'2024-09-02','2024-09-10','2024-09-02 04:48:05','2024-09-02 04:48:05',NULL),(3,9,2,'2024-09-10','2024-09-10','2024-09-09 09:51:49','2024-09-09 09:51:49',NULL),(4,8,2,'2024-09-06','2024-09-12','2024-09-09 09:51:49','2024-09-09 09:51:49',NULL),(5,10,2,'2024-09-08',NULL,'2024-09-09 09:55:11','2024-09-09 09:55:11',NULL),(6,9,3,'2024-09-10',NULL,'2024-09-09 11:07:40','2024-09-09 11:07:40',NULL),(7,9,2,'2024-09-11',NULL,'2024-09-10 06:59:05','2024-09-10 06:59:05',NULL),(8,9,2,'2024-09-04','2024-09-04','2024-09-10 07:01:03','2024-09-10 07:01:03',NULL),(9,3,1,'2024-09-05','2024-10-01','2024-09-10 07:01:03','2024-09-10 07:01:03',NULL),(13,5,3,'2024-09-09','2024-10-01','2024-09-10 07:21:46','2024-09-10 07:21:46',NULL),(14,1,1,'2024-10-16',NULL,'2024-10-16 07:25:29','2024-10-16 07:25:29',NULL),(15,1,1,'2024-10-16',NULL,'2024-10-16 08:03:19','2024-10-16 08:03:19',NULL),(16,1,1,'2024-10-16',NULL,'2024-10-16 10:44:11','2024-10-16 10:44:11',NULL),(17,5,2,'2024-11-06','2024-11-14','2024-11-06 09:22:38','2024-11-06 09:22:38',NULL);
/*!40000 ALTER TABLE `tb_borrowed_books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_tb_borrowed_books` AFTER INSERT ON `tb_borrowed_books` FOR EACH ROW INSERT INTO logs_borrowed_books (borrow_id, status_trigger, date_affected)
    VALUES (NEW.borrow_id, 'INSERT', NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_tb_borrowed_books` BEFORE UPDATE ON `tb_borrowed_books` FOR EACH ROW INSERT INTO logs_borrowed_books
        SET borrow_id = OLD.borrow_id,
            status_trigger = 'UPDATE',
            date_affected = now(),
            data_changes = JSON_OBJECT('borrow_id', OLD.borrow_id,
                                       'book_id', OLD.book_id,
                                       'borrower_id', OLD.borrower_id,
                                       'borrow_date', OLD.borrow_date,
                                       'return_date', OLD.return_date
                           ) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_tb_borrowed_books` BEFORE DELETE ON `tb_borrowed_books` FOR EACH ROW INSERT INTO logs_borrowed_books
        SET borrow_id = OLD.borrow_id,
            status_trigger = 'UPDATE',
            date_affected = now(),
            data_changes = JSON_OBJECT('borrow_id', OLD.borrow_id,
                                       'book_id', OLD.book_id,
                                       'borrower_id', OLD.borrower_id,
                                       'borrow_date', OLD.borrow_date,
                                       'return_date', OLD.return_date
                           ) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_borrowers`
--

DROP TABLE IF EXISTS `tb_borrowers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_borrowers` (
  `borrower_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`borrower_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='List of the customers, able to borrow the books';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_borrowers`
--

LOCK TABLES `tb_borrowers` WRITE;
/*!40000 ALTER TABLE `tb_borrowers` DISABLE KEYS */;
INSERT INTO `tb_borrowers` VALUES (1,'Alice','Smith','alice.smith@example.com','2024-09-02 04:46:01','2024-09-02 04:46:01',NULL),(2,'Bobs','Johnson','bob.johnson@example.com','2024-09-02 04:46:01','2024-09-02 04:46:01',NULL),(3,'John','Don','john.doe@example.com','2024-09-09 11:07:26','2024-09-09 11:07:26',NULL);
/*!40000 ALTER TABLE `tb_borrowers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_users` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `users_pk` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'john_doe','$2b$12$6bzZ3QZjTsMQ2xYmFijOKeGmu5JjeV5sb6LHkFOIOWObWL8dQy70S','2024-05-28 23:35:50','2024-05-28 23:35:50',NULL),(2,'jean_doe','$2b$12$Ywex3fWuHj0H90BztX7DieUvd6VHYHtu5LD8hxabL35f5WmSq3zp.','2024-05-28 23:38:50','2024-05-28 23:38:50',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_author_popular_books_borrowed`
--

DROP TABLE IF EXISTS `vw_author_popular_books_borrowed`;
/*!50001 DROP VIEW IF EXISTS `vw_author_popular_books_borrowed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_author_popular_books_borrowed` AS SELECT 
 1 AS `total_authors_book_borrowed`,
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_book_borrowed_report`
--

DROP TABLE IF EXISTS `vw_book_borrowed_report`;
/*!50001 DROP VIEW IF EXISTS `vw_book_borrowed_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_book_borrowed_report` AS SELECT 
 1 AS `borrow_id`,
 1 AS `title`,
 1 AS `publication_year`,
 1 AS `borrow_date`,
 1 AS `return_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_not_return_books`
--

DROP TABLE IF EXISTS `vw_customer_not_return_books`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_not_return_books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_not_return_books` AS SELECT 
 1 AS `borrower_id`,
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_customer_rank`
--

DROP TABLE IF EXISTS `vw_customer_rank`;
/*!50001 DROP VIEW IF EXISTS `vw_customer_rank`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_customer_rank` AS SELECT 
 1 AS `frequent_return`,
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_duration_bookentry`
--

DROP TABLE IF EXISTS `vw_duration_bookentry`;
/*!50001 DROP VIEW IF EXISTS `vw_duration_bookentry`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_duration_bookentry` AS SELECT 
 1 AS `book_entry_id`,
 1 AS `book_titles`,
 1 AS `genre`,
 1 AS `publication_year`,
 1 AS `acc_duration`,
 1 AS `rejected_duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_report_of_borrowed_books`
--

DROP TABLE IF EXISTS `vw_report_of_borrowed_books`;
/*!50001 DROP VIEW IF EXISTS `vw_report_of_borrowed_books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_report_of_borrowed_books` AS SELECT 
 1 AS `borrow_id`,
 1 AS `title_of_the_books`,
 1 AS `publication_year`,
 1 AS `author_of_the_books`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `borrow_date`,
 1 AS `return_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_report_statistics_borrowers_rank`
--

DROP TABLE IF EXISTS `vw_report_statistics_borrowers_rank`;
/*!50001 DROP VIEW IF EXISTS `vw_report_statistics_borrowers_rank`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_report_statistics_borrowers_rank` AS SELECT 
 1 AS `frequently_return`,
 1 AS `first_name`,
 1 AS `last_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_resume_transaction_books`
--

DROP TABLE IF EXISTS `vw_resume_transaction_books`;
/*!50001 DROP VIEW IF EXISTS `vw_resume_transaction_books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_resume_transaction_books` AS SELECT 
 1 AS `BUKU_Kembali`,
 1 AS `Tidak_Kembali`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_stats_book_returning`
--

DROP TABLE IF EXISTS `vw_stats_book_returning`;
/*!50001 DROP VIEW IF EXISTS `vw_stats_book_returning`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_stats_book_returning` AS SELECT 
 1 AS `returned`,
 1 AS `no_returned`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_stats_frequent_books`
--

DROP TABLE IF EXISTS `vw_stats_frequent_books`;
/*!50001 DROP VIEW IF EXISTS `vw_stats_frequent_books`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_stats_frequent_books` AS SELECT 
 1 AS `book_id`,
 1 AS `title`,
 1 AS `author_id`,
 1 AS `publication_year`,
 1 AS `genre`,
 1 AS `jumlah_pinjam`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_author_popular_books_borrowed`
--

/*!50001 DROP VIEW IF EXISTS `vw_author_popular_books_borrowed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_author_popular_books_borrowed` AS select count(`bb`.`borrow_id`) AS `total_authors_book_borrowed`,`ta`.`first_name` AS `first_name`,`ta`.`last_name` AS `last_name` from ((`tb_borrowed_books` `bb` join `tb_books` `b` on((`bb`.`book_id` = `b`.`book_id`))) join `tb_authors` `ta` on((`b`.`author_id` = `ta`.`author_id`))) where ((`bb`.`borrow_date` is not null) and (`bb`.`deleted_at` is null)) group by `ta`.`author_id` order by `total_authors_book_borrowed` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_book_borrowed_report`
--

/*!50001 DROP VIEW IF EXISTS `vw_book_borrowed_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_book_borrowed_report` AS select `bb`.`borrow_id` AS `borrow_id`,`b`.`title` AS `title`,`b`.`publication_year` AS `publication_year`,`bb`.`borrow_date` AS `borrow_date`,`bb`.`return_date` AS `return_date` from ((`tb_borrowed_books` `bb` join `tb_books` `b` on((`bb`.`book_id` = `b`.`book_id`))) join `tb_borrowers` `br` on((`bb`.`borrower_id` = `br`.`borrower_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_not_return_books`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_not_return_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_not_return_books` AS select distinct `bb`.`borrower_id` AS `borrower_id`,`br`.`first_name` AS `first_name`,`br`.`last_name` AS `last_name` from (`tb_borrowers` `br` join `tb_borrowed_books` `bb` on((`br`.`borrower_id` = `bb`.`borrower_id`))) where (`bb`.`return_date` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_customer_rank`
--

/*!50001 DROP VIEW IF EXISTS `vw_customer_rank`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_customer_rank` AS select count(`bb`.`borrower_id`) AS `frequent_return`,`br`.`first_name` AS `first_name`,`br`.`last_name` AS `last_name` from (`tb_borrowers` `br` join `tb_borrowed_books` `bb` on((`br`.`borrower_id` = `bb`.`borrower_id`))) where (`bb`.`return_date` is not null) group by `bb`.`borrower_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_duration_bookentry`
--

/*!50001 DROP VIEW IF EXISTS `vw_duration_bookentry`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_duration_bookentry` AS select `be`.`id_book_entry` AS `book_entry_id`,`be`.`title` AS `book_titles`,`be`.`genre` AS `genre`,`be`.`publication_year` AS `publication_year`,(to_days(`bacc`.`accepted_at`) - to_days(`bacc`.`inserted_at`)) AS `acc_duration`,(to_days(`bacc`.`rejected_at`) - to_days(`bacc`.`inserted_at`)) AS `rejected_duration` from (`tb_books_entry` `be` join `logs_book_acc` `bacc` on((`be`.`id_book_entry` = `bacc`.`id_book_entry`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report_of_borrowed_books`
--

/*!50001 DROP VIEW IF EXISTS `vw_report_of_borrowed_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report_of_borrowed_books` AS select `bb`.`borrow_id` AS `borrow_id`,`b`.`title` AS `title_of_the_books`,`b`.`publication_year` AS `publication_year`,concat(`ta`.`first_name`,' ',`ta`.`last_name`) AS `author_of_the_books`,`br`.`first_name` AS `first_name`,`br`.`last_name` AS `last_name`,`bb`.`borrow_date` AS `borrow_date`,`bb`.`return_date` AS `return_date` from (((`tb_borrowed_books` `bb` join `tb_borrowers` `br` on((`bb`.`borrower_id` = `br`.`borrower_id`))) join `tb_books` `b` on((`bb`.`book_id` = `b`.`book_id`))) join `tb_authors` `ta` on((`b`.`author_id` = `ta`.`author_id`))) where (`bb`.`deleted_at` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_report_statistics_borrowers_rank`
--

/*!50001 DROP VIEW IF EXISTS `vw_report_statistics_borrowers_rank`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_report_statistics_borrowers_rank` AS select count(`bb`.`borrower_id`) AS `frequently_return`,`br`.`first_name` AS `first_name`,`br`.`last_name` AS `last_name` from (`tb_borrowers` `br` join `tb_borrowed_books` `bb` on((`br`.`borrower_id` = `bb`.`borrower_id`))) where ((`bb`.`return_date` is not null) and (`bb`.`deleted_at` is null)) group by `br`.`borrower_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_resume_transaction_books`
--

/*!50001 DROP VIEW IF EXISTS `vw_resume_transaction_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_resume_transaction_books` AS select (select count(0) from `tb_borrowed_books` where (`tb_borrowed_books`.`return_date` is not null)) AS `BUKU_Kembali`,(select count(0) from `tb_borrowed_books` where (`tb_borrowed_books`.`return_date` is null)) AS `Tidak_Kembali` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_stats_book_returning`
--

/*!50001 DROP VIEW IF EXISTS `vw_stats_book_returning`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_stats_book_returning` AS select (select count(`br`.`borrow_id`) from `tb_borrowed_books` `br` where (`br`.`return_date` is not null)) AS `returned`,(select count(`br`.`borrow_id`) from `tb_borrowed_books` `br` where (`br`.`return_date` is null)) AS `no_returned` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_stats_frequent_books`
--

/*!50001 DROP VIEW IF EXISTS `vw_stats_frequent_books`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_stats_frequent_books` AS select `tbo`.`book_id` AS `book_id`,`tbo`.`title` AS `title`,`tbo`.`author_id` AS `author_id`,`tbo`.`publication_year` AS `publication_year`,`tbo`.`genre` AS `genre`,count(`tbo`.`book_id`) AS `jumlah_pinjam` from (`tb_borrowed_books` `tbb` join `tb_books` `tbo` on((`tbb`.`book_id` = `tbo`.`book_id`))) group by `tbo`.`book_id` order by `jumlah_pinjam` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-22 14:42:36
