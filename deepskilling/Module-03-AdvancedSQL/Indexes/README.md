# Exercise 1 - Creating a Non-Clustered Index

## Objective

Create a non-clustered index on the ProductName column to improve search performance.

## Index Name

IX_Products_ProductName

## Table

Products

## Column

ProductName

## SQL Concepts Covered

- CREATE NONCLUSTERED INDEX
- DROP INDEX IF EXISTS
- Query Optimization
- Indexing

## Verification

Executed the same SELECT query before and after creating the index.

## Outcome

Successfully created a non-clustered index to optimize product searches based on ProductName.

# Exercise 2 - Creating an Index on OrderDate

## Objective

Improve query performance when searching orders by OrderDate.

## Index Name

IX_Orders_OrderDate

## Table

Orders

## Column

OrderDate

## SQL Concepts Covered

- CREATE NONCLUSTERED INDEX
- Query Optimization
- Indexing

## Limitation

SQL Server allows only one clustered index per table. Since the Orders table already has a clustered index created automatically by the PRIMARY KEY (OrderID), a non-clustered index was created on OrderDate instead.

## Verification

Executed the same SELECT query before and after creating the index.

## Outcome

Successfully created an index on the OrderDate column while following SQL Server indexing constraints.  

# Exercise 3 - Creating a Composite Index

## Objective

Create a composite index on the CustomerID and OrderDate columns to improve query performance when filtering using multiple columns.

## Index Name

IX_Orders_CustomerID_OrderDate

## Table

Orders

## Columns

- CustomerID
- OrderDate

## SQL Concepts Covered

- CREATE NONCLUSTERED INDEX
- Composite Index
- Multi-column Indexing
- Query Optimization

## Verification

Executed the same SELECT query before and after creating the composite index.

## Outcome

Successfully created a composite index to optimize queries that filter using both CustomerID and OrderDate.