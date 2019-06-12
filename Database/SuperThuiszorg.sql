-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 12 jun 2019 om 11:00
-- Serverversie: 10.1.38-MariaDB
-- PHP-versie: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `superthuiszorg`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `appointment`
--

CREATE TABLE `appointment` (
  `DoctorID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `AppointmentID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `InsuranceNumber` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctor`
--

CREATE TABLE `doctor` (
  `DoctorID` int(11) NOT NULL,
  `AcademicDegree` varchar(20) DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `FirstName` varchar(60) DEFAULT NULL,
  `LastName` varchar(60) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Residence` varchar(60) DEFAULT NULL,
  `Email` varchar(60) DEFAULT NULL,
  `TelNumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`DoctorID`),
  ADD UNIQUE KEY `AppointmentID` (`AppointmentID`),
  ADD KEY `ClientAFK` (`ClientID`);

--
-- Indexen voor tabel `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`),
  ADD UNIQUE KEY `ClientID_2` (`ClientID`,`UserID`),
  ADD KEY `ClientID` (`ClientID`,`UserID`),
  ADD KEY `UserID` (`UserID`);

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
  ADD UNIQUE KEY `DoctorID` (`DoctorID`,`UserID`),
  ADD KEY `DoctorID_2` (`DoctorID`,`UserID`),
  ADD KEY `UserID` (`UserID`);

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
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserID` (`UserID`,`Username`,`Email`),
  ADD KEY `UserID_2` (`UserID`,`Username`,`Email`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `appointment`
--
ALTER TABLE `appointment`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `client availability`
--
ALTER TABLE `client availability`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `doctor`
--
ALTER TABLE `doctor`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `doctor availability`
--
ALTER TABLE `doctor availability`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `log`
--
ALTER TABLE `log`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Beperkingen voor tabel `client availability`
--
ALTER TABLE `client availability`
  ADD CONSTRAINT `ClientIDFK` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
