-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 30, 2016 at 01:47 PM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chatroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `message` varchar(100) NOT NULL,
  `createdDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `message`, `createdDate`) VALUES
(1, 'admin', 'Hello!', '2016-05-25'),
(2, 'admin', 'Testing!', '2016-05-25'),
(3, 'admin', 'asd', '2016-05-25'),
(4, 'admin', 'asd', '2016-05-25'),
(5, 'admin1', 'testing', '2016-05-25'),
(6, 'admin1', 'sad', '2016-05-25'),
(7, 'admin1', '', '2016-05-25'),
(8, 'admin', 'asdasdasdasd', '2016-05-25'),
(9, 'admin', 'adsd', '2016-05-27'),
(10, 'admin', 'asdasd', '2016-05-27'),
(11, 'admin', 'asdasdasdasd', '2016-05-27'),
(12, 'admin', 'aaaasdasd', '2016-05-27'),
(13, 'admin', 'asdasd', '2016-05-27'),
(14, 'admin', 'asdssss', '2016-05-27'),
(15, 'admin', 'asdasd', '2016-05-27'),
(16, 'admin', 'aaaa', '2016-05-27'),
(17, 'admin', 'dddd', '2016-05-27'),
(18, 'admin', 'Hello', '2016-05-27'),
(19, 'admin1', 'hehehe', '2016-05-27'),
(20, 'admin', 'nice typing hahaha', '2016-05-27'),
(21, 'admin1', 'yun nice', '2016-05-27'),
(22, 'admin', 'hahahaha', '2016-05-27'),
(23, 'admin', 'Hello Everyone', '2016-05-27'),
(24, 'admin1', 'hey', '2016-05-27'),
(25, 'admin2', 'nice try', '2016-05-27'),
(26, 'admin', '123456', '2016-05-27'),
(27, 'admin1', 'asd', '2016-05-27'),
(28, 'admin', 'asd', '2016-05-27'),
(29, 'admin', 'testing', '2016-05-27'),
(30, 'admin', 'jkhkh', '2016-05-27'),
(31, 'admin1', 'kl', '2016-05-27'),
(32, 'admin', 'asd', '2016-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'admin1', '21232f297a57a5a743894a0e4a801fc3'),
(3, 'admin2', '21232f297a57a5a743894a0e4a801fc3');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
