-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: student_management
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advisor`
--

DROP TABLE IF EXISTS `advisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advisor` (
  `adv_id` int(11) NOT NULL,
  `adv_name` varchar(50) NOT NULL,
  `adv_email` varchar(100) NOT NULL,
  `adv_contactno` varchar(10) NOT NULL,
  `adv_address` varchar(200) NOT NULL,
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisor`
--

LOCK TABLES `advisor` WRITE;
/*!40000 ALTER TABLE `advisor` DISABLE KEYS */;
INSERT INTO `advisor` VALUES (1,'rohan','rohan@lewisu.edu','2147483647','\"500 W chicago'),(2,'jon','jon@lewisu.edu','2147483647','\"121 E romeoville'),(3,'doe','doe@lewisu.edu','2147483647','\"1911 SW aroura');
/*!40000 ALTER TABLE `advisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_catalog`
--

DROP TABLE IF EXISTS `course_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_catalog` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `course_day` varchar(100) NOT NULL,
  `adv_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `Advisor_Course_Catalog` (`adv_id`),
  CONSTRAINT `Advisor_Course_Catalog` FOREIGN KEY (`adv_id`) REFERENCES `advisor` (`adv_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_catalog`
--

LOCK TABLES `course_catalog` WRITE;
/*!40000 ALTER TABLE `course_catalog` DISABLE KEYS */;
INSERT INTO `course_catalog` VALUES (1,'database systems','Tuesday',1),(2,'algorithms and data structures','Wednesday',3),(3,'data mining','Thursday',2);
/*!40000 ALTER TABLE `course_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrolls`
--

DROP TABLE IF EXISTS `enrolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrolls` (
  `enroll_id` int(11) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`enroll_id`),
  KEY `Course_Catalog_Enrolls` (`course_id`),
  KEY `Enrolls_Student` (`stud_id`),
  CONSTRAINT `Course_Catalog_Enrolls` FOREIGN KEY (`course_id`) REFERENCES `course_catalog` (`course_id`) ON UPDATE CASCADE,
  CONSTRAINT `Enrolls_Student` FOREIGN KEY (`stud_id`) REFERENCES `student` (`stud_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrolls`
--

LOCK TABLES `enrolls` WRITE;
/*!40000 ALTER TABLE `enrolls` DISABLE KEYS */;
INSERT INTO `enrolls` VALUES (0,2,3),(2,1,2),(3,3,1);
/*!40000 ALTER TABLE `enrolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homework` (
  `hw_id` int(11) NOT NULL,
  `teach_id` int(11) NOT NULL,
  `hw_name` varchar(100) NOT NULL,
  `hw_file` varchar(200) NOT NULL,
  `hw_grade` varchar(1) NOT NULL,
  `stud_id` int(11) NOT NULL,
  PRIMARY KEY (`hw_id`),
  KEY `hw_name_index` (`hw_name`),
  KEY `Homework_Student` (`stud_id`),
  KEY `Teach_Homework` (`teach_id`),
  CONSTRAINT `Homework_Student` FOREIGN KEY (`stud_id`) REFERENCES `student` (`stud_id`) ON UPDATE CASCADE,
  CONSTRAINT `Teach_Homework` FOREIGN KEY (`teach_id`) REFERENCES `teach` (`teach_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (1,1,'First Home Work','homework/hw1.pdf','A',1),(2,2,'First Home Work','homework/hw2.pdf','B',2),(3,3,'First Home Work','homework/hw3.pdf','A',3),(4,2,'Second Homework','homework/hw4.pdf','A',1),(5,3,'Second Homework','homework/hw5.pdf','A',2),(6,1,'Second Homework','homework/hw6.pdf','A',3),(98,1,'Third Assignment','hw/file3.pdf','',99),(99,1,'Third Assignment','hw/file3.pdf','A',99);
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `number_of_student_enroll_course`
--

DROP TABLE IF EXISTS `number_of_student_enroll_course`;
/*!50001 DROP VIEW IF EXISTS `number_of_student_enroll_course`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `number_of_student_enroll_course` (
  `count(stud_id)` tinyint NOT NULL,
  `course_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `number_of_students_grade_breakdown`
--

DROP TABLE IF EXISTS `number_of_students_grade_breakdown`;
/*!50001 DROP VIEW IF EXISTS `number_of_students_grade_breakdown`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `number_of_students_grade_breakdown` (
  `count(stud_id)` tinyint NOT NULL,
  `hw_grade` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `prof_id` int(11) NOT NULL,
  `prof_name` varchar(100) NOT NULL,
  `prof_designation` varchar(100) NOT NULL,
  `prof_address` varchar(200) NOT NULL,
  `prof_contactno` varchar(10) NOT NULL,
  `prof_email` varchar(100) NOT NULL,
  PRIMARY KEY (`prof_id`),
  KEY `prof_name_index` (`prof_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,'matthew clavelli','professor','101 W schaumburg, chicago, illinois\n','2147483647','matthewjclavelli@lewisu.edu\n'),(2,'young june kim ','asst professor','156 W Mitchell, bloomington, illinois\n','2147483647','kimyo@lewisu.edu\n'),(3,'kelly','professor','1991 SW , springfield, illions\n','2147483647','kelly@lewisu.edu\n'),(6,'deokgun park','preofessor','121 New York, New Jersey','2147483647','deokgun@gmail.com'),(23,'Prasad Murthy','professor','849 w mitchell, melissa, texas','1234567891','prasad@gmail.com');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `professor_bckp` AFTER INSERT ON `professor` FOR EACH ROW insert into professor_bckp(prof_address, prof_contactno, prof_designation, prof_email, prof_id, prof_name) values(NEW.prof_address, NEW.prof_contactno, NEW.prof_designation, NEW.prof_email, NEW.prof_id, NEW.prof_name) */;;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `professor_desig_update` AFTER UPDATE ON `professor` FOR EACH ROW update professor_bckp set prof_designation = NEW.prof_designation where professor_bckp.prof_id = NEW.prof_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `professor_bckp`
