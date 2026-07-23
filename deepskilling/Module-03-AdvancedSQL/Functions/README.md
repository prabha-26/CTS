# Exercise 1 - Scalar Function

## Objective

Create a scalar-valued function to calculate the annual salary of an employee.

## Function Name

fn_CalculateAnnualSalary

## Input

Salary (Monthly Salary)

## Output

Annual Salary

## Formula

AnnualSalary = Salary × 12

## SQL Concepts Covered

- CREATE FUNCTION
- Scalar Function
- RETURN
- Parameters

## Outcome

Successfully created and executed a scalar-valued function to calculate annual salary.

# Exercise 2 - Table-Valued Function

## Objective

Create a table-valued function that returns employees belonging to a specified department.

## Function Name

fn_GetEmployeesByDepartment

## Input

DepartmentID

## Output

Returns:

- EmployeeID
- FirstName
- LastName
- DepartmentName
- Salary
- JoinDate

## SQL Concepts Covered

- CREATE FUNCTION
- Table-Valued Function
- RETURNS TABLE
- Parameters
- INNER JOIN

## Outcome

Successfully created a table-valued function to retrieve employee details by department.

# Exercise 3 - User-Defined Function

## Objective

Create a scalar user-defined function to calculate the employee bonus.

## Function Name

fn_CalculateBonus

## Input

Salary

## Output

Bonus

## Formula

Bonus = Salary × 10%

## SQL Concepts Covered

- CREATE FUNCTION
- User-Defined Function (UDF)
- Parameters
- RETURN

## Outcome

Successfully created a reusable user-defined function to calculate employee bonus.

# Exercise 4 - Modify a User-Defined Function

## Objective

Modify the existing user-defined function to calculate a 15% bonus instead of 10%.

## Function Name

fn_CalculateBonus

## Formula

Bonus = Salary × 15%

## SQL Concepts Covered

- ALTER FUNCTION
- User-Defined Functions
- Parameters
- RETURN

## Outcome

Successfully modified the existing function and verified the updated bonus calculation.

# Exercise 5 - Delete a User-Defined Function

## Objective

Delete an existing user-defined function and verify that it has been removed from the database.

## Function Name

fn_CalculateBonus

## SQL Concepts Covered

- DROP FUNCTION
- IF EXISTS
- System Catalog (sys.objects)

## Verification

Query the system catalog to ensure the function no longer exists.

## Outcome

Successfully deleted the user-defined function and verified its removal.

# Exercise 6 - Execute a User-Defined Function

## Objective

Execute the scalar function `fn_CalculateAnnualSalary` to calculate the annual salary of each employee.

## Function Used

fn_CalculateAnnualSalary

## SQL Concepts Covered

- Scalar Functions
- Function Execution
- SELECT Statement

## Verification

Displayed the annual salary for every employee using the user-defined function.

## Outcome

Successfully executed the scalar function and verified the calculated annual salaries.

# Exercise 7 - Return Data from a Scalar Function

## Objective

Execute the scalar function for a specific employee.

## Function

fn_CalculateAnnualSalary

## SQL Concepts Covered

- Scalar Function
- WHERE Clause
- Function Execution

## Outcome

Returned the annual salary for a specific employee.

# Exercise 8 - Return Data from a Table-Valued Function

## Objective

Retrieve employees belonging to a specific department.

## Function

fn_GetEmployeesByDepartment

## SQL Concepts Covered

- Table-Valued Function
- Function Execution

## Outcome

Successfully returned employee details from the specified department.

# Exercise 9 - Nested User-Defined Function

## Objective

Create a nested user-defined function that combines annual salary and bonus.

## Functions Used

- fn_CalculateAnnualSalary
- fn_CalculateBonus
- fn_CalculateTotalCompensation

## SQL Concepts Covered

- Nested Functions
- Function Calls
- Scalar Functions

## Outcome

Successfully calculated total employee compensation.

# Exercise 10 - Modify Nested User-Defined Function

## Objective

Modify the nested user-defined function to calculate total compensation using the updated bonus calculation.

## Function

fn_CalculateTotalCompensation

## SQL Concepts Covered

- ALTER FUNCTION
- Nested Functions
- Scalar Functions

## Outcome

Successfully modified and executed the nested user-defined function.