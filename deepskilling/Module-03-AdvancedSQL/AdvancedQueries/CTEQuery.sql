USE OnlineRetailStore;
GO

WITH CustomerSales AS
(
    SELECT
        c.CustomerID,
        c.CustomerName,
        SUM(o.TotalAmount) AS TotalSales
    FROM Customers c
    JOIN Orders o
        ON c.CustomerID = o.CustomerID
    GROUP BY
        c.CustomerID,
        c.CustomerName
)

SELECT
    CustomerID,
    CustomerName,
    TotalSales
FROM CustomerSales
WHERE TotalSales > 20000
ORDER BY TotalSales DESC;