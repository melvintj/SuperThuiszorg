-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 06 jun 2019 om 16:07
-- Serverversie: 10.1.36-MariaDB
-- PHP-versie: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `appointment` (
  `DoctorID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,									
  `Date` date DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL
	
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
--
-- Gegevens worden geëxporteerd voor tabel `appointment`
--

INSERT INTO `appointment` (`DoctorID`, `ClientID`, `Date`, `Rating`) VALUES
(1, 4, '2019-01-14', 5),
(2, 4, '2019-01-16', 3),
(3, 4, '2019-01-17', 4),
(4, 5, '2019-01-16', 4),
(5, 5, '2019-01-16', 4),
(6, 7, '2019-01-16', 3),
(8, 1, '2019-01-14', 1),
(9, 1, '2019-01-14', 5),
(10, 8, '2019-01-14', 5);

-- --------------------------------------------------------
-- Database 'superthuiszorg'
--
-- Tabelstructuur voor tabel `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `InsuranceNumber` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `client`
--

INSERT INTO `client` (`ClientID`, `InsuranceNumber`, `UserID`) VALUES
(1, 6899636, 110),
(2, 5696545, 111),
(3, 5662369, 112),
(4, 4896523, 113),
(5, 6985632, 114),
(6, 6321456, 115),
(7, 5479652, 116),
(8, 5874556, 117),
(9, 1544452, 118),
(10, 2146532, 119);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `client availability`
--

CREATE TABLE `client availability` (
  `ClientAvailableID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `DayofPart` varchar(20) DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `client availability`
--

INSERT INTO `client availability` (`ClientAvailableID`, `ClientID`, `DayofPart`, `Date`) VALUES
(0, 1, 'middag', '2004'),
(11, 3, 'middag', '2004'),
(12, 5, 'middag', '1993'),
(13, 6, 'ochtend', '1'),
(14, 7, 'avond', '2002'),
(15, 8, 'avond', '2002'),
(16, 9, 'nacht', '2004'),
(17, 10, 'nacht', '2004');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctor`
--

CREATE TABLE `doctor` (
  `DoctorID` int(11) NOT NULL,
  `AcademicDegree` varchar(20) DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `doctor`
--

INSERT INTO `doctor` (`DoctorID`, `AcademicDegree`, `UserID`) VALUES
(1, 'mbo', 100),
(2, 'hbo', 101),
(3, 'hbo', 102),
(4, 'mbo', 103),
(5, 'mbo', 104),
(6, 'hbo', 105),
(7, 'hbo', 106),
(8, 'hbo', 107),
(9, 'mbo', 108),
(10, 'mbo', 109);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctor availability`
--

CREATE TABLE `doctor availability` (
  `DoctorAvailableID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `DayofPart` varchar(20) DEFAULT NULL,
  `DoctorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `doctor availability`
--

INSERT INTO `doctor availability` (`DoctorAvailableID`, `Date`, `DayofPart`, `DoctorID`) VALUES
(1, '2019-06-06', 'middag', 1),
(2, '2019-05-01', 'middag', 2),
(3, '2016-04-04', 'ochtend', 3),
(4, '2018-10-01', 'avond', 3),
(5, '2018-01-03', 'avond', 4),
(6, '2018-11-16', 'nacht', 5),
(7, '2017-07-07', 'nacht', 6),
(8, '2018-04-30', 'middag', 7),
(9, '2018-05-12', 'middag', 8),
(10, '2017-08-14', 'avond', 9);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `log`
--

CREATE TABLE `log` (
  `LogID` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `LogDate` date DEFAULT NULL,
  `ClientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `log`
--

INSERT INTO `log` (`LogID`, `Description`, `LogDate`, `ClientID`) VALUES
(1, 'Slecht', '2019-01-20', 1),
(8, 'Goed', '2019-01-14', 1),
(9, 'Slecht', '2019-01-16', 1),
(10, 'Matig', '2019-01-18', 3),
(11, 'Goed', '2019-01-10', 2),
(14, 'Goed', '2019-01-28', 2),
(16, 'Matig', '2019-01-01', 3),
(17, 'Slecht', '2019-01-06', 5),
(18, 'Goed', '2019-01-09', 5),
(20, 'Matig', '2019-01-24', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `portal`
--

CREATE TABLE `portal` (
  `PasswordID` int(11) NOT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `portal`
--

INSERT INTO `portal` (`PasswordID`, `Username`, `Password`, `UserID`) VALUES
(201, 'anjawouw', 'Anja91. ', 100),
(202, 'robertsmit', 'Smit.! ', 101),
(203, 'Aishaahmad', 'Aishaahmad', 102),
(204, 'lindavisser', '05Visser', 103),
(205, 'Kimerleybakker', 'Bakker55. ', 104),
(206, 'ingedejong', 'Jong84. ', 105),
(207, 'evelinedik', 'Dikeveline', 106),
(208, 'erwinvos', 'Erwin54. ', 108),
(209, 'kristeldevries', 'Devries88', 109),
(210, 'corrieschenkel', 'Corrie12. ', 110),
(211, 'lizettetramper', 'Tramper!. ', 111),
(212, 'gidetvenloo', 'Verloo72. ', 112),
(213, 'leniemeer', 'Leniepenie11! ', 113),
(214, 'bepakkerman', 'Akkerman34. ', 114),
(215, 'sannedekker', 'Sannedekker23', 115),
(216, 'annepijman', 'annepijman11', 116),
(219, 'basdegroot', 'Basdegroot96', 107);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(60) DEFAULT NULL,
  `LastName` varchar(60) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Residence` varchar(60) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `TelNumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`UserID`, `FirstName`, `LastName`, `Address`, `Residence`, `Email`, `TelNumber`) VALUES
(100, 'Anja', 'Wouw', 'Alleenhouderstraat 51', 'Tilburg', 'wouw@gmail.com', '06-40779920'),
(101, 'Robert', 'Smit', 'Kwandeinstraat 50', 'Breda', 'robertsmit@gmail.com', '06-156813874'),
(102, 'Linda', 'Visser', 'Janheijnstraat 11', 'Eindhoven', 'visserlinda@hotmail.com', '06-423946566'),
(103, 'Kimberley', 'Bakker', 'Burgemeesterstraat 34', 'Breda', 'kimberley@live.nl', '06-652356232'),
(104, 'Aisha', 'Ahmad', 'Hogeschoollaan 852', 'Breda', 'ahmeraisha@home.nl', '06-025254563'),
(105, 'Inge', 'de Jong', 'Lovedeinsstraat 565', 'Den Bosch', 'dejong@gmail.com', '06-256265245'),
(106, 'Eveline', 'van Dik', 'Stadhuisplein 13', 'Best', 'dedik@hotmail.com', '06-241025696'),
(107, 'Bas', 'de Groot', 'Heuvelstraat 12', 'Best', 'Bas@degroot.nl', '06-486256369'),
(108, 'Erwin', 'Vos', 'Spoorlaan 987', 'Bergen op zoom', 'erwinvos@gmail.com', '06-214563202'),
(109, 'Kristel', 'de Vries', 'Bredaseweg 88', 'Roosendaal', 'devries@gmail.com', '06-015525866'),
(110, 'Corrie', 'Schenkel', 'Abeelenstraat 12', 'Roosendaal', 'schenker@hotmail.com', '06-514852135'),
(111, 'Lizette', 'Tramper', 'Biesdonstraat 09', 'Breda', 'tramperlizette@gmail.com', '06-154689653'),
(112, 'Gidet', 'Verloo', 'Cyperstraat 84', 'Breda', 'Venloo@live.nl', '06-785412589'),
(113, 'Lenie', 'Meer', 'Deinzesstraat 58', 'Roosendaal', 'meerlenie@hotmail.com', '06-794561232'),
(114, 'Bep', 'Akkerman', 'Elsstraat 145', 'Bergen op zoom', 'akkerman@live.nl', '06-951214563'),
(115, 'Sanne', 'Dekker', 'Gieterijstraat 34', 'Roosendaal', 'dekkersanne@gmail.com', '06-125896326'),
(116, 'Anne', 'Pijman', 'Hazardweg 26', 'Den Bosch', 'pijman@live.nl', '06-854652214'),
(117, 'Jasmina', 'van de Sluiters', 'Jasmijnstraat 45', 'Den Bosch', 'vandesluiters@live.nl', '06-548024896'),
(118, 'Hasan', 'Amraoui', 'Kalkoenstraat 234', 'Best', 'amraouihasan@gmail.com', '06-895426963'),
(119, 'Hans', 'van der Meer', 'Magrietstraat 65', 'Tilburg', 'meerhans@gmail.com', '06-525623659');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `ClientAFK` (`ClientID`);

--
-- Indexen voor tabel `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`),
  ADD KEY `UserCLFK` (`UserID`);

--
-- Indexen voor tabel `client availability`
--
ALTER TABLE `client availability`
  ADD PRIMARY KEY (`ClientAvailableID`),
  ADD KEY `ClientIDFK` (`ClientID`);

--
-- Indexen voor tabel `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `UserIDFK` (`UserID`);

--
-- Indexen voor tabel `doctor availability`
--
ALTER TABLE `doctor availability`
  ADD PRIMARY KEY (`DoctorAvailableID`),
  ADD KEY `DoctorFK` (`DoctorID`);

--
-- Indexen voor tabel `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `ClientFK` (`ClientID`);

--
-- Indexen voor tabel `portal`
--
ALTER TABLE `portal`
  ADD PRIMARY KEY (`PasswordID`),
  ADD KEY `UserFK` (`UserID`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `client availability`
--
ALTER TABLE `client availability`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `doctor availability`
--
ALTER TABLE `doctor availability`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT voor een tabel `log`
--
ALTER TABLE `log`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT voor een tabel `portal`
--
ALTER TABLE `portal`
  MODIFY `PasswordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `ClientAFK` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `DoctorAFK` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `UserCLFK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `client availability`
--
ALTER TABLE `client availability`
  ADD CONSTRAINT `ClientIDFK` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `UserIDFK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `doctor availability`
--
ALTER TABLE `doctor availability`
  ADD CONSTRAINT `DoctorFK` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`DoctorID`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `ClientFK` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `portal`
--
ALTER TABLE `portal`
  ADD CONSTRAINT `UserFK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
