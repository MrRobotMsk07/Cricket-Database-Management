SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `cricket`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `stadium` ()  NO SQL
select * from stadiums$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('user1', '123');



-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `cap_no` decimal(4,0) NOT NULL,
  `age` decimal(2,0) NOT NULL,
  `dob` date NOT NULL,
  `runs` decimal(5,0) NOT NULL,
  `wickets` decimal(3,0) NOT NULL,
  `type` varchar(20) NOT NULL,
  `no_of_matches` decimal(3,0) NOT NULL,
  `rank` decimal(3,0) NOT NULL,
  `batting_best` varchar(10) NOT NULL,
  `bowling_best` varchar(10) NOT NULL,
  `playername` varchar(30) NOT NULL,
  `image` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--

INSERT INTO `player` (`cap_no`, `age`, `dob`, `runs`, `wickets`, `type`, `no_of_matches`, `rank`, `batting_best`, `bowling_best`, `playername`, `name`) VALUES

('18', '29', '5-11-1988', '4008', '4', 'Batsman', '207', '1', '113*', '18/2', 'viratkohli', 'RCB');

--
-- Triggers `player`
--
DELIMITER $$
CREATE TRIGGER `update` BEFORE UPDATE ON `player` FOR EACH ROW BEGIN
IF (new.runs<old.runs) THEN SET new.runs=old.runs;
IF (new.wickets<old.wickets) THEN SET new.wickets=old.wickets;
END IF;
IF (new.no_of_matches<old.no_of_matches) THEN SET new.no_of_matches=old.no_of_matches;
END IF;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `team1` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `match_no` decimal(3,0) NOT NULL,
  `team2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--

INSERT INTO `schedules` (`team1`, `date`, `match_no`, `team2`) VALUES
('csk', '15-11-2021', '2', 'rcb'),
('mi', '15-11-2021', '2', 'csk');



-- -----------------------------------------------
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `played_in`
--
ALTER TABLE `played_in`
  ADD PRIMARY KEY (`stadium_name`,`board_name`,`team`,`team1`,`date`,`team2`),
  ADD KEY `team1` (`team1`,`date`,`team2`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`cap_no`,`name`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`team1`,`date`,`team2`);

--
-- Indexes for table `selected_for`
--
ALTER TABLE `selected_for`
  ADD PRIMARY KEY (`cap_no`,`name`,`team1`,`date`,`team2`),
  ADD KEY `team1` (`team1`,`date`,`team2`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`name`);
COMMIT;
