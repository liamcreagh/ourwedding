-- MySQL dump 10.13  Distrib 5.7.11, for Linux (i686)
--
-- Host: localhost    Database: wordpress_452
-- ------------------------------------------------------
-- Server version	5.7.11

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
-- Table structure for table `@@DB_MAIN_PREFIX@@commentmeta`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@commentmeta`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@commentmeta` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@comments`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@comments`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@comments` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@comments` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES 
(1,1,'Mr WordPress','','https://wordpress.org/','',now(),now(),'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.',0,'1','','',0,0);
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@links`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@links`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@links` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@links` DISABLE KEYS */;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@options`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@options`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@options` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@options` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES 
(1,'siteurl','@@ROOT_URL@@','yes'),
(2,'home','@@ROOT_URL@@','yes'),
(3,'blogname','@@TITLE@@','yes'),
(4,'blogdescription','Just another WordPress site','yes'),
(5,'users_can_register','0','yes'),
(6,'admin_email','@@ADMIN_EMAIL@@','yes'),
(7,'start_of_week','1','yes'),
(8,'use_balanceTags','0','yes'),
(9,'use_smilies','1','yes'),
(10,'require_name_email','1','yes'),
(11,'comments_notify','1','yes'),
(12,'posts_per_rss','10','yes'),
(13,'rss_use_excerpt','0','yes'),
(14,'mailserver_url','mail.example.com','yes'),
(15,'mailserver_login','login@example.com','yes'),
(16,'mailserver_pass','password','yes'),
(17,'mailserver_port','110','yes'),
(18,'default_category','1','yes'),
(19,'default_comment_status','open','yes'),
(20,'default_ping_status','open','yes'),
(21,'default_pingback_flag','1','yes'),
(22,'posts_per_page','10','yes'),
(23,'date_format','F j, Y','yes'),
(24,'time_format','g:i a','yes'),
(25,'links_updated_date_format','F j, Y g:i a','yes'),
(26,'comment_moderation','0','yes'),
(27,'moderation_notify','1','yes'),
(28,'permalink_structure','','yes'),
(30,'hack_file','0','yes'),
(31,'blog_charset','UTF-8','yes'),
(32,'moderation_keys','','no'),
(33,'active_plugins','a:0:{}','yes'),
(34,'category_base','','yes'),
(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
(36,'comment_max_links','2','yes'),
(37,'gmt_offset','0','yes'),
(38,'default_email_category','1','yes'),
(39,'recently_edited','','no'),
(40,'template','twentyseventeen','yes'),
(41,'stylesheet','twentyseventeen','yes'),
(42,'comment_whitelist','1','yes'),
(43,'blacklist_keys','','no'),
(44,'comment_registration','0','yes'),
(45,'html_type','text/html','yes'),
(46,'use_trackback','0','yes'),
(47,'default_role','subscriber','yes'),
(48,'db_version','36686','yes'),
(49,'uploads_use_yearmonth_folders','1','yes'),
(50,'upload_path','','yes'),
(51,'blog_public','1','yes'),
(52,'default_link_category','2','yes'),
(53,'show_on_front','posts','yes'),
(54,'tag_base','','yes'),
(55,'show_avatars','1','yes'),
(56,'avatar_rating','G','yes'),
(57,'upload_url_path','','yes'),
(58,'thumbnail_size_w','150','yes'),
(59,'thumbnail_size_h','150','yes'),
(60,'thumbnail_crop','1','yes'),
(61,'medium_size_w','300','yes'),
(62,'medium_size_h','300','yes'),
(63,'avatar_default','mystery','yes'),
(64,'large_size_w','1024','yes'),
(65,'large_size_h','1024','yes'),
(66,'image_default_link_type','none','yes'),
(67,'image_default_size','','yes'),
(68,'image_default_align','','yes'),
(69,'close_comments_for_old_posts','0','yes'),
(70,'close_comments_days_old','14','yes'),
(71,'thread_comments','1','yes'),
(72,'thread_comments_depth','5','yes'),
(73,'page_comments','0','yes'),
(74,'comments_per_page','50','yes'),
(75,'default_comments_page','newest','yes'),
(76,'comment_order','asc','yes'),
(77,'sticky_posts','a:0:{}','yes'),
(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
(79,'widget_text','a:0:{}','yes'),
(80,'widget_rss','a:0:{}','yes'),
(81,'uninstall_plugins','a:0:{}','no'),
(82,'timezone_string','','yes'),
(83,'page_for_posts','0','yes'),
(84,'page_on_front','0','yes'),
(85,'default_post_format','0','yes'),
(86,'link_manager_enabled','0','yes'),
(87,'finished_splitting_shared_terms','1','yes'),
(88,'site_icon','0','yes'),
(89,'medium_large_size_w','768','yes'),
(90,'medium_large_size_h','0','yes'),
(91,'initial_db_version','36686','yes'),
(92,'@@DB_MAIN_PREFIX@@user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
(93,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
(94,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
(95,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
(96,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
(97,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
(98,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),
(99,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(100,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(101,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(102,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
(103,'cron','a:2:{i:1462852106;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}s:7:\"version\";i:2;}','yes'),
(104,'_transient_is_multi_author','0','yes'),
(105,'_transient_twentysixteen_categories','1','yes'),
(106,'WPLANG','@@LOCALE@@','yes');
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@postmeta`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@postmeta`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@postmeta` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@postmeta` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES 
(1,2,'_wp_page_template','default');
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@posts`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@posts`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@posts` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@posts` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES 
(1,1,'2016-05-10 03:48:21','2016-05-10 03:48:21','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','publish','open','open','','hello-world','','',
'2016-05-10 03:48:21','2016-05-10 03:48:21','',0,'@@ROOT_URL@@/?p=1',0,'post','',1),
(2,1,'2016-05-10 03:48:21','2016-05-10 03:48:21','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"@@ROOT_URL@@/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','',
'2016-05-10 03:48:21','2016-05-10 03:48:21','',0,'@@ROOT_URL@@/?page_id=2',0,'page','',0);
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@term_relationships`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@term_relationships`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@term_relationships` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@term_relationships` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES 
(1,1,0);
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@term_taxonomy`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@term_taxonomy`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@term_taxonomy` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@term_taxonomy` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES 
(1,1,'category','',0,1);
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@termmeta`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@termmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@termmeta`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@termmeta` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@termmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@termmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@terms`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@terms`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@terms` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@terms` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@terms` (`term_id`, `name`, `slug`, `term_group`) VALUES 
(1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@usermeta`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@usermeta`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@usermeta` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@usermeta` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES 
(1,1,'nickname','@@ADMIN_NAME@@'),
(2,1,'first_name',''),
(3,1,'last_name',''),
(4,1,'description',''),
(5,1,'rich_editing','true'),
(6,1,'comment_shortcuts','false'),
(7,1,'admin_color','fresh'),
(8,1,'use_ssl','0'),
(9,1,'show_admin_bar_front','true'),
(10,1,'@@DB_MAIN_PREFIX@@capabilities','a:1:{s:13:\"administrator\";b:1;}'),
(11,1,'@@DB_MAIN_PREFIX@@user_level','10'),
(12,1,'dismissed_wp_pointers',''),
(13,1,'show_welcome_panel','1');
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@usermeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `@@DB_MAIN_PREFIX@@users`
--

DROP TABLE IF EXISTS `@@DB_MAIN_PREFIX@@users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `@@DB_MAIN_PREFIX@@users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `@@DB_MAIN_PREFIX@@users`
--

LOCK TABLES `@@DB_MAIN_PREFIX@@users` WRITE;
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@users` DISABLE KEYS */;
INSERT INTO `@@DB_MAIN_PREFIX@@users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES 
(1,'@@ADMIN_NAME@@','@@ADMIN_PASSWORD@@','@@ADMIN_NAME@@','@@ADMIN_EMAIL@@','',now(),'',0,'@@ADMIN_NAME@@');
/*!40000 ALTER TABLE `@@DB_MAIN_PREFIX@@users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-10 10:48:57
