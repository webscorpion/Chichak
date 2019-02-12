-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 12, 2019 at 06:26 PM
-- Server version: 10.2.19-MariaDB-log-cll-lve
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipsdir_turkmedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Parrent_ID` int(11) NOT NULL,
  `Permalink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `Comment_ID` int(11) NOT NULL,
  `Main_ID` int(11) NOT NULL,
  `Group_ID` int(4) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Rating` tinyint(1) NOT NULL,
  `Parrent_ID` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `Gallery_ID` int(11) NOT NULL,
  `News_ID` int(11) NOT NULL,
  `ImagePath` varchar(255) NOT NULL,
  `Caption` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ip`
--

CREATE TABLE `ip` (
  `IP_ID` int(11) NOT NULL,
  `Main_ID` int(11) NOT NULL,
  `Insert_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `IPAddress` varchar(255) NOT NULL,
  `Group_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `Like_ID` int(11) NOT NULL,
  `Main_ID` int(11) NOT NULL,
  `Group_ID` int(11) NOT NULL,
  `Count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `middlenews`
--

CREATE TABLE `middlenews` (
  `MiddleNews_ID` int(11) NOT NULL,
  `News_Body` text NOT NULL,
  `News_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `News_ID` int(11) NOT NULL,
  `NewsTitle` text NOT NULL,
  `Summary` text NOT NULL,
  `Insert_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Modified_Date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `User_ID` int(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `View` int(20) NOT NULL,
  `MetaDescription` varchar(255) NOT NULL,
  `Permalink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `newscat`
--

CREATE TABLE `newscat` (
  `NewsCat_ID` int(11) NOT NULL,
  `Cat_ID` int(11) NOT NULL,
  `News_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `newstag`
--

CREATE TABLE `newstag` (
  `NewsTag_ID` int(11) NOT NULL,
  `Tag_ID` int(11) NOT NULL,
  `News_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `Tag_ID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`Tag_ID`, `Title`) VALUES
(1, 'سیامک');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Status` int(1) NOT NULL,
  `Registered_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserRoll_ID` int(11) NOT NULL,
  `Modified_Date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Is_Admin` tinyint(1) NOT NULL,
  `LastLogin` datetime NOT NULL,
  `LastIP` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Mobile` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userroll`
--

CREATE TABLE `userroll` (
  `Roll_ID` int(11) NOT NULL,
  `RollName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`Comment_ID`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`Gallery_ID`),
  ADD KEY `News_ID` (`News_ID`);

--
-- Indexes for table `ip`
--
ALTER TABLE `ip`
  ADD PRIMARY KEY (`IP_ID`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`Like_ID`);

--
-- Indexes for table `middlenews`
--
ALTER TABLE `middlenews`
  ADD PRIMARY KEY (`MiddleNews_ID`),
  ADD KEY `News_ID` (`News_ID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`News_ID`);

--
-- Indexes for table `newscat`
--
ALTER TABLE `newscat`
  ADD PRIMARY KEY (`NewsCat_ID`),
  ADD KEY `Cat_ID` (`Cat_ID`),
  ADD KEY `News_ID` (`News_ID`);

--
-- Indexes for table `newstag`
--
ALTER TABLE `newstag`
  ADD PRIMARY KEY (`NewsTag_ID`),
  ADD KEY `News_ID` (`News_ID`),
  ADD KEY `Tag_ID` (`Tag_ID`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`Tag_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `Comment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `Gallery_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ip`
--
ALTER TABLE `ip`
  MODIFY `IP_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `Like_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `middlenews`
--
ALTER TABLE `middlenews`
  MODIFY `MiddleNews_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `News_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newscat`
--
ALTER TABLE `newscat`
  MODIFY `NewsCat_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newstag`
--
ALTER TABLE `newstag`
  MODIFY `NewsTag_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `Tag_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`News_ID`) REFERENCES `news` (`News_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `middlenews`
--
ALTER TABLE `middlenews`
  ADD CONSTRAINT `middlenews_ibfk_1` FOREIGN KEY (`News_ID`) REFERENCES `news` (`News_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newscat`
--
ALTER TABLE `newscat`
  ADD CONSTRAINT `newscat_ibfk_1` FOREIGN KEY (`Cat_ID`) REFERENCES `category` (`Category_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `newscat_ibfk_2` FOREIGN KEY (`News_ID`) REFERENCES `news` (`News_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `newstag`
--
ALTER TABLE `newstag`
  ADD CONSTRAINT `newstag_ibfk_1` FOREIGN KEY (`News_ID`) REFERENCES `news` (`News_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `newstag_ibfk_2` FOREIGN KEY (`Tag_ID`) REFERENCES `tag` (`Tag_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
