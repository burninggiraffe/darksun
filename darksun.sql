-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2019 at 08:31 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `darksun`
--
CREATE DATABASE IF NOT EXISTS `darksun` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `darksun`;

-- --------------------------------------------------------

--
-- Table structure for table `athas_locations_v2`
--

CREATE TABLE `athas_locations_v2` (
  `al2_id` int(11) NOT NULL,
  `al2_title` varchar(100) NOT NULL COMMENT 'village name',
  `al2_xpos` int(11) NOT NULL COMMENT 'xpos on map',
  `al2_ypos` int(11) NOT NULL COMMENT 'ypos on map',
  `al2_icon` varchar(25) NOT NULL COMMENT 'type of icon',
  `al2_type` varchar(50) NOT NULL COMMENT 'type of village( city, landmark, etc...',
  `al2_label` varchar(50) NOT NULL,
  `al2_population` int(11) NOT NULL COMMENT 'population of area',
  `al2_reference` varchar(250) NOT NULL COMMENT 'Where this information is referenced',
  `al2_text` text NOT NULL COMMENT 'Body text of popup'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `athas_locations_v2`
--

INSERT INTO `athas_locations_v2` (`al2_id`, `al2_title`, `al2_xpos`, `al2_ypos`, `al2_icon`, `al2_type`, `al2_label`, `al2_population`, `al2_reference`, `al2_text`) VALUES
(1, 'Tyr', 641, 708, 'standard', 'City', 'top', 15000, 'The Wanderer\'s Chronicle, p46', 'Tyr is located in a fertile valley at the foothills of the Ringing Mountains.  It was the first city-state to successfully revolt against its sorcerer-king, Kalak.  Under the eye of High Templar Tithian and Agis of Asticles, the city was declared free and slavery was abolished.  Tithian ruled for almost a decade, but has recently disappeared, rumored to have died defending the city-state.  The wise Agis has gone missing as well.  The city is now administered mainly by the Council of Advisors, which is comprised of representatives from the important groups found throughout Tyr.  Tyr\'s main means of commerce is iron ore, which has been its staple for many years.  In the past, slaves worked the iron mines, but now free citizens are paid to harvest the ore.<br><br>The transition to a free state has not been a seamless one for Tyr.  Originally, the other city-states refused to trade with Tyr, causing a great shortage of supplies.  Urik marched on the city during the first year of freedom, attempting to capture the valuable iron mines.  A templar revolt crippled the bureaucracy in year three, and worker strikes brought the city to standstill in year six.  The recent Great Earthquake caused significant damage to the city, and caused a serious refugee problem.  But despite these challenges, the Council of Advisors has developed into a competent ruling body, and Tyr continues to forge ahead as the first Free City.  However, tales of a Kreen Empire to the west, and a mad sorcerer-king named Dregoth to the east make the city ill at ease.'),
(2, 'Spoil', 1129, 1055, 'standard', 'Village', 'bottom', 175, 'The Wanderer\'s Chronicle, p105', 'Spoil, the oasis village located in the southmost corner of the Glowing Desert, is a community of ex-slaves who use the village as a base from which to launch raids on nearby trade routes.  A powerful defiler named Densis leads the tribe.  He\'s protected by Gorzu and Urtke, two half-giants devoted to the defiler.<br><br>Densis hates Talid of Ravage with a passion.  Talid wishes to unit the Bandit States under one nation, with himself as the leader.  Densis believes that if anyone is going to rule a united bandit nation, it should be him and not some muscle-bound half-breed.  Densis doesn\'t dare send his smaller and weaker tribe against Talid\'s, but someday he plans to destroy the mul and take command of the wealthy Ravage.<br><br>While his tribe conducts raids or ambushes members of the other Bandit States, Densis travels north to the ruins of the Buried City.  He has been exploring this site for almost three years, and each time he returns to Spoil, he has a bit more power at his command.  Few of his followers will accompany him to the ruins, for they believe that the place is haunted by terrible spirits and undead creatures.  The fact that Densis regularly communes with these beings makes him more important in their eyes -- and that much more frightening.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `athas_locations_v2`
--
ALTER TABLE `athas_locations_v2`
  ADD PRIMARY KEY (`al2_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `athas_locations_v2`
--
ALTER TABLE `athas_locations_v2`
  MODIFY `al2_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
