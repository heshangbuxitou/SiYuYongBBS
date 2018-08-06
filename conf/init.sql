/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : nahan

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2018-04-27 12:00:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `append`
-- ----------------------------
DROP TABLE IF EXISTS `append`;
CREATE TABLE `append` (
  `id` int(11) NOT NULL auto_increment,
  `time_created` datetime default NULL,
  `content` text,
  `content_rendered` text,
  `topic_id` int(11) default NULL,
  `topic_deleted` tinyint(1) default NULL,
  `append_deleted` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of append
-- ----------------------------
INSERT INTO `append` VALUES ('1', '2017-11-10 00:18:33', '可不好房价狂飙', '<p>可不好房价狂飙</p>', '1', '0', '0');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL auto_increment,
  `content` text,
  `content_rendered` text,
  `time_created` datetime default NULL,
  `user_id` int(11) default NULL,
  `topic_id` int(11) default NULL,
  `topic_deleted` tinyint(1) default NULL,
  `user_deleted` tinyint(1) default NULL,
  `comment_deleted` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '罗湖区分别v', '<p>罗湖区分别v</p>', '2017-11-10 00:18:49', '2', '1', '0', '0', '0');
INSERT INTO `comment` VALUES ('2', '@11111 能尽快发布', '<p>@<a href=\"/user/2\" class=\"mention\">11111</a> 能尽快发布</p>', '2017-11-10 00:19:02', '2', '1', '0', '0', '0');
INSERT INTO `comment` VALUES ('3', '@11111 几个vjgvjh', '<p>@<a href=\"/user/2\" class=\"mention\">11111</a> 几个vjgvjh</p>', '2017-11-10 00:19:15', '2', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `node`
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(64) default NULL,
  `description` text,
  `deleted` tinyint(1) default NULL,
  `topics` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of node
-- ----------------------------
INSERT INTO `node` VALUES ('1', '123', '这是描述电影的', '0', '1');

-- ----------------------------
-- Table structure for `notify`
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `id` int(11) NOT NULL auto_increment,
  `time_created` datetime default NULL,
  `sender_id` int(11) default NULL,
  `receiver_id` int(11) default NULL,
  `comment_id` int(11) default NULL,
  `topic_id` int(11) default NULL,
  `append_id` int(11) default NULL,
  `append_deleted` tinyint(1) default NULL,
  `topic_deleted` tinyint(1) default NULL,
  `comment_deleted` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notify
-- ----------------------------
INSERT INTO `notify` VALUES ('1', '2017-11-10 00:19:02', '2', '2', '2', '1', null, '0', '0', '0');
INSERT INTO `notify` VALUES ('2', '2017-11-10 00:19:15', '2', '2', '3', '1', null, '0', '0', '0');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(128) default NULL,
  `content` text,
  `content_rendered` text,
  `click` int(11) default NULL,
  `reply_count` int(11) default NULL,
  `topic_deleted` tinyint(1) default NULL,
  `node_deleted` tinyint(1) default NULL,
  `user_deleted` tinyint(1) default NULL,
  `time_created` datetime default NULL,
  `last_replied` datetime default NULL,
  `user_id` int(11) default NULL,
  `node_id` int(11) default NULL,
  `appends` text,
  `comments` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '123', '我是谁', '<p>我是谁</p>', '9', '3', '0', '0', '0', '2017-11-10 00:17:46', '2017-11-10 00:19:15', '2', '1', '1', '1,2,3');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(64) default NULL,
  `password_hash` varchar(128) default NULL,
  `email` varchar(64) default NULL,
  `is_superuser` tinyint(1) default NULL,
  `is_password_reset_link_valid` tinyint(1) default NULL,
  `deleted` tinyint(1) default NULL,
  `website` varchar(64) default NULL,
  `avatar_url` varchar(64) default NULL,
  `last_login` datetime default NULL,
  `date_joined` datetime default NULL,
  `topics` text,
  `comments` text,
  `unread_notify` text,
  `read_notify` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `ix_users_email` (`email`),
  UNIQUE KEY `ix_users_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '123', 'pbkdf2:sha1:1000$LfpixMVZ$324ef04af612a638f19445485cd318fd902e49a5', '123@qq.com', '1', '1', '0', null, 'http://www.gravatar.com/avatar/', '2018-04-15 19:32:01', '2017-11-09 16:09:08', '', '', '', '');
INSERT INTO `users` VALUES ('2', '11111', 'pbkdf2:sha1:1000$sXfRJ1RP$dedaf7355e6f29d4593d3ecfc9038d52302c5c36', '1291023320@qq.com', '0', '1', '0', null, 'http://www.gravatar.com/avatar/', '2017-11-10 00:14:40', '2017-11-09 16:10:50', '1', '1,2,3', '2,1', '');
INSERT INTO `users` VALUES ('3', '1581277795', 'pbkdf2:sha1:1000$nSjsp5pv$a4047fa56d4a604561baeefe87c8e5b8b669b315', '1581277795@qq.com', '0', '1', '0', null, '/static/upload/3.png?t=1523792098.95', '2018-04-15 11:33:27', '2018-04-15 11:33:27', '', '', '', '');
