-- MySQL dump 10.13  Distrib 5.6.23, for Win32 (x86)
--
-- Host: localhost    Database: eclesia
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_3722684e571285e1_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_3722684e571285e1_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_68b202212be57470_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_1b620702f8fd8621_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$I6kEqxGOrEJ6$EgUrLnR86OAE9HbrMjSxfnYI9Spb5hfwGXOE75UjzZ4=','2015-11-24 16:31:01.670344',1,'admin','','','admin@isp.com',1,1,'2015-11-06 16:23:26.968367');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_75269b25e3c92682_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_75269b25e3c92682_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_784af348315d8cce_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_677d434100ce972b_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_677d434100ce972b_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7134eda71dca5518_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Pastor'),(2,'Diácono'),(3,'Músico'),(4,'Líder de grupo'),(5,'Professor de Escola Bíblica'),(6,'Secretário'),(7,'Tesoureiro'),(8,'Vice-Presidente'),(9,'Presidente');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` int(11) DEFAULT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_estado_4fcd4639101d3c6f_fk` (`estado`),
  CONSTRAINT `cidade_estado_4fcd4639101d3c6f_fk` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,27,'Curitiba');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culto`
--

DROP TABLE IF EXISTS `culto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `inicio` time DEFAULT NULL,
  `fim` time DEFAULT NULL,
  `presentes` int(11) DEFAULT NULL,
  `dizimos` float DEFAULT NULL,
  `ofertas` float DEFAULT NULL,
  `arrecadacao_total` float DEFAULT NULL,
  `abertura` int(11) DEFAULT NULL,
  `musicos` int(11) DEFAULT NULL,
  `pregador` int(11) DEFAULT NULL,
  `pastores_presentes` int(11) DEFAULT NULL,
  `diaconos` int(11) DEFAULT NULL,
  `observacoes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culto`
--

