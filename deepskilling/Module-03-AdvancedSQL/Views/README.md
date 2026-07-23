# Exercise 1 - Create a Simple View

## Objective

Create a SQL Server view to display basic employee details by joining the Employees and Departments tables.

## View Name

vw_EmployeeBasicInfo

## Tables Used

- Employees
- Departments

## SQL Concepts Covered

- CREATE VIEW
- INNER JOIN
- SELECT

## Output

Displays:

- EmployeeID
- FirstName
- LastName
- DepartmentName

## Outcome

Successfully created a reusable SQL view to display employee information along with the corresponding department.

# Exercise 2 - Employee Full Name View

## Objective

Create a SQL Server view that includes a computed **FullName** column by concatenating the employee's first and last names.

## View Name

vw_EmployeeFullName

## Tables Used

- Employees
- Departments

## SQL Concepts Covered

- CREATE VIEW
- Computed Columns
- String Concatenation
- INNER JOIN

## Output

Displays:

- EmployeeID
- FirstName
- LastName
- FullName
- DepartmentName

## Outcome

Successfully created a reusable SQL view with a computed FullName column.

# Exercise 3 - Employee Annual Salary View

## Objective

Create a SQL Server view that calculates the annual salary of each employee.

## View Name

vw_EmployeeAnnualSalary

## Tables Used

- Employees
- Departments

## SQL Concepts Covered

- CREATE VIEW
- Computed Columns
- Arithmetic Expressions
- INNER JOIN

## Output

Displays:

- EmployeeID
- FirstName
- LastName
- DepartmentName
- Salary
- AnnualSalary

## Formula

AnnualSalary = Salary × 12

## Outcome

Successfully created a reusable SQL view that calculates each employee's annual salary.

# Exercise 4 - Employee Report View

## Objective

Create a SQL Server view that combines multiple computed columns into a single employee report.

## View Name

vw_EmployeeReport

## Tables Used

- Employees
- Departments

## SQL Concepts Covered

- CREATE VIEW
- Computed Columns
- String Concatenation
- Arithmetic Expressions
- INNER JOIN

## Output

Displays:

- EmployeeID
- FullName
- DepartmentName
- AnnualSalary
- Bonus

## Formulas

AnnualSalary = Salary × 12

Bonus = AnnualSalary × 10%

## Outcome

Successfully created a comprehensive employee report view containing employee information, annual salary, and bonus calculations.