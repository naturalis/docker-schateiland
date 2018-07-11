-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: boerhave
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.10.1-log

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
-- Table structure for table `actions`
--
CREATE DATABASE boerhave;
GRANT ALL PRIVILEGES ON boerhave.* TO 'root'@'%';

USE boerhave;

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `belofte` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `mail_template` text,
  `datum` datetime DEFAULT NULL,
  `active` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `periods_id` int(11) DEFAULT NULL,
  `actions_pilarssets_id` int(11) DEFAULT NULL,
  `actions_categories_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actions_periods1` (`periods_id`),
  KEY `fk_actions_actions_pilarssets1` (`actions_pilarssets_id`),
  KEY `fk_actions_actions_categories1` (`actions_categories_id`),
  CONSTRAINT `fk_actions_actions_categories1` FOREIGN KEY (`actions_categories_id`) REFERENCES `actions_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_actions_actions_pilarssets1` FOREIGN KEY (`actions_pilarssets_id`) REFERENCES `actions_pilarssets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_actions_periods1` FOREIGN KEY (`periods_id`) REFERENCES `periods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_categories`
--

DROP TABLE IF EXISTS `actions_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_categories`
--

LOCK TABLES `actions_categories` WRITE;
/*!40000 ALTER TABLE `actions_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_pilars`
--

DROP TABLE IF EXISTS `actions_pilars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_pilars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `actions_pilarssets_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actions_pilars_actions_pilarssets1` (`actions_pilarssets_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_pilars`
--

LOCK TABLES `actions_pilars` WRITE;
/*!40000 ALTER TABLE `actions_pilars` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_pilars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_pilars_questions`
--

DROP TABLE IF EXISTS `actions_pilars_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_pilars_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titel` varchar(255) DEFAULT NULL,
  `actions_pilars_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actions_pilars_questions_actions_pilars1` (`actions_pilars_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_pilars_questions`
--

LOCK TABLES `actions_pilars_questions` WRITE;
/*!40000 ALTER TABLE `actions_pilars_questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_pilars_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_pilarssets`
--

DROP TABLE IF EXISTS `actions_pilarssets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_pilarssets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_pilarssets`
--

LOCK TABLES `actions_pilarssets` WRITE;
/*!40000 ALTER TABLE `actions_pilarssets` DISABLE KEYS */;
INSERT INTO `actions_pilarssets` VALUES (1,'test set 1');
/*!40000 ALTER TABLE `actions_pilarssets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actions_transactions`
--

DROP TABLE IF EXISTS `actions_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `message` text,
  `model` varchar(255) DEFAULT NULL,
  `model_identifier` varchar(255) DEFAULT NULL,
  `model_foreign_id` int(11) DEFAULT NULL,
  `actions_id` int(11) DEFAULT NULL,
  `user_actions_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_friends_id` int(11) DEFAULT NULL,
  `actions_pilars_id` int(11) DEFAULT NULL,
  `actions_pilars_questions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions_transactions`
--

LOCK TABLES `actions_transactions` WRITE;
/*!40000 ALTER TABLE `actions_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text,
  `value_title` varchar(255) DEFAULT NULL,
  `model_identifier` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_foreign_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_channels_id` int(11) DEFAULT NULL,
  `user_groups_id` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `publish` int(1) DEFAULT '0',
  `md5` varchar(255) DEFAULT NULL,
  `custom` text,
  PRIMARY KEY (`id`),
  KEY `fk_attributes_user1` (`user_id`),
  KEY `fk_attributes_user_channels1` (`user_channels_id`),
  KEY `fk_attributes_user_groups1` (`user_groups_id`),
  CONSTRAINT `fk_attributes_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attributes_user_channels1` FOREIGN KEY (`user_channels_id`) REFERENCES `user_channels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_attributes_user_groups1` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar_categories`
--

DROP TABLE IF EXISTS `avatar_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `not_editable` tinyint(4) NOT NULL,
  `aux3` int(11) DEFAULT NULL,
  `thumb_x_offset` int(11) NOT NULL,
  `thumb_y_offset` int(11) NOT NULL,
  `thumb_width` int(11) NOT NULL,
  `thumb_height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar_categories`
--

LOCK TABLES `avatar_categories` WRITE;
/*!40000 ALTER TABLE `avatar_categories` DISABLE KEYS */;
INSERT INTO `avatar_categories` VALUES (1,'ONDERLIJF',10,0,0,154,55,216,511),(3,'BOVENLIJF',20,0,0,208,275,136,52),(4,'WAPEN',30,0,0,115,9,300,265),(5,'HOOFD',40,0,0,118,276,284,183),(7,'GEZICHT',50,0,0,160,193,188,322),(16,'HELM',60,0,0,204,113,160,83),(17,'SCHILD',70,0,0,247,176,65,35);
/*!40000 ALTER TABLE `avatar_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avatar_elements`
--

DROP TABLE IF EXISTS `avatar_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `default_element` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `rank` int(4) DEFAULT '0',
  `m` int(11) DEFAULT '0',
  `f` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_avatar_elements_avatar_categories1` (`categories_id`),
  KEY `id` (`id`),
  CONSTRAINT `fk_avatar_elements_avatar_categories1` FOREIGN KEY (`categories_id`) REFERENCES `avatar_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avatar_elements`
--

LOCK TABLES `avatar_elements` WRITE;
/*!40000 ALTER TABLE `avatar_elements` DISABLE KEYS */;
INSERT INTO `avatar_elements` VALUES (375,3,'midden_1','/images-db/upload/avatarelements/midden1.png',0,0,0,1,0),(376,3,'midden_2','/images-db/upload/avatarelements/midden2.png',0,0,0,0,0),(377,3,'midden_3','/images-db/upload/avatarelements/midden3.png',0,0,0,1,0),(378,3,'midden_4','/images-db/upload/avatarelements/midden4.png',0,0,0,1,0),(379,3,'midden_5','/images-db/upload/avatarelements/midden5.png',0,0,0,1,0),(380,3,'midden_6','/images-db/upload/avatarelements/midden6.png',0,0,0,1,0),(381,3,'midden_7','/images-db/upload/avatarelements/midden7.png',0,0,0,1,0),(382,3,'midden_8','/images-db/upload/avatarelements/midden8.png',0,0,0,1,0),(383,3,'midden_9','/images-db/upload/avatarelements/midden9.png',0,0,0,1,0),(384,4,'wapen_1','/images-db/upload/avatarelements/wapen1.png',0,0,0,1,1),(385,4,'wapen_2','/images-db/upload/avatarelements/wapen2.png',0,0,0,1,1),(386,4,'wapen_3','/images-db/upload/avatarelements/wapen3.png',0,0,0,1,1),(387,4,'wapen_4','/images-db/upload/avatarelements/wapen4.png',0,0,0,1,1),(388,4,'wapen_5','/images-db/upload/avatarelements/wapen5.png',0,0,0,1,1),(389,4,'wapen_6','/images-db/upload/avatarelements/wapen6.png',0,0,0,1,1),(390,4,'wapen_7','/images-db/upload/avatarelements/wapen7.png',0,0,0,1,1),(391,4,'wapen_8','/images-db/upload/avatarelements/wapen8.png',0,0,0,1,1),(393,5,'hoofd_1','/images-db/upload/avatarelements/huidskleur1.png',0,0,0,1,0),(394,5,'hoofd_2','/images-db/upload/avatarelements/huidskleur2.png',0,0,0,1,0),(395,5,'hoofd_3','/images-db/upload/avatarelements/huidskleur3.png',0,0,0,1,0),(396,5,'hoofd_4','/images-db/upload/avatarelements/huidskleur4.png',0,0,0,1,0),(397,5,'hoofd_5','/images-db/upload/avatarelements/huidskleur5.png',0,0,0,1,0),(398,7,'gezicht_1','/images-db/upload/avatarelements/face1.png',0,0,0,1,0),(399,7,'gezicht_2','/images-db/upload/avatarelements/face2.png',0,0,0,1,0),(400,7,'gezicht_3','/images-db/upload/avatarelements/face3.png',0,0,0,1,0),(401,7,'gezicht_4','/images-db/upload/avatarelements/face4.png',0,0,0,1,0),(402,7,'gezicht_5','/images-db/upload/avatarelements/face5.png',0,0,0,1,0),(403,7,'gezicht_6','/images-db/upload/avatarelements/face6.png',0,0,0,1,0),(404,7,'gezicht_7','/images-db/upload/avatarelements/face7.png',0,0,0,1,0),(405,16,'helm_1','/images-db/upload/avatarelements/helm1.png',0,0,0,1,0),(406,16,'helm_2','/images-db/upload/avatarelements/helm2.png',0,0,0,1,0),(408,16,'helm_3','/images-db/upload/avatarelements/helm3.png',0,0,0,1,0),(409,16,'helm_4','/images-db/upload/avatarelements/helm4.png',0,0,0,1,0),(410,16,'helm_5','/images-db/upload/avatarelements/helm5.png',0,0,0,1,0),(411,16,'helm_6','/images-db/upload/avatarelements/helm6.png',0,0,0,1,0),(412,17,'schild_1','/images-db/upload/avatarelements/schild1.png',0,0,0,1,1),(413,17,'schild_2','/images-db/upload/avatarelements/schild2.png',0,0,0,1,1),(414,17,'schild_3','/images-db/upload/avatarelements/schild3.png',0,0,0,1,1),(415,17,'schild_4','/images-db/upload/avatarelements/schild4.png',0,0,0,1,1),(416,17,'schild_5','/images-db/upload/avatarelements/schild5.png',0,0,0,1,1),(417,17,'schild_6','/images-db/upload/avatarelements/schild6.png',0,0,0,1,1),(424,1,'onder_1','/images-db/upload/avatarelements/onder1.png',0,0,0,1,0),(425,1,'onder_2','/images-db/upload/avatarelements/onder2.png',0,0,0,1,0),(426,1,'onder_3','/images-db/upload/avatarelements/onder3.png',0,0,0,1,0),(427,1,'onder_4','/images-db/upload/avatarelements/onder4.png',0,0,0,1,0),(428,1,'onder_5','/images-db/upload/avatarelements/onder5.png',0,0,0,1,0),(429,1,'onder_6','/images-db/upload/avatarelements/onder6.png',0,0,0,1,0),(430,1,'onder_7','/images-db/upload/avatarelements/onder7.png',0,0,0,1,0),(432,1,'fonder_1','/images-db/upload/avatarelements/fonder1.png',0,0,0,0,1),(433,1,'fonder_2','/images-db/upload/avatarelements/fonder2.png',0,0,0,0,1),(434,1,'fonder_3','/images-db/upload/avatarelements/fonder3.png',0,0,0,0,1),(435,1,'fonder_4','/images-db/upload/avatarelements/fonder4.png',0,0,0,0,1),(436,1,'fonder_5','/images-db/upload/avatarelements/fonder5.png',0,0,0,0,1),(437,1,'fonder_6','/images-db/upload/avatarelements/fonder6.png',0,0,0,0,1),(438,1,'fonder_7','/images-db/upload/avatarelements/fonder7.png',0,0,0,0,1),(439,1,'fonder_8','/images-db/upload/avatarelements/fonder8.png',0,0,0,0,1),(440,3,'fmidden_1','/images-db/upload/avatarelements/fmidden1.png',0,0,0,0,1),(441,3,'fmidden_2','/images-db/upload/avatarelements/fmidden2.png',0,0,0,0,1),(442,3,'fmidden_3','/images-db/upload/avatarelements/fmidden3.png',0,0,0,0,1),(443,3,'fmidden_4','/images-db/upload/avatarelements/fmidden4.png',0,0,0,0,1),(444,3,'fmidden_5','/images-db/upload/avatarelements/fmidden5.png',0,0,0,0,1),(445,3,'fmidden_6','/images-db/upload/avatarelements/fmidden6.png',0,0,0,0,1),(446,3,'fmidden_7','/images-db/upload/avatarelements/fmidden7.png',0,0,0,0,1),(447,3,'fmidden_8','/images-db/upload/avatarelements/fmidden8.png',0,0,0,0,1),(448,3,'fmidden_','/images-db/upload/avatarelements/fmidden9.png',0,0,0,0,1),(449,5,'fhoofd_1','/images-db/upload/avatarelements/fhuidskleur1.png',0,0,0,0,1),(450,5,'fhoofd_2','/images-db/upload/avatarelements/fhuidskleur2.png',0,0,0,0,1),(451,5,'fhoofd_3','/images-db/upload/avatarelements/fhuidskleur3.png',0,0,0,0,1),(452,5,'fhoofd_4','/images-db/upload/avatarelements/fhuidskleur4.png',0,0,0,0,1),(453,5,'fhoofd_5','/images-db/upload/avatarelements/fhuidskleur5.png',0,0,0,0,1),(454,7,'fface_1','/images-db/upload/avatarelements/fface1.png',0,0,0,0,1),(455,7,'fface_2','/images-db/upload/avatarelements/fface2.png',0,0,0,0,1),(456,7,'fface_3','/images-db/upload/avatarelements/fface3.png',0,0,0,0,1),(457,7,'fface_4','/images-db/upload/avatarelements/fface4.png',0,0,0,0,1),(458,7,'fface_5','/images-db/upload/avatarelements/fface5.png',0,0,0,0,1),(459,16,'fhelm_1','/images-db/upload/avatarelements/fhelm1.png',0,0,0,0,1),(460,16,'fhelm_2','/images-db/upload/avatarelements/fhelm2.png',0,0,0,0,1),(461,16,'fhelm_3','/images-db/upload/avatarelements/fhelm3.png',0,0,0,0,1),(463,16,'fhelm_4','/images-db/upload/avatarelements/fhelm4.png',0,0,0,0,1),(464,16,'fhelm_5','/images-db/upload/avatarelements/fhelm5.png',0,0,0,0,1),(465,16,'fhelm_6','/images-db/upload/avatarelements/fhelm6.png',0,0,0,0,1);
/*!40000 ALTER TABLE `avatar_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battles`
--

DROP TABLE IF EXISTS `battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status_user` char(1) DEFAULT '0',
  `opponent_id` int(11) DEFAULT NULL,
  `status_opponent` char(1) DEFAULT '0',
  `checksum` varchar(32) DEFAULT NULL,
  `winner` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_battles_user1` (`user_id`),
  KEY `fk_battles_user2` (`opponent_id`),
  CONSTRAINT `fk_battles_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_battles_user2` FOREIGN KEY (`opponent_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles`
--

LOCK TABLES `battles` WRITE;
/*!40000 ALTER TABLE `battles` DISABLE KEYS */;
/*!40000 ALTER TABLE `battles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battles_result`
--

DROP TABLE IF EXISTS `battles_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battles_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `battles_id` int(11) NOT NULL,
  `quiz_questions_id` int(11) NOT NULL,
  `user_answer_date` datetime DEFAULT NULL,
  `user_answers_id` int(11) DEFAULT NULL,
  `user_answers_correct` int(11) DEFAULT NULL,
  `user_value` int(11) DEFAULT NULL,
  `user_time` int(11) DEFAULT NULL,
  `opponent_answer_date` datetime DEFAULT NULL,
  `opponent_answers_id` int(11) DEFAULT NULL,
  `opponent_answers_correct` int(11) DEFAULT NULL,
  `opponent_value` int(11) DEFAULT NULL,
  `opponent_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_battles_result_battles1` (`battles_id`),
  KEY `fk_battles_result_quiz_questions1` (`quiz_questions_id`),
  KEY `fk_battles_result_quiz_answers1` (`user_answers_id`),
  KEY `fk_battles_result_quiz_answers2` (`opponent_answers_id`),
  CONSTRAINT `fk_battles_result_battles1` FOREIGN KEY (`battles_id`) REFERENCES `battles` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_battles_result_quiz_answers1` FOREIGN KEY (`user_answers_id`) REFERENCES `quiz_answers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_battles_result_quiz_answers2` FOREIGN KEY (`opponent_answers_id`) REFERENCES `quiz_answers` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_battles_result_quiz_questions1` FOREIGN KEY (`quiz_questions_id`) REFERENCES `quiz_questions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles_result`
--

LOCK TABLES `battles_result` WRITE;
/*!40000 ALTER TABLE `battles_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `battles_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `fidentifier` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `content` text,
  `datetime` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `readed` text,
  `new` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_comments_user1` (`user_id`),
  KEY `fk_comments_comments1` (`reply_id`),
  CONSTRAINT `fk_comments_comments1` FOREIGN KEY (`reply_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_likes`
--

DROP TABLE IF EXISTS `comments_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `comments_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_likes_comments1` (`comments_id`),
  KEY `fk_comments_likes_user1` (`user_id`),
  CONSTRAINT `fk_comments_likes_comments1` FOREIGN KEY (`comments_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_likes_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_likes`
--

LOCK TABLES `comments_likes` WRITE;
/*!40000 ALTER TABLE `comments_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_readed`
--

DROP TABLE IF EXISTS `comments_readed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_readed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readed` int(11) DEFAULT '0',
  `comments_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_readed_comments1` (`comments_id`),
  KEY `fk_comments_readed_user1` (`user_id`),
  CONSTRAINT `fk_comments_readed_comments1` FOREIGN KEY (`comments_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_readed_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_readed`
--

LOCK TABLES `comments_readed` WRITE;
/*!40000 ALTER TABLE `comments_readed` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments_readed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `publish` tinyint(4) NOT NULL DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `display` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `content_categories_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `views` int(11) DEFAULT '0',
  `custom1` varchar(555) DEFAULT NULL,
  `custom2` varchar(555) DEFAULT NULL,
  `custom3` text,
  `custom4` text,
  `navigation_id` int(22) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_content_content_categories1` (`content_categories_id`),
  KEY `fk_content_user1` (`user_id`),
  KEY `fk_content_navigation1` (`navigation_id`),
  CONSTRAINT `fk_content_content_categories1` FOREIGN KEY (`content_categories_id`) REFERENCES `content_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_content_navigation1` FOREIGN KEY (`navigation_id`) REFERENCES `navigation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_content_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_categories`
--

DROP TABLE IF EXISTS `content_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT '0',
  `navigation_id` int(22) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_content_categories_navigation1` (`navigation_id`),
  CONSTRAINT `fk_content_categories_navigation1` FOREIGN KEY (`navigation_id`) REFERENCES `navigation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_categories`
--

LOCK TABLES `content_categories` WRITE;
/*!40000 ALTER TABLE `content_categories` DISABLE KEYS */;
INSERT INTO `content_categories` VALUES (17,'gamerules','gamerules',0,NULL),(18,'news','test',0,NULL),(19,'video','video',0,NULL);
/*!40000 ALTER TABLE `content_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_has_labels`
--

DROP TABLE IF EXISTS `content_has_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_has_labels` (
  `content_id` int(11) NOT NULL,
  `labels_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`labels_id`),
  KEY `fk_content_has_labels_labels1` (`labels_id`),
  KEY `fk_content_has_labels_content1` (`content_id`),
  CONSTRAINT `fk_content_has_labels_content1` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_content_has_labels_labels1` FOREIGN KEY (`labels_id`) REFERENCES `labels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_has_labels`
--

LOCK TABLES `content_has_labels` WRITE;
/*!40000 ALTER TABLE `content_has_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_has_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_has_user_channels`
--

DROP TABLE IF EXISTS `content_has_user_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_has_user_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `user_channels_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`content_id`,`user_channels_id`),
  KEY `fk_content_has_user_channels_user_channels1` (`user_channels_id`),
  KEY `fk_content_has_user_channels_content1` (`content_id`),
  CONSTRAINT `fk_content_has_user_channels_content1` FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_content_has_user_channels_user_channels1` FOREIGN KEY (`user_channels_id`) REFERENCES `user_channels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_has_user_channels`
--

LOCK TABLES `content_has_user_channels` WRITE;
/*!40000 ALTER TABLE `content_has_user_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_has_user_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_history`
--

DROP TABLE IF EXISTS `content_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foreign_id` int(11) DEFAULT NULL,
  `foreign_identifier` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `content` text CHARACTER SET latin1,
  `modifiedby` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_history`
--

LOCK TABLES `content_history` WRITE;
/*!40000 ALTER TABLE `content_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `color` varchar(55) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `publish` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` VALUES (1,'TAFEL alleen een tekst','text',NULL,NULL,NULL,'Application_Model_Navigation',1),(2,'inbox',NULL,NULL,NULL,2,'Application_Model_Messages',1),(3,'sent',NULL,NULL,NULL,3,'Application_Model_Messages',1),(4,'starred',NULL,NULL,NULL,5,'Application_Model_Messages',1),(5,'deleted',NULL,NULL,NULL,6,'Application_Model_Messages',1),(6,'concept',NULL,NULL,NULL,4,'Application_Model_Messages',1),(9,'TAFEL Slide show','slideShow',NULL,NULL,NULL,'Application_Model_Navigation',1),(10,'TAFEL tekst een plaatje en google maps','textImageMap',NULL,NULL,NULL,'Application_Model_Navigation',1),(11,'INTRODUCTIE tafel','tafel',NULL,NULL,NULL,'Application_Model_Navigation',1),(13,'TAFEL een video','video',NULL,NULL,NULL,'Application_Model_Navigation',1),(14,'TAFEL tekst en een plaatje','textImage',NULL,NULL,NULL,'Application_Model_Navigation',1),(16,'BARCODE film','barcodeVideo',NULL,NULL,NULL,'Application_Model_Navigation',1),(17,'BARCODE slideshow','barcodeSlideShow',NULL,NULL,NULL,'Application_Model_Navigation',1),(18,'INFOBALIE route','route',NULL,NULL,NULL,'Application_Model_Navigation',1),(19,'TAFEL flash file (swf)','swf',NULL,NULL,NULL,'Application_Model_Navigation',1),(20,'TABLET iframe','iframe',NULL,NULL,NULL,'Application_Model_Navigation',1),(21,'TABLET mediaplayer','mediaplayer',NULL,NULL,NULL,'Application_Model_Navigation',1),(22,'TABLET twitter','twitter',NULL,NULL,NULL,'Application_Model_Navigation',1),(23,'TABLET ecard','ecard',NULL,NULL,NULL,'Application_Model_Navigation',1),(24,'TAFEL vogel','bird',NULL,NULL,NULL,'Application_Model_Navigation',1),(25,'Email','...',NULL,NULL,NULL,'Application_Model_Support',1),(26,'URL','...',NULL,NULL,NULL,'Application_Model_Support',1),(27,'Telefoonnummer','...',NULL,NULL,NULL,'Application_Model_Support',1),(29,'BARCODE text','barcodeText',NULL,NULL,NULL,'Application_Model_Navigation',1),(30,'BARCODE Intro','barcodeIntro',NULL,NULL,NULL,'Application_Model_Navigation',1),(31,'TAFEL node','node',NULL,NULL,NULL,'Application_Model_Navigation',1);
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(45) DEFAULT NULL,
  `tussenvoegsel` varchar(15) DEFAULT NULL,
  `achternaam` varchar(45) DEFAULT NULL,
  `telefoon_nummer` varchar(15) DEFAULT NULL,
  `provider` varchar(45) DEFAULT NULL,
  `toestel_type` varchar(45) DEFAULT NULL,
  `huidig_abonnement` varchar(45) DEFAULT NULL,
  `abonnement_verloopdatum` date DEFAULT NULL,
  `extra_info` text,
  `status` varchar(45) DEFAULT '0',
  `status_result` varchar(45) DEFAULT '0',
  `status_text` varchar(255) DEFAULT NULL,
  `user_groups_regions_id` int(11) NOT NULL,
  `user_groups_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_leads_user_groups_regions1` (`user_groups_regions_id`),
  KEY `fk_leads_user_groups1` (`user_groups_id`),
  CONSTRAINT `fk_leads_user_groups1` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_leads_user_groups_regions1` FOREIGN KEY (`user_groups_regions_id`) REFERENCES `user_groups_regions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_target`
--

DROP TABLE IF EXISTS `leads_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(45) DEFAULT NULL,
  `week` varchar(45) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `user_groups_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_leads_target_user_groups1` (`user_groups_id`),
  CONSTRAINT `fk_leads_target_user_groups1` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_target`
--

LOCK TABLES `leads_target` WRITE;
/*!40000 ALTER TABLE `leads_target` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `media_albums_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `link` varchar(45) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `thumbnail_time` float DEFAULT NULL,
  `keycode` varchar(45) CHARACTER SET big5 COLLATE big5_bin DEFAULT NULL,
  `trackviews` int(11) DEFAULT '0',
  `publish` int(11) DEFAULT '1',
  `unix_timestamp` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `dateshot` datetime DEFAULT NULL,
  `fb_likes` int(11) DEFAULT '0',
  `resampled` varchar(255) DEFAULT NULL,
  `exif` text,
  `geo_lat` varchar(255) DEFAULT NULL,
  `geo_lng` varchar(255) DEFAULT NULL,
  `album_selected_overlay` varchar(45) DEFAULT NULL,
  `view` varchar(22) DEFAULT NULL,
  `tc_status` varchar(45) DEFAULT NULL,
  `tc_key` varchar(45) DEFAULT NULL,
  `tc_settings` text,
  `tc_320` varchar(255) DEFAULT NULL,
  `tc_480` varchar(255) DEFAULT NULL,
  `tc_720` varchar(255) DEFAULT NULL,
  `tc_1080` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_user1` (`user_id`),
  KEY `fk_media_media_albums1` (`media_albums_id`),
  CONSTRAINT `fk_media_media_albums1` FOREIGN KEY (`media_albums_id`) REFERENCES `media_albums` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_media_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_albums`
--

DROP TABLE IF EXISTS `media_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `read_title` varchar(155) NOT NULL,
  `email` varchar(85) DEFAULT NULL,
  `description` text,
  `publish` int(1) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `thumbnail_time` float DEFAULT NULL,
  `transcode` int(11) DEFAULT NULL,
  `transcode_settings` text,
  `trackviews` int(11) DEFAULT NULL,
  `thumbnail` smallint(6) DEFAULT NULL,
  `overlay` text,
  `read_exif` smallint(6) DEFAULT NULL,
  `thumb_width` int(11) DEFAULT NULL,
  `thumb_height` int(11) DEFAULT NULL,
  `thumb_top` int(11) DEFAULT '0',
  `thumb_left` int(11) DEFAULT '0',
  `overlay_width` int(11) DEFAULT NULL,
  `overlay_height` int(11) DEFAULT NULL,
  `overlay_top` int(11) DEFAULT NULL,
  `overlay_left` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_albums`
--

LOCK TABLES `media_albums` WRITE;
/*!40000 ALTER TABLE `media_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_views`
--

DROP TABLE IF EXISTS `media_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remote_ip` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `media_id` int(11) NOT NULL,
  `unix_timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_views_media1` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_views`
--

LOCK TABLES `media_views` WRITE;
/*!40000 ALTER TABLE `media_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) NOT NULL,
  `sub_color` varchar(255) NOT NULL,
  `alt_color` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `publish` int(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `md5` varchar(255) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `labels_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_navigation_labels1` (`labels_id`),
  CONSTRAINT `fk_navigation_labels1` FOREIGN KEY (`labels_id`) REFERENCES `labels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `title` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `readed` tinyint(4) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_subject` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_notify_user1` (`user_id`),
  KEY `fk_notify_user2` (`user_subject`),
  CONSTRAINT `fk_notify_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_notify_user2` FOREIGN KEY (`user_subject`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_root` int(11) DEFAULT NULL,
  `sub_period_id` int(11) DEFAULT NULL,
  `name` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `publish` int(1) DEFAULT NULL,
  `meta_created` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `user_levels_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_periods_user1` (`user_id`),
  KEY `fk_periods_user_channels1` (`channel_id`),
  KEY `fk_periods_user_levels1` (`user_levels_id`),
  KEY `fk_periods_periods1` (`sub_period_id`),
  CONSTRAINT `fk_periods_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_periods_user_channels1` FOREIGN KEY (`channel_id`) REFERENCES `user_channels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_periods_user_levels1` FOREIGN KEY (`user_levels_id`) REFERENCES `user_levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods_content`
--

DROP TABLE IF EXISTS `periods_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `foreign_id` varchar(255) DEFAULT NULL,
  `periods_id` int(11) NOT NULL,
  `periods_models_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_periods_content_periods1` (`periods_id`),
  KEY `fk_periods_content_periods_models1` (`periods_models_id`),
  CONSTRAINT `fk_periods_content_periods1` FOREIGN KEY (`periods_id`) REFERENCES `periods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_periods_content_periods_models1` FOREIGN KEY (`periods_models_id`) REFERENCES `periods_models` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods_content`
--

LOCK TABLES `periods_content` WRITE;
/*!40000 ALTER TABLE `periods_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `periods_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods_models`
--

DROP TABLE IF EXISTS `periods_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_identifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods_models`
--

LOCK TABLES `periods_models` WRITE;
/*!40000 ALTER TABLE `periods_models` DISABLE KEYS */;
INSERT INTO `periods_models` VALUES (3,'Assignment','Application_Model_Tasks','title'),(4,'Quiz','Application_Model_Quiz','name'),(5,'Actions','Application_Model_Actions','title');
/*!40000 ALTER TABLE `periods_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_answers`
--

DROP TABLE IF EXISTS `poll_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `votes` int(11) DEFAULT NULL,
  `publish` tinyint(4) DEFAULT NULL,
  `poll_questions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poll_answers_poll_questions1` (`poll_questions_id`),
  CONSTRAINT `fk_poll_answers_poll_questions1` FOREIGN KEY (`poll_questions_id`) REFERENCES `poll_questions` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_answers`
--

LOCK TABLES `poll_answers` WRITE;
/*!40000 ALTER TABLE `poll_answers` DISABLE KEYS */;
INSERT INTO `poll_answers` VALUES (1,'antwoord 1',NULL,1,1),(2,'antwoord 2',NULL,1,1),(3,'antwoord 3',NULL,1,1);
/*!40000 ALTER TABLE `poll_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_has_user_channels`
--

DROP TABLE IF EXISTS `poll_has_user_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_has_user_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_questions_id` int(11) NOT NULL,
  `user_channels_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poll_has_user_channels_poll_questions1` (`poll_questions_id`),
  KEY `fk_poll_has_user_channels_user_channels1` (`user_channels_id`),
  CONSTRAINT `fk_poll_has_user_channels_poll_questions1` FOREIGN KEY (`poll_questions_id`) REFERENCES `poll_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_poll_has_user_channels_user_channels1` FOREIGN KEY (`user_channels_id`) REFERENCES `user_channels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_has_user_channels`
--

LOCK TABLES `poll_has_user_channels` WRITE;
/*!40000 ALTER TABLE `poll_has_user_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `poll_has_user_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_questions`
--

DROP TABLE IF EXISTS `poll_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `allow_view_result` tinyint(4) DEFAULT '1',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_questions`
--

LOCK TABLES `poll_questions` WRITE;
/*!40000 ALTER TABLE `poll_questions` DISABLE KEYS */;
INSERT INTO `poll_questions` VALUES (1,'test poll','test poll question',NULL,1,1,'');
/*!40000 ALTER TABLE `poll_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poll_user_answers`
--

DROP TABLE IF EXISTS `poll_user_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poll_user_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `explanation` text,
  `votes` int(11) DEFAULT NULL,
  `poll_answers_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_poll_user_answers_poll_answers1` (`poll_answers_id`),
  CONSTRAINT `fk_poll_user_answers_poll_answers1` FOREIGN KEY (`poll_answers_id`) REFERENCES `poll_answers` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poll_user_answers`
--

LOCK TABLES `poll_user_answers` WRITE;
/*!40000 ALTER TABLE `poll_user_answers` DISABLE KEYS */;
INSERT INTO `poll_user_answers` VALUES (132,NULL,NULL,16),(133,NULL,NULL,18),(134,NULL,NULL,15),(135,NULL,NULL,17),(136,NULL,NULL,19),(137,NULL,NULL,15),(138,NULL,NULL,17),(139,NULL,NULL,NULL),(140,NULL,NULL,19),(142,NULL,NULL,17),(143,NULL,NULL,19),(144,NULL,NULL,15),(145,NULL,NULL,15),(146,NULL,NULL,NULL),(147,NULL,NULL,25),(148,NULL,NULL,25),(149,NULL,NULL,23),(150,NULL,NULL,22),(151,NULL,NULL,22),(152,NULL,NULL,22),(153,NULL,NULL,23),(154,NULL,NULL,22),(155,NULL,NULL,22),(156,NULL,NULL,24),(157,NULL,NULL,22),(158,NULL,NULL,22),(159,NULL,NULL,22),(160,NULL,NULL,25),(161,NULL,NULL,27),(162,NULL,NULL,27),(163,NULL,NULL,NULL),(164,NULL,NULL,NULL),(166,NULL,NULL,NULL),(167,NULL,NULL,NULL),(168,NULL,NULL,NULL),(169,NULL,NULL,NULL),(170,NULL,NULL,NULL),(171,NULL,NULL,NULL),(172,NULL,NULL,NULL),(173,NULL,NULL,NULL),(174,NULL,NULL,NULL),(175,NULL,NULL,NULL),(176,NULL,NULL,NULL),(177,NULL,NULL,NULL),(178,NULL,NULL,NULL),(179,NULL,NULL,NULL),(180,NULL,NULL,NULL),(181,NULL,NULL,NULL),(182,NULL,NULL,NULL),(183,NULL,NULL,NULL),(184,NULL,NULL,NULL),(185,NULL,NULL,NULL),(186,NULL,NULL,NULL),(187,NULL,NULL,3);
/*!40000 ALTER TABLE `poll_user_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrcode`
--

DROP TABLE IF EXISTS `qrcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resampled` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qrcode_behaviours_id` int(11) NOT NULL,
  `qrcode_categories_id` int(11) NOT NULL,
  `qrcode_locations_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qrcode_qrcode_categories1` (`qrcode_categories_id`),
  KEY `fk_qrcode_qrcode_locations1` (`qrcode_locations_id`),
  KEY `fk_qrcode_user1` (`user_id`),
  KEY `fk_qrcode_qrcode_behaviour1` (`qrcode_behaviours_id`),
  CONSTRAINT `fk_qrcode_qrcode_behaviour1` FOREIGN KEY (`qrcode_behaviours_id`) REFERENCES `qrcode_behaviours` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_qrcode_qrcode_categories1` FOREIGN KEY (`qrcode_categories_id`) REFERENCES `qrcode_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_qrcode_qrcode_locations1` FOREIGN KEY (`qrcode_locations_id`) REFERENCES `qrcode_locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_qrcode_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrcode`
--

LOCK TABLES `qrcode` WRITE;
/*!40000 ALTER TABLE `qrcode` DISABLE KEYS */;
INSERT INTO `qrcode` VALUES (24,'fietshanger',NULL,'defe50f52e9b99eb9b2f5f5d84bec524','http://www.catchflight9860.nl/scan/defe50f52e9b99eb9b2f5f5d84bec524','2011-08-26 10:30:16','/images-db/upload/qrcode/defe50f52e9b99eb9b2f5f5d84bec524.png','/images-db/upload/qrcode/B_defe50f52e9b99eb9b2f5f5d84bec524.png',8,2,15,1),(25,'sticker KPN',NULL,'23c9b54311ede666bf1f09ceb62eb563','http://www.catchflight9860.nl/scan/23c9b54311ede666bf1f09ceb62eb563','2011-08-26 10:34:52','/images-db/upload/qrcode/23c9b54311ede666bf1f09ceb62eb563.png',NULL,9,4,11,1),(26,'sticker HI',NULL,'0056f3847063e712fdcfdf1a3a004efa','http://www.catchflight9860.nl/scan/0056f3847063e712fdcfdf1a3a004efa','2011-08-26 10:35:55','/images-db/upload/qrcode/0056f3847063e712fdcfdf1a3a004efa.png',NULL,9,4,11,1),(27,'SpeelkaartenControl',NULL,'72ef8ead6b6f46afad27dac5a6d8b50d','http://www.catchflight9860.nl/scan/72ef8ead6b6f46afad27dac5a6d8b50d','2011-08-26 11:55:12','/images-db/upload/qrcode/72ef8ead6b6f46afad27dac5a6d8b50d.png','/images-db/upload/qrcode/B_72ef8ead6b6f46afad27dac5a6d8b50d.png',8,2,16,1),(28,'SpeelkaartenMedia',NULL,'8322394fe3be468157a21a267d9bdf6a','http://www.catchflight9860.nl/scan/8322394fe3be468157a21a267d9bdf6a','2011-08-26 11:56:34','/images-db/upload/qrcode/8322394fe3be468157a21a267d9bdf6a.png','/images-db/upload/qrcode/B_8322394fe3be468157a21a267d9bdf6a.png',8,5,17,1),(29,'SpeelkaartenGaming',NULL,'f40279e98d22969c4e9f504eaba6e43d','http://www.catchflight9860.nl/scan/f40279e98d22969c4e9f504eaba6e43d','2011-08-26 11:57:00','/images-db/upload/qrcode/f40279e98d22969c4e9f504eaba6e43d.png','/images-db/upload/qrcode/B_f40279e98d22969c4e9f504eaba6e43d.png',8,3,18,1),(30,'SpeelkaartenPing',NULL,'8f511dc2b84500d8083679739a2f085e','http://www.catchflight9860.nl/scan/8f511dc2b84500d8083679739a2f085e','2011-08-26 11:57:37','/images-db/upload/qrcode/8f511dc2b84500d8083679739a2f085e.png','/images-db/upload/qrcode/B_8f511dc2b84500d8083679739a2f085e.png',8,1,19,1),(31,'FlyerPing',NULL,'f188192f470015bccbba8084bc2c02ee','http://www.catchflight9860.nl/scan/f188192f470015bccbba8084bc2c02ee','2011-08-26 13:47:18','/images-db/upload/qrcode/f188192f470015bccbba8084bc2c02ee.png','/images-db/upload/qrcode/B_f188192f470015bccbba8084bc2c02ee.png',8,1,20,1),(32,'StationspanelenGaming',NULL,'f00bfe34fec6b352ac76423a2458f1cb','http://www.catchflight9860.nl/scan/f00bfe34fec6b352ac76423a2458f1cb','2011-08-26 14:08:54','/images-db/upload/qrcode/f00bfe34fec6b352ac76423a2458f1cb.png','/images-db/upload/qrcode/B_f00bfe34fec6b352ac76423a2458f1cb.png',8,3,21,1),(33,'StationspanelenPing',NULL,'4246b56947d6ab4df0f1e6eafb5147f5','http://www.catchflight9860.nl/scan/4246b56947d6ab4df0f1e6eafb5147f5','2011-08-26 14:09:19','/images-db/upload/qrcode/4246b56947d6ab4df0f1e6eafb5147f5.png','/images-db/upload/qrcode/B_4246b56947d6ab4df0f1e6eafb5147f5.png',8,1,22,1),(34,'MetrohelepaginaControl',NULL,'a4b5e3c2d8d67186c638e02f9f21976f','http://www.catchflight9860.nl/scan/a4b5e3c2d8d67186c638e02f9f21976f','2011-08-26 14:45:28','/images-db/upload/qrcode/a4b5e3c2d8d67186c638e02f9f21976f.png','/images-db/upload/qrcode/B_a4b5e3c2d8d67186c638e02f9f21976f.png',8,2,23,1),(35,'MetrohelepaginaGaming',NULL,'32f1c9fd01f12ac732617865d4cac2c4','http://www.catchflight9860.nl/scan/32f1c9fd01f12ac732617865d4cac2c4','2011-08-26 14:47:02','/images-db/upload/qrcode/32f1c9fd01f12ac732617865d4cac2c4.png','/images-db/upload/qrcode/B_32f1c9fd01f12ac732617865d4cac2c4.png',8,3,24,1),(36,'Metro1_8Media',NULL,'5ea6fcf465e65673889d08ad487b7a1e','http://www.catchflight9860.nl/scan/5ea6fcf465e65673889d08ad487b7a1e','2011-08-26 14:50:07','/images-db/upload/qrcode/5ea6fcf465e65673889d08ad487b7a1e.png','/images-db/upload/qrcode/B_5ea6fcf465e65673889d08ad487b7a1e.png',8,5,25,1),(37,'Metro1_8Control',NULL,'3842c316ccdb1ae4cef332efc13e0c3b','http://www.catchflight9860.nl/scan/3842c316ccdb1ae4cef332efc13e0c3b','2011-08-26 14:50:58','/images-db/upload/qrcode/3842c316ccdb1ae4cef332efc13e0c3b.png','/images-db/upload/qrcode/B_3842c316ccdb1ae4cef332efc13e0c3b.png',8,2,26,1),(38,'Metro1_8Gaming1',NULL,'daf514e7ff297d833970e6693962a72b','http://www.catchflight9860.nl/scan/daf514e7ff297d833970e6693962a72b','2011-08-26 14:52:37','/images-db/upload/qrcode/daf514e7ff297d833970e6693962a72b.png','/images-db/upload/qrcode/B_daf514e7ff297d833970e6693962a72b.png',8,3,27,1),(39,'Metro1_8Gaming2',NULL,'a30bed8d5ec262fedd15751256884d63','http://www.catchflight9860.nl/scan/a30bed8d5ec262fedd15751256884d63','2011-08-26 14:53:06','/images-db/upload/qrcode/a30bed8d5ec262fedd15751256884d63.png','/images-db/upload/qrcode/B_a30bed8d5ec262fedd15751256884d63.png',8,3,28,1),(40,'Metro1_8Ping1',NULL,'8bf33f336b8665f69f85e87e1d2fc9ae','http://www.catchflight9860.nl/scan/8bf33f336b8665f69f85e87e1d2fc9ae','2011-08-26 14:58:07','/images-db/upload/qrcode/8bf33f336b8665f69f85e87e1d2fc9ae.png','/images-db/upload/qrcode/B_8bf33f336b8665f69f85e87e1d2fc9ae.png',8,1,29,1),(41,'Metro1_8Ping2',NULL,'868aa0113a4a84dd33e06057fc4702a1','http://www.catchflight9860.nl/scan/868aa0113a4a84dd33e06057fc4702a1','2011-08-26 14:58:32','/images-db/upload/qrcode/868aa0113a4a84dd33e06057fc4702a1.png','/images-db/upload/qrcode/B_868aa0113a4a84dd33e06057fc4702a1.png',8,1,30,1),(42,'SpitshelepaginaMedia',NULL,'48334381e2f8e40f7b39872d3102ab64','http://www.catchflight9860.nl/scan/48334381e2f8e40f7b39872d3102ab64','2011-08-26 15:00:39','/images-db/upload/qrcode/48334381e2f8e40f7b39872d3102ab64.png','/images-db/upload/qrcode/B_48334381e2f8e40f7b39872d3102ab64.png',8,5,31,1),(43,'SpitshelepaginaPing',NULL,'92b7181e131eecd11ac5685eba5ce57a','http://www.catchflight9860.nl/scan/92b7181e131eecd11ac5685eba5ce57a','2011-08-26 15:01:36','/images-db/upload/qrcode/92b7181e131eecd11ac5685eba5ce57a.png','/images-db/upload/qrcode/B_92b7181e131eecd11ac5685eba5ce57a.png',8,1,32,1),(44,'Spits1_8Media',NULL,'56e95b3639c08fd7eb513c1e5ab683c1','http://www.catchflight9860.nl/scan/56e95b3639c08fd7eb513c1e5ab683c1','2011-08-26 15:03:49','/images-db/upload/qrcode/56e95b3639c08fd7eb513c1e5ab683c1.png','/images-db/upload/qrcode/B_56e95b3639c08fd7eb513c1e5ab683c1.png',8,5,33,1),(45,'Spits1_8Control',NULL,'6fc77a452ba406517f64a0a7af79c0d5','http://www.catchflight9860.nl/scan/6fc77a452ba406517f64a0a7af79c0d5','2011-08-26 15:06:51','/images-db/upload/qrcode/6fc77a452ba406517f64a0a7af79c0d5.png','/images-db/upload/qrcode/B_6fc77a452ba406517f64a0a7af79c0d5.png',8,2,34,1),(46,'Spits1_8Gaming1',NULL,'11a8d4bd04e853a899484886ab7b47a3','http://www.catchflight9860.nl/scan/11a8d4bd04e853a899484886ab7b47a3','2011-08-26 15:21:27','/images-db/upload/qrcode/11a8d4bd04e853a899484886ab7b47a3.png','/images-db/upload/qrcode/B_11a8d4bd04e853a899484886ab7b47a3.png',8,3,35,1),(47,'Spits1_8Gaming2',NULL,'c1ceadb8aabef25ca69a49b3efbae856','http://www.catchflight9860.nl/scan/c1ceadb8aabef25ca69a49b3efbae856','2011-08-26 15:22:23','/images-db/upload/qrcode/c1ceadb8aabef25ca69a49b3efbae856.png','/images-db/upload/qrcode/B_c1ceadb8aabef25ca69a49b3efbae856.png',8,3,36,1),(48,'Spits1_8Ping1',NULL,'400cbddb0a9675f80edb30db5e1a00c5','http://www.catchflight9860.nl/scan/400cbddb0a9675f80edb30db5e1a00c5','2011-08-26 15:24:42','/images-db/upload/qrcode/400cbddb0a9675f80edb30db5e1a00c5.png','/images-db/upload/qrcode/B_400cbddb0a9675f80edb30db5e1a00c5.png',8,1,37,1),(49,'Spits1_8Ping2',NULL,'64a9617c7bb92cb092971d5bcd52dd47','http://www.catchflight9860.nl/scan/64a9617c7bb92cb092971d5bcd52dd47','2011-08-26 15:25:06','/images-db/upload/qrcode/64a9617c7bb92cb092971d5bcd52dd47.png','/images-db/upload/qrcode/B_64a9617c7bb92cb092971d5bcd52dd47.png',8,1,38,1),(50,'ToiletpostersGaming',NULL,'b623c7cf796d5879debeaf3da0898aee','http://www.catchflight9860.nl/scan/b623c7cf796d5879debeaf3da0898aee','2011-08-26 15:36:12','/images-db/upload/qrcode/b623c7cf796d5879debeaf3da0898aee.png','/images-db/upload/qrcode/B_b623c7cf796d5879debeaf3da0898aee.png',8,3,39,1),(51,'ToiletpostersPing',NULL,'cd8a93bbfbd4425f2fa36f6c13376ce8','http://www.catchflight9860.nl/scan/cd8a93bbfbd4425f2fa36f6c13376ce8','2011-08-26 15:36:37','/images-db/upload/qrcode/cd8a93bbfbd4425f2fa36f6c13376ce8.png','/images-db/upload/qrcode/B_cd8a93bbfbd4425f2fa36f6c13376ce8.png',8,1,40,1),(52,'ToiletpostersControl',NULL,'4ec009e30a2ae2cf42d845c3ca1ccdc7','http://www.catchflight9860.nl/scan/4ec009e30a2ae2cf42d845c3ca1ccdc7','2011-08-26 15:37:01','/images-db/upload/qrcode/4ec009e30a2ae2cf42d845c3ca1ccdc7.png','/images-db/upload/qrcode/B_4ec009e30a2ae2cf42d845c3ca1ccdc7.png',8,2,41,1),(53,'ToiletpostersMedia',NULL,'cceb37f56830c3d8215a4c3003e546be','http://www.catchflight9860.nl/scan/cceb37f56830c3d8215a4c3003e546be','2011-08-26 15:37:24','/images-db/upload/qrcode/cceb37f56830c3d8215a4c3003e546be.png','/images-db/upload/qrcode/B_cceb37f56830c3d8215a4c3003e546be.png',8,5,42,1),(54,'Metropanelen_mediabureau',NULL,'8c9929c1d192c305bc5fbc8e305e3642','http://www.catchflight9860.nl/scan/8c9929c1d192c305bc5fbc8e305e3642','2011-08-26 15:38:25','/images-db/upload/qrcode/8c9929c1d192c305bc5fbc8e305e3642.png','/images-db/upload/qrcode/B_8c9929c1d192c305bc5fbc8e305e3642.png',8,3,43,1),(55,'HBOWOControl',NULL,'1f518822f4f9b4d55e28d2b46e65f997','http://www.catchflight9860.nl/scan/1f518822f4f9b4d55e28d2b46e65f997','2011-08-26 15:44:20','/images-db/upload/qrcode/1f518822f4f9b4d55e28d2b46e65f997.png','/images-db/upload/qrcode/B_1f518822f4f9b4d55e28d2b46e65f997.png',8,2,44,1),(56,'HBOWOMedia',NULL,'8a08fd2d38ea5cf791536a29b6684255','http://www.catchflight9860.nl/scan/8a08fd2d38ea5cf791536a29b6684255','2011-08-26 15:45:04','/images-db/upload/qrcode/8a08fd2d38ea5cf791536a29b6684255.png','/images-db/upload/qrcode/B_8a08fd2d38ea5cf791536a29b6684255.png',8,5,45,1),(57,'BierviltjesControl',NULL,'69a49f0094e6f8b007f61fe92d2f14d7','http://www.catchflight9860.nl/scan/69a49f0094e6f8b007f61fe92d2f14d7','2011-08-26 15:49:27','/images-db/upload/qrcode/69a49f0094e6f8b007f61fe92d2f14d7.png','/images-db/upload/qrcode/B_69a49f0094e6f8b007f61fe92d2f14d7.png',8,2,46,1),(58,'BierviltjesMedia',NULL,'aa90bfd4d16706de7860e836bb61e694','http://www.catchflight9860.nl/scan/aa90bfd4d16706de7860e836bb61e694','2011-08-26 15:50:17','/images-db/upload/qrcode/aa90bfd4d16706de7860e836bb61e694.png','/images-db/upload/qrcode/B_aa90bfd4d16706de7860e836bb61e694.png',8,5,47,1),(59,'BierviltjesGaming',NULL,'5dcc2055c8a9552bdcabad6826ec1313','http://www.catchflight9860.nl/scan/5dcc2055c8a9552bdcabad6826ec1313','2011-08-26 15:50:50','/images-db/upload/qrcode/5dcc2055c8a9552bdcabad6826ec1313.png','/images-db/upload/qrcode/B_5dcc2055c8a9552bdcabad6826ec1313.png',8,3,48,1),(60,'BierviltjesPing1',NULL,'c749fdd4f20d59b5e524951c6b2d8eb1','http://www.catchflight9860.nl/scan/c749fdd4f20d59b5e524951c6b2d8eb1','2011-08-26 15:51:22','/images-db/upload/qrcode/c749fdd4f20d59b5e524951c6b2d8eb1.png','/images-db/upload/qrcode/B_c749fdd4f20d59b5e524951c6b2d8eb1.png',8,1,49,1),(61,'BierviltjesPing2',NULL,'87f0ba82efd982935a11c34e16ddaeb6','http://www.catchflight9860.nl/scan/87f0ba82efd982935a11c34e16ddaeb6','2011-08-26 15:51:48','/images-db/upload/qrcode/87f0ba82efd982935a11c34e16ddaeb6.png','/images-db/upload/qrcode/B_87f0ba82efd982935a11c34e16ddaeb6.png',8,1,50,1),(62,'special two',NULL,'32d230fc25095fcc63ec146a387dfa89','http://www.catchflight9860.nl/scan/32d230fc25095fcc63ec146a387dfa89','2011-08-31 10:31:49','/images-db/upload/qrcode/32d230fc25095fcc63ec146a387dfa89.png',NULL,6,6,51,1),(63,'CommeDesLeroi.com_Ping',NULL,'acb244e1babce539930199e1e1ce29ef','http://www.catchflight9860.nl/scan/acb244e1babce539930199e1e1ce29ef','2011-09-05 13:18:14','/images-db/upload/qrcode/acb244e1babce539930199e1e1ce29ef.png','/images-db/upload/qrcode/B_acb244e1babce539930199e1e1ce29ef.png',8,1,62,1),(64,'dutchcowgirls.nl/bloggers/854_Media',NULL,'717a961ac9abab8f70533bb3e2973a3d','http://www.catchflight9860.nl/scan/717a961ac9abab8f70533bb3e2973a3d','2011-09-05 13:29:36','/images-db/upload/qrcode/717a961ac9abab8f70533bb3e2973a3d.png','/images-db/upload/qrcode/B_717a961ac9abab8f70533bb3e2973a3d.png',8,5,63,1),(65,'Viceland.nl_Control',NULL,'85dcbb2e8e6baf01c3f23176d57bd9db','http://www.catchflight9860.nl/scan/85dcbb2e8e6baf01c3f23176d57bd9db','2011-09-05 13:30:59','/images-db/upload/qrcode/85dcbb2e8e6baf01c3f23176d57bd9db.png','/images-db/upload/qrcode/B_85dcbb2e8e6baf01c3f23176d57bd9db.png',8,2,64,1),(66,'AfterDRK.com_Gaming',NULL,'311317fb12f45497c5e004631ed38538','http://www.catchflight9860.nl/scan/311317fb12f45497c5e004631ed38538','2011-09-05 13:31:48','/images-db/upload/qrcode/311317fb12f45497c5e004631ed38538.png','/images-db/upload/qrcode/B_311317fb12f45497c5e004631ed38538.png',8,3,65,1),(68,'Nalden.net_Ping',NULL,'d6c8c634473081d7b15fd1a1d3c36451','http://www.catchflight9860.nl/scan/d6c8c634473081d7b15fd1a1d3c36451','2011-09-05 13:33:27','/images-db/upload/qrcode/d6c8c634473081d7b15fd1a1d3c36451.png','/images-db/upload/qrcode/B_d6c8c634473081d7b15fd1a1d3c36451.png',8,1,66,1),(69,'Tweakers.net_Media',NULL,'f0719258200df5d0c3fd81649648015b','http://www.catchflight9860.nl/scan/f0719258200df5d0c3fd81649648015b','2011-09-05 13:34:10','/images-db/upload/qrcode/f0719258200df5d0c3fd81649648015b.png','/images-db/upload/qrcode/B_f0719258200df5d0c3fd81649648015b.png',8,5,67,1),(70,'Puna.nl_Control',NULL,'647828b5331d3d295dde0a95a286cf77','http://www.catchflight9860.nl/scan/647828b5331d3d295dde0a95a286cf77','2011-09-05 13:35:44','/images-db/upload/qrcode/647828b5331d3d295dde0a95a286cf77.png','/images-db/upload/qrcode/B_647828b5331d3d295dde0a95a286cf77.png',8,2,68,1),(71,'Froot.nl_Gaming',NULL,'d602b65214a4552273a1878b1152d159','http://www.catchflight9860.nl/scan/d602b65214a4552273a1878b1152d159','2011-09-05 13:49:17','/images-db/upload/qrcode/d602b65214a4552273a1878b1152d159.png','/images-db/upload/qrcode/B_d602b65214a4552273a1878b1152d159.png',8,3,69,1),(72,'Nsmbl.nl _Ping',NULL,'f123f2084faf0ad669927dfd36fcab86','http://www.catchflight9860.nl/scan/f123f2084faf0ad669927dfd36fcab86','2011-09-05 13:49:53','/images-db/upload/qrcode/f123f2084faf0ad669927dfd36fcab86.png','/images-db/upload/qrcode/B_f123f2084faf0ad669927dfd36fcab86.png',8,1,70,1),(73,'Youtube_Ping',NULL,'9cd3a36135f0912953fc4a1309f7729c','http://www.catchflight9860.nl/scan/9cd3a36135f0912953fc4a1309f7729c','2011-09-05 14:00:03','/images-db/upload/qrcode/9cd3a36135f0912953fc4a1309f7729c.png','/images-db/upload/qrcode/B_9cd3a36135f0912953fc4a1309f7729c.png',8,1,52,1),(74,'Youtube_Media',NULL,'f853009de54f98ee7756e5dd1120f630','http://www.catchflight9860.nl/scan/f853009de54f98ee7756e5dd1120f630','2011-09-05 14:00:26','/images-db/upload/qrcode/f853009de54f98ee7756e5dd1120f630.png','/images-db/upload/qrcode/B_f853009de54f98ee7756e5dd1120f630.png',8,5,52,1),(75,'Youtube_Control',NULL,'f8032afe3a2545810c435fb826c055cd','http://www.catchflight9860.nl/scan/f8032afe3a2545810c435fb826c055cd','2011-09-05 14:00:51','/images-db/upload/qrcode/f8032afe3a2545810c435fb826c055cd.png','/images-db/upload/qrcode/B_f8032afe3a2545810c435fb826c055cd.png',8,2,52,1),(76,'Youtube_Gaming',NULL,'45e25c32d563954718f08adce6acf465','http://www.catchflight9860.nl/scan/45e25c32d563954718f08adce6acf465','2011-09-05 14:01:13','/images-db/upload/qrcode/45e25c32d563954718f08adce6acf465.png','/images-db/upload/qrcode/B_45e25c32d563954718f08adce6acf465.png',8,3,52,1),(77,'Catchflight_Facebook_Ping1',NULL,'7ad9bd306aad3e857d95274e1f49a004','http://www.catchflight9860.nl/scan/7ad9bd306aad3e857d95274e1f49a004','2011-09-05 14:02:18','/images-db/upload/qrcode/7ad9bd306aad3e857d95274e1f49a004.png','/images-db/upload/qrcode/B_7ad9bd306aad3e857d95274e1f49a004.png',8,1,53,1),(78,'Catchflight_Facebook_Ping2',NULL,'1213c7f6b180902a315b5aaa184a2e7e','http://www.catchflight9860.nl/scan/1213c7f6b180902a315b5aaa184a2e7e','2011-09-05 14:02:32','/images-db/upload/qrcode/1213c7f6b180902a315b5aaa184a2e7e.png','/images-db/upload/qrcode/B_1213c7f6b180902a315b5aaa184a2e7e.png',8,1,53,1),(79,'Catchflight_Facebook_Ping3',NULL,'8ca0887676303d9c3b7e9b06137f264a','http://www.catchflight9860.nl/scan/8ca0887676303d9c3b7e9b06137f264a','2011-09-05 14:02:49','/images-db/upload/qrcode/8ca0887676303d9c3b7e9b06137f264a.png','/images-db/upload/qrcode/B_8ca0887676303d9c3b7e9b06137f264a.png',8,1,53,1),(80,'Catchflight_Facebook_Ping4',NULL,'b16016e6fc12fbf5b9eedcdf736d7f94','http://www.catchflight9860.nl/scan/b16016e6fc12fbf5b9eedcdf736d7f94','2011-09-05 14:03:04','/images-db/upload/qrcode/b16016e6fc12fbf5b9eedcdf736d7f94.png','/images-db/upload/qrcode/B_b16016e6fc12fbf5b9eedcdf736d7f94.png',8,1,53,1),(81,'Catchflight_Facebook_Media1',NULL,'79ef2c00f6a8ff03d179ed777c20b202','http://www.catchflight9860.nl/scan/79ef2c00f6a8ff03d179ed777c20b202','2011-09-05 14:07:35','/images-db/upload/qrcode/79ef2c00f6a8ff03d179ed777c20b202.png','/images-db/upload/qrcode/B_79ef2c00f6a8ff03d179ed777c20b202.png',8,5,53,1),(82,'Catchflight_Facebook_Media2',NULL,'2b64299f584b80b990edd2c00a9a3ee7','http://www.catchflight9860.nl/scan/2b64299f584b80b990edd2c00a9a3ee7','2011-09-05 14:08:23','/images-db/upload/qrcode/2b64299f584b80b990edd2c00a9a3ee7.png','/images-db/upload/qrcode/B_2b64299f584b80b990edd2c00a9a3ee7.png',8,5,53,1),(83,'Catchflight_Facebook_Media3',NULL,'eb6cdee42471c4d7a506f394b83eee21','http://www.catchflight9860.nl/scan/eb6cdee42471c4d7a506f394b83eee21','2011-09-05 14:09:01','/images-db/upload/qrcode/eb6cdee42471c4d7a506f394b83eee21.png','/images-db/upload/qrcode/B_eb6cdee42471c4d7a506f394b83eee21.png',8,5,53,1),(84,'Catchflight_Facebook_Media4',NULL,'125fcdcb985661cad6fb94c4679f8c1a','http://www.catchflight9860.nl/scan/125fcdcb985661cad6fb94c4679f8c1a','2011-09-05 14:09:19','/images-db/upload/qrcode/125fcdcb985661cad6fb94c4679f8c1a.png','/images-db/upload/qrcode/B_125fcdcb985661cad6fb94c4679f8c1a.png',8,5,53,1),(85,'Catchflight_Facebook_Control1',NULL,'87fdfd431112bf00186bbdcc4ce608c3','http://www.catchflight9860.nl/scan/87fdfd431112bf00186bbdcc4ce608c3','2011-09-05 14:10:17','/images-db/upload/qrcode/87fdfd431112bf00186bbdcc4ce608c3.png','/images-db/upload/qrcode/B_87fdfd431112bf00186bbdcc4ce608c3.png',8,2,53,1),(86,'Catchflight_Facebook_Control2',NULL,'7f9e5630419f5f4cb8c43f512799b31b','http://www.catchflight9860.nl/scan/7f9e5630419f5f4cb8c43f512799b31b','2011-09-05 14:10:31','/images-db/upload/qrcode/7f9e5630419f5f4cb8c43f512799b31b.png','/images-db/upload/qrcode/B_7f9e5630419f5f4cb8c43f512799b31b.png',8,2,53,1),(87,'Catchflight_Facebook_Control3',NULL,'03ebe2a799bf992c4a31af4707cb3b34','http://www.catchflight9860.nl/scan/03ebe2a799bf992c4a31af4707cb3b34','2011-09-05 14:10:46','/images-db/upload/qrcode/03ebe2a799bf992c4a31af4707cb3b34.png','/images-db/upload/qrcode/B_03ebe2a799bf992c4a31af4707cb3b34.png',8,2,53,1),(88,'Catchflight_Facebook_Control4',NULL,'c494451364987cdcb1c5056ebf97f172','http://www.catchflight9860.nl/scan/c494451364987cdcb1c5056ebf97f172','2011-09-05 14:10:59','/images-db/upload/qrcode/c494451364987cdcb1c5056ebf97f172.png','/images-db/upload/qrcode/B_c494451364987cdcb1c5056ebf97f172.png',8,2,53,1),(89,'Catchflight_Facebook_Gaming1',NULL,'4ae404f937be97ee852aab82b89c5d71','http://www.catchflight9860.nl/scan/4ae404f937be97ee852aab82b89c5d71','2011-09-05 14:15:37','/images-db/upload/qrcode/4ae404f937be97ee852aab82b89c5d71.png','/images-db/upload/qrcode/B_4ae404f937be97ee852aab82b89c5d71.png',8,3,53,1),(90,'Catchflight_Facebook_Gaming2',NULL,'1fd88fac6bb3d5e36cfbdb988913ffb3','http://www.catchflight9860.nl/scan/1fd88fac6bb3d5e36cfbdb988913ffb3','2011-09-05 14:25:37','/images-db/upload/qrcode/1fd88fac6bb3d5e36cfbdb988913ffb3.png','/images-db/upload/qrcode/B_1fd88fac6bb3d5e36cfbdb988913ffb3.png',8,3,53,1),(91,'Catchflight_Facebook_Gaming3',NULL,'d0134e36f9bb6c238cb345a4471063a9','http://www.catchflight9860.nl/scan/d0134e36f9bb6c238cb345a4471063a9','2011-09-05 14:25:50','/images-db/upload/qrcode/d0134e36f9bb6c238cb345a4471063a9.png','/images-db/upload/qrcode/B_d0134e36f9bb6c238cb345a4471063a9.png',8,3,53,1),(92,'Catchflight_Facebook_Gaming4',NULL,'c9cf80e7d920222f496fca4046d3a574','http://www.catchflight9860.nl/scan/c9cf80e7d920222f496fca4046d3a574','2011-09-05 14:26:03','/images-db/upload/qrcode/c9cf80e7d920222f496fca4046d3a574.png','/images-db/upload/qrcode/B_c9cf80e7d920222f496fca4046d3a574.png',8,3,53,1),(93,'Catchflight_Hyves_Ping1',NULL,'bb4991dae4e5b23228856b87a484aaea','http://www.catchflight9860.nl/scan/bb4991dae4e5b23228856b87a484aaea','2011-09-05 14:32:53','/images-db/upload/qrcode/bb4991dae4e5b23228856b87a484aaea.png','/images-db/upload/qrcode/B_bb4991dae4e5b23228856b87a484aaea.png',8,1,54,1),(94,'Catchflight_Hyves_Ping2',NULL,'854e0a83ec752625a8372904e64ec3d7','http://www.catchflight9860.nl/scan/854e0a83ec752625a8372904e64ec3d7','2011-09-05 14:33:19','/images-db/upload/qrcode/854e0a83ec752625a8372904e64ec3d7.png','/images-db/upload/qrcode/B_854e0a83ec752625a8372904e64ec3d7.png',8,1,54,1),(95,'Catchflight_Hyves_Ping3',NULL,'ebd6b92cfec1a97db5f0567223258265','http://www.catchflight9860.nl/scan/ebd6b92cfec1a97db5f0567223258265','2011-09-05 14:33:32','/images-db/upload/qrcode/ebd6b92cfec1a97db5f0567223258265.png','/images-db/upload/qrcode/B_ebd6b92cfec1a97db5f0567223258265.png',8,1,54,1),(96,'Catchflight_Hyves_Ping4',NULL,'22ca35fecf0330e5704f7c74166bc3ed','http://www.catchflight9860.nl/scan/22ca35fecf0330e5704f7c74166bc3ed','2011-09-05 14:33:45','/images-db/upload/qrcode/22ca35fecf0330e5704f7c74166bc3ed.png','/images-db/upload/qrcode/B_22ca35fecf0330e5704f7c74166bc3ed.png',8,1,54,1),(97,'Catchflight_Hyves_Media1',NULL,'918e76d94f4a6ba943286d7f0478c9e0','http://www.catchflight9860.nl/scan/918e76d94f4a6ba943286d7f0478c9e0','2011-09-05 14:55:12','/images-db/upload/qrcode/918e76d94f4a6ba943286d7f0478c9e0.png','/images-db/upload/qrcode/B_918e76d94f4a6ba943286d7f0478c9e0.png',8,5,54,1),(98,'Catchflight_Hyves_Media2',NULL,'db3bac0d634e1be444e3fd4d1d27bc11','http://www.catchflight9860.nl/scan/db3bac0d634e1be444e3fd4d1d27bc11','2011-09-05 14:55:35','/images-db/upload/qrcode/db3bac0d634e1be444e3fd4d1d27bc11.png','/images-db/upload/qrcode/B_db3bac0d634e1be444e3fd4d1d27bc11.png',8,5,54,1),(99,'Catchflight_Hyves_Media3',NULL,'fd9a4df2c8f9aac1bcc5d1ccfc526cc7','http://www.catchflight9860.nl/scan/fd9a4df2c8f9aac1bcc5d1ccfc526cc7','2011-09-05 14:55:58','/images-db/upload/qrcode/fd9a4df2c8f9aac1bcc5d1ccfc526cc7.png','/images-db/upload/qrcode/B_fd9a4df2c8f9aac1bcc5d1ccfc526cc7.png',8,5,54,1),(100,'Catchflight_Hyves_Media4',NULL,'5cc21c7fa1fda29a35cdda7cc2b08669','http://www.catchflight9860.nl/scan/5cc21c7fa1fda29a35cdda7cc2b08669','2011-09-05 14:56:24','/images-db/upload/qrcode/5cc21c7fa1fda29a35cdda7cc2b08669.png','/images-db/upload/qrcode/B_5cc21c7fa1fda29a35cdda7cc2b08669.png',8,5,54,1),(101,'Catchflight_Hyves_Control1',NULL,'94762192a3098fe35cc58873ded86d14','http://www.catchflight9860.nl/scan/94762192a3098fe35cc58873ded86d14','2011-09-05 14:57:01','/images-db/upload/qrcode/94762192a3098fe35cc58873ded86d14.png','/images-db/upload/qrcode/B_94762192a3098fe35cc58873ded86d14.png',8,2,54,1),(102,'Catchflight_Hyves_Control2',NULL,'d1fbacf2f2c7785d0bf692fe70ff438c','http://www.catchflight9860.nl/scan/d1fbacf2f2c7785d0bf692fe70ff438c','2011-09-05 14:57:22','/images-db/upload/qrcode/d1fbacf2f2c7785d0bf692fe70ff438c.png','/images-db/upload/qrcode/B_d1fbacf2f2c7785d0bf692fe70ff438c.png',8,2,54,1),(103,'Catchflight_Hyves_Control3',NULL,'103b4a7fe15efa37c84fa32c173845be','http://www.catchflight9860.nl/scan/103b4a7fe15efa37c84fa32c173845be','2011-09-05 14:57:37','/images-db/upload/qrcode/103b4a7fe15efa37c84fa32c173845be.png','/images-db/upload/qrcode/B_103b4a7fe15efa37c84fa32c173845be.png',8,2,54,1),(104,'Catchflight_Hyves_Control4',NULL,'f99e05c145662478f6a5559be275cf12','http://www.catchflight9860.nl/scan/f99e05c145662478f6a5559be275cf12','2011-09-05 14:57:51','/images-db/upload/qrcode/f99e05c145662478f6a5559be275cf12.png','/images-db/upload/qrcode/B_f99e05c145662478f6a5559be275cf12.png',8,2,54,1),(105,'Catchflight_Hyves_Gaming1',NULL,'dfbcc70ca4df7f302b94e61f3afab82b','http://www.catchflight9860.nl/scan/dfbcc70ca4df7f302b94e61f3afab82b','2011-09-05 15:07:51','/images-db/upload/qrcode/dfbcc70ca4df7f302b94e61f3afab82b.png','/images-db/upload/qrcode/B_dfbcc70ca4df7f302b94e61f3afab82b.png',8,3,54,1),(106,'Catchflight_Hyves_Gaming2',NULL,'ec4289b54b1e417e2132421be839c490','http://www.catchflight9860.nl/scan/ec4289b54b1e417e2132421be839c490','2011-09-05 15:08:05','/images-db/upload/qrcode/ec4289b54b1e417e2132421be839c490.png','/images-db/upload/qrcode/B_ec4289b54b1e417e2132421be839c490.png',8,3,54,1),(107,'Catchflight_Hyves_Gaming3',NULL,'302e0079bdb4983497f5b57adaf59263','http://www.catchflight9860.nl/scan/302e0079bdb4983497f5b57adaf59263','2011-09-05 15:08:22','/images-db/upload/qrcode/302e0079bdb4983497f5b57adaf59263.png','/images-db/upload/qrcode/B_302e0079bdb4983497f5b57adaf59263.png',8,3,54,1),(108,'Catchflight_Hyves_Gaming4',NULL,'2f5e7819262cb48f89bb1f98c69d2ad4','http://www.catchflight9860.nl/scan/2f5e7819262cb48f89bb1f98c69d2ad4','2011-09-05 15:08:40','/images-db/upload/qrcode/2f5e7819262cb48f89bb1f98c69d2ad4.png','/images-db/upload/qrcode/B_2f5e7819262cb48f89bb1f98c69d2ad4.png',8,3,54,1),(109,'BlackBerryMobile_Ping',NULL,'5768bfe73722d9c92bf1a65e024fc1df','http://www.catchflight9860.nl/scan/5768bfe73722d9c92bf1a65e024fc1df','2011-09-05 15:57:46','/images-db/upload/qrcode/5768bfe73722d9c92bf1a65e024fc1df.png','/images-db/upload/qrcode/B_5768bfe73722d9c92bf1a65e024fc1df.png',8,1,59,1),(110,'BlackBerryMobile_Media',NULL,'d75d8b53f3f555c1556a3187a357cf89','http://www.catchflight9860.nl/scan/d75d8b53f3f555c1556a3187a357cf89','2011-09-05 15:58:16','/images-db/upload/qrcode/d75d8b53f3f555c1556a3187a357cf89.png','/images-db/upload/qrcode/B_d75d8b53f3f555c1556a3187a357cf89.png',8,5,59,1),(111,'BlackBerryMobile_Control',NULL,'fa0e28ff18dfb5fea17d36f8f0fed97c','http://www.catchflight9860.nl/scan/fa0e28ff18dfb5fea17d36f8f0fed97c','2011-09-05 15:58:47','/images-db/upload/qrcode/fa0e28ff18dfb5fea17d36f8f0fed97c.png','/images-db/upload/qrcode/B_fa0e28ff18dfb5fea17d36f8f0fed97c.png',8,2,59,1),(112,'BlackBerryMobile_Gaming',NULL,'1bba8dcfca4a45c94f3cd7fdfce2b6e4','http://www.catchflight9860.nl/scan/1bba8dcfca4a45c94f3cd7fdfce2b6e4','2011-09-05 16:01:46','/images-db/upload/qrcode/1bba8dcfca4a45c94f3cd7fdfce2b6e4.png','/images-db/upload/qrcode/B_1bba8dcfca4a45c94f3cd7fdfce2b6e4.png',8,3,59,1),(113,'BlackBerryNL_Ping',NULL,'a388a1d748b1b426a63248701c1a50c3','http://www.catchflight9860.nl/scan/a388a1d748b1b426a63248701c1a50c3','2011-09-05 16:05:31','/images-db/upload/qrcode/a388a1d748b1b426a63248701c1a50c3.png','/images-db/upload/qrcode/B_a388a1d748b1b426a63248701c1a50c3.png',8,1,58,1),(114,'BlackBerryNL_Media',NULL,'f9d8e869f6ff9bc81bd19a8d9e7d580d','http://www.catchflight9860.nl/scan/f9d8e869f6ff9bc81bd19a8d9e7d580d','2011-09-05 16:05:55','/images-db/upload/qrcode/f9d8e869f6ff9bc81bd19a8d9e7d580d.png','/images-db/upload/qrcode/B_f9d8e869f6ff9bc81bd19a8d9e7d580d.png',8,5,58,1),(115,'BlackBerryNL_Control',NULL,'1eb563cdf4c974305f28bcc2501cfcf6','http://www.catchflight9860.nl/scan/1eb563cdf4c974305f28bcc2501cfcf6','2011-09-05 16:07:10','/images-db/upload/qrcode/1eb563cdf4c974305f28bcc2501cfcf6.png','/images-db/upload/qrcode/B_1eb563cdf4c974305f28bcc2501cfcf6.png',8,2,58,1),(116,'BlackBerryNL_Gaming',NULL,'85d32a1956966a86486fb095cf2a1472','http://www.catchflight9860.nl/scan/85d32a1956966a86486fb095cf2a1472','2011-09-05 16:07:29','/images-db/upload/qrcode/85d32a1956966a86486fb095cf2a1472.png','/images-db/upload/qrcode/B_85d32a1956966a86486fb095cf2a1472.png',8,3,58,1),(117,'BlackBerryHyves_Ping1',NULL,'c4d324beaa2830cd418f73e30ea83987','http://www.catchflight9860.nl/scan/c4d324beaa2830cd418f73e30ea83987','2011-09-05 16:08:12','/images-db/upload/qrcode/c4d324beaa2830cd418f73e30ea83987.png','/images-db/upload/qrcode/B_c4d324beaa2830cd418f73e30ea83987.png',8,1,57,1),(118,'BlackBerryHyves_Ping2',NULL,'13abbb7df0338427e67011b72734a519','http://www.catchflight9860.nl/scan/13abbb7df0338427e67011b72734a519','2011-09-05 16:08:32','/images-db/upload/qrcode/13abbb7df0338427e67011b72734a519.png','/images-db/upload/qrcode/B_13abbb7df0338427e67011b72734a519.png',8,1,57,1),(119,'BlackBerryHyves_Media1',NULL,'4ad7411aa603db2e866b50670c131928','http://www.catchflight9860.nl/scan/4ad7411aa603db2e866b50670c131928','2011-09-05 16:09:06','/images-db/upload/qrcode/4ad7411aa603db2e866b50670c131928.png','/images-db/upload/qrcode/B_4ad7411aa603db2e866b50670c131928.png',8,5,57,1),(120,'BlackBerryHyves_Media2',NULL,'19bcfc41db5acf2701d95aa9e545421d','http://www.catchflight9860.nl/scan/19bcfc41db5acf2701d95aa9e545421d','2011-09-05 16:09:21','/images-db/upload/qrcode/19bcfc41db5acf2701d95aa9e545421d.png','/images-db/upload/qrcode/B_19bcfc41db5acf2701d95aa9e545421d.png',8,5,57,1),(121,'BlackBerryHyves_Control1',NULL,'d8a79ec7896244299273f7d50c082aa3','http://www.catchflight9860.nl/scan/d8a79ec7896244299273f7d50c082aa3','2011-09-05 16:09:42','/images-db/upload/qrcode/d8a79ec7896244299273f7d50c082aa3.png','/images-db/upload/qrcode/B_d8a79ec7896244299273f7d50c082aa3.png',8,2,57,1),(122,'BlackBerryHyves_Control2',NULL,'bcc8d832e28df247a769d8c2b2f0c28c','http://www.catchflight9860.nl/scan/bcc8d832e28df247a769d8c2b2f0c28c','2011-09-05 16:10:45','/images-db/upload/qrcode/bcc8d832e28df247a769d8c2b2f0c28c.png','/images-db/upload/qrcode/B_bcc8d832e28df247a769d8c2b2f0c28c.png',8,2,57,1),(123,'BlackBerryHyves_Gaming1',NULL,'9c9cc9b4c75aca1d3b620523054ecac5','http://www.catchflight9860.nl/scan/9c9cc9b4c75aca1d3b620523054ecac5','2011-09-05 16:11:17','/images-db/upload/qrcode/9c9cc9b4c75aca1d3b620523054ecac5.png','/images-db/upload/qrcode/B_9c9cc9b4c75aca1d3b620523054ecac5.png',8,3,57,1),(124,'BlackBerryHyves_Gaming2',NULL,'7bfb0c17451886af3cf07902e871af0e','http://www.catchflight9860.nl/scan/7bfb0c17451886af3cf07902e871af0e','2011-09-05 16:11:50','/images-db/upload/qrcode/7bfb0c17451886af3cf07902e871af0e.png','/images-db/upload/qrcode/B_7bfb0c17451886af3cf07902e871af0e.png',8,3,57,1),(125,'BlackBerryFacebook_Ping1',NULL,'1fbb301a8746ae92e4f15c8d7c68e155','http://www.catchflight9860.nl/scan/1fbb301a8746ae92e4f15c8d7c68e155','2011-09-05 16:15:36','/images-db/upload/qrcode/1fbb301a8746ae92e4f15c8d7c68e155.png','/images-db/upload/qrcode/B_1fbb301a8746ae92e4f15c8d7c68e155.png',8,1,56,1),(126,'BlackBerryFacebook_Ping2',NULL,'8dfde84d596574edfc3392d33736dd00','http://www.catchflight9860.nl/scan/8dfde84d596574edfc3392d33736dd00','2011-09-05 16:15:49','/images-db/upload/qrcode/8dfde84d596574edfc3392d33736dd00.png','/images-db/upload/qrcode/B_8dfde84d596574edfc3392d33736dd00.png',8,1,56,1),(127,'BlackBerryFacebook_Media1',NULL,'b7ea13b1cb4a42e0774f8c7f58fb4c98','http://www.catchflight9860.nl/scan/b7ea13b1cb4a42e0774f8c7f58fb4c98','2011-09-05 16:16:42','/images-db/upload/qrcode/b7ea13b1cb4a42e0774f8c7f58fb4c98.png','/images-db/upload/qrcode/B_b7ea13b1cb4a42e0774f8c7f58fb4c98.png',8,5,56,1),(128,'BlackBerryFacebook_Media2',NULL,'b8360d9573fedc9f3c6d3381086310ec','http://www.catchflight9860.nl/scan/b8360d9573fedc9f3c6d3381086310ec','2011-09-05 16:17:10','/images-db/upload/qrcode/b8360d9573fedc9f3c6d3381086310ec.png','/images-db/upload/qrcode/B_b8360d9573fedc9f3c6d3381086310ec.png',8,5,56,1),(129,'BlackBerryFacebook_Control1',NULL,'3630851577add2753b11db577b22e8db','http://www.catchflight9860.nl/scan/3630851577add2753b11db577b22e8db','2011-09-05 16:18:12','/images-db/upload/qrcode/3630851577add2753b11db577b22e8db.png','/images-db/upload/qrcode/B_3630851577add2753b11db577b22e8db.png',8,2,56,1),(130,'BlackBerryFacebook_Control2',NULL,'8f0de372aa67011ae7be3951dac4388c','http://www.catchflight9860.nl/scan/8f0de372aa67011ae7be3951dac4388c','2011-09-05 16:18:31','/images-db/upload/qrcode/8f0de372aa67011ae7be3951dac4388c.png','/images-db/upload/qrcode/B_8f0de372aa67011ae7be3951dac4388c.png',8,2,56,1),(131,'BlackBerryFacebook_Gaming1',NULL,'d0fb240074f58ab39e142ed789ca4db3','http://www.catchflight9860.nl/scan/d0fb240074f58ab39e142ed789ca4db3','2011-09-05 16:18:55','/images-db/upload/qrcode/d0fb240074f58ab39e142ed789ca4db3.png','/images-db/upload/qrcode/B_d0fb240074f58ab39e142ed789ca4db3.png',8,3,56,1),(132,'BlackBerryFacebook_Gaming2',NULL,'0b1f28a5c022fd4d22b0881d0ac26f2a','http://www.catchflight9860.nl/scan/0b1f28a5c022fd4d22b0881d0ac26f2a','2011-09-05 16:19:13','/images-db/upload/qrcode/0b1f28a5c022fd4d22b0881d0ac26f2a.png','/images-db/upload/qrcode/B_0b1f28a5c022fd4d22b0881d0ac26f2a.png',8,3,56,1),(133,'Actiewebsite_Ping1',NULL,'2d9fb8ac5075b8611fae624dd75a8af7','http://www.catchflight9860.nl/scan/2d9fb8ac5075b8611fae624dd75a8af7','2011-09-05 16:20:46','/images-db/upload/qrcode/2d9fb8ac5075b8611fae624dd75a8af7.png','/images-db/upload/qrcode/B_2d9fb8ac5075b8611fae624dd75a8af7.png',8,1,55,1),(134,'Actiewebsite_Ping2',NULL,'67f7d84867fe89d7914fcc87d156e9a9','http://www.catchflight9860.nl/scan/67f7d84867fe89d7914fcc87d156e9a9','2011-09-05 16:20:57','/images-db/upload/qrcode/67f7d84867fe89d7914fcc87d156e9a9.png','/images-db/upload/qrcode/B_67f7d84867fe89d7914fcc87d156e9a9.png',8,1,55,1),(135,'Actiewebsite_Ping3',NULL,'3181b1b9022928565020f8d7040d60d2','http://www.catchflight9860.nl/scan/3181b1b9022928565020f8d7040d60d2','2011-09-05 16:21:08','/images-db/upload/qrcode/3181b1b9022928565020f8d7040d60d2.png','/images-db/upload/qrcode/B_3181b1b9022928565020f8d7040d60d2.png',8,1,55,1),(136,'Actiewebsite_Ping4',NULL,'cb6a575c2c52186e600d00e010b2625a','http://www.catchflight9860.nl/scan/cb6a575c2c52186e600d00e010b2625a','2011-09-05 16:21:22','/images-db/upload/qrcode/cb6a575c2c52186e600d00e010b2625a.png','/images-db/upload/qrcode/B_cb6a575c2c52186e600d00e010b2625a.png',8,1,55,1),(137,'Actiewebsite_Media1',NULL,'a2c1596e27b45bede02b31591dd8bbe8','http://www.catchflight9860.nl/scan/a2c1596e27b45bede02b31591dd8bbe8','2011-09-05 16:21:49','/images-db/upload/qrcode/a2c1596e27b45bede02b31591dd8bbe8.png','/images-db/upload/qrcode/B_a2c1596e27b45bede02b31591dd8bbe8.png',8,5,55,1),(138,'Actiewebsite_Media2',NULL,'12cd253097826e6e56387ad05a0e1476','http://www.catchflight9860.nl/scan/12cd253097826e6e56387ad05a0e1476','2011-09-05 16:22:12','/images-db/upload/qrcode/12cd253097826e6e56387ad05a0e1476.png','/images-db/upload/qrcode/B_12cd253097826e6e56387ad05a0e1476.png',8,5,55,1),(139,'Actiewebsite_Media3',NULL,'10466f5847c908cfe615fc9fa0310638','http://www.catchflight9860.nl/scan/10466f5847c908cfe615fc9fa0310638','2011-09-05 16:22:29','/images-db/upload/qrcode/10466f5847c908cfe615fc9fa0310638.png','/images-db/upload/qrcode/B_10466f5847c908cfe615fc9fa0310638.png',8,5,55,1),(140,'Actiewebsite_Media4',NULL,'594744d6a736f1c700dabf84eeb09924','http://www.catchflight9860.nl/scan/594744d6a736f1c700dabf84eeb09924','2011-09-05 16:22:47','/images-db/upload/qrcode/594744d6a736f1c700dabf84eeb09924.png','/images-db/upload/qrcode/B_594744d6a736f1c700dabf84eeb09924.png',8,5,55,1),(141,'Actiewebsite_Control1',NULL,'fde25b94c955dccfafac552f21f6e7e5','http://www.catchflight9860.nl/scan/fde25b94c955dccfafac552f21f6e7e5','2011-09-05 16:24:08','/images-db/upload/qrcode/fde25b94c955dccfafac552f21f6e7e5.png','/images-db/upload/qrcode/B_fde25b94c955dccfafac552f21f6e7e5.png',8,2,55,1),(142,'Actiewebsite_Control2',NULL,'ae6b850d4170dfea61b7de6de092282c','http://www.catchflight9860.nl/scan/ae6b850d4170dfea61b7de6de092282c','2011-09-05 16:25:02','/images-db/upload/qrcode/ae6b850d4170dfea61b7de6de092282c.png','/images-db/upload/qrcode/B_ae6b850d4170dfea61b7de6de092282c.png',8,2,55,1),(143,'Actiewebsite_Control3',NULL,'baea37775f82ffae1f06f620c927ab09','http://www.catchflight9860.nl/scan/baea37775f82ffae1f06f620c927ab09','2011-09-05 16:25:18','/images-db/upload/qrcode/baea37775f82ffae1f06f620c927ab09.png','/images-db/upload/qrcode/B_baea37775f82ffae1f06f620c927ab09.png',8,2,55,1),(144,'Actiewebsite_Control4',NULL,'3256b6983ae6f02bccfb59f1b98a5da7','http://www.catchflight9860.nl/scan/3256b6983ae6f02bccfb59f1b98a5da7','2011-09-05 16:25:30','/images-db/upload/qrcode/3256b6983ae6f02bccfb59f1b98a5da7.png','/images-db/upload/qrcode/B_3256b6983ae6f02bccfb59f1b98a5da7.png',8,2,55,1),(145,'Actiewebsite_Gaming1',NULL,'fa3d3f71f89646d7a262780d2013d172','http://www.catchflight9860.nl/scan/fa3d3f71f89646d7a262780d2013d172','2011-09-05 16:25:53','/images-db/upload/qrcode/fa3d3f71f89646d7a262780d2013d172.png','/images-db/upload/qrcode/B_fa3d3f71f89646d7a262780d2013d172.png',8,3,55,1),(146,'Actiewebsite_Gaming2',NULL,'85e33f98661d658c4f58bafd21b35674','http://www.catchflight9860.nl/scan/85e33f98661d658c4f58bafd21b35674','2011-09-05 16:26:20','/images-db/upload/qrcode/85e33f98661d658c4f58bafd21b35674.png','/images-db/upload/qrcode/B_85e33f98661d658c4f58bafd21b35674.png',8,3,55,1),(147,'Actiewebsite_Gaming3',NULL,'20adfc537b83b54f3180f6d8e1d6b218','http://www.catchflight9860.nl/scan/20adfc537b83b54f3180f6d8e1d6b218','2011-09-05 16:26:41','/images-db/upload/qrcode/20adfc537b83b54f3180f6d8e1d6b218.png','/images-db/upload/qrcode/B_20adfc537b83b54f3180f6d8e1d6b218.png',8,3,55,1),(148,'Actiewebsite_Gaming4',NULL,'87b46d67d52630372136bde3f5bb1246','http://www.catchflight9860.nl/scan/87b46d67d52630372136bde3f5bb1246','2011-09-05 16:26:57','/images-db/upload/qrcode/87b46d67d52630372136bde3f5bb1246.png','/images-db/upload/qrcode/B_87b46d67d52630372136bde3f5bb1246.png',8,3,55,1),(149,'Hi Facebook_Ping1',NULL,'48d912244333fe4c1a8d88d33348aa2c','http://www.catchflight9860.nl/scan/48d912244333fe4c1a8d88d33348aa2c','2011-09-05 16:35:02','/images-db/upload/qrcode/48d912244333fe4c1a8d88d33348aa2c.png','/images-db/upload/qrcode/B_48d912244333fe4c1a8d88d33348aa2c.png',8,1,60,1),(150,'Hi Facebook_Ping2',NULL,'17eb2458be6a4351bc611e34abf40498','http://www.catchflight9860.nl/scan/17eb2458be6a4351bc611e34abf40498','2011-09-05 16:35:33','/images-db/upload/qrcode/17eb2458be6a4351bc611e34abf40498.png','/images-db/upload/qrcode/B_17eb2458be6a4351bc611e34abf40498.png',8,1,60,1),(151,'Hi Facebook_Ping3',NULL,'26deae39f5793c84af6632c9a189e7b4','http://www.catchflight9860.nl/scan/26deae39f5793c84af6632c9a189e7b4','2011-09-05 16:35:53','/images-db/upload/qrcode/26deae39f5793c84af6632c9a189e7b4.png','/images-db/upload/qrcode/B_26deae39f5793c84af6632c9a189e7b4.png',8,1,60,1),(152,'Hi Facebook_Media1',NULL,'dc8ef66947777d0f20072980eebd0f9b','http://www.catchflight9860.nl/scan/dc8ef66947777d0f20072980eebd0f9b','2011-09-05 16:36:28','/images-db/upload/qrcode/dc8ef66947777d0f20072980eebd0f9b.png','/images-db/upload/qrcode/B_dc8ef66947777d0f20072980eebd0f9b.png',8,5,60,1),(153,'Hi Facebook_Media2',NULL,'f7304f31eceb27c611dbbd4882aa18dc','http://www.catchflight9860.nl/scan/f7304f31eceb27c611dbbd4882aa18dc','2011-09-05 16:36:41','/images-db/upload/qrcode/f7304f31eceb27c611dbbd4882aa18dc.png','/images-db/upload/qrcode/B_f7304f31eceb27c611dbbd4882aa18dc.png',8,5,60,1),(154,'Hi Facebook_Media3',NULL,'9b5d27f1fd30345f2bd5dabed237b523','http://www.catchflight9860.nl/scan/9b5d27f1fd30345f2bd5dabed237b523','2011-09-05 16:36:52','/images-db/upload/qrcode/9b5d27f1fd30345f2bd5dabed237b523.png','/images-db/upload/qrcode/B_9b5d27f1fd30345f2bd5dabed237b523.png',8,5,60,1),(155,'Hi Facebook_Control1',NULL,'f5ca30a48df4d9aa3bda77818f565bbb','http://www.catchflight9860.nl/scan/f5ca30a48df4d9aa3bda77818f565bbb','2011-09-05 16:37:16','/images-db/upload/qrcode/f5ca30a48df4d9aa3bda77818f565bbb.png','/images-db/upload/qrcode/B_f5ca30a48df4d9aa3bda77818f565bbb.png',8,2,60,1),(156,'Hi Facebook_Control2',NULL,'304fa49a26552bd86b6533b0500d49f3','http://www.catchflight9860.nl/scan/304fa49a26552bd86b6533b0500d49f3','2011-09-05 16:37:27','/images-db/upload/qrcode/304fa49a26552bd86b6533b0500d49f3.png','/images-db/upload/qrcode/B_304fa49a26552bd86b6533b0500d49f3.png',8,2,60,1),(157,'Hi Facebook_Control3',NULL,'140b1f327f3861f819e6f8f93e1ce883','http://www.catchflight9860.nl/scan/140b1f327f3861f819e6f8f93e1ce883','2011-09-05 16:37:40','/images-db/upload/qrcode/140b1f327f3861f819e6f8f93e1ce883.png','/images-db/upload/qrcode/B_140b1f327f3861f819e6f8f93e1ce883.png',8,2,60,1),(158,'Hi Facebook_Gaming1',NULL,'1bca63b24e9c1771f8d75bbe6c119afc','http://www.catchflight9860.nl/scan/1bca63b24e9c1771f8d75bbe6c119afc','2011-09-05 16:38:23','/images-db/upload/qrcode/1bca63b24e9c1771f8d75bbe6c119afc.png','/images-db/upload/qrcode/B_1bca63b24e9c1771f8d75bbe6c119afc.png',8,3,60,1),(159,'Hi Facebook_Gaming2',NULL,'2f5534e536275cbf30b0c64818432be4','http://www.catchflight9860.nl/scan/2f5534e536275cbf30b0c64818432be4','2011-09-05 16:38:33','/images-db/upload/qrcode/2f5534e536275cbf30b0c64818432be4.png','/images-db/upload/qrcode/B_2f5534e536275cbf30b0c64818432be4.png',8,3,60,1),(160,'Hi Facebook_Gaming3',NULL,'5981c172d54edecfc38c0accd2b6335a','http://www.catchflight9860.nl/scan/5981c172d54edecfc38c0accd2b6335a','2011-09-05 16:38:45','/images-db/upload/qrcode/5981c172d54edecfc38c0accd2b6335a.png','/images-db/upload/qrcode/B_5981c172d54edecfc38c0accd2b6335a.png',8,3,60,1),(161,'Hi Hyves_Ping1',NULL,'48647f7a315fa38fddf066c62a9c997a','http://www.catchflight9860.nl/scan/48647f7a315fa38fddf066c62a9c997a','2011-09-05 16:39:16','/images-db/upload/qrcode/48647f7a315fa38fddf066c62a9c997a.png','/images-db/upload/qrcode/B_48647f7a315fa38fddf066c62a9c997a.png',8,1,61,1),(162,'Hi Hyves_Ping2',NULL,'d48d6c898e77595c5cfb46c119e8f61e','http://www.catchflight9860.nl/scan/d48d6c898e77595c5cfb46c119e8f61e','2011-09-05 16:39:26','/images-db/upload/qrcode/d48d6c898e77595c5cfb46c119e8f61e.png','/images-db/upload/qrcode/B_d48d6c898e77595c5cfb46c119e8f61e.png',8,1,61,1),(163,'Hi Hyves_Ping3',NULL,'008fadfc214cad524fa503411a1f858c','http://www.catchflight9860.nl/scan/008fadfc214cad524fa503411a1f858c','2011-09-05 16:39:48','/images-db/upload/qrcode/008fadfc214cad524fa503411a1f858c.png','/images-db/upload/qrcode/B_008fadfc214cad524fa503411a1f858c.png',8,1,61,1),(164,'Hi Hyves_Media1',NULL,'abbf2027d2e2b8252272c8cfa6c2de8b','http://www.catchflight9860.nl/scan/abbf2027d2e2b8252272c8cfa6c2de8b','2011-09-05 16:40:22','/images-db/upload/qrcode/abbf2027d2e2b8252272c8cfa6c2de8b.png','/images-db/upload/qrcode/B_abbf2027d2e2b8252272c8cfa6c2de8b.png',8,5,61,1),(165,'Hi Hyves_Media2',NULL,'69a930db1d4142320ba7e091782fca3e','http://www.catchflight9860.nl/scan/69a930db1d4142320ba7e091782fca3e','2011-09-05 16:40:33','/images-db/upload/qrcode/69a930db1d4142320ba7e091782fca3e.png','/images-db/upload/qrcode/B_69a930db1d4142320ba7e091782fca3e.png',8,5,61,1),(166,'Hi Hyves_Media3',NULL,'ab847a23559a288ea7b372c63dd3f859','http://www.catchflight9860.nl/scan/ab847a23559a288ea7b372c63dd3f859','2011-09-05 16:40:48','/images-db/upload/qrcode/ab847a23559a288ea7b372c63dd3f859.png','/images-db/upload/qrcode/B_ab847a23559a288ea7b372c63dd3f859.png',8,5,61,1),(167,'Hi Hyves_Control1',NULL,'0c606e6c31b28393641940265d9762c1','http://www.catchflight9860.nl/scan/0c606e6c31b28393641940265d9762c1','2011-09-05 16:41:31','/images-db/upload/qrcode/0c606e6c31b28393641940265d9762c1.png','/images-db/upload/qrcode/B_0c606e6c31b28393641940265d9762c1.png',8,2,61,1),(168,'Hi Hyves_Control2',NULL,'54bf00cc6802b5b0269d9ae88f955a28','http://www.catchflight9860.nl/scan/54bf00cc6802b5b0269d9ae88f955a28','2011-09-05 16:41:45','/images-db/upload/qrcode/54bf00cc6802b5b0269d9ae88f955a28.png','/images-db/upload/qrcode/B_54bf00cc6802b5b0269d9ae88f955a28.png',8,2,61,1),(169,'Hi Hyves_Control3',NULL,'0e8bea1f6949fcc11303269d264c874f','http://www.catchflight9860.nl/scan/0e8bea1f6949fcc11303269d264c874f','2011-09-05 16:41:57','/images-db/upload/qrcode/0e8bea1f6949fcc11303269d264c874f.png','/images-db/upload/qrcode/B_0e8bea1f6949fcc11303269d264c874f.png',8,2,61,1),(170,'Hi Hyves_Gaming1',NULL,'de776818eee4f17969376c682dc0ff58','http://www.catchflight9860.nl/scan/de776818eee4f17969376c682dc0ff58','2011-09-05 16:42:33','/images-db/upload/qrcode/de776818eee4f17969376c682dc0ff58.png','/images-db/upload/qrcode/B_de776818eee4f17969376c682dc0ff58.png',8,3,61,1),(171,'Hi Hyves_Gaming2',NULL,'86b7bb2e8a19f1525c2829ce9cdb6228','http://www.catchflight9860.nl/scan/86b7bb2e8a19f1525c2829ce9cdb6228','2011-09-05 16:42:45','/images-db/upload/qrcode/86b7bb2e8a19f1525c2829ce9cdb6228.png','/images-db/upload/qrcode/B_86b7bb2e8a19f1525c2829ce9cdb6228.png',8,3,61,1),(172,'Hi Hyves_Gaming3',NULL,'44ed3d9e0fd1036996afb2b48e3fcf79','http://www.catchflight9860.nl/scan/44ed3d9e0fd1036996afb2b48e3fcf79','2011-09-05 16:42:56','/images-db/upload/qrcode/44ed3d9e0fd1036996afb2b48e3fcf79.png','/images-db/upload/qrcode/B_44ed3d9e0fd1036996afb2b48e3fcf79.png',8,3,61,1),(173,'special',NULL,'81b1d4f07cb2b0bb5e322dd8c14cd40e','http://www.catchflight9860.nl/scan/81b1d4f07cb2b0bb5e322dd8c14cd40e','2011-09-07 18:04:15','/images-db/upload/qrcode/81b1d4f07cb2b0bb5e322dd8c14cd40e.png',NULL,6,6,6,1),(174,'Youtube_PingVS',NULL,'3ddf0ef7b5c596a7a1a4aa5fd8d4feb5','http://www.catchflight9860.nl/scan/3ddf0ef7b5c596a7a1a4aa5fd8d4feb5','2011-09-08 17:13:45','/images-db/upload/qrcode/3ddf0ef7b5c596a7a1a4aa5fd8d4feb5.png','/images-db/upload/qrcode/B_3ddf0ef7b5c596a7a1a4aa5fd8d4feb5.png',8,1,52,1),(175,'Youtube_MediaVS',NULL,'e99332ff5a60c8788c447f41166b8e92','http://www.catchflight9860.nl/scan/e99332ff5a60c8788c447f41166b8e92','2011-09-08 17:14:04','/images-db/upload/qrcode/e99332ff5a60c8788c447f41166b8e92.png','/images-db/upload/qrcode/B_e99332ff5a60c8788c447f41166b8e92.png',8,5,52,1),(176,'Youtube_GamingVS',NULL,'a406650d9309148e15ee3c1541a44b88','http://www.catchflight9860.nl/scan/a406650d9309148e15ee3c1541a44b88','2011-09-08 17:14:19','/images-db/upload/qrcode/a406650d9309148e15ee3c1541a44b88.png','/images-db/upload/qrcode/B_a406650d9309148e15ee3c1541a44b88.png',8,3,52,1),(177,'Youtube_ControlVS',NULL,'1cd3d0baa6d95b5943757d0c4b8cfbe8','http://www.catchflight9860.nl/scan/1cd3d0baa6d95b5943757d0c4b8cfbe8','2011-09-08 17:14:36','/images-db/upload/qrcode/1cd3d0baa6d95b5943757d0c4b8cfbe8.png','/images-db/upload/qrcode/B_1cd3d0baa6d95b5943757d0c4b8cfbe8.png',8,2,52,1),(178,'BLOG_Zuighaas.nl',NULL,'8175978d067f39a1c70669868419a3c1','http://www.catchflight9860.nl/scan/8175978d067f39a1c70669868419a3c1','2011-09-08 17:17:55','/images-db/upload/qrcode/8175978d067f39a1c70669868419a3c1.png','/images-db/upload/qrcode/B_8175978d067f39a1c70669868419a3c1.png',8,5,73,1),(179,'BLOG_Menandstyle.nl',NULL,'e9894a84192c2b9ab3a442d5da850f13','http://www.catchflight9860.nl/scan/e9894a84192c2b9ab3a442d5da850f13','2011-09-08 17:18:25','/images-db/upload/qrcode/e9894a84192c2b9ab3a442d5da850f13.png','/images-db/upload/qrcode/B_e9894a84192c2b9ab3a442d5da850f13.png',8,2,71,1),(180,'BLOG_Misslipgloss.nl',NULL,'334cf9ca05a81b64c88801b5a8f650b6','http://www.catchflight9860.nl/scan/334cf9ca05a81b64c88801b5a8f650b6','2011-09-08 17:18:51','/images-db/upload/qrcode/334cf9ca05a81b64c88801b5a8f650b6.png','/images-db/upload/qrcode/B_334cf9ca05a81b64c88801b5a8f650b6.png',8,3,72,1),(181,'BlackBerry.nl_N_Ping',NULL,'4c31b08898ab4ca04ee333a3bc03ac6b','http://www.catchflight9860.nl/scan/4c31b08898ab4ca04ee333a3bc03ac6b','2011-09-08 17:19:41','/images-db/upload/qrcode/4c31b08898ab4ca04ee333a3bc03ac6b.png','/images-db/upload/qrcode/B_4c31b08898ab4ca04ee333a3bc03ac6b.png',8,1,58,1),(182,'BlackBerry_Mobiel_Media2',NULL,'0407ed5fbddc8ba8d9217166706b0756','http://www.catchflight9860.nl/scan/0407ed5fbddc8ba8d9217166706b0756','2011-09-08 17:20:13','/images-db/upload/qrcode/0407ed5fbddc8ba8d9217166706b0756.png','/images-db/upload/qrcode/B_0407ed5fbddc8ba8d9217166706b0756.png',8,5,59,1),(183,'UitzendbureauPromos_MEDIA',NULL,'f9507d99726685a555fa53ed37c6dbfd','http://www.catchflight9860.nl/scan/f9507d99726685a555fa53ed37c6dbfd','2011-09-09 14:37:21','/images-db/upload/qrcode/f9507d99726685a555fa53ed37c6dbfd.png','/images-db/upload/qrcode/B_f9507d99726685a555fa53ed37c6dbfd.png',8,5,74,1),(184,'BLOG_Beautygloss.nl_',NULL,'73388522ae7bc819f5491bceb941daf9','http://www.catchflight9860.nl/scan/73388522ae7bc819f5491bceb941daf9','2011-09-09 15:12:50','/images-db/upload/qrcode/73388522ae7bc819f5491bceb941daf9.png','/images-db/upload/qrcode/B_73388522ae7bc819f5491bceb941daf9.png',8,2,75,1),(185,'Error404_Media',NULL,'f3e779b876d18d541965678befcf6a8c','http://www.catchflight9860.nl/scan/f3e779b876d18d541965678befcf6a8c','2011-09-10 14:49:07','/images-db/upload/qrcode/f3e779b876d18d541965678befcf6a8c.png','/images-db/upload/qrcode/B_f3e779b876d18d541965678befcf6a8c.png',8,5,76,1),(186,'YoutubeChannelBG_Gaming',NULL,'c90cdf6d10ee37652f489d199c7b6ef2','http://www.catchflight9860.nl/scan/c90cdf6d10ee37652f489d199c7b6ef2','2011-09-11 16:55:46','/images-db/upload/qrcode/c90cdf6d10ee37652f489d199c7b6ef2.png','/images-db/upload/qrcode/B_c90cdf6d10ee37652f489d199c7b6ef2.png',8,3,77,1);
/*!40000 ALTER TABLE `qrcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrcode_behaviours`
--

DROP TABLE IF EXISTS `qrcode_behaviours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrcode_behaviours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `qrcode_behaviours_types_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qrcode_behaviours_qrcode_behaviours_types1` (`qrcode_behaviours_types_id`),
  CONSTRAINT `fk_qrcode_behaviours_qrcode_behaviours_types1` FOREIGN KEY (`qrcode_behaviours_types_id`) REFERENCES `qrcode_behaviours_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrcode_behaviours`
--

LOCK TABLES `qrcode_behaviours` WRITE;
/*!40000 ALTER TABLE `qrcode_behaviours` DISABLE KEYS */;
INSERT INTO `qrcode_behaviours` VALUES (6,'special',NULL,5),(8,'default',NULL,3),(9,'mobile only',NULL,4);
/*!40000 ALTER TABLE `qrcode_behaviours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrcode_behaviours_types`
--

DROP TABLE IF EXISTS `qrcode_behaviours_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrcode_behaviours_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrcode_behaviours_types`
--

LOCK TABLES `qrcode_behaviours_types` WRITE;
/*!40000 ALTER TABLE `qrcode_behaviours_types` DISABLE KEYS */;
INSERT INTO `qrcode_behaviours_types` VALUES (1,'MAX_SCAN'),(3,'DEFAULT'),(4,'MOBILE_ONLY'),(5,'SPECIAL');
/*!40000 ALTER TABLE `qrcode_behaviours_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrcode_categories`
--

DROP TABLE IF EXISTS `qrcode_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrcode_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `allowed_share` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrcode_categories`
--

LOCK TABLES `qrcode_categories` WRITE;
/*!40000 ALTER TABLE `qrcode_categories` DISABLE KEYS */;
INSERT INTO `qrcode_categories` VALUES (1,'ping',600,1,'/images-db/upload/qrcode/overlay/ping.jpg'),(2,'control',600,1,'/images-db/upload/qrcode/overlay/control.jpg'),(3,'gaming',600,1,'/images-db/upload/qrcode/overlay/gaming.jpg'),(4,'sharing',4000,0,NULL),(5,'media',600,1,'/images-db/upload/qrcode/overlay/media.jpg'),(6,'energy',4000,0,NULL);
/*!40000 ALTER TABLE `qrcode_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrcode_locations`
--

DROP TABLE IF EXISTS `qrcode_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrcode_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrcode_locations`
--

LOCK TABLES `qrcode_locations` WRITE;
/*!40000 ALTER TABLE `qrcode_locations` DISABLE KEYS */;
INSERT INTO `qrcode_locations` VALUES (4,'promo',NULL),(5,'viltjes',NULL),(6,'abri',NULL),(7,'winkel',NULL),(8,'boomerang',NULL),(9,'advertentie',NULL),(10,'toilet',NULL),(11,'sticker',NULL),(12,'social',NULL),(13,'medewerker',NULL),(14,'share',NULL),(15,'fietshanger','Werven, fietshangers worden in de studentensteden verspreid bij start campagne '),(16,'SpeelkaartenControl','Speelkaarten'),(17,'SpeelkaartenMedia',''),(18,'SpeelkaartenGaming',''),(19,'SpeelkaartenPing',''),(20,'flyer',''),(21,'StationspanelenGaming',''),(22,'StationspanelenPing',''),(23,'MetrohelepaginaControl',''),(24,'MetrohelepaginaGaming',''),(25,'Metro1_8Media',''),(26,'Metro1_8Control',''),(27,'Metro1_8Gaming1',''),(28,'Metro1_8Gaming2',''),(29,'Metro1_8Ping1',''),(30,'Metro1_8Ping2',''),(31,'SpitshelepaginaMedia',''),(32,'SpitshelepaginaPing',''),(33,'Spits1_8Media',''),(34,'Spits1_8Control',''),(35,'Spits1_8Gaming1',''),(36,'Spits1_8Gaming2',''),(37,'Spits1_8Ping1',''),(38,'Spits1_8Ping2',''),(39,'ToiletpostersGaming',''),(40,'ToiletpostersPing',''),(41,'ToiletpostersControl',''),(42,'ToiletpostersMedia',''),(43,'Metropanelen_mediabureau',''),(44,'HBOWOControl',''),(45,'HBOWOMedia',''),(46,'BierviltjesControl',''),(47,'BierviltjesMedia',''),(48,'BierviltjesGaming',''),(49,'BierviltjesPing1',''),(50,'BierviltjesPing2',''),(51,'special','special'),(52,'Youtube',''),(53,'CatchFlight Facebook',''),(54,'CatchFlight Hyves',''),(55,'Actiewebsite',''),(56,'BlackBerry Facebook',''),(57,'BlackBerry Hyves',''),(58,'BlackBerry.nl',''),(59,'BlackBerry Mobile',''),(60,'Hi Facebook',''),(61,'Hi Hyves',''),(62,'Blog_CommeDesLeroi.com',''),(63,'Blog_Dutchcowgirls.nl/bloggers/854',''),(64,'Blog_Viceland.nl',''),(65,'Blog_AfterDRK.com',''),(66,'Blog_Nalden.net',''),(67,'Blog_Tweakers.net',''),(68,'Blog_Puna.nl ',''),(69,'Blog_Froot.nl ',''),(70,'Blog_Nsmbl.nl ',''),(71,'BLOG_Menandstyle.nl',''),(72,'BLOG_Misslipgloss.nl',''),(73,'BLOG_Zuighaas.nl',''),(74,'UitzendbureauPromos',''),(75,'BLOG_Beautygloss.nl',''),(76,'Error404',''),(77,'YoutubechannelBG','');
/*!40000 ALTER TABLE `qrcode_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL DEFAULT '',
  `has_flow` varchar(45) DEFAULT '0',
  `user_channels_id` int(11) DEFAULT NULL,
  `reward_movie_two` varchar(255) NOT NULL,
  `reward_movie_one` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_quiz_user_channels1` (`user_channels_id`) USING BTREE,
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`user_channels_id`) REFERENCES `user_channels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (10,'chirurgijn','chirurgijn',1,'/images-db/upload/quiz/Screensaver_01Chirurgijn.flv','set_2',NULL,'/images-db/upload/quiz/ChirurgijnAnim1B.flv','/images-db/upload/quiz/ChirurgijnANIM1A.flv'),(15,'kapitein','kapitein',1,'/images-db/upload/quiz/Screensaver_02Kapitein.flv','set_2',NULL,'/images-db/upload/quiz/ANIM2A_Optica.flv','/images-db/upload/quiz/ANIM2B_Navigatie.flv'),(16,'tussenwalenschip','tussenwalenschip',1,'/images-db/upload/quiz/Screensaver_03TussenWalEnSchipQ.flv','set_2',NULL,'/images-db/upload/quiz/ANIM3B_ElektriM2.flv','/images-db/upload/quiz/ANIM3A_witwater.flv'),(17,'rariteiten','rariteiten',1,'/images-db/upload/quiz/Screensaver_04RariteitenQ.flv','set_2',NULL,'/images-db/upload/quiz/EILAND04A_ANIM.flv','/images-db/upload/quiz/ANIM4B_FABELDIER.flv');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_answers`
--

DROP TABLE IF EXISTS `quiz_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `answer_description` text NOT NULL,
  `correct_answer` tinyint(4) NOT NULL DEFAULT '0',
  `file` varchar(255) DEFAULT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT '1',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '		',
  `reward` int(11) NOT NULL,
  `quiz_questions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `fk_quiz_answers_quiz_questions1` (`quiz_questions_id`) USING BTREE,
  CONSTRAINT `quiz_answers_ibfk_1` FOREIGN KEY (`quiz_questions_id`) REFERENCES `quiz_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2701 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_answers`
--

LOCK TABLES `quiz_answers` WRITE;
/*!40000 ALTER TABLE `quiz_answers` DISABLE KEYS */;
INSERT INTO `quiz_answers` VALUES (2058,0,'je mond goed spoelen bij kiespijn.','',0,'',1,'',0,639),(2059,0,'een verstopt oor uitspoelen.','',0,'',1,'',0,639),(2060,0,'via je kont je darmen doorspoelen.','',1,'',1,'',0,639),(2061,0,'zaag','',0,'',1,'',0,640),(2062,0,'spuit','',0,'',1,'',0,640),(2063,0,'mes','',0,'',1,'',0,640),(2064,0,'microscoop naar kleine mini-mensjes in de zaadcel.<br />\r\nMaar niemand heeft ze ooit gezien.','',1,'',1,'',0,641),(2065,0,'telescoop naar kleine mini-mensjes in de zaadcel.<br />\r\nMaar niemand heeft ze ooit gezien.&nbsp;','',0,'',1,'',0,641),(2068,0,'Ze opereerden niet, want dat deed veel te veel pijn.','',0,'',1,'',0,642),(2069,0,'Iemand stevig vasthouden en een houtje tussen de<br />\r\ntanden klemmen, zodat je niet op je tong zou bijten.','',1,NULL,1,'',0,642),(2483,0,'een wond schoonspoelen. ','',0,NULL,1,'',0,639),(2484,0,'boor','',1,NULL,1,'',0,640),(2485,0,'Zomaar vanzelf in de moeder ontstond.<br />\r\nEr was helemaal geen vader nodig.','',0,NULL,0,'',0,784),(2486,0,'Al kant-en-klaar in de vader zat. Volgens hen<br />\r\nwas de moeder alleen de kweekkamer en was<br />\r\ner niet eens een eicel die bevrucht werd.','',1,NULL,0,'',0,784),(2487,0,'Een wond schoonspoelen.','',0,NULL,0,'',0,785),(2488,0,'Via je kont je darmen doorspoelen.','',1,NULL,0,'',0,785),(2489,0,'Bij oorpijn je oor uitspoelen.','',0,NULL,0,'',0,785),(2490,0,'Na het eten je mond spoelen','',0,NULL,0,'',0,785),(2491,0,'Met een natte doek een pati&euml;nt koel houden.','',0,NULL,0,'',0,786),(2492,0,'Een wond schoon spoelen.','',0,NULL,0,'',0,786),(2493,0,'Een gaatje in een schedel boren.','',0,NULL,0,'',0,786),(2494,0,'Een bloedende wond dichtbranden met een heet brandijzer zodat het bloeden stopte.','',1,NULL,0,'',0,786),(2495,0,'Glas','',0,NULL,0,'',0,787),(2496,0,'Brandijzer','',0,NULL,0,'',0,787),(2497,0,'Boor','',1,NULL,0,'',0,787),(2498,0,'Spuit','',0,NULL,0,'',0,787),(2499,0,'Handen wassen.','',0,NULL,0,'',0,788),(2500,0,'Handen wassen en de pati&euml;nt verdoven.','',0,NULL,0,'',0,788),(2501,0,'Handen wassen, de pati&euml;nt verdoven en medische instrumenten ontsmetten.','',1,NULL,0,'',0,788),(2502,0,'Onzin, dat deden ze allemaal al wel.','',0,NULL,0,'',0,788),(2503,0,'Cauteriseren','',0,NULL,0,'',0,789),(2504,0,'Trepaneren','',1,NULL,0,'',0,789),(2505,0,'Klisteren','',0,NULL,0,'',0,789),(2506,0,'Aderlaten','',0,NULL,0,'',0,789),(2507,0,'Je bent voor de helft van je moeder en voor de helft van je vader.','',0,NULL,0,'',0,790),(2508,0,'De eicel van de moeder en de zaadcel van de vader smelten samen.','',0,NULL,0,'',0,790),(2509,0,'Je bent 50% door je vader en 50% door je moeder gemaakt.','',0,NULL,0,'',0,790),(2510,0,'Een baby wordt voor 100% door de vader gemaakt. De moeder is alleen de kweekkamer.','',1,NULL,0,'',0,790),(2511,0,'Klisteren is schoonspoelen van de darmen via de kont.','',0,NULL,0,'',0,791),(2512,0,'Trepaneren is een gaatje boren in een schedel.','',0,NULL,0,'',0,791),(2513,0,'Rond 1700 werden pati&euml;nten al verdoofd voor een operatie.','',1,NULL,0,'',0,791),(2514,0,'Van Leeuwenhoek bekeek met zijn zelfgemaakte microscoop insecten, luizen en zaadcellen.','',0,NULL,0,'',0,791),(2515,0,'Klisteren is het doorspoelen van de darmen via de kont.','',0,NULL,0,'',0,792),(2516,0,'Cauteriseren is het dichtbranden van wonden met een heet brandijzer.','',0,NULL,0,'',0,792),(2517,0,'Rond 1700 werden pati&euml;nten niet verdoofd voor een operatie.','',0,NULL,0,'',0,792),(2518,0,'Van Leeuwenhoek bekeek met zijn zelfgemaakte microscoop de sterren.','',1,NULL,0,'',0,792),(2519,0,'Niet, want er kwam toch meteen weer bloed op.','',0,NULL,0,'',0,793),(2520,0,'De zaag werd in een oven verhit tot boven de 100&deg; Celsius. ','',0,NULL,0,'',0,793),(2521,0,'Met water en zand, zodat de aangekoekte resten er afgeschuurd werden.','',1,NULL,0,'',0,793),(2522,0,'De zaag werd met alcohol afgespoeld.','',0,NULL,0,'',0,793),(2523,0,'Een baby zit kant-en-klaar in de zaadcel van de vader. De moeder is alleen maar de kweekkamer waar de baby in opgroeit.','',1,NULL,0,'',0,794),(2524,0,'De eicel van de moeder en de zaadcel van de vader smelten samen en worden samen een baby.','',0,NULL,0,'',0,794),(2525,0,'Als iemand zich verslikt had.','',0,NULL,0,'',0,795),(2526,0,'Als een pati&euml;nt te weinig zuurstof binnen kreeg.','',0,NULL,0,'',0,795),(2527,0,'Als iemand liefdesverdriet had.','',0,NULL,0,'',0,795),(2528,0,'Als door een klap op het hoofd de druk op de hersenen te hoog was geworden.','',1,NULL,0,'',0,795),(2529,0,'Kompas','',0,NULL,0,'',0,796),(2530,0,'Horloge','',0,NULL,0,'',0,796),(2531,0,'Barometer','',1,NULL,0,'',0,796),(2532,0,'Telescoop','',0,NULL,0,'',0,796),(2533,0,'Omdat een hele lange telescoop zou doorbuigen,<br />\r\nwaardoor je het beeld niet goed meer ziet.','',1,NULL,0,'',0,797),(2534,0,'Omdat er dan meer licht naar binnen kan komen<br />\r\nen je dus meer ziet.','',0,NULL,0,'',0,797),(2535,0,'Het aantal kwartier dat je onderweg bent','',0,NULL,0,'',0,798),(2536,0,'Hoe kwaad iemand is','',0,NULL,0,'',0,798),(2537,0,'Een afstand','',0,NULL,0,'',0,798),(2538,0,'Een hoek','',1,NULL,0,'',0,798),(2539,0,'Kometen','',0,NULL,0,'',0,799),(2540,0,'Sterren','',1,NULL,0,'',0,799),(2541,0,'Planeten','',0,NULL,0,'',0,799),(2542,0,'Maan','',0,NULL,0,'',0,799),(2543,0,'Kwadrant','',1,NULL,0,'',0,800),(2544,0,'Zonnewijzer','',0,NULL,0,'',0,800),(2545,0,'Telescoop','',0,NULL,0,'',0,800),(2546,0,'Kompas','',0,NULL,0,'',0,800),(2547,0,'Sterrendieren','',0,NULL,0,'',0,801),(2548,0,'Planeten','',0,NULL,0,'',0,801),(2549,0,'Sterrenbeelden','',1,NULL,0,'',0,801),(2550,0,'Kometen','',0,NULL,0,'',0,801),(2551,0,'Horloge','',0,NULL,0,'',0,802),(2552,0,'Telescoop','',0,NULL,0,'',0,802),(2553,0,'Kompas','',0,NULL,0,'',0,802),(2554,0,'Thermometer','',1,NULL,0,'',0,802),(2555,0,'Een slingeruurwerk','',0,NULL,0,'',0,803),(2556,0,'De S.O.S. code bij nood op zee','',1,NULL,0,'',0,803),(2557,0,'Een buisloze telescoop','',0,NULL,0,'',0,803),(2558,0,'Een klok voor op zee','',0,NULL,0,'',0,803),(2559,0,'Kompas: om je koers te bepalen.','',0,NULL,0,'',0,804),(2560,0,'Kwadrant: om te weten hoe noordelijk of zuidelijk je op aarde bent. ','',0,NULL,0,'',0,804),(2561,0,'Horloge: om te weten hoe westelijk of oostelijk je op aarde bent.','',0,NULL,0,'',0,804),(2562,0,'Antwoord A, B en C, maar met de opmerking dat een horloge door temperatuurverschillen vaak voor of achter liep. ','',1,NULL,0,'',0,804),(2563,0,'&hellip; staat boven de Zuidpool en het Zuiderkruis bij de Noordpool.','',0,NULL,0,'',0,805),(2564,0,'&hellip; staat boven de Noordpool en wijst het noorden aan.','',1,NULL,0,'',0,805),(2565,0,'&hellip; staat boven de Zuidpool en wijst het zuiden aan.','',0,NULL,0,'',0,805),(2566,0,'&hellip; en het Zuiderkruis staan beide vlakbij de Noordpool en wijzen het noorden aan. ','',0,NULL,0,'',0,805),(2567,0,'Kustkaart','',1,NULL,0,'',0,806),(2568,0,'Kompas','',0,NULL,0,'',0,806),(2569,0,'Kwadrant','',0,NULL,0,'',0,806),(2570,0,'Goedlopende klok','',0,NULL,0,'',0,806),(2571,0,'Een hele lange telescoop doorbuigt, waardoor je het beeld niet goed meer ziet.','',0,NULL,0,'',0,807),(2572,0,'Je dan de sterren nog meer kunt vergroten. ','',0,NULL,0,'',0,807),(2573,0,'Een hele lange telescoop te zwaar wordt, waardoor je niet goed kan richten.','',0,NULL,0,'',0,807),(2574,0,'Antwoord A en C samen.','',1,NULL,0,'',0,807),(2575,0,'Hoe noordelijk of zuidelijk je op aarde bent. ','',1,NULL,0,'',0,808),(2576,0,'Hoe westelijk of oostelijk je op aarde bent. ','',0,NULL,0,'',0,808),(2577,0,'Een kortere telescoop met sterkere lenzen.','',0,NULL,0,'',0,809),(2578,0,'Meer steunpilaren onder de telescoop tegen het doorzakken.','',0,NULL,0,'',0,809),(2579,0,'Een telescoop zonder buis.','',1,NULL,0,'',0,809),(2580,0,'Niets, Christiaan Huygens hield zich niet bezig met telescopen.','',0,NULL,0,'',0,809),(2581,0,'Horloge: om te weten hoe westelijk of oostelijk je op aarde bent.','',0,NULL,0,'',0,810),(2582,0,'Zeekaart: om te weten waar welke eilanden en ondiepten waren.','',0,NULL,0,'',0,810),(2583,0,'Kwadrant: om te weten hoe noordelijk of zuidelijk je op aarde bent. ','',0,NULL,0,'',0,810),(2584,0,'Antwoord A, B en C, maar met de opmerking dat een horloge door temperatuurverschillen vaak voor of achter liep. ','',1,NULL,0,'',0,810),(2585,0,'Dat deden ze om het navigeren moeilijker te maken, een soort geheimschrift.','',0,NULL,0,'',0,811),(2586,0,'Dan keken ze bij het tekenen van de sterrenkaart via een spiegel naar de sterren.','',0,NULL,0,'',0,811),(2587,0,'Dat deden ze om het navigeren makkelijker te maken, op zee is alles in spiegelbeeld.','',0,NULL,0,'',0,811),(2588,0,'Dan hebben ze de sterren niet vanaf de aarde getekend, maar vanuit het heelal.','',1,NULL,0,'',0,811),(2589,0,'Een kompasnaald wijst het noorden aan.','',0,NULL,0,'',0,812),(2590,0,'Op lucht kan een boot drijven.','',1,NULL,0,'',0,812),(2591,0,'In de zeebodem zitten soms veel luchtbellen.','',0,NULL,0,'',0,812),(2592,0,'Een boot drijft op water.','',0,NULL,0,'',0,812),(2593,0,'Twee voorwerpen scheef staan en bijna omvallen.','',0,NULL,0,'',0,813),(2594,0,'Een kompasnaald naar het noorden wijst.','',0,NULL,0,'',0,813),(2595,0,'Elektrische lading door de lucht overspringt.','',1,NULL,0,'',0,813),(2596,0,'Elektrische lading door een ijzerdraadje stroomt.','',0,NULL,0,'',0,813),(2597,0,'Vacu&uuml;m','',1,NULL,0,'',0,814),(2598,0,'Elektriciteit','',0,NULL,0,'',0,814),(2599,0,'Luchtdruk','',0,NULL,0,'',0,814),(2600,0,'Luchtweg','',0,NULL,0,'',0,814),(2601,0,'Maan','',0,NULL,0,'',0,815),(2602,0,'Sterren','',0,NULL,0,'',0,815),(2603,0,'Aarde','',1,NULL,0,'',0,815),(2604,0,'Zee','',0,NULL,0,'',0,815),(2605,0,'De lucht er helemaal uit weg is gepompt. ','',1,NULL,0,'',0,816),(2606,0,'Er extra lucht bij in is gepompt.','',0,NULL,0,'',0,816),(2607,0,'Als de naald vrij kan bewegen.','',0,NULL,0,'',0,817),(2608,0,'Als de batterij van het kompas is opgeladen.','',1,NULL,0,'',0,817),(2609,0,'Door het magnetisch veld van de aarde.','',0,NULL,0,'',0,817),(2610,0,'Als de naald zelf magnetisch is. ','',0,NULL,0,'',0,817),(2611,0,'Zweeft in lucht en drijft op water.','',0,NULL,0,'',0,818),(2612,0,'Valt in lucht en drijft op water.','',1,NULL,0,'',0,818),(2613,0,'Zweeft in lucht en zinkt in water.','',0,NULL,0,'',0,818),(2614,0,'Antwoord A, B en C zijn allemaal goed.','',0,NULL,0,'',0,818),(2615,0,'Kleine geladen deeltjes die kunnen stromen.','',0,NULL,0,'',0,819),(2616,0,'Blikseminslag.','',0,NULL,0,'',0,819),(2617,0,'Windkracht.','',1,NULL,0,'',0,819),(2618,0,'Vonken','',0,NULL,0,'',0,819),(2619,0,'Luchtbellen in de zeebodem zitten, die als ze onder de boot komen de boot laten vallen.','',1,NULL,0,'',0,820),(2620,0,'Zware metalen in de zeebodem zitten, die de boot naar beneden trekken.','',0,NULL,0,'',0,820),(2621,0,'Een onzichtbaar gas','',0,NULL,0,'',0,821),(2622,0,'Een speciale kracht van de god Neptunus','',0,NULL,0,'',0,821),(2623,0,'De aantrekkingskracht van de maan','',0,NULL,0,'',0,821),(2624,0,'Een onzichtbare vloeistof','',1,NULL,0,'',0,821),(2625,0,'Zet uit als de lucht rondom de ballon wordt weggezogen.','',1,NULL,0,'',0,822),(2626,0,'Krimpt als de lucht rondom de ballon wordt weggezogen.','',0,NULL,0,'',0,822),(2627,0,'Beide in Polen.','',0,NULL,0,'',0,823),(2628,0,'In de buurt van de Noord- en de Zuidpool.','',1,NULL,0,'',0,823),(2629,0,'Op de Evenaar in Brazili&euml; en Indonesi&euml;.','',0,NULL,0,'',0,823),(2630,0,'Men weet niet waar de polen liggen. ','',0,NULL,0,'',0,823),(2631,0,'De halve bollen magnetisch zijn en elkaar hard aantrekken.','',0,NULL,0,'',0,824),(2632,0,'De lucht rondom de halve bollen er heel hard op drukt.','',1,NULL,0,'',0,824),(2633,0,'Er dan draaikolken in het water komen die de boot naar beneden trekken.','',0,NULL,0,'',0,825),(2634,0,'Het kompas dan slecht werkt en de boot sneller zinkt.','',0,NULL,0,'',0,825),(2635,0,'Een boot wel op water drijft maar niet op lucht.','',1,NULL,0,'',0,825),(2636,0,'Er dan een lagedrukgebied boven het water komt en het dan gaat stormen.','',0,NULL,0,'',0,825),(2637,0,'Waar je op aarde bent.','',0,NULL,0,'',0,826),(2638,0,'Hoe noordelijk je op aarde bent.','',0,NULL,0,'',0,826),(2639,0,'In welke richting je vaart.','',1,NULL,0,'',0,826),(2640,0,'Hoe snel je vaart.','',0,NULL,0,'',0,826),(2641,0,'Een onzichtbare vloeistof was. Maar nu weten we dat elektriciteit te maken heeft met geladen deeltjes die stromen of zich ophopen.','',1,NULL,0,'',0,827),(2642,0,'Te maken had met luchtdruk. Maar nu weten we dat het een tekort aan magnetisme is. ','',0,NULL,0,'',0,827),(2643,0,'Zeemeermin','',1,NULL,0,'',0,828),(2644,0,'Zeeleeuw','',0,NULL,0,'',0,828),(2645,0,'Zeehond','',0,NULL,0,'',0,828),(2646,0,'Zeekat','',0,NULL,0,'',0,828),(2647,0,'De tor en de vlinder familie van elkaar zijn.','',0,NULL,0,'',0,829),(2648,0,'De kleuren van de tor en de vlinder mooi bij elkaar passen.','',1,NULL,0,'',0,829),(2649,0,'Een verdovingsmiddel met morfine.','',0,NULL,0,'',0,830),(2650,0,'Een uitgestorven dier dat vernoemd is naar zijn ontdekker.','',0,NULL,0,'',0,830),(2651,0,'Een kameleon die ook van vorm kan veranderen.','',0,NULL,0,'',0,830),(2652,0,'Een afbeelding die je met een speciale spiegel moet bekijken.','',1,NULL,0,'',0,830),(2653,0,'Ziit met heleboel andere bananen in een tros.','',0,NULL,0,'',0,831),(2654,0,'Zit aan een tak met stekels.','',1,NULL,0,'',0,831),(2655,0,'Zit boven een grote bloemtros aan een tak.','',0,NULL,0,'',0,831),(2656,0,'Groeit niet omlaag maar omhoog.','',0,NULL,0,'',0,831),(2657,0,'Ananas','',0,NULL,0,'',0,832),(2658,0,'Onomarfase','',0,NULL,0,'',0,832),(2659,0,'Atoom','',0,NULL,0,'',0,832),(2660,0,'Anamorfose','',1,NULL,0,'',0,832),(2661,0,'Met heleboel andere cashewnoten in &eacute;&eacute;n vrucht.','',0,NULL,0,'',0,833),(2662,0,'Aan een wortel in de grond.','',0,NULL,0,'',0,833),(2663,0,'Aan een oranje vrucht vast.','',1,NULL,0,'',0,833),(2664,0,'Aan een plant met stekels','',0,NULL,0,'',0,833),(2665,0,'Aap en een vis','',1,NULL,0,'',0,834),(2666,0,'Aap en een kip','',0,NULL,0,'',0,834),(2667,0,'Varken en een vis','',0,NULL,0,'',0,834),(2668,0,'Egel en een vis','',0,NULL,0,'',0,834),(2669,0,'Kleur zodat ze samen een mooi schilderijtje vormden. ','',1,NULL,0,'',0,835),(2670,0,'Hoe giftig ze waren.','',0,NULL,0,'',0,835),(2671,0,'Een mondeling verslag.','',0,NULL,0,'',0,836),(2672,0,'Een tekening ervan.','',0,NULL,0,'',0,836),(2673,0,'Een levend of dood exemplaar.','',0,NULL,0,'',0,836),(2674,0,'A, B en C samen.','',1,NULL,0,'',0,836),(2675,0,'Kleur','',0,NULL,0,'',0,837),(2676,0,'Kleur, bouw, grootte en vorm.','',1,NULL,0,'',0,837),(2677,0,'Cilinder','',0,NULL,0,'',0,838),(2678,0,'Kubus','',0,NULL,0,'',0,838),(2679,0,'Piramide','',0,NULL,0,'',0,838),(2680,0,'A, B en C kunnen allemaal. Maar de vorm van de spiegel verschilt per anamorfose. ','',1,NULL,0,'',0,838),(2681,0,'Een ananas groeit aan een plant met stekels.','',0,NULL,0,'',0,839),(2682,0,'Een banaan zit samen met heleboel andere bananen aan een tak.','',0,NULL,0,'',0,839),(2683,0,'Een cacaovrucht groeit aan een plant met stekels.','',1,NULL,0,'',0,839),(2684,0,'Een cashewnoot groeit aan een oranje vrucht.','',0,NULL,0,'',0,839),(2685,0,'Een ananas groeit aan een plant zonder stekels.','',0,NULL,0,'',0,840),(2686,0,'Aan elke tak zit maar &eacute;&eacute;n banaan.','',0,NULL,0,'',0,840),(2687,0,'Meerdere cacaobonen zitten samen in &eacute;&eacute;n cacaovrucht.','',1,NULL,0,'',0,840),(2688,0,'Een cashewnoot groeit onder de grond.','',0,NULL,0,'',0,840),(2689,0,'De tor en de vlinder familie van elkaar zijn.','',0,NULL,0,'',0,841),(2690,0,'De kleuren van de tor en de vlinder mooi bij elkaar passen','',1,NULL,0,'',0,841),(2691,0,'Ze even giftig zijn.','',0,NULL,0,'',0,841),(2692,0,'Ze evenveel eieren leggen.','',0,NULL,0,'',0,841),(2693,0,'Omdat de afbeelding geheim is en zonder spiegel niet te begrijpen is.','',0,NULL,0,'',0,842),(2694,0,'Voor de lol','',0,NULL,0,'',0,842),(2695,0,'Om te laten zien wat een spiegel met licht doet.','',0,NULL,0,'',0,842),(2696,0,'Antwoord A, B en C zijn allemaal goed.','',1,NULL,0,'',0,842),(2697,0,'Het kon dood gaan door te weinig of verkeerd voedsel.','',0,NULL,0,'',0,843),(2698,0,'De boot kon zinken','',0,NULL,0,'',0,843),(2699,0,'Het kon dood gaan door het klimaatverschil.','',0,NULL,0,'',0,843),(2700,0,'Antwoord A, B en C zijn allemaal goed.','',1,NULL,0,'',0,843);
/*!40000 ALTER TABLE `quiz_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_questions`
--

DROP TABLE IF EXISTS `quiz_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quiz_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `question_description` text NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `allow_viewresult` tinyint(4) NOT NULL DEFAULT '0',
  `publish` int(11) NOT NULL DEFAULT '1',
  `question_type_id` int(11) NOT NULL,
  `question_set` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `reward` int(11) DEFAULT NULL,
  `quiz_id` int(11) NOT NULL,
  `level_id` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `fk_quiz_questions_quiz` (`quiz_id`) USING BTREE,
  CONSTRAINT `quiz_questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=844 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_questions`
--

LOCK TABLES `quiz_questions` WRITE;
/*!40000 ALTER TABLE `quiz_questions` DISABLE KEYS */;
INSERT INTO `quiz_questions` VALUES (639,'Wat is klisteren?','',0,0,1,0,1,'',NULL,10,1),(640,'Trepaneren doe je met een:','',0,0,1,0,1,'',NULL,10,1),(641,'Vroeger dachten sommigen dat een baby al kant-en-klaar in de zaadcel van de vader zat. Men zocht daarom met een:','',0,0,1,0,1,'',NULL,10,1),(642,'Vroeger bestond er nog geen verdoving voor een operatie. Hoe deden ze dat dan?','',0,0,1,0,1,'',NULL,10,1),(784,'Vroeger dachten sommigen dat een baby:','',0,0,0,0,2,'',NULL,10,1),(785,'Wat is klisteren?','',0,0,0,0,2,'',NULL,10,1),(786,'Wat is cauteriseren?','',0,0,0,0,2,'',NULL,10,1),(787,'Trepaneren doe je met een:','',0,0,0,0,2,'',NULL,10,1),(788,'Wat deden ze vroeger voor een operatie nog niet:','',0,0,0,0,1,'',NULL,10,2),(789,'Een gaatje in een schedel boren om de druk op de hersenen te verlagen heet:','',0,0,0,0,1,'',NULL,10,2),(790,'Vroeger dachten sommigen dat een baby al kant-en-klaar in de zaadcel van de vader zat. Nu weten we dat ze ongelijk hadden. Wat klopt hieronder niet?','',0,0,0,0,1,'',NULL,10,2),(791,'Wat is <strong>niet</strong> waar?','',0,0,0,0,1,'',NULL,10,2),(792,'Wat is <strong>niet</strong> waar?','',0,0,0,0,2,'',NULL,10,2),(793,'Hoe werd vroeger een amputatiezaag schoon gemaakt?','',0,0,0,0,2,'',NULL,10,2),(794,'Welke stelling klopt niet?','',0,0,0,0,2,'',NULL,10,2),(795,'Wanneer werd vroeger een gaatje in de schedel geboord (trepaneren)?','',0,0,0,0,2,'',NULL,10,2),(796,'Navigeren op zee deed je vroeger <strong>niet</strong> met een:','',0,0,0,0,1,'',NULL,15,1),(797,'Christiaan Huygens bedacht een telescoop zonder buis:','',0,0,0,0,1,'',NULL,15,1),(798,'Met een kwadrant kan je meten:','',0,0,0,0,1,'',NULL,15,1),(799,'Om te navigeren op zee kijk je naar de:','',0,0,0,0,1,'',NULL,15,1),(800,'De hoek tussen de horizon en de Poolster meet je met een:','',0,0,0,0,2,'',NULL,15,1),(801,'Sterren die dicht bij elkaar staan noemen we:','',0,0,0,0,2,'',NULL,15,1),(802,'Navigeren op zee deed je vroeger <strong>niet</strong> met een:','',0,0,0,0,2,'',NULL,15,1),(803,'Wat bedacht Christiaan Huygens niet?','',0,0,0,0,2,'',NULL,15,1),(804,'Bij het navigeren op zee gebruikte je vroeger de volgende instrumenten:','',0,0,0,0,1,'',NULL,15,2),(805,'De Poolster&hellip;','',0,0,0,0,1,'',NULL,15,2),(806,'Als je midden op open zee zit, dan heb je het minst aan een:','',0,0,0,0,1,'',NULL,15,2),(807,'Een telescoop zonder buis is een goed idee omdat:','',0,0,0,0,1,'',NULL,15,2),(808,'De grootte van de hoek tussen de Poolster en de horizon zegt iets over:','',0,0,0,0,2,'',NULL,15,2),(809,'Een hele lange telescoop buigt door. Welke oplossing had Christiaan Huygens hiervoor?','',0,0,0,0,2,'',NULL,15,2),(810,'Bij het navigeren op zee gebruikte je vroeger de volgende instrumenten:','',0,0,0,0,2,'',NULL,15,2),(811,'Op sommige sterrenkaarten staan alle sterrenbeelden in spiegelbeeld. Hoe komt dat?','',0,0,0,0,2,'',NULL,15,2),(812,'Wat is <strong>niet</strong> waar?','',0,0,0,0,1,'',NULL,16,1),(813,'Vonken zie je als:','',0,0,0,0,1,'',NULL,16,1),(814,'Als alle lucht uit een ruimte is weggezogen heet dat:','',0,0,0,0,1,'',NULL,16,1),(815,'Een kompasnaald draait door het magnetische veld van de:','',0,0,0,0,1,'',NULL,16,1),(816,'Er is vacu&uuml;m in een afgesloten stolp als:','',0,0,0,0,2,'',NULL,16,1),(817,'Wat is <strong>niet</strong> goed? Een kompasnaald draait:','',0,0,0,0,2,'',NULL,16,1),(818,'Een boot:','',0,0,0,0,2,'',NULL,16,1),(819,'Elektriciteit heeft <strong>niets</strong> te maken met:','',0,0,0,0,2,'',NULL,16,1),(820,'Boten zinken soms omdat er veel:','',0,0,0,0,1,'',NULL,16,2),(821,'Wat dacht men vroeger wat elektriciteit was? ','',0,0,0,0,1,'',NULL,16,2),(822,'Een opgeblazen ballon:','',0,0,0,0,1,'',NULL,16,2),(823,'Een magneet heeft twee polen die elkaar aantrekken of afstoten. De aarde is een magneet en haar polen liggen:','',0,0,0,0,1,'',NULL,16,2),(824,'De lucht in twee halve bollen is weggezogen tot vacu&uuml;m. Ze kunnen moeilijk uit elkaar getrokken worden omdat:','',0,0,0,0,2,'',NULL,16,2),(825,'Als er veel luchtbellen in de bodem zitten, kunnen boten zinken. Dat komt doordat:','',0,0,0,0,2,'',NULL,16,2),(826,'Een kompas wijst het noorden aan. Hierdoor weet je:','',0,0,0,0,2,'',NULL,16,2),(827,'Vroeger dacht men dat elektriciteit:','',0,0,0,0,2,'',NULL,16,2),(828,'Welk dier bestaat niet, waarvan vroeger werd geloofd dat het wel bestond?','',0,0,0,0,1,'',NULL,17,1),(829,'Verzamelde insecten werden vroeger bij elkaar gezet zodat ze samen een mooi schilderijtje vormden. Een tor uit Brazili&euml; kwam naast een vlinder uit Nederland te liggen, omdat:','',0,0,0,0,1,'',NULL,17,1),(830,'Wat is een anamorfose?','',0,0,0,0,1,'',NULL,17,1),(831,'Een goede onderzoeker kan heel precies kijken. Kijk dus goed naar de tekeningen in de kist achter je op het strand. Wat klopt hieronder niet? Een banaan:','',0,0,0,0,1,'',NULL,17,1),(832,'Een afbeelding die je met een speciale spiegel moet bekijken is een:','',0,0,0,0,2,'',NULL,17,1),(833,'Een goede onderzoeker kan heel precies kijken. Kijk dus goed naar de tekeningen in de kist achter je op het strand. Een cashewnoot zit:','',0,0,0,0,2,'',NULL,17,1),(834,'Ook al kan je een zeemeermin nog zo goed tekenen, ze bestaat niet. Om anderen te foppen werd een nep-zeemeermin gemaakt van een:','',0,0,0,0,2,'',NULL,17,1),(835,'Nu worden insecten geordend op uiterlijke kenmerken, maar vroeger werden ze bij elkaar gezet op:','',0,0,0,0,2,'',NULL,17,1),(836,'Als vroeger een nieuwe diersoort ontdekt werd, was het beste bewijs een:','',0,0,0,0,1,'',NULL,17,2),(837,'Hoe zet je verschillende soorten insecten het beste bij elkaar zodat je goed kan zien of ze dezelfde kenmerken hebben? Je zet ze bij elkaar op:','',0,0,0,0,1,'',NULL,17,2),(838,'Een anamorfose is een afbeelding die je moet bekijken met een spiegel in de vorm van een:','',0,0,0,0,1,'',NULL,17,2),(839,'Een goede onderzoeker kan heel precies kijken. Kijk dus goed naar de tekeningen in de kist achter je op het strand. Wat klopt er niet? ','',0,0,0,0,1,'',NULL,17,2),(840,'Een goede onderzoeker kan heel precies kijken. Kijk dus goed naar de tekeningen in de kist achter je op het strand. Welke stelling is juist? ','',0,0,0,0,2,'',NULL,17,2),(841,'Verzamelde insecten werden vroeger bij elkaar gezet zodat ze samen een mooi schilderijtje vormden. Een tor uit Brazili&euml; kwam naast een vlinder uit Nederland te liggen, omdat:','',0,0,0,0,2,'',NULL,17,2),(842,'Waarom zou men een anamorfose maken?','',0,0,0,0,2,'',NULL,17,2),(843,'Als bewijs van een nieuw ontdekte plant- of diersoort werd vaak een exemplaar mee naar huis genomen. Wat kon tijdens zo&rsquo;n lange zeereis gebeuren?','',0,0,0,0,2,'',NULL,17,2);
/*!40000 ALTER TABLE `quiz_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(45) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `routeName` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3199 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (2588,'logobuilder','finduserlogo','index',NULL,NULL,'0000-00-00 00:00:00'),(2589,'logobuilder','newletter','index',NULL,NULL,'0000-00-00 00:00:00'),(2590,'logobuilder','finish','index',NULL,NULL,'0000-00-00 00:00:00'),(2591,'logobuilder','process','index',NULL,NULL,'0000-00-00 00:00:00'),(2592,'logobuilder','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2594,'group','ranking','index',NULL,NULL,'0000-00-00 00:00:00'),(2595,'group','logout','index',NULL,NULL,'0000-00-00 00:00:00'),(2598,'group','grouploginticket','index',NULL,NULL,'0000-00-00 00:00:00'),(2599,'group','upload','index',NULL,NULL,'0000-00-00 00:00:00'),(2600,'group','search','index',NULL,NULL,'0000-00-00 00:00:00'),(2601,'group','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2610,'quiz','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2613,'ranking','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2618,'default','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2619,'default','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2620,'default','error','notfound',NULL,NULL,'0000-00-00 00:00:00'),(2621,'default','dashboard','index',NULL,NULL,'0000-00-00 00:00:00'),(2622,'default','contact','index',NULL,NULL,'0000-00-00 00:00:00'),(2623,'default','download','index',NULL,NULL,'0000-00-00 00:00:00'),(2624,'default','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2630,'messages','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2631,'social','facebook','index',NULL,NULL,'0000-00-00 00:00:00'),(2632,'social','facebook','channel',NULL,NULL,'0000-00-00 00:00:00'),(2633,'poll','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2634,'poll','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2635,'poll','result','index',NULL,NULL,'0000-00-00 00:00:00'),(2636,'poll','widget','index',NULL,NULL,'0000-00-00 00:00:00'),(2637,'poll','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2638,'qrcode','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2639,'qrcode','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2640,'qrcode','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2641,'qrcode','index','embedded-svg',NULL,NULL,'0000-00-00 00:00:00'),(2642,'qrcode','index','download',NULL,NULL,'0000-00-00 00:00:00'),(2643,'qrcode','index','save-image',NULL,NULL,'0000-00-00 00:00:00'),(2644,'tasks','uploadfile','index',NULL,NULL,'0000-00-00 00:00:00'),(2645,'tasks','savetext','index',NULL,NULL,'0000-00-00 00:00:00'),(2646,'tasks','view','index',NULL,NULL,'0000-00-00 00:00:00'),(2647,'tasks','taskvideo','index',NULL,NULL,'0000-00-00 00:00:00'),(2648,'tasks','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2649,'tasks','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2650,'tasks','widget','index',NULL,NULL,'0000-00-00 00:00:00'),(2651,'tasks','none','index',NULL,NULL,'0000-00-00 00:00:00'),(2652,'tasks','sendreminder','index',NULL,NULL,'0000-00-00 00:00:00'),(2653,'tasks','deletefile','index',NULL,NULL,'0000-00-00 00:00:00'),(2654,'tasks','list','index',NULL,NULL,'0000-00-00 00:00:00'),(2655,'tasks','vote','index',NULL,NULL,'0000-00-00 00:00:00'),(2656,'tasks','taskvideolarge','index',NULL,NULL,'0000-00-00 00:00:00'),(2657,'tasks','validate','index',NULL,NULL,'0000-00-00 00:00:00'),(2658,'tasks','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2659,'login','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2660,'login','password','index',NULL,NULL,'0000-00-00 00:00:00'),(2661,'login','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2662,'login','index','denied',NULL,NULL,'0000-00-00 00:00:00'),(2663,'media','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2664,'media','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2665,'media','widget','index',NULL,NULL,'0000-00-00 00:00:00'),(2666,'media','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(2667,'media','retrievefacebookimage','index',NULL,NULL,'0000-00-00 00:00:00'),(2668,'media','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2669,'user','profile','index',NULL,NULL,'0000-00-00 00:00:00'),(2672,'user','widget','index',NULL,NULL,'0000-00-00 00:00:00'),(2673,'user','logout','index',NULL,NULL,'0000-00-00 00:00:00'),(2675,'user','edit','index',NULL,NULL,'0000-00-00 00:00:00'),(2676,'user','list','index',NULL,NULL,'0000-00-00 00:00:00'),(2677,'user','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2688,'leads','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2689,'comments','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2690,'comments','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2692,'comments','post','index',NULL,NULL,'0000-00-00 00:00:00'),(2693,'comments','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2694,'battles','fight','index',NULL,NULL,'0000-00-00 00:00:00'),(2695,'battles','error','index',NULL,NULL,'0000-00-00 00:00:00'),(2696,'battles','result','index',NULL,NULL,'0000-00-00 00:00:00'),(2697,'battles','dashboard','index',NULL,NULL,'0000-00-00 00:00:00'),(2698,'battles','sidebar','index',NULL,NULL,'0000-00-00 00:00:00'),(2699,'battles','list','index',NULL,NULL,'0000-00-00 00:00:00'),(2700,'battles','versus','index',NULL,NULL,'0000-00-00 00:00:00'),(2701,'battles','challenge','index',NULL,NULL,'0000-00-00 00:00:00'),(2702,'battles','search','index',NULL,NULL,'0000-00-00 00:00:00'),(2703,'battles','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2708,'content','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2709,'avatar','builder','index',NULL,NULL,'0000-00-00 00:00:00'),(2710,'avatar','save','index',NULL,NULL,'0000-00-00 00:00:00'),(2711,'avatar','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2712,'avatar','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2713,'avatar','metadata','index',NULL,NULL,'0000-00-00 00:00:00'),(2714,'avatar','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2715,'avatar','index','display',NULL,NULL,'0000-00-00 00:00:00'),(2716,'admin','text','index',NULL,NULL,'0000-00-00 00:00:00'),(2717,'admin','text','edit',NULL,NULL,'0000-00-00 00:00:00'),(2718,'admin','text','new',NULL,NULL,'0000-00-00 00:00:00'),(2719,'admin','text','validateform',NULL,NULL,'0000-00-00 00:00:00'),(2720,'admin','leads','index',NULL,NULL,'0000-00-00 00:00:00'),(2721,'admin','leads','search',NULL,NULL,'0000-00-00 00:00:00'),(2722,'admin','leads','list',NULL,NULL,'0000-00-00 00:00:00'),(2723,'admin','leads','new',NULL,NULL,'0000-00-00 00:00:00'),(2724,'admin','leads','edit',NULL,NULL,'0000-00-00 00:00:00'),(2725,'admin','leads','delete',NULL,NULL,'0000-00-00 00:00:00'),(2726,'admin','media','index',NULL,NULL,'0000-00-00 00:00:00'),(2727,'admin','media','log',NULL,NULL,'0000-00-00 00:00:00'),(2728,'admin','media','list',NULL,NULL,'0000-00-00 00:00:00'),(2729,'admin','media','search',NULL,NULL,'0000-00-00 00:00:00'),(2730,'admin','media','view',NULL,NULL,'0000-00-00 00:00:00'),(2731,'admin','media','albums',NULL,NULL,'0000-00-00 00:00:00'),(2732,'admin','media','upload',NULL,NULL,'0000-00-00 00:00:00'),(2733,'admin','media','uploadhandler',NULL,NULL,'0000-00-00 00:00:00'),(2734,'admin','media','addalbum',NULL,NULL,'0000-00-00 00:00:00'),(2735,'admin','media','editalbum',NULL,NULL,'0000-00-00 00:00:00'),(2736,'admin','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2737,'admin','tasks','index',NULL,NULL,'0000-00-00 00:00:00'),(2738,'admin','tasks','search',NULL,NULL,'0000-00-00 00:00:00'),(2739,'admin','tasks','list',NULL,NULL,'0000-00-00 00:00:00'),(2740,'admin','tasks','new',NULL,NULL,'0000-00-00 00:00:00'),(2741,'admin','tasks','edit',NULL,NULL,'0000-00-00 00:00:00'),(2742,'admin','tasks','delete',NULL,NULL,'0000-00-00 00:00:00'),(2743,'admin','tasks','listusertasks',NULL,NULL,'0000-00-00 00:00:00'),(2744,'admin','stats','index',NULL,NULL,'0000-00-00 00:00:00'),(2745,'admin','system','index',NULL,NULL,'0000-00-00 00:00:00'),(2746,'admin','system','cleanupcontentitems',NULL,NULL,'0000-00-00 00:00:00'),(2747,'admin','system','cleanuptest',NULL,NULL,'0000-00-00 00:00:00'),(2748,'admin','system','cleanupusers',NULL,NULL,'0000-00-00 00:00:00'),(2749,'admin','system','cleanupusersgroups',NULL,NULL,'0000-00-00 00:00:00'),(2750,'admin','system','cleanupcontent',NULL,NULL,'0000-00-00 00:00:00'),(2751,'admin','system','createtestusergroups',NULL,NULL,'0000-00-00 00:00:00'),(2752,'admin','system','createtestpartners',NULL,NULL,'0000-00-00 00:00:00'),(2753,'admin','system','createtestquizquestionsanwers',NULL,NULL,'0000-00-00 00:00:00'),(2754,'admin','system','createtestchannels',NULL,NULL,'0000-00-00 00:00:00'),(2755,'admin','system','createpasswords',NULL,NULL,'0000-00-00 00:00:00'),(2756,'admin','system','rewriteimagesurlavatar',NULL,NULL,'0000-00-00 00:00:00'),(2757,'admin','system','rewriteimagesurluser',NULL,NULL,'0000-00-00 00:00:00'),(2758,'admin','events','index',NULL,NULL,'0000-00-00 00:00:00'),(2759,'admin','events','search',NULL,NULL,'0000-00-00 00:00:00'),(2760,'admin','events','list',NULL,NULL,'0000-00-00 00:00:00'),(2761,'admin','events','listcategories',NULL,NULL,'0000-00-00 00:00:00'),(2762,'admin','events','new',NULL,NULL,'0000-00-00 00:00:00'),(2763,'admin','events','newcategory',NULL,NULL,'0000-00-00 00:00:00'),(2764,'admin','events','edit',NULL,NULL,'0000-00-00 00:00:00'),(2765,'admin','events','editcategories',NULL,NULL,'0000-00-00 00:00:00'),(2766,'admin','events','delete',NULL,NULL,'0000-00-00 00:00:00'),(2767,'admin','events','deletecategory',NULL,NULL,'0000-00-00 00:00:00'),(2768,'admin','resources','index',NULL,NULL,'0000-00-00 00:00:00'),(2769,'admin','resources','assign',NULL,NULL,'0000-00-00 00:00:00'),(2770,'admin','resources','generate',NULL,NULL,'0000-00-00 00:00:00'),(2771,'admin','avatar','index',NULL,NULL,'0000-00-00 00:00:00'),(2772,'admin','avatar','search',NULL,NULL,'0000-00-00 00:00:00'),(2773,'admin','avatar','list',NULL,NULL,'0000-00-00 00:00:00'),(2774,'admin','avatar','new',NULL,NULL,'0000-00-00 00:00:00'),(2775,'admin','avatar','edit',NULL,NULL,'0000-00-00 00:00:00'),(2776,'admin','avatar','delete',NULL,NULL,'0000-00-00 00:00:00'),(2777,'admin','avatar','listcategories',NULL,NULL,'0000-00-00 00:00:00'),(2778,'admin','avatar','editcategories',NULL,NULL,'0000-00-00 00:00:00'),(2779,'admin','avatar','newcategories',NULL,NULL,'0000-00-00 00:00:00'),(2780,'admin','avatar','deletecategories',NULL,NULL,'0000-00-00 00:00:00'),(2781,'admin','avatar','validateform',NULL,NULL,'0000-00-00 00:00:00'),(2782,'admin','groups','index',NULL,NULL,'0000-00-00 00:00:00'),(2783,'admin','groups','list',NULL,NULL,'0000-00-00 00:00:00'),(2784,'admin','groups','search',NULL,NULL,'0000-00-00 00:00:00'),(2785,'admin','groups','new',NULL,NULL,'0000-00-00 00:00:00'),(2786,'admin','groups','edit',NULL,NULL,'0000-00-00 00:00:00'),(2787,'admin','groups','delete',NULL,NULL,'0000-00-00 00:00:00'),(2788,'admin','groups','listregions',NULL,NULL,'0000-00-00 00:00:00'),(2789,'admin','groups','newregion',NULL,NULL,'0000-00-00 00:00:00'),(2790,'admin','groups','editregion',NULL,NULL,'0000-00-00 00:00:00'),(2791,'admin','groups','deleteregion',NULL,NULL,'0000-00-00 00:00:00'),(2792,'admin','userlevels','index',NULL,NULL,'0000-00-00 00:00:00'),(2793,'admin','userlevels','search',NULL,NULL,'0000-00-00 00:00:00'),(2794,'admin','userlevels','list',NULL,NULL,'0000-00-00 00:00:00'),(2795,'admin','userlevels','new',NULL,NULL,'0000-00-00 00:00:00'),(2796,'admin','userlevels','edit',NULL,NULL,'0000-00-00 00:00:00'),(2797,'admin','userlevels','delete',NULL,NULL,'0000-00-00 00:00:00'),(2798,'admin','general','navigation',NULL,NULL,'0000-00-00 00:00:00'),(2799,'admin','general','userinfo',NULL,NULL,'0000-00-00 00:00:00'),(2800,'admin','general','adminmenu',NULL,NULL,'0000-00-00 00:00:00'),(2801,'admin','messages','index',NULL,NULL,'0000-00-00 00:00:00'),(2802,'admin','messages','list',NULL,NULL,'0000-00-00 00:00:00'),(2803,'admin','messages','search',NULL,NULL,'0000-00-00 00:00:00'),(2804,'admin','messages','new',NULL,NULL,'0000-00-00 00:00:00'),(2805,'admin','messages','delete',NULL,NULL,'0000-00-00 00:00:00'),(2806,'admin','periods','index',NULL,NULL,'0000-00-00 00:00:00'),(2807,'admin','periods','search',NULL,NULL,'0000-00-00 00:00:00'),(2808,'admin','periods','list',NULL,NULL,'0000-00-00 00:00:00'),(2809,'admin','periods','new',NULL,NULL,'0000-00-00 00:00:00'),(2810,'admin','periods','edit',NULL,NULL,'0000-00-00 00:00:00'),(2811,'admin','periods','delete',NULL,NULL,'0000-00-00 00:00:00'),(2812,'admin','periods','listapplication',NULL,NULL,'0000-00-00 00:00:00'),(2813,'admin','periods','newapplication',NULL,NULL,'0000-00-00 00:00:00'),(2814,'admin','periods','editapplication',NULL,NULL,'0000-00-00 00:00:00'),(2815,'admin','periods','deleteapplication',NULL,NULL,'0000-00-00 00:00:00'),(2816,'admin','periods','listcontent',NULL,NULL,'0000-00-00 00:00:00'),(2817,'admin','periods','newcontent',NULL,NULL,'0000-00-00 00:00:00'),(2818,'admin','periods','editcontent',NULL,NULL,'0000-00-00 00:00:00'),(2819,'admin','periods','deletecontent',NULL,NULL,'0000-00-00 00:00:00'),(2820,'admin','labels','index',NULL,NULL,'0000-00-00 00:00:00'),(2821,'admin','labels','search',NULL,NULL,'0000-00-00 00:00:00'),(2822,'admin','labels','list',NULL,NULL,'0000-00-00 00:00:00'),(2823,'admin','labels','new',NULL,NULL,'0000-00-00 00:00:00'),(2824,'admin','labels','edit',NULL,NULL,'0000-00-00 00:00:00'),(2825,'admin','labels','delete',NULL,NULL,'0000-00-00 00:00:00'),(2826,'admin','poll','index',NULL,NULL,'0000-00-00 00:00:00'),(2827,'admin','poll','list',NULL,NULL,'0000-00-00 00:00:00'),(2828,'admin','poll','edit',NULL,NULL,'0000-00-00 00:00:00'),(2829,'admin','poll','new',NULL,NULL,'0000-00-00 00:00:00'),(2830,'admin','poll','listanswers',NULL,NULL,'0000-00-00 00:00:00'),(2831,'admin','poll','editanswer',NULL,NULL,'0000-00-00 00:00:00'),(2832,'admin','poll','newanswer',NULL,NULL,'0000-00-00 00:00:00'),(2833,'admin','poll','delete',NULL,NULL,'0000-00-00 00:00:00'),(2834,'admin','poll','deleteanswer',NULL,NULL,'0000-00-00 00:00:00'),(2835,'admin','quizes','index',NULL,NULL,'0000-00-00 00:00:00'),(2836,'admin','quizes','search',NULL,NULL,'0000-00-00 00:00:00'),(2837,'admin','quizes','list',NULL,NULL,'0000-00-00 00:00:00'),(2838,'admin','quizes','new',NULL,NULL,'0000-00-00 00:00:00'),(2839,'admin','quizes','edit',NULL,NULL,'0000-00-00 00:00:00'),(2840,'admin','quizes','delete',NULL,NULL,'0000-00-00 00:00:00'),(2841,'admin','quizes','listquestion',NULL,NULL,'0000-00-00 00:00:00'),(2842,'admin','quizes','newquestion',NULL,NULL,'0000-00-00 00:00:00'),(2843,'admin','quizes','editquestion',NULL,NULL,'0000-00-00 00:00:00'),(2844,'admin','quizes','deletequestion',NULL,NULL,'0000-00-00 00:00:00'),(2845,'admin','quizes','listanswers',NULL,NULL,'0000-00-00 00:00:00'),(2846,'admin','quizes','newanswer',NULL,NULL,'0000-00-00 00:00:00'),(2847,'admin','quizes','editanswer',NULL,NULL,'0000-00-00 00:00:00'),(2848,'admin','quizes','deleteanswer',NULL,NULL,'0000-00-00 00:00:00'),(2849,'admin','users','index',NULL,NULL,'0000-00-00 00:00:00'),(2850,'admin','users','search',NULL,NULL,'0000-00-00 00:00:00'),(2851,'admin','users','list',NULL,NULL,'0000-00-00 00:00:00'),(2852,'admin','users','new',NULL,NULL,'0000-00-00 00:00:00'),(2853,'admin','users','edit',NULL,NULL,'0000-00-00 00:00:00'),(2854,'admin','users','delete',NULL,NULL,'0000-00-00 00:00:00'),(2855,'admin','users','listchannel',NULL,NULL,'0000-00-00 00:00:00'),(2856,'admin','users','newchannel',NULL,NULL,'0000-00-00 00:00:00'),(2857,'admin','users','editchannel',NULL,NULL,'0000-00-00 00:00:00'),(2858,'admin','users','deletechannel',NULL,NULL,'0000-00-00 00:00:00'),(2859,'admin','users','export',NULL,NULL,'0000-00-00 00:00:00'),(2860,'admin','transactions','index',NULL,NULL,'0000-00-00 00:00:00'),(2861,'admin','transactions','search',NULL,NULL,'0000-00-00 00:00:00'),(2862,'admin','transactions','list',NULL,NULL,'0000-00-00 00:00:00'),(2863,'admin','transactions','new',NULL,NULL,'0000-00-00 00:00:00'),(2864,'admin','transactions','edit',NULL,NULL,'0000-00-00 00:00:00'),(2865,'admin','transactions','delete',NULL,NULL,'0000-00-00 00:00:00'),(2866,'admin','content','index',NULL,NULL,'0000-00-00 00:00:00'),(2867,'admin','content','search',NULL,NULL,'0000-00-00 00:00:00'),(2868,'admin','content','list',NULL,NULL,'0000-00-00 00:00:00'),(2869,'admin','content','new',NULL,NULL,'0000-00-00 00:00:00'),(2870,'admin','content','edit',NULL,NULL,'0000-00-00 00:00:00'),(2871,'admin','content','delete',NULL,NULL,'0000-00-00 00:00:00'),(2872,'admin','content','listcategories',NULL,NULL,'0000-00-00 00:00:00'),(2873,'admin','content','editcategories',NULL,NULL,'0000-00-00 00:00:00'),(2874,'admin','content','newcategories',NULL,NULL,'0000-00-00 00:00:00'),(2875,'admin','content','deletecategories',NULL,NULL,'0000-00-00 00:00:00'),(2876,'admin','content','validateform',NULL,NULL,'0000-00-00 00:00:00'),(2877,'admin','login','index',NULL,NULL,'0000-00-00 00:00:00'),(2878,'admin','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2879,'admin','index','logout',NULL,NULL,'0000-00-00 00:00:00'),(2880,'admin','index','clean',NULL,NULL,'0000-00-00 00:00:00'),(2881,'mobile','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2882,'mobile','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2883,'mobile','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2884,'api','error','error',NULL,NULL,'0000-00-00 00:00:00'),(2885,'api','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(2886,'api','error','notfound',NULL,NULL,'0000-00-00 00:00:00'),(2887,'api','user','index',NULL,NULL,'0000-00-00 00:00:00'),(2888,'api','user','get',NULL,NULL,'0000-00-00 00:00:00'),(2889,'api','user','post',NULL,NULL,'0000-00-00 00:00:00'),(2890,'api','user','put',NULL,NULL,'0000-00-00 00:00:00'),(2891,'api','user','delete',NULL,NULL,'0000-00-00 00:00:00'),(2892,'api','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2893,'api','index','get',NULL,NULL,'0000-00-00 00:00:00'),(2894,'api','index','post',NULL,NULL,'0000-00-00 00:00:00'),(2895,'api','index','put',NULL,NULL,'0000-00-00 00:00:00'),(2896,'api','index','delete',NULL,NULL,'0000-00-00 00:00:00'),(2897,'admin','text','search',NULL,NULL,'0000-00-00 00:00:00'),(2898,'admin','text','list',NULL,NULL,'0000-00-00 00:00:00'),(2899,'admin','text','editiframe',NULL,NULL,'0000-00-00 00:00:00'),(2900,'admin','text','newiframe',NULL,NULL,'0000-00-00 00:00:00'),(2901,'admin','resources','test',NULL,NULL,'0000-00-00 00:00:00'),(2904,'mobile','index','logout',NULL,NULL,'0000-00-00 00:00:00'),(2905,'mobile','index','register',NULL,NULL,'0000-00-00 00:00:00'),(2906,'admin','qrcode','index',NULL,NULL,'0000-00-00 00:00:00'),(2908,'admin','qrcode','list',NULL,NULL,'0000-00-00 00:00:00'),(2909,'admin','qrcode','new',NULL,NULL,'0000-00-00 00:00:00'),(2910,'admin','qrcode','edit',NULL,NULL,'0000-00-00 00:00:00'),(2911,'admin','qrcode','delete',NULL,NULL,'0000-00-00 00:00:00'),(2914,'admin','qrcode','listlocations',NULL,NULL,'0000-00-00 00:00:00'),(2915,'admin','qrcode','newlocation',NULL,NULL,'0000-00-00 00:00:00'),(2916,'admin','qrcode','editlocation',NULL,NULL,'0000-00-00 00:00:00'),(2917,'admin','qrcode','deletelocation',NULL,NULL,'0000-00-00 00:00:00'),(2918,'admin','qrcode','searchlist',NULL,NULL,'0000-00-00 00:00:00'),(2919,'admin','qrcode','searchlistlocations',NULL,NULL,'0000-00-00 00:00:00'),(2920,'admin','qrcode','searchlistcategories',NULL,NULL,'0000-00-00 00:00:00'),(2921,'admin','qrcode','listcategories',NULL,NULL,'0000-00-00 00:00:00'),(2922,'admin','qrcode','newcategory',NULL,NULL,'0000-00-00 00:00:00'),(2923,'admin','qrcode','editcategory',NULL,NULL,'0000-00-00 00:00:00'),(2924,'admin','qrcode','deletecategory',NULL,NULL,'0000-00-00 00:00:00'),(2925,'admin','qrcode','searchlistbehaviours',NULL,NULL,'0000-00-00 00:00:00'),(2926,'admin','qrcode','listbehaviours',NULL,NULL,'0000-00-00 00:00:00'),(2927,'admin','qrcode','newbehaviour',NULL,NULL,'0000-00-00 00:00:00'),(2928,'admin','qrcode','editbehaviour',NULL,NULL,'0000-00-00 00:00:00'),(2929,'admin','qrcode','deletebehaviour',NULL,NULL,'0000-00-00 00:00:00'),(2931,'mobile','index','dashboard',NULL,NULL,'0000-00-00 00:00:00'),(2932,'mobile','index','home',NULL,NULL,'0000-00-00 00:00:00'),(2933,'mobile','index','invites',NULL,NULL,'0000-00-00 00:00:00'),(2934,'mobile','index','scanner',NULL,NULL,'0000-00-00 00:00:00'),(2935,'social','facebook','code',NULL,NULL,'0000-00-00 00:00:00'),(2936,'social','facebook','dashboard',NULL,NULL,'0000-00-00 00:00:00'),(2937,'mobile','index','gamerules',NULL,NULL,'0000-00-00 00:00:00'),(2938,'login','new','index',NULL,NULL,'0000-00-00 00:00:00'),(2939,'invites','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2940,'invites','index','list',NULL,NULL,'0000-00-00 00:00:00'),(2941,'invites','index','invite',NULL,NULL,'0000-00-00 00:00:00'),(2943,'mobile','index','invite',NULL,NULL,'0000-00-00 00:00:00'),(2944,'mobile','index','win',NULL,NULL,'0000-00-00 00:00:00'),(2945,'mobile','index','tips',NULL,NULL,'0000-00-00 00:00:00'),(2946,'invites','index','accept',NULL,NULL,'0000-00-00 00:00:00'),(2947,'mobile','index','termandconditions',NULL,NULL,'0000-00-00 00:00:00'),(2948,'mobile','index','acceptinvite',NULL,NULL,'0000-00-00 00:00:00'),(2959,'login','validate','index',NULL,NULL,'0000-00-00 00:00:00'),(2960,'login','validate','getlink',NULL,NULL,'0000-00-00 00:00:00'),(2961,'default','error','setdevice',NULL,NULL,'0000-00-00 00:00:00'),(2962,'login','password','change',NULL,NULL,'0000-00-00 00:00:00'),(2963,'login','password','request',NULL,NULL,'0000-00-00 00:00:00'),(2964,'social','facebook','share',NULL,NULL,'0000-00-00 00:00:00'),(2966,'admin','qrcode','recreateimages',NULL,NULL,'0000-00-00 00:00:00'),(2967,'admin','resources','delete',NULL,NULL,'0000-00-00 00:00:00'),(2969,'social','twitter','index',NULL,NULL,'0000-00-00 00:00:00'),(2970,'social','twitter','authenticate',NULL,NULL,'0000-00-00 00:00:00'),(2971,'social','twitter','authorize',NULL,NULL,'0000-00-00 00:00:00'),(2972,'social','twitter','hello',NULL,NULL,'0000-00-00 00:00:00'),(2973,'social','twitter','disconnect',NULL,NULL,'0000-00-00 00:00:00'),(2974,'social','twitter','verified',NULL,NULL,'0000-00-00 00:00:00'),(2975,'social','facebook','sharecode',NULL,NULL,'0000-00-00 00:00:00'),(2976,'social','facebook','invite',NULL,NULL,'0000-00-00 00:00:00'),(2977,'sharing','mail','index',NULL,NULL,'0000-00-00 00:00:00'),(2978,'sharing','mail','share',NULL,NULL,'0000-00-00 00:00:00'),(2979,'sharing','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2980,'sharing','facebook','index',NULL,NULL,'0000-00-00 00:00:00'),(2981,'social','facebook','error',NULL,NULL,'0000-00-00 00:00:00'),(2982,'mobile','index','groupinvite',NULL,NULL,'0000-00-00 00:00:00'),(2983,'admin','users','affiliate',NULL,NULL,'0000-00-00 00:00:00'),(2984,'admin','index','scans',NULL,NULL,'0000-00-00 00:00:00'),(2985,'admin','index','usp',NULL,NULL,'0000-00-00 00:00:00'),(2986,'actions','index','search',NULL,NULL,'0000-00-00 00:00:00'),(2987,'actions','index','index',NULL,NULL,'0000-00-00 00:00:00'),(2988,'actions','index','list',NULL,NULL,'0000-00-00 00:00:00'),(2989,'actions','index','new',NULL,NULL,'0000-00-00 00:00:00'),(2990,'actions','index','edit',NULL,NULL,'0000-00-00 00:00:00'),(2991,'actions','index','delete',NULL,NULL,'0000-00-00 00:00:00'),(2992,'actions','index','attributeslist',NULL,NULL,'0000-00-00 00:00:00'),(2993,'actions','index','deleteattribute',NULL,NULL,'0000-00-00 00:00:00'),(2994,'actions','index','view',NULL,NULL,'0000-00-00 00:00:00'),(2995,'actions','index','widget',NULL,NULL,'0000-00-00 00:00:00'),(2996,'actions','index','uploadfile',NULL,NULL,'0000-00-00 00:00:00'),(3000,'invites','index','notify',NULL,NULL,'0000-00-00 00:00:00'),(3001,'login','index','activate',NULL,NULL,'0000-00-00 00:00:00'),(3005,'user','delete','index',NULL,NULL,'0000-00-00 00:00:00'),(3006,'actions','like','index',NULL,NULL,'0000-00-00 00:00:00'),(3007,'actions','reminder','index',NULL,NULL,'0000-00-00 00:00:00'),(3008,'actions','votes','index',NULL,NULL,'0000-00-00 00:00:00'),(3009,'actions','votes','votepreaction',NULL,NULL,'0000-00-00 00:00:00'),(3010,'user','userloginticket','index',NULL,NULL,'0000-00-00 00:00:00'),(3011,'api','mobile','index',NULL,NULL,'0000-00-00 00:00:00'),(3012,'api','mobile','get',NULL,NULL,'0000-00-00 00:00:00'),(3013,'api','mobile','post',NULL,NULL,'0000-00-00 00:00:00'),(3014,'api','mobile','put',NULL,NULL,'0000-00-00 00:00:00'),(3015,'api','mobile','delete',NULL,NULL,'0000-00-00 00:00:00'),(3016,'actions','index','noaction',NULL,NULL,'0000-00-00 00:00:00'),(3017,'comments','comment','index',NULL,NULL,'0000-00-00 00:00:00'),(3018,'admin','comments','index',NULL,NULL,'0000-00-00 00:00:00'),(3019,'admin','comments','list',NULL,NULL,'0000-00-00 00:00:00'),(3020,'admin','comments','search',NULL,NULL,'0000-00-00 00:00:00'),(3021,'admin','comments','new',NULL,NULL,'0000-00-00 00:00:00'),(3022,'admin','comments','delete',NULL,NULL,'0000-00-00 00:00:00'),(3023,'admin','actions','index',NULL,NULL,'0000-00-00 00:00:00'),(3024,'admin','api','index',NULL,NULL,'0000-00-00 00:00:00'),(3025,'admin','invites','index',NULL,NULL,'0000-00-00 00:00:00'),(3026,'admin','battles','index',NULL,NULL,'0000-00-00 00:00:00'),(3027,'admin','logobuilder','index',NULL,NULL,'0000-00-00 00:00:00'),(3028,'admin','mobile','index',NULL,NULL,'0000-00-00 00:00:00'),(3029,'admin','sharing','index',NULL,NULL,'0000-00-00 00:00:00'),(3030,'admin','social','index',NULL,NULL,'0000-00-00 00:00:00'),(3031,'admin','ranking','index',NULL,NULL,'0000-00-00 00:00:00'),(3033,'admin','userroles','index',NULL,NULL,'0000-00-00 00:00:00'),(3034,'admin','userroles','search',NULL,NULL,'0000-00-00 00:00:00'),(3035,'admin','userroles','list',NULL,NULL,'0000-00-00 00:00:00'),(3036,'admin','userroles','new',NULL,NULL,'0000-00-00 00:00:00'),(3037,'admin','userroles','edit',NULL,NULL,'0000-00-00 00:00:00'),(3038,'admin','userroles','delete',NULL,NULL,'0000-00-00 00:00:00'),(3039,'admin','resources','doctrine',NULL,NULL,'0000-00-00 00:00:00'),(3040,'maps','index','index',NULL,NULL,'0000-00-00 00:00:00'),(3041,'maps','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3042,'messages','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3043,'messages','ajax','autocomplete',NULL,NULL,'0000-00-00 00:00:00'),(3044,'admin','actions','list',NULL,NULL,'0000-00-00 00:00:00'),(3045,'admin','actions','new',NULL,NULL,'0000-00-00 00:00:00'),(3046,'admin','actions','edit',NULL,NULL,'0000-00-00 00:00:00'),(3047,'admin','actions','delete',NULL,NULL,'0000-00-00 00:00:00'),(3048,'barcode','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3049,'barcode','index','index',NULL,NULL,'0000-00-00 00:00:00'),(3050,'admin','actions','useractions',NULL,NULL,'0000-00-00 00:00:00'),(3051,'barcode','index','slider',NULL,NULL,'0000-00-00 00:00:00'),(3052,'admin','navigation','list',NULL,NULL,'0000-00-00 00:00:00'),(3053,'admin','navigation','new',NULL,NULL,'0000-00-00 00:00:00'),(3054,'admin','navigation','edit',NULL,NULL,'0000-00-00 00:00:00'),(3055,'admin','navigation','delete',NULL,NULL,'0000-00-00 00:00:00'),(3056,'admin','actions','listpilars',NULL,NULL,'0000-00-00 00:00:00'),(3057,'admin','actions','newpilar',NULL,NULL,'0000-00-00 00:00:00'),(3058,'admin','actions','editpilar',NULL,NULL,'0000-00-00 00:00:00'),(3059,'admin','actions','deletepilar',NULL,NULL,'0000-00-00 00:00:00'),(3060,'admin','navigation','index',NULL,NULL,'0000-00-00 00:00:00'),(3061,'navigation','index','index',NULL,NULL,'0000-00-00 00:00:00'),(3066,'admin','navigation','content',NULL,NULL,'0000-00-00 00:00:00'),(3067,'admin','navigation','uploadhandler',NULL,NULL,'0000-00-00 00:00:00'),(3068,'navigation','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3069,'admin','navigation','rank',NULL,NULL,'0000-00-00 00:00:00'),(3070,'admin','navigation','ajax',NULL,NULL,'0000-00-00 00:00:00'),(3071,'navigation','index','movie',NULL,NULL,'0000-00-00 00:00:00'),(3072,'admin','messages','edit',NULL,NULL,'0000-00-00 00:00:00'),(3073,'barcode','index','generate',NULL,NULL,'0000-00-00 00:00:00'),(3074,'navigation','index','barcode',NULL,NULL,'0000-00-00 00:00:00'),(3075,'admin','messages','ajax',NULL,NULL,'0000-00-00 00:00:00'),(3076,'maps','ajax','uploadhandler',NULL,NULL,'0000-00-00 00:00:00'),(3077,'maps','ajax','mailhandler',NULL,NULL,'0000-00-00 00:00:00'),(3078,'maps','ajax','handler',NULL,NULL,'0000-00-00 00:00:00'),(3079,'media','index','feed',NULL,NULL,'0000-00-00 00:00:00'),(3080,'media','index','rotator',NULL,NULL,'0000-00-00 00:00:00'),(3081,'comments','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3082,'route','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3083,'route','index','index',NULL,NULL,'0000-00-00 00:00:00'),(3084,'navigation','index','maquette',NULL,NULL,'0000-00-00 00:00:00'),(3085,'navigation','index','tablet',NULL,NULL,'0000-00-00 00:00:00'),(3086,'support','index','index',NULL,NULL,'0000-00-00 00:00:00'),(3087,'admin','support','index',NULL,NULL,'0000-00-00 00:00:00'),(3088,'admin','support','search',NULL,NULL,'0000-00-00 00:00:00'),(3089,'admin','support','list',NULL,NULL,'0000-00-00 00:00:00'),(3090,'admin','support','new',NULL,NULL,'0000-00-00 00:00:00'),(3091,'admin','support','edit',NULL,NULL,'0000-00-00 00:00:00'),(3092,'admin','support','delete',NULL,NULL,'0000-00-00 00:00:00'),(3093,'user','edit','avatar',NULL,NULL,'0000-00-00 00:00:00'),(3094,'admin','navigation','uploadhandlerclean',NULL,NULL,'0000-00-00 00:00:00'),(3095,'support','index','ajax',NULL,NULL,'0000-00-00 00:00:00'),(3096,'navigation','index','bird',NULL,NULL,'0000-00-00 00:00:00'),(3097,'navigation','bird','index',NULL,NULL,'0000-00-00 00:00:00'),(3106,'messages','index','widget',NULL,NULL,'0000-00-00 00:00:00'),(3107,'admin','actions','listpilarquestions',NULL,NULL,'0000-00-00 00:00:00'),(3108,'admin','actions','newpilarquestion',NULL,NULL,'0000-00-00 00:00:00'),(3109,'admin','actions','editpilarquestion',NULL,NULL,'0000-00-00 00:00:00'),(3110,'admin','actions','deletepilarquestion',NULL,NULL,'0000-00-00 00:00:00'),(3111,'ranking','index','stats',NULL,NULL,'0000-00-00 00:00:00'),(3112,'user','transactions','index',NULL,NULL,'0000-00-00 00:00:00'),(3113,'tasks','ajax','upload',NULL,NULL,'0000-00-00 00:00:00'),(3114,'tasks','ajax','delete',NULL,NULL,'0000-00-00 00:00:00'),(3115,'tasks','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3116,'tasks','index','view',NULL,NULL,'0000-00-00 00:00:00'),(3117,'tasks','index','none',NULL,NULL,'0000-00-00 00:00:00'),(3118,'tasks','index','validate',NULL,NULL,'0000-00-00 00:00:00'),(3119,'tasks','index','list',NULL,NULL,'0000-00-00 00:00:00'),(3120,'content','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3121,'user','transactions','widget',NULL,NULL,'0000-00-00 00:00:00'),(3123,'tasks','ajax','vote',NULL,NULL,'0000-00-00 00:00:00'),(3124,'actions','test','index',NULL,NULL,'0000-00-00 00:00:00'),(3125,'actions','test','list',NULL,NULL,'0000-00-00 00:00:00'),(3126,'actions','test','new',NULL,NULL,'0000-00-00 00:00:00'),(3127,'actions','test','edit',NULL,NULL,'0000-00-00 00:00:00'),(3128,'actions','test','view',NULL,NULL,'0000-00-00 00:00:00'),(3129,'user','profile','upload',NULL,NULL,'0000-00-00 00:00:00'),(3132,'user','profile','image',NULL,NULL,'0000-00-00 00:00:00'),(3133,'admin','actions','listpilarssets',NULL,NULL,'0000-00-00 00:00:00'),(3134,'admin','actions','newpilarsset',NULL,NULL,'0000-00-00 00:00:00'),(3135,'admin','actions','editpilarsset',NULL,NULL,'0000-00-00 00:00:00'),(3136,'admin','actions','deletepilarsset',NULL,NULL,'0000-00-00 00:00:00'),(3139,'admin','actions','listcategories',NULL,NULL,'0000-00-00 00:00:00'),(3140,'admin','actions','newcategory',NULL,NULL,'0000-00-00 00:00:00'),(3141,'admin','actions','editcategory',NULL,NULL,'0000-00-00 00:00:00'),(3142,'admin','actions','deletecategory',NULL,NULL,'0000-00-00 00:00:00'),(3143,'actions','index','dashboard',NULL,NULL,'0000-00-00 00:00:00'),(3144,'messages','index','updatewidget',NULL,NULL,'0000-00-00 00:00:00'),(3145,'actions','index','review',NULL,NULL,'0000-00-00 00:00:00'),(3146,'actions','index','friendsnotified',NULL,NULL,'0000-00-00 00:00:00'),(3147,'actions','index','friendslogin',NULL,NULL,'0000-00-00 00:00:00'),(3148,'comments','index','view',NULL,NULL,'0000-00-00 00:00:00'),(3150,'leads','index','edit',NULL,NULL,'0000-00-00 00:00:00'),(3151,'admin','stats','grouplist',NULL,NULL,'0000-00-00 00:00:00'),(3152,'admin','stats','ajax',NULL,NULL,'0000-00-00 00:00:00'),(3153,'leads','admin','index',NULL,NULL,'0000-00-00 00:00:00'),(3154,'default','ajax','upload',NULL,NULL,'0000-00-00 00:00:00'),(3157,'default','ajax','mail',NULL,NULL,'0000-00-00 00:00:00'),(3158,'leads','index','stats',NULL,NULL,'0000-00-00 00:00:00'),(3159,'leads','index','regio',NULL,NULL,'0000-00-00 00:00:00'),(3160,'leads','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3162,'leads','ajax','get',NULL,NULL,'0000-00-00 00:00:00'),(3163,'user','widget','small',NULL,NULL,'0000-00-00 00:00:00'),(3164,'user','widget','large',NULL,NULL,'0000-00-00 00:00:00'),(3165,'user','widget','level',NULL,NULL,'0000-00-00 00:00:00'),(3166,'battles','widget','index',NULL,NULL,'0000-00-00 00:00:00'),(3167,'battles','widget','nemesis',NULL,NULL,'0000-00-00 00:00:00'),(3168,'ranking','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3169,'admin','ranking','search',NULL,NULL,'0000-00-00 00:00:00'),(3170,'admin','ranking','list',NULL,NULL,'0000-00-00 00:00:00'),(3171,'admin','ranking','new',NULL,NULL,'0000-00-00 00:00:00'),(3172,'admin','ranking','edit',NULL,NULL,'0000-00-00 00:00:00'),(3173,'admin','ranking','delete',NULL,NULL,'0000-00-00 00:00:00'),(3174,'battles','index','fight',NULL,NULL,'0000-00-00 00:00:00'),(3175,'battles','index','result',NULL,NULL,'0000-00-00 00:00:00'),(3176,'battles','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3177,'battles','ajax','invite',NULL,NULL,'0000-00-00 00:00:00'),(3178,'battles','fight','start',NULL,NULL,'0000-00-00 00:00:00'),(3179,'battles','fight','play',NULL,NULL,'0000-00-00 00:00:00'),(3180,'battles','fight','result',NULL,NULL,'0000-00-00 00:00:00'),(3181,'battles','widget','battles',NULL,NULL,'0000-00-00 00:00:00'),(3182,'ranking','error','error',NULL,NULL,'0000-00-00 00:00:00'),(3183,'ranking','error','denied',NULL,NULL,'0000-00-00 00:00:00'),(3184,'battles','ajax','getusers',NULL,NULL,'0000-00-00 00:00:00'),(3185,'quiz','ajax','index',NULL,NULL,'0000-00-00 00:00:00'),(3186,'battles','ajax','process',NULL,NULL,'0000-00-00 00:00:00'),(3187,'admin','battles','list',NULL,NULL,'0000-00-00 00:00:00'),(3188,'admin','battles','result',NULL,NULL,'0000-00-00 00:00:00'),(3189,'api','store','index',NULL,NULL,'0000-00-00 00:00:00'),(3190,'admin','battles','edit',NULL,NULL,'0000-00-00 00:00:00'),(3191,'admin','battles','delete',NULL,NULL,'0000-00-00 00:00:00'),(3192,'admin','messages','read',NULL,NULL,'0000-00-00 00:00:00'),(3193,'admin','quizes','searchquestion',NULL,NULL,'0000-00-00 00:00:00'),(3194,'admin','quizes','searchanswers',NULL,NULL,'0000-00-00 00:00:00'),(3195,'api','store','export',NULL,NULL,'0000-00-00 00:00:00'),(3196,'api','store','qty',NULL,NULL,'0000-00-00 00:00:00'),(3197,'api','store','customers',NULL,NULL,'0000-00-00 00:00:00'),(3198,'api','store','clean',NULL,NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_has_user_roles`
--

DROP TABLE IF EXISTS `resources_has_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_has_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resources_id` int(11) NOT NULL,
  `user_roles_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resources_has_user_roles_resources1` (`resources_id`) USING BTREE,
  KEY `fk_resources_has_user_roles_user_roles1` (`user_roles_id`) USING BTREE,
  CONSTRAINT `resources_has_user_roles_ibfk_1` FOREIGN KEY (`resources_id`) REFERENCES `resources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `resources_has_user_roles_ibfk_2` FOREIGN KEY (`user_roles_id`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4677 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_has_user_roles`
--

LOCK TABLES `resources_has_user_roles` WRITE;
/*!40000 ALTER TABLE `resources_has_user_roles` DISABLE KEYS */;
INSERT INTO `resources_has_user_roles` VALUES (3229,2590,6),(3233,2594,1),(3252,2613,1),(3259,2620,6),(3270,2631,1),(3272,2633,6),(3273,2634,6),(3274,2635,6),(3275,2636,6),(3284,2645,6),(3287,2648,1),(3289,2650,1),(3291,2652,1),(3292,2653,1),(3295,2656,6),(3297,2658,1),(3303,2664,6),(3306,2667,6),(3307,2668,6),(3308,2669,1),(3311,2672,1),(3312,2673,6),(3314,2675,1),(3315,2676,1),(3316,2677,1),(3327,2688,1),(3328,2689,6),(3329,2690,6),(3331,2692,6),(3332,2693,1),(3333,2694,1),(3334,2695,6),(3335,2696,1),(3336,2697,1),(3337,2698,1),(3338,2699,1),(3339,2700,1),(3340,2701,1),(3341,2702,1),(3342,2703,1),(3347,2708,1),(3348,2709,6),(3349,2710,1),(3350,2711,6),(3351,2712,6),(3352,2713,6),(3353,2714,1),(3354,2715,1),(3355,2716,4),(3356,2717,4),(3357,2718,4),(3358,2719,4),(3359,2720,4),(3360,2721,4),(3361,2722,4),(3362,2723,4),(3363,2724,4),(3364,2725,4),(3365,2726,6),(3366,2727,6),(3367,2728,6),(3368,2729,6),(3369,2730,6),(3370,2731,6),(3371,2732,6),(3372,2733,6),(3373,2734,6),(3374,2735,6),(3375,2736,4),(3376,2737,4),(3377,2738,4),(3378,2739,4),(3379,2740,4),(3380,2741,4),(3381,2742,4),(3382,2743,4),(3383,2744,4),(3384,2745,4),(3385,2746,4),(3386,2747,4),(3387,2748,4),(3388,2749,4),(3389,2750,4),(3390,2751,4),(3391,2752,4),(3392,2753,4),(3393,2754,4),(3394,2755,4),(3395,2756,4),(3396,2757,4),(3397,2758,4),(3398,2759,4),(3399,2760,4),(3400,2761,4),(3401,2762,4),(3402,2763,4),(3403,2764,4),(3404,2765,4),(3405,2766,4),(3406,2767,4),(3407,2768,4),(3408,2769,4),(3409,2770,4),(3410,2771,4),(3411,2772,4),(3412,2773,4),(3413,2774,4),(3414,2775,4),(3415,2776,4),(3416,2777,4),(3417,2778,4),(3418,2779,4),(3419,2780,4),(3420,2781,4),(3421,2782,4),(3422,2783,4),(3423,2784,4),(3424,2785,4),(3425,2786,4),(3426,2787,4),(3427,2788,4),(3428,2789,4),(3429,2790,4),(3430,2791,4),(3431,2792,4),(3432,2793,4),(3433,2794,4),(3434,2795,4),(3435,2796,4),(3436,2797,4),(3437,2798,4),(3438,2799,4),(3439,2800,4),(3440,2801,4),(3441,2802,4),(3442,2803,4),(3443,2804,4),(3444,2805,4),(3445,2806,4),(3446,2807,4),(3447,2808,4),(3448,2809,4),(3449,2810,4),(3450,2811,4),(3451,2812,4),(3452,2813,4),(3453,2814,4),(3454,2815,4),(3455,2816,4),(3456,2817,4),(3457,2818,4),(3458,2819,4),(3459,2820,4),(3460,2821,4),(3461,2822,4),(3462,2823,4),(3463,2824,4),(3464,2825,4),(3465,2826,4),(3466,2827,4),(3467,2828,4),(3468,2829,4),(3469,2830,4),(3470,2831,4),(3471,2832,4),(3472,2833,4),(3473,2834,4),(3474,2835,4),(3475,2836,4),(3476,2837,4),(3477,2838,4),(3478,2839,4),(3479,2840,4),(3480,2841,4),(3481,2842,4),(3482,2843,4),(3483,2844,4),(3484,2845,4),(3485,2846,4),(3486,2847,4),(3487,2848,4),(3488,2849,4),(3489,2850,4),(3490,2851,4),(3491,2852,4),(3492,2853,4),(3493,2854,4),(3494,2855,4),(3495,2856,4),(3496,2857,4),(3497,2858,4),(3498,2859,4),(3499,2860,4),(3500,2861,4),(3501,2862,4),(3502,2863,4),(3503,2864,4),(3504,2865,4),(3505,2866,4),(3506,2867,4),(3507,2868,4),(3508,2869,4),(3509,2870,4),(3510,2871,4),(3511,2872,4),(3512,2873,4),(3513,2874,4),(3514,2875,4),(3515,2876,4),(3516,2877,6),(3517,2878,4),(3518,2879,4),(3519,2880,4),(3525,2886,4),(3527,2888,6),(3528,2889,6),(3532,2893,4),(3536,2897,4),(3537,2898,4),(3538,2899,4),(3539,2900,4),(3540,2901,4),(3542,2884,4),(3543,2885,4),(3545,2892,4),(3547,2894,4),(3548,2895,4),(3550,2887,6),(3553,2890,6),(3555,2709,1),(3556,2711,6),(3557,2712,6),(3558,2714,1),(3559,2715,1),(3560,2713,6),(3561,2710,1),(3562,2701,1),(3563,2697,1),(3564,2695,6),(3565,2694,1),(3566,2703,1),(3567,2699,1),(3568,2696,1),(3569,2702,1),(3570,2698,1),(3571,2700,1),(3573,2689,6),(3574,2690,6),(3575,2693,1),(3576,2692,6),(3579,2708,1),(3583,2621,1),(3586,2619,6),(3605,2688,1),(3613,2660,6),(3619,2666,6),(3620,2663,6),(3622,2668,6),(3623,2667,6),(3627,2630,1),(3642,2639,6),(3643,2640,6),(3645,2642,6),(3646,2643,6),(3669,2651,1),(3672,2647,6),(3675,2657,6),(3676,2646,1),(3677,2655,1),(3682,2677,1),(3683,2676,1),(3684,2673,1),(3686,2669,1),(3687,2672,1),(3689,2693,1),(3692,2708,1),(3698,2618,6),(3705,2598,6),(3706,2601,1),(3710,2599,6),(3718,2688,1),(3723,2659,6),(3725,2662,6),(3727,2588,6),(3729,2592,6),(3730,2589,6),(3731,2591,6),(3735,2668,6),(3736,2667,6),(3737,2665,6),(3745,2881,6),(3746,2883,6),(3748,2905,6),(3755,2638,6),(3758,2641,6),(3764,2610,6),(3780,2649,1),(3788,2644,6),(3796,2677,1),(3797,2676,1),(3798,2673,1),(3800,2669,1),(3801,2672,1),(3809,2896,4),(3814,2891,6),(3815,2709,1),(3816,2711,6),(3817,2712,6),(3818,2714,1),(3819,2715,1),(3820,2713,6),(3821,2710,1),(3822,2701,1),(3823,2697,1),(3824,2695,6),(3825,2694,1),(3826,2703,1),(3827,2699,1),(3828,2696,1),(3829,2702,1),(3830,2698,1),(3831,2700,1),(3833,2689,6),(3834,2690,6),(3835,2693,1),(3836,2692,6),(3839,2708,1),(3842,2622,1),(3844,2623,6),(3848,2624,6),(3854,2595,1),(3856,2600,1),(3865,2688,1),(3871,2661,6),(3882,2668,6),(3883,2667,6),(3899,2637,6),(3924,2632,6),(3929,2654,1),(3943,2677,1),(3944,2676,1),(3945,2673,6),(3947,2669,1),(3948,2672,1),(3949,2882,6),(3950,2904,6),(3951,2931,6),(3952,2932,1),(3953,2935,1),(3954,2936,1),(3955,2938,6),(3956,2939,1),(3957,2940,1),(3958,2941,1),(3959,2933,6),(3960,2934,6),(3961,2937,6),(3963,2943,6),(3964,2944,6),(3965,2945,6),(3966,2946,6),(3967,2947,6),(3968,2948,6),(3979,2959,6),(3980,2960,6),(3981,2962,1),(3982,2963,6),(3983,2961,6),(3984,2964,1),(3988,2906,4),(3989,2908,4),(3990,2909,4),(3991,2910,4),(3992,2911,4),(3993,2914,4),(3994,2915,4),(3995,2916,4),(3996,2917,4),(3997,2918,4),(3998,2919,4),(3999,2920,4),(4000,2921,4),(4001,2922,4),(4002,2923,4),(4003,2924,4),(4004,2925,4),(4005,2926,4),(4006,2927,4),(4007,2928,4),(4008,2929,4),(4009,2966,4),(4010,2967,4),(4012,2969,1),(4013,2970,1),(4014,2971,1),(4015,2972,1),(4016,2973,1),(4017,2974,1),(4018,2975,1),(4019,2976,1),(4020,2977,1),(4021,2978,1),(4022,2979,1),(4023,2980,1),(4024,2981,1),(4025,2982,6),(4026,2983,6),(4027,2984,6),(4028,2985,6),(4029,2986,1),(4030,2987,1),(4031,2988,1),(4032,2989,1),(4033,2990,1),(4034,2991,1),(4035,2992,1),(4036,2993,1),(4037,2994,1),(4038,2995,1),(4039,2996,6),(4043,3000,1),(4044,3001,6),(4048,3005,4),(4049,3006,1),(4050,3007,6),(4051,3008,1),(4052,3009,1),(4053,3010,6),(4054,3011,6),(4055,3012,6),(4056,3013,6),(4057,3014,6),(4058,3015,6),(4059,3016,1),(4060,3017,1),(4061,3018,4),(4062,3019,4),(4063,3020,4),(4064,3021,4),(4065,3022,4),(4066,3023,4),(4067,3024,6),(4068,3025,6),(4069,3026,4),(4070,3027,6),(4071,3028,6),(4072,3029,6),(4073,3030,6),(4074,3031,6),(4076,3033,4),(4077,3034,4),(4078,3035,4),(4079,3036,4),(4080,3037,4),(4081,3038,4),(4082,3039,6),(4083,3040,6),(4084,3041,6),(4085,3042,6),(4086,3043,6),(4087,2588,1),(4088,2589,1),(4089,2590,1),(4090,2591,1),(4091,2592,1),(4093,2594,1),(4094,2595,1),(4096,2598,1),(4097,2599,1),(4098,2600,1),(4099,2601,1),(4108,2610,1),(4111,2613,1),(4116,2618,1),(4117,2619,1),(4118,2620,1),(4119,2621,1),(4120,2622,1),(4121,2623,1),(4122,2624,1),(4123,2630,1),(4124,2631,1),(4125,2632,1),(4126,2633,1),(4127,2634,1),(4128,2635,1),(4129,2636,1),(4130,2637,1),(4131,2638,1),(4132,2639,1),(4133,2640,1),(4134,2641,1),(4135,2642,1),(4136,2643,1),(4137,2644,1),(4138,2645,1),(4139,2646,1),(4140,2647,1),(4141,2648,1),(4142,2649,1),(4143,2650,1),(4144,2651,1),(4145,2652,1),(4146,2653,1),(4147,2654,1),(4148,2655,1),(4149,2656,1),(4150,2657,1),(4151,2658,1),(4152,2659,1),(4153,2660,1),(4154,2661,1),(4155,2662,1),(4156,2663,1),(4157,2664,1),(4158,2665,1),(4159,2666,1),(4160,2667,1),(4161,2668,1),(4162,2669,1),(4165,2672,1),(4166,2673,1),(4168,2675,1),(4169,2676,1),(4170,2677,1),(4181,2688,1),(4182,2689,1),(4183,2690,1),(4184,2692,1),(4185,2693,1),(4186,2694,1),(4187,2695,1),(4188,2696,1),(4189,2697,1),(4190,2698,1),(4191,2699,1),(4192,2700,1),(4193,2701,1),(4194,2702,1),(4195,2703,1),(4200,2708,1),(4201,2709,1),(4202,2710,1),(4203,2711,1),(4204,2712,1),(4205,2713,1),(4206,2714,1),(4207,2715,1),(4208,2716,4),(4209,2717,4),(4210,2718,4),(4211,2719,4),(4212,2720,4),(4213,2721,4),(4214,2722,4),(4215,2723,4),(4216,2724,4),(4217,2725,4),(4218,2726,4),(4219,2727,4),(4220,2728,4),(4221,2729,4),(4222,2730,4),(4223,2731,4),(4224,2732,4),(4225,2733,4),(4226,2734,4),(4227,2735,4),(4228,2736,4),(4229,2737,4),(4230,2738,4),(4231,2739,4),(4232,2740,4),(4233,2741,4),(4234,2742,4),(4235,2743,4),(4236,2744,4),(4237,2745,4),(4238,2746,4),(4239,2747,4),(4240,2748,4),(4241,2749,4),(4242,2750,4),(4243,2751,4),(4244,2752,4),(4245,2753,4),(4246,2754,4),(4247,2755,4),(4248,2756,4),(4249,2757,4),(4250,2758,4),(4251,2759,4),(4252,2760,4),(4253,2761,4),(4254,2762,4),(4255,2763,4),(4256,2764,4),(4257,2765,4),(4258,2766,4),(4259,2767,4),(4260,2768,4),(4261,2769,4),(4262,2770,4),(4263,2771,4),(4264,2772,4),(4265,2773,4),(4266,2774,4),(4267,2775,4),(4268,2776,4),(4269,2777,4),(4270,2778,4),(4271,2779,4),(4272,2780,4),(4273,2781,4),(4274,2782,4),(4275,2783,4),(4276,2784,4),(4277,2785,4),(4278,2786,4),(4279,2787,4),(4280,2788,4),(4281,2789,4),(4282,2790,4),(4283,2791,4),(4284,2792,4),(4285,2793,4),(4286,2794,4),(4287,2795,4),(4288,2796,4),(4289,2797,4),(4290,2798,4),(4291,2799,4),(4292,2800,4),(4293,2801,4),(4294,2802,4),(4295,2803,4),(4296,2804,4),(4297,2805,4),(4298,2806,4),(4299,2807,4),(4300,2808,4),(4301,2809,4),(4302,2810,4),(4303,2811,4),(4304,2812,4),(4305,2813,4),(4306,2814,4),(4307,2815,4),(4308,2816,4),(4309,2817,4),(4310,2818,4),(4311,2819,4),(4312,2820,4),(4313,2821,4),(4314,2822,4),(4315,2823,4),(4316,2824,4),(4317,2825,4),(4318,2826,4),(4319,2827,4),(4320,2828,4),(4321,2829,4),(4322,2830,4),(4323,2831,4),(4324,2832,4),(4325,2833,4),(4326,2834,4),(4327,2835,4),(4328,2836,4),(4329,2837,4),(4330,2838,4),(4331,2839,4),(4332,2840,4),(4333,2841,4),(4334,2842,4),(4335,2843,4),(4336,2844,4),(4337,2845,4),(4338,2846,4),(4339,2847,4),(4340,2848,4),(4341,2849,4),(4342,2850,4),(4343,2851,4),(4344,2852,4),(4345,2853,4),(4346,2854,4),(4347,2855,4),(4348,2856,4),(4349,2857,4),(4350,2858,4),(4351,2859,4),(4352,2860,4),(4353,2861,4),(4354,2862,4),(4355,2863,4),(4356,2864,4),(4357,2865,4),(4358,2866,4),(4359,2867,4),(4360,2868,4),(4361,2869,4),(4362,2870,4),(4363,2871,4),(4364,2872,4),(4365,2873,4),(4366,2874,4),(4367,2875,4),(4368,2876,4),(4369,2877,6),(4370,2878,4),(4371,2879,4),(4372,2880,4),(4373,2881,1),(4374,2882,1),(4375,2883,1),(4376,2884,1),(4377,2885,1),(4378,2886,1),(4379,2887,1),(4380,2888,1),(4381,2889,1),(4382,2890,1),(4383,2891,1),(4384,2892,1),(4385,2893,1),(4386,2894,1),(4387,2895,1),(4388,2896,1),(4389,2897,4),(4390,2898,4),(4391,2899,4),(4392,2900,4),(4393,2901,4),(4394,2904,1),(4395,2905,1),(4396,2906,4),(4397,2908,4),(4398,2909,4),(4399,2910,4),(4400,2911,4),(4401,2914,4),(4402,2915,4),(4403,2916,4),(4404,2917,4),(4405,2918,4),(4406,2919,4),(4407,2920,4),(4408,2921,4),(4409,2922,4),(4410,2923,4),(4411,2924,4),(4412,2925,4),(4413,2926,4),(4414,2927,4),(4415,2928,4),(4416,2929,4),(4417,2931,1),(4418,2932,1),(4419,2933,1),(4420,2934,1),(4421,2935,1),(4422,2936,1),(4423,2937,1),(4424,2938,1),(4425,2939,1),(4426,2940,1),(4427,2941,1),(4428,2943,1),(4429,2944,1),(4430,2945,1),(4431,2946,1),(4432,2947,1),(4433,2948,1),(4444,2959,1),(4445,2960,1),(4446,2961,1),(4447,2962,1),(4448,2963,1),(4449,2964,1),(4450,2966,4),(4451,2967,4),(4453,2969,1),(4454,2970,1),(4455,2971,1),(4456,2972,1),(4457,2973,1),(4458,2974,1),(4459,2975,1),(4460,2976,1),(4461,2977,1),(4462,2978,1),(4463,2979,1),(4464,2980,1),(4465,2981,1),(4466,2982,1),(4467,2983,4),(4468,2984,4),(4469,2985,4),(4470,2986,1),(4471,2987,1),(4472,2988,1),(4473,2989,1),(4474,2990,1),(4475,2991,1),(4476,2992,1),(4477,2993,1),(4478,2994,1),(4479,2995,1),(4480,2996,1),(4481,3000,1),(4482,3001,1),(4483,3005,1),(4484,3006,1),(4485,3007,1),(4486,3008,1),(4487,3009,1),(4488,3010,1),(4489,3011,1),(4490,3012,1),(4491,3013,1),(4492,3014,1),(4493,3015,1),(4494,3016,1),(4495,3017,1),(4496,3018,4),(4497,3019,4),(4498,3020,4),(4499,3021,4),(4500,3022,4),(4501,3023,4),(4502,3024,4),(4503,3025,4),(4504,3026,4),(4505,3027,4),(4506,3028,4),(4507,3029,4),(4508,3030,4),(4509,3031,4),(4511,3033,4),(4512,3034,4),(4513,3035,4),(4514,3036,4),(4515,3037,4),(4516,3038,4),(4517,3039,4),(4518,3040,1),(4519,3041,1),(4520,3042,1),(4521,3043,1),(4522,3044,4),(4523,3045,4),(4524,3046,4),(4525,3047,4),(4526,3048,6),(4527,3049,6),(4528,3050,4),(4529,3051,6),(4530,3052,4),(4531,3053,4),(4532,3054,4),(4533,3055,4),(4534,3056,4),(4535,3057,4),(4536,3058,4),(4537,3059,4),(4538,3060,4),(4539,3061,6),(4544,3066,4),(4545,3067,6),(4546,3068,6),(4547,3069,4),(4548,3070,6),(4549,3071,6),(4550,3072,4),(4551,3073,6),(4552,3074,6),(4553,3075,6),(4554,3076,6),(4555,3077,6),(4556,3078,6),(4557,3079,6),(4558,3080,6),(4559,3081,1),(4560,3082,6),(4561,3083,6),(4562,3084,6),(4563,3085,6),(4564,3086,6),(4565,3087,4),(4566,3088,4),(4567,3089,4),(4568,3090,4),(4569,3091,4),(4570,3092,4),(4571,3093,4),(4572,3094,6),(4573,3095,6),(4574,3096,6),(4575,3097,6),(4584,3106,1),(4585,3107,4),(4586,3108,4),(4587,3109,4),(4588,3110,4),(4589,3111,1),(4590,3112,1),(4591,3113,6),(4592,3114,6),(4593,3115,6),(4594,3116,1),(4595,3117,1),(4596,3118,1),(4597,3119,1),(4598,3120,6),(4599,3121,1),(4601,3123,1),(4602,3124,1),(4603,3125,1),(4604,3126,1),(4605,3127,1),(4606,3128,1),(4607,3129,6),(4610,3132,6),(4611,3133,4),(4612,3134,4),(4613,3135,4),(4614,3136,4),(4617,3139,4),(4618,3140,4),(4619,3141,4),(4620,3142,4),(4621,3143,1),(4622,3144,6),(4623,3145,6),(4624,3146,1),(4625,3147,6),(4626,3148,1),(4628,3150,1),(4629,3151,6),(4630,3152,6),(4631,3153,2),(4632,3154,6),(4635,3157,6),(4636,3158,1),(4637,3159,1),(4638,3160,6),(4640,3162,1),(4641,3163,1),(4642,3164,1),(4643,3165,1),(4644,3166,1),(4645,3167,1),(4646,3168,6),(4647,3169,6),(4648,3170,6),(4649,3171,6),(4650,3172,6),(4651,3173,6),(4652,3174,1),(4653,3175,1),(4654,3176,6),(4655,3177,6),(4656,3178,1),(4657,3179,1),(4658,3180,1),(4659,3181,1),(4660,3182,1),(4661,3183,1),(4662,3184,6),(4663,3185,6),(4664,3186,1),(4665,3187,4),(4666,3188,4),(4667,3189,1),(4668,3190,4),(4669,3191,4),(4670,3192,4),(4671,3193,6),(4672,3194,6),(4673,3195,1),(4674,3196,1),(4675,3197,1),(4676,3198,1);
/*!40000 ALTER TABLE `resources_has_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources_modules`
--

DROP TABLE IF EXISTS `resources_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) DEFAULT NULL,
  `publish` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources_modules`
--

LOCK TABLES `resources_modules` WRITE;
/*!40000 ALTER TABLE `resources_modules` DISABLE KEYS */;
INSERT INTO `resources_modules` VALUES (49,'actions',0),(50,'admin',1),(51,'api',0),(52,'avatar',0),(53,'battles',0),(54,'comments',0),(55,'content',0),(56,'default',1),(57,'group',0),(58,'invites',0),(59,'leads',0),(60,'login',1),(61,'logobuilder',0),(62,'media',0),(63,'messages',0),(64,'mobile',0),(65,'poll',0),(66,'qrcode',0),(67,'quiz',1),(68,'ranking',0),(69,'sharing',0),(70,'social',0),(71,'tasks',0),(72,'user',0),(73,'maps',0),(74,'barcode',0),(75,'navigation',0),(76,'route',0),(77,'support',0);
/*!40000 ALTER TABLE `resources_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `settings` text,
  `settings_applications_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_settings_settings_applications1` (`settings_applications_id`),
  CONSTRAINT `fk_settings_settings_applications1` FOREIGN KEY (`settings_applications_id`) REFERENCES `settings_applications` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_applications`
--

DROP TABLE IF EXISTS `settings_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_applications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `form` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_applications`
--

LOCK TABLES `settings_applications` WRITE;
/*!40000 ALTER TABLE `settings_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_facebook`
--

DROP TABLE IF EXISTS `social_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_facebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) DEFAULT NULL,
  `fb_user_id` bigint(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hometown` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` set('male','female','unknown') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` int(11) DEFAULT NULL,
  `locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_facebook`
--

LOCK TABLES `social_facebook` WRITE;
/*!40000 ALTER TABLE `social_facebook` DISABLE KEYS */;
INSERT INTO `social_facebook` VALUES (122,'265',745235923,'Thierry Rol','Thierry','Rol','http://www.facebook.com/thierryrol','thierryrol',NULL,'Wormerveer','Wormerveer','male',2,'en_US',1,'2011-09-12 00:14:47',NULL,'AQCh-0yHr1T0VzrmI2d4matHRm5bxosMw2vzfOxbRn5uCziSDeNJ0yxcRcSpiZHFnhGregSQoOvH9BpG7X_bmo_TLRIucbPdRQgj73T4Kh2npWr5WDI_D-yEXEUYExov9uD43nehcv_KPxKfvdXC3cSR1MiJE7kTPgL4RGIROlyGYUgPj1u8sCIi_U6wAWd9zpo','AAAC1Os0VYj4BAAGbPc4vhCd7p6MXKrnfoonfxLM5nHJ6j0V95YwKQYOCSKi5b3TVPcyDZCdS0c6VUXQ9WjmmNoQff094ZD',NULL),(123,'268',100001000970661,'Annelotte Swart','Annelotte','Swart','http://www.facebook.com/lotte.swart','lotte.swart',NULL,'Leeuwarden, friesland','Bergum','female',2,'nl_NL',1,'2011-09-12 00:16:19',NULL,'AQBuMj0Igwgl_AULAuUZ8I5z1pNFpq2kv5GKA6FQ157_kTRnCFtwK4uSoGs5_OU06AJWqbN2h7CH7H2C_s1cZVO7Ddlp5z_35YcTz_3rej3wOPEGX3ExihVSAZtJFh6wgnP-g3SRWcxnRZ632dEqpZkNR7w-UbaziP36tjVE_iT6Cv9vS-OEeuXu3klATWbZRB4',NULL,NULL),(124,'264',836734910,'Andre Snijder','Andre','Snijder','http://www.facebook.com/andresnijder','andresnijder',NULL,'Amsterdam, Netherlands','Amsterdam, Netherlands','male',2,'nl_NL',1,'2011-09-12 00:18:53',NULL,'AQCTj1SfVWVLRCqnAQK18mQ6lFFIxcJrLZXRV5EonV0n6cQL_vtWeqTzPEc-Qo1aGHWdGT5Ww0Ol9fodtS3nfHl_Xmx0DgPf2wkLYQz7VFT_H1lPFQnoyEbsSCafqx0nu8XigilpaIwTKR_LNDBs7aqnhwsIq0xzioSr4MWqidEeclet_g9mMQcwaAnXmnVic28','AAAC1Os0VYj4BAAhY7d45EvIrvdJweI7ZBBxLoLmFnyAVi4rQSnxdXSlXqoS4VIjEiNflQ2aSanjQZA2XFZCwh7zKJE0jmIZD',NULL);
/*!40000 ALTER TABLE `social_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_hyves`
--

DROP TABLE IF EXISTS `social_hyves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_hyves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_hyves`
--

LOCK TABLES `social_hyves` WRITE;
/*!40000 ALTER TABLE `social_hyves` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_hyves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_twitter`
--

DROP TABLE IF EXISTS `social_twitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_twitter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `user_token` varchar(255) DEFAULT NULL,
  `user_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_twitter`
--

LOCK TABLES `social_twitter` WRITE;
/*!40000 ALTER TABLE `social_twitter` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_twitter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support`
--

DROP TABLE IF EXISTS `support`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `description` text,
  `title` varchar(255) DEFAULT NULL,
  `support_data` text,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support`
--

LOCK TABLES `support` WRITE;
/*!40000 ALTER TABLE `support` DISABLE KEYS */;
/*!40000 ALTER TABLE `support` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `file` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tasks_file` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `user_channels_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_user1` (`user_id`),
  KEY `fk_tasks_user_channels1` (`user_channels_id`),
  CONSTRAINT `fk_tasks_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_user_channels1` FOREIGN KEY (`user_channels_id`) REFERENCES `user_channels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'Tomato supplier employees of Shivakalee workers','During the last three days Ahold suffered from serious negative publicity on USA news networks. Ahold is accused of severely underpaying workers that are employed by companies that supply Ahold daughters Stop&amp;Drop, BigOne, Peter&rsquo;s and PennyPod in Louisiana&rsquo;s Shivakalee county. They depict Ahold as being facilitators of &lsquo;modern slavery&rsquo;. Ahold is presented as the sole buyer of tomatoes that is not prepared to offer an extra penny per pound for workers that suffer from deplorable circumstances.','/images-db/upload/tasks/Ahold Ceo video Kickoff .mp4','/images-db/upload/tasks/challenge.jpg','/images-db/upload/tasks/Ahold_Brahman_Challenge_RP_270212.pdf','2011-06-10 10:50:20',40,1,1,'2012-03-14 16:39:13');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL COMMENT '	',
  `action` varchar(255) DEFAULT NULL,
  `text` text,
  `date` datetime DEFAULT NULL,
  `language_code` varchar(45) DEFAULT NULL,
  `var_value` varchar(45) DEFAULT NULL,
  `var_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `geslacht` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `voornaam` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `voorletters` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tussenvoegsel` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `achternaam` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dob` datetime NOT NULL,
  `user_ticket` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private_user_ticket` varchar(32) NOT NULL,
  `adres` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `adres_nr` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `adres_nr_add` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plaats` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile_payment` varchar(255) NOT NULL,
  `mobile_provider` varchar(255) NOT NULL,
  `mobile_provider_expire` datetime NOT NULL,
  `telephone` varchar(255) NOT NULL,
  `telephone_brand` varchar(255) DEFAULT NULL,
  `device_os` varchar(255) DEFAULT NULL,
  `device_os_version` varchar(255) DEFAULT NULL,
  `telephone_features` text,
  `pin` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `expertise` varchar(255) DEFAULT NULL,
  `function` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `activate_link` text,
  `newsletter` int(1) DEFAULT '0',
  `user_roles_id` int(11) NOT NULL,
  `user_levels_id` int(11) DEFAULT NULL,
  `alt_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_groups` (`group_id`),
  KEY `fk_user_user_roles` (`user_roles_id`),
  KEY `fk_user_user_levels1` (`user_levels_id`),
  CONSTRAINT `fk_user_user_groups` FOREIGN KEY (`group_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_levels1` FOREIGN KEY (`user_levels_id`) REFERENCES `user_levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_user_roles` FOREIGN KEY (`user_roles_id`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','3e2bd62b32f3aca0e39ec93a47777ddf','','',200000,'m','Museum','','','Boerhave','v.bunjes@wedoweb.nl','1912-01-01 00:00:00','21232f297a57a5a743894a0e22801faa','21232f297a57a5a715794a066a8012aa','Hotentotenstraat','1','a','9999XY','Hotemetotententententoonstelling','','','','0000-00-00 00:00:00','',NULL,NULL,NULL,NULL,NULL,'/images-db/upload/useravatar/c7e7004bfbfbd9497e998863b34b3d85.png',1,NULL,'',NULL,NULL,0,4,8,'');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_actions`
--

DROP TABLE IF EXISTS `user_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `belofte` text,
  `datum` date DEFAULT NULL,
  `active` char(255) DEFAULT NULL,
  `actions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_actions_actions1` (`actions_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_actions`
--

LOCK TABLES `user_actions` WRITE;
/*!40000 ALTER TABLE `user_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_actions_has_user_friends`
--

DROP TABLE IF EXISTS `user_actions_has_user_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_actions_has_user_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_actions_id` int(11) NOT NULL DEFAULT '0',
  `user_friends_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`user_actions_id`,`user_friends_id`),
  KEY `fk_user_actions_has_user_friends_user_friends1` (`user_friends_id`),
  KEY `fk_user_actions_has_user_friends_user_actions1` (`user_actions_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_actions_has_user_friends`
--

LOCK TABLES `user_actions_has_user_friends` WRITE;
/*!40000 ALTER TABLE `user_actions_has_user_friends` DISABLE KEYS */;
INSERT INTO `user_actions_has_user_friends` VALUES (1,1,1),(2,1,2),(3,12,3),(4,13,4),(5,14,5),(6,14,6),(7,15,7),(8,16,8),(9,17,9),(10,17,10),(11,18,11),(12,19,12);
/*!40000 ALTER TABLE `user_actions_has_user_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_apikey`
--

DROP TABLE IF EXISTS `user_apikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apikey` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_apikey_user1` (`user_id`),
  CONSTRAINT `fk_user_apikey_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_apikey`
--

LOCK TABLES `user_apikey` WRITE;
/*!40000 ALTER TABLE `user_apikey` DISABLE KEYS */;
INSERT INTO `user_apikey` VALUES (1,'1234',1);
/*!40000 ALTER TABLE `user_apikey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_apikey_services`
--

DROP TABLE IF EXISTS `user_apikey_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_apikey_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(45) DEFAULT NULL,
  `usage_hits` int(22) DEFAULT '0',
  `status` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_apikey_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`user_apikey_id`),
  KEY `fk_user_apikey_services_user_apikey1` (`user_apikey_id`),
  CONSTRAINT `fk_user_apikey_services_user_apikey1` FOREIGN KEY (`user_apikey_id`) REFERENCES `user_apikey` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_apikey_services`
--

LOCK TABLES `user_apikey_services` WRITE;
/*!40000 ALTER TABLE `user_apikey_services` DISABLE KEYS */;
INSERT INTO `user_apikey_services` VALUES (1,'mobile',30,'1','2012-02-28 12:09:58',1);
/*!40000 ALTER TABLE `user_apikey_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_avatar`
--

DROP TABLE IF EXISTS `user_avatar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_avatar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `aux1` varchar(255) NOT NULL,
  `aux2` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `fk_user_avatar_user1` (`user_id`),
  CONSTRAINT `fk_user_avatar_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_avatar`
--

LOCK TABLES `user_avatar` WRITE;
/*!40000 ALTER TABLE `user_avatar` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_avatar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_avatar_elements`
--

DROP TABLE IF EXISTS `user_avatar_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_avatar_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aux1` varchar(255) NOT NULL,
  `aux2` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `avatar_elements_id` int(11) NOT NULL,
  `avatar_categories_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `fk_user_avatar_elements_user1` (`user_id`),
  KEY `fk_user_avatar_elements_avatar_elements1` (`avatar_elements_id`),
  KEY `fk_user_avatar_elements_avatar_categories1` (`avatar_categories_id`),
  CONSTRAINT `fk_user_avatar_elements_avatar_categories1` FOREIGN KEY (`avatar_categories_id`) REFERENCES `avatar_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_avatar_elements_avatar_elements1` FOREIGN KEY (`avatar_elements_id`) REFERENCES `avatar_elements` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_avatar_elements_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_avatar_elements`
--

LOCK TABLES `user_avatar_elements` WRITE;
/*!40000 ALTER TABLE `user_avatar_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_avatar_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_channels`
--

DROP TABLE IF EXISTS `user_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_code` varchar(255) NOT NULL,
  `channel_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `publish` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_channels`
--

LOCK TABLES `user_channels` WRITE;
/*!40000 ALTER TABLE `user_channels` DISABLE KEYS */;
INSERT INTO `user_channels` VALUES (1,'TELFORT','Telfort','',1),(2,'TPH','The Phone House','',1),(3,'CALLCENTER','Callcenter','',1),(4,'TELFORTHQ','Telfort HQ','',1);
/*!40000 ALTER TABLE `user_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_friends`
--

DROP TABLE IF EXISTS `user_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_ticket` varchar(255) DEFAULT '0',
  `voornaam` varchar(255) DEFAULT NULL,
  `achternaam` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_friends_user1` (`user_id`),
  CONSTRAINT `fk_user_friends_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_friends`
--

LOCK TABLES `user_friends` WRITE;
/*!40000 ALTER TABLE `user_friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `publish` tinyint(4) NOT NULL DEFAULT '0',
  `file` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_description` text CHARACTER SET latin1 NOT NULL,
  `group_code` varchar(32) CHARACTER SET latin1 NOT NULL,
  `group_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_street` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_nr` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_postcode` varchar(55) CHARACTER SET latin1 NOT NULL,
  `group_area` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_phone` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_fax` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `group_email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `partners_id` int(11) NOT NULL,
  `user_logos_id` int(11) DEFAULT NULL,
  `user_channels_id` int(11) DEFAULT NULL,
  `user_roles_id` int(11) NOT NULL DEFAULT '7',
  PRIMARY KEY (`id`),
  KEY `fk_user_groups_user_logos1` (`user_logos_id`),
  KEY `fk_user_groups_user_channels1` (`user_channels_id`),
  KEY `fk_user_groups_user_roles1` (`user_roles_id`),
  CONSTRAINT `fk_user_groups_user_channels1` FOREIGN KEY (`user_channels_id`) REFERENCES `user_channels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_groups_user_logos1` FOREIGN KEY (`user_logos_id`) REFERENCES `user_logos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_groups_user_roles1` FOREIGN KEY (`user_roles_id`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=200001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (200000,'admin','admin',0,'','','athand','athand','','','','','','','','',0,0,1,7);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups_has_regions`
--

DROP TABLE IF EXISTS `user_groups_has_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups_has_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `user_groupsregions_id` int(11) NOT NULL,
  `user_groups_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_groups_has_regions_user_groupsregions1` (`user_groupsregions_id`),
  KEY `fk_groups_has_regions_user_groups1` (`user_groups_id`),
  CONSTRAINT `fk_groups_has_regions_user_groups1` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_groups_has_regions_user_groupsregions1` FOREIGN KEY (`user_groupsregions_id`) REFERENCES `user_groups_regions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups_has_regions`
--

LOCK TABLES `user_groups_has_regions` WRITE;
/*!40000 ALTER TABLE `user_groups_has_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups_has_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups_ranking`
--

DROP TABLE IF EXISTS `user_groups_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups_ranking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `rank_previous` varchar(45) NOT NULL,
  `value` int(55) NOT NULL,
  `value_previous` int(55) NOT NULL,
  `value_change_percentage` varchar(55) NOT NULL,
  `value_total_precentage` varchar(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `users_total` int(11) DEFAULT NULL,
  `user_groups_id` int(11) DEFAULT NULL,
  `user_channels_id` int(11) DEFAULT NULL,
  `user_groups_regions_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_groups_ranking_user_groups1` (`user_groups_id`),
  CONSTRAINT `fk_user_groups_ranking_user_groups1` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups_ranking`
--

LOCK TABLES `user_groups_ranking` WRITE;
/*!40000 ALTER TABLE `user_groups_ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups_ranking_custom`
--

DROP TABLE IF EXISTS `user_groups_ranking_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups_ranking_custom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) DEFAULT NULL,
  `battles` int(11) DEFAULT NULL,
  `mysteryshop` int(11) DEFAULT NULL,
  `salestarget` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `user_groups_regions_id` int(11) DEFAULT NULL,
  `user_groups_id` int(11) NOT NULL,
  `user_channels_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_groups_ranking_custom_user_groups1` (`user_groups_id`),
  KEY `fk_user_groups_ranking_custom_user1` (`user_id`),
  CONSTRAINT `fk_user_groups_ranking_custom_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_groups_ranking_custom_user_groups1` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups_ranking_custom`
--

LOCK TABLES `user_groups_ranking_custom` WRITE;
/*!40000 ALTER TABLE `user_groups_ranking_custom` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups_ranking_custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups_regions`
--

DROP TABLE IF EXISTS `user_groups_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_name` varchar(255) DEFAULT NULL,
  `user_channels_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_groups_regions_user_channels1` (`user_channels_id`),
  CONSTRAINT `fk_user_groups_regions_user_channels1` FOREIGN KEY (`user_channels_id`) REFERENCES `user_channels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups_regions`
--

LOCK TABLES `user_groups_regions` WRITE;
/*!40000 ALTER TABLE `user_groups_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_invites`
--

DROP TABLE IF EXISTS `user_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_invites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checksum` varchar(255) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `message` text,
  PRIMARY KEY (`id`),
  KEY `fk_user_invites_user1` (`user_id`),
  CONSTRAINT `fk_user_invites_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_invites`
--

LOCK TABLES `user_invites` WRITE;
/*!40000 ALTER TABLE `user_invites` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_levels`
--

DROP TABLE IF EXISTS `user_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) DEFAULT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `image_inactive` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `publish` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_levels`
--

LOCK TABLES `user_levels` WRITE;
/*!40000 ALTER TABLE `user_levels` DISABLE KEYS */;
INSERT INTO `user_levels` VALUES (1,'noobus','noobus','/images-db/upload/userlevels/noobus.png','/images-db/upload/userlevels/noobus_inactive.png',1,1),(3,'captian','captain ','/images-db/upload/userlevels/captain.png','/images-db/upload/userlevels/captain_inactive.png',3,1),(4,'colonel','colonel','/images-db/upload/userlevels/colonel.png','/images-db/upload/userlevels/colonel_inactive.png',4,1),(5,'general','general','/images-db/upload/userlevels/general.png','/images-db/upload/userlevels/general_inactive.png',5,1),(8,'officer','officer','/images-db/upload/userlevels/officer.png','/images-db/upload/userlevels/officer_inactive.png',2,1);
/*!40000 ALTER TABLE `user_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_logos`
--

DROP TABLE IF EXISTS `user_logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_logos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `overlay_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fileresampled` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `rotate` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `left` int(11) DEFAULT NULL,
  `top` int(11) DEFAULT NULL,
  `publish` int(11) DEFAULT '0',
  `ticket` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `datalogo` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `fk_user_logos_user1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_logos`
--

LOCK TABLES `user_logos` WRITE;
/*!40000 ALTER TABLE `user_logos` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_logos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `readed` int(11) DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `custom` text,
  PRIMARY KEY (`id`),
  KEY `fk_user_message_user` (`user_id`),
  CONSTRAINT `fk_user_message_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message`
--

LOCK TABLES `user_message` WRITE;
/*!40000 ALTER TABLE `user_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_message_has_labels`
--

DROP TABLE IF EXISTS `user_message_has_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message_has_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_message_id` int(22) NOT NULL,
  `labels_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `readed` tinyint(1) NOT NULL DEFAULT '0',
  `old_labels_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_table1_user_message1` (`user_message_id`),
  KEY `fk_table1_labels1` (`labels_id`),
  KEY `fk_user_message_has_labels_user1` (`user_id`),
  CONSTRAINT `fk_table1_labels1` FOREIGN KEY (`labels_id`) REFERENCES `labels` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_user_message1` FOREIGN KEY (`user_message_id`) REFERENCES `user_message` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_message_has_labels_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_message_has_labels`
--

LOCK TABLES `user_message_has_labels` WRITE;
/*!40000 ALTER TABLE `user_message_has_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_message_has_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_quiz`
--

DROP TABLE IF EXISTS `user_quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_quiz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL DEFAULT '0',
  `answer_id` int(11) NOT NULL,
  `answer_correct` int(11) DEFAULT NULL,
  `answer_start_date` datetime DEFAULT NULL,
  `answer_stop_date` datetime DEFAULT NULL,
  `answer_text` text NOT NULL,
  `answer_date` datetime DEFAULT NULL,
  `seconds_elapsed` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `fk_quiz_users_user` (`user_id`),
  KEY `fk_quiz_users_quiz` (`quiz_id`),
  CONSTRAINT `fk_quiz_users_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quiz` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_quiz_users_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6866 DEFAULT CHARSET=latin1 PACK_KEYS=0;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_quiz`
--

LOCK TABLES `user_quiz` WRITE;
/*!40000 ALTER TABLE `user_quiz` DISABLE KEYS */;
INSERT INTO `user_quiz` VALUES (6834,796,2530,0,'2015-05-05 14:35:08','2015-05-05 14:35:29','','2015-05-05 14:35:29',21,0,1,15),(6835,796,2531,1,'2015-05-05 14:35:08','2015-05-05 14:35:41','','2015-05-05 14:35:41',33,0,1,15),(6836,820,2620,0,'2015-05-05 15:22:38','2015-05-05 15:22:41','','2015-05-05 15:22:41',3,0,1,16),(6851,788,2500,0,'2015-05-05 15:49:58','2015-05-05 15:49:59','','2015-05-05 15:49:59',1,0,1,10),(6852,788,2502,0,'2015-05-05 15:49:58','2015-05-05 15:50:02','','2015-05-05 15:50:02',4,0,1,10),(6853,788,2501,1,'2015-05-05 15:49:58','2015-05-05 15:50:03','','2015-05-05 15:50:03',5,0,1,10),(6854,789,2505,0,'2015-05-05 15:50:04','2015-05-05 15:50:06','','2015-05-05 15:50:06',2,0,1,10),(6855,789,2505,0,'2015-05-05 15:50:04','2015-05-05 15:50:09','','2015-05-05 15:50:09',5,0,1,10),(6856,789,2503,0,'2015-05-05 15:50:04','2015-05-05 15:50:11','','2015-05-05 15:50:11',7,0,1,10),(6857,789,2505,0,'2015-05-05 15:50:04','2015-05-05 15:50:12','','2015-05-05 15:50:12',8,0,1,10),(6858,789,2506,0,'2015-05-05 15:50:04','2015-05-05 15:50:14','','2015-05-05 15:50:14',10,0,1,10),(6859,789,2505,0,'2015-05-05 15:50:04','2015-05-05 15:50:15','','2015-05-05 15:50:15',11,0,1,10),(6860,789,2503,0,'2015-05-05 15:50:04','2015-05-05 15:50:16','','2015-05-05 15:50:16',12,0,1,10),(6861,789,2504,1,'2015-05-05 15:50:04','2015-05-05 15:50:17','','2015-05-05 15:50:17',13,0,1,10),(6862,790,2508,0,'2015-05-05 15:50:18','2015-05-05 15:50:19','','2015-05-05 15:50:19',1,0,1,10),(6863,790,2507,0,'2015-05-05 15:50:18','2015-05-05 15:50:20','','2015-05-05 15:50:20',2,0,1,10),(6864,790,2510,1,'2015-05-05 15:50:18','2015-05-05 15:50:22','','2015-05-05 15:50:22',4,0,1,10),(6865,791,2513,1,'2015-05-05 15:50:22','2015-05-05 15:50:24','','2015-05-05 15:50:24',2,0,1,10);
/*!40000 ALTER TABLE `user_quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_rankings`
--

DROP TABLE IF EXISTS `user_rankings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_rankings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `rank_previous` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `value_previous` int(11) DEFAULT NULL,
  `value_change_percentage` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_voornaam` varchar(255) DEFAULT NULL,
  `user_achternaam` varchar(255) DEFAULT NULL,
  `user_groups_id` int(11) DEFAULT NULL,
  `user_channels_id` int(11) DEFAULT NULL,
  `user_groups_regions_id` int(11) DEFAULT NULL,
  `user_levels_id` int(11) DEFAULT NULL,
  `user_levels_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_rankings_user1` (`user_id`),
  KEY `fk_user_rankings_user_groups1` (`user_groups_id`),
  KEY `fk_user_rankings_user_levels1` (`user_levels_id`),
  CONSTRAINT `fk_user_rankings_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_rankings_user_groups1` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_rankings_user_levels1` FOREIGN KEY (`user_levels_id`) REFERENCES `user_levels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_rankings`
--

LOCK TABLES `user_rankings` WRITE;
/*!40000 ALTER TABLE `user_rankings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_rankings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'user',2),(2,'partner',4),(3,'coach',5),(4,'admin',6),(6,'guest',1),(7,'group',3),(8,'feedback',7);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_transactions`
--

DROP TABLE IF EXISTS `user_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `model_identifier` varchar(255) DEFAULT NULL,
  `model_foreign_id` varchar(255) DEFAULT NULL,
  `factor` int(11) DEFAULT '1',
  `custom` text,
  `user_id` int(11) NOT NULL,
  `user_groups_id` int(11) NOT NULL,
  `user_channels_id` int(11) NOT NULL,
  `qrcode_categories_id` int(11) DEFAULT NULL,
  `qrcode_locations_id` int(11) DEFAULT NULL,
  `qrcode_behaviours_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_transactions_user1` (`user_id`),
  KEY `fk_user_transactions_user_groups1` (`user_groups_id`),
  CONSTRAINT `fk_user_transactions_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_transactions_user_groups1` FOREIGN KEY (`user_groups_id`) REFERENCES `user_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_transactions`
--

LOCK TABLES `user_transactions` WRITE;
/*!40000 ALTER TABLE `user_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-05 15:57:07
