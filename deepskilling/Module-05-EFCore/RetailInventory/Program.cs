using Microsoft.EntityFrameworkCore;
using RetailInventory.Data;
using RetailInventory.Models;

using var db = new AppDbContext();
await db.Database.EnsureCreatedAsync();

if (!await db.Products.AnyAsync(p => p.Name == "Smart Watch"))
{
    db.Products.Add(new Product
    {
        Name = "Smart Watch",
        Price = 9500,
        Stock = 12,
        CategoryId = 1
    });
    await db.SaveChangesAsync();
}

var products = await db.Products
    .Include(product => product.Category)
    .OrderBy(product => product.Name)
    .ToListAsync();

Console.WriteLine("Retail Inventory");
foreach (var product in products)
{
    Console.WriteLine($"{product.Id}: {product.Name} | {product.Category?.Name} | Rs.{product.Price} | Stock {product.Stock}");
}

var watch = await db.Products.FirstAsync(product => product.Name == "Smart Watch");
watch.Stock += 3;
await db.SaveChangesAsync();

Console.WriteLine($"Updated Smart Watch stock: {watch.Stock}");
