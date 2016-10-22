-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2016 at 09:06 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `quizon`
--

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE IF NOT EXISTS `challenges` (
  `challengeid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  PRIMARY KEY (`challengeid`,`qid`),
  KEY `qid` (`qid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`challengeid`, `qid`) VALUES
(6, 1),
(7, 1),
(1, 3),
(3, 3),
(4, 3),
(5, 3),
(9, 5),
(10, 7),
(8, 8),
(2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `challenges_score`
--

CREATE TABLE IF NOT EXISTS `challenges_score` (
  `userid` int(11) NOT NULL,
  `challengeid` int(11) NOT NULL,
  `score` int(11) DEFAULT '0',
  PRIMARY KEY (`userid`,`challengeid`),
  KEY `challengeid` (`challengeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `challenges_score`
--

INSERT INTO `challenges_score` (`userid`, `challengeid`, `score`) VALUES
(4, 1, 18),
(4, 4, 2),
(4, 6, 22),
(4, 7, 87),
(6, 5, 58),
(7, 10, 69),
(8, 1, 58),
(9, 5, 10),
(10, 4, 1),
(10, 10, 89);

-- --------------------------------------------------------

--
-- Table structure for table `community`
--

CREATE TABLE IF NOT EXISTS `community` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `community`
--

INSERT INTO `community` (`cid`, `name`) VALUES
(1, 'Miboo'),
(2, 'Youbridge'),
(3, 'Yotz'),
(4, 'Meezzy'),
(5, 'Vinder'),
(6, 'Yodo'),
(7, 'Edgepulse'),
(8, 'Vidoo'),
(9, 'Viva'),
(10, 'Bubblemix');

-- --------------------------------------------------------

--
-- Table structure for table `com_post`
--

CREATE TABLE IF NOT EXISTS `com_post` (
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`postid`),
  KEY `userid` (`userid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `com_post`
--

INSERT INTO `com_post` (`postid`, `userid`, `cid`) VALUES
(1, 2, 10),
(2, 8, 2),
(3, 3, 3),
(4, 2, 9),
(5, 3, 5),
(6, 8, 6),
(7, 2, 4),
(8, 8, 6),
(9, 10, 1),
(10, 9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE IF NOT EXISTS `exam` (
  `examid` int(11) NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`examid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`examid`, `time`, `date`) VALUES
(1, '08:46:00', '2015-10-18'),
(2, '14:34:00', '2015-12-17'),
(3, '09:56:00', '2015-10-09'),
(4, '06:20:00', '2015-09-27'),
(5, '03:13:00', '2015-06-26'),
(6, '14:46:00', '2015-09-01'),
(7, '08:32:00', '2016-03-01'),
(8, '18:30:00', '2015-09-06'),
(9, '19:03:00', '2015-05-15'),
(10, '23:31:00', '2015-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempts`
--

CREATE TABLE IF NOT EXISTS `exam_attempts` (
  `userid` int(11) NOT NULL,
  `examid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`examid`),
  KEY `examid` (`examid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_attempts`
--

INSERT INTO `exam_attempts` (`userid`, `examid`) VALUES
(2, 2),
(9, 2),
(10, 2),
(2, 4),
(7, 4),
(4, 6),
(6, 6),
(4, 7),
(10, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `exam_posts`
--

CREATE TABLE IF NOT EXISTS `exam_posts` (
  `userid` int(11) NOT NULL,
  `examid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`examid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_posts`
--

INSERT INTO `exam_posts` (`userid`, `examid`) VALUES
(1, 4),
(1, 5),
(4, 9),
(5, 7),
(5, 9),
(6, 9),
(7, 5),
(7, 7),
(8, 3),
(9, 3);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `userid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`userid`,`iid`),
  KEY `iid` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`userid`, `iid`, `description`) VALUES
(3, 2, 'you guys rock'),
(3, 5, 'i liked it '),
(3, 9, 'need improvement'),
(6, 2, 'this is good for real'),
(6, 3, 'this thing is good'),
(6, 9, 'it is the real good'),
(7, 1, 'i am impressed'),
(7, 4, 'good job'),
(8, 4, 'you that guy rock'),
(8, 8, 'you are the real MVP');

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE IF NOT EXISTS `interests` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`iid`, `description`) VALUES
(1, 'Machine Learning'),
(2, 'php'),
(3, 'linux'),
(4, 'cats'),
(5, 'C'),
(6, 'programming'),
(7, 'YouTube'),
(8, 'BIG DATA'),
(9, 'DOTA2'),
(10, 'RDBMS');

-- --------------------------------------------------------

--
-- Table structure for table `mentors`
--

CREATE TABLE IF NOT EXISTS `mentors` (
  `userid` int(11) NOT NULL,
  `qualification` text,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentors`
--

INSERT INTO `mentors` (`userid`, `qualification`) VALUES
(1, 'PH.D-ML'),
(2, 'PG-BT'),
(3, 'PH.D'),
(4, 'PG-CSE'),
(5, 'MS-CSE'),
(6, '12th'),
(7, 'UG-CSE'),
(8, 'PH.D'),
(9, 'MS-ML'),
(10, 'UG-BT');

-- --------------------------------------------------------

--
-- Table structure for table `mentor_activity`
--

CREATE TABLE IF NOT EXISTS `mentor_activity` (
  `userid` int(11) NOT NULL,
  `exams_made` int(11) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentor_activity`
--

INSERT INTO `mentor_activity` (`userid`, `exams_made`) VALUES
(1, 6),
(2, 8),
(3, 1),
(4, 6),
(5, 5),
(6, 1),
(7, 5),
(8, 4),
(9, 8),
(10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mentor_skill`
--

CREATE TABLE IF NOT EXISTS `mentor_skill` (
  `userid` int(11) NOT NULL,
  `skillid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`skillid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mentor_skill`
--

INSERT INTO `mentor_skill` (`userid`, `skillid`) VALUES
(2, 6),
(5, 3),
(5, 10),
(6, 1),
(7, 1),
(7, 4),
(8, 1),
(8, 10),
(9, 5),
(9, 8);

-- --------------------------------------------------------

--
-- Table structure for table `poll`
--

CREATE TABLE IF NOT EXISTS `poll` (
  `pollid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`pollid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `poll`
--

INSERT INTO `poll` (`pollid`, `description`) VALUES
(1, ' are you PM.'),
(2, 'would you like to play csgo'),
(3, 'are you an english speaker'),
(4, 'this is good'),
(5, 'are you god ??'),
(6, 'have you seen god'),
(7, 'are you a master of linux'),
(8, 'wanna have lunch today'),
(9, 'this is just a random string'),
(10, 'this is a test');

-- --------------------------------------------------------

--
-- Table structure for table `poll_generation`
--

CREATE TABLE IF NOT EXISTS `poll_generation` (
  `pollid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`pollid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poll_generation`
--

INSERT INTO `poll_generation` (`pollid`, `userid`) VALUES
(9, 1),
(7, 2),
(5, 3),
(2, 4),
(10, 4),
(6, 5),
(3, 7),
(4, 7),
(1, 8),
(8, 10);

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

CREATE TABLE IF NOT EXISTS `poll_options` (
  `pollid` int(11) NOT NULL,
  `options` varchar(100) NOT NULL,
  `hits` int(11) DEFAULT '0',
  PRIMARY KEY (`pollid`,`options`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poll_options`
--

INSERT INTO `poll_options` (`pollid`, `options`, `hits`) VALUES
(1, 'Count me in', 39),
(1, 'once more', 37),
(2, 'sure', 37),
(5, 'i am not sure', 11),
(5, 'I do not know', 28),
(6, '50', 10),
(6, 'NO', 39),
(8, 'Hell Yeah !!', 6),
(8, 'i am a good guy', 38),
(8, 'yes', 47);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postid`, `description`) VALUES
(1, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.'),
(2, 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'),
(3, 'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.'),
(4, 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.'),
(5, 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.'),
(6, 'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.'),
(7, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'),
(8, 'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.'),
(9, 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.'),
(10, 'Nunc purus.');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(50) NOT NULL,
  `opt1` varchar(30) NOT NULL,
  `opt2` varchar(30) NOT NULL,
  `opt3` varchar(30) NOT NULL,
  `opt4` varchar(30) NOT NULL,
  `answer` int(4) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `isPublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qid`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `answer`, `isActive`, `isPublic`) VALUES
(1, 'Nulla mollis molestie lorem. Quisque ut erat. Cura', 'Quisque id justo sit amet sapi', 'Cras non velit nec nisi vulput', 'Etiam justo.', 'Vestibulum quam sapien, varius', 4, 1, 0),
(2, 'Vivamus vel nulla eget eros elementum pellentesque', 'Pellentesque ultrices mattis o', 'Aenean auctor gravida sem. Pra', 'Duis mattis egestas metus.', 'Quisque arcu libero, rutrum ac', 3, 0, 0),
(3, 'Pellentesque at nulla. Suspendisse potenti. Cras i', 'Pellentesque at nulla.', 'Vestibulum ante ipsum primis i', 'Maecenas leo odio, condimentum', 'Mauris sit amet eros.', 2, 1, 0),
(4, 'Etiam vel augue. Vestibulum rutrum rutrum neque. A', 'In quis justo.', 'Vivamus vel nulla eget eros el', 'Pellentesque viverra pede ac d', 'Maecenas ut massa quis augue l', 1, 1, 1),
(5, 'Morbi vel lectus in quam fringilla rhoncus. Mauris', 'Integer non velit.', 'Maecenas pulvinar lobortis est', 'Vestibulum ante ipsum primis i', 'Curabitur in libero ut massa v', 1, 0, 1),
(6, 'Duis consequat dui nec nisi volutpat eleifend. Don', 'Nulla suscipit ligula in lacus', 'Nulla tempus. Vivamus in felis', 'Vivamus in felis eu sapien cur', 'Integer tincidunt ante vel ips', 2, 0, 1),
(7, 'Vestibulum quam sapien, varius ut, blandit non, in', 'Morbi vestibulum, velit id pre', 'Nullam sit amet turpis element', 'Curabitur in libero ut massa v', 'Duis at velit eu est congue el', 1, 0, 1),
(8, 'Pellentesque eget nunc. Donec quis orci eget orci ', 'Vestibulum ante ipsum primis i', 'Nam nulla. Integer pede justo,', 'Lorem ipsum dolor sit amet, co', 'Integer pede justo, lacinia eg', 3, 1, 1),
(9, 'Maecenas pulvinar lobortis est. Phasellus sit amet', 'Pellentesque ultrices mattis o', 'Pellentesque ultrices mattis o', 'Proin eu mi. Nulla ac enim.', 'Sed sagittis.', 3, 1, 0),
(10, 'Maecenas ut massa quis augue luctus tincidunt. Nul', 'Aenean fermentum. Donec ut mau', 'Nulla mollis molestie lorem.', 'In blandit ultrices enim.', 'Cras non velit nec nisi vulput', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `question_push`
--

CREATE TABLE IF NOT EXISTS `question_push` (
  `examid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  PRIMARY KEY (`qid`,`examid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_push`
--

INSERT INTO `question_push` (`examid`, `qid`) VALUES
(4, 1),
(9, 1),
(9, 2),
(10, 3),
(8, 5),
(3, 7),
(6, 8),
(7, 8),
(9, 9),
(5, 10);

-- --------------------------------------------------------

--
-- Table structure for table `q_int_user`
--

CREATE TABLE IF NOT EXISTS `q_int_user` (
  `qid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `iid` (`iid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `q_int_user`
--

INSERT INTO `q_int_user` (`qid`, `userid`, `iid`) VALUES
(1, 1, 1),
(2, 6, 4),
(3, 4, 5),
(4, 6, 1),
(5, 7, 1),
(6, 5, 7),
(7, 4, 10),
(8, 7, 4),
(9, 6, 7),
(10, 10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `skillid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`skillid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skillid`, `description`) VALUES
(1, 'Nulla suscipit ligula in lacus'),
(2, 'Ut at dolor quis odio consequa'),
(3, 'Donec posuere metus vitae ipsu'),
(4, 'Nulla facilisi. Cras non velit'),
(5, 'Nullam molestie nibh in lectus'),
(6, 'Aliquam sit amet diam in magna'),
(7, 'In hac habitasse platea dictum'),
(8, 'Nam dui. Proin leo odio, portt'),
(9, 'Suspendisse ornare consequat l'),
(10, 'Duis aliquam convallis nunc.');

-- --------------------------------------------------------

--
-- Table structure for table `skill_studymaterial`
--

CREATE TABLE IF NOT EXISTS `skill_studymaterial` (
  `userid` int(11) NOT NULL,
  `skillid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`skillid`,`sid`),
  KEY `skillid` (`skillid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skill_studymaterial`
--

INSERT INTO `skill_studymaterial` (`userid`, `skillid`, `sid`) VALUES
(1, 1, 7),
(10, 1, 8),
(1, 2, 8),
(5, 5, 6),
(7, 5, 4),
(1, 7, 3),
(1, 8, 2),
(1, 9, 9),
(3, 9, 7),
(10, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE IF NOT EXISTS `stats` (
  `userid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  `quiz_played` int(11) NOT NULL,
  `ixp` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`iid`),
  KEY `iid` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stats`
--

INSERT INTO `stats` (`userid`, `iid`, `quiz_played`, `ixp`) VALUES
(1, 6, 89, 29),
(1, 7, 44, 64),
(2, 1, 18, 88),
(2, 9, 96, 26),
(5, 5, 64, 39),
(5, 8, 57, 46),
(6, 1, 56, 36),
(7, 1, 21, 55),
(8, 5, 18, 45),
(9, 1, 6, 99);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `userid` int(11) NOT NULL,
  `school` varchar(40) DEFAULT NULL,
  `mentorid` int(11) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `mentorid` (`mentorid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`userid`, `school`, `mentorid`) VALUES
(1, '643 Portage Trail', 8),
(2, '809 Knutson Way', 7),
(3, '73 Sycamore Point', 8),
(4, '800 Cottonwood Way', 10),
(5, '66452 Northridge Center', 8),
(6, '770 Thompson Drive', 1),
(7, '5287 Maryland Terrace', 3),
(8, '09471 Stuart Circle', 3),
(9, '1595 Drewry Road', 1),
(10, '915 Esker Alley', 5);

-- --------------------------------------------------------

--
-- Table structure for table `student_activity`
--

CREATE TABLE IF NOT EXISTS `student_activity` (
  `userid` int(11) NOT NULL,
  `exam_attempts` int(11) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_activity`
--

INSERT INTO `student_activity` (`userid`, `exam_attempts`) VALUES
(1, 4),
(2, 9),
(3, 4),
(4, 2),
(5, 3),
(6, 1),
(7, 7),
(8, 6),
(9, 3),
(10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `study_material`
--

CREATE TABLE IF NOT EXISTS `study_material` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `study_material`
--

INSERT INTO `study_material` (`sid`, `description`) VALUES
(1, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.'),
(2, 'Nullam porttitor lacus at turpis.'),
(3, 'Donec vitae nisi.'),
(4, 'Vivamus vel nulla eget eros elementum pellentesque.'),
(5, 'Donec semper sapien a libero.'),
(6, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(7, 'Duis aliquam convallis nunc.'),
(8, 'Pellentesque at nulla.'),
(9, 'Phasellus in felis.'),
(10, 'Duis aliquam convallis nunc.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `location` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `isMentor` tinyint(1) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `name`, `email`, `location`, `password`, `isMentor`) VALUES
(1, 'dhunter0', 'jmartin0@bloomberg.com', 'Myanmar', 'vvsrMWY1CaW', 1),
(2, 'spierce1', 'jgibson1@drupal.org', 'Philippines', 'Ia9KUl7l0', 0),
(3, 'sbailey2', 'epowell2@trellian.com', 'China', '7ypHvkK', 0),
(4, 'hclark3', 'kyoung3@fotki.com', 'Argentina', 'ZO3LUWZG', 0),
(5, 'jwillis4', 'rwest4@washingtonpost.com', 'Iran', 'h6fTLDx', 1),
(6, 'hevans5', 'mcook5@sfgate.com', 'Cuba', 'z3iCwqa4uPN4', 1),
(7, 'chawkins6', 'ishaw6@prnewswire.com', 'China', 'CWXMH5mmn', 0),
(8, 'dhamilton7', 'mrichardson7@umich.edu', 'Indonesia', 'vx3XZXCD1', 0),
(9, 'hkim8', 'kevans8@imgur.com', 'Russia', 'JJkNH2Kkh9bO', 1),
(10, 'ahoward9', 'jjenkins9@alibaba.com', 'China', 'OhMBQ7bqxCZS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `userinterests`
--

CREATE TABLE IF NOT EXISTS `userinterests` (
  `userid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`iid`),
  KEY `iid` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinterests`
--

INSERT INTO `userinterests` (`userid`, `iid`) VALUES
(2, 1),
(9, 1),
(9, 2),
(5, 3),
(6, 3),
(4, 4),
(1, 5),
(9, 6),
(6, 7),
(6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user_com`
--

CREATE TABLE IF NOT EXISTS `user_com` (
  `userid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`cid`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_com`
--

INSERT INTO `user_com` (`userid`, `cid`) VALUES
(4, 1),
(8, 1),
(10, 2),
(4, 3),
(6, 3),
(3, 4),
(2, 6),
(7, 6),
(8, 6),
(8, 9);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `challenges`
--
ALTER TABLE `challenges`
  ADD CONSTRAINT `challenges_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `questions` (`qid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `challenges_score`
--
ALTER TABLE `challenges_score`
  ADD CONSTRAINT `challenges_score_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `student` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `challenges_score_ibfk_2` FOREIGN KEY (`challengeid`) REFERENCES `challenges` (`challengeid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `community`
--
ALTER TABLE `community`
  ADD CONSTRAINT `community_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `interests` (`iid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `com_post`
--
ALTER TABLE `com_post`
  ADD CONSTRAINT `com_post_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `com_post_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `community` (`cid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `com_post_ibfk_3` FOREIGN KEY (`postid`) REFERENCES `posts` (`postid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `exam_attempts`
--
ALTER TABLE `exam_attempts`
  ADD CONSTRAINT `exam_attempts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `student` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `exam_attempts_ibfk_2` FOREIGN KEY (`examid`) REFERENCES `exam` (`examid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `exam_posts`
--
ALTER TABLE `exam_posts`
  ADD CONSTRAINT `exam_posts_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `mentors` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`iid`) REFERENCES `interests` (`iid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mentors`
--
ALTER TABLE `mentors`
  ADD CONSTRAINT `mentors_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mentor_activity`
--
ALTER TABLE `mentor_activity`
  ADD CONSTRAINT `mentor_activity_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `mentors` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `mentor_skill`
--
ALTER TABLE `mentor_skill`
  ADD CONSTRAINT `mentor_skill_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `mentors` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `poll_generation`
--
ALTER TABLE `poll_generation`
  ADD CONSTRAINT `poll_generation_ibfk_1` FOREIGN KEY (`pollid`) REFERENCES `poll` (`pollid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `poll_generation_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `student` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `poll_options`
--
ALTER TABLE `poll_options`
  ADD CONSTRAINT `poll_options_ibfk_1` FOREIGN KEY (`pollid`) REFERENCES `poll` (`pollid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `q_int_user`
--
ALTER TABLE `q_int_user`
  ADD CONSTRAINT `q_int_user_ibfk_1` FOREIGN KEY (`iid`) REFERENCES `interests` (`iid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `q_int_user_ibfk_2` FOREIGN KEY (`qid`) REFERENCES `questions` (`qid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `q_int_user_ibfk_3` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `skill_studymaterial`
--
ALTER TABLE `skill_studymaterial`
  ADD CONSTRAINT `skill_studymaterial_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `mentors` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `skill_studymaterial_ibfk_2` FOREIGN KEY (`skillid`) REFERENCES `skill` (`skillid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `skill_studymaterial_ibfk_3` FOREIGN KEY (`sid`) REFERENCES `study_material` (`sid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stats`
--
ALTER TABLE `stats`
  ADD CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `stats_ibfk_2` FOREIGN KEY (`iid`) REFERENCES `interests` (`iid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`mentorid`) REFERENCES `mentors` (`userid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `student_activity`
--
ALTER TABLE `student_activity`
  ADD CONSTRAINT `student_activity_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `student` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `userinterests`
--
ALTER TABLE `userinterests`
  ADD CONSTRAINT `userinterests_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `userinterests_ibfk_2` FOREIGN KEY (`iid`) REFERENCES `interests` (`iid`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_com`
--
ALTER TABLE `user_com`
  ADD CONSTRAINT `user_com_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_com_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `community` (`cid`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
