USE OnlineRetailStore;
GO

-- ============================================
-- Exercise 1: Create a Cursor
-- Objective:
-- Iterate through all employees and
-- print their details.
-- ============================================

DECLARE
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE;

DECLARE EmployeeCursor CURSOR
FOR
SELECT
    EmployeeID,
    FirstName,
    LastName,
    DepartmentID,
    Salary,
    JoinDate
FROM Employees;

OPEN EmployeeCursor;

FETCH NEXT
FROM EmployeeCursor
INTO
    @EmployeeID,
    @FirstName,
    @LastName,
    @DepartmentID,
    @Salary,
    @JoinDate;

WHILE @@FETCH_STATUS = 0
BEGIN

    PRINT
        'EmployeeID: ' + CAST(@EmployeeID AS VARCHAR(10))
        + ', Name: ' + @FirstName + ' ' + @LastName
        + ', DepartmentID: ' + CAST(@DepartmentID AS VARCHAR(10))
        + ', Salary: ' + CAST(@Salary AS VARCHAR(20));

    FETCH NEXT
    FROM EmployeeCursor
    INTO
        @EmployeeID,
        @FirstName,
        @LastName,
        @DepartmentID,
        @Salary,
        @JoinDate;

END;

CLOSE EmployeeCursor;

DEALLOCATE EmployeeCursor;
GO

-- ============================================
-- Exercise 2: Types of Cursors
-- Objective:
-- Demonstrate different cursor types.
-- ============================================

-- Static Cursor

DECLARE StaticCursor CURSOR STATIC
FOR
SELECT EmployeeID, FirstName
FROM Employees;

OPEN StaticCursor;

PRINT 'Static Cursor Created Successfully';

CLOSE StaticCursor;
DEALLOCATE StaticCursor;
GO

-- Dynamic Cursor

DECLARE DynamicCursor CURSOR DYNAMIC
FOR
SELECT EmployeeID, FirstName
FROM Employees;

OPEN DynamicCursor;

PRINT 'Dynamic Cursor Created Successfully';

CLOSE DynamicCursor;
DEALLOCATE DynamicCursor;
GO

-- Forward-Only Cursor

DECLARE ForwardCursor CURSOR FORWARD_ONLY
FOR
SELECT EmployeeID, FirstName
FROM Employees;

OPEN ForwardCursor;

PRINT 'Forward-Only Cursor Created Successfully';

CLOSE ForwardCursor;
DEALLOCATE ForwardCursor;
GO

-- Keyset Cursor

DECLARE KeysetCursor CURSOR KEYSET
FOR
SELECT EmployeeID, FirstName
FROM Employees;

OPEN KeysetCursor;

PRINT 'Keyset Cursor Created Successfully';

CLOSE KeysetCursor;
DEALLOCATE KeysetCursor;
GO