-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 10 月 29 日 08:25
-- 服务器版本: 5.6.11-log
-- PHP 版本: 5.4.0beta2-dev

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `openfire`
--
CREATE DATABASE IF NOT EXISTS `openfire` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `openfire`;

-- --------------------------------------------------------

--
-- 表的结构 `archiveconversations`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `archiveconversations`;
CREATE TABLE IF NOT EXISTS `archiveconversations` (
  `conversationId` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `endTime` bigint(20) NOT NULL,
  `ownerJid` varchar(255) NOT NULL,
  `ownerResource` varchar(255) DEFAULT NULL,
  `withJid` varchar(255) NOT NULL,
  `withResource` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `thread` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`conversationId`),
  KEY `idx_archiveConversations_startTime` (`startTime`),
  KEY `idx_archiveConversations_endTime` (`endTime`),
  KEY `idx_archiveConversations_ownerJid` (`ownerJid`),
  KEY `idx_archiveConversations_withJid` (`withJid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `archiveconversations`
--

INSERT INTO `archiveconversations` (`conversationId`, `startTime`, `endTime`, `ownerJid`, `ownerResource`, `withJid`, `withResource`, `subject`, `thread`) VALUES
(1, 1381376779801, 1381376785388, 'xiaoxu@benjiaren.com', 'Spark 2.6.3', '1@benjiaren.com', NULL, NULL, 'gOeh07'),
(2, 1381376806164, 1381376806164, '1@benjiaren.com', NULL, 'admin@benjiaren.com', NULL, NULL, NULL),
(3, 1381376806171, 1381376806177, '1@benjiaren.com', NULL, 'xiaoxu@benjiaren.com', 'Spark 2.6.3', NULL, 'gOeh07');

-- --------------------------------------------------------

--
-- 表的结构 `archivemessages`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `archivemessages`;
CREATE TABLE IF NOT EXISTS `archivemessages` (
  `messageId` bigint(20) NOT NULL,
  `time` bigint(20) NOT NULL,
  `direction` char(4) NOT NULL,
  `type` char(15) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  `conversationId` bigint(20) NOT NULL,
  PRIMARY KEY (`messageId`),
  KEY `idx_archiveMessages_conversationId` (`conversationId`),
  KEY `idx_archiveMessages_time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `archivemessages`
--

INSERT INTO `archivemessages` (`messageId`, `time`, `direction`, `type`, `subject`, `body`, `conversationId`) VALUES
(1, 1381376779801, 'to', 'chat', NULL, 'cese', 1),
(2, 1381376785388, 'to', 'chat', NULL, 'shibushi', 1),
(3, 1381376806164, 'from', 'normal', NULL, 'cese', 2),
(4, 1381376806171, 'from', 'chat', NULL, 'cese', 3),
(5, 1381376806177, 'from', 'chat', NULL, 'shibushi', 3);

-- --------------------------------------------------------

--
-- 表的结构 `archiveparticipants`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `archiveparticipants`;
CREATE TABLE IF NOT EXISTS `archiveparticipants` (
  `participantId` bigint(20) NOT NULL,
  `startTime` bigint(20) NOT NULL,
  `endTime` bigint(20) DEFAULT NULL,
  `jid` varchar(255) NOT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `conversationId` bigint(20) NOT NULL,
  PRIMARY KEY (`participantId`),
  KEY `idx_archiveParticipants_conversationId` (`conversationId`),
  KEY `idx_archiveParticipants_jid` (`jid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `archiveparticipants`
--

INSERT INTO `archiveparticipants` (`participantId`, `startTime`, `endTime`, `jid`, `nick`, `conversationId`) VALUES
(1, 1381376779801, NULL, 'xiaoxu@benjiaren.com', NULL, 1),
(2, 1381376779801, NULL, '1@benjiaren.com', NULL, 1),
(3, 1381376806164, NULL, '1@benjiaren.com', NULL, 2),
(4, 1381376806164, NULL, 'admin@benjiaren.com', NULL, 2),
(5, 1381376806171, NULL, '1@benjiaren.com', NULL, 3),
(6, 1381376806171, NULL, 'xiaoxu@benjiaren.com', NULL, 3);

-- --------------------------------------------------------

--
-- 表的结构 `archiveprefitems`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `archiveprefitems`;
CREATE TABLE IF NOT EXISTS `archiveprefitems` (
  `username` varchar(64) NOT NULL,
  `jid` varchar(255) NOT NULL DEFAULT '',
  `saveMode` int(11) DEFAULT NULL,
  `otrMode` int(11) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`username`,`jid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `archiveprefmethods`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `archiveprefmethods`;
CREATE TABLE IF NOT EXISTS `archiveprefmethods` (
  `username` varchar(64) NOT NULL,
  `methodType` varchar(255) NOT NULL,
  `methodUsage` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`,`methodType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofbookmark`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofbookmark`;
CREATE TABLE IF NOT EXISTS `ofbookmark` (
  `bookmarkID` bigint(20) NOT NULL,
  `bookmarkType` varchar(50) NOT NULL,
  `bookmarkName` varchar(255) NOT NULL,
  `bookmarkValue` varchar(255) NOT NULL,
  `isGlobal` int(11) NOT NULL,
  PRIMARY KEY (`bookmarkID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofbookmarkperm`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofbookmarkperm`;
CREATE TABLE IF NOT EXISTS `ofbookmarkperm` (
  `bookmarkID` bigint(20) NOT NULL,
  `bookmarkType` tinyint(4) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`bookmarkID`,`name`,`bookmarkType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofbookmarkprop`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofbookmarkprop`;
CREATE TABLE IF NOT EXISTS `ofbookmarkprop` (
  `bookmarkID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`bookmarkID`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofcomments`
--
-- 创建时间: 2013 年 10 月 28 日 07:39
--

DROP TABLE IF EXISTS `ofcomments`;
CREATE TABLE IF NOT EXISTS `ofcomments` (
  `created_at` date DEFAULT NULL,
  `ofCommentId` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) DEFAULT NULL,
  `source` varchar(500) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `jiongshiId` int(11) DEFAULT NULL,
  `reply_comment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ofCommentId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ofcomments`
--

INSERT INTO `ofcomments` (`created_at`, `ofCommentId`, `text`, `source`, `username`, `jiongshiId`, `reply_comment`) VALUES
('2013-10-28', 1, 'testpinglin', 'benjiaren', 'xiaoxu', 1, 'comment_reply'),
('2013-10-29', 2, 'dashqwiq', 'benjiaren', 'xiaoxu', 1, 'xiaoxu');

-- --------------------------------------------------------

--
-- 表的结构 `ofextcomponentconf`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofextcomponentconf`;
CREATE TABLE IF NOT EXISTS `ofextcomponentconf` (
  `subdomain` varchar(255) NOT NULL,
  `wildcard` tinyint(4) NOT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `permission` varchar(10) NOT NULL,
  PRIMARY KEY (`subdomain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofgroup`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofgroup`;
CREATE TABLE IF NOT EXISTS `ofgroup` (
  `groupName` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`groupName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofgroupprop`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofgroupprop`;
CREATE TABLE IF NOT EXISTS `ofgroupprop` (
  `groupName` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`groupName`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofgroupuser`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofgroupuser`;
CREATE TABLE IF NOT EXISTS `ofgroupuser` (
  `groupName` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `administrator` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupName`,`username`,`administrator`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofid`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofid`;
CREATE TABLE IF NOT EXISTS `ofid` (
  `idType` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofid`
--

INSERT INTO `ofid` (`idType`, `id`) VALUES
(18, 36),
(19, 31),
(23, 3),
(26, 2),
(25, 43),
(502, 4),
(503, 7),
(501, 6);

-- --------------------------------------------------------

--
-- 表的结构 `ofjiongshi`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 29 日 08:19
--

DROP TABLE IF EXISTS `ofjiongshi`;
CREATE TABLE IF NOT EXISTS `ofjiongshi` (
  `jsid` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `reposts_count` int(11) DEFAULT NULL,
  `comments_count` int(11) DEFAULT NULL,
  `attitudes_count` int(11) DEFAULT NULL,
  `mievel` int(11) DEFAULT NULL,
  `pic_urls` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`jsid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `ofjiongshi`
--

INSERT INTO `ofjiongshi` (`jsid`, `created_at`, `text`, `username`, `longitude`, `latitude`, `reposts_count`, `comments_count`, `attitudes_count`, `mievel`, `pic_urls`) VALUES
(1, '2013-10-28', '111我i博', 'xiaoxu', '10.2222', '21.4232', 0, 2, 4, 0, 'http://,https:///aaa,'),
(2, '2013-10-28', 'texttest', 'xiaoxu', '12.34', '34.23', 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ofmucaffiliation`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofmucaffiliation`;
CREATE TABLE IF NOT EXISTS `ofmucaffiliation` (
  `roomID` bigint(20) NOT NULL,
  `jid` text NOT NULL,
  `affiliation` tinyint(4) NOT NULL,
  PRIMARY KEY (`roomID`,`jid`(70))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofmucconversationlog`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofmucconversationlog`;
CREATE TABLE IF NOT EXISTS `ofmucconversationlog` (
  `roomID` bigint(20) NOT NULL,
  `sender` text NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `logTime` char(15) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  KEY `ofMucConversationLog_time_idx` (`logTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofmucmember`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofmucmember`;
CREATE TABLE IF NOT EXISTS `ofmucmember` (
  `roomID` bigint(20) NOT NULL,
  `jid` text NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `faqentry` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roomID`,`jid`(70))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofmucroom`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofmucroom`;
CREATE TABLE IF NOT EXISTS `ofmucroom` (
  `serviceID` bigint(20) NOT NULL,
  `roomID` bigint(20) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `naturalName` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lockedDate` char(15) NOT NULL,
  `emptyDate` char(15) DEFAULT NULL,
  `canChangeSubject` tinyint(4) NOT NULL,
  `maxUsers` int(11) NOT NULL,
  `publicRoom` tinyint(4) NOT NULL,
  `moderated` tinyint(4) NOT NULL,
  `membersOnly` tinyint(4) NOT NULL,
  `canInvite` tinyint(4) NOT NULL,
  `roomPassword` varchar(50) DEFAULT NULL,
  `canDiscoverJID` tinyint(4) NOT NULL,
  `logEnabled` tinyint(4) NOT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `rolesToBroadcast` tinyint(4) NOT NULL,
  `useReservedNick` tinyint(4) NOT NULL,
  `canChangeNick` tinyint(4) NOT NULL,
  `canRegister` tinyint(4) NOT NULL,
  PRIMARY KEY (`serviceID`,`name`),
  KEY `ofMucRoom_roomid_idx` (`roomID`),
  KEY `ofMucRoom_serviceid_idx` (`serviceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofmucroomprop`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofmucroomprop`;
CREATE TABLE IF NOT EXISTS `ofmucroomprop` (
  `roomID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`roomID`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofmucservice`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofmucservice`;
CREATE TABLE IF NOT EXISTS `ofmucservice` (
  `serviceID` bigint(20) NOT NULL,
  `subdomain` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `isHidden` tinyint(4) NOT NULL,
  PRIMARY KEY (`subdomain`),
  KEY `ofMucService_serviceid_idx` (`serviceID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofmucservice`
--

INSERT INTO `ofmucservice` (`serviceID`, `subdomain`, `description`, `isHidden`) VALUES
(1, 'conference', NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ofmucserviceprop`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofmucserviceprop`;
CREATE TABLE IF NOT EXISTS `ofmucserviceprop` (
  `serviceID` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`serviceID`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofoffline`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofoffline`;
CREATE TABLE IF NOT EXISTS `ofoffline` (
  `username` varchar(64) NOT NULL,
  `messageID` bigint(20) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `messageSize` int(11) NOT NULL,
  `stanza` text NOT NULL,
  PRIMARY KEY (`username`,`messageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofoffline`
--

INSERT INTO `ofoffline` (`username`, `messageID`, `creationDate`, `messageSize`, `stanza`) VALUES
('xiaoxu', 19, '001382078950387', 142, '<message id="m5kJx-7" to="xiaoxu@benjiaren.com" from="1@benjiaren.com/Smack" type="chat"><body>shhsheh</body><thread>3D85d0</thread></message>'),
('xiaoxu', 18, '001382078948729', 141, '<message id="m5kJx-6" to="xiaoxu@benjiaren.com" from="1@benjiaren.com/Smack" type="chat"><body>ggdhdh</body><thread>3D85d0</thread></message>'),
('wd', 7, '001376028511063', 196, '<message id="uR928-48" to="wd@benjiaren.com" from="3@benjiaren.com/Spark 2.6.3" type="chat"><body>nihao </body><thread>AOt9cq</thread><x xmlns="jabber:x:event"><offline/><composing/></x></message>'),
('wd', 26, '001382539467488', 132, '<message id="8uq43-7" to="wd@benjiaren.com" from="3@benjiaren.com/Smack" type="chat"><body>上</body><thread>tqQ9U0</thread></message>'),
('wd', 27, '001382539473791', 140, '<message id="8uq43-8" to="wd@benjiaren.com" from="3@benjiaren.com/Smack" type="chat"><body>111411111</body><thread>tqQ9U0</thread></message>'),
('wd', 24, '001382313368148', 134, '<message id="bc5jJ-6" to="wd@benjiaren.com" from="1@benjiaren.com/Smack" type="chat"><body>KTV</body><thread>RmMS51</thread></message>'),
('wd', 29, '001382539576997', 168, '<message id="5E7n1-8" to="wd@benjiaren.com" from="1@benjiaren.com/Smack" type="chat"><body>[优雅],点击[ http://pinyin.cn/e1493 ]查看表情</body><thread>p1t9R0</thread></message>'),
('xiaoxu', 30, '001382539628099', 137, '<message id="5E7n1-17" to="xiaoxu@benjiaren.com" from="1@benjiaren.com/Smack" type="chat"><body>替</body><thread>p1t9R2</thread></message>');

-- --------------------------------------------------------

--
-- 表的结构 `ofpfrules`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofpfrules`;
CREATE TABLE IF NOT EXISTS `ofpfrules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ruleorder` bigint(20) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `tojid` varchar(255) DEFAULT NULL,
  `fromjid` varchar(255) DEFAULT NULL,
  `rulef` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT NULL,
  `log` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sourcetype` varchar(255) DEFAULT NULL,
  `desttype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ofpresence`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofpresence`;
CREATE TABLE IF NOT EXISTS `ofpresence` (
  `username` varchar(64) NOT NULL,
  `offlinePresence` text,
  `offlineDate` char(15) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofpresence`
--

INSERT INTO `ofpresence` (`username`, `offlinePresence`, `offlineDate`) VALUES
('2', NULL, '001381995907970'),
('xiaoxu', NULL, '001381376792040'),
('wd', NULL, '001376028479252'),
('xiaoyuan', NULL, '001382496429957'),
('3', NULL, '001382539500727'),
('admin', NULL, '001378717130023'),
('1', NULL, '001382539638101'),
('123', NULL, '001382539725498');

-- --------------------------------------------------------

--
-- 表的结构 `ofprivacylist`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofprivacylist`;
CREATE TABLE IF NOT EXISTS `ofprivacylist` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `isDefault` tinyint(4) NOT NULL,
  `list` text NOT NULL,
  PRIMARY KEY (`username`,`name`),
  KEY `ofPrivacyList_default_idx` (`username`,`isDefault`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofprivate`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofprivate`;
CREATE TABLE IF NOT EXISTS `ofprivate` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `namespace` varchar(200) NOT NULL,
  `privateData` text NOT NULL,
  PRIMARY KEY (`username`,`name`,`namespace`(100))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofproperty`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 10:49
--

DROP TABLE IF EXISTS `ofproperty`;
CREATE TABLE IF NOT EXISTS `ofproperty` (
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofproperty`
--

INSERT INTO `ofproperty` (`name`, `propValue`) VALUES
('xmpp.session.conflict-limit', '0'),
('update.lastCheck', '1382791996255'),
('xmpp.domain', 'benjiaren.com'),
('xmpp.jmx.enabled', 'false'),
('xmpp.jmx.secure', 'true'),
('xmpp.jmx.port', '1099'),
('passwordKey', 'kb0cVVMf821LjH4'),
('plugin.motd.enabled', 'false'),
('plugin.motd.subject', '欢迎回来'),
('plugin.motd.message', '欢迎回来'),
('admin.authorizedJIDs', 'admin@benjiaren.com,xiaoyuan@benjiaren.com,fendou@benjiaren.com,wd@benjiaren.com,1@benjiaren.com,2@benjiaren.com'),
('archive.enabled', 'false'),
('mediaproxy.idleTimeout', '60000'),
('mediaproxy.lifetime', '9000'),
('mediaproxy.enabled', 'true'),
('mediaproxy.portMin', '10000'),
('mediaproxy.portMax', '20000'),
('mediaproxy.echoPort', '10020'),
('httpbind.CORS.enabled', 'true'),
('httpbind.CORS.domains', '*'),
('httpbind.forwarded.enabled', 'false'),
('xmpp.httpbind.scriptSyntax.enabled', 'true'),
('httpbind.enabled', 'true'),
('plugin.userservice.secret', 'myN91xWE'),
('xmpp.filetransfer.enabled', 'true');

-- --------------------------------------------------------

--
-- 表的结构 `ofpubsubaffiliation`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofpubsubaffiliation`;
CREATE TABLE IF NOT EXISTS `ofpubsubaffiliation` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `affiliation` varchar(10) NOT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofpubsubaffiliation`
--

INSERT INTO `ofpubsubaffiliation` (`serviceID`, `nodeID`, `jid`, `affiliation`) VALUES
('pubsub', '', '127.0.0.1', 'owner');

-- --------------------------------------------------------

--
-- 表的结构 `ofpubsubdefaultconf`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofpubsubdefaultconf`;
CREATE TABLE IF NOT EXISTS `ofpubsubdefaultconf` (
  `serviceID` varchar(100) NOT NULL,
  `leaf` tinyint(4) NOT NULL,
  `deliverPayloads` tinyint(4) NOT NULL,
  `maxPayloadSize` int(11) NOT NULL,
  `persistItems` tinyint(4) NOT NULL,
  `maxItems` int(11) NOT NULL,
  `notifyConfigChanges` tinyint(4) NOT NULL,
  `notifyDelete` tinyint(4) NOT NULL,
  `notifyRetract` tinyint(4) NOT NULL,
  `presenceBased` tinyint(4) NOT NULL,
  `sendItemSubscribe` tinyint(4) NOT NULL,
  `publisherModel` varchar(15) NOT NULL,
  `subscriptionEnabled` tinyint(4) NOT NULL,
  `accessModel` varchar(10) NOT NULL,
  `language` varchar(255) DEFAULT NULL,
  `replyPolicy` varchar(15) DEFAULT NULL,
  `associationPolicy` varchar(15) NOT NULL,
  `maxLeafNodes` int(11) NOT NULL,
  PRIMARY KEY (`serviceID`,`leaf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofpubsubdefaultconf`
--

INSERT INTO `ofpubsubdefaultconf` (`serviceID`, `leaf`, `deliverPayloads`, `maxPayloadSize`, `persistItems`, `maxItems`, `notifyConfigChanges`, `notifyDelete`, `notifyRetract`, `presenceBased`, `sendItemSubscribe`, `publisherModel`, `subscriptionEnabled`, `accessModel`, `language`, `replyPolicy`, `associationPolicy`, `maxLeafNodes`) VALUES
('pubsub', 1, 1, 5120, 0, -1, 1, 1, 1, 0, 1, 'publishers', 1, 'open', 'English', NULL, 'all', -1),
('pubsub', 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 'publishers', 1, 'open', 'English', NULL, 'all', -1);

-- --------------------------------------------------------

--
-- 表的结构 `ofpubsubitem`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofpubsubitem`;
CREATE TABLE IF NOT EXISTS `ofpubsubitem` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `payload` mediumtext,
  PRIMARY KEY (`serviceID`,`nodeID`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofpubsubnode`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofpubsubnode`;
CREATE TABLE IF NOT EXISTS `ofpubsubnode` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `leaf` tinyint(4) NOT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `deliverPayloads` tinyint(4) NOT NULL,
  `maxPayloadSize` int(11) DEFAULT NULL,
  `persistItems` tinyint(4) DEFAULT NULL,
  `maxItems` int(11) DEFAULT NULL,
  `notifyConfigChanges` tinyint(4) NOT NULL,
  `notifyDelete` tinyint(4) NOT NULL,
  `notifyRetract` tinyint(4) NOT NULL,
  `presenceBased` tinyint(4) NOT NULL,
  `sendItemSubscribe` tinyint(4) NOT NULL,
  `publisherModel` varchar(15) NOT NULL,
  `subscriptionEnabled` tinyint(4) NOT NULL,
  `configSubscription` tinyint(4) NOT NULL,
  `accessModel` varchar(10) NOT NULL,
  `payloadType` varchar(100) DEFAULT NULL,
  `bodyXSLT` varchar(100) DEFAULT NULL,
  `dataformXSLT` varchar(100) DEFAULT NULL,
  `creator` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `replyPolicy` varchar(15) DEFAULT NULL,
  `associationPolicy` varchar(15) DEFAULT NULL,
  `maxLeafNodes` int(11) DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofpubsubnode`
--

INSERT INTO `ofpubsubnode` (`serviceID`, `nodeID`, `leaf`, `creationDate`, `modificationDate`, `parent`, `deliverPayloads`, `maxPayloadSize`, `persistItems`, `maxItems`, `notifyConfigChanges`, `notifyDelete`, `notifyRetract`, `presenceBased`, `sendItemSubscribe`, `publisherModel`, `subscriptionEnabled`, `configSubscription`, `accessModel`, `payloadType`, `bodyXSLT`, `dataformXSLT`, `creator`, `description`, `language`, `name`, `replyPolicy`, `associationPolicy`, `maxLeafNodes`) VALUES
('pubsub', '', 0, '001371211774787', '001371211774787', NULL, 0, 0, 0, 0, 1, 1, 1, 0, 0, 'publishers', 1, 0, 'open', '', '', '', '127.0.0.1', '', 'English', '', NULL, 'all', -1);

-- --------------------------------------------------------

--
-- 表的结构 `ofpubsubnodegroups`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofpubsubnodegroups`;
CREATE TABLE IF NOT EXISTS `ofpubsubnodegroups` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `rosterGroup` varchar(100) NOT NULL,
  KEY `ofPubsubNodeGroups_idx` (`serviceID`,`nodeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofpubsubnodejids`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofpubsubnodejids`;
CREATE TABLE IF NOT EXISTS `ofpubsubnodejids` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `associationType` varchar(20) NOT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`jid`(70))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofpubsubsubscription`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofpubsubsubscription`;
CREATE TABLE IF NOT EXISTS `ofpubsubsubscription` (
  `serviceID` varchar(100) NOT NULL,
  `nodeID` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `jid` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `state` varchar(15) NOT NULL,
  `deliver` tinyint(4) NOT NULL,
  `digest` tinyint(4) NOT NULL,
  `digest_frequency` int(11) NOT NULL,
  `expire` char(15) DEFAULT NULL,
  `includeBody` tinyint(4) NOT NULL,
  `showValues` varchar(30) DEFAULT NULL,
  `subscriptionType` varchar(10) NOT NULL,
  `subscriptionDepth` tinyint(4) NOT NULL,
  `keyword` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`serviceID`,`nodeID`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofremoteserverconf`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofremoteserverconf`;
CREATE TABLE IF NOT EXISTS `ofremoteserverconf` (
  `xmppDomain` varchar(255) NOT NULL,
  `remotePort` int(11) DEFAULT NULL,
  `permission` varchar(10) NOT NULL,
  PRIMARY KEY (`xmppDomain`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofroster`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofroster`;
CREATE TABLE IF NOT EXISTS `ofroster` (
  `rosterID` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `jid` varchar(1024) NOT NULL,
  `sub` tinyint(4) NOT NULL,
  `ask` tinyint(4) NOT NULL,
  `recv` tinyint(4) NOT NULL,
  `nick` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rosterID`),
  KEY `ofRoster_unameid_idx` (`username`),
  KEY `ofRoster_jid_idx` (`jid`(333))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofroster`
--

INSERT INTO `ofroster` (`rosterID`, `username`, `jid`, `sub`, `ask`, `recv`, `nick`) VALUES
(1, 'xiaoxu', 'admin@benjiaren.com', 3, -1, -1, 'admin'),
(2, 'admin', 'xiaoxu@benjiaren.com', 3, -1, -1, 'xiaoxu'),
(34, '1', '3@benjiaren.com', 3, -1, -1, '3'),
(35, '3', '1@benjiaren.com', 3, -1, -1, '1'),
(5, 'xiaoxu', 'xiaoyuan@benjiaren.com', 3, -1, -1, 'xiaoyuan'),
(6, 'xiaoyuan', 'xiaoxu@benjiaren.com', 3, -1, -1, 'xiaoxu'),
(21, '3', 'wd@benjiaren.com', 3, -1, -1, 'wd'),
(22, 'wd', '3@benjiaren.com', 3, -1, -1, '3'),
(9, '1', 'wd@benjiaren.com', 3, -1, -1, 'wd'),
(10, 'wd', '1@benjiaren.com', 3, -1, -1, NULL),
(14, 'wd', '2@benjiaren.com', 2, -1, -1, NULL),
(13, '2', 'wd@benjiaren.com', 1, -1, -1, 'wd'),
(25, 'xiaoyuan', '1@benjiaren.com', 3, -1, -1, '1'),
(26, '1', 'xiaoyuan@benjiaren.com', 3, -1, -1, NULL),
(27, 'xiaoxu', '1@benjiaren.com', 3, -1, -1, '1'),
(28, '1', 'xiaoxu@benjiaren.com', 3, -1, -1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ofrostergroups`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofrostergroups`;
CREATE TABLE IF NOT EXISTS `ofrostergroups` (
  `rosterID` bigint(20) NOT NULL,
  `rank` tinyint(4) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY (`rosterID`,`rank`),
  KEY `ofRosterGroup_rosterid_idx` (`rosterID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofrostergroups`
--

INSERT INTO `ofrostergroups` (`rosterID`, `rank`, `groupName`) VALUES
(1, 0, 'Friends'),
(2, 0, 'Friends'),
(34, 0, '我的好友'),
(5, 0, 'Friends'),
(6, 0, 'Friends'),
(22, 0, '我的好友'),
(9, 0, 'Friends'),
(10, 0, '我的好友'),
(21, 0, 'Friends'),
(13, 0, 'Friends'),
(25, 0, 'Friends'),
(26, 0, '我的好友'),
(27, 0, 'Friends'),
(28, 0, '我的好友'),
(35, 0, 'Friends');

-- --------------------------------------------------------

--
-- 表的结构 `ofsaslauthorized`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofsaslauthorized`;
CREATE TABLE IF NOT EXISTS `ofsaslauthorized` (
  `username` varchar(64) NOT NULL,
  `principal` text NOT NULL,
  PRIMARY KEY (`username`,`principal`(200))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofsecurityauditlog`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofsecurityauditlog`;
CREATE TABLE IF NOT EXISTS `ofsecurityauditlog` (
  `msgID` bigint(20) NOT NULL,
  `username` varchar(64) NOT NULL,
  `entryStamp` bigint(20) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `node` varchar(255) NOT NULL,
  `details` text,
  PRIMARY KEY (`msgID`),
  KEY `ofSecurityAuditLog_tstamp_idx` (`entryStamp`),
  KEY `ofSecurityAuditLog_uname_idx` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofuser`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofuser`;
CREATE TABLE IF NOT EXISTS `ofuser` (
  `username` varchar(64) NOT NULL,
  `plainPassword` varchar(32) DEFAULT NULL,
  `encryptedPassword` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creationDate` char(15) NOT NULL,
  `modificationDate` char(15) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `ofUser_cDate_idx` (`creationDate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofuser`
--

INSERT INTO `ofuser` (`username`, `plainPassword`, `encryptedPassword`, `name`, `email`, `creationDate`, `modificationDate`) VALUES
('admin', NULL, 'c5468b4defe144a1a7772fe56215b2543f216e13c0a21e95ebeb6a4283dd4a19429501454273a454', 'xiaoxu', 'xu@benjiaren.com', '0', '0'),
('xiaoxu', NULL, '927fe0a512d252b55a32e5b928e48726fb4ac7e758b9b74e3f8696115ebb8475', NULL, NULL, '001371212536487', '001371212536487'),
('123', NULL, '7fd015743bea6d65179e5f54e24d8ae4', '123', '122966629', '001382539689905', '001382539689905'),
('xiaoyuan', NULL, '6f9608364ec4509a98514179b1452efb1618a1d03b0a56da401ab51a46f8d2fe', '校园', NULL, '001375868373233', '001375868373233'),
('wd', NULL, 'd8f3421955129f8a4cd5ce542fca4c40', 'wd', 'wd', '001375884136552', '001375884136552'),
('1', NULL, 'bea0300de75b35b3f2f2d2138a179c29', '1', NULL, '001375956966660', '001375956966660'),
('2', NULL, 'ab40bd8f7fbbef80af33fd32d99f4a07', '2', NULL, '001375956982447', '001375956982447'),
('3', NULL, '89e4d2b875ddfdb50740bb517a747f64', '3', NULL, '001376024339184', '001376024339184');

-- --------------------------------------------------------

--
-- 表的结构 `ofuserflag`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofuserflag`;
CREATE TABLE IF NOT EXISTS `ofuserflag` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `startTime` char(15) DEFAULT NULL,
  `endTime` char(15) DEFAULT NULL,
  PRIMARY KEY (`username`,`name`),
  KEY `ofUserFlag_sTime_idx` (`startTime`),
  KEY `ofUserFlag_eTime_idx` (`endTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofuserprop`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofuserprop`;
CREATE TABLE IF NOT EXISTS `ofuserprop` (
  `username` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL,
  `propValue` text NOT NULL,
  PRIMARY KEY (`username`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofvcard`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:16
--

DROP TABLE IF EXISTS `ofvcard`;
CREATE TABLE IF NOT EXISTS `ofvcard` (
  `username` varchar(64) NOT NULL,
  `vcard` mediumtext NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ofversion`
--
-- 创建时间: 2013 年 10 月 28 日 03:16
-- 最后更新: 2013 年 10 月 28 日 03:17
--

DROP TABLE IF EXISTS `ofversion`;
CREATE TABLE IF NOT EXISTS `ofversion` (
  `name` varchar(50) NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ofversion`
--

INSERT INTO `ofversion` (`name`, `version`) VALUES
('openfire', 21),
('packetfilter', 2),
('archive', 2),
('clientcontrol', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
