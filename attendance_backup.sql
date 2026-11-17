-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: attendance_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `attendance_logs`
--

DROP TABLE IF EXISTS `attendance_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `session_id` int DEFAULT NULL,
  `student_id` int NOT NULL,
  `session_date` date NOT NULL,
  `check_in_time` time NOT NULL,
  `status` enum('present','late','absent','leave') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `attendance_logs_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_logs`
--

LOCK TABLES `attendance_logs` WRITE;
/*!40000 ALTER TABLE `attendance_logs` DISABLE KEYS */;
INSERT INTO `attendance_logs` VALUES (7,9,NULL,13,'2026-09-01','09:00:00','present'),(8,9,NULL,14,'2026-09-01','09:20:00','late'),(9,9,NULL,15,'2026-09-01','00:00:00','absent'),(10,9,NULL,13,'2026-09-08','09:01:00','present'),(11,9,NULL,14,'2026-09-08','08:55:00','present'),(12,9,NULL,15,'2026-09-08','09:15:00','late'),(13,9,NULL,15,'2026-11-10','13:58:22','present'),(27,5,NULL,17,'2026-11-10','19:02:33','present'),(28,5,4,17,'2026-11-11','13:12:21','present'),(29,5,4,7,'2026-11-11','13:12:21','present'),(30,5,4,15,'2026-11-11','13:12:21','present'),(31,5,4,14,'2026-11-11','13:12:21','present'),(32,5,5,17,'2026-11-11','13:17:38','late'),(33,5,5,7,'2026-11-11','13:17:38','present'),(34,5,5,15,'2026-11-11','13:17:38','late'),(35,5,5,14,'2026-11-11','13:17:38','absent'),(36,5,8,17,'2026-11-11','13:20:29','late'),(37,5,8,7,'2026-11-11','13:20:29','present'),(38,5,8,15,'2026-11-11','13:20:29','late'),(39,5,8,14,'2026-11-11','13:20:29','absent');
/*!40000 ALTER TABLE `attendance_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_sessions`
--

DROP TABLE IF EXISTS `attendance_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `session_date` date NOT NULL,
  `session_name` varchar(100) DEFAULT 'คาบเรียนปกติ',
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `attendance_sessions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_sessions`
--

