# Exercise 1 - Create a Cursor

## Objective

Create a cursor to iterate through all employee records and display their details.

## Cursor Name

EmployeeCursor

## SQL Concepts Covered

- DECLARE CURSOR
- OPEN
- FETCH
- WHILE
- PRINT
- CLOSE
- DEALLOCATE

## Verification

Successfully iterated through every employee record and printed the details.

## Outcome

Learned how SQL Server cursors process records one row at a time.

# Exercise 2 - Types of Cursors

## Objective

Understand and compare different cursor types available in SQL Server.

## Cursor Types

- Static Cursor
- Dynamic Cursor
- Forward-Only Cursor
- Keyset Cursor

## SQL Concepts Covered

- STATIC Cursor
- DYNAMIC Cursor
- FORWARD_ONLY Cursor
- KEYSET Cursor

## Comparison

### Static Cursor

Creates a snapshot of the data. Changes made after opening the cursor are not visible.

### Dynamic Cursor

Reflects all INSERT, UPDATE, and DELETE operations while the cursor is open.

### Forward-Only Cursor

Moves only in the forward direction and provides the best performance.

### Keyset Cursor

Allows updates to existing rows but does not display newly inserted rows.

## Outcome

Successfully created and understood the behavior of all four SQL Server cursor types.