--

DROP TABLE IF EXISTS `professor_bckp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor_bckp` (
  `prof_id` int(11) NOT NULL,
  `prof_name` varchar(100) NOT NULL,
  `prof_designation` varchar(100) NOT NULL,
  `prof_address` varchar(200) NOT NULL,
  `prof_contactno` varchar(10) NOT NULL,
  `prof_email` varchar(100) NOT NULL,
  PRIMARY KEY (`prof_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor_bckp`
--

LOCK TABLES `professor_bckp` WRITE;
/*!40000 ALTER TABLE `professor_bckp` DISABLE KEYS */;
INSERT INTO `professor_bckp` VALUES (23,'Prasad Murthy','professor','849 w mitchell, melissa, texas','1234567891','prasad@gmail.com');
/*!40000 ALTER TABLE `professor_bckp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `stud_id` int(11) NOT NULL,
  `stud_name` varchar(100) NOT NULL,
  `stud_email` varchar(100) NOT NULL,
  `stud_address` varchar(100) NOT NULL,
  `stud_contactno` varchar(10) NOT NULL,
  PRIMARY KEY (`stud_id`),
  KEY `stud_name_index` (`stud_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'sai','sai@lewisu.edu','500 E  Chicago illinois','6822345505'),(2,'kumar','kumar@lewisu.edu','566 S romeoville illinois','6822345506'),(3,'sai kumar','saikumar@lewisu.edu','121 SW romeoville illinois','6822345507'),(4,'david smith','davidsm@gmail.com','120 melissa, texas','4545454545'),(12,'Nara Reddy','malla@gmail.com','Nallakunta, hyderabad','6822345508'),(34,'Praveen Mohan','praveen@gmail.com','tg, india','6822345509'),(35,'Mahesh Mohan','praveen@gmail.com','tg, india','6822345510'),(89,'Malla Reddy','malla@gmail.com','Nallakunta, hyderabad','6822345501'),(99,'Smith','vishal@vishal.com','9-9-135, yellambazar, warangal','6822345511');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_bckp` AFTER INSERT ON `student` FOR EACH ROW insert into student_bckp(stud_address, stud_contactno, stud_email, stud_id, stud_name) VALUES(NEW.stud_address, NEW.stud_contactno, NEW.stud_email, NEW.stud_id, NEW.stud_name) */;;
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
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_name_update` AFTER UPDATE ON `student` FOR EACH ROW update student_bckp set stud_name = NEW.stud_name where stud_id = NEW.stud_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_bckp`
--

DROP TABLE IF EXISTS `student_bckp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_bckp` (
  `stud_id` int(11) NOT NULL,
  `stud_name` varchar(100) NOT NULL,
  `stud_email` varchar(100) NOT NULL,
  `stud_address` varchar(100) NOT NULL,
  `stud_contactno` varchar(10) NOT NULL,
  PRIMARY KEY (`stud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_bckp`
--

LOCK TABLES `student_bckp` WRITE;
/*!40000 ALTER TABLE `student_bckp` DISABLE KEYS */;
INSERT INTO `student_bckp` VALUES (4,'david smith','davidsm@gmail.com','120 melissa, texas','4545454545'),(12,'Nara Reddy','malla@gmail.com','Nallakunta, hyderabad','6822345501'),(34,'Praveen Mohan','praveen@gmail.com','tg, india','7981584920'),(35,'Mahesh Mohan','praveen@gmail.com','tg, india','7981584920'),(89,'Malla Reddy','malla@gmail.com','Nallakunta, hyderabad','6822345501'),(99,'Smith','vishal@vishal.com','9-9-135, yellambazar, warangal','1234567891');
/*!40000 ALTER TABLE `student_bckp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teach`
--

DROP TABLE IF EXISTS `teach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teach` (
  `teach_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `prof_id` int(11) NOT NULL,
  `adv_id` int(11) NOT NULL,
  PRIMARY KEY (`teach_id`),
  KEY `Teach_Advisor` (`adv_id`),
  KEY `Teach_Course_Catalog` (`course_id`),
  KEY `Teach_Professor` (`prof_id`),
  CONSTRAINT `Teach_Advisor` FOREIGN KEY (`adv_id`) REFERENCES `advisor` (`adv_id`) ON UPDATE CASCADE,
  CONSTRAINT `Teach_Course_Catalog` FOREIGN KEY (`course_id`) REFERENCES `course_catalog` (`course_id`) ON UPDATE CASCADE,
  CONSTRAINT `Teach_Professor` FOREIGN KEY (`prof_id`) REFERENCES `professor` (`prof_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teach`
--

LOCK TABLES `teach` WRITE;
/*!40000 ALTER TABLE `teach` DISABLE KEYS */;
INSERT INTO `teach` VALUES (0,2,3,3),(1,2,1,3),(2,3,2,2),(3,1,3,1),(12,2,6,1),(16,1,1,1),(34,2,1,1),(67,1,1,1),(75,2,6,2),(76,2,6,2);
/*!40000 ALTER TABLE `teach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `number_of_student_enroll_course`
--

/*!50001 DROP TABLE IF EXISTS `number_of_student_enroll_course`*/;
/*!50001 DROP VIEW IF EXISTS `number_of_student_enroll_course`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_of_student_enroll_course` AS select count(`enrolls`.`stud_id`) AS `count(stud_id)`,`enrolls`.`course_id` AS `course_id` from `enrolls` group by `enrolls`.`course_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `number_of_students_grade_breakdown`
--

/*!50001 DROP TABLE IF EXISTS `number_of_students_grade_breakdown`*/;
/*!50001 DROP VIEW IF EXISTS `number_of_students_grade_breakdown`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `number_of_students_grade_breakdown` AS select count(`homework`.`stud_id`) AS `count(stud_id)`,`homework`.`hw_grade` AS `hw_grade` from `homework` group by `homework`.`hw_grade` */;
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

-- Dump completed on 2021-12-17 23:55:27
