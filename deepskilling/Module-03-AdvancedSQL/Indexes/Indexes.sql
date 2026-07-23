USE OnlineRetailStore;
GO

-- ============================================
-- Exercise 1: Creating a Non-Clustered Index
-- Objective:
-- Improve search performance on ProductName.
-- ============================================

-- Step 1: Query before index creation

SELECT *
FROM Products
WHERE ProductName = 'Laptop';
GO

-- Step 2: Create Non-Clustered Index

DROP INDEX IF EXISTS IX_Products_ProductName
ON Products;
GO

CREATE NONCLUSTERED INDEX IX_Products_ProductName
ON Products(ProductName);
GO

-- Step 3: Query after index creation

SELECT *
FROM Products
WHERE ProductName = 'Laptop';
GO

-- ============================================
-- Exercise 2: Creating an Index on OrderDate
-- Objective:
-- Improve searching based on OrderDate.
-- ============================================

-- Step 1: Query before index creation

SELECT *
FROM Orders
WHERE OrderDate = '2023-01-15';
GO

-- Step 2: Create Index

DROP INDEX IF EXISTS IX_Orders_OrderDate
ON Orders;
GO

CREATE NONCLUSTERED INDEX IX_Orders_OrderDate
ON Orders(OrderDate);
GO

-- Step 3: Query after index creation

SELECT *
FROM Orders
WHERE OrderDate = '2023-01-15';
GO

-- ============================================
-- Exercise 3: Creating a Composite Index
-- Objective:
-- Improve query performance when searching
-- by CustomerID and OrderDate.
-- ============================================

-- Step 1: Query before index creation

SELECT *
FROM Orders
WHERE CustomerID = 1
AND OrderDate = '2023-01-15';
GO

-- Step 2: Create Composite Index

DROP INDEX IF EXISTS IX_Orders_CustomerID_OrderDate
ON Orders;
GO

CREATE NONCLUSTERED INDEX IX_Orders_CustomerID_OrderDate
ON Orders(CustomerID, OrderDate);
GO

-- Step 3: Query after index creation

SELECT *
FROM Orders
WHERE CustomerID = 1
AND OrderDate = '2023-01-15';
GO