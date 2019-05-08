# ************************************************************
# Sequel Pro SQL dump
# Version 5438
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.16)
# Database: SocialNetwork
# Generation Time: 2019-05-07 00:56:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table followers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `followers`;

CREATE TABLE `followers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `follower_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table login_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_tokens`;

CREATE TABLE `login_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` char(64) NOT NULL DEFAULT '',
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `login_tokens` WRITE;
/*!40000 ALTER TABLE `login_tokens` DISABLE KEYS */;

INSERT INTO `login_tokens` (`id`, `token`, `user_id`)
VALUES
	(1,'53c1247d42718886efef66099ee02f37bb78ba9d',1);

/*!40000 ALTER TABLE `login_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_tokens`;

CREATE TABLE `password_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `token` char(64) NOT NULL DEFAULT '',
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table post_likes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post_likes`;

CREATE TABLE `post_likes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`)
VALUES
	(5,2,1),
	(6,1,1);

/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `body` varchar(160) NOT NULL DEFAULT '',
  `posted_at` datetime NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `likes` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `body`, `posted_at`, `user_id`, `likes`)
VALUES
	(1,'hey\r\n','2019-05-06 20:54:18',1,1),
	(2,'yeet\r\n','2019-05-06 20:54:41',1,1);

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `email` text,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `password`, `email`, `verified`)
VALUES
	(1,'verified','$2y$10$HqZLvILG1BPBp.1MzODcbe.ffX2iz1VqapvhHEI3gmpAzDXqjiKWy','yeetusthefetus@yeetthat.com',1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
