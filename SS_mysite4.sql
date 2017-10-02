-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2017 at 04:30 PM
-- Server version: 5.6.17-log
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `SS_mysite4`
--

-- --------------------------------------------------------

--
-- Table structure for table `AltMode`
--

CREATE TABLE IF NOT EXISTS `AltMode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('AltMode') DEFAULT 'AltMode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Terrain` enum('Space','Land','Sea','Air') DEFAULT 'Land',
  `Fashion` enum('Futuristic','Alien','Contemporary','Retro','Ancient') DEFAULT 'Contemporary',
  `Type` enum('Vehicle','Creature','Base','Weapon') DEFAULT 'Vehicle',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `AltMode`
--

INSERT INTO `AltMode` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Terrain`, `Fashion`, `Type`) VALUES
(1, 'AltMode', '2017-09-23 15:31:59', '2017-09-23 15:31:59', 'Truck', 'Land', 'Contemporary', 'Vehicle'),
(2, 'AltMode', '2017-09-23 15:34:34', '2017-09-23 15:34:34', 'Fighter Jet', 'Air', 'Contemporary', 'Vehicle'),
(3, 'AltMode', '2017-09-24 13:15:44', '2017-09-23 16:09:47', 'City', 'Land', 'Contemporary', 'Base'),
(4, 'AltMode', '2017-09-24 13:15:57', '2017-09-23 16:12:43', 'Battle Station', 'Land', 'Futuristic', 'Base'),
(5, 'AltMode', '2017-09-23 15:34:34', '2017-09-23 15:34:34', 'VTOL Jet', 'Air', 'Futuristic', 'Vehicle'),
(6, 'AltMode', '2017-09-24 13:15:22', '2017-09-24 12:28:12', 'Dinosaur', 'Land', 'Ancient', 'Creature'),
(7, 'AltMode', '2017-09-24 17:07:51', '2017-09-24 17:06:11', 'Gun', 'Land', 'Contemporary', 'Vehicle'),
(8, 'AltMode', '2017-09-24 17:59:17', '2017-09-24 17:13:55', 'Small truck / SUV', 'Land', 'Contemporary', 'Vehicle'),
(9, 'AltMode', '2017-09-24 17:23:21', '2017-09-24 17:23:21', 'Racing Car', 'Land', 'Contemporary', 'Vehicle'),
(10, 'AltMode', '2017-09-24 17:31:06', '2017-09-24 17:31:06', 'Fighter Craft', 'Space', 'Contemporary', 'Vehicle'),
(11, 'AltMode', '2017-09-24 17:51:35', '2017-09-24 17:51:35', 'Surveillance', 'Space', 'Contemporary', 'Base'),
(12, 'AltMode', '2017-09-24 17:59:50', '2017-09-24 17:55:14', 'Small Car', 'Land', 'Contemporary', 'Vehicle'),
(13, 'AltMode', '2017-09-24 18:06:51', '2017-09-24 18:06:51', 'Sports Car', 'Land', 'Contemporary', 'Vehicle'),
(14, 'AltMode', '2017-09-24 18:13:57', '2017-09-24 18:13:57', 'Motorcycle', 'Land', 'Contemporary', 'Vehicle'),
(15, 'AltMode', '2017-09-24 18:16:01', '2017-09-24 18:16:01', 'Tank', 'Land', 'Contemporary', 'Vehicle'),
(16, 'AltMode', '2017-09-25 00:21:04', '2017-09-25 00:20:54', 'Military Transport', 'Land', 'Contemporary', 'Vehicle'),
(17, 'AltMode', '2017-09-25 00:28:23', '2017-09-25 00:28:23', 'Nautical', 'Sea', 'Contemporary', 'Vehicle'),
(18, 'AltMode', '2017-09-27 15:33:52', '2017-09-27 15:33:52', 'Buggy/Offroad', 'Land', 'Contemporary', 'Vehicle'),
(19, 'AltMode', '2017-09-29 16:40:00', '2017-09-29 16:39:15', 'Metallic Bird', 'Air', 'Contemporary', 'Creature'),
(20, 'AltMode', '2017-09-29 16:52:53', '2017-09-29 16:52:53', 'Monster', 'Land', 'Contemporary', 'Creature');

-- --------------------------------------------------------

--
-- Table structure for table `BotGroup`
--

CREATE TABLE IF NOT EXISTS `BotGroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('BotGroup') DEFAULT 'BotGroup',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `aTitle` varchar(255) DEFAULT NULL,
  `dTitle` varchar(255) DEFAULT NULL,
  `CollectionID` int(11) NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `CollectionID` (`CollectionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `BotGroup`
--

INSERT INTO `BotGroup` (`ID`, `ClassName`, `LastEdited`, `Created`, `aTitle`, `dTitle`, `CollectionID`, `Sort`) VALUES
(1, 'BotGroup', '2017-10-02 04:06:42', '2017-10-01 02:09:06', 'Burners', 'Seekers', 1, 0),
(2, 'BotGroup', '2017-10-02 04:06:52', '2017-10-02 03:45:21', 'The Chosen', 'The Tyrants', 1, 0),
(3, 'BotGroup', '2017-10-02 14:44:43', '2017-10-02 03:47:17', 'AirBenders', 'RainMakers', 1, 0),
(4, 'BotGroup', '2017-10-02 04:06:47', '2017-10-02 03:49:07', 'Racers', 'Crashers', 1, 0),
(5, 'BotGroup', '2017-10-02 04:06:45', '2017-10-02 03:50:25', 'Protectors', 'Enforcers', 1, 0),
(6, 'BotGroup', '2017-10-02 14:30:39', '2017-10-02 04:01:52', 'Trackers', 'Stalkers', 1, 0),
(7, 'BotGroup', '2017-10-02 15:32:16', '2017-10-02 04:08:24', 'Beasts', 'Mutants', 1, 0),
(8, 'BotGroup', '2017-10-02 04:15:31', '2017-10-02 04:15:31', 'Observers', 'Invaders', 1, 0),
(9, 'BotGroup', '2017-10-02 04:49:42', '2017-10-02 04:48:08', 'Haulers', 'Looters', 1, 0),
(10, 'BotGroup', '2017-10-02 04:56:53', '2017-10-02 04:52:56', 'HotWheels', 'HellRiders', 1, 0),
(11, 'BotGroup', '2017-10-02 05:03:11', '2017-10-02 04:57:42', 'Deployers', 'Breachers', 1, 0),
(12, 'BotGroup', '2017-10-02 05:07:23', '2017-10-02 05:04:58', 'Rescuers', 'Plunderers', 1, 0),
(13, 'BotGroup', '2017-10-02 05:33:05', '2017-10-02 05:13:55', 'Luxury', 'Decadence', 1, 0),
(14, 'BotGroup', '2017-10-02 05:25:46', '2017-10-02 05:24:37', 'Boomers', 'Blitzers', 1, 0),
(15, 'BotGroup', '2017-10-02 05:27:36', '2017-10-02 05:26:57', 'Street', 'Ghetto', 1, 0),
(16, 'BotGroup', '2017-10-02 06:08:10', '2017-10-02 05:35:17', 'Cyberships', 'Dystopions', 1, 0),
(17, 'BotGroup', '2017-10-02 15:39:55', '2017-10-02 05:50:44', 'Valiant', 'Sinister', 1, 0),
(18, 'BotGroup', '2017-10-02 15:44:17', '2017-10-02 05:56:28', 'BodyGuards', 'BountyHunters', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `BotGroup_Characters`
--

CREATE TABLE IF NOT EXISTS `BotGroup_Characters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BotGroupID` int(11) NOT NULL DEFAULT '0',
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `BotGroupID` (`BotGroupID`),
  KEY `CharacterID` (`CharacterID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=139 ;

--
-- Dumping data for table `BotGroup_Characters`
--

INSERT INTO `BotGroup_Characters` (`ID`, `BotGroupID`, `CharacterID`) VALUES
(1, 1, 63),
(2, 1, 29),
(3, 1, 85),
(4, 1, 72),
(5, 1, 4),
(6, 1, 28),
(7, 2, 13),
(8, 2, 43),
(9, 2, 66),
(10, 2, 1),
(11, 2, 68),
(12, 2, 94),
(13, 3, 8),
(14, 3, 79),
(15, 3, 5),
(16, 3, 100),
(17, 3, 101),
(18, 3, 31),
(19, 4, 18),
(20, 4, 19),
(21, 4, 24),
(22, 4, 16),
(23, 4, 15),
(24, 4, 52),
(25, 5, 44),
(26, 5, 46),
(27, 5, 57),
(28, 5, 48),
(29, 5, 55),
(30, 5, 45),
(31, 6, 33),
(32, 6, 144),
(33, 6, 97),
(37, 6, 36),
(46, 8, 54),
(47, 8, 51),
(49, 8, 20),
(50, 8, 17),
(51, 8, 30),
(52, 9, 42),
(53, 9, 3),
(54, 9, 2),
(55, 9, 77),
(56, 9, 14),
(58, 10, 90),
(59, 10, 25),
(61, 10, 92),
(63, 10, 95),
(64, 11, 50),
(65, 11, 49),
(66, 11, 86),
(67, 11, 65),
(69, 12, 67),
(70, 12, 80),
(71, 12, 93),
(72, 12, 75),
(73, 12, 81),
(74, 12, 69),
(75, 13, 88),
(76, 13, 83),
(77, 13, 98),
(79, 13, 41),
(82, 14, 34),
(83, 14, 37),
(84, 14, 27),
(85, 14, 71),
(87, 14, 91),
(88, 14, 61),
(89, 15, 53),
(90, 15, 26),
(91, 15, 39),
(92, 15, 96),
(94, 15, 21),
(95, 15, 22),
(96, 13, 78),
(97, 16, 59),
(98, 16, 38),
(99, 9, 64),
(103, 16, 104),
(106, 17, 105),
(108, 7, 142),
(109, 17, 143),
(110, 17, 70),
(112, 18, 32),
(113, 18, 76),
(114, 18, 40),
(115, 18, 102),
(117, 17, 84),
(119, 7, 10),
(120, 7, 82),
(123, 6, 23),
(124, 11, 35),
(125, 11, 58),
(126, 6, 89),
(129, 17, 47),
(130, 17, 73),
(131, 7, 141),
(132, 18, 74),
(133, 18, 99),
(134, 10, 9),
(135, 10, 11),
(136, 13, 108),
(137, 8, 62),
(138, 16, 87);

-- --------------------------------------------------------

--
-- Table structure for table `BotTeam`
--

CREATE TABLE IF NOT EXISTS `BotTeam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('BotTeam') DEFAULT 'BotTeam',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `LeaderID` int(11) NOT NULL DEFAULT '0',
  `GestaltID` int(11) NOT NULL DEFAULT '0',
  `Gestalt` varchar(255) DEFAULT NULL,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `LeaderID` (`LeaderID`),
  KEY `GestaltID` (`GestaltID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `BotTeam`
--

INSERT INTO `BotTeam` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `LeaderID`, `GestaltID`, `Gestalt`, `ImageID`) VALUES
(1, 'BotTeam', '2017-09-23 16:02:00', '2017-09-23 15:44:41', 'Seekers', 4, 0, NULL, 0),
(2, 'BotTeam', '2017-09-30 12:03:37', '2017-09-23 15:46:38', 'Aerialbots', 6, 9, 'Superion', 0),
(3, 'BotTeam', '2017-09-30 12:44:47', '2017-09-24 12:27:17', 'Dinobots', 10, 0, 'Volcanicus', 0),
(4, 'BotTeam', '2017-09-30 12:03:51', '2017-09-24 16:23:09', 'Stunticons', 12, 11, 'Menasor', 0),
(5, 'BotTeam', '2017-09-25 00:10:58', '2017-09-25 00:08:21', 'Rainmakers', 31, 0, NULL, 0),
(6, 'BotTeam', '2017-09-30 12:04:01', '2017-09-27 15:38:54', 'Combaticons', 107, 108, 'Bruticus', 0),
(7, 'BotTeam', '2017-09-30 15:32:33', '2017-09-30 12:08:06', 'Coneheads', 111, 0, NULL, 0),
(8, 'BotTeam', '2017-09-30 12:12:31', '2017-09-30 12:11:55', 'ProtectorBots', 69, 0, 'Defensor', 0),
(9, 'BotTeam', '2017-09-30 12:16:59', '2017-09-30 12:16:16', 'Constructicons', 81, 0, 'Devastator', 0),
(10, 'BotTeam', '2017-09-30 12:46:26', '2017-09-30 12:22:31', 'Technobots', 125, 0, 'Computron', 0),
(11, 'BotTeam', '2017-09-30 12:49:31', '2017-09-30 12:26:01', 'Terrorcons', 70, 0, 'Abominus', 0),
(12, 'BotTeam', '2017-09-30 12:26:37', '2017-09-30 12:26:37', 'Predacons', 0, 0, 'Predaking', 0),
(13, 'BotTeam', '2017-09-30 15:26:32', '2017-09-30 12:37:56', 'FateDealers', 135, 0, 'Megatronia', 0),
(14, 'BotTeam', '2017-09-30 15:26:48', '2017-09-30 12:38:14', 'TorchBearers', 130, 0, 'Victorion', 0);

