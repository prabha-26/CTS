-- ===========================================
-- Exercise 1: Ranking and Window Functions
-- ===========================================

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO Products VALUES
(1,'Laptop','Electronics',65000),
(2,'Mouse','Electronics',800),
(3,'Keyboard','Electronics',1200),
(4,'Monitor','Electronics',15000),
(5,'Phone','Electronics',65000),
(6,'Chair','Furniture',3500),
(7,'Table','Furniture',7000),
(8,'Sofa','Furniture',25000),
(9,'Bed','Furniture',25000),
(10,'Lamp','Furniture',1500);

---------------------------------------------------
-- ROW_NUMBER()
---------------------------------------------------

SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RowNumber
FROM Products;

---------------------------------------------------
-- RANK()
---------------------------------------------------

SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    RANK() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS ProductRank
FROM Products;

---------------------------------------------------
-- DENSE_RANK()
---------------------------------------------------

SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    DENSE_RANK() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS DenseRank
FROM Products;

---------------------------------------------------
-- Top 3 Products using ROW_NUMBER()
---------------------------------------------------

SELECT *
FROM
(
    SELECT
        ProductID,
        ProductName,
        Category,
        Price,
        ROW_NUMBER() OVER(
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS RowNum
    FROM Products
) AS RankedProducts
WHERE RowNum <= 3;