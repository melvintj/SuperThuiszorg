-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 09 jun 2019 om 22:34
-- Serverversie: 10.1.36-MariaDB
-- PHP-versie: 7.2.11

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

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `portal`
--
ALTER TABLE `portal`
  ADD PRIMARY KEY (`PasswordID`),
  ADD UNIQUE KEY `PasswordID` (`PasswordID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `UserFK` (`UserID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `portal`
--
ALTER TABLE `portal`
  MODIFY `PasswordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `portal`
--
ALTER TABLE `portal`
  ADD CONSTRAINT `UserFK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
