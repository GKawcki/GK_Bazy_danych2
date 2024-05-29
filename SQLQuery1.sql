USE AdventureWorks2022;

--Zad 1
BEGIN TRANSACTION 
	UPDATE Production.Product
	SET ListPrice = ListPrice * 1.1
	WHERE ProductID = 680 
COMMIT;

SELECT * FROM Production.Product WHERE PRODUCTid = 680;


--Zad 2
BEGIN TRANSACTION 
	DELETE FROM Production.Product WHERE ProductID = 707
ROLLBACK;

SELECT * FROM Production.Product WHERE PRODUCTid = 707;


--Zad 3
SET IDENTITY_INSERT Production.Product ON

BEGIN TRANSACTION 
	INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, FinishedGoodsFlag, Color, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, ModifiedDate)
	VALUES(10, 'New item', 'NI-001-S', 0, 1, 'black', 35, 2, 15.00, 24.00, 1.00, '2008-04-30 00:00:00.000', '2014-02-08 10:01:36.827');
COMMIT;

SELECT * FROM Production.Product WHERE ProductID = 10;


--Zad 4
BEGIN TRANSACTION 
UPDATE Production.Product
SET StandardCost = StandardCost*1.1

IF (SELECT SUM(StandardCost) FROM Production.Product) < 50000
	BEGIN
		PRINT 'Tranzakcja wykonana'
		COMMIT;
	END
ELSE
	BEGIN
		PRINT 'Tranzakcja niewykonana'
		ROLLBACK;
	END;

SELECT * FROM Production.Product;


--Zad 5
BEGIN TRANSACTION 

IF EXISTS (SELECT * FROM Production.Product WHERE ProductNumber='CX-1111-R')
	BEGIN
		PRINT 'Tranzakcja niewykonana'
		ROLLBACK;
	END;
ELSE
	BEGIN
		INSERT INTO Production.Product (ProductID, Name, ProductNumber, MakeFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate, ModifiedDate)
		VALUES(18, 'ConsoleY', 'CX-1111-R', 0, 200, 150, 1.00, 2.00, 3.00, '2008-04-30 00:00:00.000', '2014-02-08 10:01:36.827')
		PRINT 'Tranzakcja wykonana'
		COMMIT;
	END;

SELECT * FROM Production.Product;


--Zad 6
BEGIN TRANSACTION

UPDATE Sales.SalesOrderDetail
SET OrderQty = OrderQty + 1;

IF EXISTS (SELECT * FROM Sales.SalesOrderDetail WHERE OrderQty = 0)
	BEGIN
		PRINT 'Tranzakcja niewykonana'
    	ROLLBACK;
	END
ELSE
	BEGIN
		PRINT 'Tranzakcja wykonana'
    	COMMIT;
	END;

SELECT * FROM Sales.SalesOrderDetail;


--Zad 7
BEGIN TRANSACTION 

DELETE FROM Production.Product
WHERE StandardCost > (SELECT AVG(StandardCost) FROM Production.Product);
IF @@ROWCOUNT > 10
	BEGIN
		PRINT 'Tranzakcja niewykonana'
		ROLLBACK;
	END;
ELSE
	BEGIN
		PRINT 'Tranzakcja wykonana'
		COMMIT;
	END;
	
SELECT * FROM Production.Product;