USE OnlineRetailStore;
GO

-- ============================================
-- Exercise 1A: Retrieve Employees by Department
-- Objective:
-- Return all employees belonging to a department.
-- ============================================

DROP PROCEDURE IF EXISTS sp_GetEmployeesByDepartment;
GO

CREATE PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        e.EmployeeID,
        e.FirstName,
        e.LastName,
        d.DepartmentName,
        e.Salary,
        e.JoinDate
    FROM Employees e
    INNER JOIN Departments d
        ON e.DepartmentID = d.DepartmentID
    WHERE e.DepartmentID = @DepartmentID;
END;
GO

-- Test Procedure
EXEC sp_GetEmployeesByDepartment 3;
GO

-- ============================================
-- Exercise 1B: Insert Employee
-- Objective:
-- Insert a new employee record.
-- ============================================

DROP PROCEDURE IF EXISTS sp_InsertEmployee;
GO

CREATE PROCEDURE sp_InsertEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Employees
    (
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        JoinDate
    )
    VALUES
    (
        @EmployeeID,
        @FirstName,
        @LastName,
        @DepartmentID,
        @Salary,
        @JoinDate
    );
END;
GO

-- Test Procedure
EXEC sp_InsertEmployee
    @EmployeeID = 106,
    @FirstName = 'Arjun',
    @LastName = 'Kumar',
    @DepartmentID = 3,
    @Salary = 62000,
    @JoinDate = '2026-07-05';
GO

-- Verify Insert
SELECT *
FROM Employees
WHERE EmployeeID = 106;
GO

-- ============================================
-- Exercise 2: Modify a Stored Procedure
-- Objective:
-- Modify the stored procedure to include
-- Salary and JoinDate in the result.
-- ============================================

ALTER PROCEDURE sp_GetEmployeesByDepartment
    @DepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;

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
    WHERE e.DepartmentID = @DepartmentID;
END;
GO

-- Verify Output
EXEC sp_GetEmployeesByDepartment 3;
GO

-- ============================================
-- Exercise 4: Execute a Stored Procedure
-- Objective:
-- Execute the stored procedure to retrieve
-- employees of a specific department.
-- ============================================

EXEC sp_GetEmployeesByDepartment
    @DepartmentID = 3;
GO
-- ============================================
-- Exercise 5: Return Employee Count
-- Objective:
-- Return the total number of employees
-- in a specific department.
-- ============================================

DROP PROCEDURE IF EXISTS sp_GetEmployeeCountByDepartment;
GO

CREATE PROCEDURE sp_GetEmployeeCountByDepartment
    @DepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

-- Verify Output
EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 3;
GO

-- ============================================
-- Exercise 6: Output Parameters
-- Objective:
-- Return total salary using an
-- OUTPUT parameter.
-- ============================================

DROP PROCEDURE IF EXISTS sp_GetTotalSalaryByDepartment;
GO

CREATE PROCEDURE sp_GetTotalSalaryByDepartment
    @DepartmentID INT,
    @TotalSalary DECIMAL(18,2) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        @TotalSalary = SUM(Salary)
    FROM Employees
    WHERE DepartmentID = @DepartmentID;
END;
GO

DECLARE @Total DECIMAL(18,2);

EXEC sp_GetTotalSalaryByDepartment
    @DepartmentID = 3,
    @TotalSalary = @Total OUTPUT;

SELECT @Total AS TotalSalary;
GO

-- ============================================
-- Exercise 7: Update Employee Salary
-- Objective:
-- Update salary using multiple parameters.
-- ============================================

DROP PROCEDURE IF EXISTS sp_UpdateEmployeeSalary;
GO

CREATE PROCEDURE sp_UpdateEmployeeSalary
    @EmployeeID INT,
    @Salary DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Employees
    SET Salary = @Salary
    WHERE EmployeeID = @EmployeeID;
END;
GO

EXEC sp_UpdateEmployeeSalary
    @EmployeeID = 101,
    @Salary = 75000;
GO

SELECT *
FROM Employees
WHERE EmployeeID = 101;
GO

-- ============================================
-- Exercise 8: Give Bonus
-- Objective:
-- Give department-wise bonus.
-- ============================================

DROP PROCEDURE IF EXISTS sp_GiveBonus;
GO

CREATE PROCEDURE sp_GiveBonus
    @DepartmentID INT,
    @Bonus DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Employees
    SET Salary = Salary + @Bonus
    WHERE DepartmentID = @DepartmentID;
END;
GO

EXEC sp_GiveBonus
    @DepartmentID = 3,
    @Bonus = 1000;
GO

SELECT *
FROM Employees
WHERE DepartmentID = 3;
GO

-- ============================================
-- Exercise 9: Transactions
-- Objective:
-- Update salary using transactions.
-- ============================================

DROP PROCEDURE IF EXISTS sp_UpdateSalaryTransaction;
GO

CREATE PROCEDURE sp_UpdateSalaryTransaction
    @EmployeeID INT,
    @Salary DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        BEGIN TRANSACTION;

        UPDATE Employees
        SET Salary = @Salary
        WHERE EmployeeID = @EmployeeID;

        COMMIT TRANSACTION;

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        THROW;

    END CATCH
END;
GO

EXEC sp_UpdateSalaryTransaction
    @EmployeeID = 102,
    @Salary = 80000;
GO

-- ============================================
-- Exercise 10: Dynamic SQL
-- Objective:
-- Retrieve employee details using
-- dynamic SQL.
-- ============================================

DROP PROCEDURE IF EXISTS sp_GetEmployeesDynamic;
GO

CREATE PROCEDURE sp_GetEmployeesDynamic
    @ColumnName NVARCHAR(100),
    @Value NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    SET @SQL =
        N'SELECT * FROM Employees
          WHERE ' + QUOTENAME(@ColumnName) + ' = @Value';

    EXEC sp_executesql
        @SQL,
        N'@Value NVARCHAR(100)',
        @Value;
END;
GO

EXEC sp_GetEmployeesDynamic
    @ColumnName = 'FirstName',
    @Value = 'Rishi';
GO

-- ============================================
-- Exercise 11: Error Handling
-- Objective:
-- Handle errors using TRY...CATCH.
-- ============================================

DROP PROCEDURE IF EXISTS sp_UpdateEmployeeSalarySafe;
GO

CREATE PROCEDURE sp_UpdateEmployeeSalarySafe
    @EmployeeID INT,
    @Salary DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        UPDATE Employees
        SET Salary = @Salary
        WHERE EmployeeID = @EmployeeID;

        PRINT 'Salary updated successfully.';

    END TRY

    BEGIN CATCH

        PRINT 'Error updating salary.';
        PRINT ERROR_MESSAGE();

    END CATCH
END;
GO

EXEC sp_UpdateEmployeeSalarySafe
    @EmployeeID = 101,
    @Salary = 85000;
GO