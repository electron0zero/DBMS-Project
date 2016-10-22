-- --------------------------------------------------------
-- create database and use that databse before running this
-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `location` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `isMentor` BOOLEAN NOT NULL,
  PRIMARY KEY (`userid`)
);

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`iid`)
);



-- --------------------------------------------------------

--
-- Table structure for table `userInterests`
--

CREATE TABLE `userInterests` (
  `userid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`iid`),
  FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) on delete cascade on update no action,
  FOREIGN KEY (`iid`) REFERENCES `interests` (`iid`) on delete no action on update cascade

);

-- --------------------------------------------------------
--
-- Table structure for table `community`
--

CREATE TABLE `community` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`cid`),
  FOREIGN KEY (`cid`) REFERENCES `interests` (`iid`) on delete cascade on update no action
);



-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  PRIMARY KEY (`postid`)
);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(50) NOT NULL,
  `opt1` varchar(30) NOT NULL,
  `opt2` varchar(30) NOT NULL,
  `opt3` varchar(30) NOT NULL,
  `opt4` varchar(30) NOT NULL,
  `answer` INT(4) NOT NULL,
  `isActive` BOOLEAN NOT NULL DEFAULT TRUE,
  `isPublic` BOOLEAN NOT NULL DEFAULT TRUE,
  PRIMARY KEY (`qid`)
);


-- --------------------------------------------------------

--
-- Table structure for table `com_post`
--

CREATE TABLE `com_post` (
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`postid`),
  FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) on delete no action on update no action,
  FOREIGN KEY (`cid`) REFERENCES `community` (`cid`) on delete no action on update no action,
  FOREIGN KEY (`postid`) REFERENCES `posts` (`postid`) on delete cascade on update no action
);








-- --------------------------------------------------------

--
-- Table structure for table `q_int_user`
--

CREATE TABLE `q_int_user` (
  `qid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `iid` int(11) NOT NULL,
  PRIMARY KEY (`qid`),
  FOREIGN KEY (`iid`) REFERENCES `interests` (`iid`) on delete no action on update no action,
  FOREIGN KEY (`qid`) REFERENCES `questions` (`qid`) on delete cascade on update no action,
  FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) on delete cascade on update no action
);


-- --------------------------------------------------------

--
-- Table structure for table `user_com`
--

