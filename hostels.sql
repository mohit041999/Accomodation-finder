
CREATE TABLE `area` (
  `pincode` varchar(6) NOT NULL,
`No_of_pgs` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `no_of_hostels` int(11) DEFAULT NULL,
  `locality` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `area` (`pincode`, `No_of_pgs`, `city`, `no_of_hostels`, `locality`) VALUES
('110071', 2, 'PHAGWARA', 1, 'phag');


CREATE TABLE `hostel` (
  `ID` int(11) NOT NULL,
  `H_name` varchar(20) DEFAULT NULL,
  `Pincode` char(6) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Hostel` tinyint(1) DEFAULT NULL,
  `Curfew` time DEFAULT NULL,
  `Phone_number` varchar(10) DEFAULT NULL,
  `Total_no_of_rooms` int(11) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `hostel` (`ID`, `H_name`, `Pincode`, `Type`, `Hostel`, `Curfew`, `Phone_number`, `Total_no_of_rooms`, `Capacity`) VALUES
(1, 'SHIV', '110071', 'Boys', 0, '00:00:00', '9898989898', NULL, 200);

CREATE TABLE `mess` (
  `no_of_meals` int(11) DEFAULT NULL,
  `Mess_fees` int(11) DEFAULT NULL,
  `Mess_capacity` int(11) DEFAULT NULL,
  `Veg` tinyint(1) DEFAULT NULL,
  `Schedule` blob DEFAULT NULL,
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `mess` (`no_of_meals`, `Mess_fees`, `Mess_capacity`, `Veg`, `Schedule`, `ID`) VALUES
(2, 23000, 1000, 1, NULL, 1);

CREATE TABLE `owner_details` (
  `Owner_name` varchar(20) DEFAULT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `Email_ID` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `owner_details` (`Owner_name`, `Phone_number`, `Email_ID`) VALUES
('KARAN PG', '9898989898', 'ditileb321@hostovz.com');


CREATE TABLE `room_types` (
  `Attached_Bathroom` tinyint(1) DEFAULT NULL,
  `AC` tinyint(1) DEFAULT NULL,
  `Room_capacity` int(11) DEFAULT NULL,
  `Fees` int(11) DEFAULT NULL,
  `Wifi` tinyint(1) DEFAULT NULL,
  `No_of_rooms` int(11) DEFAULT NULL,
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `room_types` (`Attached_Bathroom`, `AC`, `Room_capacity`, `Fees`, `Wifi`, `No_of_rooms`, `ID`) VALUES
(1, 1, 100, 2300, 1, 2, 1);

ALTER TABLE `area`
  ADD PRIMARY KEY (`pincode`);

ALTER TABLE `hostel`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Pincode` (`Pincode`),
  ADD KEY `Phone_number` (`Phone_number`);

ALTER TABLE `mess`
  ADD KEY `ID` (`ID`);

ALTER TABLE `owner_details`
  ADD PRIMARY KEY (`Phone_number`);

ALTER TABLE `room_types`
  ADD KEY `ID` (`ID`);

ALTER TABLE `hostel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `hostel`
  ADD CONSTRAINT `hostel_ibfk_1` FOREIGN KEY (`Pincode`) REFERENCES `area` (`pincode`),
  ADD CONSTRAINT `hostel_ibfk_2` FOREIGN KEY (`Phone_number`) REFERENCES `owner_details` (`Phone_number`);

ALTER TABLE `mess`
  ADD CONSTRAINT `mess_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `hostel` (`ID`);

ALTER TABLE `room_types`
  ADD CONSTRAINT `room_types_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `hostel` (`ID`);
COMMIT;

