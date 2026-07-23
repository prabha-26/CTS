--Update Order Dates
USE OnlineRetailStore;
GO

UPDATE Orders SET OrderDate='2026-01-10' WHERE OrderID=1001;
UPDATE Orders SET OrderDate='2026-02-15' WHERE OrderID=1002;
UPDATE Orders SET OrderDate='2026-03-18' WHERE OrderID=1003;
UPDATE Orders SET OrderDate='2026-01-25' WHERE OrderID=1004;
UPDATE Orders SET OrderDate='2026-02-28' WHERE OrderID=1005;

SELECT OrderID, OrderDate
FROM Orders;

--Aggregate Sales
SELECT
    p.ProductName,
    DATENAME(MONTH,o.OrderDate) AS SalesMonth,
    SUM(od.Quantity) AS TotalQuantity
FROM Orders o
JOIN OrderDetails od
    ON o.OrderID=od.OrderID
JOIN Products p
    ON od.ProductID=p.ProductID
GROUP BY
    p.ProductName,
    DATENAME(MONTH,o.OrderDate);


--pivot
SELECT *
FROM
(
    SELECT
        p.ProductName,
        DATENAME(MONTH,o.OrderDate) AS SalesMonth,
        od.Quantity
    FROM Orders o
    JOIN OrderDetails od
        ON o.OrderID=od.OrderID
    JOIN Products p
        ON od.ProductID=p.ProductID
) AS SourceData

PIVOT
(
    SUM(Quantity)
    FOR SalesMonth IN
    (
        [January],
        [February],
        [March]
    )
) AS PivotTable;
--unpivot
SELECT
    ProductName,
    SalesMonth,
    Quantity
FROM
(
    SELECT *
    FROM
    (
        SELECT
            p.ProductName,
            DATENAME(MONTH,o.OrderDate) AS SalesMonth,
            od.Quantity
        FROM Orders o
        JOIN OrderDetails od
            ON o.OrderID=oD.OrderID
        JOIN Products p
            ON od.ProductID=p.ProductID
    ) AS SourceData

    PIVOT
    (
        SUM(Quantity)
        FOR SalesMonth IN
        (
            [January],
            [February],
            [March]
        )
    ) AS PivotTable
) AS P

UNPIVOT
(
    Quantity FOR SalesMonth IN
    (
        [January],
        [February],
        [March]
    )
) AS UnpivotTable;