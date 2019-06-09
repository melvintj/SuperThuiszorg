-- phpMyAdmin SQL Dump
-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 06 jan 2019 om 19:25
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
-- Database: `superthuiszorg definitief`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `appointment`
--

CREATE TABLE `appointment` (
  `DoctorID` varchar(7) DEFAULT NULL,
  `ClientID` varchar(7) DEFAULT NULL,
  `TreatmentID` varchar(7) DEFAULT NULL,
  `Date` varchar(9) DEFAULT NULL,
  `Rating` int(1) DEFAULT NULL,
  `Status` varchar(9) DEFAULT NULL,
  `Daypart` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `appointment`
--

INSERT INTO `appointment` (`DoctorID`, `ClientID`, `TreatmentID`, `Date`, `Rating`, `Status`, `Daypart`) VALUES
('D000000', 'C000000', 'T000000', '14-1-2019', 0, 'available', 'ochtend'),
('D000001', 'C000001', 'T000001', '17-1-2019', 0, 'planned', 'ochtend'),
('D000002', 'C000002', 'T000002', '16-1-2019', 5, 'finished', 'ochtend'),
('D000003', 'C000003', 'T000003', '16-1-2019', 0, 'planned', 'ochtend'),
('D000004', 'C000004', 'T000004', '14-1-2019', 0, 'available', 'avond'),
('D000005', 'C000005', 'T000000', '17-1-2019', 0, 'planned', 'ochtend'),
('D000006', 'C000006', 'T000001', '16-1-2019', 4, 'finished', 'ochtend'),
('D000007', 'C000007', 'T000002', '16-1-2019', 0, 'planned', 'middag'),
('D000008', 'C000008', 'T000003', '14-1-2019', 0, 'available', 'middag'),
('D000009', 'C000009', 'T000004', '17-1-2019', 3, 'finished', 'ochtend');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `client`
--

CREATE TABLE `client` (
  `ClientID` varchar(7) DEFAULT NULL,
  `InsuranceNumber` int(7) DEFAULT NULL,
  `UserID` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `client`
--

INSERT INTO `client` (`ClientID`, `InsuranceNumber`, `UserID`) VALUES
('C000000', 6899636, 'U000010'),
('C000001', 5696545, 'U000011'),
('C000002', 5662369, 'U000012'),
('C000003', 4896523, 'U000013'),
('C000004', 6985632, 'U000014'),
('C000005', 6321456, 'U000015'),
('C000006', 5479652, 'U000016'),
('C000007', 5874556, 'U000017'),
('C000008', 1544452, 'U000018'),
('C000009', 2146532, 'U000019');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `clientavailability`
--

CREATE TABLE `clientavailability` (
  `ClientAvailabilityID` varchar(8) DEFAULT NULL,
  `ClientID` varchar(7) DEFAULT NULL,
  `PartofDay` varchar(7) DEFAULT NULL,
  `Day` varchar(9) DEFAULT NULL,
  `Week` int(1) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `clientavailability`
--

INSERT INTO `clientavailability` (`ClientAvailabilityID`, `ClientID`, `PartofDay`, `Day`, `Week`, `Year`) VALUES
('CA000000', 'C000000', 'middag', 'Maandag', 3, 2019),
('CA000001', 'C000001', 'middag', 'Woensdag', 3, 2019),
('CA000002', 'C000002', 'ochtend', 'Vrijdag', 3, 2019),
('CA000003', 'C000003', 'avond', 'Vrijdag', 3, 2019),
('CA000004', 'C000004', 'avond', 'Zaterdag', 3, 2019),
('CA000005', 'C000005', 'nacht', 'Zondag', 3, 2019),
('CA000006', 'C000006', 'nacht', 'Donderdag', 3, 2019),
('CA000007', 'C000007', 'middag', 'Maandag', 3, 2019),
('CA000008', 'C000008', 'middag', 'Dinsdag', 3, 2019),
('CA000009', 'C000009', 'avond', 'Zaterdag', 3, 2019);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `client_ca`
--

CREATE TABLE `client_ca` (
  `ClientID` varchar(7) DEFAULT NULL,
  `ClientAvailabilityID` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `client_ca`
--

INSERT INTO `client_ca` (`ClientID`, `ClientAvailabilityID`) VALUES
('C000000', 'CA000000'),
('C000001', 'CA000001'),
('C000002', 'CA000002'),
('C000003', 'CA000003'),
('C000004', 'CA000004'),
('C000005', 'CA000005'),
('C000006', 'CA000006'),
('C000007', 'CA000007'),
('C000008', 'CA000008'),
('C000009', 'CA000009');

-- --------------------------------------------------------
--
-- Tabelstructuur voor tabel `doctor`
--

CREATE TABLE `doctor` (
  `DoctorID` varchar(7) DEFAULT NULL,
  `UserID` varchar(7) DEFAULT NULL,
  `AcademicDegree` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `doctor`
--

INSERT INTO `doctor` (`DoctorID`, `UserID`, `AcademicDegree`) VALUES
('D000000', 'U000000', 'mbo'),
('D000001', 'U000001', 'hbo'),
('D000002', 'U000002', 'hbo'),
('D000003', 'U000003', 'mbo'),
('D000004', 'U000004', 'mbo'),
('D000005', 'U000005', 'hbo'),
('D000006', 'U000006', 'hbo'),
('D000007', 'U000007', 'hbo'),
('D000008', 'U000008', 'mbo'),
('D000009', 'U000009', 'mbo');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctor availability`
--

CREATE TABLE `doctor availability` (
  `DoctorAvailableID` varchar(8) DEFAULT NULL,
  `Part of Day` varchar(7) DEFAULT NULL,
  `Day` varchar(9) DEFAULT NULL,
  `Week` int(2) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `doctor availability`
--

INSERT INTO `doctor availability` (`DoctorAvailableID`, `Part of Day`, `Day`, `Week`, `Year`) VALUES
('DA000000', 'Middag', 'Woensdag', 32, 2019),
('DA000001', 'Middag', 'Maandag', 32, 2019),
('DA000002', 'Ochtend', 'Dinsdag', 32, 2019),
('DA000003', 'Avond', 'Woensdag', 32, 2019),
('DA000004', 'Avond', 'Donderdag', 32, 2019),
('DA000005', 'nacht', 'Vrijdag', 32, 2019),
('DA000006', 'nacht', 'Zaterdag', 32, 2019),
('DA000007', 'Middag', 'Zondag', 32, 2019),
('DA000008', 'Middag', 'Maandag', 32, 2019),
('DA000009', 'Avond', 'Dinsdag', 32, 2019);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctor_da`
--

CREATE TABLE `doctor_da` (
  `DoctorID` varchar(7) DEFAULT NULL,
  `DoctorAvailableID` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `doctor_da`
--

INSERT INTO `doctor_da` (`DoctorID`, `DoctorAvailableID`) VALUES
('D000000', 'DA000000'),
('D000001', 'DA000001'),
('D000002', 'DA000002'),
('D000003', 'DA000003'),
('D000004', 'DA000004'),
('D000005', 'DA000005'),
('D000006', 'DA000006'),
('D000007', 'DA000007'),
('D000008', 'DA000008'),
('D000009', 'DA000009');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `log`
--

CREATE TABLE `log` (
  `LogID` varchar(7) DEFAULT NULL,
  `Description` varchar(6) DEFAULT NULL,
  `LogDate` varchar(10) DEFAULT NULL,
  `ClientID` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `log`
--

INSERT INTO `log` (`LogID`, `Description`, `LogDate`, `ClientID`) VALUES
('L000000', 'Goed', '2018-12-17', 'C000000'),
('L000001', 'Slecht', '2018-12-18', 'C000001'),
('L000002', 'Matig', '2018-12-21', 'C000002'),
('L000003', 'Goed', '2018-12-17', 'C000003'),
('L000004', 'Slecht', '2018-12-21', 'C000004'),
('L000005', 'Matig', '2018-12-19', 'C000005'),
('L000006', 'Goed', '2018-12-18', 'C000006'),
('L000007', 'Slecht', '2018-12-17', 'C000007'),
('L000008', 'Matig', '2018-12-20', 'C000008'),
('L000009', 'Goed', '2018-12-20', 'C000009');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `partnership`
--

CREATE TABLE `partnership` (
  `PartnershipID` varchar(7) DEFAULT NULL,
  `DoctorID` varchar(7) DEFAULT NULL,
  `PartnershipName` varchar(25) DEFAULT NULL,
  `PartnershipAddress` varchar(20) DEFAULT NULL,
  `City` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `partnership`
--

INSERT INTO `partnership` (`PartnershipID`, `DoctorID`, `PartnershipName`, `PartnershipAddress`, `City`) VALUES
('P000000', 'D000000', 'Meandergroep', 'Bekkerstraat 22', 'Breda'),
('P000001', 'D000001', 'Meandergroep', 'Bekkerstraat 23', 'Breda'),
('P000002', 'D000002', 'Frankelandgroep', 'Prins Alexanderplein', 'Oosterhout'),
('P000003', 'D000003', 'Den herdgang', 'Beneluxlaan 23', 'Tilburg'),
('P000004', 'D000004', 'De heikant', 'Berkelstraat 21', 'Tilburg'),
('P000005', 'D000005', 'Woonzorgcentrum Satijnhof', 'Biezenloop 12', 'Breda'),
('P000006', 'D000006', 'Zorginstelling De vleugel', 'Bilderdijkstraat 25', 'Breda'),
('P000007', 'D000007', 'Woonzorgcentrum Satijnhof', 'Biezenloop 12', 'Breda'),
('P000008', 'D000008', 'De wever', 'De werf 56', 'Breda'),
('P000009', 'D000009', 'Den herdgang', 'Beneluxlaan 23', 'Tilburg');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `portal`
--

CREATE TABLE `portal` (
  `PasswordID` varchar(7) DEFAULT NULL,
  `Password` varchar(13) DEFAULT NULL,
  `DateCreated` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `portal`
--

INSERT INTO `portal` (`PasswordID`, `Password`, `DateCreated`) VALUES
('P000000', 'Anja91.', '2-4-2018'),
('P000001', 'Smit.!', '4-6-2018'),
('P000002', 'Aishaahmad', '5-1-2017'),
('P000003', '05Visser', '3-8-2017'),
('P000004', 'Bakker55.', '4-4-2016'),
('P000005', 'Jong84.', '22-10-2018'),
('P000006', 'Dikeveline', '11-11-2018'),
('P000007', 'Basdegroot', '3-1-2018'),
('P000008', 'Erwin54.', '14-10-2018'),
('P000009', 'Devries88', '14-9-2017'),
('P000010', 'Corrie12.', '15-4-2018'),
('P000011', 'Tramper!.', '16-11-2018'),
('P000012', 'Verloo72.', '7-7-2017'),
('P000013', 'Leniepenie11!', '30-4-2018'),
('P000014', 'Akkerman34.', '11-1-2016'),
('P000015', 'Sannedekker23', '1-1-2018'),
('P000016', 'annepijman11,', '22-6-2017'),
('P000017', 'Amraoui44.', '12-5-2018'),
('P000018', 'Vandermeer.', '14-8-2017'),
('P000019', 'Sluiter.8', '12-11-2017');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `treatment`
--

CREATE TABLE `treatment` (
  `TreatmentID` varchar(7) DEFAULT NULL,
  `TreatmentName` varchar(18) DEFAULT NULL,
  `Minutes` int(3) DEFAULT NULL,
  `TreatmentPrice` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `treatment`
--

INSERT INTO `treatment` (`TreatmentID`, `TreatmentName`, `Minutes`, `TreatmentPrice`) VALUES
('T000001', 'Ochtendroutine', 60, 30),
('T000002', 'Douchen', 30, 20),
('T000003', 'Wondverzorging', 15, 15),
('T000004', 'ADL- ondersteuning', 15, 25),
('T000005', 'Eten', 15, 10),
('T000006', 'Dagbesteding', 120, 150),
('T000007', 'IntensieveZorg', 180, 250);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `UserID` varchar(7) DEFAULT NULL,
  `FirstName` varchar(9) DEFAULT NULL,
  `LastName` varchar(15) DEFAULT NULL,
  `Address` varchar(21) DEFAULT NULL,
  `Residence` varchar(14) DEFAULT NULL,
  `Email` varchar(26) DEFAULT NULL,
  `TelNumber` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`UserID`, `FirstName`, `LastName`, `Address`, `Residence`, `Email`, `TelNumber`) VALUES
('U000000', 'Anja', 'Wouw', 'Alleenhouderstraat 51', 'Tilburg', 'wouw@gmail.com', '06-40779920'),
('U000001', 'Robert', 'Smit', 'Kwandeinstraat 50', 'Breda', 'robertsmit@gmail.com', '06-156813874'),
('U000002', 'Linda', 'Visser', 'Janheijnstraat 11', 'Eindhoven', 'visserlinda@hotmail.com', '06-423946566'),
('U000003', 'Kimberley', 'Bakker', 'Burgemeesterstraat 34', 'Breda', 'kimberley@live.nl', '06-652356232'),
('U000004', 'Aisha', 'Ahmad', 'Hogeschoollaan 852', 'Breda', 'ahmeraisha@home.nl', '06-025254563'),
('U000005', 'Inge', 'de Jong', 'Lovedeinsstraat 565', 'Den bosch', 'dejong@gmail.com', '06-256265245'),
('U000006', 'Eveline', 'van Dik', 'stadhuisplein 13', 'Best', 'dedik@hotmail.com', '06-241025696'),
('U000007', 'Bas', 'de Groot', 'Heuvelstraat 12', 'Best', 'Bas@degroot.nl', '06-486256369'),
('U000008', 'Erwin', 'Vos', 'Spoorlaan 987', 'Bergen op zoom', 'erwinvos@gmail.com', '06-214563202'),
('U000009', 'Kristel', 'de Vries', 'Bredaseweg 88', 'Roosendaal', 'devries@gmail.com', '06-015525866'),
('U000010', 'Corrie', 'Schenkel', 'Abeelenstraat 12', 'Roosendaal', 'schenker@hotmail.com', '06-514852135'),
('U000011', 'lizette', 'Tramper', 'Biesdonstraat 09', 'Breda', 'tramperlizette@gmail.com', '06-154689653'),
('U000012', 'Gidet', 'Verloo', 'Cyperstraat 84', 'Breda', 'Venloo@live.nl', '06-785412589'),
('U000013', 'Lenie', 'Meer', 'Deinzesstraat', 'Roosendaal', 'meerlenie@hotmail.com', '06-794561232'),
('U000014', 'Bep', 'Akkerman', 'Elsstraat 145', 'Bergen op zoom', 'akkerman@live.nl', '06-951214563'),
('U000015', 'Sanne', 'Dekker', 'Gieterijstraat 34', 'Roosendaal', 'dekkersanne@gmail.com', '06-125896326'),
('U000016', 'Anne', 'Pijman', 'Hazardweg 26', 'Den bosch', 'pijman@live.nl', '06-854652214'),
('U000017', 'Jasmina', 'van de Sluiters', 'Jasmijnstraat 45', 'Den bosch', 'van de sluiters@live.nl', '06-548024896'),
('U000018', 'Hasan', 'Amraoui', 'Kalkoenstraat 234', 'Best', 'amraouihasan@gmail.com', '06-895426963'),
('U000019', 'Hans', 'van der Meer', 'Magrietstraat 65', 'Tilburg', 'van der meerhans@gmail.com', '06-525623659');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `userportal`
--

CREATE TABLE `userportal` (
  `UserID` varchar(7) DEFAULT NULL,
  `PasswordID` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `userportal`
--

INSERT INTO `userportal` (`UserID`, `PasswordID`) VALUES
('U000000', 'P000000'),
('U000001', 'P000001'),
('U000002', 'P000002'),
('U000003', 'P000003'),
('U000004', 'P000004'),
('U000005', 'P000005'),
('U000006', 'P000006'),
('U000007', 'P000007'),
('U000008', 'P000008'),
('U000009', 'P000009'),
('U000010', 'P000010'),
('U000011', 'P000011'),
('U000012', 'P000012'),
('U000013', 'P000013'),
('U000014', 'P000014'),
('U000015', 'P000015'),
('U000016', 'P000016'),
('U000017', 'P000017'),
('U000018', 'P000018'),
('U000019', 'P000019');

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
