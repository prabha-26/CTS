--cte
USE OnlineRetailStore;
GO

WITH CalendarCTE AS
(
    SELECT CAST('2025-01-01' AS DATE) AS CalendarDate

    UNION ALL

    SELECT DATEADD(DAY,1,CalendarDate)
    FROM CalendarCTE
    WHERE CalendarDate < '2025-01-31'
)

SELECT *
FROM CalendarCTE
OPTION(MAXRECURSION 31);

-- Merge statement is used to perform insert, update, or delete operations on a target table based on the data in a source table. In this example, we will use the MERGE statement to update the quantity of products in the Products table based on the data in the OrderDetails table.
CREATE TABLE StagingProducts
(
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
INSERT INTO StagingProducts
VALUES
(101,'Laptop','Electronics',70000),
(102,'Mouse','Electronics',900),
(111,'Printer','Electronics',12000),
(112,'Bookshelf','Furniture',8000);
MERGE Products AS Target
USING StagingProducts AS Source
ON Target.ProductID = Source.ProductID

WHEN MATCHED THEN
UPDATE SET
    Target.ProductName = Source.ProductName,
    Target.Category = Source.Category,
    Target.Price = Source.Price

WHEN NOT MATCHED THEN
INSERT
(
    ProductID,
    ProductName,
    Category,
    Price
)
VALUES
(
    Source.ProductID,
    Source.ProductName,
    Source.Category,
    Source.Price
);
SELECT *
FROM Products
ORDER BY ProductID;
SELECT *
FROM Products
WHERE ProductID >= 110
ORDER BY ProductID;