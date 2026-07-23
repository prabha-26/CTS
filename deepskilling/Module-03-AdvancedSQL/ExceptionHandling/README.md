# Exercise 1 - Basic TRY...CATCH for Error Logging

## Objective

Create a stored procedure that inserts employee records and logs any runtime errors using TRY...CATCH.

## Procedure Name

AddEmployee

## Tables Used

- Employees
- AuditLog

## SQL Concepts Covered

- CREATE PROCEDURE
- TRY...CATCH
- ERROR_MESSAGE()
- INSERT
- Error Logging

## Verification

Executed the procedure with valid and invalid data. Verified that successful inserts were completed and errors were logged into the AuditLog table.

## Outcome

Successfully implemented basic exception handling and centralized error logging using TRY...CATCH.

# Exercise 2 - Using THROW to Re-raise Errors

## Objective

Modify the AddEmployee stored procedure to log errors and re-throw them using the THROW statement.

## Procedure Name

AddEmployee

## Tables Used

- Employees
- AuditLog

## SQL Concepts Covered

- ALTER PROCEDURE
- TRY...CATCH
- THROW
- ERROR_MESSAGE()
- Error Logging

## Verification

Executed the procedure with duplicate employee data. Verified that the error was logged in the AuditLog table and re-raised to the caller.

## Outcome

Successfully implemented error propagation using THROW while maintaining centralized error logging.

# Exercise 3 - Custom Error with RAISERROR

## Objective

Validate employee salary before inserting records.

## Procedure Name

AddEmployee

## SQL Concepts Covered

- RAISERROR
- TRY...CATCH
- Business Rule Validation

## Validation Rule

Salary must be greater than zero.

## Verification

Executed the procedure with a negative salary and verified that a custom error was raised and logged.

## Outcome

Successfully enforced salary validation using RAISERROR.

# Exercise 4 - Nested TRY...CATCH

## Objective

Transfer an employee to another department using nested exception handling.

## Procedure Name

TransferEmployee

## SQL Concepts Covered

- Nested TRY...CATCH
- RAISERROR
- THROW
- Error Logging

## Verification

Executed the procedure with an invalid department and verified that the error was logged and re-raised.

## Outcome

Successfully implemented nested exception handling with custom validation.

# Exercise 5 - Transactions with Error Logging

## Objective

Insert multiple employee records using transactions while maintaining data integrity.

## Procedure Name

BatchInsertEmployees

## SQL Concepts Covered

- BEGIN TRANSACTION
- COMMIT
- ROLLBACK
- TRY...CATCH

## Verification

Executed the procedure and confirmed that all inserts succeeded or the transaction was rolled back if an error occurred.

## Outcome

Successfully combined transaction management with exception handling.


# Exercise 6 - Dynamic RAISERROR

## Objective

Raise different messages using RAISERROR based on employee salary conditions.

## Procedure Name

AddEmployee

## SQL Concepts Covered

- RAISERROR
- Severity Levels
- Business Rule Validation

## Severity Levels

- Severity 10 → Warning (Salary below 1000)
- Severity 16 → Error (Negative Salary)

## Verification

Executed the procedure with different salary values and verified the corresponding warning and error messages.

## Outcome

Successfully implemented dynamic error handling using RAISERROR with different severity levels.