LOCK TABLES `culto` WRITE;
/*!40000 ALTER TABLE `culto` DISABLE KEYS */;
/*!40000 ALTER TABLE `culto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culto_diaconos`
--

DROP TABLE IF EXISTS `culto_diaconos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culto_diaconos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `culto_id` int(11) DEFAULT NULL,
  `membro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `culto_diaconos_culto_id_291245a2c657a5ff_fk_culto_id_idx` (`culto_id`),
  KEY `culto_diaconos_membro_id_6e5505665abbc64e_fk_membro_id_idx` (`membro_id`),
  CONSTRAINT `culto_diaconos_culto_id_291245a2c657a5ff_fk_culto_id` FOREIGN KEY (`culto_id`) REFERENCES `culto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `culto_diaconos_membro_id_6e5505665abbc64e_fk_membro_id` FOREIGN KEY (`membro_id`) REFERENCES `membro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culto_diaconos`
--

LOCK TABLES `culto_diaconos` WRITE;
/*!40000 ALTER TABLE `culto_diaconos` DISABLE KEYS */;
/*!40000 ALTER TABLE `culto_diaconos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culto_musicos`
--

DROP TABLE IF EXISTS `culto_musicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culto_musicos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `culto_id` int(11) NOT NULL,
  `membro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `culto_musicos_culto_id_e443a20990c652b_fk_culto_id_idx` (`culto_id`),
  KEY `culto_musicos_membro_id_7f7c97b70bfb26ec_fk_membro_id_idx` (`membro_id`),
  CONSTRAINT `culto_musicos_culto_id_e443a20990c652b_fk_culto_id` FOREIGN KEY (`culto_id`) REFERENCES `culto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `culto_musicos_membro_id_7f7c97b70bfb26ec_fk_membro_id` FOREIGN KEY (`membro_id`) REFERENCES `membro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culto_musicos`
--

LOCK TABLES `culto_musicos` WRITE;
/*!40000 ALTER TABLE `culto_musicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `culto_musicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culto_pastores_presentes`
--

DROP TABLE IF EXISTS `culto_pastores_presentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `culto_pastores_presentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `culto_id` int(11) NOT NULL,
  `membro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `culto_pastores_presentes_culto_id_205ad4fdf3e88ffe_fk_culto_idx` (`culto_id`),
  KEY `culto_pastores_presentes_membro_id_3c6b2d2d3fce038b_fk_memb_idx` (`membro_id`),
  CONSTRAINT `culto_pastores_presentes_culto_id_205ad4fdf3e88ffe_fk_culto_id` FOREIGN KEY (`culto_id`) REFERENCES `culto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `culto_pastores_presentes_membro_id_3c6b2d2d3fce038b_fk_membro_id` FOREIGN KEY (`membro_id`) REFERENCES `membro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culto_pastores_presentes`
--

LOCK TABLES `culto_pastores_presentes` WRITE;
/*!40000 ALTER TABLE `culto_pastores_presentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `culto_pastores_presentes` ENABLE KEYS */;
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
  KEY `djang_content_type_id_2285db57b717dc73_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_776e1ec608d8a960_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_2285db57b717dc73_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_776e1ec608d8a960_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-11-06 16:45:09.852182','1','Religioes object',1,'',9,1),(2,'2015-11-06 16:45:22.936182','1','Estado object',1,'',10,1),(3,'2015-11-06 16:45:49.530182','1','Cidade object',1,'',8,1),(4,'2015-11-06 16:46:06.110182','1','Escolaridade object',1,'',11,1),(5,'2015-11-06 16:46:15.452182','1','Estadocivil object',1,'',12,1),(6,'2015-11-06 16:46:21.911182','2','Estadocivil object',1,'',12,1),(7,'2015-11-06 16:46:28.622182','3','Estadocivil object',1,'',12,1),(8,'2015-11-06 16:48:12.019182','1','Pessoa object',1,'',7,1),(9,'2015-11-09 16:22:05.395497','1','Pastor',1,'',14,1),(10,'2015-11-09 16:22:16.680497','2','Músico',1,'',14,1),(11,'2015-11-09 16:22:36.246497','3','Diácono',1,'',14,1),(12,'2015-11-12 18:42:06.703139','1','Victor de Sousa',1,'',13,1),(13,'2015-11-12 19:28:04.597139','1','Culto object',1,'',15,1),(14,'2015-11-17 15:52:30.826918','1','Peter Preacher',1,'',7,1),(15,'2015-11-17 15:52:39.070840','2','Denny Deacon',1,'',7,1),(16,'2015-11-17 15:52:52.929578','3','Don Drummer',1,'',7,1),(17,'2015-11-17 15:53:09.471362','4','Will Worship Leader',1,'',7,1),(18,'2015-11-17 15:53:33.065937','5','Irven Introducer',1,'',7,1),(19,'2015-11-17 15:53:50.392004','1','Pastor',1,'',14,1),(20,'2015-11-17 15:53:59.307436','1','Peter Preacher',1,'',13,1),(21,'2015-11-17 15:54:10.043140','2','Diácono',1,'',14,1),(22,'2015-11-17 15:54:11.997358','2','Denny Deacon',1,'',13,1),(23,'2015-11-17 15:54:54.657287','3','Músico',1,'',14,1),(24,'2015-11-17 15:54:56.551529','3','Don Drummer',1,'',13,1),(25,'2015-11-17 15:55:03.076918','4','Irven Introducer',1,'',13,1),(26,'2015-11-17 15:55:15.235053','5','Will Worship Leader',1,'',13,1),(27,'2015-11-17 16:07:26.783976','1','Paraná',1,'',10,1),(28,'2015-11-17 16:07:36.660976','1','Casado',1,'',12,1),(29,'2015-11-17 16:07:40.869976','2','Solteiro',1,'',12,1),(30,'2015-11-17 16:07:46.128976','3','Separado',1,'',12,1),(31,'2015-11-17 16:07:50.420976','4','Divorciado',1,'',12,1),(32,'2015-11-17 16:07:55.107976','5','Viúvo',1,'',12,1),(33,'2015-11-17 16:08:04.639976','1','Ensino fundamental',1,'',11,1),(34,'2015-11-17 16:08:09.556976','2','Ensino médio',1,'',11,1),(35,'2015-11-17 16:08:14.322976','3','Ensino superior incompleto',1,'',11,1),(36,'2015-11-17 16:08:19.837976','4','Ensino superior completo',1,'',11,1),(37,'2015-11-17 16:08:31.739976','1','Católica',1,'',9,1),(38,'2015-11-17 16:08:38.748976','2','Evangélica',1,'',9,1),(39,'2015-11-17 16:08:44.388976','3','Espírita',1,'',9,1),(40,'2015-11-17 16:08:49.230976','4','Nenhuma',1,'',9,1),(41,'2015-11-17 16:09:06.025976','1','Curitiba',1,'',8,1),(42,'2015-11-17 17:22:07.477969','3','terça-feira - 17 de novembro de 2015',1,'',15,1),(43,'2015-11-17 17:22:23.072969','3','terça-feira - 17 de novembro de 2015',2,'Modificado inicio e fim.',15,1),(44,'2015-11-19 12:52:32.695451','6','Victor de Sousa',1,'',13,1),(45,'2015-11-24 16:43:03.792344','4','Líder de grupo',1,'',14,1),(46,'2015-11-24 16:43:28.248344','5','Professor de Escola Bíblica',1,'',14,1),(47,'2015-11-24 16:43:42.591344','6','Secretário',1,'',14,1),(48,'2015-11-24 16:43:48.694344','7','Tesoureiro',1,'',14,1),(49,'2015-11-24 16:43:55.779344','8','Vice-Presidente',1,'',14,1),(50,'2015-11-24 16:43:59.909344','9','Presidente',1,'',14,1),(51,'2015-11-24 16:44:32.588344','6','Victor de Sousa',2,'Modificado cargo.',13,1),(52,'2015-11-24 16:44:58.116344','3','terça-feira - 17 de novembro de 2015',2,'Modificado pastores_presentes e diaconos.',15,1),(53,'2015-11-24 16:52:22.342344','5','Irven Introducer',3,'',7,1),(54,'2015-11-24 16:52:22.344344','4','Will Worship Leader',3,'',7,1),(55,'2015-11-24 16:52:22.346344','3','Don Drummer',3,'',7,1),(56,'2015-11-24 16:52:22.347344','2','Denny Deacon',3,'',7,1),(57,'2015-11-24 16:52:22.349344','1','Peter Preacher',3,'',7,1);
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
  UNIQUE KEY `django_content_type_app_label_421e93e64310c699_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(14,'eklesia0','cargo'),(8,'eklesia0','cidade'),(15,'eklesia0','culto'),(11,'eklesia0','escolaridade'),(10,'eklesia0','estado'),(12,'eklesia0','estadocivil'),(13,'eklesia0','membro'),(7,'eklesia0','pessoa'),(9,'eklesia0','religioes'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-11-06 16:23:03.137984'),(2,'auth','0001_initial','2015-11-06 16:23:04.428113'),(3,'admin','0001_initial','2015-11-06 16:23:04.751146'),(4,'contenttypes','0002_remove_content_type_name','2015-11-06 16:23:05.179188'),(5,'auth','0002_alter_permission_name_max_length','2015-11-06 16:23:05.330203'),(6,'auth','0003_alter_user_email_max_length','2015-11-06 16:23:05.541225'),(7,'auth','0004_alter_user_username_opts','2015-11-06 16:23:05.575228'),(8,'auth','0005_alter_user_last_login_null','2015-11-06 16:23:05.799250'),(9,'auth','0006_require_contenttypes_0002','2015-11-06 16:23:05.818252'),(10,'sessions','0001_initial','2015-11-06 16:23:05.959266'),(11,'eklesia0','0001_initial','2015-11-09 15:07:09.994111'),(12,'eklesia0','0002_auto_20151112_1659','2015-11-12 19:03:19.359139'),(13,'eklesia0','0002_auto_20151112_1726','2015-11-12 19:26:29.975139'),(14,'eklesia0','0002_auto_20151117_1454','2015-11-17 16:54:58.133946'),(15,'eklesia0','0003_auto_20151124_1441','2015-11-24 16:41:35.778344');
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
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2kki3lm34yg7ckv8vuhq1ykmrby1my3p','OWExZjM1ZjM1ODg4OGVjYWY2N2MwMzY2OTNhNzBkMzkyZjAwZjkzODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2EyNzkxOWQzZmJkZTM4MGYyYTYyNDM1NGVjOThmNzZlNDk4MjI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-11-20 16:32:05.735955'),('6sez14o8p6zvykj6nthxbbquxnjyy052','MGVjMGZkZDc5OTU4YjNmZTYwODhmNTFhOTlhYzc3MDg5MDJlNzA4Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2EyNzkxOWQzZmJkZTM4MGYyYTYyNDM1NGVjOThmNzZlNDk4MjI0YSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-11-26 18:34:47.627617'),('988vg81df5fn3cj500cq6s9nbjmcaix2','MmI3NDUyMmZiYmY0ZjI3YWE5YzliZWZkMTVkMGE4ZjMzOGQ2NjZkNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI3YTI3OTE5ZDNmYmRlMzgwZjJhNjI0MzU0ZWM5OGY3NmU0OTgyMjRhIn0=','2015-11-23 12:26:15.590926'),('jd0nsa2rvahroks705g7dxihgsl1427u','MGVjMGZkZDc5OTU4YjNmZTYwODhmNTFhOTlhYzc3MDg5MDJlNzA4Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2EyNzkxOWQzZmJkZTM4MGYyYTYyNDM1NGVjOThmNzZlNDk4MjI0YSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-11-30 16:52:31.477282'),('o2t7zwqc70jnzaoktxc3yxj0vznbkl7v','OWExZjM1ZjM1ODg4OGVjYWY2N2MwMzY2OTNhNzBkMzkyZjAwZjkzODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2EyNzkxOWQzZmJkZTM4MGYyYTYyNDM1NGVjOThmNzZlNDk4MjI0YSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-11-23 15:05:21.688111'),('wsh7b4vxp0l4pppetk8eb0neux5jni43','MGVjMGZkZDc5OTU4YjNmZTYwODhmNTFhOTlhYzc3MDg5MDJlNzA4Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2EyNzkxOWQzZmJkZTM4MGYyYTYyNDM1NGVjOThmNzZlNDk4MjI0YSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-12-08 16:31:01.678344'),('yuw93kbl0bli0kt1wswrzyuc95r04j39','NDk0MWQwM2YxNDM3YWYwNzRhZjQ3YmI3Yzc1ZjQyZGQ0YWQwOGY3ZTp7fQ==','2015-11-23 12:26:11.155926');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escolaridade`
--

DROP TABLE IF EXISTS `escolaridade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escolaridade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escolaridade`
--

LOCK TABLES `escolaridade` WRITE;
/*!40000 ALTER TABLE `escolaridade` DISABLE KEYS */;
INSERT INTO `escolaridade` VALUES (1,'Ensino fundamental'),(2,'Ensino médio'),(3,'Ensino superior incompleto'),(4,'Ensino superior completo');
/*!40000 ALTER TABLE `escolaridade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sigla` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Acre','AC'),(2,'Alagoas','AL'),(3,'Amapá','AP'),(4,'Amazonas','AM'),(5,'Bahia','BA'),(6,'Ceará','CE'),(7,'Distrito Federal','DF'),(8,'Espírito Santo','ES'),(9,'Goiás','GO'),(10,'Maranhão','MA'),(11,'Mato Grosso','MT'),(12,'Mato Grosso do Sul','MS'),(13,'Minas Gerais','MG'),(14,'Pará','PA'),(15,'Paraíba','PB'),(16,'Paraná','PR'),(17,'Pernambuco','PE'),(18,'Piauí','PI'),(19,'Rio de Janeiro','RJ'),(20,'Rio Grande do Norte','RN'),(21,'Rio Grande do Sul','RS'),(22,'Rondônia','RO'),(23,'Roraima','RR'),(24,'Santa Catarina','SC'),(25,'São Paulo','SP'),(26,'Sergipe','SE'),(27,'Tocantins','TO');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocivil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivil`
--

LOCK TABLES `estadocivil` WRITE;
/*!40000 ALTER TABLE `estadocivil` DISABLE KEYS */;
INSERT INTO `estadocivil` VALUES (1,'Casado'),(2,'Solteiro'),(3,'Separado'),(4,'Divorciado'),(5,'Viúvo');
/*!40000 ALTER TABLE `estadocivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membro`
--

DROP TABLE IF EXISTS `membro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa` int(11) NOT NULL,
  `data_entrada` date DEFAULT NULL,
  `arrolado_por` varchar(45) DEFAULT NULL,
  `data_batismo` date DEFAULT NULL,
  `igreja_batismo` varchar(45) DEFAULT NULL,
  `religiao_anterior` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `membro_pessoa_49386a6c28647c34_fk` (`pessoa`),
  KEY `membro_religiao_anterior_78da6fc0af46d718_fk` (`religiao_anterior`),
  CONSTRAINT `membro_pessoa_49386a6c28647c34_fk` FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`id`),
  CONSTRAINT `membro_religiao_anterior_78da6fc0af46d718_fk` FOREIGN KEY (`religiao_anterior`) REFERENCES `religioes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membro`
--

LOCK TABLES `membro` WRITE;
/*!40000 ALTER TABLE `membro` DISABLE KEYS */;
INSERT INTO `membro` VALUES (6,62,'2015-11-19','Profissao de fe','2015-11-19','',2);
/*!40000 ALTER TABLE `membro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membro_cargo`
--

DROP TABLE IF EXISTS `membro_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membro_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membro_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `membro_id` (`membro_id`,`cargo_id`),
  KEY `membro_cargo_cargo_id_7fbb08c2ca596bcd_fk_cargo_id` (`cargo_id`),
  CONSTRAINT `membro_cargo_cargo_id_7fbb08c2ca596bcd_fk_cargo_id` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`),
  CONSTRAINT `membro_cargo_membro_id_169b939e4d44dd61_fk_membro_id` FOREIGN KEY (`membro_id`) REFERENCES `membro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membro_cargo`
--

LOCK TABLES `membro_cargo` WRITE;
/*!40000 ALTER TABLE `membro_cargo` DISABLE KEYS */;
INSERT INTO `membro_cargo` VALUES (1,6,1),(2,6,3),(3,6,4);
/*!40000 ALTER TABLE `membro_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(95) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `estado_civil` int(11) DEFAULT NULL,
  `naturalidade` int(11) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `profissao` varchar(50) DEFAULT NULL,
  `escolaridade` int(11) DEFAULT NULL,
  `endereco` varchar(250) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `cidade` int(11) DEFAULT NULL,
  `uf` int(11) DEFAULT NULL,
  `telefone_residencial` varchar(45) DEFAULT NULL,
  `telefone_celular` varchar(45) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_cidade_20d3a44578b89322_fk` (`cidade`),
  KEY `pessoa_escolaridade_53a87e541d3b8c95_fk` (`escolaridade`),
  KEY `pessoa_uf_d4742e841571dbf_fk` (`uf`),
  KEY `pessoa_estado_civil_d66e4679866e714_fk` (`estado_civil`),
  KEY `pessoa_naturalidade_5e2d4684941cb4be_uniq` (`naturalidade`),
  CONSTRAINT `pessoa_cidade_20d3a44578b89322_fk` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`id`),
  CONSTRAINT `pessoa_escolaridade_53a87e541d3b8c95_fk` FOREIGN KEY (`escolaridade`) REFERENCES `escolaridade` (`id`),
  CONSTRAINT `pessoa_estado_civil_d66e4679866e714_fk` FOREIGN KEY (`estado_civil`) REFERENCES `estadocivil` (`id`),
  CONSTRAINT `pessoa_naturalidade_5e2d4684941cb4be_fk_cidade_id` FOREIGN KEY (`naturalidade`) REFERENCES `cidade` (`id`),
  CONSTRAINT `pessoa_uf_d4742e841571dbf_fk` FOREIGN KEY (`uf`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (47,'Bruno Lucas Bertelmann','1991-10-05','M',NULL,NULL,'11137656-5','092.085.539-30','pintor',NULL,'\"R. Nelson Thomaz, 424\"','82315-200',NULL,NULL,'(41) 3372-2145','(41) 8481-3669','brunoluca2021@hotmail.com '),(48,'Danielle Castilho de Sousa','1970-09-03','F',NULL,NULL,'5794128-6','612.238.329-53','do lar',NULL,'\"R. Brasílio José Betezek, 100 L 12\"','82015-384',NULL,NULL,'(41) 3053-7888','(41) 9647-4375',NULL),(49,'Evana do Rocio Torres Marins','1969-09-09','F',NULL,NULL,'4618402-5','612.188.989-68','assistente administrativo',NULL,'\"R. Itajubá, 643 Ap 202 Bl 01\"','81070-190',NULL,NULL,NULL,'(41) 9142-6060','evana_marins@hotmail.com'),(50,'Gilcéa de Oliveira Martins','1964-12-12','F',NULL,NULL,'18413034','103.189.138-28','do lar',NULL,'\"R. Teófilo Treicik, 64\"','82310-290',NULL,NULL,'(41) 3273-6416','(41) 9928-1613',NULL),(51,'José Antonio Deunisio','1952-05-10','M',NULL,NULL,'1348855-0','317.765',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'Judy Uller',NULL,'F',NULL,NULL,'2681443','018.950.969-44','do lar',NULL,'\"R. Itajubá, 643 Ap 202 Bl 01\"','81070-190',NULL,NULL,NULL,'(41) 9222-3002','j.uller@hotmail.com'),(53,'Lauro Leite','1948-12-12','M',NULL,NULL,'736.938','356.140.369-04','motorista',NULL,'\"R. São José da Boa Vista, 374\"','82315-330',NULL,NULL,'(41) 3372-6810',NULL,NULL),(54,'Leonir Aparecida Leita','1955-06-15','F',NULL,NULL,'937.640-2','672.290.859-34','agente administrativo',NULL,'\"R. São José da Boa Vista, 374\"','82315-330',NULL,NULL,'(41) 3372-6810','(41) 9916-2820','leonirleite@gmail.com'),(55,'Letícia Regina de Castilho Reffo','1990-09-10','F',NULL,NULL,'9627161-1','077.526.549-73','auxiliar de escritório',NULL,'\"R. Nelson Thomaz, 424\"','82315-200',NULL,NULL,'(41) 3272-2145','(41) 8418-2331','leticia_curita@hotmail.com'),(56,'Patrícia Ferreira Domingues','1982-05-03','F',NULL,NULL,'7701870-0','031.230.489-77','biólogo',NULL,'\"R. Angelo Massignan, 884',' Bl 6 Apto 14\"',NULL,NULL,'PR','(41) 3503-4082','(41) 8410-5886'),(57,'Paulo Henrique Leite','1974-09-24','M',NULL,NULL,'5.698.390-2','807.320.549-15','servidor público municipal',NULL,'\"R. São José da Boa Vista, 374\"','82315-330',NULL,NULL,'(41) 3372-6810','(41) 9923-1695','leitepaulo@msn.com'),(58,'Rita Noemia Grabin Deunísio','1958-05-22','F',NULL,NULL,'2.148.340-0','393.512.389-20','do lar',NULL,'\"R. Eduardo Sprada, 8061\"','81290-110',NULL,NULL,'(41) 3373-1211','(41) 9827-7728',NULL),(59,'Roger Antonio Nunes','1976-08-06','M',NULL,NULL,'6142856-9','019.142.749-70','servidor público',NULL,'\"R. Angelo Massignan, 884',' Bl 6 Apto 14\"',NULL,NULL,'PR','(41) 3503-4082','(41) 84740478'),(60,'Tereza Cristina de Castilho Domingues','1960-03-21','F',NULL,NULL,'4313.776-0','605.006.979-49','auxiliar administrativo',NULL,'R. Guarantã,82315-100','Curitiba',NULL,NULL,'(41) 8437-2107','castilhodomingues@hotmail.com','Oscar Ferreiras Domingues'),(61,'Valdir Martins',NULL,'M',NULL,NULL,'616324-0','922.304.909-15','ourives',NULL,'\"R. Teófilo Treicik, 64\"','82310-290',NULL,NULL,'(41) 3273-6416','(41) 9612-7376','martins.joias@yahoo.com.br'),(62,'Victor de Sousa','1988-06-13','M',NULL,NULL,'7968.422-8','053.462.509-64','analista de sistemas',NULL,'\"R. Brasílio José Betezek, 100 L 12\"','82015-384',NULL,NULL,'(41) 3053-7888','(41) 9944-0805','victorsousa88@yahoo.com.br'),(63,'Gabriel Felipe de Oliveira Martins','1996-11-11','M',NULL,NULL,'10966998-9','078.623.599-33','estudante',NULL,'\"R. Teófilo Treicik, 64\"','82310-290',NULL,NULL,'(41) 3273-6416','(41) 96344391','gabriel_11111996@hotmail.com'),(64,'Aline de Fátima Pabis','1974-02-15','F',NULL,NULL,'6139245-9','970.028.259-34','síndica',NULL,'\"R. Dr. Polan Dusczak, 90',' Bl. 6. Apto. 01\"',NULL,NULL,'PR','(41) 3528-6584','(41) 9924-0255'),(65,'Paulo Roberto Moreira Piffer','1978-11-23','M',NULL,NULL,'6343421-3','024.573.109-11','professor',NULL,'\"R. Olivia G. Freitas, 568 - casa 48\"','82310-270',NULL,NULL,'(41) 3272-2330','(41) 88371128','paulompiffer@pop.com.br'),(66,'Gisele de Andrade Carneiro piffer','1979-10-11','F',NULL,NULL,'7147615-4','007.602.399-08','assistente administrativo',NULL,'\"R. Olivia G. Freitas, 568 - casa 48\"','82310-270',NULL,NULL,'(41) 3272-2330','(41) 9133-1368','gisele_piffer@hotmail.com'),(67,'Suelen Beltrão','1988-06-24','F',NULL,NULL,NULL,NULL,'professor',NULL,'\"R. Alberto Francisco Tossin, 139\"','81200-360',NULL,NULL,'(41) 3387-4068','(41) 99253641','suelenbeltrao_@hotmail.com '),(68,'João Candido da Silva','1962-06-15','M',NULL,NULL,'1751734-1','444.056.939-00','técnico em contabilidade',NULL,'\"R. José Pereita dos Anjos, 396\"','81270-260',NULL,NULL,'(41) 3203-2953','(41) 8809-6143','dasilva.jcandido@gmail.com'),(69,'Maria da Graça Ribeiro da S. Costa','1961-09-03','F',NULL,NULL,NULL,'759.146.897-91','pensionista',NULL,'\"R. José Pereita dos Anjos, 396\"','81270-260',NULL,NULL,'(41) 3203-2953','(41) 8740-5682','mariarscosta@hotmail.com'),(70,'Karin de Oliveira',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,'(41) 97251553',NULL,NULL),(71,'Ana Maria',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(72,'Francisco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(73,'Marister',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(74,'Moisés Novaes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(75,'Mariana',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(76,'Rafael',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(77,'Fabíola',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(78,'Laura',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(79,'Vilma',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(80,'Regina',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(81,'Silmara',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL),(82,'Paola',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,',',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religioes`
--

DROP TABLE IF EXISTS `religioes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religioes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religioes`
--

LOCK TABLES `religioes` WRITE;
/*!40000 ALTER TABLE `religioes` DISABLE KEYS */;
INSERT INTO `religioes` VALUES (1,'Católica'),(2,'Evangélica'),(3,'Espírita'),(4,'Nenhuma');
/*!40000 ALTER TABLE `religioes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-24 14:52:32
