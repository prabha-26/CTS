# Module 05 - Entity Framework Core

Reference material:

- `ReferenceMaterials/EF Core 8.0 HOL.pdf`

Hands-on implemented in `RetailInventory`.

- Lab 1: Models `Category` and `Product` represent a retail inventory domain.
- Lab 2: `AppDbContext` configures EF Core with SQLite and relationships.
- Lab 3: Run migrations with `dotnet ef migrations add InitialCreate` and `dotnet ef database update`.
- Lab 4: Seed data is configured in `OnModelCreating`.
- Lab 5: `Program.cs` retrieves products with `Include`.
- Lab 6: `Program.cs` updates stock and saves changes.
- Lab 7: LINQ queries sort and filter inventory records.

Run:

```bash
cd RetailInventory
dotnet restore
dotnet run
```
