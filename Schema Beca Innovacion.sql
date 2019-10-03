CREATE DATABASE  IF NOT EXISTS `beca_innovacion_upm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `beca_innovacion_upm`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: beca_innovacion_upm
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `activities` (
  `activityID` varchar(10) NOT NULL,
  `teacherID` varchar(6) NOT NULL,
  `title` varchar(300) NOT NULL,
  `videoLink` text NOT NULL,
  `pointsMultiplier` int(11) unsigned NOT NULL DEFAULT '10',
  `numberOfAttempts` tinyint(2) NOT NULL DEFAULT '3',
  `penalisationPerAttempt` tinyint(1) NOT NULL DEFAULT '0',
  `penalisationLimit` int(10) unsigned NOT NULL DEFAULT '50' COMMENT 'The minimum percentage of value of the activity. If 50%, then the activity won''t ever award less than 50% of pointsMultiplier per correct answer',
  `numberOfQuestions` tinyint(2) unsigned NOT NULL DEFAULT '5',
  `questionIDs` longtext NOT NULL,
  `category` longtext NOT NULL,
  `tags` longtext,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `creatorName` varchar(120) NOT NULL,
  PRIMARY KEY (`activityID`,`teacherID`),
  UNIQUE KEY `activityID_UNIQUE` (`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` (`activityID`, `teacherID`, `title`, `videoLink`, `pointsMultiplier`, `numberOfAttempts`, `penalisationPerAttempt`, `penalisationLimit`, `numberOfQuestions`, `questionIDs`, `category`, `tags`, `create_time`, `creatorName`) VALUES ('A563636049','prof1','The basics of Neural Networks (NN)','https://www.youtube.com/watch?v=aircAruvnKk',25,3,30,50,5,'Q483751983, Q000009664, Q017362054, Q950048080, Q703013558','Technology','AI,Neurons,Future','2019-06-30 18:26:24','Profesor Uno'),('A659656685','prof2','This title is trying to be different','https://www.youtube.com/watch?v=fUtiJaLYZ8w',15,6,20,50,5,'Q413741950, Q737333537, Q297437552, Q579791915, Q604112326','Finance','','2019-06-30 18:43:00','Profesor Dos'),('A835860635','prof1','Example Activity','https://www.youtube.com/watch?v=cSU3y0N60XU',12,2,20,50,5,'Q822738229, Q767586428, Q143628386, Q246667013, Q323687945','Lifestyle','Groceries','2019-06-30 18:39:44','Profesor Uno'),('A945537257','prof2','This one is quite normal','https://www.youtube.com/watch?v=J9kbZ5I8gdM',100,10,100,50,5,'Q497236657, Q814998717, Q433181806, Q105468689, Q890433345','Education','Let\'s, put, a, lot, of tags, and, see, what, happens','2019-06-30 18:51:03','Profesor Dos');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admins` (
  `adminID` varchar(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`adminID`),
  UNIQUE KEY `adminID_UNIQUE` (`adminID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` (`adminID`, `email`, `password`, `name`, `surname`, `create_time`) VALUES ('admin1','admin@admin.com','SBNJTRN+FjG7owHVrKtue7eqdM4RhdRWVl71HXN2d7I=','Admin','Admino','2019-06-27 11:25:51');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupstable`
--

DROP TABLE IF EXISTS `groupstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `groupstable` (
  `groupID` varchar(10) NOT NULL,
  `numberOfStudents` int(10) NOT NULL DEFAULT '0',
  `averageGrade` float NOT NULL DEFAULT '0',
  `averagePoints` float NOT NULL DEFAULT '0',
  `highestPoints` float NOT NULL DEFAULT '0',
  `totalPoints` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupID`),
  UNIQUE KEY `yearID_UNIQUE` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupstable`
--

LOCK TABLES `groupstable` WRITE;
/*!40000 ALTER TABLE `groupstable` DISABLE KEYS */;
INSERT INTO `groupstable` (`groupID`, `numberOfStudents`, `averageGrade`, `averagePoints`, `highestPoints`, `totalPoints`) VALUES ('GD14',1,0.466,90.66,197,197),('GG26',2,0.8,138.33,370,403),('NG35',2,1,75,60,60);
/*!40000 ALTER TABLE `groupstable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `questions` (
  `questionID` varchar(10) NOT NULL,
  `activityID` varchar(10) NOT NULL,
  `questionText` mediumtext NOT NULL,
  `questionType` varchar(4) NOT NULL DEFAULT 'test' COMMENT '"Text" or "Test"',
  `questionAnswer` int(1) NOT NULL COMMENT 'Number of the choice that is the correct answer',
  `questionChoices` longtext,
  PRIMARY KEY (`questionID`,`activityID`),
  UNIQUE KEY `questionID_UNIQUE` (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`questionID`, `activityID`, `questionText`, `questionType`, `questionAnswer`, `questionChoices`) VALUES ('Q000009664','A563636049','What are NNs useful for?','test',2,'Magic--Complex calculations--Making your food--Walking your dog'),('Q017362054','A563636049','What fields are required to understand NNs?','test',3,' Economics and Social Sciences--Biology--Maths and Technology--English Literature (Shakespeare preferably)'),('Q017771075','A744621783','q5','test',2,'b--a--b--b'),('Q0425759','A5607720','q','test',1,'q--q--q--q'),('Q0428870','A5607720','q','test',1,'q--q--q--q'),('Q0584530','A5607720','q','test',1,'q--q--q--q'),('Q075928356','A744621783','q2','test',3,'b--b--s--b'),('Q105468689','A945537257','d','test',4,'b--b--b--a'),('Q143628386','A835860635','Question 3','test',2,'b--a--b--b'),('Q201792812','A583457223','Whatever','test',1,'choice 1--choice 2--choice 3--choice 4'),('Q2056712','A5607720','q','test',1,'qqqq--q--q--q'),('Q246667013','A835860635','Question 4','test',1,'a--b--b--b'),('Q247275525','A583457223','Whatever 4 qd234tasg','test',2,'choice 1--choice 2--choice 3--choice 4'),('Q269603683','A583457223','Whatever 5 acq2er4fg','test',3,'choice 1--choice 2--choice 3--choice 4'),('Q297437552','A659656685','Q','test',1,'a--b--b--b'),('Q323687945','A835860635','Question 5','test',4,'b--b--b--a'),('Q373851511','A583457223','Whatever 3 qe5rq3245','test',4,'choice 1--choice 2--choice 3--choice 4'),('Q413741950','A659656685','Q','test',1,'a--b--b--b'),('Q433181806','A945537257','c','test',3,'b--b--a--b'),('Q483751983','A563636049','What are NNs made of?','test',1,'Neurons--Cells--Pixels--Bytes'),('Q497236657','A945537257','A','test',1,'a--b--b--b'),('Q579791915','A659656685','Q','test',1,'a--b--b--b'),('Q604112326','A659656685','Q','test',1,'a--b--b--b'),('Q670735476','A583457223','Whatever 222adawda','test',4,'choice 1--choice 2--choice 3--choice 4'),('Q703013558','A563636049','Is AI truly intelligent?','test',4,'Yes, more than humans--Yes, but less than humans--Maybe--No, not yet'),('Q720776600','A744621783','q3','test',4,'b--b--b--a'),('Q737333537','A659656685','q','test',1,'a--b--b--b'),('Q767586428','A835860635','Question 2','test',3,'b--b--a--b'),('Q814998717','A945537257','B','test',2,'b--a--b--b'),('Q822738229','A835860635','Question 1','test',1,'a--b--b--b'),('Q825883583','A744621783','q4','test',1,'a--b--b--b'),('Q890433345','A945537257','e','test',1,'a--b--b--b'),('Q950048080','A563636049','Are NNs and AI a danger to Humanity?','test',2,'No, clearly--Yes, if used improperly--Yes, and should be banned forever--What is AI?'),('Q9529991','A5607720','','test',1,'q--q--q--q'),('Q992317121','A744621783','q1','test',1,'a--b--b--b');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_limiter`
--

DROP TABLE IF EXISTS `rate_limiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rate_limiter` (
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` int(9) NOT NULL DEFAULT '0',
  `expire` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_limiter`
--

LOCK TABLES `rate_limiter` WRITE;
/*!40000 ALTER TABLE `rate_limiter` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate_limiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schools` (
  `schoolID` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `abbreviation` varchar(45) NOT NULL,
  `teacherIDs` json DEFAULT NULL,
  `studentIDs` json DEFAULT NULL,
  PRIMARY KEY (`schoolID`,`name`,`abbreviation`),
  UNIQUE KEY `schoolID_UNIQUE` (`schoolID`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `abbreviation_UNIQUE` (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='List of participating schools from UPM';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` (`schoolID`, `name`, `abbreviation`, `teacherIDs`, `studentIDs`) VALUES ('s1','Escuela Técnica Superior de Ingeniería de Sistemas Informáticos','ETSISI','{\"r\": \"r\", \"t\": \"t\"}','{\"a\": \"a\", \"b\": \"b\"}');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES ('cc95vEE-zLPydFYZoTLp4D_uGIoV3X4_',1562783587,'{\"cookie\":{\"originalMaxAge\":1800000,\"expires\":\"2019-07-10T18:32:53.774Z\",\"httpOnly\":true,\"path\":\"/\",\"sameSite\":true},\"errors\":null,\"signUpSuccess\":null,\"success\":null,\"user\":{\"studentID\":\"stud6\",\"teacherID\":\"prof1\",\"email\":\"6@alumnos.upm.es\",\"name\":\"Student\",\"surname\":\"Six\",\"groupID\":\"GG26\",\"includeInRankings\":1,\"totalPoints\":33,\"create_time\":\"2019-06-30T17:58:25.000Z\",\"isDeleted\":0},\"userType\":\"student\",\"activities\":{\"A563636049\":{\"activityID\":\"A563636049\",\"teacherID\":\"prof1\",\"title\":\"The basics of Neural Networks (NN)\",\"videoLink\":\"https://www.youtube.com/watch?v=aircAruvnKk\",\"pointsMultiplier\":25,\"numberOfAttempts\":3,\"penalisationPerAttempt\":30,\"penalisationLimit\":50,\"numberOfQuestions\":5,\"questionIDs\":\"Q483751983, Q000009664, Q017362054, Q950048080, Q703013558\",\"category\":\"Technology\",\"tags\":[\"AI\",\"Neurons\",\"Future\"],\"create_time\":\"2019-06-30T18:26:24.000Z\",\"creatorName\":\"Profesor Uno\",\"activityLink\":\"/activity/A563636049\",\"summaryLink\":\"/activity-summary/A563636049\",\"questions\":{\"1\":{\"questionID\":\"Q000009664\",\"activityID\":\"A563636049\",\"questionText\":\"What are NNs useful for?\",\"questionType\":\"test\",\"questionAnswer\":2,\"questionChoices\":\"Magic--Complex calculations--Making your food--Walking your dog\"},\"2\":{\"questionID\":\"Q017362054\",\"activityID\":\"A563636049\",\"questionText\":\"What fields are required to understand NNs?\",\"questionType\":\"test\",\"questionAnswer\":3,\"questionChoices\":\" Economics and Social Sciences--Biology--Maths and Technology--English Literature (Shakespeare preferably)\"},\"3\":{\"questionID\":\"Q483751983\",\"activityID\":\"A563636049\",\"questionText\":\"What are NNs made of?\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"Neurons--Cells--Pixels--Bytes\"},\"4\":{\"questionID\":\"Q703013558\",\"activityID\":\"A563636049\",\"questionText\":\"Is AI truly intelligent?\",\"questionType\":\"test\",\"questionAnswer\":4,\"questionChoices\":\"Yes, more than humans--Yes, but less than humans--Maybe--No, not yet\"},\"5\":{\"questionID\":\"Q950048080\",\"activityID\":\"A563636049\",\"questionText\":\"Are NNs and AI a danger to Humanity?\",\"questionType\":\"test\",\"questionAnswer\":2,\"questionChoices\":\"No, clearly--Yes, if used improperly--Yes, and should be banned forever--What is AI?\"}}},\"A659656685\":{\"activityID\":\"A659656685\",\"teacherID\":\"prof2\",\"title\":\"This title is trying to be different\",\"videoLink\":\"https://www.youtube.com/watch?v=fUtiJaLYZ8w\",\"pointsMultiplier\":15,\"numberOfAttempts\":6,\"penalisationPerAttempt\":20,\"penalisationLimit\":50,\"numberOfQuestions\":5,\"questionIDs\":\"Q413741950, Q737333537, Q297437552, Q579791915, Q604112326\",\"category\":\"Finance\",\"tags\":[],\"create_time\":\"2019-06-30T18:43:00.000Z\",\"creatorName\":\"Profesor Dos\",\"activityLink\":\"/activity/A659656685\",\"summaryLink\":\"/activity-summary/A659656685\",\"questions\":{\"1\":{\"questionID\":\"Q297437552\",\"activityID\":\"A659656685\",\"questionText\":\"Q\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"},\"2\":{\"questionID\":\"Q413741950\",\"activityID\":\"A659656685\",\"questionText\":\"Q\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"},\"3\":{\"questionID\":\"Q579791915\",\"activityID\":\"A659656685\",\"questionText\":\"Q\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"},\"4\":{\"questionID\":\"Q604112326\",\"activityID\":\"A659656685\",\"questionText\":\"Q\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"},\"5\":{\"questionID\":\"Q737333537\",\"activityID\":\"A659656685\",\"questionText\":\"q\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"}}},\"A835860635\":{\"activityID\":\"A835860635\",\"teacherID\":\"prof1\",\"title\":\"Example Activity\",\"videoLink\":\"https://www.youtube.com/watch?v=cSU3y0N60XU\",\"pointsMultiplier\":12,\"numberOfAttempts\":2,\"penalisationPerAttempt\":20,\"penalisationLimit\":50,\"numberOfQuestions\":5,\"questionIDs\":\"Q822738229, Q767586428, Q143628386, Q246667013, Q323687945\",\"category\":\"Lifestyle\",\"tags\":[\"Groceries\"],\"create_time\":\"2019-06-30T18:39:44.000Z\",\"creatorName\":\"Profesor Uno\",\"activityLink\":\"/activity/A835860635\",\"summaryLink\":\"/activity-summary/A835860635\",\"questions\":{\"1\":{\"questionID\":\"Q143628386\",\"activityID\":\"A835860635\",\"questionText\":\"Question 3\",\"questionType\":\"test\",\"questionAnswer\":2,\"questionChoices\":\"b--a--b--b\"},\"2\":{\"questionID\":\"Q246667013\",\"activityID\":\"A835860635\",\"questionText\":\"Question 4\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"},\"3\":{\"questionID\":\"Q323687945\",\"activityID\":\"A835860635\",\"questionText\":\"Question 5\",\"questionType\":\"test\",\"questionAnswer\":4,\"questionChoices\":\"b--b--b--a\"},\"4\":{\"questionID\":\"Q767586428\",\"activityID\":\"A835860635\",\"questionText\":\"Question 2\",\"questionType\":\"test\",\"questionAnswer\":3,\"questionChoices\":\"b--b--a--b\"},\"5\":{\"questionID\":\"Q822738229\",\"activityID\":\"A835860635\",\"questionText\":\"Question 1\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"}}},\"A945537257\":{\"activityID\":\"A945537257\",\"teacherID\":\"prof2\",\"title\":\"This one is quite normal\",\"videoLink\":\"https://www.youtube.com/watch?v=J9kbZ5I8gdM\",\"pointsMultiplier\":100,\"numberOfAttempts\":10,\"penalisationPerAttempt\":100,\"penalisationLimit\":50,\"numberOfQuestions\":5,\"questionIDs\":\"Q497236657, Q814998717, Q433181806, Q105468689, Q890433345\",\"category\":\"Education\",\"tags\":[\"Let\'s\",\"put\",\"a\",\"lot\",\"oftags\",\"and\",\"see\",\"what\",\"happens\"],\"create_time\":\"2019-06-30T18:51:03.000Z\",\"creatorName\":\"Profesor Dos\",\"activityLink\":\"/activity/A945537257\",\"summaryLink\":\"/activity-summary/A945537257\",\"questions\":{\"1\":{\"questionID\":\"Q105468689\",\"activityID\":\"A945537257\",\"questionText\":\"d\",\"questionType\":\"test\",\"questionAnswer\":4,\"questionChoices\":\"b--b--b--a\"},\"2\":{\"questionID\":\"Q433181806\",\"activityID\":\"A945537257\",\"questionText\":\"c\",\"questionType\":\"test\",\"questionAnswer\":3,\"questionChoices\":\"b--b--a--b\"},\"3\":{\"questionID\":\"Q497236657\",\"activityID\":\"A945537257\",\"questionText\":\"A\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"},\"4\":{\"questionID\":\"Q814998717\",\"activityID\":\"A945537257\",\"questionText\":\"B\",\"questionType\":\"test\",\"questionAnswer\":2,\"questionChoices\":\"b--a--b--b\"},\"5\":{\"questionID\":\"Q890433345\",\"activityID\":\"A945537257\",\"questionText\":\"e\",\"questionType\":\"test\",\"questionAnswer\":1,\"questionChoices\":\"a--b--b--b\"}}}},\"completedActivities\":{\"A659656685\":{\"studentID\":\"stud6\",\"activityID\":\"A659656685\",\"groupID\":\"GG26\",\"grade\":0.6,\"pointsAwarded\":45,\"numberOfAttempts\":5,\"completedOn\":\"2019-07-05T16:20:16.000Z\",\"title\":\"This title is trying to be different\",\"activityLink\":\"/activity/A659656685\",\"category\":\"Finance\",\"tags\":[],\"creatorName\":\"Profesor Dos\"}}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `studentID` varchar(6) NOT NULL,
  `teacherID` varchar(6) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `groupID` varchar(8) NOT NULL DEFAULT 'GM20',
  `includeInRankings` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'A boolean value',
  `totalPoints` float unsigned DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'To check if the student has been ''deleted'' from the system',
  PRIMARY KEY (`studentID`,`teacherID`),
  UNIQUE KEY `studentID_UNIQUE` (`studentID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`studentID`, `teacherID`, `email`, `password`, `name`, `surname`, `groupID`, `includeInRankings`, `totalPoints`, `create_time`, `isDeleted`) VALUES ('stud1','prof1','1@alumnos.upm.es','Sf4H0PBBvO2bqCehDCzTGyCJIp1LTjpjsHTtekNw6I8=','Student','One','GD14',1,197,'2019-06-30 17:26:27',0),('stud2','prof1','2@alumnos.upm.es','LYUOtUYP+2u5rhEYai14zCLZ3zh/nNvTopfg0eoIpUs=','Student','Two','GG26',1,370,'2019-06-30 17:28:27',0),('stud3','prof2','3@alumnos.upm.es','879dae0+DhksXC4tnrTQwVzWhdiExKgGszi07vfA1rc=','Student','Three','NG35',0,0,'2019-06-30 17:55:02',0),('stud4','prof1','4@alumnos.upm.es','pniKjXbPCxv7Sex90kXJJLWVF5sDmEvgHOT28fM5KOY=','Student','Four','GD14',1,0,'2019-06-30 17:56:25',1),('stud5','prof2','5@alumnos.upm.es','tYMGCwJ6PW4OpFCrXvBKFV89/SpdwnQNG0TV/ibvxuA=','Student','Five','NG35',1,60,'2019-06-30 17:56:25',0),('stud6','prof1','6@alumnos.upm.es','MS17yziMkwvhU+i/0o9wiwBV890vg79o5apK6tTrKoQ=','Student','Six','GG26',1,33,'2019-06-30 17:58:25',0);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_activities`
--

DROP TABLE IF EXISTS `students_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students_activities` (
  `studentID` varchar(6) NOT NULL,
  `activityID` varchar(10) NOT NULL,
  `groupID` varchar(10) NOT NULL,
  `grade` float unsigned NOT NULL,
  `pointsAwarded` float NOT NULL,
  `numberOfAttempts` int(11) NOT NULL DEFAULT '1',
  `completedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`studentID`,`activityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_activities`
--

LOCK TABLES `students_activities` WRITE;
/*!40000 ALTER TABLE `students_activities` DISABLE KEYS */;
INSERT INTO `students_activities` (`studentID`, `activityID`, `groupID`, `grade`, `pointsAwarded`, `numberOfAttempts`, `completedOn`) VALUES ('stud1','A563636049','GD14',0.8,200,3,'2019-07-02 12:19:23'),('stud1','A659656685','GD14',0,0,1,'2019-09-28 09:55:14'),('stud1','A835860635','GD14',0.6,72,2,'2019-06-30 18:53:17'),('stud2','A563636049','GG26',1,250,2,'2019-07-02 12:53:43'),('stud2','A659656685','GG26',0.8,120,1,'2019-07-02 12:59:45'),('stud5','A659656685','NG35',1,75,5,'2019-07-05 16:13:32'),('stud6','A659656685','GG26',0.6,45,5,'2019-07-05 16:20:16');
/*!40000 ALTER TABLE `students_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teachers` (
  `teacherID` varchar(8) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `isValidated` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`teacherID`),
  UNIQUE KEY `teacherID_UNIQUE` (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` (`teacherID`, `email`, `password`, `name`, `surname`, `isValidated`, `create_time`) VALUES ('prof1','p1@upm.es','3j59PiShSRdHPt9n8ogKEejh+IDCWizZUP6HHoTOTIU=','Profesor','Uno',1,'2019-06-30 15:37:34'),('prof2','p2@upm.es','3j59PiShSRdHPt9n8ogKEejh+IDCWizZUP6HHoTOTIU=','Profesor','Dos',1,'2019-06-30 15:45:34');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'beca_innovacion_upm'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `group_updater` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `group_updater` ON SCHEDULE EVERY 1 MINUTE STARTS '2019-06-28 18:05:55' ON COMPLETION PRESERVE ENABLE COMMENT 'Updates the group table' DO UPDATE groupstable AS t1 SET
	numberOfStudents = IFNULL((SELECT numOfStudents FROM (SELECT groupID, COUNT(studentID) as numOfStudents FROM students WHERE isDeleted = 0 GROUP BY groupID) t2
						WHERE t2.groupID = t1.groupID), 0),
	averageGrade = IFNULL((SELECT avgGrade FROM (SELECT groupID, TRUNCATE(AVG(grade),3) as avgGrade FROM students_activities
											WHERE studentID NOT IN (SELECT studentID FROM students WHERE isDeleted = 1)
											GROUP BY groupID) t3
					WHERE t3.groupID = t1.groupID), 0),
	averagePoints = IFNULL((SELECT avgPoints FROM (SELECT groupID, TRUNCATE(AVG(pointsAwarded),2) as avgPoints FROM students_activities
											WHERE studentID NOT IN (SELECT studentID FROM students WHERE isDeleted = 1)
											GROUP BY groupID) t4
					WHERE t4.groupID = t1.groupID), 0),
	highestPoints = IFNULL((SELECT maxPoints FROM (SELECT groupID, MAX(totalPoints) as maxPoints FROM students WHERE isDeleted = 0 GROUP BY groupID) t5
					WHERE t5.groupID = t1.groupID), 0),
	totalPoints = IFNULL((SELECT total FROM (SELECT groupID, SUM(totalPoints) AS total FROM students WHERE isDeleted = 0 GROUP BY groupID) t6
					WHERE t6.groupID = t1.groupID), 0) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'beca_innovacion_upm'
--
/*!50003 DROP PROCEDURE IF EXISTS `grouptableUpdater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grouptableUpdater`()
BEGIN
UPDATE groupstable AS t1 SET
	numberOfStudents = (SELECT numOfStudents FROM (SELECT groupID, IFNULL(COUNT(studentID), 0) as numOfStudents FROM students WHERE isDeleted = 0 GROUP BY groupID) t2
						WHERE t2.groupID = t1.groupID),
	averageGrade = IFNULL((SELECT avgGrade FROM (SELECT groupID, TRUNCATE(AVG(grade),3) as avgGrade FROM students_activities
											WHERE studentID NOT IN (SELECT studentID FROM students WHERE isDeleted = 1)
											GROUP BY groupID) t3
					WHERE t3.groupID = t1.groupID), 0),
	averagePoints = IFNULL((SELECT avgPoints FROM (SELECT groupID, TRUNCATE(AVG(pointsAwarded),2) as avgPoints FROM students_activities
											WHERE studentID NOT IN (SELECT studentID FROM students WHERE isDeleted = 1)
											GROUP BY groupID) t4
					WHERE t4.groupID = t1.groupID), 0),
	highestPoints = (SELECT maxPoints FROM (SELECT groupID, IFNULL(MAX(totalPoints), 0) as maxPoints FROM students WHERE isDeleted = 0 GROUP BY groupID) t5
					WHERE t5.groupID = t1.groupID),
	totalPoints = (SELECT total FROM (SELECT groupID, IFNULL(SUM(totalPoints), 0) AS total FROM students WHERE isDeleted = 0 GROUP BY groupID) t6
					WHERE t6.groupID = t1.groupID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-30 22:44:34