CREATE TABLE `user_com` (
  `userid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`cid`),
  FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) on delete cascade on update no action,
  FOREIGN KEY (`cid`) REFERENCES `community` (`cid`) on delete cascade on update no action
);


-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

create table `stats`(
    `userid` int NOT NULL,
    `iid` int NOT NULL,
    `quiz_played` int NOT NULL,
    `ixp` int NOT NULL,
    PRIMARY KEY (`userid`,`iid`),
	foreign key (`userid`) references `user` (`userid`) on delete cascade on update no action,
	foreign key (`iid`) references `interests` (`iid`) on delete cascade on update no action
);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

create table `feedback`(
	`userid` int NOT NULL,
	`iid` int NOT NULL,
	`description` text not null,
	primary key (`userid`,`iid`),
	foreign key (`userid`) references `user` (`userid`) on delete cascade on update no action,
	foreign key (`iid`) references `interests` (`iid`) on delete cascade on update no action
);


-- --------------------------------------------------------

--
-- Table structure for table `mentors`
--

create table `mentors`(
	`userid` int not null,
	`qualification` text,
	primary key (`userid`),
 foreign key (`userid`) references `user` (`userid`) on delete cascade on update no action
);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

create table `student`(
	`userid` int not null,
	`school` varchar (40),
	`mentorid` int not null,
	primary key (`userid`),
	foreign key (`userid`) references `user` (`userid`) on delete cascade on update no action,
	foreign key (`mentorid`) references `mentors` (`userid`) on delete no action on update cascade
);

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

create table `student_activity` (
`userid` int not null,
`exam_attempts` int not null ,
primary key (`userid`),
foreign key (`userid`) references `student`(`userid`) on delete cascade on update no action
);
-- --------------------------------------------------------

--
-- Table structure for table `mentor_activity`
--

create table `mentor_activity` (
`userid` int not null,
`exams_made` int not null,
primary key (`userid`),
foreign key (`userid`) references `mentors` (`userid`) on delete cascade on update no action
);
-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

create table `exam` (
`examid` int not null auto_increment,
`time` time,
`date` date,
primary key (`examid`)
);

-- --------------------------------------------------------

--
-- Table structure for table `exam_posts`
--

create table `exam_posts` (
	`userid` int not null,
	`examid` int not null,
	primary key (`userid`, `examid`),
	foreign key (`userid`) references `mentors` (`userid`) on delete cascade on update no action
);

-- --------------------------------------------------------

--
-- Table structure for table `exam_attempts`
--


create table `exam_attempts` (
	`userid` int not null,
	`examid` int not null,
	primary key (`userid`, `examid`),
	foreign key (`userid`) references `student` (`userid`) on delete cascade on update no action,
    foreign key (`examid`) references `exam` (`examid`) on delete no action on update no action
);

-- --------------------------------------------------------

--
-- Table structure for table `question_push`
--


create table `question_push` (
	`examid` int not null,
	`qid` int not null,
	primary key (`qid`, `examid`)
);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--


create table `skill` (
	`skillid` int not null auto_increment,
`description` varchar(30),
primary key (`skillid`)
);

-- --------------------------------------------------------

--
-- Table structure for table `mentor_skill`
--

create table `mentor_skill` (
	`userid` int not null,
	`skillid` int not null,
	primary key(`userid`, `skillid`),
	foreign key (`userid`) references `mentors` (`userid`) on delete cascade on update no action
);

-- --------------------------------------------------------

--
-- Table structure for table `study_material`
--


create table `study_material` (
	`sid` int not null auto_increment,
	`description` text not null,
	primary key(`sid`)
);

-- --------------------------------------------------------

--
-- Table structure for table `skill_studymaterial`
--


create table `skill_studymaterial`(
	`userid` int not null,
	`skillid` int not null,
	`sid` int not null,
	primary key (`userid`, `skillid`, `sid`),
	foreign key (`userid`) references `mentors`(`userid`) on delete cascade on update no action,
    foreign key (`skillid`) references `skill`(`skillid`) on delete no action on update no action,
    foreign key (`sid`) references `study_material`(`sid`) on delete no action on update no action
);
-- --------------------------------------------------------

--
-- Table structure for table `poll`
--


create table `poll` (
	`pollid` int not null auto_increment,
	`description` text not null,
	primary key (`pollid`)
);

-- --------------------------------------------------------

--
-- Table structure for table `poll_options`
--

create table `poll_options` (
	`pollid` int not null,
	`options` VARCHAR(100) NOT NULL,
	`hits` int default 0,
	primary key(`pollid`, `options`),
	foreign key(`pollid`) references `poll` (`pollid`) on delete cascade on update cascade
);

-- --------------------------------------------------------

--
-- Table structure for table `spoll_generation`
--


create table `poll_generation` (
	`pollid` int not null,
	`userid` int not null,
	primary key (`pollid`),
	foreign key (`pollid`) references `poll` (`pollid`) on delete cascade on update no action,
	foreign key (`userid`) references `student` (`userid`) on delete cascade on update no action
);

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--


create table `challenges`(
	`challengeid` int not null auto_increment,
	`qid` int not null,
	primary key (`challengeid`,`qid`),
	foreign key(`qid`) references `questions` (`qid`) on delete cascade on update no action
);


-- --------------------------------------------------------

--
-- Table structure for table `challenges_score`
--


create table `challenges_score` (
	`userid` int not null,
	`challengeid` int not null,
	`score` int default 0,
	primary key (`userid`,`challengeid`),
	foreign key(`userid`) references `student`(`userid`) on delete cascade on update no action,
	foreign key(`challengeid`) references `challenges`(`challengeid`) on delete cascade on update no action
);
