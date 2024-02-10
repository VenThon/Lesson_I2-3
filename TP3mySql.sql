#=====TP3===========
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
#1list all customer name and city
SELECT name,City    #It is mmeaning find name and city frome cutomer_t
FROM customer_t;
		
#2list the information of customer'CA'(state)
SELECT *			#It is meaning finding all information custommer start by letter "CA"
FROM  customer_t
WHERE state='CA'; #find location state it has letter CA

#3list id description and standard_price made from "ash"
SELECT ID, DESCRIPTION,standard_price
FROM product_t		#find ID, descrition and standard price frome product
WHERE FINISH LIKE '%ash';#find location all information for end with "ash"

#4list the in formation of product"ash" costs between 15 and 80  
SELECT *  #find all information frome product
FROM product_t
WHERE FINISH LIKE '%ash' AND (standard_price>=15 AND standard_price<80);#find location all information for end with "ash" and find cost between

#5show  all product standard_price(from cheap to expensive)
SELECT *
FROM product_t #find all information from product
ORDER BY standard_price; #for price after finded show price cheap to expensive

#6show the cross product between customer and order
SELECT *
FROM customer_t  JOIN order_t;#find all information product between customer

#7Show the information of customer who has made order on “2004-04-01"
SELECT customer_t.* #find data from customer
ON c.ID=o.customer_t_ID#We use ON clause to specify a join condition. This lets us specify join conditions separate from any search or filter conditions in the WHERE clause.
WHERE order_date=" 2004-04-01";

#8 show information of products in the order umber 106.
SELECT *
FROM product_t AS p JOIN order_line_t AS o 
ON p.ID=o.product_ID#The AS command is used to rename a column or table with an alias.
WHERE order_ID='106';#where is used to find location by order

#9show the innformmation of customer who has made order number 106
SELECT *
FROM product_t AS p JOIN otrder_line_t AS o
ON p.ID=o.customer_ID#the same qustion 8
WHERE ID='106';

#10show the order which contains book shelf .
SELECT *
FROM order_t o JOIN order_line ol JOIN product_t p
ON o.ID=ol.order_ID AND p.ID=ol.product_ID#the same qustion 8 and 9
WHERE DESCRIPTION =" Book shelf";#description used to describe something about Book shelf.

#11show the order which contains table lamp.
SELECT *
FROM order_t o JOIN order_line_t ol JOIN product_t p
ON o.ID=ol.order_ID AND p.ID=ol.product_ID# AND used for the AND operator displays a record if all the conditions separated by AND are TRUE.
WHERE DESCRIPTION ="table lam";##description used to describe something about table lam.
producttest

#12show the order which contain book shelf or table lamp.
select o.*
from order_t o join order_line_t ol join product_t p
	on o.ID = ol.order_ID and ol.product_ID = p.id
where p.description like "%table lamp%" or p.description like "%book shelf%";
#13 show the order which contais book shelf and table lamp.
select o.*
from order_t o join order_line_t ol join product_t p
	on o.ID = ol.order_ID and ol.product_ID = p.id
where p.description like "%book shelf%" and o.id in
	(select ol.order_id
	from order_line_t ol join product_t p
		on ol.product_ID = p.id
	where p.description like "%table lamp%");
#14 show the order which contains book shelf but not table lamp.
select o.*
from order_t o join order_line_t ol join product_t p
	on o.ID = ol.order_ID and ol.product_ID = p.id
where p.description like "%book shelf%" and o.id not in
	(select ol.order_id
	from order_line_t ol join product_t p
		on ol.product_ID = p.id
	where p.description like "%table lamp%");