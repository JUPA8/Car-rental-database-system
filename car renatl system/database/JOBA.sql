CREATE TABLE [AGENCIES] (
  [AgencyID] INT NOT NULL,
  [AgencyLocation] VARCHAR(50),
  PRIMARY KEY ([AgencyID])
);

CREATE TABLE [CUSTOMERS] (
  [CustomerID] INT NOT NULL,
  [CustomerName] VARCHAR(50),
  [CustomerAddress] VARCHAR(100),
  [CustomerTelephoneNumber] VARCHAR(11),
  [AgencyID] INT NOT NULL,
  PRIMARY KEY ([CustomerID])
);

CREATE INDEX [FK] ON  [CUSTOMERS] ([AgencyID]);

CREATE TABLE [RENTALS] (
  [RentalID] INT NOT NULL,
  [RentalStartDate] DATE NOT NULL,
  [RentalReturnDate] DATE NOT NULL,
  [VehicleID] INT NOT NULL,
  [AgencyID] INT NOT NULL,
  [CustomerID] INT NOT NULL,
  PRIMARY KEY ([RentalID])
);

CREATE INDEX [FK] ON  [RENTALS] ([VehicleID], [AgencyID], [CustomerID]);

CREATE TABLE [VEHICLECLASSES] (
  [VehicleClassID] INT NOT NULL,
  [VehicleClassName] VARCHAR(100)NOT NULL,
  [VehicleClassPrice] int not null ,
  PRIMARY KEY ([VehicleClassID])
);

CREATE TABLE [VEHICLES] (
  [VehicleID] INT NOT NULL,
  [VehicleClassID] INT NOT NULL,
  [RentalID] float NOT NULL,
  PRIMARY KEY ([VehicleID])
);

CREATE INDEX [FK] ON  [VEHICLES] ([VehicleClassID], [RentalID]);

-- 6 insert statment

INSERT INTO CUSTOMERS VALUES(1,'Lotfy Ahmed','alex,egypt','01524525243',1);
INSERT INTO CUSTOMERS VALUES(2,'mohamed Saad','Cairo,egypt','01026569252',2);
INSERT INTO CUSTOMERS VALUES(3,'Fathy Tarek','Qina,egypt','01263571514',3);
INSERT INTO RENTALS VALUES(1,'2020-2-12','2020-2-25',1,1,2);
INSERT INTO RENTALS VALUES(2,'2020-4-30','2021-4-15',3,2,2);

-- 3 select using subquery


SELECT * 
   FROM CUSTOMERS 
   WHERE CustomerID IN (SELECT CustomerID
         FROM CUSTOMERS 
         WHERE CustomerID = 1) ;

SELECT * 
   FROM RENTALS 
   WHERE RentalID IN (SELECT RentalID
         FROM RENTALS 
         WHERE RentalID = 1) ;

SELECT * 
   FROM CUSTOMERS 
   WHERE CustomerName IN (SELECT CustomerName
         FROM CUSTOMERs 
         WHERE CustomerName = 'Lotfy Ahmed') ;

-- 2 select statments using count and group functions

SELECT CustomerName, COUNT(*)  'count'
FROM CUSTOMERS 
GROUP BY CustomerName;
SELECT CustomerAddress, COUNT(*) 'count'
FROM CUSTOMERS 
GROUP BY CustomerAddress;

-- 5 update statments

UPDATE CUSTOMERS
SET CustomerAddress = 'Suhag,Egypt'
WHERE CustomerID = 1;
UPDATE CUSTOMERS
SET CustomerAddress = 'Fayom,Egypt'
WHERE CustomerID = 2;
UPDATE CUSTOMERS
SET CustomerAddress = 'Sinai,Egypt'
WHERE CustomerID = 3;
UPDATE RENTALS
SET RentalStartDate = '2020-3-30'
WHERE RentalID = 1;
UPDATE RENTALS
SET RentalStartDate = '2020-6-25' 
WHERE RentalID = 2;

-- 5 select statements using different joins

SELECT CUSTOMERS.CustomerID, CUSTOMERS.CustomerName
FROM CUSTOMERS
INNER JOIN AGENCIES ON CUSTOMERS.CustomerID=CUSTOMERS.CustomerID;

SELECT CUSTOMERS.CustomerID, CUSTOMERS.CustomerName
FROM CUSTOMERS
LEFT JOIN AGENCIES ON CUSTOMERS.CustomerID=CUSTOMERS.CustomerID;

SELECT CUSTOMERS.CustomerID, CUSTOMERS.CustomerName
FROM CUSTOMERS
RIGHT JOIN AGENCIES ON CUSTOMERS.CustomerID=CUSTOMERS.CustomerID;

SELECT CUSTOMERS.CustomerID, CUSTOMERS.CustomerName
FROM CUSTOMERS
FULL JOIN AGENCIES ON CUSTOMERS.CustomerID=CUSTOMERS.CustomerID;

SELECT RENTALS.RentalID, RENTALS.VehicleID
FROM RENTALS
INNER JOIN VEHICLES ON RENTALS.RentalID=RENTALS.RentalID;


-- 5 delete statments

DELETE FROM CUSTOMERS WHERE CustomerID= 1;
DELETE FROM CUSTOMERS WHERE CustomerID= 2;
DELETE FROM CUSTOMERS WHERE CustomerID= 3;
DELETE FROM RENTALS WHERE RentalID= 1;
DELETE FROM RENTALS WHERE RentalID= 2;

-- Qusetions answers

SELECT SUM(CustomerID) AS TotalItemsOrdered FROM CUSTOMERS;
SELECT SUM(VehicleID) AS TotalItemsOrdered FROM VEHICLES;
SELECT SUM(AgencyID) AS TotalItemsOrdered FROM AGENCIES;
SELECT AVG(VehicleID) AS AverageNUM FROM VEHICLES;
SELECT MAX(CustomerID) AS LargestPrice FROM CUSTOMERS;
SELECT MIN(CustomerID) AS SmallestPrice FROM CUSTOMERS;
SELECT SUM(VehicleID) AS TotalItemsOrdered FROM VEHICLES;
SELECT LOWER(CustomerName)from CUSTOMERS;
SELECT Upper(VehicleClassName)from VEHICLECLASSES;
SELECT UPPER(VehicleClassName) from VEHICLECLASSES;
SELECT MAX(VehicleClassPrice) AS LargestPrice FROM VEHICLECLASSES;
SELECT MIN(VehicleClassPrice) AS SmallestPrice FROM VEHICLECLASSES;
SELECT AVG(VehicleClassPrice) AS AveragePrice FROM VEHICLECLASSES;
SELECT LOWER(CustomerName) from CUSTOMERS;
SELECT CONCAT('TOYOTA', 'BMW');
SELECT GETDATE();
SELECT CURRENT_USER;
SELECT CustomerName  from CUSTOMERS where CustomerID=1;
SELECT CustomerAddress,CustomerTelephoneNumber  from CUSTOMERS where CustomerID=1;
SELECT VehicleID  from RENTALS where CustomerID=1;