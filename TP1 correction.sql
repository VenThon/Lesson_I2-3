#create database
create sailor22database sailor22;
#use the database
use sailor22;
#create table sailors in database sailor.
create table sailors(
	sid int primary key,
	sname varchar(20),
	rating int,
	age int
);

#create table boats
create table boats(
	bid int primary key,
	bname varchar(20),
	color varchar(20)
);


#create table reserves
create table reserves(
	sid int,
	bid int,
	day date,
	constraint primary key (sid,bid,day),
	constraint foreign key (sid) references sailors(sid),
	constraint foreign key (bid) references boats(bid)
);

#modify the datatype of attribute age in table sailors
alter table sailors modify age decimal(3,1);

#add check constraint to attribute rating. MySQL versionlower than 8.0 doesn't support check constraint.
alter table sailors add constraint check (rating in (1,2,3,4,5,6,7,8,9,10));
alter table sailors add constraint check (rating >=1 and rating <=10);

#insert data into table sailors
insert into sailors values(22,"Dustin",7,45),
(29,"Brustus",1,33),
(31,"Lubber",8,55.5),
(32,"Andy",8,25.5),
(58,"Rusty",10,35),
(64,"Horatio",7,35),
(71,"Zorba",10,16),
(74,"Horatio",9,35),
(85,"Art",3,25.5),
(95,"Bob",3,63.5);

#insert data into table boats
insert into boats values (101, 'interlake', 'blue'),
	(102, 'interlake', 'red'),
	(103, 'Clipper', 'green'),
	(104, 'Marine', 'red');


#insert data into table reserves
insert into reserves values	(22, 101, '1998-10-10'),
	(22, 102, '1998-10-10'),
	(22, 103, '1998-08-10'),
	(22, 104, '1998-07-10'),
	(31, 102, '1998-10-11'),
	(31, 103, '1998-06-11'),
	(31, 104, '1998-12-11'),
	(64, 101, '1998-05-09'),
	(64, 102, '1998-08-09'),
	(74, 103, '1998-08-09');
#TP2
#1.a
INSERT INTO sailors(sid, sname,rating,age) VALUES (30,"Dara",8,25);
#1.b
INSERT INTO sailors(sid, sname,rating,age) VALUES (NULL,"Dara",8,25);
#1.c
INSERT INTO sailors(sid, sname,rating,age) VALUES ("Dara",22,8,25);
#1.d
INSERT INTO sailors(sid, sname,rating,age) VALUES ("Sok",22,7,35);
#1.e
INSERT INTO reserves(sid, bid, DAY) VALUES (74,105,"1998-08-09");
#1.f
INSERT INTO reserves(sid, bid,DAY) VALUES (74,104,19980809);

#2.a
SELECT sname
FROM sailors 
WHERE rating>7;
#2.b
SELECT sname
FROM sailors
WHERE rating>7 AND rating<50;
#2.c
SELECT sname
FROM sailors
WHERE sname='Horatio';
#2.d
SELECT sname
FROM sailors
WHERE sname LIKE 'A%';
#2.e
SELECT sname
FROM sailors
WHERE sname LIKE 'A%Y';
#2.f
SELECT *FROM boats
WHERE color='red';
#2.g
SELECT *
FROM reserves
WHERE DAY LIKE '1998-10';
#SELECT MONTH ('1998-03-24'), YEAR ('1998-03-24'), DAY ('1998-03-24'),DATE_FORMAT('2022-06-01','%W'),CURDATE();	
#2.h
SELECT  *
FROM sailors
ORDER BY rating ASC; 
#======TP3=========
-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.16-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for product
CREATE DATABASE IF NOT EXISTS `producttest` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `producttest`;


