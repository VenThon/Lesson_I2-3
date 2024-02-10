#TP 1 SESSION 1 C

#exercise 1

CREATE DATABASE sailor13;
USE sailor13;

#exercise 2
CREATE TABLE sailors(
sid INT,
sname VARCHAR(70),
rating INT,
age INT,
CONSTRAINT PRIMARY KEY (sid)
);
#ALTER TABLE sailors ADD age INT;

CREATE TABLE boats(
bid INT,
bname VARCHAR(60),
color VARCHAR(10),
CONSTRAINT PRIMARY KEY (bid)
);

CREATE TABLE reserves(
sid INT,
bid INT,sailor13
`day` DATE,
PRIMARY KEY (bid , sid, `day`),
FOREIGN KEY (bid) REFERENCES boats (bid),
CONSTRAINT fk2 FOREIGN KEY (sid) REFERENCES sailors (sid)

);


#exercise 3
ALTER TABLE sailors MODIFY age DECIMAL(3,1) DEFAULT 18.0;


#exercise 4

#ALTER TABLE  reserves DROP PRIMARY KEY,
#add check constaint(choose one below)
#ALTER TABLE sailors ADD CHECK (rating IN (1,2,3,4,5,6,7,8,910));
ALTER TABLE sailors ADD CHECK (rating>0 AND rating<=10);

#exercise 5

INSERT INTO sailors VALUE (22,"Dustin",7,45.0) ;
INSERT INTO sailors VALUE (29,"Brutus",1,33.0);
INSERT INTO sailors VALUE (31,"Lubber",8,55.5),(32,"Andy",8,25.5),(58,"Rusty",10,35.0),(64,"Horatio",7,35.0),(71,"Zorba",10,16.0),(74,"Horatio",9,35.0),(80,"Art",3,25.5),(95,"Bob",3,63.5);
#INSERT INTO  sailors VALUE (31,Lubber,8,55.5);

#INSERT INTO reserves (bid,sid,`day`) VALUE (22, 102,'1998-10-10');

INSERT INTO boats VALUE (101,'Interlake','blue');
INSERT INTO boats VALUE (102,'Interlake','red'), (103,'Clipper','green'),(104,'Marine','red');

INSERT INTO reserves VALUE (22,101,'1998-10-10');
INSERT INTO reserves VALUE (22,102,'1998-10-10');
INSERT INTO reserves VALUE (22,103,'1998-8-10'),(22,104,'1998-7-10'),(31,102,'1998-10-11'),(31,103,'1998-12-11'),(31,104,'1998,12-11'),(64,101,'1998-5-9'),(64,102,'1998-8-9'),(74,103,'1998-8-9');testtesttest