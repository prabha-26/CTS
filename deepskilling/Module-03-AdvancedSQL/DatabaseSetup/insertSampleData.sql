USE OnlineRetailStore;
GO

-- Customers
INSERT INTO Customers (CustomerID, CustomerName, Email, City)
VALUES
(1,'Rishi','rishi@gmail.com','Guntur'),
(2,'Rahul','rahul@gmail.com','Hyderabad'),
(3,'Anjali','anjali@gmail.com','Vijayawada'),
(4,'Kiran','kiran@gmail.com','Chennai'),
(5,'Sneha','sneha@gmail.com','Bangalore');

-- Products
INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(101,'Laptop','Electronics',65000),
(102,'Mouse','Electronics',800),
(103,'Keyboard','Electronics',1200),
(104,'Monitor','Electronics',15000),
(105,'Phone','Electronics',50000),
(106,'Chair','Furniture',3500),
(107,'Table','Furniture',7000),
(108,'Sofa','Furniture',25000),
(109,'Bed','Furniture',30000),
(110,'Lamp','Furniture',1500);

-- Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1001,1,'2026-07-01',65800),
(1002,2,'2026-07-02',15000),
(1003,3,'2026-07-03',3500),
(1004,4,'2026-07-04',25000),
(1005,5,'2026-07-05',50000);

-- Order Details
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1,1001,101,1),
(2,1001,102,1),
(3,1002,104,1),
(4,1003,106,1),
(5,1004,108,1),
(6,1005,105,1);