-- --------------------------------------------------------

--
-- Table structure for table `BotTeam_Characters`
--

CREATE TABLE IF NOT EXISTS `BotTeam_Characters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BotTeamID` int(11) NOT NULL DEFAULT '0',
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `BotTeamID` (`BotTeamID`),
  KEY `CharacterID` (`CharacterID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `BotTeam_Characters`
--

INSERT INTO `BotTeam_Characters` (`ID`, `BotTeamID`, `CharacterID`) VALUES
(1, 1, 4),
(2, 2, 5),
(3, 2, 6),
(4, 3, 10),
(5, 4, 12),
(6, 4, 15),
(7, 4, 16),
(8, 1, 28),
(9, 1, 29),
(11, 5, 31),
(12, 6, 36),
(13, 6, 37),
(14, 2, 106),
(15, 6, 107),
(16, 7, 109),
(17, 7, 110),
(18, 7, 111),
(19, 8, 69),
(20, 8, 112),
(21, 8, 113),
(22, 8, 114),
(23, 8, 115),
(24, 9, 81),
(25, 9, 50),
(26, 9, 116),
(27, 9, 117),
(28, 9, 75),
(29, 9, 118),
(30, 2, 63),
(31, 2, 119),
(32, 3, 120),
(33, 3, 121),
(34, 3, 122),
(35, 3, 123),
(36, 10, 87),
(37, 10, 124),
(38, 10, 125),
(39, 10, 126),
(40, 10, 127),
(41, 4, 128),
(42, 4, 52),
(43, 6, 49),
(44, 6, 129),
(45, 11, 70),
(46, 11, 84),
(47, 14, 130),
(48, 14, 131),
(49, 14, 132),
(50, 14, 133),
(51, 14, 134),
(52, 13, 135),
(53, 13, 136),
(54, 13, 137),
(55, 13, 138),
(56, 13, 139),
(57, 11, 141),
(58, 11, 142),
(59, 11, 143),
(60, 5, 100),
(61, 5, 101);

-- --------------------------------------------------------

--
-- Table structure for table `ChangeSet`
--

CREATE TABLE IF NOT EXISTS `ChangeSet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Versioned\\ChangeSet') DEFAULT 'SilverStripe\\Versioned\\ChangeSet',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `State` enum('open','published','reverted') DEFAULT 'open',
  `IsInferred` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Description` mediumtext,
  `PublishDate` datetime DEFAULT NULL,
  `LastSynced` datetime DEFAULT NULL,
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `OwnerID` (`OwnerID`),
  KEY `PublisherID` (`PublisherID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ChangeSet`
--

INSERT INTO `ChangeSet` (`ID`, `ClassName`, `LastEdited`, `Created`, `Name`, `State`, `IsInferred`, `Description`, `PublishDate`, `LastSynced`, `OwnerID`, `PublisherID`) VALUES
(1, 'SilverStripe\\Versioned\\ChangeSet', '2017-09-23 15:00:20', '2017-09-23 15:00:20', 'Generated by publish of ''Page not found'' at 23 Sep 2017, 15:00:20', 'published', 1, NULL, '2017-09-23 15:00:20', '2017-09-23 15:00:20', 0, 1),
(2, 'SilverStripe\\Versioned\\ChangeSet', '2017-09-23 15:00:24', '2017-09-23 15:00:24', 'Generated by publish of ''Server error'' at 23 Sep 2017, 15:00:24', 'published', 1, NULL, '2017-09-23 15:00:24', '2017-09-23 15:00:24', 0, 1),
(3, 'SilverStripe\\Versioned\\ChangeSet', '2017-09-29 17:10:22', '2017-09-29 17:10:21', 'Generated by publish of ''optimus prime by radimusprime'' at 29 Sep 2017, 17:10:21', 'published', 1, NULL, '2017-09-29 17:10:22', '2017-09-29 17:10:21', 0, 1),
(4, 'SilverStripe\\Versioned\\ChangeSet', '2017-10-01 01:17:25', '2017-10-01 01:17:25', 'Generated by publish of ''New Page'' at 1 Oct 2017, 01:17:25', 'published', 1, NULL, '2017-10-01 01:17:25', '2017-10-01 01:17:25', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ChangeSetItem`
--

CREATE TABLE IF NOT EXISTS `ChangeSetItem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Versioned\\ChangeSetItem') DEFAULT 'SilverStripe\\Versioned\\ChangeSetItem',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `VersionBefore` int(11) NOT NULL DEFAULT '0',
  `VersionAfter` int(11) NOT NULL DEFAULT '0',
  `Added` enum('explicitly','implicitly') DEFAULT 'implicitly',
  `ChangeSetID` int(11) NOT NULL DEFAULT '0',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `ObjectClass` enum('AltMode','BotGroup','BotTeam','Character','Collection','SilverStripe\\Assets\\File','SilverStripe\\SiteConfig\\SiteConfig','SilverStripe\\Versioned\\ChangeSet','SilverStripe\\Versioned\\ChangeSetItem','SilverStripe\\CMS\\Model\\SiteTree','SilverStripe\\Security\\Group','SilverStripe\\Security\\LoginAttempt','SilverStripe\\Security\\Member','SilverStripe\\Security\\MemberPassword','SilverStripe\\Security\\Permission','SilverStripe\\Security\\PermissionRole','SilverStripe\\Security\\PermissionRoleCode','SilverStripe\\Security\\RememberLoginHash','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image','Page','CollectionPage','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') DEFAULT 'AltMode',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ObjectUniquePerChangeSet` (`ObjectID`,`ObjectClass`,`ChangeSetID`),
  KEY `ClassName` (`ClassName`),
  KEY `ChangeSetID` (`ChangeSetID`),
  KEY `Object` (`ObjectID`,`ObjectClass`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ChangeSetItem`
--

INSERT INTO `ChangeSetItem` (`ID`, `ClassName`, `LastEdited`, `Created`, `VersionBefore`, `VersionAfter`, `Added`, `ChangeSetID`, `ObjectID`, `ObjectClass`) VALUES
(1, 'SilverStripe\\Versioned\\ChangeSetItem', '2017-09-23 15:00:20', '2017-09-23 15:00:20', 1, 1, 'explicitly', 1, 4, 'SilverStripe\\CMS\\Model\\SiteTree'),
(2, 'SilverStripe\\Versioned\\ChangeSetItem', '2017-09-23 15:00:24', '2017-09-23 15:00:24', 1, 1, 'explicitly', 2, 5, 'SilverStripe\\CMS\\Model\\SiteTree'),
(3, 'SilverStripe\\Versioned\\ChangeSetItem', '2017-09-29 17:10:22', '2017-09-29 17:10:21', 0, 2, 'explicitly', 3, 4, 'SilverStripe\\Assets\\File'),
(4, 'SilverStripe\\Versioned\\ChangeSetItem', '2017-10-01 01:17:25', '2017-10-01 01:17:25', 0, 2, 'explicitly', 4, 6, 'SilverStripe\\CMS\\Model\\SiteTree');

-- --------------------------------------------------------

--
-- Table structure for table `ChangeSetItem_ReferencedBy`
--

CREATE TABLE IF NOT EXISTS `ChangeSetItem_ReferencedBy` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ChangeSetItemID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ChangeSetItemID` (`ChangeSetItemID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Character`
--

CREATE TABLE IF NOT EXISTS `Character` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Character') DEFAULT 'Character',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Faction` enum('Autobot','Decepticon') DEFAULT 'Autobot',
  `Rank` enum('Warrior','Officer','Commander','Leader') DEFAULT 'Warrior',
  `GestaltID` int(11) NOT NULL DEFAULT '0',
  `IsGestalt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Role` enum('Soldier','Scientist','Engineer','Scout','Spy','Cityspeaker','Medic','Assasin','Bounty Hunter','Bodyguard','Security','Terrorist','Courier','Trader') DEFAULT 'Soldier',
  `NemesisID` int(11) NOT NULL DEFAULT '0',
  `Gender` enum('Male','Female','Unknown') DEFAULT 'Male',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `AltMode` enum('Aircraft Propeller','Aircraft Fighter Jet','Aircraft Jet','Spaceship','Motorbike','Beast','Monster','Car Performance','Car Large/SUV','Car Luxury','Car Street','Car Small','Car Alien','Tank/Armoured','Industrial/Specialist','Truck','Object') DEFAULT 'Aircraft Propeller',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `GestaltID` (`GestaltID`),
  KEY `NemesisID` (`NemesisID`),
  KEY `ImageID` (`ImageID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=146 ;

--
-- Dumping data for table `Character`
--

INSERT INTO `Character` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Faction`, `Rank`, `GestaltID`, `IsGestalt`, `Role`, `NemesisID`, `Gender`, `ImageID`, `AltMode`) VALUES
(1, 'Character', '2017-09-30 15:15:27', NULL, 'Optimus Prime', 'Autobot', 'Leader', 0, 0, 'Soldier', 0, 'Male', 4, 'Truck'),
(2, 'Character', '2017-09-30 15:15:28', '2017-09-23 15:32:36', 'Ultra Magnus', 'Autobot', 'Commander', 0, 0, 'Soldier', 17, 'Male', 0, 'Truck'),
(3, 'Character', '2017-09-30 15:15:26', '2017-09-23 15:33:34', 'Nemesis Prime', 'Decepticon', 'Warrior', 0, 0, 'Spy', 1, 'Male', 0, 'Truck'),
(4, 'Character', '2017-09-30 15:15:28', '2017-09-23 15:35:07', 'Starscream', 'Decepticon', 'Commander', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(5, 'Character', '2017-09-30 15:15:24', '2017-09-23 15:36:12', 'Air Raid', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(6, 'Character', '2017-09-30 15:15:27', '2017-09-23 16:08:19', 'Silverbolt', 'Autobot', 'Commander', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Jet'),
(7, 'Character', '2017-09-30 15:15:26', '2017-09-23 16:09:24', 'Metroplex', 'Autobot', 'Commander', 0, 0, 'Soldier', 0, 'Male', 0, 'Object'),
(8, 'Character', '2017-09-30 15:15:29', '2017-09-23 16:13:23', 'Windblade', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Aircraft Fighter Jet'),
(9, 'Character', '2017-09-30 15:15:27', '2017-09-24 01:34:42', 'Runamuck', 'Decepticon', 'Warrior', 2, 1, 'Soldier', 0, 'Male', 0, 'Car Luxury'),
(10, 'Character', '2017-09-30 15:15:25', '2017-09-24 12:27:44', 'Grimlock', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Beast'),
(11, 'Character', '2017-09-30 15:15:27', '2017-09-24 16:15:05', 'Runabout', 'Decepticon', 'Warrior', 0, 1, 'Terrorist', 0, 'Male', 0, 'Car Luxury'),
(12, 'Character', '2017-09-30 15:15:26', '2017-09-24 16:25:28', 'MotorMaster', 'Decepticon', 'Commander', 0, 0, 'Soldier', 0, 'Male', 0, 'Truck'),
(13, 'Character', '2017-09-30 15:15:26', '2017-09-24 17:04:55', 'Megatron', 'Decepticon', 'Leader', 0, 0, 'Soldier', 1, 'Male', 0, 'Object'),
(14, 'Character', '2017-09-30 15:15:26', '2017-09-24 17:09:53', 'Ironhide', 'Autobot', 'Warrior', 0, 0, 'Security', 0, 'Male', 0, 'Car Large/SUV'),
(15, 'Character', '2017-09-30 15:15:29', '2017-09-24 17:20:02', 'Wildrider', 'Decepticon', 'Warrior', 0, 0, 'Terrorist', 0, 'Male', 0, 'Car Performance'),
(16, 'Character', '2017-09-30 15:15:25', '2017-09-24 17:24:04', 'Dead End', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Performance'),
(17, 'Character', '2017-09-30 15:15:25', '2017-09-24 17:27:48', 'Cyclonus', 'Decepticon', 'Commander', 0, 0, 'Security', 2, 'Male', 0, 'Spaceship'),
(18, 'Character', '2017-09-30 15:15:29', '2017-09-24 17:45:32', 'Wheeljack', 'Autobot', 'Warrior', 0, 0, 'Engineer', 0, 'Male', 0, 'Car Performance'),
(19, 'Character', '2017-09-30 15:15:28', '2017-09-24 17:47:25', 'Smokescreen', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Performance'),
(20, 'Character', '2017-09-30 15:15:28', '2017-09-24 17:48:57', 'Soundwave', 'Decepticon', 'Commander', 0, 0, 'Spy', 0, 'Male', 0, 'Object'),
(21, 'Character', '2017-09-30 15:15:25', '2017-09-24 17:52:10', 'Glyph', 'Autobot', 'Warrior', 0, 0, 'Scientist', 0, 'Female', 0, 'Car Small'),
(22, 'Character', '2017-09-30 15:15:27', '2017-09-24 17:55:49', 'Shadow Stalker', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Small'),
(23, 'Character', '2017-09-30 15:15:24', '2017-09-24 17:56:49', 'Brawn', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Large/SUV'),
(24, 'Character', '2017-09-30 15:15:26', '2017-09-24 18:00:32', 'Jazz', 'Autobot', 'Officer', 0, 0, 'Security', 0, 'Male', 0, 'Car Performance'),
(25, 'Character', '2017-09-30 15:15:27', '2017-09-24 18:05:34', 'Road Rage', 'Autobot', 'Warrior', 0, 0, 'Bodyguard', 0, 'Female', 0, 'Car Luxury'),
(26, 'Character', '2017-09-30 15:15:24', '2017-09-24 18:11:36', 'Arcee', 'Autobot', 'Warrior', 0, 0, 'Scout', 0, 'Female', 0, 'Motorbike'),
(27, 'Character', '2017-09-30 15:15:28', '2017-09-24 18:14:39', 'Strika', 'Decepticon', 'Commander', 0, 0, 'Soldier', 0, 'Female', 0, 'Tank/Armoured'),
(28, 'Character', '2017-09-30 15:15:28', '2017-09-25 00:05:19', 'Thundercracker', 'Decepticon', 'Officer', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(29, 'Character', '2017-09-30 15:15:27', '2017-09-25 00:06:56', 'Skywarp', 'Decepticon', 'Officer', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(30, 'Character', '2017-10-02 04:16:34', '2017-09-25 00:08:42', 'Sunstorm', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Spaceship'),
(31, 'Character', '2017-09-30 15:15:24', '2017-09-25 00:10:11', 'Acid Rain', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(32, 'Character', '2017-09-30 15:15:24', '2017-09-25 00:17:29', 'Blur', 'Autobot', 'Warrior', 0, 0, 'Courier', 0, 'Male', 0, 'Car Alien'),
(33, 'Character', '2017-09-30 15:15:26', '2017-09-25 00:19:05', 'Hound', 'Autobot', 'Warrior', 0, 0, 'Scout', 0, 'Male', 0, 'Car Small'),
(34, 'Character', '2017-09-30 15:15:28', '2017-09-25 00:24:34', 'Warpath', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Tank/Armoured'),
(35, 'Character', '2017-09-30 15:15:27', '2017-09-25 00:27:36', 'Seaspray', 'Autobot', 'Warrior', 0, 0, 'Scientist', 0, 'Male', 0, 'Industrial/Specialist'),
(36, 'Character', '2017-09-30 15:15:28', '2017-09-27 15:25:21', 'Swindle/Ruckus', 'Decepticon', 'Warrior', 0, 0, '', 0, 'Male', 0, 'Car Small'),
(37, 'Character', '2017-09-30 15:15:24', '2017-09-27 15:39:20', 'Brawl', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Tank/Armoured'),
(38, 'Character', '2017-09-30 15:15:27', '2017-09-27 15:58:12', 'Slipstream', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Aircraft Fighter Jet'),
(39, 'Character', '2017-09-30 15:15:25', '2017-09-27 16:02:43', 'Flamewar', 'Decepticon', 'Officer', 0, 0, 'Terrorist', 0, 'Female', 0, 'Motorbike'),
(40, 'Character', '2017-09-30 15:15:24', '2017-09-27 16:04:14', 'Chromia', 'Autobot', 'Warrior', 0, 0, 'Bodyguard', 0, 'Female', 0, 'Car Alien'),
(41, 'Character', '2017-09-30 15:15:26', '2017-09-27 16:10:46', 'Knockout', 'Decepticon', 'Warrior', 0, 0, 'Engineer', 0, 'Male', 0, 'Car Street'),
(42, 'Character', '2017-09-30 15:15:24', '2017-09-27 16:13:23', 'Breakdown', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Large/SUV'),
(43, 'Character', '2017-09-30 15:15:26', '2017-09-27 16:16:07', 'Megatronus/The Fallen', 'Decepticon', 'Leader', 0, 0, 'Soldier', 0, 'Male', 0, 'Spaceship'),
(44, 'Character', '2017-09-30 15:15:27', '2017-09-27 16:22:13', 'Prowl', 'Autobot', 'Officer', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(45, 'Character', '2017-09-30 15:15:27', '2017-09-27 16:23:00', 'Red Alert', 'Autobot', 'Officer', 0, 0, 'Security', 0, 'Male', 0, 'Car Luxury'),
(46, 'Character', '2017-09-30 15:15:28', '2017-09-27 16:23:21', 'Strongarm', 'Autobot', 'Warrior', 0, 0, 'Security', 0, 'Female', 0, 'Car Large/SUV'),
(47, 'Character', '2017-09-30 15:15:24', '2017-09-29 16:27:10', 'Airazor', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Beast'),
(48, 'Character', '2017-09-30 15:15:24', '2017-09-29 16:27:10', 'Barricade', 'Decepticon', 'Officer', 0, 0, 'Security', 0, 'Male', 0, 'Car Street'),
(49, 'Character', '2017-09-30 15:15:24', '2017-09-29 16:27:10', 'Blackout/Vortex', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Propeller'),
(50, 'Character', '2017-09-30 15:15:24', '2017-09-29 16:27:10', 'Bonecrusher', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Tank/Armoured'),
(51, 'Character', '2017-09-30 15:15:24', '2017-09-29 16:27:10', 'Brainstorm', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Spaceship'),
(52, 'Character', '2017-09-30 15:15:24', '2017-09-29 16:27:10', 'Brakedown', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Performance'),
(53, 'Character', '2017-09-30 15:15:24', '2017-09-29 16:27:10', 'Bumblebee', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(54, 'Character', '2017-09-30 15:15:24', '2017-09-29 16:27:10', 'Cosmos', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Spaceship'),
(55, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:10', 'Crankcase', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Large/SUV'),
(56, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:10', 'Crosshairs', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Luxury'),
(57, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:10', 'Crowbar', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(58, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:10', 'DeepDive', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Industrial/Specialist'),
(59, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'Dogfight', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(60, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'Drift', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Performance'),
(61, 'Character', '2017-10-02 05:26:19', '2017-09-29 16:27:11', 'ElitaOne/Bludgeon', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Tank/Armoured'),
(62, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'ElitaOne/Nautica', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Industrial/Specialist'),
(63, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'Fireflight', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Jet'),
(64, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'Firestar', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Truck'),
(65, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'Flak/hardhead', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Tank/Armoured'),
(66, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'Galvatron', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Object'),
(67, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'Hoist', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Large/SUV'),
(68, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'Hot Rodimus', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Performance'),
(69, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:11', 'HotSpot', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Truck'),
(70, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:11', 'Hun-Gurr', 'Decepticon', 'Warrior', 0, 0, 'Terrorist', 0, 'Male', 0, 'Monster'),
(71, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:11', 'Impactor', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Tank/Armoured'),
(72, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:11', 'Jetfire', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Jet'),
(73, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:12', 'LeoBreaker', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Beast'),
(74, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:12', 'Lockdown', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Luxury'),
(75, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:12', 'LongHaul', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Industrial/Specialist'),
(76, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:12', 'Moonracer', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Alien'),
(77, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:12', 'Octane', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Truck'),
(78, 'Character', '2017-09-30 15:15:27', '2017-09-29 16:27:12', 'Override/Nightracer', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Street'),
(79, 'Character', '2017-09-30 15:15:27', '2017-09-29 16:27:12', 'Powerglide', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Jet'),
(80, 'Character', '2017-09-30 15:15:27', '2017-09-29 16:27:12', 'Ratchet', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Large/SUV'),
(81, 'Character', '2017-09-30 15:15:27', '2017-09-29 16:27:12', 'Scrapper', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Industrial/Specialist'),
(82, 'Character', '2017-09-30 15:15:27', '2017-09-29 16:27:12', 'Shockwave', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Object'),
(83, 'Character', '2017-09-30 15:15:27', '2017-09-29 16:27:13', 'Sideswipe', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Luxury'),
(84, 'Character', '2017-09-30 15:15:27', '2017-09-29 16:27:13', 'Sinnertwin/Twinstrike', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Monster'),
(85, 'Character', '2017-09-30 15:15:27', '2017-09-29 16:27:13', 'Skyfire', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Jet'),
(86, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:13', 'Springer', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Propeller'),
(87, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:13', 'Strafe', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Spaceship'),
(88, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:13', 'Sunstreaker', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Luxury'),
(89, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:13', 'Swindle/Heatseeker', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Large/SUV'),
(90, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:13', 'Tailgate', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(91, 'Character', '2017-10-02 05:26:28', '2017-09-29 16:27:13', 'Tankor/Guzzle', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Tank/Armoured'),
(92, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:13', 'Terrorcon Cliffjumper', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(93, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:13', 'Thunderhoof', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Industrial/Specialist'),
(94, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:14', 'Vector Prime', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Spaceship'),
(95, 'Character', '2017-09-30 15:15:28', '2017-09-29 16:27:14', 'Volt', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Small'),
(96, 'Character', '2017-09-30 15:15:29', '2017-09-29 16:27:14', 'Waspinator', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(97, 'Character', '2017-09-30 15:15:29', '2017-09-29 16:27:14', 'Whirl', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Propeller'),
(98, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:14', 'Nightbird', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Luxury'),
(99, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:14', 'Motorhead', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(100, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:14', 'Ionstorm', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(101, 'Character', '2017-09-30 15:15:26', '2017-09-29 16:27:14', 'Novastorm', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(102, 'Character', '2017-10-02 15:42:37', '2017-09-29 16:27:14', 'Vehicon', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(103, 'Character', '2017-10-02 07:44:26', '2017-09-29 16:27:14', 'Seeker Steve / Air Warriors', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(104, 'Character', '2017-10-02 16:04:01', '2017-09-29 16:27:14', 'Thunderwing(Megatron)', 'Decepticon', 'Commander', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(105, 'Character', '2017-09-30 15:15:25', '2017-09-29 16:27:14', 'Dragonstorm', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Monster'),
(106, 'Character', '2017-09-30 15:15:27', '2017-09-30 03:45:48', 'Skydive', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Jet'),
(107, 'Character', '2017-09-30 15:15:26', '2017-09-30 03:52:26', 'Onslaught', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Truck'),
(108, 'Character', '2017-09-30 15:15:24', '2017-09-30 03:53:25', 'Lancer', 'Autobot', 'Warrior', 0, 1, 'Soldier', 0, 'Female', 0, 'Car Luxury'),
(109, 'Character', '2017-09-30 15:15:27', '2017-09-30 12:10:27', 'Ramjet', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(110, 'Character', '2017-09-30 15:15:25', '2017-09-30 12:10:46', 'Dirge', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(111, 'Character', '2017-09-30 15:15:28', '2017-09-30 12:10:57', 'Thrust', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Fighter Jet'),
(112, 'Character', '2017-09-30 15:15:28', '2017-09-30 12:12:39', 'Streetwise', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Street'),
(113, 'Character', '2017-09-30 15:15:25', '2017-09-30 12:12:48', 'Groove', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Motorbike'),
(114, 'Character', '2017-09-30 15:15:25', '2017-09-30 12:12:59', 'First Aid', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Large/SUV'),
(115, 'Character', '2017-09-30 15:15:24', '2017-09-30 12:13:09', 'Blades', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Propeller'),
(116, 'Character', '2017-09-30 15:15:25', '2017-09-30 12:17:12', 'Hook', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Industrial/Specialist'),
(117, 'Character', '2017-09-30 15:15:26', '2017-09-30 12:17:28', 'Mixmaster', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Industrial/Specialist'),
(118, 'Character', '2017-09-30 15:15:27', '2017-09-30 12:18:59', 'Scavenger', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Industrial/Specialist'),
(119, 'Character', '2017-09-30 15:15:27', '2017-09-30 12:41:11', 'Slingshot', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Aircraft Jet'),
(120, 'Character', '2017-09-30 15:15:28', '2017-09-30 12:41:29', 'Swoop', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Beast'),
(121, 'Character', '2017-09-30 15:15:28', '2017-09-30 12:41:37', 'Snarl', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Beast'),
(122, 'Character', '2017-09-30 15:15:28', '2017-09-30 12:41:44', 'Sludge', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Beast'),
(123, 'Character', '2017-09-30 15:15:27', '2017-09-30 12:42:31', 'Slag', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Beast'),
(124, 'Character', '2017-09-30 15:15:26', '2017-09-30 12:45:21', 'Nosecone', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Industrial/Specialist'),
(125, 'Character', '2017-09-30 15:15:27', '2017-09-30 12:45:36', 'Scattershot', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Spaceship'),
(126, 'Character', '2017-09-30 15:15:24', '2017-09-30 12:46:38', 'Afterburner', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Motorbike'),
(127, 'Character', '2017-09-30 15:15:26', '2017-09-30 12:46:50', 'Lightspeed', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Car Alien'),
(128, 'Character', '2017-09-30 15:15:25', '2017-09-30 12:47:19', 'Dragstrip', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Performance'),
(129, 'Character', '2017-09-30 15:15:24', '2017-09-30 12:48:18', 'BlastOff', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Spaceship'),
(130, 'Character', '2017-09-30 15:15:27', '2017-09-30 12:51:52', 'Pyra Magna', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Truck'),
(131, 'Character', '2017-09-30 15:15:28', '2017-09-30 12:52:06', 'Stormclash', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Aircraft Propeller'),
(132, 'Character', '2017-09-30 15:15:27', '2017-09-30 12:52:15', 'Skyburst', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Aircraft Propeller'),
(133, 'Character', '2017-09-30 15:15:25', '2017-09-30 12:52:39', 'Dust Up', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Performance'),
(134, 'Character', '2017-09-30 15:15:26', '2017-09-30 12:52:51', 'Jumpstream', 'Autobot', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Luxury'),
(135, 'Character', '2017-09-30 15:15:26', '2017-09-30 12:53:24', 'Megaempress', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Truck'),
(136, 'Character', '2017-09-30 15:15:26', '2017-09-30 12:53:38', 'Lunaclub', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Performance'),
(137, 'Character', '2017-09-30 15:15:26', '2017-09-30 12:53:48', 'Moonheart', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Performance'),
(138, 'Character', '2017-09-30 15:15:25', '2017-09-30 12:53:59', 'Flowspade', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Performance'),
(139, 'Character', '2017-09-30 15:15:28', '2017-09-30 12:54:10', 'Trickdiamond', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Female', 0, 'Car Luxury'),
(140, 'Character', '2017-09-30 15:23:50', '2017-09-30 15:23:50', 'Trypticon', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Beast'),
(141, 'Character', '2017-09-30 15:35:51', '2017-09-30 15:34:37', 'Rippersnapper (Grimlock)', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Monster'),
(142, 'Character', '2017-09-30 15:36:56', '2017-09-30 15:36:56', 'Blight/Blot', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Monster'),
(143, 'Character', '2017-09-30 15:38:59', '2017-09-30 15:38:59', 'Windrazor/Cutthroat', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Monster'),
(144, 'Character', '2017-10-02 02:43:41', '2017-10-02 02:43:41', 'Airachnid', 'Decepticon', 'Officer', 0, 0, 'Scientist', 0, 'Female', 0, 'Aircraft Propeller'),
(145, 'Character', '2017-10-02 06:29:49', '2017-10-02 06:29:49', 'Ransack', 'Decepticon', 'Warrior', 0, 0, 'Soldier', 0, 'Male', 0, 'Motorbike');

-- --------------------------------------------------------

--
-- Table structure for table `Character_AltModes`
--

CREATE TABLE IF NOT EXISTS `Character_AltModes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `AltModeID` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) DEFAULT NULL,
  `Fashion` enum('Futuristic','Alien','Contemporary','Retro','Ancient') DEFAULT 'Contemporary',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CharacterID` (`CharacterID`),
  KEY `AltModeID` (`AltModeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Dumping data for table `Character_AltModes`
--

INSERT INTO `Character_AltModes` (`ID`, `CharacterID`, `AltModeID`, `Name`, `Fashion`, `ImageID`) VALUES
(1, 1, 1, ' red and blue White Freightliner WFT-8664T cabover semi-trailer truck with trailer', 'Contemporary', 0),
(2, 2, 1, 'White Freightliner WFT-8664T cabover semi-trailer truck, towing a car-carrier trailer', 'Contemporary', 0),
(3, 3, 1, NULL, 'Contemporary', 0),
(4, 4, 2, 'grey, red and blue F-15 Eagle fighter jet.', 'Contemporary', 0),
(5, 5, 2, 'black F-15 Eagle', 'Contemporary', 0),
(6, 7, 3, 'Scrambler City', 'Contemporary', 0),
(7, 7, 4, 'Metro Station', 'Contemporary', 0),
(8, 8, 5, NULL, 'Contemporary', 0),
(9, 10, 6, NULL, 'Ancient', 0),
(10, 12, 1, 'Kenworth K100 Aerodyne tractor trailer', 'Contemporary', 2),
(11, 13, 7, 'Modified Walther P38', 'Contemporary', 0),
(12, 14, 8, 'Modified black 2006 GMC Topkick 4500 four-wheel drive', 'Contemporary', 0),
(13, 15, 13, 'Dark grey Ferrari 308 GTB sports car.', 'Contemporary', 0),
(14, 16, 9, 'maroon Porsche 928', 'Contemporary', 0),
(15, 17, 10, 'grey and purple Cybertronian jet-fighter', 'Futuristic', 0),
(16, 18, 9, 'Lancia Group 5 Stratos Turbo', 'Contemporary', 0),
(17, 19, 9, 'McLaren MP4-12C', 'Contemporary', 0),
(18, 20, 11, 'Satellite', 'Alien', 0),
(19, 21, 12, 'small cyan hatchback', 'Contemporary', 0),
(20, 22, 12, 'small black hatchback', 'Contemporary', 0),
(21, 23, 8, 'Jeep Cherokee XJ', 'Contemporary', 0),
(22, 24, 9, 'Martini Racing Porsche 935', 'Contemporary', 0),
(23, 25, 13, 'Corvette Stingray sports car', 'Contemporary', 0),
(24, 26, 14, 'blue motorbike', 'Contemporary', 0),
(25, 27, 15, 'Cybertronian tank', 'Futuristic', 0),
(26, 28, 2, 'blue F-15 Eagle fighter jet.', 'Contemporary', 0),
(27, 29, 2, 'black and purple F-15 Eagle fighter jet.', 'Contemporary', 0),
(28, 30, 2, 'yellow F-15 Eagle fighter jet.', 'Contemporary', 0),
(29, 31, 2, 'green F-15 Eagle fighter jet.', 'Contemporary', 0),
(30, 32, 9, 'Ferrari FXX Evoluzione', 'Futuristic', 0),
(31, 33, 16, 'J59 Jeep', 'Retro', 0),
(32, 34, 15, 'Cybertronian Tank', 'Futuristic', 0),
(33, 35, 17, 'Hovercraft', 'Contemporary', 0),
(34, 36, 18, 'XR311 Combat vehicle/jeep', 'Retro', 0),
(35, 37, 15, 'green Leopard 1A3 main battle tank', 'Retro', 0),
(38, 38, 2, 'General Dynamics F-16 Fighting Falcon', 'Futuristic', 0),
(39, 39, 14, 'Flame-deco', 'Contemporary', 0),
(40, 40, 12, 'Stealth Transport', 'Futuristic', 0),
(41, 41, 13, 'Aston Martin One-77', 'Contemporary', 0),
(42, 42, 8, 'Armoured Truck', 'Contemporary', 0),
(43, 43, 10, 'Cybertronian Destroyer', 'Alien', 0),
(44, 46, 8, 'Police SUV', 'Contemporary', 0),
(45, 44, 13, 'Police Nissan 350Z', 'Retro', 0),
(46, 45, 13, 'Lamborghini Countach fire chief''s car', 'Retro', 0),
(47, 47, 19, 'Metal Hawk', 'Futuristic', 0),
(48, 84, 20, 'Two-headed Wyrm ', 'Alien', 0),
(49, 70, 20, 'Two-headed monster', 'Alien', 0),
(50, 140, 3, 'Scrambler City', 'Futuristic', 0),
(51, 140, 4, 'Trypto Station', 'Futuristic', 0),
(52, 141, 20, 'bipedal lizard creature', 'Alien', 0),
(53, 142, 20, 'bipedal dragon', 'Alien', 0),
(54, 143, 20, 'bird-like dragon creature', 'Alien', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Collection`
--

CREATE TABLE IF NOT EXISTS `Collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Collection') DEFAULT 'Collection',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Collection`
--

INSERT INTO `Collection` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Sort`, `MemberID`) VALUES
(1, 'Collection', '2017-09-24 01:17:30', '2017-09-24 01:17:30', 'Mikey', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `CollectionPage_Collections`
--

CREATE TABLE IF NOT EXISTS `CollectionPage_Collections` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CollectionPageID` int(11) NOT NULL DEFAULT '0',
  `CollectionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CollectionPageID` (`CollectionPageID`),
  KEY `CollectionID` (`CollectionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `CollectionPage_Collections`
--

INSERT INTO `CollectionPage_Collections` (`ID`, `CollectionPageID`, `CollectionID`) VALUES
(1, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Collection_Characters`
--

CREATE TABLE IF NOT EXISTS `Collection_Characters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CollectionID` int(11) NOT NULL DEFAULT '0',
  `CharacterID` int(11) NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CollectionID` (`CollectionID`),
  KEY `CharacterID` (`CharacterID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `Collection_Characters`
--

INSERT INTO `Collection_Characters` (`ID`, `CollectionID`, `CharacterID`, `Sort`) VALUES
(1, 1, 1, 0),
(2, 1, 4, 0),
(3, 1, 2, 0),
(4, 1, 8, 0),
(5, 1, 5, 0),
(7, 1, 13, 0),
(8, 1, 10, 0),
(9, 1, 14, 0),
(10, 1, 15, 0),
(11, 1, 16, 0),
(12, 1, 17, 0),
(13, 1, 18, 0),
(14, 1, 19, 0),
(15, 1, 20, 0),
(16, 1, 21, 0),
(17, 1, 22, 0),
(18, 1, 23, 0),
(19, 1, 24, 0),
(20, 1, 25, 0),
(21, 1, 26, 0),
(22, 1, 27, 0),
(23, 1, 29, 0),
(24, 1, 28, 0),
(25, 1, 30, 0),
(26, 1, 31, 0),
(27, 1, 32, 0),
(28, 1, 33, 0),
(29, 1, 34, 0),
(30, 1, 35, 0),
(31, 1, 36, 0),
(32, 1, 37, 0),
(33, 1, 38, 0),
(34, 1, 39, 0),
(35, 1, 40, 0),
(36, 1, 41, 0),
(37, 1, 42, 0),
(38, 1, 43, 0),
(39, 1, 44, 0),
(40, 1, 45, 0),
(41, 1, 46, 0),
(42, 1, 47, 0),
(43, 1, 51, 0),
(44, 1, 53, 0),
(45, 1, 56, 0),
(46, 1, 59, 0),
(47, 1, 60, 0),
(48, 1, 63, 0),
(49, 1, 67, 0),
(50, 1, 65, 0),
(51, 1, 71, 0),
(52, 1, 64, 0),
(53, 1, 68, 0),
(54, 1, 73, 0),
(55, 1, 76, 0),
(56, 1, 69, 0),
(57, 1, 80, 0),
(58, 1, 83, 0),
(59, 1, 85, 0),
(60, 1, 86, 0),
(61, 1, 87, 0),
(62, 1, 90, 0),
(63, 1, 79, 0),
(64, 1, 94, 0),
(65, 1, 95, 0),
(66, 1, 88, 0),
(67, 1, 97, 0),
(68, 1, 105, 0),
(69, 1, 72, 0),
(70, 1, 54, 0),
(71, 1, 61, 0),
(72, 1, 62, 0),
(73, 1, 100, 0),
(74, 1, 77, 0),
(75, 1, 78, 0),
(76, 1, 48, 0),
(77, 1, 49, 0),
(78, 1, 50, 0),
(79, 1, 52, 0),
(80, 1, 104, 0),
(81, 1, 55, 0),
(82, 1, 57, 0),
(83, 1, 3, 0),
(84, 1, 58, 0),
(85, 1, 66, 0),
(86, 1, 70, 0),
(87, 1, 74, 0),
(88, 1, 75, 0),
(89, 1, 81, 0),
(90, 1, 82, 0),
(91, 1, 84, 0),
(92, 1, 89, 0),
(93, 1, 91, 0),
(94, 1, 92, 0),
(95, 1, 93, 0),
(96, 1, 96, 0),
(97, 1, 98, 0),
(98, 1, 99, 0),
(99, 1, 101, 0),
(100, 1, 102, 0),
(102, 1, 141, 0),
(103, 1, 142, 0),
(104, 1, 143, 0),
(105, 1, 108, 0),
(106, 1, 144, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

CREATE TABLE IF NOT EXISTS `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

CREATE TABLE IF NOT EXISTS `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Versions`
--

CREATE TABLE IF NOT EXISTS `ErrorPage_Versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ErrorPage_Versions`
--

INSERT INTO `ErrorPage_Versions` (`ID`, `RecordID`, `Version`, `ErrorCode`) VALUES
(1, 4, 1, 404),
(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

CREATE TABLE IF NOT EXISTS `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `FileHash` varchar(255) DEFAULT NULL,
  `FileFilename` varchar(255) DEFAULT NULL,
  `FileVariant` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `File`
--

INSERT INTO `File` (`ID`, `ClassName`, `LastEdited`, `Created`, `Name`, `Title`, `ShowInSearch`, `CanViewType`, `CanEditType`, `Version`, `ParentID`, `OwnerID`, `FileHash`, `FileFilename`, `FileVariant`) VALUES
(1, 'SilverStripe\\Assets\\Folder', '2017-09-29 17:10:21', '2017-09-24 16:34:42', 'Uploads', 'Uploads', 1, 'Inherit', 'Inherit', 1, 0, 1, NULL, NULL, NULL),
(2, 'SilverStripe\\Assets\\Image', '2017-09-24 16:35:17', '2017-09-24 16:35:17', 'MTMTEMotormaster.jpg', 'MTMTEMotormaster', 1, 'Inherit', 'Inherit', 1, 1, 1, 'b8ea20ffa0da6421b1bd6d76d2134dd7c19fe530', 'Uploads/MTMTEMotormaster.jpg', NULL),
(3, 'SilverStripe\\Assets\\Image', '2017-09-24 16:36:21', '2017-09-24 16:36:21', 'MTMTEMotormaster-v2.jpg', 'MTMTEMotormaster v2', 1, 'Inherit', 'Inherit', 1, 1, 1, 'b8ea20ffa0da6421b1bd6d76d2134dd7c19fe530', 'Uploads/MTMTEMotormaster-v2.jpg', NULL),
(4, 'SilverStripe\\Assets\\Image', '2017-09-29 17:10:22', '2017-09-29 17:02:33', 'optimus_prime_by_radimusprime.jpg', 'optimus prime by radimusprime', 1, 'Inherit', 'Inherit', 2, 1, 1, 'ec7c136e39896661146eae68c88779066d6d4c95', 'Uploads/optimus_prime_by_radimusprime.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `File_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `File_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FileID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FileID` (`FileID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `File_Live`
--

CREATE TABLE IF NOT EXISTS `File_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `FileHash` varchar(255) DEFAULT NULL,
  `FileFilename` varchar(255) DEFAULT NULL,
  `FileVariant` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `File_Live`
--

INSERT INTO `File_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `Name`, `Title`, `ShowInSearch`, `CanViewType`, `CanEditType`, `Version`, `ParentID`, `OwnerID`, `FileHash`, `FileFilename`, `FileVariant`) VALUES
(1, 'SilverStripe\\Assets\\Folder', '2017-09-29 17:10:21', '2017-09-24 16:34:42', 'Uploads', 'Uploads', 1, 'Inherit', 'Inherit', 1, 0, 1, NULL, NULL, NULL),
(4, 'SilverStripe\\Assets\\Image', '2017-09-29 17:10:22', '2017-09-29 17:02:33', 'optimus_prime_by_radimusprime.jpg', 'optimus prime by radimusprime', 1, 'Inherit', 'Inherit', 2, 1, 1, 'ec7c136e39896661146eae68c88779066d6d4c95', 'Uploads/optimus_prime_by_radimusprime.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `File_Versions`
--

CREATE TABLE IF NOT EXISTS `File_Versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SilverStripe\\Assets\\File','SilverStripe\\Assets\\Folder','SilverStripe\\Assets\\Image') DEFAULT 'SilverStripe\\Assets\\File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `FileHash` varchar(255) DEFAULT NULL,
  `FileFilename` varchar(255) DEFAULT NULL,
  `FileVariant` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ClassName` (`ClassName`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `File_Versions`
--

INSERT INTO `File_Versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `Name`, `Title`, `ShowInSearch`, `CanViewType`, `CanEditType`, `ParentID`, `OwnerID`, `FileHash`, `FileFilename`, `FileVariant`) VALUES
(1, 1, 1, 1, 1, 1, 'SilverStripe\\Assets\\Folder', '2017-09-24 16:34:42', '2017-09-24 16:34:42', 'Uploads', 'Uploads', 1, 'Inherit', 'Inherit', 0, 1, NULL, NULL, NULL),
(2, 2, 1, 0, 1, 0, 'SilverStripe\\Assets\\Image', '2017-09-24 16:35:17', '2017-09-24 16:35:17', 'MTMTEMotormaster.jpg', 'MTMTEMotormaster', 1, 'Inherit', 'Inherit', 1, 1, 'b8ea20ffa0da6421b1bd6d76d2134dd7c19fe530', 'Uploads/MTMTEMotormaster.jpg', NULL),
(3, 3, 1, 0, 1, 0, 'SilverStripe\\Assets\\Image', '2017-09-24 16:36:21', '2017-09-24 16:36:21', 'MTMTEMotormaster-v2.jpg', 'MTMTEMotormaster v2', 1, 'Inherit', 'Inherit', 1, 1, 'b8ea20ffa0da6421b1bd6d76d2134dd7c19fe530', 'Uploads/MTMTEMotormaster-v2.jpg', NULL),
(4, 4, 1, 0, 1, 0, 'SilverStripe\\Assets\\Image', '2017-09-29 17:02:33', '2017-09-29 17:02:33', 'optimus_prime_by_radimusprime.jpg', 'optimus prime by radimusprime', 1, 'Inherit', 'Inherit', 1, 1, 'ec7c136e39896661146eae68c88779066d6d4c95', 'Uploads/optimus_prime_by_radimusprime.jpg', NULL),
(5, 4, 2, 1, 1, 1, 'SilverStripe\\Assets\\Image', '2017-09-29 17:10:21', '2017-09-29 17:02:33', 'optimus_prime_by_radimusprime.jpg', 'optimus prime by radimusprime', 1, 'Inherit', 'Inherit', 1, 1, 'ec7c136e39896661146eae68c88779066d6d4c95', 'Uploads/optimus_prime_by_radimusprime.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `File_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `File_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FileID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FileID` (`FileID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

CREATE TABLE IF NOT EXISTS `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Security\\Group') DEFAULT 'SilverStripe\\Security\\Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(255) DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `ParentID` (`ParentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'SilverStripe\\Security\\Group', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'SilverStripe\\Security\\Group', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

CREATE TABLE IF NOT EXISTS `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

CREATE TABLE IF NOT EXISTS `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

CREATE TABLE IF NOT EXISTS `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Security\\LoginAttempt') DEFAULT 'SilverStripe\\Security\\LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE IF NOT EXISTS `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Security\\Member') DEFAULT 'SilverStripe\\Security\\Member',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `TempIDHash` varchar(160) DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `AutoLoginHash` varchar(160) DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `Email` (`Email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `LastEdited`, `Created`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`) VALUES
(1, 'SilverStripe\\Security\\Member', '2017-10-02 08:09:36', '2017-09-23 14:13:27', 'Default Admin', NULL, 'irxlocal', '5a65c921ece77f3b376fc40896608d057d3da2f3', '2017-10-05 08:09:36', '$2y$10$f56406b2e1e0277da3f23utctQX6ZVoDcfHX8DTNRav/1e/BScjQO', NULL, NULL, 'blowfish', '10$f56406b2e1e0277da3f230', NULL, NULL, 'en_GB', 0);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

CREATE TABLE IF NOT EXISTS `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Security\\MemberPassword') DEFAULT 'SilverStripe\\Security\\MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `MemberID` (`MemberID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `LastEdited`, `Created`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'SilverStripe\\Security\\MemberPassword', '2017-09-23 14:13:28', '2017-09-23 14:13:28', '$2y$10$7c2ccf4dca7b55f7584d7eqdhd2878YTknQ11DYRbTSYb5sttXXOm', '10$7c2ccf4dca7b55f7584d7e', 'blowfish', 1),
(2, 'SilverStripe\\Security\\MemberPassword', '2017-09-23 14:21:01', '2017-09-23 14:21:01', '$2y$10$1fe5ed9a49345a5ce5648ur.s1QUkkVQJmeZhKBpYNbSylZ20bbPW', '10$1fe5ed9a49345a5ce56483', 'blowfish', 1),
(3, 'SilverStripe\\Security\\MemberPassword', '2017-09-23 14:23:51', '2017-09-23 14:23:51', '$2y$10$f56406b2e1e0277da3f23utctQX6ZVoDcfHX8DTNRav/1e/BScjQO', '10$f56406b2e1e0277da3f230', 'blowfish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Page_Collections`
--

CREATE TABLE IF NOT EXISTS `Page_Collections` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PageID` int(11) NOT NULL DEFAULT '0',
  `CollectionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PageID` (`PageID`),
  KEY `CollectionID` (`CollectionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `Page_Collections`
--

INSERT INTO `Page_Collections` (`ID`, `PageID`, `CollectionID`) VALUES
(3, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE IF NOT EXISTS `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Security\\Permission') DEFAULT 'SilverStripe\\Security\\Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `LastEdited`, `Created`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'SilverStripe\\Security\\Permission', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'SilverStripe\\Security\\Permission', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'SilverStripe\\Security\\Permission', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'SilverStripe\\Security\\Permission', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'SilverStripe\\Security\\Permission', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

CREATE TABLE IF NOT EXISTS `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Security\\PermissionRole') DEFAULT 'SilverStripe\\Security\\PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

CREATE TABLE IF NOT EXISTS `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Security\\PermissionRoleCode') DEFAULT 'SilverStripe\\Security\\PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(255) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `RoleID` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Versions`
--

CREATE TABLE IF NOT EXISTS `RedirectorPage_Versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `RememberLoginHash`
--

CREATE TABLE IF NOT EXISTS `RememberLoginHash` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\Security\\RememberLoginHash') DEFAULT 'SilverStripe\\Security\\RememberLoginHash',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `DeviceID` varchar(40) DEFAULT NULL,
  `Hash` varchar(160) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `MemberID` (`MemberID`),
  KEY `DeviceID` (`DeviceID`),
  KEY `Hash` (`Hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

CREATE TABLE IF NOT EXISTS `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\SiteConfig\\SiteConfig') DEFAULT 'SilverStripe\\SiteConfig\\SiteConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Tagline`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`) VALUES
(1, 'SilverStripe\\SiteConfig\\SiteConfig', '2017-09-23 14:13:25', '2017-09-23 14:13:25', 'Your Site Name', 'your tagline here', 'Anyone', 'LoggedInUsers', 'LoggedInUsers');

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

CREATE TABLE IF NOT EXISTS `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','CollectionPage','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(255) DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `Version`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 'Page', '2017-09-23 14:13:25', '2017-09-23 14:13:25', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(2, 'Page', '2017-09-23 14:13:26', '2017-09-23 14:13:25', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(3, 'Page', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(4, 'SilverStripe\\ErrorPage\\ErrorPage', '2017-09-23 15:00:20', '2017-09-23 14:13:26', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(5, 'SilverStripe\\ErrorPage\\ErrorPage', '2017-09-23 15:00:24', '2017-09-23 14:13:27', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(6, 'CollectionPage', '2017-10-01 01:17:25', '2017-09-29 12:48:52', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 2, 'Inherit', 'Inherit', 2);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

CREATE TABLE IF NOT EXISTS `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

CREATE TABLE IF NOT EXISTS `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

CREATE TABLE IF NOT EXISTS `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

CREATE TABLE IF NOT EXISTS `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','CollectionPage','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(255) DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT '0',
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `Version`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 'Page', '2017-09-23 14:13:25', '2017-09-23 14:13:25', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(2, 'Page', '2017-09-23 14:13:26', '2017-09-23 14:13:25', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(3, 'Page', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(4, 'SilverStripe\\ErrorPage\\ErrorPage', '2017-09-23 14:13:27', '2017-09-23 14:13:26', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(5, 'SilverStripe\\ErrorPage\\ErrorPage', '2017-09-23 14:13:27', '2017-09-23 14:13:27', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 1, 'Inherit', 'Inherit', 0),
(6, 'CollectionPage', '2017-10-01 01:17:25', '2017-09-29 12:48:52', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 2, 'Inherit', 'Inherit', 2);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Versions`
--

CREATE TABLE IF NOT EXISTS `SiteTree_Versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SilverStripe\\CMS\\Model\\SiteTree','Page','CollectionPage','SilverStripe\\ErrorPage\\ErrorPage','SilverStripe\\CMS\\Model\\RedirectorPage','SilverStripe\\CMS\\Model\\VirtualPage') DEFAULT 'Page',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ReportClass` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ClassName` (`ClassName`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `SiteTree_Versions`
--

INSERT INTO `SiteTree_Versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 1, 1, 1, 0, 0, 'Page', '2017-09-23 14:13:25', '2017-09-23 14:13:25', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(2, 2, 1, 1, 0, 0, 'Page', '2017-09-23 14:13:25', '2017-09-23 14:13:25', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(3, 3, 1, 1, 0, 0, 'Page', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(4, 4, 1, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2017-09-23 14:13:26', '2017-09-23 14:13:26', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(5, 5, 1, 1, 0, 0, 'SilverStripe\\ErrorPage\\ErrorPage', '2017-09-23 14:13:27', '2017-09-23 14:13:27', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(6, 6, 1, 0, 1, 0, 'Page', '2017-09-29 12:48:52', '2017-09-29 12:48:52', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2),
(7, 6, 2, 1, 1, 1, 'CollectionPage', '2017-10-01 01:17:24', '2017-09-29 12:48:52', 'new-page', 'New Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 2);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

CREATE TABLE IF NOT EXISTS `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

CREATE TABLE IF NOT EXISTS `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

CREATE TABLE IF NOT EXISTS `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Versions`
--

CREATE TABLE IF NOT EXISTS `VirtualPage_Versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
