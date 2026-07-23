USE OnlineRetailStore;
GO

-- ============================================
-- Exercise 1: Create a Simple View
-- Objective:
-- Display EmployeeID, FirstName, LastName,
-- and DepartmentName using a SQL View.
-- ============================================

DROP VIEW IF EXISTS vw_EmployeeBasicInfo;
GO

CREATE VIEW vw_EmployeeBasicInfo
AS
SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID;
GO

-- Verify Output
SELECT *
FROM vw_EmployeeBasicInfo;
GO

-- ============================================
-- Exercise 2: Add Computed Column - Full Name
-- Objective:
-- Create a view with a computed FullName column.
-- ============================================

DROP VIEW IF EXISTS vw_EmployeeFullName;
GO

CREATE VIEW vw_EmployeeFullName
AS
SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.FirstName + ' ' + e.LastName AS FullName,
    d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID;
GO

-- Verify Output
SELECT *
FROM vw_EmployeeFullName;
GO

-- ============================================
-- Exercise 3: Add Computed Column - Annual Salary
-- Objective:
-- Create a view with a computed AnnualSalary column.
-- ============================================

DROP VIEW IF EXISTS vw_EmployeeAnnualSalary;
GO

CREATE VIEW vw_EmployeeAnnualSalary
AS
SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    d.DepartmentName,
    e.Salary,
    (e.Salary * 12) AS AnnualSalary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID;
GO

-- Verify Output
SELECT *
FROM vw_EmployeeAnnualSalary;
GO

-- ============================================
-- Exercise 4: Employee Report View
-- Objective:
-- Create a view with multiple computed columns.
-- ============================================

DROP VIEW IF EXISTS vw_EmployeeReport;
GO

CREATE VIEW vw_EmployeeReport
AS
SELECT
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS FullName,
    d.DepartmentName,
    (e.Salary * 12) AS AnnualSalary,
    (e.Salary * 12) * 0.10 AS Bonus
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID;
GO

-- Verify Output
SELECT *
FROM vw_EmployeeReport;
GO