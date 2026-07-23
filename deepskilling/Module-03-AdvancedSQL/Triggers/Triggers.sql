USE OnlineRetailStore;
GO

-- ============================================
-- Exercise 1: Create an AFTER Trigger
-- Objective:
-- Log employee salary updates.
-- ============================================

-- Step 1: Create Log Table

DROP TABLE IF EXISTS EmployeeChanges;
GO

CREATE TABLE EmployeeChanges
(
    ChangeID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    OldSalary DECIMAL(10,2),
    NewSalary DECIMAL(10,2),
    ChangeDate DATETIME DEFAULT GETDATE()
);
GO

-- Step 2: Create AFTER UPDATE Trigger

DROP TRIGGER IF EXISTS trg_AfterSalaryUpdate;
GO

CREATE TRIGGER trg_AfterSalaryUpdate
ON Employees
AFTER UPDATE
AS
BEGIN

    INSERT INTO EmployeeChanges
    (
        EmployeeID,
        OldSalary,
        NewSalary
    )

    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary
    FROM deleted d
    INNER JOIN inserted i
        ON d.EmployeeID = i.EmployeeID

    WHERE d.Salary <> i.Salary;

END;
GO

-- Step 3: Test the Trigger

UPDATE Employees
SET Salary = Salary + 2000
WHERE EmployeeID = 101;
GO

-- Step 4: Verify

SELECT *
FROM EmployeeChanges;
GO

-- ============================================
-- Exercise 2: Create an INSTEAD OF DELETE Trigger
-- Objective:
-- Prevent deletion of employee records.
-- ============================================

DROP TRIGGER IF EXISTS trg_PreventEmployeeDelete;
GO

CREATE TRIGGER trg_PreventEmployeeDelete
ON Employees
INSTEAD OF DELETE
AS
BEGIN

    RAISERROR
    (
        'Deletion of employee records is not allowed.',
        16,
        1
    );

END;
GO

DELETE FROM Employees
WHERE EmployeeID = 101;
GO
SELECT *
FROM Employees
WHERE EmployeeID = 101;
GO

ALTER TABLE EmployeeChanges
ADD ChangeMessage VARCHAR(200);
GO

-- ============================================
-- Exercise 4: Modify an Existing Trigger
-- Objective:
-- Modify the AFTER UPDATE trigger to
-- store a descriptive message.
-- ============================================

ALTER TRIGGER trg_AfterSalaryUpdate
ON Employees
AFTER UPDATE
AS
BEGIN

    INSERT INTO EmployeeChanges
    (
        EmployeeID,
        OldSalary,
        NewSalary,
        ChangeMessage
    )

    SELECT
        d.EmployeeID,
        d.Salary,
        i.Salary,
        'Salary updated successfully'
    FROM deleted d
    INNER JOIN inserted i
        ON d.EmployeeID = i.EmployeeID

    WHERE d.Salary <> i.Salary;
END;
GO
UPDATE Employees
SET Salary = Salary + 1000
WHERE EmployeeID = 102;
GO
SELECT *
FROM EmployeeChanges;
GO

-- ============================================
-- Exercise 5: Delete a Trigger
-- Objective:
-- Delete the AFTER UPDATE trigger.
-- ============================================

DROP TRIGGER IF EXISTS trg_AfterSalaryUpdate;
GO

-- Verify Deletion
SELECT
    name,
    type_desc
FROM sys.triggers
WHERE name = 'trg_AfterSalaryUpdate';
GO

USE OnlineRetailStore;
GO

--6
IF COL_LENGTH('Employees', 'AnnualSalary') IS NULL
BEGIN
    ALTER TABLE Employees
    ADD AnnualSalary DECIMAL(10,2);
END;
GO

UPDATE Employees
SET AnnualSalary = Salary * 12;
GO

-- ============================================
-- Exercise 6: Trigger to Update AnnualSalary
-- Objective:
-- Update AnnualSalary whenever Salary changes.
-- ============================================

DROP TRIGGER IF EXISTS trg_UpdateAnnualSalary;
GO

CREATE TRIGGER trg_UpdateAnnualSalary
ON Employees
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE e
    SET AnnualSalary = i.Salary * 12
    FROM Employees e
    INNER JOIN inserted i
        ON e.EmployeeID = i.EmployeeID
    INNER JOIN deleted d
        ON d.EmployeeID = i.EmployeeID
    WHERE i.Salary <> d.Salary;
END;
GO

UPDATE Employees
SET Salary = 70000
WHERE EmployeeID = 101;
GO

SELECT
    EmployeeID,
    FirstName,
    Salary,
    AnnualSalary
FROM Employees
WHERE EmployeeID = 101;
GO