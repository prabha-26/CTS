# Handson 4 - ASP.NET Core Web API using Repository Pattern

## Objective

Develop a RESTful Web API using the Repository Pattern with Entity Framework Core and SQL Server to perform CRUD operations.

---

## Technologies Used

- ASP.NET Core Web API
- C#
- .NET 10
- Entity Framework Core
- SQL Server
- Swagger (OpenAPI)

---

## NuGet Packages

- Microsoft.EntityFrameworkCore.SqlServer
- Microsoft.EntityFrameworkCore.Design
- Microsoft.EntityFrameworkCore.Tools
- Swashbuckle.AspNetCore

---

## Project Structure

```
Handson4-WebAPI-Repository
│
├── Controllers
│   └── ProductsController.cs
│
├── Data
│   ├── AppDbContext.cs
│   └── AppDbContextFactory.cs
│
├── Interfaces
│   └── IProductRepository.cs
│
├── Repositories
│   └── ProductRepository.cs
│
├── Models
│   └── Product.cs
│
├── Migrations
│
├── Program.cs
├── appsettings.json
└── README.md
```

---

## Features

- SQL Server Database Integration
- Entity Framework Core
- Repository Pattern
- Dependency Injection
- Code First Migrations
- CRUD Operations
- Swagger Testing

---

## Repository Methods

- GetAllAsync()
- GetByIdAsync()
- AddAsync()
- UpdateAsync()
- DeleteAsync()

---

## API Endpoints

### GET

```
GET /api/Products
```

Returns all products.

---

### GET By ID

```
GET /api/Products/{id}
```

Returns a single product.

---

### POST

```
POST /api/Products
```

Creates a new product.

Example:

```json
{
  "name": "Laptop",
  "price": 65000,
  "stock": 25,
  "category": "Electronics"
}
```

---

### PUT

```
PUT /api/Products/{id}
```

Updates an existing product.

---

### DELETE

```
DELETE /api/Products/{id}
```

Deletes a product.

---

## Database

Database Name

```
Handson4WebAPIDB
```

Table

```
Products
```

---

## Learning Outcomes

- Understood the Repository Pattern.
- Implemented Dependency Injection.
- Connected ASP.NET Core Web API with SQL Server.
- Used Entity Framework Core for database operations.
- Built a maintainable CRUD Web API.
- Tested APIs using Swagger.

---

## Result

Successfully implemented a RESTful Web API using the Repository Pattern with Entity Framework Core and SQL Server.

---