-- Dumping structure for table product.customer_t
CREATE TABLE IF NOT EXISTS `customer_t` (
  `ID` decimal(11,0) NOT NULL,
  `name` varchar(25) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `postal_code` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table product.customer_t: ~7 rows (approximately)
/*!40000 ALTER TABLE `customer_t` DISABLE KEYS */;
INSERT INTO `customer_t` (`ID`, `name`, `address`, `city`, `state`, `postal_code`) VALUES
	(1, 'John Doe', '392 Sunset Blvd.', 'New York', 'NT', '10059'),
	(2, 'Mary Smith', '6900 Main St.', 'San Francisco', 'CA', '94032'),
	(3, 'Richard Newman', '2040 Riverside Rd.', 'San Diego', 'CA', '92010'),
	(4, 'Cathy Cook', '4010 Speedway', 'Tucson', 'AZ', '85719'),
	(5, 'Dara', '234, 217 St.', 'Phnom Penh', NULL, '12000'),
	(6, 'Dara', '67, Monivong Blvd.', 'Phnom Penh', NULL, '12456'),
	(7, 'Paul Jaque', '112,st 23', 'LA', 'CA', '12987');
/*!40000 ALTER TABLE `customer_t` ENABLE KEYS */;


-- Dumping structure for table product.product_t
CREATE TABLE IF NOT EXISTS `product_t` (
  `ID` decimal(11,0) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `finish` varchar(20) DEFAULT NULL,
  `standard_price` decimal(6,2) DEFAULT NULL,
  `product_line_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table product.product_t: ~9 rows (approximately)
/*!40000 ALTER TABLE `product_t` DISABLE KEYS */;
INSERT INTO `product_t` (`ID`, `description`, `finish`, `standard_price`, `product_line_ID`) VALUES
	(1000, 'Office Desk', 'Cherry', 95.00, 10),
	(1001, 'Manager\'s Desk', 'Red Oak', 199.00, 10),
	(2000, 'Office Chair', 'Cherry', 75.00, 20),
	(2001, 'Manager\'s Desk', 'Natural Oak', 129.00, 20),
	(3000, 'Book Shelf', 'Natural Ash', 35.00, 30),
	(3001, 'Duplex Book Shelf', 'White Ash', 80.00, 30),
	(4000, 'Table Lamp', 'Natural Ash', 15.00, 40),
	(4001, 'Duplex Table Lamp', 'White Ash', 40.00, 40),
	(9999, 'Keyboard', 'Plastic', 20.00, 50);
/*!40000 ALTER TABLE `product_t` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- Dumping structure for table product.order_t
CREATE TABLE IF NOT EXISTS `order_t` (
  `ID` decimal(11,0) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_ID` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `order_fk` (`customer_ID`),
  CONSTRAINT `order_fk` FOREIGN KEY (`customer_ID`) REFERENCES `customer_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table product.order_t: ~10 rows (approximately)
/*!40000 ALTER TABLE `order_t` DISABLE KEYS */;
INSERT INTO `order_t` (`ID`, `order_date`, `customer_ID`) VALUES
	(100, '2004-04-01 00:00:00', 1),
	(101, '2004-04-01 00:00:00', 2),
	(102, '2004-04-02 00:00:00', 3),
	(103, '2004-04-03 00:00:00', 2),
	(104, '2004-04-10 00:00:00', 1),
	(105, '2004-04-10 00:00:00', 4),
	(106, '2004-04-10 00:00:00', 2),
	(107, '2004-04-10 00:00:00', 1),
	(108, '2014-04-08 01:09:28', 5),
	(109, '2014-04-08 01:10:13', 6);
/*!40000 ALTER TABLE `order_t` ENABLE KEYS */;

-- Dumping structure for table product.order_line_t
CREATE TABLE IF NOT EXISTS `order_line_t` (
  `order_ID` decimal(11,0) NOT NULL,
  `product_ID` decimal(11,0) NOT NULL,
  `quantity` decimal(11,0) DEFAULT NULL,
  PRIMARY KEY (`order_ID`,`product_ID`),
  KEY `order_line_fk2` (`product_ID`),
  CONSTRAINT `order_line_fk1` FOREIGN KEY (`order_ID`) REFERENCES `order_t` (`ID`),
  CONSTRAINT `order_line_fk2` FOREIGN KEY (`product_ID`) REFERENCES `product_t` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table product.order_line_t: ~13 rows (approximately)
/*!40000 ALTER TABLE `order_line_t` DISABLE KEYS */;
INSERT INTO `order_line_t` (`order_ID`, `product_ID`, `quantity`) VALUES
	(100, 4000, 1),
	(101, 1000, 2),
	(101, 2000, 2),
	(102, 2000, 1),
	(102, 3000, 1),
	(103, 4001, 1),
	(104, 2000, 1),
	(105, 3001, 2),
	(106, 3000, 1),
	(106, 4000, 1),
	(107, 4001, 1),
	(108, 1000, 2),
	(109, 9999, 5);
/*!40000 ALTER TABLE `order_line_t` ENABLE KEYS */;

