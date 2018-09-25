create database COP4710;
use COP4710;

CREATE TABLE Property (
address VARCHAR(50) PRIMARY KEY,
ownerName VARCHAR(30),
price INT
);

CREATE TABLE House (
bedrooms INT,
bathrooms INT,
size INT,
address VARCHAR(50),
FOREIGN KEY (address) REFERENCES Property (address)
);

CREATE TABLE BusinessProperty (
type CHAR(20),
size INT,
address VARCHAR(50),
FOREIGN KEY (address) REFERENCES Property (address)
);

CREATE TABLE Firm (
id INT PRIMARY KEY,
name VARCHAR(30),
address VARCHAR(50)
);

CREATE TABLE Agent (
agentId INT PRIMARY KEY,
name VARCHAR(30),
phone CHAR(12),
firmId INT, 
dateStarted DATE,
FOREIGN KEY (firmId) REFERENCES Firm (id)
);

CREATE TABLE Listings (
address VARCHAR(50),
agentId INT,
mlsNumber INT PRIMARY KEY,
dateListed DATE,
FOREIGN KEY (agentId) REFERENCES Agent (agentId)
);

CREATE TABLE Buyer (
id INT PRIMARY KEY,
name VARCHAR(30),
phone CHAR(12),
propertyType CHAR(20),
bedrooms INT,
bathrooms INT,
businessPropertyType CHAR(20),
minimumPreferredPrice INT,
maximumPreferredPrice INT
);

CREATE TABLE Works_With (
buyerId INT,
agentId INT,
FOREIGN KEY (buyerId) REFERENCES Buyer (id),
FOREIGN KEY (agentId) REFERENCES Agent (agentId)
);


# Populate tables

INSERT INTO Property (address,ownerName,price)
VALUES ('12 3rd St','John Johnson',100000),
        ('501 N Duval St','Billy Brandt',250000),
        ('1800 Miccosukkee Commons Dr','Owen Oasis',120000),
        ('767 Frank Rd','Janice Moreno',200000),
        ('5600 Jefferson Ave','Gary Garrison',80000),
        ('1010 Johnny Way','Brent McFatter',110000),
        ('554 Left St','Bradley Williams',55000),
        ('108 Tennessee St','Teddy Tedson',200000),
        ('12 Blair Stone Rd','Blair Stone',160000),
        ('50 Capital Circle SE','Sue Susan',30500);

INSERT INTO House (bedrooms,bathrooms,size,address)
VALUES (3,2,50000,'12 3rd St'),
        (3,2,100000,'767 Frank Rd'),
        (2,1,20000,'5600 Jefferson Ave'),
        (3,2,25000,'1010 Johnny Way'),
        (2,1,19000,'554 Left St');

INSERT INTO BusinessProperty(type,size,address)
VALUES ('office space',150000,'501 N Duval St'),
        ('office space',120000,'1800 Miccosukkee Commons Dr'),
        ('Wholesale',400000,'108 Tennessee St'),
        ('Retail',34000,'12 Blair Stone Rd'),
        ('Retail',20000,'50 Capital Circle SE');

INSERT INTO Firm (id,name,address)
VALUES (1,'Bob''s Real Estate','1500 Seminole Ln'),
        (2,'Buy From Us','19 Virginia St'),
        (3,'Homes For Less','888 Stadium Dr'),
        (4,'Tallahassee Estates','100 Main St'),
        (5,'Holmes Homes','456 Seventh St');

INSERT INTO Agent (agentId,name,phone,firmId,dateStarted)
VALUES (100,'Big Bob','850-777-1234',1,'2000-01-01'),
        (101,'Gary Gordon','866-144-4141',2,'1990-04-23'),
        (102,'Roger Ebert','555-555-5555',3,'2003-08-11'),
        (103,'Ted Tally','644-155-9999',4,'2010-05-05'),
        (104,'Homie Homes','777-123-4567',5,'2016-01-04');

INSERT INTO Listings (address,agentId,mlsNumber,dateListed)
VALUES ('12 3rd St',100,1000,'2001-01-03'),
        ('501 N Duval St',101,1001,'2000-04-02'),
        ('1800 Miccosukkee Commons Dr',102,1002,'2010-03-03'),
        ('767 Frank Rd',103,1003,'2000-12-12'),
        ('5600 Jefferson Ave',104,1004,'1999-09-09'),
        ('1010 Johnny Way',100,1005,'2002-09-11'),
        ('554 Left St',101,1006,'2008-05-30'),
        ('108 Tennessee St',102,1007,'2009-06-02'),
        ('12 Blair Stone Rd',103,1008,'1999-04-29'),
        ('50 Capital Circle SE',104,1009,'2010-10-10');

INSERT INTO Buyer (id,name,phone,propertyType,bedrooms,bathrooms,businessPropertyType,minimumPreferredPrice,maximumPreferredPrice)
VALUES (10001,'Albert Zimmerman','850-444-0404','Home',2,1,'LLC',10000,80000),
        (10002,'Biggie Smalls','904-333-3939','Business',3,4,'Corporation',50000,300000),
        (10003,'Charlie Wade','305-450-5050','Home',4,2,'LLC',25000,100000),
        (10004,'Daniel York','250-430-4585','Business',3,3,'Corporation',30000,200000),
        (10005,'Eddy Edward','369-234-4545','Home',3,2,'LLC',25000,150000);

INSERT INTO Works_With (buyerId,agentId)
VALUES (10001,100),
        (10001,102),
        (10002,101),
        (10003,104),
        (10003,102),
        (10004,103),
        (10005,104),
        (10005,100);