LOCK TABLES `attendance_sessions` WRITE;
/*!40000 ALTER TABLE `attendance_sessions` DISABLE KEYS */;
INSERT INTO `attendance_sessions` VALUES (1,9,'2026-11-10','รอบเช้า',0,'2026-11-10 12:09:10'),(2,5,'2026-11-10','รอบเช้า',0,'2026-11-10 12:11:17'),(3,5,'2026-11-10','รอบเช้า',0,'2026-11-10 12:16:40'),(4,5,'2026-11-10','รอบเช้า',0,'2026-11-10 12:28:00'),(5,5,'2026-11-11','รอบเช้า',0,'2026-11-11 06:17:28'),(6,5,'2026-11-11','รอบเช้า',0,'2026-11-11 06:17:59'),(7,5,'2026-11-11','รอบเช้า',0,'2026-11-11 06:18:47'),(8,5,'2026-11-11','รอบบ่าย',0,'2026-11-11 06:19:07'),(9,5,'2026-11-11','รอบเช้า',0,'2026-11-11 06:20:35'),(10,5,'2026-11-11','รอบดึก',0,'2026-11-11 06:21:19'),(11,5,'2026-11-11','รอบบ่าย',0,'2026-11-11 06:22:58'),(12,9,'2026-11-11','รอบเช้า',0,'2026-11-11 06:23:12'),(27,9,'2026-11-12','รอบเช้า',0,'2026-11-12 06:27:48');
/*!40000 ALTER TABLE `attendance_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `face_embeddings`
--

DROP TABLE IF EXISTS `face_embeddings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `face_embeddings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `embedding_vector` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `face_embeddings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `face_embeddings`
--

LOCK TABLES `face_embeddings` WRITE;
/*!40000 ALTER TABLE `face_embeddings` DISABLE KEYS */;
/*!40000 ALTER TABLE `face_embeddings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_students`
--

DROP TABLE IF EXISTS `subject_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int DEFAULT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `faculty` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `academic_year` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `subject_students_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_students`
--

LOCK TABLES `subject_students` WRITE;
/*!40000 ALTER TABLE `subject_students` DISABLE KEYS */;
INSERT INTO `subject_students` VALUES (46,9,'14',NULL,NULL,NULL,NULL),(53,5,'17',NULL,NULL,NULL,NULL),(54,5,'7',NULL,NULL,NULL,NULL),(55,5,'15',NULL,NULL,NULL,NULL),(56,5,'14',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subject_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `section` varchar(10) NOT NULL,
  `schedule` varchar(100) NOT NULL,
  `room` varchar(100) NOT NULL,
  `join_code` varchar(10) DEFAULT NULL,
  `teacher_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `join_code` (`join_code`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (5,'451234','it123','03','จัน 13.00 - 15.00','509','GNZK',9),(9,'CS301','Machine Learning','01','จันทร์ 09:00 - 12:00','IT-301','DCZS',9),(14,'11','11','11','11','11','EULM',9),(15,'22','22','22','22','22','LHPG',9);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `role` enum('teacher','student') NOT NULL,
  `student_id` varchar(50) DEFAULT NULL,
  `faculty` varchar(255) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `academic_year` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `face_image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `face_encoding` text,
  `profile_image_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'teacher01','123456','ผศ.ดร.สมชาย ใจดี','teacher',NULL,'วิทยาการคอมพิวเตอร์','วิทยาการคอมพิวเตอร์',NULL,NULL,NULL,'2026-11-09 14:36:09',NULL,NULL),(7,'1234','1234','นายคุณากร โพธิ์ใบงาม','student','13','วิทยาลัยวิศวกรรมศาสตร์และเทคโนโลยี',NULL,NULL,'1234@dpu.ac.th','uploaded_faces\\user_7_scaled_764818299_18480918448097438_7560589372646766120_n.jpg','2026-11-09 09:50:10','ENCODED_FACE_DATA',NULL),(8,'12345','1234','ผศ.ดร.สมชาย ใจดี','teacher',NULL,'วิทยาลัยวิศวกรรมศาสตร์และเทคโนโลยี',NULL,NULL,'12345@dpu.ac.th',NULL,'2026-11-09 09:51:01',NULL,NULL),(9,'123','1234','daswd','teacher',NULL,'คณะนิเทศศาสตร์',NULL,NULL,'123@dpu.ac.th',NULL,'2026-11-09 10:07:22',NULL,'http://127.0.0.1:8000/files/profile_9_scaled_กี้2.jpg'),(10,'1235','1234','po','student','1235','International College',NULL,NULL,'1235@dpu.ac.th','uploaded_faces\\user_1235_กี้.png','2026-11-09 12:14:34','ENCODED_FACE_DATA',NULL),(12,'1233','1234','daw','student','1233','วิทยาลัยการพัฒนาและฝึกอบรมด้านการบิน',NULL,NULL,'1233@dpu.ac.th',NULL,'2026-11-09 12:17:08',NULL,'http://127.0.0.1:8000/files/profile_12_scaled_764818299_18480918448097438_7560589372646766120_n.jpg'),(13,'student01','123456','นายสมชาย เรียนดี','student','6501001','วิทยาศาสตร์','วิทยาการคอมพิวเตอร์',NULL,NULL,'uploaded_faces\\user_13_กี้.png','2026-11-09 14:34:38','ENCODED_FACE_DATA',NULL),(14,'student02','123456','นางสาวสมหญิง ตั้งใจ','student','6501002','วิทยาศาสตร์','วิทยาการคอมพิวเตอร์',NULL,NULL,'uploaded_faces\\user_14_scaled_เก้า.jpg','2026-11-09 14:34:38','ENCODED_FACE_DATA',NULL),(15,'student03','123456','นายมานพ รักเรียน','student','6501003','วิทยาศาสตร์','เทคโนโลยีสารสนเทศ',NULL,NULL,'uploaded_faces\\user_15_scaled_กี้.png','2026-11-09 14:34:38','ENCODED_FACE_DATA',NULL),(16,'1','1234','เทส1','teacher','100','วิทยาลัยพยาบาลศาสตร์',NULL,NULL,'1@dpu.ac.th',NULL,'2026-11-10 11:59:04',NULL,NULL),(17,'1002','1234','เทส3','student','1002','คณะบริหารธุรกิจ',NULL,NULL,'1002@dpu.ac.th','uploaded_faces\\user_17_scaled_764818299_18480918448097438_7560589372646766120_n.jpg','2026-11-10 12:00:41','ENCODED_FACE_DATA',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-12 13:34:27
