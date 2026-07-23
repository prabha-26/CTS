-- grouping sets, rollup, and cube are used to generate multiple grouping sets in a single query. They are useful for creating summary reports and aggregations.
-- In this example, we will use the GROUPING SETS clause to generate multiple grouping sets for the total quantity of products sold by region and category.
USE OnlineRetailStore;
GO

SELECT
    c.Region,
    p.Category,
    SUM(od.Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY GROUPING SETS
(
    (c.Region, p.Category),
    (c.Region),
    (p.Category),
    ()
);
--Rollup is a special case of grouping sets that generates a hierarchy of groupings. In this example, we will use the ROLLUP clause to generate a hierarchy of groupings for the total quantity of products sold by region and category.    
SELECT
    c.Region,
    p.Category,
    SUM(od.Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY ROLLUP
(
    c.Region,
    p.Category
);
--cube is another special case of grouping sets that generates all possible combinations of groupings. In this example, we will use the CUBE clause to generate all possible combinations of groupings for the total quantity of products sold by region and category.
SELECT
    c.Region,
    p.Category,
    SUM(od.Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
JOIN Products p
    ON od.ProductID = p.ProductID
GROUP BY CUBE
(
    c.Region,
    p.Category
);