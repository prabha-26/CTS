USE OnlineRetailStore;
GO

-- ============================================
-- Exercise 1: Basic TRY...CATCH for Error Logging
-- Objective:
-- Insert an employee and log any errors.
-- ============================================

-- Create AuditLog table if it does not exist
IF OBJECT_ID('AuditLog', 'U') IS NULL
BEGIN
    CREATE TABLE AuditLog
    (
        LogID INT IDENTITY(1,1) PRIMARY KEY,
        Action VARCHAR(100),
        ErrorMessage VARCHAR(4000),
        ActionDate DATETIME DEFAULT GETDATE()
    );
END;
GO

DROP PROCEDURE IF EXISTS AddEmployee;
GO

CREATE PROCEDURE AddEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

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

        PRINT 'Employee inserted successfully.';

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog
        (
            Action,
            ErrorMessage
        )
        VALUES
        (
            'AddEmployee',
            ERROR_MESSAGE()
        );

        PRINT 'Error logged successfully.';

    END CATCH
END;
GO
EXEC AddEmployee
    @EmployeeID = 107,
    @FirstName = 'Vamsi',
    @LastName = 'Krishna',
    @DepartmentID = 3,
    @Salary = 65000,
    @JoinDate = '2026-07-05';
GO
EXEC AddEmployee
    @EmployeeID = 107,
    @FirstName = 'Vamsi',
    @LastName = 'Krishna',
    @DepartmentID = 3,
    @Salary = 65000,
    @JoinDate = '2026-07-05';
GO
SELECT *
FROM AuditLog;
GO
-- ============================================
-- Exercise 2: Using THROW to Re-raise Errors
-- Objective:
-- Log the error and re-throw it.
-- ============================================

ALTER PROCEDURE AddEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

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

        PRINT 'Employee inserted successfully.';

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog
        (
            Action,
            ErrorMessage
        )
        VALUES
        (
            'AddEmployee',
            ERROR_MESSAGE()
        );

        -- Re-throw the original error
        THROW;

    END CATCH
END;
GO
EXEC AddEmployee
    @EmployeeID = 108,
    @FirstName = 'Ravi',
    @LastName = 'Kumar',
    @DepartmentID = 3,
    @Salary = 60000,
    @JoinDate = '2026-07-05';
GO
EXEC AddEmployee
    @EmployeeID = 108,
    @FirstName = 'Ravi',
    @LastName = 'Kumar',
    @DepartmentID = 3,
    @Salary = 60000,
    @JoinDate = '2026-07-05';
GO
SELECT *
FROM AuditLog;
GO

-- ============================================
-- Exercise 3: Custom Error with RAISERROR
-- Objective:
-- Validate salary before inserting.
-- ============================================

ALTER PROCEDURE AddEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        IF @Salary <= 0
        BEGIN
            RAISERROR('Salary must be greater than zero.',16,1);
            RETURN;
        END

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

        PRINT 'Employee inserted successfully.';

    END TRY

    BEGIN CATCH

        INSERT INTO AuditLog
        (
            Action,
            ErrorMessage
        )
        VALUES
        (
            'AddEmployee',
            ERROR_MESSAGE()
        );

        THROW;

    END CATCH
END;
GO

-- Test

EXEC AddEmployee
    @EmployeeID = 109,
    @FirstName = 'Ajay',
    @LastName = 'Reddy',
    @DepartmentID = 3,
    @Salary = -100,
    @JoinDate = '2026-07-05';
GO  

-- ============================================
-- Exercise 4: Nested TRY...CATCH
-- Objective:
-- Transfer employee between departments.
-- ============================================

DROP PROCEDURE IF EXISTS TransferEmployee;
GO

CREATE PROCEDURE TransferEmployee
    @EmployeeID INT,
    @DepartmentID INT
AS
BEGIN

    BEGIN TRY

        IF NOT EXISTS
        (
            SELECT *
            FROM Departments
            WHERE DepartmentID = @DepartmentID
        )
        BEGIN
            RAISERROR('Department does not exist.',16,1);
        END

        BEGIN TRY

            UPDATE Employees
            SET DepartmentID = @DepartmentID
            WHERE EmployeeID = @EmployeeID;

            PRINT 'Transfer Successful';

        END TRY

        BEGIN CATCH

            INSERT INTO AuditLog
            (
                Action,
                ErrorMessage
            )
            VALUES
            (
                'TransferEmployee',
                ERROR_MESSAGE()
            );

            THROW;

        END CATCH

    END TRY

    BEGIN CATCH

        PRINT ERROR_MESSAGE();

    END CATCH

END;
GO

-- Test

EXEC TransferEmployee
    @EmployeeID = 101,
    @DepartmentID = 99;
GO

-- ============================================
-- Exercise 5: Transactions
-- Objective:
-- Insert multiple employees using
-- transactions.
-- ============================================

DROP PROCEDURE IF EXISTS BatchInsertEmployees;
GO

CREATE PROCEDURE BatchInsertEmployees
AS
BEGIN

    BEGIN TRY

        BEGIN TRANSACTION;

        INSERT INTO Employees
        VALUES
        (
            110,
            'Sai',
            'Kiran',
            3,
            65000,
            '2026-07-05'
        );

        INSERT INTO Employees
        VALUES
        (
            111,
            'Ram',
            'Krishna',
            3,
            70000,
            '2026-07-05'
        );

        COMMIT TRANSACTION;

        PRINT 'Batch Insert Successful';

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION;

        INSERT INTO AuditLog
        (
            Action,
            ErrorMessage
        )
        VALUES
        (
            'BatchInsertEmployees',
            ERROR_MESSAGE()
        );

        PRINT 'Transaction Rolled Back';

    END CATCH

END;
GO

EXEC BatchInsertEmployees;
GO

-- ============================================
-- Exercise 6: Dynamic RAISERROR
-- Objective:
-- Raise different errors based on salary.
-- ============================================

ALTER PROCEDURE AddEmployee
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DepartmentID INT,
    @Salary DECIMAL(10,2),
    @JoinDate DATE
AS
BEGIN

    IF @Salary < 0
    BEGIN
        RAISERROR
        (
            'Salary cannot be negative.',
            16,
            1
        );
        RETURN;
    END

    IF @Salary < 1000
    BEGIN
        RAISERROR
        (
            'Salary is very low.',
            10,
            1
        );
    END

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

-- Warning Test

EXEC AddEmployee
    112,
    'Test',
    'User',
    3,
    500,
    '2026-07-05';
GO

-- Error Test

EXEC AddEmployee
    113,
    'Test',
    'User',
    3,
    -100,
    '2026-07-05';
GO