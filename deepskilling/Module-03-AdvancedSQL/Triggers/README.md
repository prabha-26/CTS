# Exercise 1 - AFTER Trigger

## Objective

Create an AFTER UPDATE trigger to log employee salary changes.

## Trigger Name

trg_AfterSalaryUpdate

## Table Created

EmployeeChanges

## SQL Concepts Covered

- CREATE TRIGGER
- AFTER UPDATE
- inserted
- deleted
- Audit Logging

## Outcome

Successfully logged salary changes whenever an employee's salary was updated.


# Exercise 2 - INSTEAD OF DELETE Trigger

## Objective

Prevent users from deleting employee records.

## Trigger Name

trg_PreventEmployeeDelete

## SQL Concepts Covered

- CREATE TRIGGER
- INSTEAD OF DELETE
- RAISERROR

## Verification

Attempted to delete an employee record. The trigger displayed an error and prevented the deletion.

## Outcome

Successfully created an INSTEAD OF DELETE trigger to protect employee data.

# Exercise 4 - Modify a Trigger

## Objective

Modify an existing AFTER UPDATE trigger to record an additional descriptive message.

## Trigger Name

trg_AfterSalaryUpdate

## SQL Concepts Covered

- ALTER TRIGGER
- AFTER UPDATE
- inserted
- deleted

## Outcome

Successfully modified the trigger and verified the updated logging functionality.

# Exercise 5 - Delete a Trigger

## Objective

Delete the existing AFTER UPDATE trigger.

## Trigger Name

trg_AfterSalaryUpdate

## SQL Concepts Covered

- DROP TRIGGER
- IF EXISTS
- System Catalog (sys.triggers)

## Outcome

Successfully deleted the trigger and verified its removal.

# Exercise 6 - Trigger to Update Annual Salary

## Objective

Automatically update the AnnualSalary column whenever the Salary column changes.

## Trigger Name

trg_UpdateAnnualSalary

## SQL Concepts Covered

- AFTER UPDATE Trigger
- inserted Table
- deleted Table
- UPDATE Statement

## Formula

AnnualSalary = Salary × 12

## Outcome

Successfully created a trigger that keeps the AnnualSalary column synchronized with Salary.


## Exercise 3 - LOGON Trigger

### Objective

Understand how a LOGON trigger can restrict user access during maintenance hours.

### Limitation

This exercise was studied but not executed because a LOGON trigger runs every time a user connects to SQL Server. If implemented incorrectly, it can block all logins to the SQL Server instance, including the administrator, making the server inaccessible. Therefore, it should only be tested in a controlled environment.

### Outcome

Understood the working and purpose of LOGON triggers without executing them on the local SQL Server instance.
