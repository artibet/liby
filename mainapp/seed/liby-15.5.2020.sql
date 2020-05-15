-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: root.mysql.pythonanywhere-services.com    Database: root$liby
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `active_lends`
--

DROP TABLE IF EXISTS `active_lends`;
/*!50001 DROP VIEW IF EXISTS `active_lends`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `active_lends` AS SELECT 
 1 AS `book_id`,
 1 AS `lends`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Συγγραφέας',7,'add_authorlist'),(26,'Can change Συγγραφέας',7,'change_authorlist'),(27,'Can delete Συγγραφέας',7,'delete_authorlist'),(28,'Can view Συγγραφέας',7,'view_authorlist'),(29,'Can add Κατηγορία Βιβλίου',8,'add_categorylist'),(30,'Can change Κατηγορία Βιβλίου',8,'change_categorylist'),(31,'Can delete Κατηγορία Βιβλίου',8,'delete_categorylist'),(32,'Can view Κατηγορία Βιβλίου',8,'view_categorylist'),(33,'Can add Γλώσσα',9,'add_languagelist'),(34,'Can change Γλώσσα',9,'change_languagelist'),(35,'Can delete Γλώσσα',9,'delete_languagelist'),(36,'Can view Γλώσσα',9,'view_languagelist'),(37,'Can add Εκδοτικός Οίκος',10,'add_publisherlist'),(38,'Can change Εκδοτικός Οίκος',10,'change_publisherlist'),(39,'Can delete Εκδοτικός Οίκος',10,'delete_publisherlist'),(40,'Can view Εκδοτικός Οίκος',10,'view_publisherlist'),(41,'Can add Χρήστης',11,'add_userlist'),(42,'Can change Χρήστης',11,'change_userlist'),(43,'Can delete Χρήστης',11,'delete_userlist'),(44,'Can view Χρήστης',11,'view_userlist'),(45,'Can add Συγγραφέας',12,'add_author'),(46,'Can change Συγγραφέας',12,'change_author'),(47,'Can delete Συγγραφέας',12,'delete_author'),(48,'Can view Συγγραφέας',12,'view_author'),(49,'Can add Βιβλίο',13,'add_book'),(50,'Can change Βιβλίο',13,'change_book'),(51,'Can delete Βιβλίο',13,'delete_book'),(52,'Can view Βιβλίο',13,'view_book'),(53,'Can add Κατηγορία Βιβλίου',14,'add_category'),(54,'Can change Κατηγορία Βιβλίου',14,'change_category'),(55,'Can delete Κατηγορία Βιβλίου',14,'delete_category'),(56,'Can view Κατηγορία Βιβλίου',14,'view_category'),(57,'Can add comment',15,'add_comment'),(58,'Can change comment',15,'change_comment'),(59,'Can delete comment',15,'delete_comment'),(60,'Can view comment',15,'view_comment'),(61,'Can add Χώρα',16,'add_country'),(62,'Can change Χώρα',16,'change_country'),(63,'Can delete Χώρα',16,'delete_country'),(64,'Can view Χώρα',16,'view_country'),(65,'Can add Εισαγωγή',17,'add_entry'),(66,'Can change Εισαγωγή',17,'change_entry'),(67,'Can delete Εισαγωγή',17,'delete_entry'),(68,'Can view Εισαγωγή',17,'view_entry'),(69,'Can add Κράτηση',18,'add_hold'),(70,'Can change Κράτηση',18,'change_hold'),(71,'Can delete Κράτηση',18,'delete_hold'),(72,'Can view Κράτηση',18,'view_hold'),(73,'Can add Κατάσταση Κρατήσεων',19,'add_holdstatus'),(74,'Can change Κατάσταση Κρατήσεων',19,'change_holdstatus'),(75,'Can delete Κατάσταση Κρατήσεων',19,'delete_holdstatus'),(76,'Can view Κατάσταση Κρατήσεων',19,'view_holdstatus'),(77,'Can add Γλώσσα',20,'add_language'),(78,'Can change Γλώσσα',20,'change_language'),(79,'Can delete Γλώσσα',20,'delete_language'),(80,'Can view Γλώσσα',20,'view_language'),(81,'Can add Δανεισμός',21,'add_lend'),(82,'Can change Δανεισμός',21,'change_lend'),(83,'Can delete Δανεισμός',21,'delete_lend'),(84,'Can view Δανεισμός',21,'view_lend'),(85,'Can add Εκδοτικός Οίκος',22,'add_publisher'),(86,'Can change Εκδοτικός Οίκος',22,'change_publisher'),(87,'Can delete Εκδοτικός Οίκος',22,'delete_publisher'),(88,'Can view Εκδοτικός Οίκος',22,'view_publisher'),(89,'Can add Πρόταση',23,'add_suggestion'),(90,'Can change Πρόταση',23,'change_suggestion'),(91,'Can delete Πρόταση',23,'delete_suggestion'),(92,'Can view Πρόταση',23,'view_suggestion'),(93,'Can add Βιβλίο',24,'add_bookdetails'),(94,'Can change Βιβλίο',24,'change_bookdetails'),(95,'Can delete Βιβλίο',24,'delete_bookdetails'),(96,'Can view Βιβλίο',24,'view_bookdetails'),(97,'Can add book newest',25,'add_booknewest'),(98,'Can change book newest',25,'change_booknewest'),(99,'Can delete book newest',25,'delete_booknewest'),(100,'Can view book newest',25,'view_booknewest'),(101,'Can add Βιβλίο',26,'add_bookdata'),(102,'Can change Βιβλίο',26,'change_bookdata'),(103,'Can delete Βιβλίο',26,'delete_bookdata'),(104,'Can view Βιβλίο',26,'view_bookdata'),(105,'Can add Χρήστης',27,'add_userdata'),(106,'Can change Χρήστης',27,'change_userdata'),(107,'Can delete Χρήστης',27,'delete_userdata'),(108,'Can view Χρήστης',27,'view_userdata'),(109,'Can add book best choices',28,'add_bookbestchoices'),(110,'Can change book best choices',28,'change_bookbestchoices'),(111,'Can delete book best choices',28,'delete_bookbestchoices'),(112,'Can view book best choices',28,'view_bookbestchoices'),(113,'Can add book top titles',29,'add_booktoptitles'),(114,'Can change book top titles',29,'change_booktoptitles'),(115,'Can delete book top titles',29,'delete_booktoptitles'),(116,'Can view book top titles',29,'view_booktoptitles'),(117,'Can add book top picks',30,'add_booktoppicks'),(118,'Can change book top picks',30,'change_booktoppicks'),(119,'Can delete book top picks',30,'delete_booktoppicks'),(120,'Can view book top picks',30,'view_booktoppicks'),(121,'Can add lend date',31,'add_lenddate'),(122,'Can change lend date',31,'change_lenddate'),(123,'Can delete lend date',31,'delete_lenddate'),(124,'Can view lend date',31,'view_lenddate'),(125,'Can add lend data',32,'add_lenddata'),(126,'Can change lend data',32,'change_lenddata'),(127,'Can delete lend data',32,'delete_lenddata'),(128,'Can view lend data',32,'view_lenddata');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$dJYN4GoJBVAq$3ErC1XA8NEX25cJ2sXiayYPlJZTBusM9/NBp+qmrNRQ=','2020-05-15 19:04:19.225184',1,'sotiris','','','sotiris@serres.gr',1,1,'2018-12-28 18:13:17.316306'),(2,'pbkdf2_sha256$120000$r9PpHg29M6PG$amsfTj0qymSKbb7oJvSVUQArjwezq2VakXKs1CuGH/k=','2019-01-06 11:23:27.211543',0,'pagona','','','pago@serres.gr',0,1,'2019-01-05 16:50:07.397202'),(3,'pbkdf2_sha256$120000$g5Kbm9D0B0J1$pRgGqtO1sX67KOClmvtcxdMq5jt0yo5ALwaQTzBBGRA=','2019-01-19 08:23:00.504976',0,'dimitris','','','dimitris@gmail.com',0,1,'2019-01-05 17:43:26.372256'),(4,'pbkdf2_sha256$120000$p3lOP2o4NPp9$JeqCiOhozERP9+PNyp75qY30vJcmojjr1MUBtSrEn6A=','2019-02-05 09:11:33.926195',1,'thanasis73','','','athan.taousanis@gmail.com',1,1,'2019-01-07 05:03:00.000000'),(5,'pbkdf2_sha256$120000$hawRacdwJ0mb$uaki4zIOgWFccr/gkrT799NQgL/Jg8bskXxWWJivuIQ=','2019-01-10 10:45:13.011046',0,'mina','','','minaogre@yahoo.gr',0,1,'2019-01-08 06:43:41.474984'),(6,'pbkdf2_sha256$120000$v3PXMxgfIHnM$JHmuPqL3DhBPqWIkyUzRwCdvyDw7ZgrzH5+u31xaT9Y=','2019-01-11 10:24:54.768947',0,'apover','Απόστολος','Βεράνης','apover@gmail.com',0,1,'2019-01-11 10:24:38.413935'),(7,'pbkdf2_sha256$120000$XortVLrocueY$sdgtiPuEEL1Q1fgYJQGiWmo8jsGG9EhJT/YnyF/J6PI=','2019-01-17 14:14:06.093231',0,'test','','','test@test.com',0,1,'2019-01-17 14:12:57.663472'),(8,'pbkdf2_sha256$120000$0b1RMexNWUir$DJsVeUJNcc79DYtYNqIW5HGXVV/iuloCRfAtMrPaKgw=','2019-01-20 09:35:38.396246',0,'sakis','Αθανάσιος','Ταουσάνης','sakis@serres.gr',0,1,'2019-01-20 09:35:25.270323'),(9,'pbkdf2_sha256$120000$cFL3kGg1gNGW$9fz0aCGGGaRdNe4UGTa/o0UyF3fx/DrWrDLv83Ws1Ws=','2019-02-06 17:07:05.007628',1,'svol','Σταύρος','Βολογιαννίδης','svologia@gmail.com',1,1,'2019-02-04 18:49:47.303605'),(10,'pbkdf2_sha256$120000$hFqWzojv7DE5$iP7P9OVw9cnX4s1OqRnw519FGV2YjkcPKkYM0p19lHM=',NULL,0,'sidirasg','','','georgesidiras@gmail.com',0,1,'2019-02-07 18:46:41.345797');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) NOT NULL,
  `bio` longtext NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Olga Filipova','Olga Filipova was born in Ukraine, in Kyiv. She grew up in a family of physicists, scientists, and professors. She studied system analysis at the National University of Ukraine Kyiv Polytechnic Institute. At the age of 20, she moved to Portugal where she did her bachelor\'s and master\'s degrees in computer science in the University of Coimbra. During her studies, she participated in research and development of European projects and became an assistant teacher of operating systems and computer graphics. After obtaining her master\'s degree, she started to work at Feedzai. At that time, it was a small team of four who developed a product from scratch, and now it is one of the most successful Portuguese startups. At some point, her main responsibility became to develop a library written in JavaScript whose purpose was to bring data from the engine to the web interface. This marked Olga\'s main direction in tech-web development. At the same time, she continued her teaching practice in a course of professional web development in the local professional education center in Coimbra.\r\n\r\nIn 2013, along with her brother and her husband, she started an educational project based in Ukraine. This project\'s name is EdEra and it has grown from a small platform of online courses into a big player in the Ukrainian educational system. Currently, EdEra is pointing in an the international direction and preparing an awesome online course about IT. Don\'t miss it!\r\n\r\nIn 2014, Olga, with her husband and daughter, moved from Portugal to Berlin, where she started working at Meetrics as a frontend engineer, and after a year she became the lead of an amazing team of frontend software developers.\r\n\r\nOlga is happily married to an awesome guy called Rui, who is also a software engineer. Rui studied with Olga at the University of Coimbra and worked with her at Feedzai. Olga has a smart and beautiful daughter called Taissa, a fluffy cat called Patusca, and two fluffiest chinchillas called Barabashka and Cheburashka.','','2018-12-28 18:24:03.867456','2018-12-28 18:24:03.867456'),(2,'Arun Ravindran','Arun \"Rocks\" Ravindran is a well-known speaker and author in the Indian open source community. He is a developer member of the Django Software Foundation. \r\n\r\nHe came up with the idea of Twitter, Instagram and a thousand other startups; but strangely believed it would be trivial to build them. He loves to get deeply technical in arcane areas like Photography, Cooking or Origami. \r\n\r\nHe lives in Bangalore with his two adorable kids, lovely wife and an ensemble of superhero action figures.','','2018-12-28 18:35:51.043274','2018-12-28 18:35:51.043274'),(3,'Bass Jobsen','Bass Jobsen has been programming for the Web since 1995, covering everything from C to PHP, and is always on the hunt to find the most accessible interfaces. Based in Orthen, the Netherlands, he has also written Less Web Development Essentials, Packt Publishing, which is a fast-paced tutorial that covers the fundamentals of Less (Leaner CSS) when used in web development. Bass uses Less in his daily job for web design tasks, WordPress theme development, and other Twitter Bootstrap apps. He is always happy to help those with questions (http://stackoverflow.com/users/1596547/bass-jobsen), and he writes a blog you can find at http://bassjobsen.weblogs.fm/. Also, check out his Bootstrap WordPress starters theme (JBST) and other projects at GitHub (https://github.com/bassjobsen).','','2018-12-28 18:40:14.224673','2018-12-28 18:40:14.224673'),(4,'Amin Meyghani','Amin is a JavaScript developer passionate about teaching. You can find his works and tutorials on his website at meyghani.com','','2018-12-28 18:40:58.632064','2018-12-28 18:40:58.632064'),(5,'Matt Stauffer','Matt Stauffer is a developer and a teacher. He is a partner and technical director at Tighten Co., blogs at mattstauffer.co, and hosts The Five-Minute Geek Show and the Laravel Podcast.','','2018-12-28 18:45:46.751120','2018-12-28 18:45:46.751120'),(6,'David Flanagan','David Flanagan is a computer programmer who has spent much of the last 20 years writing books about programming languages. He now works at Mozilla. David lives with his wife and children in the Pacific Northwest, between the cities of Seattle and Vancouver.','david@gmail.com','2018-12-28 18:54:19.599102','2018-12-30 10:20:24.263968'),(7,'Joshua Block','Joshua J. Bloch (born August 28, 1961) is a software engineer and a technology author, formerly employed at Sun Microsystems and Google. He led the design and implementation of numerous Java platform features, including the Java Collections Framework, the java.math package, and the assert mechanism. He is the author of the programming guide Effective Java (2001), which won the 2001 Jolt Award, and is a co-author of two other Java books, Java Puzzlers (2005) and Java Concurrency In Practice (2006).\r\n\r\nBloch holds a B.S. in computer science from Columbia University and a Ph.D. in computer science from Carnegie Mellon University. His 1990 thesis was titled A Practical Approach to Replication of Abstract Data Objects and was nominated for the ACM Distinguished Doctoral Dissertation Award.\r\n\r\nBloch has worked as a Senior Systems Designer at Transarc, and later as a Distinguished Engineer at Sun Microsystems. In June 2004 he left Sun and became Chief Java Architect at Google. On August 3, 2012, Bloch announced that he would be leaving Google.\r\n\r\nIn December 2004, Java Developer\'s Journal included Bloch in its list of the \"Top 40 Software People in the World\".\r\n\r\nBloch has proposed the extension of the Java programming language with two features: Concise Instance Creation Expressions (CICE) (coproposed with Bob Lee and Doug Lea) and Automatic Resource Management (ARM) blocks. The combination of CICE and ARM formed one of the three early proposals for adding support for closures to Java. ARM blocks were added to the language in JDK7.\r\n\r\nBloch is currently a faculty member of the Institute for Software Research at Carnegie Mellon University, where he holds the title \"Professor of the Practice\". In addition to his research, Bloch teaches coursework in Software Engineering.\r\nBio from Wikipedia, the free encyclopedia.','','2018-12-28 19:08:22.967556','2018-12-28 19:08:22.967556'),(8,'Jennifer Robbins','ennifer Niederst Robbins was one of the first designers for the Web. As the designer of O\'Reilly\'s Global Network Navigator (GNN), the first commercial web site, she has been designing for the Web since 1993. She is the author of the bestselling \"Web Design in a Nutshell\" (O\'Reilly), and has taught web design at the Massachusetts College of Art in Boston and Johnson and Wales University in Providence. She has spoken at major design and Internet events including SXSW Interactive, Seybold Seminars, the GRAFILL conference (Geilo, Norway), and one of the first W3C International Expos.','','2018-12-28 19:12:44.528476','2018-12-28 19:12:44.528476'),(9,'Basarat Syed','Basarat Ali Syed is a senior developer and the go-to guy for frontend at PicnicSoftware (http://picnicsoftware.com/) in Melbourne, Australia. He studied Master of Computing at Australian National University and graduated with high distinction in all courses. He is a familiar face at developer meetups and conferences in Australia and has been a speaker at events like Alt.NET, DDDMelbourne, MelbJS, and Melbourne Node.js, amongst others. He is deeply passionate about web technologies and strongly believes that whenever given a choice, one should always bet on JavaScript. He is a respected member of the TypeScript community and works on the DefinitelyTyped team (https://github.com/DefinitelyTyped). He believes Node.js can do for the back-end what Chrome did for the front-end. In his spare time he enjoys bodybuilding, cycling and maintains a YouTube channel for helping fellow developers (http://youtube.com/basaratali). You can easily find him on twitter/basarat and github/basarat.','','2019-01-16 09:55:35.796821','2019-01-16 09:55:35.796857'),(10,'Gregory A. Freeman','Gregory A. Freeman is an award-winning writer with more than 25 years experience in journalism and narrative nonfiction. Known for writing books that make a true story read like a gripping, fast paced novel, Freeman is quickly becoming one of the most respected and successful authors in the field of narrative nonfiction. \n\nFreeman\'s books are scrupulously researched and entirely factual, yet they read more like novels because he weaves the \"stranger than fiction\" personal stories of his subjects into a compelling narrative. Each project requires intensive research - getting to know the subjects personally and probing for previously undisclosed documents. Freeman also explores the subject matter himself, whether that means flying onto the deck of an aircraft carrier at sea or gaining access to the most restricted parts of the Guantanamo Bay, Cuba, military prison. But the most important parts of the books are the often intensely personal, emotional interviews with the men and women who were there. Their personal stories make up the heart of Freeman\'s work, the part that most connects with the reader.\n\nIn addition to his books, Freeman writes for a wide range of magazines and other publications, including Reader\'s Digest, Rolling Stone, American History, and World War II.\n\nFreeman has won more than a dozen awards for his writing, including the coveted Sigma Delta Chi Award for Excellence from the Society of Professional Journalists - twice in five years. He attended the University of Georgia in Athens and began his writing career there, working for newspapers while studying journalism and political science.\n\nAfter receiving his degree, he went on to work for The Associated Press in Atlanta and then spent several years as executive editor of a publishing company. He then became a freelance writer, editor, and author. \n\nKnown for writing narrative nonfiction that makes a true story read like a gripping, fast paced novel, Freeman’s latest work is The Gathering Wind: Hurricane Sandy, the Sailing Ship Bounty, and a Courageous Rescue at Sea, released October 29, 2013, by New American Library, an imprint of Penguin Books. This book tells the story of the tall sailing Bounty, which was lost off the coast of North Carolina during Hurricane Sandy in October 2012. Answering many of the questions prompted by that terrible loss, The Gathering Wind is a compelling drama about the crew, the Coast Guard rescuers, and the investigations that followed.\n\nFreeman’s earlier book The Last Mission of the Wham Bam Boys tells the story of a World War II bomber crew that is shot down over Germany and then lynched by local townspeople, leading to the first war crimes trial after the conflict ended. Kirkus Reviews called it “A chilling tale” and “a riveting narrative.”\n\nFreeman also published Troubled Water: Race, Mutiny and Bravery on the USS Kitty Hawk in September 2009, also with Palgrave Macmillan. Troubled Water tells a little known story of a race riot on the carrier Kitty Hawk in 1972, focusing on the two senior officers who will determine whether this already tragic episode ends peacefully or spirals down into one of the darkest moments in Navy history. Just prior to that, Freeman co-authored a book with Col. Larry C. James, the U.S. Army psychologist who was sent to stop the abuse at the notorious military prison in Abu Ghraib, Iraq. Fixing Hell: An Army Psychologist Confronts Evil at Abu Ghraib, released in August 2008, tells the harrowing tale of a man struggling to be both a military officer and a medical professional, while also revealing previously unknown details about the prison scandal and how the system was improved.\n\nJames Bradley, bestselling author of Flags of Our Fathers, Flyboys, and The Imperial Cruise praises Freeman as a talented author whose books provide an important service to the country. Bradley says of Freeman\'s latest, Troubled Water: \"Gregory Freeman has dug out the true hidden story of the first mutiny in the history of the U.S. Navy. You\'ll enjoy this high-seas thriller.\"\n\nFreeman won wide acclaim for The Forgotten 500: The Untold Story of the Men Who Risked All for the Greatest Rescue Mission of World War II, published in 2007 by New American Library. This popular book tells the fascinating but previously unknown story of Operation Halyard, a super secret and ultra risky rescue mission to save downed American airmen in Nazi-occupied Yugoslavia. Malcolm McConnell, #1 New York Times bestselling coauthor of American Soldier, says of The Forgotten 500: \"Freeman chronicles [the story] with a master\'s touch for detail. Although this book reads like a fast paced novel, it is based on scores of probing interviews and meticulous archival research.\" Gregg Olsen, New York Times bestselling author of The Deep Dark, says The Forgotten 500 is \"a literary and journalistic achievement of the highest order, a book that illuminates, thrills and reminds us that heroes sometimes do live among us. It will take your breath away.\"\n\nBefore that, Freeman saw great success with Sailors to the End: The Deadly Fire on the USS Forrestal and the Heroes Who Fought It, originally published in July 2002 by William Morrow. In Sailors to the End, Freeman tells the story of the young men aboard an aircraft carrier in 1967, following their life-and-death struggles through an accidental fire that threatens to destroy the world\'s most powerful ship. Sailors to the End was enthusiastically embraced by the military community and general interest readers alike. One reviewer said, \"The book grabs readers and leaves them emotionally exhausted. In particular, the description of the death of sailor James Blaskis in a remote and inaccessible part of the ship cannot leave a reader unmoved.\" A Kirkus Reviews writer called Sailors to the End \"a compassionate account of a dramatic incident in modern naval history, told with cinematic immediacy and narrative skill.\" Senator John McCain, who was injured in the fire, endorsed the book and called it \"a riveting account\" that honors the men who died. \n\nIn Lay This Body Down: The 1921 Murders of Eleven Plantation Slaves, Freeman paints a vivid picture of a plantation run with slave labor 56 years after the Civil War. Melissa Fay Greene, author of The Temple Bombing and Praying for Sheetrock, called Lay This Body Down a \"magnificently well-written book.\" Library Journal\'s Robert C. Jones wrote that \"this moving narrative account is arguably the most complete history of this event available.\"\n\n\n','','2019-01-19 07:17:54.742273','2019-01-19 07:17:54.742306'),(11,'James Stewart','ames Stewart received the M.S. degree from Stanford University and the Ph.D. from the University of Toronto. After two years as a postdoctoral fellow at the University of London, he became Professor of Mathematics at McMaster University. His research has been in harmonic analysis and functional analysis. Stewart’s books include a series of high school textbooks as well as a best-selling series of calculus textbooks. He is also co-author, with Lothar Redlin and Saleem Watson, of a series of college algebra and precalculus textbooks. Translations of his books include those in Spanish, Portuguese, French, Italian, Korean, Chinese, Greek, and Indonesian. \n\nA talented violinst, Stewart was concertmaster of the McMaster Symphony Orchestra for many years and played professionally in the Hamilton Philharmonic Orchestra. Having explored connections between music and mathematics, Stewart has given more than 20 talks worldwide on Mathematics and Music and is planning to write a book that attempts to explain why mathematicians tend to be musical.\n\nStewart was named a Fellow of the Fields Institute in 2002 and was awarded an honorary D.Sc. in 2003 by McMaster University. The library of the Fields Institute is named after him. The James Stewart Mathematics Centre was opened in October, 2003, at McMaster University.','','2019-01-19 07:29:46.216704','2019-01-19 07:29:46.216737'),(12,'Keir Radnedge','Keir Radnedge has been covering soccer for more than 50 years and has written countless books on the subject, from tournament guides to comprehensive and highly respected encyclopedias. His distinguished career in journalism includes covering sport for the Daily Mail, the Guardian, and other newspapers and magazines in the UK and internationally. He is a former editor of World Soccer, generally recognized as the premier English-language magazine on global soccer. In addition to his writing, Keir has been a regular analyst for cable television news channel CNN and in the UK for BBC radio and television, as well as Sky Sports.','','2019-01-19 07:36:12.841818','2019-01-19 07:36:12.841852'),(13,'Δεδούκος Σταύρος','Ο Σταύρος Δεδούκος γεννήθηκε στο Περιστέρι το 1966. Είναι υπεύθυνος προγράμματος σπουδών του I.A.F.A. (International Aerobic and Fitness Association) College όπως και του προγράμματος στα I.A.F.A. Weight Training School Ελλάδας και Κύπρου. Σπούδασε μεταξύ των άλλων στη Ν.Ο.Ε. του Αριστοτελείου Πανεπιστημίου και στο Τ.Ε.Φ.Α.Α. Αθηνών. Έχει γράψει 20 βιβλία, εκπαιδευτικά εγχειρίδια και οδηγούς ενημέρωσης για καθηγητές Φυσικής Αγωγής και διατροφολόγους και έχει δημοσιεύσει πάνω από 200 άρθρα σε επιστημονικά και ευρείας κυκλοφορίας περιοδικά.','','2019-01-19 07:43:48.050645','2019-01-19 07:43:48.050676'),(14,'Τσούμος Φώτης','','','2019-01-19 07:44:15.968297','2019-01-19 07:44:15.968356'),(15,'Μποζαμπαλίδης Αρτέμιος','','','2019-01-19 07:54:49.398356','2019-01-19 07:54:49.398403'),(16,'Stephen King','Ο Στίβεν Κινγκ γεννήθηκε το 1947 στο Πόρτλαντ του Μέιν. Tο πρώτο μυθιστόρημά του, Κάρι, εκδόθηκε το 1974. Σήμερα, με περισσότερα από σαράντα μυθιστορήματα και διακόσια διηγήματα στο ενεργητικό του, αναγνωρίζεται παγκοσμίως ως ο κορυφαίος τεχνίτης του τρόμου και της φαντασίας αλλά και ως ένας από τους σημαντικότερους συγγραφείς της εποχής μας.\n\nΈχει επανειλημμένα αποσπάσει το Διεθνές Βραβείο Φαντασίας, τα βραβεία Bram Stoker, O.Henry, Nebula και άλλα, ενώ τιμήθηκε για το σύνολο του έργου του από την Ένωση Συγγραφέων Τρόμου.\nTο 2003 το Εθνικό Ίδρυμα Βιβλίου των ΗΠΑ του απένειμε το Μετάλλιο Διακεκριμένης Συνεισφοράς στα Αμερικανικά Γράμματα. Πολλά μυθιστορήματα και νουβέλες του έχουν γίνει ταινίες για τον κινηματογράφο και την τηλεόραση· ανάμεσά τους η Λάμψη και το Μίζερι, καθώς και οι υποψήφιες για Όσκαρ καλύτερης ταινίας Έκρηξη Οργής (Κάρι), Στάσου Πλάι Μου, Ρίτα Χέιγουορθ: Τελευταία Έξοδος και Το Πράσινο Μίλι. \n\nΞεχωριστή θέση ανάμεσα στα έργα του κατέχει Ο Μαύρος Πύργος, το επτάτομο έπος φαντασίας που από πολλούς θεωρήθηκε το κορυφαίο της καριέρας του.','','2019-01-19 08:06:29.036406','2019-01-19 08:06:29.036441'),(17,'J.K. Rowling','J.K. Rowling is the author of the record-breaking, multi-award-winning Harry Potter novels. Loved by fans around the world, the series has sold more than 500 million copies, been translated into 80 languages and made into eight blockbuster films. \n\nShe has written three companion volumes in aid of charity: Quidditch Through the Ages and Fantastic Beasts and Where to Find Them (in aid of Comic Relief and Lumos), and The Tales of Beedle the Bard (in aid of Lumos). \n\nIn 2012, J.K. Rowling’s digital company and digital publisher Pottermore was launched, a place where fans can enjoy the latest news from across the wizarding world, features and original writing by J.K. Rowling. \n\nHer first novel for adult readers, The Casual Vacancy, was published in September 2012 and adapted for TV by the BBC in 2015. J.K. Rowling also writes crime novels under the pseudonym Robert Galbraith, featuring private detective Cormoran Strike. The first four novels The Cuckoo’s Calling (2013), The Silkworm (2014), Career of Evil (2015) and Lethal White (2018) all topped the national and international bestseller lists. The first three have been adapted for television, produced by Brontë Film and Television. \n\nJ.K. Rowling’s 2008 Harvard commencement speech was published in 2015 as an illustrated book, Very Good Lives: The Fringe Benefits of Failure and the Importance of Imagination, and sold in aid of Lumos and university-wide financial aid at Harvard.\n\nIn 2016, J.K. Rowling collaborated with writer Jack Thorne and director John Tiffany on the stage play Harry Potter and the Cursed Child Parts One and Two, which is now running at The Palace Theatre in London’s West End and at The Lyric Theatre on Broadway. \n\nAlso in 2016, J.K. Rowling made her screenwriting debut with the film Fantastic Beasts and Where to Find Them. A prequel to the Harry Potter series, this new adventure of Magizoologist Newt Scamander marked the start of a five-film series to be written by the author. The second film in the series, Fantastic Beasts: The Crimes of Grindelwald was released in November 2018.\n\nThe script book of the play Harry Potter and the Cursed Child Parts One and Two was published in 2016. The original screenplays of the Fantastic Beasts films are published too: Fantastic Beasts and Where to Find Them (2016) and Fantastic Beasts: The Crimes of Grindelwald (2018).\n\nAs well as receiving an OBE and Companion of Honour for services to children’s literature, J.K. Rowling has received many awards and honours, including France’s Légion d’Honneur and the Hans Christian Andersen Award. ','','2019-01-29 16:54:29.769164','2019-01-29 16:54:29.769229');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `author_list`
--

DROP TABLE IF EXISTS `author_list`;
/*!50001 DROP VIEW IF EXISTS `author_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `author_list` AS SELECT 
 1 AS `id`,
 1 AS `author_name`,
 1 AS `bio`,
 1 AS `email`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `books`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(50) NOT NULL,
  `pages` smallint(5) unsigned NOT NULL,
  `dimensions` varchar(50) NOT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  `revision` smallint(5) unsigned NOT NULL,
  `abstract` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL,
  `published_month` smallint(5) unsigned DEFAULT NULL,
  `published_year` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_language_id_6c11437e_fk_language_id` (`language_id`),
  KEY `book_publisher_id_ac4b162a_fk_publisher_id` (`publisher_id`),
  CONSTRAINT `book_language_id_6c11437e_fk_language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`),
  CONSTRAINT `book_publisher_id_ac4b162a_fk_publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Learning Vue.js 2','9781786469946',334,'7.5 x 0.8 x 9.2 inches',680,1,'Vue.js is one of the latest new frameworks to have piqued the interest of web developers due to its reactivity, reusable components, and ease of use.\r\n\r\nThis book shows developers how to leverage its features to build high-performing, reactive web interfaces with Vue.js. From the initial structuring to full deployment, this book provides step-by-step guidance to developing an interactive web interface from scratch with Vue.js.\r\n\r\nYou will start by building a simple application in Vue.js which will let you observe its features in action. Delving into more complex concepts, you will learn about reactive data binding, reusable components, plugins, filters, and state management with Vuex. This book will also teach you how to bring reactivity to an existing static application using Vue.js. By the time you finish this book you will have built, tested, and deployed a complete reactive application in Vue.js from scratch.','book_covers/vuejs2.jpg','2018-12-28 18:24:26.658143','2018-12-28 18:24:26.658143',1,1,12,2016),(2,'Django Design Patterns and Best Practices','9781783986644',180,'7.5 x 0.5 x 9.2 inches',499,1,'Learning how to write better Django code to build more maintainable websites either takes a lot of experience or familiarity with various design patterns. Filled with several idiomatic Django patterns, Django Design Patterns and Best Practices accelerates your journey into the world of web development.\r\n\r\nDiscover a set of common design problems, each tackling aspects of Django including model design and Views, and learn several recommended solutions with useful code examples and illustrations. You\'ll also get to grips with the current best practices in the latest versions of Django and Python. Creating a successful web application involves much more than Django, so advanced topics including REST, testing, debugging, security, and deployment are also explored in detail.','book_covers/django1.jpg','2018-12-28 18:36:02.057124','2018-12-28 18:36:02.057124',1,1,3,2015),(3,'Less Web Development Cookbook','1783981482',299,'7.5 x 0.9 x 9.2 inches',862,1,'Less is a dynamic style sheet language to help you make your CSS code more maintainable, readable, and reusable. It provides impressive features to enhance your web development skills with complex code techniques necessary for responsive websites.\r\n\r\nThis book contains more than 110 practical recipes to help you develop efficient projects through CSS extensions including variables, mixins, and functions. Optimize your projects by debugging code to create style guides, build responsive grids, and integrate Less into your WordPress development workflow.\r\n\r\nThis book includes Less v2 code and covers powerful tools such as Bootstrap and a wide-range of additional prebuilt mixin libraries, allowing you to set up a powerful development environment with Node.js and Grunt.','book_covers/lessweb.jpg','2018-12-28 18:41:12.727372','2018-12-28 18:41:12.727372',1,1,1,2015),(4,'Laravel: Up and Running','1491936088',454,'7 x 1 x 9.2 inches',771,1,'What sets Laravel apart from other PHP web frameworks? Speed and simplicity, for starters. This rapid application development framework and its vast ecosystem of tools let you quickly build new sites and applications with clean, readable code. With this practical guide, Matt Stauffer--a leading teacher and developer in the Laravel community--provides the definitive introduction to one of today\'s most popular web frameworks.\r\n\r\nThe book\'s high-level overview and concrete examples will help experienced PHP web developers get started with Laravel right away. By the time you reach the last page, you should feel comfortable writing an entire application in Laravel from scratch.','book_covers/laravel.jpg','2018-12-28 18:45:56.606487','2018-12-28 18:45:56.606487',1,2,12,2016),(5,'JavaScript: The Definitive Guide','0596805527',1096,'7 x 2.4 x 9.2 inches',1769,6,'Since 1996, JavaScript: The Definitive Guide has been the bible for JavaScript programmers—a programmer\'s guide and comprehensive reference to the core language and to the client-side JavaScript APIs defined by web browsers.\r\n\r\nThe 6th edition covers HTML5 and ECMAScript 5. Many chapters have been completely rewritten to bring them in line with today\'s best web development practices. New chapters in this edition document jQuery and server side JavaScript. It\'s recommended for experienced programmers who want to learn the programming language of the Web, and for current JavaScript programmers who want to master it.\r\n\r\n\"A must-have reference for expert JavaScript programmers...well-organized and detailed.\"\r\n—Brendan Eich, creator of JavaScript, CTO of Mozilla\r\n\r\n\"I made a career of what I learned from JavaScript: The Definitive Guide.”\r\n—Andrew Hedges, Tapulous','book_covers/javascript.jpg','2018-12-28 18:54:25.542019','2018-12-28 18:54:25.542019',1,2,5,2011),(6,'jQuery Pocket Reference','1449397220',160,'4.2 x 0.4 x 7 inches',68,1,'\"As someone who uses jQuery on a regular basis, it was surprising to discover how much of the library I’m not using. This book is indispensable for anyone who is serious about using jQuery for non-trivial applications.\"-- Raffaele Cecco, longtime developer of video games, including Cybernoid, Exolon, and Stormlord\r\n\r\n\r\njQuery is the \"write less, do more\" JavaScript library. Its powerful features and ease of use have made it the most popular client-side JavaScript framework for the Web. Ideal for JavaScript developers at all skill levels, this book is jQuery\'s trusty companion: the definitive \"read less, learn more\" guide to the library.\r\n\r\njQuery Pocket Reference explains everything you need to know about jQuery, completely and comprehensively.','book_covers/jquery.jpg','2018-12-28 18:59:47.565111','2018-12-28 18:59:47.565111',1,2,1,2011),(7,'The Ruby Programming Language','0596516177',448,'7 x 0.9 x 9.2 inches',544,1,'This book begins with a quick-start tutorial to the language, and then explains the language in detail from the bottom up: from lexical and syntactic structure to datatypes to expressions and statements and on through methods, blocks, lambdas, closures, classes and modules.\r\n\r\nThe book also includes a long and thorough introduction to the rich API of the Ruby platform, demonstrating -- with heavily-commented example code -- Ruby\'s facilities for text processing, numeric manipulation, collections, input/output, networking, and concurrency. An entire chapter is devoted to Ruby\'s metaprogramming capabilities.\r\n\r\nThe Ruby Programming Language documents the Ruby language definitively but without the formality of a language specification. It is written for experienced programmers who are new to Ruby, and for current Ruby programmers who want to challenge their understanding and increase their mastery of the language.','book_covers/ruby.jpg','2018-12-28 19:02:35.149318','2019-01-17 18:34:36.596606',1,2,2,2008),(8,'Effective Java','0134685997',412,'7.4 x 0.9 x 9 inches',726,3,'Java has changed dramatically since the previous edition of Effective Java was published shortly after the release of Java 6. This Jolt award-winning classic has now been thoroughly updated to take full advantage of the latest language and library features. The support in modern Java for multiple paradigms increases the need for specific best-practices advice, and this book delivers.\r\n \r\nAs in previous editions, each chapter of Effective Java, Third Edition, consists of several “items,” each presented in the form of a short, stand-alone essay that provides specific advice, insight into Java platform subtleties, and updated code examples. The comprehensive descriptions and explanations for each item illuminate what to do, what not to do, and why.\r\n\r\nThe third edition covers language and library features added in Java 7, 8, and 9, including the functional programming constructs that were added to its object-oriented roots. Many new items have been added, including a chapter devoted to lambdas and streams.','book_covers/java.jpg','2018-12-28 19:08:33.745409','2018-12-28 19:08:33.745409',1,3,1,2018),(9,'Learning Web Design','1491960205',808,'8 x 1.2 x 9.6 inches',1860,5,'The web has been around for more than 25 years now, experiencing euphoric early expansion, an economic-driven bust, an innovation-driven rebirth, and constant evolution along the way. One thing is certain: the web as a communication and commercial medium is here to stay. Not only that, it has found its way onto devices such as smartphones, tablets, TVs, and more. There have never been more opportunities to put web design know-how to use.\r\n\r\nWhatever the motivation, the first question is always the same: “Where do I start?” It may seem like there is a mountain of stuff to learn, and it’s not easy to know where to jump in. But you have to start somewhere.\r\n\r\nLearning Web Design is a complete introductory-level course in web design and production. It is divided into six parts: basic background information about the web and web design, HTML, CSS, JavaScript, web image production, and appendices. Since hands-on experience is the best way to learn, this book includes exercises throughout every lesson. Online materials are provided though a companion website to work along with the book.\r\n\r\nYou’ll begin from square one, learning how the web and web pages work, then steadily build from there. Along the way, there are hands-on exercises and short quizzes to make sure you understand key concepts. By the end of the book, you’ll have the skills to create a simple multi-column site that works on all screen sizes.\r\n\r\nLearning Web Design, Fifth Edition, is divided into six parts, each dealing with an important aspect of web development.','book_covers/webdesign.jpg','2018-12-28 19:12:50.243397','2018-12-28 19:12:50.243397',1,2,5,2018),(10,'Beginning Node.js','9781484201886',308,'7 x 0.7 x 10 inches',680,1,'Beginning Node.js is your step-by-step guide to learning all the aspects of creating maintainable Node.js applications. You will see how Node.js is focused on creating high-performing, highly-scalable websites, and how easy it is to get started. Many front-end devs regularly work with HTML, CSS, PHP, even WordPress, but haven\'t yet got started with Node.js. This book explains everything for you from a beginner level, enabling you to start using Node.js in your projects right away.\r\nUsing this book you will learn important Node.js concepts for server-side programming. You will begin with an easy-to-follow pure JavaScript primer, which you can skip if you\'re confident of your JS skills. You\'ll then delve into Node.js concepts such as streams and events, and the technology involved in building full-stack Node.js applications. You\'ll also learn how to test your Node.js code, and deploy your Node.js applications on the internet.\r\n\r\nNode.js is a great and simple platform to work with. It is lightweight, easy to deploy and manage. You will see how using Node.js can be a fun and rewarding experience - start today with Beginning Node.js.','book_covers/nodejs_Vi9srOB.jpg','2019-01-16 09:55:42.494049','2019-01-16 10:13:57.026826',1,4,11,2014),(11,'The Forgotten 500','0451224957',336,'6 x 0.8 x 9 inches',340,1,'The astonishing, never before told story of the greatest rescue mission of World War II—when the OSS set out to recover more than 500 airmen trapped behind enemy lines in Yugoslavia...\r\n\r\nDuring a bombing campaign over Romanian oil fields, hundreds of American airmen were shot down in Nazi-occupied Yugoslavia. Local Serbian farmers and peasants risked their own lives to give refuge to the soldiers while they waited for rescue, and in 1944, Operation Halyard was born. The risks were incredible. The starving Americans in Yugoslavia had to construct a landing strip large enough for C-47 cargo planes—without tools, without alerting the Germans, and without endangering the villagers. And the cargo planes had to make it through enemy airspace and back—without getting shot down themselves.\r\n \r\nClassified for over half a century for political reasons, the full account of this unforgettable story of loyalty, self-sacrifice, and bravery is now being told for the first time ever. The Forgotten 500 is the gripping, behind-the-scenes look at the greatest escape of World War II.\r\n\r\n“Amazing [and] riveting.”—James Bradley, New York Times bestselling author of Flags of Our Fathers','book_covers/forgotten500.jpg','2019-01-19 07:25:50.859400','2019-01-19 07:25:50.859449',1,6,9,2008),(12,'Calculus: Early Transcendentals','9781285741550',1368,'9 x 2 x 10 inches',2630,8,'Success in your calculus course starts here! James Stewart\'s CALCULUS: EARLY TRANSCENDENTALS texts are world-wide best-sellers for a reason: they are clear, accurate, and filled with relevant, real-world examples. With CALCULUS: EARLY TRANSCENDENTALS, Eighth Edition, Stewart conveys not only the utility of calculus to help you develop technical competence, but also gives you an appreciation for the intrinsic beauty of the subject. His patient examples and built-in learning aids will help you build your mathematical confidence and achieve your goals in the course.','book_covers/calculus.jpg','2019-01-19 07:32:46.116660','2019-01-19 07:32:46.116701',1,7,4,2015),(13,'World Soccer Records 2018','1787390136',256,'8 x 0.8 x 10.5 inches',1133,9,'An updated edition of the bestselling guide to the world’s most popular sport!\r\nSoccer’s profile has never been higher—and it continues to grow. Illustrated with 575 photos, along with numerous cutouts and innovative background designs, this revised edition of World Soccer Records is a must for every fan. It contains the latest record-breaking achievements, including a sidebar with key stats, updates, and records for most of the other 172 full members of FIFA, and Top 10 lists of the most-capped players and leading goal scorers for all 37 featured nations.\r\nThis revised edition features the same successful formula, but now with exciting new features, including:\r\n• Updates for all recent major tournaments, including: 2017 FIFA Confederations Cup Russia\r\n• 2017 CAF Africa Cup of Nations Gabon\r\n• CONCACAF 2017 Copa Centroamericana Panama\r\n• 2018 FIFA World Cup Russia qualifiers\r\n• FIFA 2016 Club World Cup Japan\r\n• FIFA 2017 U-20 World Cup Korea Republic\r\n• FIFA Ballon d’Or 2016\r\n• Other FIFA awards\r\n• FIFA/Cola-Cola World Rankings','book_covers/soccer.jpg','2019-01-19 07:39:57.561097','2019-01-19 07:39:57.561142',1,8,11,2017),(14,'Γυμναστική στην τρίτη ηλικία','9607378253',140,'24 X 17 cm',NULL,1,'Χρήσιμες πληροφορίες, ενδεικτικές ασκήσεις, προγράμματα γυμναστικής και βασικές συμβουλές για την επιλογή των κατάλληλων μέσων και τρόπων εκγύμνασης','book_covers/b60600.jpg','2019-01-19 07:45:28.921360','2019-01-19 07:58:21.154667',4,9,8,2001),(15,'Βοτανική','9789601222080',486,'24 Χ 14 cm',1200,1,'Μορφολογία και ανατομία φυτών','book_covers/b201361.jpg','2019-01-19 07:56:26.566628','2019-01-19 07:56:26.566671',4,10,4,2015),(16,'Τέλος βάρδιας','9604618180',512,'14x21 cm',NULL,1,'Ο Μπρέιντι επιστρέφει. Το ίδιο και ο Χότζες!\r\n\r\nO Μπρέιντι Χάρτσφιλντ, ο περιβόητος «Δολοφόνος με τη Μερσέντες», βρίσκεται τα τελευταία πέντε χρόνια καθηλωμένος σε κωματώδη κατάσταση στο δωμάτιο 217 της Κλινικής Εγκεφαλικών Βλαβών Λέικς Ρίτζιον και, σύμφωνα με τους γιατρούς, δεν έχει καμία πιθανότητα ανάρρωσης. \r\n\r\nΟ Μπιλ Χότζες με τη συνεργάτιδά του Χόλι Γκίμπνι αναλαμβάνουν να εξιχνιάσουν το μυστήριο μιας σειράς δολοφονιών που –παραδόξως– μοιάζουν όλες να συνδέονται με τον κύριο Μερσέντες. \r\nΌμως, αυτό είναι αδύνατον…\r\n\r\nΣύντομα αποδεικνύεται ότι κάτι διαβολικό έχει ξυπνήσει στο δωμάτιο 217. Ο Μπρέιντι Χάρτσφιλντ διαθέτει νέες ικανότητες που μπορούν να σκορπίσουν τον θάνατο, και σχεδιάζει να εκδικηθεί, όχι μόνο τον Χότζες και τους φίλους του, αλλά μια ολόκληρη πόλη. Και η αντίστροφη μέτρηση έχει ξεκινήσει…\r\n\r\nΤο Τέλος Βάρδιας είναι το εντυπωσιακό –και πολυαναμενόμενο– φινάλε της τριλογίας (Ο κύριος Μερσέντες και Ό,τι βρεις, δικό σου) με πρωταγωνιστή τον Μπιλ Χότζες!','book_covers/shift.jpg','2019-01-19 08:07:49.612564','2019-01-19 08:07:49.612618',4,11,1,2018),(17,'Harry Potter and the Chamber of Secrets','9780439064866',352,'6.2 x 1.5 x 9.8 inches',725,1,'Between the new spirit spooking his school and the mysterious forces that turn students into stone, Harry has a lot on his mind as he begins his second year at Hogwarts School of Witchcraft and Wizardry.','book_covers/harry1.jpg','2019-01-29 16:57:31.037107','2019-01-29 16:57:31.037195',1,12,7,1999);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_authors`
--

DROP TABLE IF EXISTS `book_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_authors_book_id_author_id_96c38d5f_uniq` (`book_id`,`author_id`),
  KEY `book_authors_author_id_ea39dbe4_fk_author_id` (`author_id`),
  CONSTRAINT `book_authors_author_id_ea39dbe4_fk_author_id` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `book_authors_book_id_a678937d_fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_authors`
--

LOCK TABLES `book_authors` WRITE;
/*!40000 ALTER TABLE `book_authors` DISABLE KEYS */;
INSERT INTO `book_authors` VALUES (1,1,1),(2,2,2),(3,3,3),(4,3,4),(5,4,5),(6,5,6),(7,6,6),(8,7,6),(9,8,7),(10,9,8),(11,10,9),(12,11,10),(13,12,11),(14,13,12),(15,14,13),(16,14,14),(17,15,15),(18,16,16),(19,17,17);
/*!40000 ALTER TABLE `book_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `book_best_choices`
--

DROP TABLE IF EXISTS `book_best_choices`;
/*!50001 DROP VIEW IF EXISTS `book_best_choices`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_best_choices` AS SELECT 
 1 AS `book_id`,
 1 AS `total_lends`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `book_categories`
--

DROP TABLE IF EXISTS `book_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `book_categories_book_id_category_id_fb91c271_uniq` (`book_id`,`category_id`),
  KEY `book_categories_category_id_c90d73b6_fk_category_id` (`category_id`),
  CONSTRAINT `book_categories_book_id_7573d0c9_fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `book_categories_category_id_c90d73b6_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_categories`
--

LOCK TABLES `book_categories` WRITE;
/*!40000 ALTER TABLE `book_categories` DISABLE KEYS */;
INSERT INTO `book_categories` VALUES (1,1,26),(2,2,26),(3,3,26),(4,4,26),(5,5,26),(6,6,26),(7,7,26),(8,8,26),(9,9,26),(10,10,26),(11,11,11),(12,12,8),(13,13,1),(14,14,1),(15,15,19),(16,16,16),(17,17,21);
/*!40000 ALTER TABLE `book_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `book_data`
--

DROP TABLE IF EXISTS `book_data`;
/*!50001 DROP VIEW IF EXISTS `book_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_data` AS SELECT 
 1 AS `book_id`,
 1 AS `num_entries`,
 1 AS `active_lends`,
 1 AS `available`,
 1 AS `active_holds`,
 1 AS `total_lends`,
 1 AS `num_comments`,
 1 AS `num_stars1`,
 1 AS `num_stars2`,
 1 AS `num_stars3`,
 1 AS `num_stars4`,
 1 AS `num_stars5`,
 1 AS `sum_stars`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `book_newest`
--

DROP TABLE IF EXISTS `book_newest`;
/*!50001 DROP VIEW IF EXISTS `book_newest`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_newest` AS SELECT 
 1 AS `book_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `book_top_titles`
--

DROP TABLE IF EXISTS `book_top_titles`;
/*!50001 DROP VIEW IF EXISTS `book_top_titles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `book_top_titles` AS SELECT 
 1 AS `book_id`,
 1 AS `grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Αθλητισμός','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(2,'Αυτοβελτίωση','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(3,'Βιογραφίες','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(4,'Εγκυκλοπαίδειες','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(5,'Εκμάθηση γλωσσών','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(6,'Επιχειρήσεις','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(7,'Εφηβικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(8,'Θετικές Επιστήμες','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(9,'Θρησκεία - Πνευματικότητα','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(10,'Ιατρική','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(11,'Ιστορία','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(12,'Καλές Τέχνες','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(13,'Κοινωνικές και ανθρωπιστικές επιστήμες','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(14,'Κόμικς','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(15,'Λεξικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(16,'Λογοτεχνία','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(17,'Μαγειρική','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(18,'Οικογένεια','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(19,'Οικολογία - Περιβάλλον','2018-12-22 00:00:00.000000','2019-01-19 07:33:59.936883'),(20,'Παιδαγωγική','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(21,'Παιδικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(22,'Περιοδικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(23,'Πολιτική - Κοινωνία','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(24,'Σχολικά βιβλία και βοηθήματα','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(25,'Ταξίδια','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(26,'Τεχνολογία','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(27,'Υγεία - Σώμα - Διατροφή','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(28,'Χάρτες & άτλαντες','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(29,'Ψυχαγωγία','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `category_list`
--

DROP TABLE IF EXISTS `category_list`;
/*!50001 DROP VIEW IF EXISTS `category_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `category_list` AS SELECT 
 1 AS `id`,
 1 AS `description`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `books`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stars` smallint(5) unsigned NOT NULL,
  `body` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_book_id_5a54ef00_fk_book_id` (`book_id`),
  KEY `comment_user_id_2224f9d1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `comment_book_id_5a54ef00_fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `comment_user_id_2224f9d1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (27,3,'test1','2019-01-05 18:01:33.358477','2019-01-06 10:10:52.502960',9,1),(28,2,'','2019-01-06 07:42:00.000000','2019-01-11 21:14:13.524612',3,1),(29,3,'','2019-01-06 12:56:43.304632','2019-01-06 12:56:43.305631',5,3),(30,1,'','2019-01-06 20:07:13.616743','2019-01-06 20:07:13.616743',5,1),(31,4,'Καλό!','2019-01-06 20:29:42.073025','2019-01-06 20:29:42.073067',4,1),(32,3,'Καλό εισαγωγικό βιβλίο, εύκολο στην ανάγνωση και με καλή προσέγγιση στις θεμελιώδεις έννοιες.','2019-01-07 05:06:31.622337','2019-01-07 05:06:31.622381',1,4),(33,4,'Αυτό το βιβλίο είναι μια εισαγωγή στις έννοιες που χρειάζεστε για το σχεδιασμό ιστοσελίδων.  Το στυλ γραφής του συγγραφέα είναι εξαιρετικά προσπελάσιμο και σαφές.','2019-01-07 05:10:35.448886','2019-01-07 05:10:35.448929',9,4),(34,3,'Μια αποτελεσματική προσέγγιση προκειμένου να αποκτηθεί μια βασική κατανόηση του προγραμματισμού με την Java.','2019-01-07 05:12:38.734573','2019-01-07 05:12:38.734616',8,4),(35,2,'Το βιβλίο είναι εύκολο να το διαβάσετε, αλλά τα κεφάλαια είναι οργανωμένα ώστε να διαβάζονται από την αρχή μέχρι το τέλος.','2019-01-07 05:21:30.150418','2019-01-07 05:21:30.150459',6,4),(36,3,'Το Laravel Up & Running είναι απολύτως το βιβλίο που θα πρότεινα σε όσους ενδιαφέρονται να μάθουν Laravel','2019-01-07 05:24:50.929250','2019-01-07 05:24:50.929285',4,4),(37,4,'Το καλύτερο βιβλίο για Ruby που έχω δει','2019-01-07 05:27:33.324676','2019-01-07 05:27:33.324729',7,4),(38,4,'Ένα αρκετά χρήσιμο βιβλίο για όσους θέλουν να ξεκινήσουν με Laravel','2019-01-08 06:48:11.882076','2019-01-08 06:48:11.882117',4,5),(39,4,'Τρομερό βιβλίο','2019-01-11 10:25:35.946698','2019-01-11 10:25:35.946740',8,6),(40,4,'Ένα καλογραμμένο βιβλίο για το καλύτερο, κατά τη γνώμη μου, javascript framework!!!','2019-01-12 10:39:33.605248','2019-01-12 10:39:33.606300',1,1),(41,2,'Αυτό το βιβλίο είναι μια εισαγωγή στις έννοιες που χρειάζεστε για το σχεδιασμό ιστοσελίδων. Το στυλ γραφής του συγγραφέα είναι εξαιρετικά προσπελάσιμο και σαφές.','2019-01-12 11:08:59.076749','2019-01-12 11:08:59.077728',7,4),(42,4,'Κατάλληλο γι\' αυτούς που ξεκινούν το Node.js χωρίς προηγούμενη εμπειρία σε javascript!','2019-01-16 16:40:23.937166','2019-02-05 09:15:02.856095',10,1),(44,4,'Απλή γραφή και πολύ περιεκτικό','2019-02-05 09:08:37.795420','2019-02-05 09:08:37.796446',10,4),(45,2,'Βιβλίο για παππούδες','2019-02-05 09:22:49.818664','2019-02-05 09:22:49.819766',14,1),(46,5,'Tjhsih dsidisf i','2019-02-06 17:07:42.812694','2019-02-06 17:07:42.870681',17,9);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(2) NOT NULL,
  `description` varchar(100) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'LC','Αγία Λουκία',NULL,NULL),(2,'BL','Άγιος Βαρθολομαίος',NULL,NULL),(3,'VC','Άγιος Βικέντιος και Γρεναδίνες',NULL,NULL),(4,'SM','Άγιος Μαρίνος',NULL,NULL),(5,'MF','Άγιος Μαρτίνος (Γαλλία)',NULL,NULL),(6,'SX','Άγιος Μαρτίνος (Ολλανδία)',NULL,NULL),(7,'KN','Άγιος Χριστόφορος και Νέβις',NULL,NULL),(8,'AZ','Αζερμπαϊτζάν',NULL,NULL),(9,'EG','Αίγυπτος',NULL,NULL),(10,'ET','Αιθιοπία',NULL,NULL),(11,'HT','Αϊτή',NULL,NULL),(12,'CI','Ακτή Ελεφαντοστού',NULL,NULL),(13,'AL','Αλβανία',NULL,NULL),(14,'DZ','Αλγερία',NULL,NULL),(15,'VI','Αμερικανικές Παρθένοι Νήσοι',NULL,NULL),(16,'AS','Αμερικανική Σαμόα',NULL,NULL),(17,'TL','Ανατολικό Τιμόρ',NULL,NULL),(18,'AO','Ανγκόλα',NULL,NULL),(19,'AI','Ανγκουίλα',NULL,NULL),(20,'AD','Ανδόρρα',NULL,NULL),(21,'AQ','Ανταρκτική',NULL,NULL),(22,'AG','Αντίγκουα και Μπαρμπούντα',NULL,NULL),(23,'UM','Απομακρυσμένες Νησίδες των Ηνωμένων Πολιτειών',NULL,NULL),(24,'AR','Αργεντινή',NULL,NULL),(25,'AM','Αρμενία',NULL,NULL),(26,'AW','Αρούμπα',NULL,NULL),(27,'AU','Αυστραλία',NULL,NULL),(28,'AT','Αυστρία',NULL,NULL),(29,'AF','Αφγανιστάν',NULL,NULL),(30,'VU','Βανουάτου',NULL,NULL),(31,'VA','Βατικανό',NULL,NULL),(32,'BE','Βέλγιο',NULL,NULL),(33,'VE','Βενεζουέλα',NULL,NULL),(34,'BM','Βερμούδες',NULL,NULL),(35,'VN','Βιετνάμ',NULL,NULL),(36,'BO','Βολιβία',NULL,NULL),(37,'KP','Βόρεια Κορέα',NULL,NULL),(38,'MP','Βόρειες Μαριάνες Νήσοι',NULL,NULL),(39,'BA','Βοσνία-Ερζεγοβίνη',NULL,NULL),(40,'BG','Βουλγαρία',NULL,NULL),(41,'BR','Βραζιλία',NULL,NULL),(42,'VG','Βρετανικές Παρθένοι Νήσοι',NULL,NULL),(43,'IO','Βρετανικό Έδαφος Ινδικού Ωκεανού',NULL,NULL),(44,'FR','Γαλλία',NULL,NULL),(45,'TF','Γαλλικά Νότια και Ανταρκτικά Εδάφη',NULL,NULL),(46,'GF','Γαλλική Γουιάνα',NULL,NULL),(47,'PF','Γαλλική Πολυνησία',NULL,NULL),(48,'DE','Γερμανία',NULL,NULL),(49,'GE','Γεωργία',NULL,NULL),(50,'GI','Γιβραλτάρ',NULL,NULL),(51,'GM','Γκάμπια',NULL,NULL),(52,'GA','Γκαμπόν',NULL,NULL),(53,'GH','Γκάνα',NULL,NULL),(54,'GG','Γκέρνσεϊ',NULL,NULL),(55,'GU','Γκουάμ',NULL,NULL),(56,'GP','Γουαδελούπη',NULL,NULL),(57,'GT','Γουατεμάλα',NULL,NULL),(58,'GY','Γουιάνα',NULL,NULL),(59,'GN','Γουινέα',NULL,NULL),(60,'GW','Γουινέα-Μπισσάου',NULL,NULL),(61,'GD','Γρενάδα',NULL,NULL),(62,'GL','Γροιλανδία',NULL,NULL),(63,'DK','Δανία',NULL,NULL),(64,'DM','Δομινίκα',NULL,NULL),(65,'DO','Δομινικανή Δημοκρατία',NULL,NULL),(66,'PS','Δυτική Όχθη',NULL,NULL),(67,'EH','Δυτική Σαχάρα',NULL,NULL),(68,'SV','Ελ Σαλβαδόρ',NULL,NULL),(69,'CH','Ελβετία',NULL,NULL),(70,'GR','Ελλάδα',NULL,NULL),(71,'ER','Ερυθραία',NULL,NULL),(72,'EE','Εσθονία',NULL,NULL),(73,'ZM','Ζάμπια',NULL,NULL),(74,'ZW','Ζιμπάμπουε',NULL,NULL),(75,'AE','Ηνωμένα Αραβικά Εμιράτα',NULL,NULL),(76,'US','Ηνωμένες Πολιτείες Αμερικής',NULL,NULL),(77,'GB','Ηνωμένο Βασίλειο',NULL,NULL),(78,'JP','Ιαπωνία',NULL,NULL),(79,'IN','Ινδία',NULL,NULL),(80,'ID','Ινδονησία',NULL,NULL),(81,'JO','Ιορδανία',NULL,NULL),(82,'IQ','Ιράκ',NULL,NULL),(83,'IR','Ιράν',NULL,NULL),(84,'IE','Ιρλανδία',NULL,NULL),(85,'GQ','Ισημερινή Γουινέα',NULL,NULL),(86,'EC','Ισημερινός',NULL,NULL),(87,'IS','Ισλανδία',NULL,NULL),(88,'ES','Ισπανία',NULL,NULL),(89,'IL','Ισραήλ',NULL,NULL),(90,'IT','Ιταλία',NULL,NULL),(91,'KZ','Καζακστάν',NULL,NULL),(92,'CM','Καμερούν',NULL,NULL),(93,'KH','Καμπότζη',NULL,NULL),(94,'CA','Καναδάς',NULL,NULL),(95,'QA','Κατάρ',NULL,NULL),(96,'KY','Κέιμαν Νήσοι',NULL,NULL),(97,'CF','Κεντροαφρικανική Δημοκρατία',NULL,NULL),(98,'KE','Κένυα',NULL,NULL),(99,'CN','Κίνα',NULL,NULL),(100,'KG','Κιργιζία',NULL,NULL),(101,'KI','Κιριμπάτι',NULL,NULL),(102,'CG','Κογκό',NULL,NULL),(103,'CO','Κολομβία',NULL,NULL),(104,'KM','Κομόρες',NULL,NULL),(105,'CR','Κόστα Ρίκα',NULL,NULL),(106,'CU','Κούβα',NULL,NULL),(107,'KW','Κουβέιτ',NULL,NULL),(108,'CW','Κουρασάο',NULL,NULL),(109,'HR','Κροατία',NULL,NULL),(110,'CY','Κύπρος',NULL,NULL),(111,'CD','Λαϊκή Δημοκρατία του Κογκό',NULL,NULL),(112,'LA','Λάος',NULL,NULL),(113,'LS','Λεσότο',NULL,NULL),(114,'LV','Λεττονία',NULL,NULL),(115,'BY','Λευκορωσία',NULL,NULL),(116,'LB','Λίβανος',NULL,NULL),(117,'LR','Λιβερία',NULL,NULL),(118,'LY','Λιβύη',NULL,NULL),(119,'LT','Λιθουανία',NULL,NULL),(120,'LI','Λίχτενσταϊν',NULL,NULL),(121,'LU','Λουξεμβούργο',NULL,NULL),(122,'YT','Μαγιότ',NULL,NULL),(123,'MG','Μαδαγασκάρη',NULL,NULL),(124,'MO','Μακάο',NULL,NULL),(125,'MY','Μαλαισία',NULL,NULL),(126,'MW','Μαλάουι',NULL,NULL),(127,'MV','Μαλδίβες',NULL,NULL),(128,'ML','Μάλι',NULL,NULL),(129,'MT','Μάλτα',NULL,NULL),(130,'MA','Μαρόκο',NULL,NULL),(131,'MQ','Μαρτινίκα',NULL,NULL),(132,'MU','Μαυρίκιος',NULL,NULL),(133,'MR','Μαυριτανία',NULL,NULL),(134,'ME','Μαυροβούνιο',NULL,NULL),(135,'MX','Μεξικό',NULL,NULL),(136,'MM','Μιανμάρ (Βιρμανία)',NULL,NULL),(137,'MN','Μογγολία',NULL,NULL),(138,'MZ','Μοζαμβίκη',NULL,NULL),(139,'MD','Μολδαβία',NULL,NULL),(140,'MC','Μονακό',NULL,NULL),(141,'MS','Μοντσερράτ',NULL,NULL),(142,'BD','Μπανγκλαντές',NULL,NULL),(143,'BB','Μπαρμπάντος',NULL,NULL),(144,'BS','Μπαχάμες',NULL,NULL),(145,'BH','Μπαχρέιν',NULL,NULL),(146,'BZ','Μπελίζ',NULL,NULL),(147,'BJ','Μπενίν',NULL,NULL),(148,'BQ','Μποναίρ, Άγιος Ευστάθιος και Σάμπα (Bonaire, Sint Eustatius and Saba)',NULL,NULL),(149,'BW','Μποτσουάνα',NULL,NULL),(150,'BV','Μπουβέ',NULL,NULL),(151,'BF','Μπουρκίνα Φάσο',NULL,NULL),(152,'BI','Μπουρούντι',NULL,NULL),(153,'BT','Μπουτάν',NULL,NULL),(154,'BN','Μπρουνέι',NULL,NULL),(155,'NA','Ναμίμπια',NULL,NULL),(156,'NR','Ναουρού',NULL,NULL),(157,'NZ','Νέα Ζηλανδία',NULL,NULL),(158,'NC','Νέα Καληδονία',NULL,NULL),(159,'NP','Νεπάλ',NULL,NULL),(160,'NF','Νησί Νόρφολκ',NULL,NULL),(161,'CC','Νησιά Κόκος (Keeling)',NULL,NULL),(162,'PN','Νησιά Πίτκερν',NULL,NULL),(163,'CK','Νήσοι Κουκ',NULL,NULL),(164,'MH','Νήσοι Μάρσαλ',NULL,NULL),(165,'GS','Νήσοι Νότια Γεωργία και Νότιες Σάντουιτς',NULL,NULL),(166,'SB','Νήσοι Σολομώντα',NULL,NULL),(167,'FO','Νήσοι Φερόες',NULL,NULL),(168,'FK','Νήσοι Φώκλαντ',NULL,NULL),(169,'HM','Νήσοι Χερντ και Μακντόναλντ',NULL,NULL),(170,'SH','Νήσος Αγίας Ελένης',NULL,NULL),(171,'IM','Νήσος Μαν',NULL,NULL),(172,'CX','Νήσος των Χριστουγέννων',NULL,NULL),(173,'NE','Νίγηρας',NULL,NULL),(174,'NG','Νιγηρία',NULL,NULL),(175,'NI','Νικαράγουα',NULL,NULL),(176,'NU','Νιούε',NULL,NULL),(177,'NO','Νορβηγία',NULL,NULL),(178,'ZA','Νότια Αφρική',NULL,NULL),(179,'KR','Νότια Κορέα',NULL,NULL),(180,'SS','Νότιο Σουδάν',NULL,NULL),(181,'NL','Ολλανδία (Κάτω Χώρες)',NULL,NULL),(182,'AN','Ολλανδικές Αντίλλες',NULL,NULL),(183,'OM','Ομάν',NULL,NULL),(184,'FM','Ομόσπονδες Πολιτείες της Μικρονησίας',NULL,NULL),(185,'HN','Ονδούρα',NULL,NULL),(186,'WF','Ουαλίς και Φουτουνά',NULL,NULL),(187,'HU','Ουγγαρία',NULL,NULL),(188,'UG','Ουγκάντα',NULL,NULL),(189,'UZ','Ουζμπεκιστάν',NULL,NULL),(190,'UA','Ουκρανία',NULL,NULL),(191,'UY','Ουρουγουάη',NULL,NULL),(192,'PK','Πακιστάν',NULL,NULL),(193,'PW','Παλάου',NULL,NULL),(194,'PA','Παναμάς',NULL,NULL),(195,'PG','Παπούα Νέα Γουινέα',NULL,NULL),(196,'PY','Παραγουάη',NULL,NULL),(197,'MK','ΠΓΔΜ',NULL,NULL),(198,'PE','Περού',NULL,NULL),(199,'PL','Πολωνία',NULL,NULL),(200,'PT','Πορτογαλία',NULL,NULL),(201,'PR','Πουέρτο Ρίκο',NULL,NULL),(202,'CV','Πράσινο Ακρωτήρι',NULL,NULL),(203,'RE','Ρεϊνιόν',NULL,NULL),(204,'RW','Ρουάντα',NULL,NULL),(205,'RO','Ρουμανία',NULL,NULL),(206,'RU','Ρωσία',NULL,NULL),(207,'PM','Σαιν Πιερ και Μικελόν',NULL,NULL),(208,'WS','Σαμόα',NULL,NULL),(209,'ST','Σάο Τομέ και Πρίνσιπε',NULL,NULL),(210,'SA','Σαουδική Αραβία',NULL,NULL),(211,'SJ','Σβάλμπαρντ',NULL,NULL),(212,'SN','Σενεγάλη',NULL,NULL),(213,'RS','Σερβία',NULL,NULL),(214,'SC','Σεϋχέλλες',NULL,NULL),(215,'SG','Σιγκαπούρη',NULL,NULL),(216,'SL','Σιέρα Λεόνε',NULL,NULL),(217,'SK','Σλοβακία',NULL,NULL),(218,'SI','Σλοβενία',NULL,NULL),(219,'SO','Σομαλία',NULL,NULL),(220,'SZ','Σουαζιλάνδη',NULL,NULL),(221,'SD','Σουδάν',NULL,NULL),(222,'SE','Σουηδία',NULL,NULL),(223,'SR','Σουρινάμ',NULL,NULL),(224,'LK','Σρι Λάνκα',NULL,NULL),(225,'SY','Συρία',NULL,NULL),(226,'TW','Ταϊβάν',NULL,NULL),(227,'TH','Ταϊλάνδη',NULL,NULL),(228,'TZ','Τανζανία',NULL,NULL),(229,'TJ','Τατζικιστάν',NULL,NULL),(230,'TC','Τερκς και Κέικος',NULL,NULL),(231,'JM','Τζαμάικα',NULL,NULL),(232,'JE','Τζέρσεϊ',NULL,NULL),(233,'DJ','Τζιμπουτί',NULL,NULL),(234,'TO','Τόγκα',NULL,NULL),(235,'TG','Τόγκο',NULL,NULL),(236,'TK','Τοκελάου',NULL,NULL),(237,'TV','Τουβαλού',NULL,NULL),(238,'TR','Τουρκία',NULL,NULL),(239,'TM','Τουρκμενιστάν',NULL,NULL),(240,'TT','Τρινιντάντ και Τομπάγκο',NULL,NULL),(241,'TD','Τσαντ',NULL,NULL),(242,'CZ','Τσεχία',NULL,NULL),(243,'TN','Τυνησία',NULL,NULL),(244,'YE','Υεμένη',NULL,NULL),(245,'PH','Φιλιππίνες',NULL,NULL),(246,'FI','Φινλανδία',NULL,NULL),(247,'FJ','Φίτζι',NULL,NULL),(248,'CL','Χιλή',NULL,NULL),(249,'HK','Χονγκ Κονγκ',NULL,NULL),(250,'AX','Ώλαντ',NULL,NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-28 18:20:51.757085','1','Packt Publishing',1,'[{\"added\": {}}]',22,1),(2,'2018-12-28 18:24:03.870456','1','Olga Filipova',1,'[{\"added\": {}}]',12,1),(3,'2018-12-28 18:24:26.704143','1','Learning Vue.js 2',1,'[{\"added\": {}}]',13,1),(4,'2018-12-28 18:25:21.611892','1','Learning Vue.js 2',1,'[{\"added\": {}}]',17,1),(5,'2018-12-28 18:27:53.502312','1','Learning Vue.js 2',3,'',17,1),(6,'2018-12-28 18:31:20.506979','2','Learning Vue.js 2',1,'[{\"added\": {}}]',17,1),(7,'2018-12-28 18:35:51.063776','2','Arun Ravindran',1,'[{\"added\": {}}]',12,1),(8,'2018-12-28 18:36:02.247122','2','Django Design Patterns and Best Practices',1,'[{\"added\": {}}]',13,1),(9,'2018-12-28 18:36:23.282833','3','Django Design Patterns and Best Practices',1,'[{\"added\": {}}]',17,1),(10,'2018-12-28 18:40:14.263673','3','Bass Jobsen',1,'[{\"added\": {}}]',12,1),(11,'2018-12-28 18:40:58.634065','4','Amin Meyghani',1,'[{\"added\": {}}]',12,1),(12,'2018-12-28 18:41:12.818371','3','Less Web Development Cookbook',1,'[{\"added\": {}}]',13,1),(13,'2018-12-28 18:41:28.973149','4','Less Web Development Cookbook',1,'[{\"added\": {}}]',17,1),(14,'2018-12-28 18:43:34.656429','2','O\'Reilly Media',1,'[{\"added\": {}}]',22,1),(15,'2018-12-28 18:45:46.753121','5','Matt Stauffer',1,'[{\"added\": {}}]',12,1),(16,'2018-12-28 18:45:56.711986','4','Laravel: Up and Running',1,'[{\"added\": {}}]',13,1),(17,'2018-12-28 18:46:08.890818','5','Laravel: Up and Running',1,'[{\"added\": {}}]',17,1),(18,'2018-12-28 18:54:19.601601','6','David Flanagan',1,'[{\"added\": {}}]',12,1),(19,'2018-12-28 18:54:25.634519','5','JavaScript: The Definitive Guide',1,'[{\"added\": {}}]',13,1),(20,'2018-12-28 18:54:43.111280','6','JavaScript: The Definitive Guide',1,'[{\"added\": {}}]',17,1),(21,'2018-12-28 18:59:47.687110','6','jQuery Pocket Reference',1,'[{\"added\": {}}]',13,1),(22,'2018-12-28 19:00:04.196884','7','jQuery Pocket Reference',1,'[{\"added\": {}}]',17,1),(23,'2018-12-28 19:02:35.160318','7','The Ruby Programming Language',1,'[{\"added\": {}}]',13,1),(24,'2018-12-28 19:02:54.532052','8','The Ruby Programming Language',1,'[{\"added\": {}}]',17,1),(25,'2018-12-28 19:05:15.389124','3','Addison-Wesley Professional',1,'[{\"added\": {}}]',22,1),(26,'2018-12-28 19:08:22.969056','7','Joshua Block',1,'[{\"added\": {}}]',12,1),(27,'2018-12-28 19:08:33.854908','8','Effective Java',1,'[{\"added\": {}}]',13,1),(28,'2018-12-28 19:08:57.336586','9','Effective Java',1,'[{\"added\": {}}]',17,1),(29,'2018-12-28 19:12:44.530476','8','Jennifer Robbins',1,'[{\"added\": {}}]',12,1),(30,'2018-12-28 19:12:50.267398','9','Learning Web Design',1,'[{\"added\": {}}]',13,1),(31,'2018-12-28 19:13:09.319636','10','Learning Web Design',1,'[{\"added\": {}}]',17,1),(32,'2018-12-30 10:20:24.285468','6','David Flanagan',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'mainapp','author'),(7,'mainapp','authorlist'),(13,'mainapp','book'),(28,'mainapp','bookbestchoices'),(26,'mainapp','bookdata'),(24,'mainapp','bookdetails'),(25,'mainapp','booknewest'),(30,'mainapp','booktoppicks'),(29,'mainapp','booktoptitles'),(14,'mainapp','category'),(8,'mainapp','categorylist'),(15,'mainapp','comment'),(16,'mainapp','country'),(17,'mainapp','entry'),(18,'mainapp','hold'),(19,'mainapp','holdstatus'),(20,'mainapp','language'),(9,'mainapp','languagelist'),(21,'mainapp','lend'),(32,'mainapp','lenddata'),(31,'mainapp','lenddate'),(22,'mainapp','publisher'),(10,'mainapp','publisherlist'),(23,'mainapp','suggestion'),(27,'mainapp','userdata'),(11,'mainapp','userlist'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-28 17:22:57.114664'),(2,'auth','0001_initial','2018-12-28 17:23:05.365052'),(3,'admin','0001_initial','2018-12-28 17:23:07.117027'),(4,'admin','0002_logentry_remove_auto_add','2018-12-28 17:23:07.166527'),(5,'admin','0003_logentry_add_action_flag_choices','2018-12-28 17:23:07.230526'),(6,'contenttypes','0002_remove_content_type_name','2018-12-28 17:23:08.318011'),(7,'auth','0002_alter_permission_name_max_length','2018-12-28 17:23:09.115500'),(8,'auth','0003_alter_user_email_max_length','2018-12-28 17:23:10.094487'),(9,'auth','0004_alter_user_username_opts','2018-12-28 17:23:10.207485'),(10,'auth','0005_alter_user_last_login_null','2018-12-28 17:23:10.770479'),(11,'auth','0006_require_contenttypes_0002','2018-12-28 17:23:10.986974'),(12,'auth','0007_alter_validators_add_error_messages','2018-12-28 17:23:11.223472'),(13,'auth','0008_alter_user_username_max_length','2018-12-28 17:23:11.952461'),(14,'auth','0009_alter_user_last_name_max_length','2018-12-28 17:23:12.668951'),(15,'mainapp','0001_initial','2018-12-28 17:23:35.746635'),(16,'mainapp','0002_auto_20181227_0920','2018-12-28 17:23:37.736109'),(17,'mainapp','0003_auto_20181227_2142','2018-12-28 17:23:37.852608'),(18,'mainapp','0004_bookbestchoices_booktoptitles','2018-12-28 17:23:37.976606'),(19,'sessions','0001_initial','2018-12-28 17:23:38.619096'),(20,'mainapp','0005_auto_20190105_1824','2019-01-05 16:25:07.129368'),(21,'mainapp','0006_hold_lend','2019-01-08 07:02:47.494598'),(22,'mainapp','0007_auto_20190108_0757','2019-01-10 07:27:39.956709'),(23,'mainapp','0008_auto_20190111_1843','2019-01-12 09:51:41.989857'),(24,'mainapp','0009_auto_20190112_1149','2019-01-12 09:51:42.430261'),(25,'mainapp','0009_auto_20190111_2309','2019-01-12 09:51:42.798406'),(26,'mainapp','0010_merge_20190112_1151','2019-01-12 09:51:42.804429'),(27,'mainapp','0011_auto_20190112_1235','2019-01-12 10:35:56.574847'),(28,'mainapp','0010_auto_20190112_1236','2019-01-16 07:11:14.140157'),(29,'mainapp','0012_merge_20190116_0911','2019-01-16 07:11:14.149481'),(30,'mainapp','0011_lenddate','2019-01-17 18:28:10.818170'),(31,'mainapp','0012_lenddata','2019-01-17 18:28:10.849191'),(32,'mainapp','0013_merge_20190117_2028','2019-01-17 18:28:10.853664'),(33,'mainapp','0013_auto_20190119_1346','2019-01-19 11:49:41.900748'),(34,'mainapp','0014_merge_20190119_1349','2019-01-19 11:49:41.905233');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0wj0ez8arr1qwbpfcrw2eex9le0rc74z','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-20 16:08:14.001663'),('13qfr54b6e8ljp3i5sa4tia4xhycpr38','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-12 16:51:28.336488'),('1z6utmvotsyc0osi96nc07c9dps1np8t','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-20 20:27:38.331358'),('209f8lifwepb5gt0pxhx2s598tz1i8wv','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-22 07:06:22.303704'),('24f4evkpn52rp0w3nca6fc3tazsef5da','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-25 16:19:39.678182'),('3dm97m9wb66ufv9vp98pcajhdr26buoa','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-30 07:12:20.144806'),('3hjdonxx5l2z2ubv5cvtm710e9h9whk3','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-31 06:39:20.184989'),('3lxmhgrtp8ibe0azn1rhxdb5ztamvz18','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-03-05 14:48:06.395576'),('3pfy71a4tj3c2p5d127mztefnmjxmhte','ZWNhNGRhYmQ4ZTU3NmMzYzk5NmQ2MmM0MTI2MWM0ZWM3NzAyNjkzNDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNjRhMmMyNWVkMjAxMGJkOTNmODAzMWU2ZjdhZDNiOGJmZTA0ZmZhIn0=','2019-01-25 10:24:54.774983'),('4eqqtpe2ptsr2jreh94zbhexglwk8yee','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-02 08:43:02.773077'),('50i1odhnx715fqvb76lwdrinrlnfqfi7','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-25 21:12:43.123305'),('7vmin1qxsw6gofpy37vbmxw9gb2mo1tg','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-03 13:33:35.030188'),('81quwqpm7bpkoaxyfp48k6lbowklc3py','ZmNlYWZjMmMxZTU5ZmM3MDA0NTlkMTViNzM3MmU0NmM3M2MwMWY0Mzp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlOTAyNGQ4NjU3ZWE4NDExZDZmMzRlNmJhMTZhYjBiZDA3YzU5NjMyIn0=','2019-02-20 17:07:05.017677'),('8ast6l3yc8qzmymn1jyz588xp04hwne1','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-19 05:37:16.999075'),('9q7g5w8mz8poc99wf9wxuedsmmuqllf6','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-03 09:37:51.232506'),('ai2c90c6vspxzf1qhin9ow1eqp8ysxl3','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-20 12:57:09.358631'),('aykygtwr9vqryjb38fquldu31z6cns92','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-26 16:26:24.075722'),('d40g7xa5novfs9b54facaj5zsnnzalie','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-31 14:03:47.322585'),('d9opwpf09m2lny5nhbto0ix65dg5km4r','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-19 08:57:17.556291'),('dsquupfw440fk6abdt0q19i3mpbnl713','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-20 20:17:10.847741'),('g7sln1anljqodq0gydslnikt2ds78qor','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-26 19:31:34.839901'),('h51dzx7dpii2pyxxuzmu4jnuad9zcicu','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-07 07:02:03.437197'),('h9abfkcicubizza7dnk6z8z3tx1dtorb','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-07-01 06:33:57.247659'),('i0bdwlcddnmpcw8q7ohb2hk1nm1sj9fr','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-19 17:55:08.918256'),('i3u8e45g4q0cstc8wb5dyw5n2la0km28','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-20 06:51:35.839999'),('i95pmp6ng2zpruk8lrs685f6h83aoegc','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-18 19:20:57.005988'),('knf1brdhg7fnzrjf5dql5unutg7kqw3v','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-03-18 14:29:41.807384'),('kz753wn5cqlezkdf3qy3w0rvdp89vmgi','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-18 19:47:11.571716'),('m7optg32i0bzih3jcgha8bbumkdp6wx0','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-19 20:06:46.727973'),('nu716k9p3k4myp86wjqoq0aoqbzfyyd1','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-12 10:24:26.415751'),('pypeyhsi8elsxqqmnxp21qyzrai1dsq7','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-23 16:45:19.570402'),('r05an0u6dnrp5asj592upqmokup5egr7','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-21 07:22:50.644547'),('r3cg62xloz6pjr5oe1oox7wos1zdnkyu','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-30 09:47:41.403312'),('sas4b5dy680bi3h6odl28du2gq9vzq9f','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-23 10:51:11.140855'),('tcqs2k9076ft1c600yuckpzejld2vvux','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-02-09 19:28:41.306579'),('tg72u34s2253c93lq176ph3gdftc8e4r','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2020-05-29 19:04:19.234283'),('u9sptk8khx33i3o27pif8hmjm8qzziip','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-31 18:28:53.891350'),('vw5ziakwdxl46ql58v58nkcpztif0cvc','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-11 18:13:24.660705'),('wm10iwbu3de2xt5cgzk66ly6vcmzjdch','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-21 16:22:50.769655'),('xmqjrgxv5vu0iqj9gl5nebx1vgqls2cj','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-24 11:54:10.139601'),('yc3oqfybny1yxqzrz8bycshgi30xlgy1','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-22 18:40:55.901162'),('z5e2xzw48ucl3si5depnc6bvgq8wngwo','Y2RmMDgxMTk1OGRlNDliMWY1NDgyNTQxMjVjN2NlMjhkMjBhNzI4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZmY3MDUyNzMzMDk1ODM4NTJjNjFkMDA4NDY2ZTM4N2I1N2ZhZjcxIn0=','2019-01-26 09:52:23.098097');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entry`
--

DROP TABLE IF EXISTS `entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_date` datetime(6) NOT NULL,
  `classification` varchar(255) NOT NULL,
  `cancel_date` datetime(6) DEFAULT NULL,
  `notes` longtext NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_book_id_a871edcc_fk_book_id` (`book_id`),
  CONSTRAINT `entry_book_id_a871edcc_fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entry`
--

LOCK TABLES `entry` WRITE;
/*!40000 ALTER TABLE `entry` DISABLE KEYS */;
INSERT INTO `entry` VALUES (2,'2018-12-28 18:30:57.000000','',NULL,'',1),(3,'2018-12-28 18:36:16.000000','',NULL,'',2),(4,'2018-12-28 18:41:22.000000','',NULL,'',3),(5,'2018-12-28 18:46:04.000000','',NULL,'',4),(6,'2018-12-28 18:54:35.000000','',NULL,'',5),(7,'2018-12-28 18:59:56.000000','',NULL,'',6),(8,'2018-12-28 19:02:46.000000','',NULL,'',7),(9,'2018-12-28 19:08:53.000000','',NULL,'',8),(10,'2018-12-28 19:12:58.000000','',NULL,'',9),(11,'2019-01-16 09:56:00.000000','',NULL,'',10),(12,'2019-01-19 07:26:00.000000','',NULL,'',11),(13,'2019-01-19 07:32:00.000000','',NULL,'',12),(14,'2019-01-19 07:40:00.000000','',NULL,'',13),(15,'2019-01-19 07:45:00.000000','',NULL,'',14),(16,'2019-01-19 07:56:00.000000','',NULL,'',15),(17,'2019-01-19 08:07:00.000000','',NULL,'',16),(18,'2019-01-29 16:57:00.000000','',NULL,'',17);
/*!40000 ALTER TABLE `entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hold`
--

DROP TABLE IF EXISTS `hold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hold` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `book_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lend_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hold_lend_id_88c3faa9_uniq` (`lend_id`),
  KEY `hold_book_id_a2e7a24e_fk_book_id` (`book_id`),
  KEY `hold_status_id_15004b34_fk_hold_status_id` (`status_id`),
  KEY `hold_user_id_8042b92b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `hold_book_id_a2e7a24e_fk_book_id` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `hold_lend_id_88c3faa9_fk_lend_id` FOREIGN KEY (`lend_id`) REFERENCES `lend` (`id`),
  CONSTRAINT `hold_status_id_15004b34_fk_hold_status_id` FOREIGN KEY (`status_id`) REFERENCES `hold_status` (`id`),
  CONSTRAINT `hold_user_id_8042b92b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hold`
--

LOCK TABLES `hold` WRITE;
/*!40000 ALTER TABLE `hold` DISABLE KEYS */;
INSERT INTO `hold` VALUES (1,'2019-01-06 09:18:49.433131',9,2,1,NULL),(2,'2019-01-06 09:43:53.970134',4,2,1,NULL),(3,'2019-01-06 09:44:19.443136',3,2,1,NULL),(4,'2019-01-06 10:11:02.117962',5,2,1,NULL),(5,'2019-01-06 10:26:33.454960',9,0,2,NULL),(6,'2019-01-06 12:45:56.622630',4,2,3,NULL),(7,'2019-01-06 12:46:46.151634',9,0,3,NULL),(8,'2019-01-06 12:47:21.390633',4,2,3,NULL),(9,'2019-01-06 20:17:38.842745',9,0,1,NULL),(10,'2019-01-06 20:18:16.175743',4,0,1,NULL),(11,'2019-01-06 20:18:30.835744',3,2,1,NULL),(12,'2019-01-06 20:18:50.966743',5,0,1,NULL),(13,'2019-01-06 20:19:05.005742',2,1,1,3),(14,'2019-01-06 20:19:23.353741',7,0,1,NULL),(15,'2019-01-06 20:19:46.723741',8,1,1,9),(16,'2019-01-07 05:04:50.544184',1,1,4,7),(17,'2019-01-07 05:22:44.528121',6,0,4,NULL),(18,'2019-01-07 05:28:33.129853',7,1,4,8),(19,'2019-01-07 05:28:54.365735',5,0,4,NULL),(20,'2019-01-07 05:29:10.282652',5,0,4,NULL),(21,'2019-01-07 05:29:19.514247',4,0,4,NULL),(22,'2019-01-07 05:29:48.698452',2,0,4,NULL),(23,'2019-01-08 06:46:09.795068',2,0,5,NULL),(24,'2019-01-08 06:46:55.785594',5,1,5,4),(25,'2019-01-08 06:47:24.296274',4,1,5,5),(26,'2019-01-08 06:48:27.369258',9,1,5,6),(27,'2019-01-11 10:25:13.987200',8,0,6,NULL),(28,'2019-01-11 10:28:32.045552',9,0,6,NULL),(29,'2019-01-16 16:40:41.103883',10,0,1,NULL),(30,'2019-01-17 14:13:21.439570',6,2,7,NULL),(31,'2019-02-05 09:06:49.355048',17,0,4,NULL),(32,'2019-02-05 09:07:12.107861',1,0,4,NULL),(33,'2019-02-05 09:07:27.645114',8,0,4,NULL),(34,'2019-02-06 17:07:12.136385',17,0,9,NULL),(35,'2020-05-15 19:04:47.488077',17,0,1,NULL);
/*!40000 ALTER TABLE `hold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hold_status`
--

DROP TABLE IF EXISTS `hold_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hold_status` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hold_status`
--

LOCK TABLES `hold_status` WRITE;
/*!40000 ALTER TABLE `hold_status` DISABLE KEYS */;
INSERT INTO `hold_status` VALUES (0,'Αναμονή'),(1,'Διεκπεραιώθηκε'),(2,'Ανακλήθηκε');
/*!40000 ALTER TABLE `hold_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Αγγλικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(2,'Γαλλικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(3,'Γερμανικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(4,'Ελληνικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(5,'Ισπανικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(6,'Ιταλικά','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000'),(7,'Κινέζικα','2018-12-22 00:00:00.000000','2018-12-22 00:00:00.000000');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `language_list`
--

DROP TABLE IF EXISTS `language_list`;
/*!50001 DROP VIEW IF EXISTS `language_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `language_list` AS SELECT 
 1 AS `id`,
 1 AS `description`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `books`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lend`
--

DROP TABLE IF EXISTS `lend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lend_date` datetime(6) NOT NULL,
  `lend_days` smallint(5) unsigned NOT NULL,
  `return_date` datetime(6) DEFAULT NULL,
  `entry_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lend_entry_id_aca3bf5b_fk_entry_id` (`entry_id`),
  KEY `lend_user_id_a01a4271_fk_auth_user_id` (`user_id`),
  CONSTRAINT `lend_entry_id_aca3bf5b_fk_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `entry` (`id`),
  CONSTRAINT `lend_user_id_a01a4271_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lend`
--

LOCK TABLES `lend` WRITE;
/*!40000 ALTER TABLE `lend` DISABLE KEYS */;
INSERT INTO `lend` VALUES (3,'2019-01-08 19:06:00.000000',20,'2019-01-11 10:00:00.000000',3,1),(4,'2019-01-10 07:28:00.000000',20,NULL,6,5),(5,'2019-01-10 07:29:00.000000',20,NULL,5,5),(6,'2019-01-10 07:29:00.000000',20,NULL,10,5),(7,'2019-01-10 07:30:00.000000',20,NULL,2,4),(8,'2019-01-10 07:30:00.000000',20,NULL,8,4),(9,'2018-12-27 16:41:00.000000',20,NULL,9,1);
/*!40000 ALTER TABLE `lend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `lend_data`
--

DROP TABLE IF EXISTS `lend_data`;
/*!50001 DROP VIEW IF EXISTS `lend_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `lend_data` AS SELECT 
 1 AS `lend_id`,
 1 AS `delay`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `num_entries`
--

DROP TABLE IF EXISTS `num_entries`;
/*!50001 DROP VIEW IF EXISTS `num_entries`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `num_entries` AS SELECT 
 1 AS `book_id`,
 1 AS `entries`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_name` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publisher_country_id_03783c67_fk_country_id` (`country_id`),
  CONSTRAINT `publisher_country_id_03783c67_fk_country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Packt Publishing','','','','','2018-12-28 18:20:51.717087','2018-12-28 18:20:51.717087',77),(2,'O\'Reilly Media','','','','','2018-12-28 18:43:34.611929','2018-12-28 18:43:34.611929',76),(3,'Addison-Wesley Professional','','','','','2018-12-28 19:05:15.387124','2018-12-28 19:05:15.387624',76),(4,'Apress','','','','','2019-01-16 09:53:36.105052','2019-01-16 09:53:36.105091',76),(6,'Dutton Caliber','','','','','2019-01-19 07:24:30.997375','2019-01-19 07:24:30.997408',76),(7,'Cengage Learning','','','','','2019-01-19 07:30:47.891098','2019-01-19 07:30:47.891131',76),(8,'Carlton Books','','','','','2019-01-19 07:38:13.158907','2019-01-19 07:38:13.158940',77),(9,'Αθλότυπο','','','','','2019-01-19 07:44:41.538263','2019-01-19 07:44:41.538296',70),(10,'University Studio Press','Θεσσαλονίκη','','','','2019-01-19 07:55:25.734017','2019-01-19 07:55:25.734065',70),(11,'Κλειδάριθμος','Αθήνα','','','','2019-01-19 08:07:11.630757','2019-01-19 08:07:11.630791',70),(12,'Scholastic','','','','','2019-01-29 16:55:46.319163','2019-01-29 16:55:46.319231',76);
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `publisher_list`
--

DROP TABLE IF EXISTS `publisher_list`;
/*!50001 DROP VIEW IF EXISTS `publisher_list`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `publisher_list` AS SELECT 
 1 AS `id`,
 1 AS `pub_name`,
 1 AS `city`,
 1 AS `address`,
 1 AS `zip`,
 1 AS `phone`,
 1 AS `country_id`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `books`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!50001 DROP VIEW IF EXISTS `user_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_data` AS SELECT 
 1 AS `user_id`,
 1 AS `lends`,
 1 AS `comments`,
 1 AS `holds`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `active_lends`
--

/*!50001 DROP VIEW IF EXISTS `active_lends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `active_lends` AS select `book`.`id` AS `book_id`,(select count(0) from (`lend` join `entry`) where ((`lend`.`entry_id` = `entry`.`id`) and (`entry`.`book_id` = `book`.`id`) and isnull(`lend`.`return_date`))) AS `lends` from `book` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `author_list`
--

/*!50001 DROP VIEW IF EXISTS `author_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `author_list` AS select `author`.`id` AS `id`,`author`.`author_name` AS `author_name`,`author`.`bio` AS `bio`,`author`.`email` AS `email`,`author`.`created_at` AS `created_at`,`author`.`updated_at` AS `updated_at`,(select count(0) from `book_authors` where (`book_authors`.`author_id` = `author`.`id`)) AS `books` from `author` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_best_choices`
--

/*!50001 DROP VIEW IF EXISTS `book_best_choices`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_best_choices` AS select `book_data`.`book_id` AS `book_id`,`book_data`.`total_lends` AS `total_lends` from `book_data` where exists(select `entry`.`book_id` from `entry` where (`book_data`.`book_id` = `entry`.`book_id`)) order by `book_data`.`total_lends` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_data`
--

/*!50001 DROP VIEW IF EXISTS `book_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_data` AS select `book`.`id` AS `book_id`,`num_entries`.`entries` AS `num_entries`,`active_lends`.`lends` AS `active_lends`,(`num_entries`.`entries` - `active_lends`.`lends`) AS `available`,(select count(0) from `hold` where ((`hold`.`book_id` = `book`.`id`) and (`hold`.`status_id` = 0))) AS `active_holds`,(select count(0) from (`lend` join `entry`) where ((`lend`.`entry_id` = `entry`.`id`) and (`entry`.`book_id` = `book`.`id`))) AS `total_lends`,(select count(0) from `comment` where (`comment`.`book_id` = `book`.`id`)) AS `num_comments`,ifnull((select count(0) from `comment` where ((`comment`.`book_id` = `book`.`id`) and (`comment`.`stars` = 1))),0) AS `num_stars1`,ifnull((select count(0) from `comment` where ((`comment`.`book_id` = `book`.`id`) and (`comment`.`stars` = 2))),0) AS `num_stars2`,ifnull((select count(0) from `comment` where ((`comment`.`book_id` = `book`.`id`) and (`comment`.`stars` = 3))),0) AS `num_stars3`,ifnull((select count(0) from `comment` where ((`comment`.`book_id` = `book`.`id`) and (`comment`.`stars` = 4))),0) AS `num_stars4`,ifnull((select count(0) from `comment` where ((`comment`.`book_id` = `book`.`id`) and (`comment`.`stars` = 5))),0) AS `num_stars5`,ifnull((select sum(`comment`.`stars`) from `comment` where (`comment`.`book_id` = `book`.`id`)),0) AS `sum_stars` from ((`book` join `num_entries`) join `active_lends`) where ((`book`.`id` = `num_entries`.`book_id`) and (`book`.`id` = `active_lends`.`book_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_newest`
--

/*!50001 DROP VIEW IF EXISTS `book_newest`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_newest` AS select `book`.`id` AS `book_id` from `book` where exists(select `entry`.`book_id` from `entry` where (`book`.`id` = `entry`.`book_id`)) order by `book`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `book_top_titles`
--

/*!50001 DROP VIEW IF EXISTS `book_top_titles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `book_top_titles` AS select `book_data`.`book_id` AS `book_id`,ifnull((`book_data`.`sum_stars` / `book_data`.`num_comments`),0) AS `grade` from `book_data` where exists(select `entry`.`book_id` from `entry` where (`book_data`.`book_id` = `entry`.`book_id`)) order by (`book_data`.`sum_stars` / `book_data`.`num_comments`) desc,ifnull((`book_data`.`sum_stars` / `book_data`.`num_comments`),0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `category_list`
--

/*!50001 DROP VIEW IF EXISTS `category_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `category_list` AS select `category`.`id` AS `id`,`category`.`description` AS `description`,`category`.`created_at` AS `created_at`,`category`.`updated_at` AS `updated_at`,(select count(0) from `book_categories` where (`book_categories`.`category_id` = `category`.`id`)) AS `books` from `category` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `language_list`
--

/*!50001 DROP VIEW IF EXISTS `language_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `language_list` AS select `language`.`id` AS `id`,`language`.`description` AS `description`,`language`.`created_at` AS `created_at`,`language`.`updated_at` AS `updated_at`,(select count(0) from `book` where (`book`.`language_id` = `language`.`id`)) AS `books` from `language` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lend_data`
--

/*!50001 DROP VIEW IF EXISTS `lend_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lend_data` AS select `lend`.`id` AS `lend_id`,(to_days(curdate()) - to_days((`lend`.`lend_date` + interval `lend`.`lend_days` day))) AS `delay` from `lend` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `num_entries`
--

/*!50001 DROP VIEW IF EXISTS `num_entries`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `num_entries` AS select `book`.`id` AS `book_id`,count(`entry`.`book_id`) AS `entries` from (`book` left join `entry` on((`book`.`id` = `entry`.`book_id`))) where isnull(`entry`.`cancel_date`) group by `book`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `publisher_list`
--

/*!50001 DROP VIEW IF EXISTS `publisher_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `publisher_list` AS select `publisher`.`id` AS `id`,`publisher`.`pub_name` AS `pub_name`,`publisher`.`city` AS `city`,`publisher`.`address` AS `address`,`publisher`.`zip` AS `zip`,`publisher`.`phone` AS `phone`,`publisher`.`country_id` AS `country_id`,`publisher`.`created_at` AS `created_at`,`publisher`.`updated_at` AS `updated_at`,(select count(0) from `book` where (`book`.`publisher_id` = `publisher`.`id`)) AS `books` from `publisher` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_data`
--

/*!50001 DROP VIEW IF EXISTS `user_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_data` AS select `auth_user`.`id` AS `user_id`,(select count(0) from `lend` where (`lend`.`user_id` = `auth_user`.`id`)) AS `lends`,(select count(0) from `comment` where (`comment`.`user_id` = `auth_user`.`id`)) AS `comments`,(select count(0) from `hold` where (`hold`.`user_id` = `auth_user`.`id`)) AS `holds` from `auth_user` */;
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

-- Dump completed on 2020-05-15 19:22:52
