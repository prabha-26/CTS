USE OnlineRetailStore;
GO

-- ============================================
-- Exercise 1: Create a Scalar Function
-- Objective:
-- Calculate the annual salary of an employee.
-- ============================================

DROP FUNCTION IF EXISTS fn_CalculateAnnualSalary;
GO

CREATE FUNCTION fn_CalculateAnnualSalary
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 12;
END;
GO

-- Verify Output
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO

-- ============================================
-- Exercise 2: Create a Table-Valued Function
-- Objective:
-- Return all employees belonging to a specific department.
-- ============================================

DROP FUNCTION IF EXISTS fn_GetEmployeesByDepartment;
GO

CREATE FUNCTION fn_GetEmployeesByDepartment
(
    @DepartmentID INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        d.DepartmentName,
        e.Salary,
        e.JoinDate
    FROM Employees AS e
    INNER JOIN Departments AS d
        ON e.DepartmentID = d.DepartmentID
    WHERE e.DepartmentID = @DepartmentID
);
GO

-- Verify Output
-- Replace the DepartmentID based on your data.
SELECT *
FROM dbo.fn_GetEmployeesByDepartment(3);
GO

-- ============================================
-- Exercise 3: Create a User-Defined Function
-- Objective:
-- Calculate 10% bonus based on monthly salary.
-- ============================================

DROP FUNCTION IF EXISTS fn_CalculateBonus;
GO

CREATE FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.10;
END;
GO
-- Verify Output
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    dbo.fn_CalculateBonus(Salary) AS Bonus
FROM Employees;
GO

-- ============================================
-- Exercise 4: Modify a User-Defined Function
-- Objective:
-- Modify the bonus calculation from
-- 10% to 15% of the salary.
-- ============================================

ALTER FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.15;
END;
GO
-- Verify Output
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    dbo.fn_CalculateBonus(Salary) AS Bonus
FROM Employees;
GO

-- ============================================
-- Exercise 5: Delete a User-Defined Function
-- Objective:
-- Delete the fn_CalculateBonus function.
-- ============================================

DROP FUNCTION IF EXISTS fn_CalculateBonus;
GO
SELECT
    name,
    type_desc
FROM sys.objects
WHERE name = 'fn_CalculateBonus';
GO


-- ============================================
-- Exercise 6: Execute a User-Defined Function
-- Objective:
-- Execute fn_CalculateAnnualSalary for
-- all employees.
-- ============================================

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
GO

-- ============================================
-- Exercise 7: Return Data from a Scalar Function
-- Objective:
-- Calculate annual salary for a specific employee.
-- ============================================

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees
WHERE EmployeeID = 101;
GO

-- ============================================
-- Exercise 8: Return Data from a Table-Valued Function
-- Objective:
-- Return employees from the IT department.
-- ============================================

SELECT *
FROM dbo.fn_GetEmployeesByDepartment(3);
GO
-- excercise 9: Create a Nested User-Defined Function
CREATE FUNCTION fn_CalculateBonus
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN @Salary * 0.15;
END;
GO
CREATE FUNCTION fn_CalculateTotalCompensation
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    DECLARE @AnnualSalary DECIMAL(10,2);

    DECLARE @Bonus DECIMAL(10,2);

    SET @AnnualSalary =
    dbo.fn_CalculateAnnualSalary(@Salary);

    SET @Bonus =
    dbo.fn_CalculateBonus(@Salary);

    RETURN @AnnualSalary + @Bonus;

END;
GO
SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary)
        AS AnnualSalary,

    dbo.fn_CalculateBonus(Salary)
        AS Bonus,

    dbo.fn_CalculateTotalCompensation(Salary)
        AS TotalCompensation

FROM Employees;
GO

-- ============================================
-- Exercise 10: Modify Nested Function
-- Objective:
-- Modify Total Compensation calculation.
-- ============================================

-- ============================================
-- Exercise 10: Modify Nested User-Defined Function
-- Objective:
-- Modify fn_CalculateTotalCompensation
-- ============================================

ALTER FUNCTION fn_CalculateTotalCompensation
(
    @Salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN

    RETURN
        dbo.fn_CalculateAnnualSalary(@Salary)
        +
        dbo.fn_CalculateBonus(@Salary)
        +
        5000;

END;
GO

-- Verify Output
SELECT
    EmployeeID,
    FirstName,
    Salary,
    dbo.fn_CalculateAnnualSalary(Salary) AS AnnualSalary,
    dbo.fn_CalculateBonus(Salary) AS Bonus,
    dbo.fn_CalculateTotalCompensation(Salary) AS TotalCompensation
FROM Employees;
GO