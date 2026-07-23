# Exercise 1 - Create Stored Procedures

## Objective

Create stored procedures to retrieve employees by department and insert a new employee.

## Procedures

- sp_GetEmployeesByDepartment
- sp_InsertEmployee

## SQL Concepts Covered

- CREATE PROCEDURE
- Parameters
- EXEC
- INSERT
- SELECT
- INNER JOIN

## Outcome

Successfully created stored procedures to retrieve employee details by department and insert new employee records.

# Exercise 2 - Modify a Stored Procedure

## Objective

Modify the existing stored procedure to return additional employee details.

## Procedure Name

sp_GetEmployeesByDepartment

## SQL Concepts Covered

- ALTER PROCEDURE
- Parameters
- SELECT
- INNER JOIN

## Output

Displays:

- EmployeeID
- FirstName
- LastName
- DepartmentName
- Salary
- JoinDate

## Outcome

Successfully modified the stored procedure and verified the updated output.
# Exercise 3 - Delete a Stored Procedure

## Objective

Delete an existing stored procedure and verify that it has been removed.

## Procedure Name

sp_InsertEmployee

## SQL Concepts Covered

- DROP PROCEDURE
- IF EXISTS
- System Catalog (sys.procedures)

## Verification

Queried the system catalog to confirm that the procedure no longer exists.

## Outcome

Successfully deleted the stored procedure and verified its removal.

# Exercise 4 - Execute a Stored Procedure

## Objective

Execute the stored procedure to retrieve employee details for a specific department.

## Procedure Name

sp_GetEmployeesByDepartment

## SQL Concepts Covered

- EXEC
- Parameters
- Stored Procedure Execution

## Verification

Successfully executed the stored procedure and displayed employees belonging to the specified department.

## Outcome

Verified the correct execution of the stored procedure.

# Exercise 5 - Return Data from a Stored Procedure

## Objective

Create a stored procedure that returns the total number of employees in a specified department.

## Procedure Name

sp_GetEmployeeCountByDepartment

## Input

DepartmentID

## Output

TotalEmployees

## SQL Concepts Covered

- CREATE PROCEDURE
- Parameters
- Aggregate Functions
- COUNT()
- SELECT

## Verification

Executed the stored procedure with a DepartmentID parameter and verified the total employee count.

## Outcome

Successfully created and executed a stored procedure to return the total number of employees in a department.

# Exercise 6 - Output Parameters

## Objective

Create a stored procedure that calculates the total salary of employees in a department using an OUTPUT parameter.

## Procedure Name

sp_GetTotalSalaryByDepartment

## Input

DepartmentID

## Output

TotalSalary (OUTPUT Parameter)

## SQL Concepts Covered

- CREATE PROCEDURE
- OUTPUT Parameters
- SUM()
- Parameters
- SELECT

## Verification

Executed the stored procedure and retrieved the department's total salary using an OUTPUT parameter.

## Outcome

Successfully implemented a stored procedure that returns values through an OUTPUT parameter.
# Exercise 7 - Update Employee Salary

## Objective

Create a stored procedure that updates an employee's salary using multiple input parameters.

## Procedure Name

sp_UpdateEmployeeSalary

## Input

- EmployeeID
- Salary

## SQL Concepts Covered

- CREATE PROCEDURE
- UPDATE
- Parameters
- WHERE Clause

## Verification

Executed the stored procedure and confirmed that the employee's salary was updated successfully.

## Outcome

Successfully created a stored procedure to update employee salary using multiple parameters.

# Exercise 8 - Give Bonus

## Objective

Create a stored procedure to provide a bonus to employees belonging to a specified department.

## Procedure Name

sp_GiveBonus

## Input

- DepartmentID
- Bonus Amount

## SQL Concepts Covered

- CREATE PROCEDURE
- UPDATE
- Parameters
- Conditional Data Processing

## Verification

Executed the stored procedure and verified that the salaries of employees in the specified department increased by the bonus amount.

## Outcome

Successfully implemented a stored procedure to distribute department-wise bonuses.

# Exercise 9 - Transactions in a Stored Procedure

## Objective

Create a stored procedure that updates employee salary using transactions to ensure data integrity.

## Procedure Name

sp_UpdateSalaryTransaction

## Input

- EmployeeID
- Salary

## SQL Concepts Covered

- CREATE PROCEDURE
- BEGIN TRANSACTION
- COMMIT
- ROLLBACK
- TRY...CATCH

## Verification

Executed the stored procedure and confirmed that salary updates were committed successfully or rolled back if an error occurred.

## Outcome

Successfully implemented transaction management within a stored procedure.

# Exercise 10 - Dynamic SQL

## Objective

Create a stored procedure that retrieves employee details dynamically based on a column name and value.

## Procedure Name

sp_GetEmployeesDynamic

## Input

- ColumnName
- Value

## SQL Concepts Covered

- CREATE PROCEDURE
- Dynamic SQL
- sp_executesql
- Parameters

## Verification

Executed the stored procedure using different column names and values and verified that the correct employee records were returned.

## Outcome

Successfully implemented dynamic SQL to retrieve employee information based on flexible search criteria.

# Exercise 11 - Error Handling in a Stored Procedure

## Objective

Create a stored procedure that safely updates employee salary while handling runtime errors using TRY...CATCH.

## Procedure Name

sp_UpdateEmployeeSalarySafe

## Input

- EmployeeID
- Salary

## SQL Concepts Covered

- CREATE PROCEDURE
- TRY...CATCH
- ERROR_MESSAGE()
- UPDATE
- Exception Handling

## Verification

Executed the stored procedure and verified that successful updates displayed a confirmation message, while errors were handled gracefully with a custom error message.

## Outcome

Successfully implemented robust error handling within a stored procedure using TRY...CATCH.