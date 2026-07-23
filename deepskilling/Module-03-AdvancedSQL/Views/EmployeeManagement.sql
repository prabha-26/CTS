USE OnlineRetailStore;
GO

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
        FOREIGN KEY REFERENCES Departments(DepartmentID),
    Salary DECIMAL(10,2),
    JoinDate DATE
);
INSERT INTO Departments
VALUES
(1,'Human Resources'),
(2,'Finance'),
(3,'Information Technology'),
(4,'Marketing'),
(5,'Sales');
INSERT INTO Employees
VALUES
(101,'Rishi','Sai',3,65000,'2023-06-15'),
(102,'Rahul','Kumar',2,55000,'2022-01-10'),
(103,'Anjali','Sharma',4,50000,'2021-09-21'),
(104,'Sneha','Reddy',1,48000,'2024-02-05'),
(105,'Kiran','Patel',5,60000,'2020-12-11');
SELECT *
FROM Departments;

SELECT *
FROM Employees;