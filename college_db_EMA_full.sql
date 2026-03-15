-- MySQL dump 10.13  Distrib 8.4.0, for macos13.2 (arm64)
--
-- Host: 127.0.0.1    Database: college_db_EMA
-- ------------------------------------------------------
-- Server version	9.6.0

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
-- Table structure for table `areasOfExpertise`
--

DROP TABLE IF EXISTS `areasOfExpertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areasOfExpertise` (
  `areasOfExpertiseID` int NOT NULL AUTO_INCREMENT,
  `expertise` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`areasOfExpertiseID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areasOfExpertise`
--

LOCK TABLES `areasOfExpertise` WRITE;
/*!40000 ALTER TABLE `areasOfExpertise` DISABLE KEYS */;
INSERT INTO `areasOfExpertise` VALUES (1,'Artificial Intelligence'),(2,'Machine Learning'),(3,'Databases'),(4,'Cybersecurity'),(5,'Applied Mathematics'),(6,'Quantum Physics'),(7,'Organizational Behavior'),(8,'Cognitive Science'),(9,'Genetics'),(10,'Organic Synthesis');
/*!40000 ALTER TABLE `areasOfExpertise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `courseID` int NOT NULL AUTO_INCREMENT,
  `code` int DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `credits` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,10101,'Introduction to programming fundamentals',5,1,'Intro to Programming'),(2,10102,'Data structures and algorithm analysis',5,2,'Data Structures'),(3,10103,'Database design and SQL',5,2,'Database Systems'),(4,10104,'Operating systems concepts',5,3,'Operating Systems'),(5,10105,'Computer network principles',5,3,'Computer Networks'),(6,10201,'Calculus I for science students',5,1,'Calculus I'),(7,10202,'Linear algebra and matrices',5,1,'Linear Algebra'),(8,10203,'Probability and statistics',5,2,'Statistics'),(9,10301,'Classical mechanics',5,1,'Mechanics'),(10,10302,'Electricity and magnetism',5,2,'Electromagnetism'),(11,10401,'Principles of management',5,1,'Management Principles'),(12,10402,'Marketing theory and practice',5,2,'Marketing'),(13,10501,'Introduction to cognitive psychology',5,1,'Cognitive Psychology'),(14,10601,'Cell biology foundations',5,1,'Cell Biology'),(15,10602,'Genetics and inheritance',5,2,'Genetics'),(16,10701,'Organic chemistry basics',5,2,'Organic Chemistry'),(17,10801,'World history overview',5,1,'World History'),(18,10901,'Microeconomic theory',5,1,'Microeconomics'),(19,10902,'Macroeconomic theory',5,2,'Macroeconomics'),(20,11001,'Engineering mathematics',5,1,'Engineering Mathematics');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Computer Science'),(2,'Mathematics'),(3,'Physics'),(4,'Business'),(5,'Psychology'),(6,'Biology'),(7,'Chemistry'),(8,'History'),(9,'Economics'),(10,'Engineering');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollmentID` int NOT NULL AUTO_INCREMENT,
  `status` tinyint DEFAULT NULL,
  `studentID` int NOT NULL,
  `courseID` int NOT NULL,
  `grade` int DEFAULT NULL,
  PRIMARY KEY (`enrollmentID`),
  KEY `fk_enrollment_student1_idx` (`studentID`),
  KEY `fk_enrollment_course1_idx` (`courseID`),
  CONSTRAINT `fk_enrollment_course1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  CONSTRAINT `fk_enrollment_student1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,1,1,1,78),(2,2,1,6,82),(3,1,1,13,75),(4,2,2,2,80),(5,1,2,7,76),(6,1,2,18,84),(7,2,3,3,88),(8,2,3,8,91),(9,2,3,19,85),(10,1,4,1,69),(11,1,4,9,73),(12,0,4,20,71),(13,1,5,4,77),(14,1,5,10,79),(15,2,5,14,81),(16,1,6,5,74),(17,2,6,11,83),(18,1,6,15,80),(19,2,7,6,90),(20,2,7,12,87),(21,2,7,17,89),(22,1,8,2,72),(23,1,8,3,78),(24,2,8,16,74),(25,1,9,7,68),(26,1,9,13,70),(27,0,9,18,75),(28,2,10,8,82),(29,1,10,14,84),(30,2,10,19,86),(31,2,11,9,91),(32,2,11,15,88),(33,2,11,20,90),(34,1,12,1,79),(35,1,12,10,77),(36,2,12,16,81),(37,2,13,4,85),(38,1,13,11,83),(39,2,13,17,82),(40,1,14,5,73),(41,1,14,12,76),(42,1,14,18,78),(43,2,15,2,88),(44,2,15,6,86),(45,1,15,13,84),(46,1,16,3,75),(47,1,16,7,79),(48,2,16,19,80),(49,2,17,8,92),(50,2,17,14,89),(51,2,17,20,93),(52,1,18,9,71),(53,1,18,15,74),(54,2,18,17,76),(55,2,19,10,83),(56,2,19,11,85),(57,1,19,16,82),(58,1,20,12,78),(59,1,20,18,80),(60,2,20,20,79);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `lecturerID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `departmentID` int NOT NULL,
  PRIMARY KEY (`lecturerID`),
  KEY `fk_lecturer_department1_idx` (`departmentID`),
  CONSTRAINT `fk_lecturer_department1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES (1,'Alan','Turner',1),(2,'Brenda','Scott',2),(3,'Charles','Evans',3),(4,'Diana','Baker',4),(5,'Ethan','Adams',5),(6,'Fiona','Nelson',6),(7,'George','Carter',7),(8,'Hannah','Mitchell',8),(9,'Ian','Perez',9),(10,'Julia','Roberts',10),(11,'Kevin','Campbell',1),(12,'Laura','Phillips',2),(13,'Matthew','Parker',3),(14,'Natalie','Edwards',4),(15,'Oscar','Collins',5),(16,'Paula','Stewart',6),(17,'Quentin','Sanchez',7),(18,'Rachel','Morris',8),(19,'Steven','Rogers',9),(20,'Tina','Reed',10);
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_has_areasOfExpertise`
--

DROP TABLE IF EXISTS `lecturer_has_areasOfExpertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer_has_areasOfExpertise` (
  `lecturer_lecturerID` int NOT NULL,
  `areasOfExpertise_areasOfExpertiseID` int NOT NULL,
  PRIMARY KEY (`lecturer_lecturerID`,`areasOfExpertise_areasOfExpertiseID`),
  KEY `fk_lecturer_has_areasOfExpertise_areasOfExpertise1_idx` (`areasOfExpertise_areasOfExpertiseID`),
  KEY `fk_lecturer_has_areasOfExpertise_lecturer1_idx` (`lecturer_lecturerID`),
  CONSTRAINT `fk_lecturer_has_areasOfExpertise_areasOfExpertise1` FOREIGN KEY (`areasOfExpertise_areasOfExpertiseID`) REFERENCES `areasOfExpertise` (`areasOfExpertiseID`),
  CONSTRAINT `fk_lecturer_has_areasOfExpertise_lecturer1` FOREIGN KEY (`lecturer_lecturerID`) REFERENCES `lecturer` (`lecturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_has_areasOfExpertise`
--

LOCK TABLES `lecturer_has_areasOfExpertise` WRITE;
/*!40000 ALTER TABLE `lecturer_has_areasOfExpertise` DISABLE KEYS */;
INSERT INTO `lecturer_has_areasOfExpertise` VALUES (1,1),(10,1),(20,1),(1,2),(5,2),(2,3),(9,3),(11,3),(3,4),(11,4),(2,5),(9,5),(12,5),(19,5),(3,6),(6,6),(13,6),(4,7),(8,7),(14,7),(18,7),(4,8),(5,8),(15,8),(6,9),(7,9),(16,9),(7,10),(8,10),(17,10);
/*!40000 ALTER TABLE `lecturer_has_areasOfExpertise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturerInResearchGroup`
--

DROP TABLE IF EXISTS `lecturerInResearchGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturerInResearchGroup` (
  `lecturer_lecturerID` int NOT NULL,
  `researchGroupID` int NOT NULL,
  PRIMARY KEY (`lecturer_lecturerID`,`researchGroupID`),
  KEY `fk_lecturer_has_researchGroup_researchGroup1_idx` (`researchGroupID`),
  KEY `fk_lecturer_has_researchGroup_lecturer1_idx` (`lecturer_lecturerID`),
  CONSTRAINT `fk_lecturer_has_researchGroup_lecturer1` FOREIGN KEY (`lecturer_lecturerID`) REFERENCES `lecturer` (`lecturerID`),
  CONSTRAINT `fk_lecturer_has_researchGroup_researchGroup1` FOREIGN KEY (`researchGroupID`) REFERENCES `researchGroup` (`researchGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturerInResearchGroup`
--

LOCK TABLES `lecturerInResearchGroup` WRITE;
/*!40000 ALTER TABLE `lecturerInResearchGroup` DISABLE KEYS */;
INSERT INTO `lecturerInResearchGroup` VALUES (1,1),(10,1),(11,1),(2,2),(5,2),(12,2),(1,3),(3,3),(13,3),(4,4),(6,4),(14,4),(2,5),(5,5),(15,5),(6,6),(7,6),(16,6),(3,7),(7,7),(17,7),(8,8),(9,8),(18,8),(4,9),(9,9),(19,9),(8,10),(10,10),(20,10);
/*!40000 ALTER TABLE `lecturerInResearchGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researchGroup`
--

DROP TABLE IF EXISTS `researchGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `researchGroup` (
  `researchGroupID` int NOT NULL AUTO_INCREMENT,
  `groupHead` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`researchGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researchGroup`
--

LOCK TABLES `researchGroup` WRITE;
/*!40000 ALTER TABLE `researchGroup` DISABLE KEYS */;
INSERT INTO `researchGroup` VALUES (1,'Alan Turner'),(2,'Brenda Scott'),(3,'Charles Evans'),(4,'Diana Baker'),(5,'Ethan Adams'),(6,'Fiona Nelson'),(7,'George Carter'),(8,'Hannah Mitchell'),(9,'Ian Perez'),(10,'Julia Roberts');
/*!40000 ALTER TABLE `researchGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `researchProject`
--

DROP TABLE IF EXISTS `researchProject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `researchProject` (
  `researchProjectID` int NOT NULL AUTO_INCREMENT,
  `projectTitle` varchar(300) NOT NULL,
  `researchGroupID` int NOT NULL,
  PRIMARY KEY (`researchProjectID`),
  KEY `fk_researchProject_researchGroup1_idx` (`researchGroupID`),
  CONSTRAINT `fk_researchProject_researchGroup1` FOREIGN KEY (`researchGroupID`) REFERENCES `researchGroup` (`researchGroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `researchProject`
--

LOCK TABLES `researchProject` WRITE;
/*!40000 ALTER TABLE `researchProject` DISABLE KEYS */;
INSERT INTO `researchProject` VALUES (1,'Explainable AI in Education',1),(2,'Autonomous Systems Safety',1),(3,'Advanced Statistical Modeling',2),(4,'Optimization in Large Networks',2),(5,'Quantum Materials Simulation',3),(6,'Particle Interaction Analysis',3),(7,'Digital Transformation in SMEs',4),(8,'Consumer Behavior Analytics',4),(9,'Memory and Attention Studies',5),(10,'Behavioral Decision Research',5),(11,'Plant Cell Adaptation',6),(12,'Microbial Resistance Mapping',6),(13,'Green Catalysts for Synthesis',7),(14,'Polymer Reaction Efficiency',7),(15,'Medieval Trade Networks',8),(16,'Cultural Change in Modern Europe',8),(17,'Economic Forecasting Models',9),(18,'Labor Market Dynamics',9),(19,'Robotics in Smart Manufacturing',10),(20,'Energy-Efficient Structural Design',10);
/*!40000 ALTER TABLE `researchProject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffID` int NOT NULL AUTO_INCREMENT,
  `employmentType` varchar(45) DEFAULT NULL,
  `jobTitle` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `departmentID` int NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  KEY `fk_staff_department1_idx` (`departmentID`),
  CONSTRAINT `fk_staff_department1` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Full-time','Administrator',42000,1,'Martha','Green'),(2,'Part-time','Lab Assistant',28000,2,'Peter','Hall'),(3,'Full-time','Department Coordinator',45000,3,'Susan','Young'),(4,'Full-time','HR Officer',47000,4,'Thomas','King'),(5,'Part-time','Counselor',30000,5,'Ursula','Wright'),(6,'Full-time','Technician',39000,6,'Victor','Lopez'),(7,'Full-time','Safety Officer',41000,7,'Wendy','Hill'),(8,'Part-time','Archivist',27000,8,'Xavier','Scott'),(9,'Full-time','Finance Officer',50000,9,'Yvonne','Adams'),(10,'Full-time','Operations Manager',55000,10,'Zachary','Baker'),(11,'Full-time','Receptionist',32000,1,'Clara','Perez'),(12,'Part-time','Library Assistant',26000,2,'David','Nelson'),(13,'Full-time','Research Admin',44000,3,'Ella','Carter'),(14,'Full-time','Student Advisor',43000,4,'Frank','Mitchell'),(15,'Part-time','Office Assistant',25000,5,'Grace','Roberts'),(16,'Full-time','IT Support',46000,6,'Harry','Campbell'),(17,'Full-time','Procurement Officer',48000,7,'Irene','Phillips'),(18,'Part-time','Records Clerk',24000,8,'Jack','Parker'),(19,'Full-time','Accountant',51000,9,'Karen','Edwards'),(20,'Full-time','Facilities Supervisor',49500,10,'Leo','Collins');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studentID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `graduationStatus` varchar(45) DEFAULT NULL,
  `yearsOfStudy` int DEFAULT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Emma','Johnson','2002-03-14','Enrolled',2),(2,'Liam','Smith','2001-07-22','Enrolled',3),(3,'Olivia','Brown','2000-11-05','Graduated',4),(4,'Noah','Davis','2003-01-19','Enrolled',1),(5,'Ava','Miller','2002-09-28','Enrolled',2),(6,'William','Wilson','2001-05-30','Enrolled',3),(7,'Sophia','Moore','1999-12-12','Graduated',4),(8,'James','Taylor','2002-08-08','Enrolled',2),(9,'Isabella','Anderson','2003-06-25','Enrolled',1),(10,'Benjamin','Thomas','2001-04-17','Enrolled',3),(11,'Mia','Jackson','2000-10-09','Graduated',4),(12,'Lucas','White','2002-02-11','Enrolled',2),(13,'Charlotte','Harris','2001-09-03','Enrolled',3),(14,'Henry','Martin','2003-07-14','Enrolled',1),(15,'Amelia','Thompson','2002-12-01','Enrolled',2),(16,'Alexander','Garcia','2001-06-21','Enrolled',3),(17,'Harper','Martinez','2000-03-18','Graduated',4),(18,'Daniel','Robinson','2002-11-27','Enrolled',2),(19,'Evelyn','Clark','2003-05-06','Enrolled',1),(20,'Michael','Rodriguez','2001-01-29','Enrolled',3);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_enrollment`
--

DROP TABLE IF EXISTS `student_has_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_enrollment` (
  `student_studentID` int NOT NULL,
  `enrollment_enrollmentID` int NOT NULL,
  PRIMARY KEY (`student_studentID`,`enrollment_enrollmentID`),
  KEY `fk_student_has_enrollment_enrollment1_idx` (`enrollment_enrollmentID`),
  KEY `fk_student_has_enrollment_student_idx` (`student_studentID`),
  CONSTRAINT `fk_student_has_enrollment_enrollment1` FOREIGN KEY (`enrollment_enrollmentID`) REFERENCES `enrollment` (`enrollmentID`),
  CONSTRAINT `fk_student_has_enrollment_student` FOREIGN KEY (`student_studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_enrollment`
--

LOCK TABLES `student_has_enrollment` WRITE;
/*!40000 ALTER TABLE `student_has_enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_has_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teaches` (
  `courseID` int NOT NULL,
  `lecturerID` int NOT NULL,
  PRIMARY KEY (`courseID`,`lecturerID`),
  KEY `fk_course_has_lecturer_lecturer1_idx` (`lecturerID`),
  KEY `fk_course_has_lecturer_course1_idx` (`courseID`),
  CONSTRAINT `fk_course_has_lecturer_course1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  CONSTRAINT `fk_course_has_lecturer_lecturer1` FOREIGN KEY (`lecturerID`) REFERENCES `lecturer` (`lecturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES (1,1),(2,1),(5,1),(3,2),(6,2),(8,2),(9,3),(10,3),(11,4),(12,4),(18,4),(13,5),(15,5),(9,6),(14,6),(16,7),(13,8),(17,8),(7,9),(18,9),(19,9),(1,10),(20,10),(3,11),(4,11),(2,12),(7,12),(4,13),(10,13),(12,14),(17,14),(8,15),(14,16),(15,16),(16,17),(11,18),(6,19),(19,19),(5,20),(20,20);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-08 19:39:52
