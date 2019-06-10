-- To create foreign keys, we need to clear the data out of the DB......
-- Otherwise we will receive an error when defining the FK-KEYS
-- The data with Auto_increment wasn't correctly generated.

INSERT INTO `appointment` (`DoctorID`, `ClientID`, `AppointmentID`, `Date`, `Rating`) VALUES
(1, 4, 1, '2019-01-14', 5),
(2, 4, 2, '2019-01-16', 3),
(3, 4, 3, '2019-01-17', 4),
(4, 5, 4, '2019-01-16', 4),
(5, 5, 5, '2019-01-16', 4),
(6, 7, 6, '2019-01-16', 3),
(8, 1, 7, '2019-01-14', 1),
(9, 1, 8, '2019-01-14', 5),
(10, 8, 9, '2019-01-14', 5);

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

INSERT INTO `client availability` (`ClientAvailableID`, `ClientID`, `DayofPart`, `Date`) VALUES
(0, 1, 'middag', '2004'),
(11, 3, 'middag', '2004'),
(12, 5, 'middag', '1993'),
(13, 6, 'ochtend', '1'),
(14, 7, 'avond', '2002'),
(15, 8, 'avond', '2002'),
(16, 9, 'nacht', '2004'),
(17, 10, 'nacht', '2004');

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
(119, 'Hans', 'van der Meer', 'Magrietstraat 65', 'Tilburg', 'meerhans@gmail.com', '06-525623659'),
(122, 'Melvin', 'Jansen', 'Mijnstraatje 1', 'Rotterdam', 'melvinjansen94@gmail.com', '06-12345678');