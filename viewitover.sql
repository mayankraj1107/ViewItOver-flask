-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2021 at 06:01 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viewitover`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `ph_no` varchar(10) NOT NULL,
  `mssg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `ph_no`, `mssg`, `date`) VALUES
(1, 'tfujh', 'first@gmail.com', '956277156', 'hvyxfhbn', '2020-12-25 00:42:53'),
(10, 'MAYANK RAJ', 'mayank1107raj@gmail.com', '0958825610', 'b jhbh', '2020-12-29 00:10:05'),
(11, 'MAYANK RAJ', 'mayank1107raj@gmail.com', '0958825610', 'b jhbh', '2020-12-29 00:11:12'),
(12, 'MAYANK RAJ', 'mayank1107raj@gmail.com', '0958825610', 'jhjknlk', '2020-12-29 00:11:47');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `tagline` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `tagline`, `date`, `img_file`) VALUES
(1, 'Two and a Half Men', 'two-and-a-half-men', 'Two and a Half Men is an American television sitcom that originally aired on CBS for twelve seasons from September 22, 2003, to February 19, 2015. Originally starring Charlie Sheen, Jon Cryer, and Angus T. Jones, the series was about a hedonistic jingle writer, Charlie Harper, his uptight brother, Alan, and Alan\'s troublesome son, Jake. After Alan divorces, he and Jake move into Charlie\'s beachfront Malibu house and complicate Charlie\'s freewheeling life. In 2010, CBS and Warner Bros. Television reached a multiyear broadcasting agreement for the series, renewing it through at least the 2011–12 season.In February 2011, however, CBS and Warner Bros. decided to end production for the rest of the eighth season after Sheen entered drug rehabilitation and made \"disparaging comments\" about the series\' creator and executive producer Chuck Lorre.Sheen\'s contract was terminated the following month and he was written out of the show after it was confirmed that Sheen would not be returning to the series. Ashton Kutcher was hired to replace him the following season as Walden Schmidt, a billionaire who buys Charlie\'s house after his death.', 'this is the first tag line of the first post ', '2020-12-29 21:16:07', 'post-bg.jpg'),
(2, 'Parks And Recreation ', 'parks-and-recreation ', 'Coming in at a low (for this list) 8.6, Parks and Recreation blazes into the list of the best sitcoms of all time (according to IMDb) despite having ended only five years ago. When Parks and Recreation first began airing in April of 2009, many considered it a knock-off of The Office, which had been on the air for four years at that point.\r\n\r\nHowever, after a so-so first season, Parks and Recreation really hit its stride in season two, and from there worked its way into the hearts of fans everywhere to become an instant classic.', 'Problems look mighty small from 150 miles up', '2020-12-28 21:36:47', 'Parks-and-Rec.jpg'),
(3, 'Seinfeld ', 'seinfeld ', 'Kicking things off is perhaps the most influential sitcom of all time, Seinfeld. Often referred to as a show about nothing, this series follows a group of friends, including a fictionalized version of comedian Jerry Seinfeld, who live life together in New York City.\r\n\r\nThe show received 180 episodes over nine seasons between 1989 and 1998 and a legacy that\'s just as large. Breaking the conventional rules of sitcoms that came before it, Seinfeld paved the way for the genre\'s future.', 'Problems look mighty small from 150 miles up', '2020-12-28 21:38:50', 'Hogwarts-Houses-Seinfeld.jpg'),
(4, 'Freaks And Geeks ', 'freaks-and-geeks ', 'Though this one falls into comedy-drama territory, we thought it was worth a shout-out. After all, though it aired for a single 18-episode season on NBC, it received universal acclaim. Freaks and Geeks tells of a smart high school student who becomes friends with a group of slackers in Detroit during the early \'80s.', 'Problems look mighty small from 150 miles up', '2020-12-28 21:40:58', 'Freaks-and-Geeks-Promo.jpg'),
(5, 'The Office', 'the-office', 'It\'s time to drive over to Scranton, Pennsylvania, where we\'re celebrating this mockumentary about a paper company called Dunder Mifflin. Adapted from the BBC series of the same name, The Office follows the lives of the employees at the Scranton Branch, who are managed by their eccentric boss, Michael Scott.\r\n\r\nWith a compelling cast, hilarious situations, memorable characters, and a touch of romance, this sitcom had something for everyone. It aired for nine seasons on NBC from 2005 to 2013, ending with one heck of a finale.', 'Problems look mighty small from 150 miles up', '2020-12-28 21:42:18', 'the-office-steve-carell.jpg'),
(6, 'Friends', 'friends', 'The highest-rated live-action sitcom of all time is none other than Friends. If you\'re surprised by that, you shouldn\'t be; The show ran for ten seasons between 1994 and 2004 and continues to gain attention from nostalgic fans.\r\n\r\nThe series displayed the everyday lives of six young adults who attempt to navigate the ups and downs of Manhattan city life. Though early critics found the humor to be average, the reviews picked up as the chemistry and charm of the cast stole the show. It remains a pop-culture staple.', 'Problems look mighty small from 150 miles up', '2020-12-28 21:43:51', 'Friends.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
