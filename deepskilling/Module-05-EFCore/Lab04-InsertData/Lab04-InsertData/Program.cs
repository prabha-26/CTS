using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Lab04_InsertData.Data;
using Lab04_InsertData.Models;

var configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json")
    .Build();

var options = new DbContextOptionsBuilder<AppDbContext>()
    .UseSqlServer(configuration.GetConnectionString("RetailDbConnection"))
    .Options;

using var context = new AppDbContext(options);

var productService = new ProductService(context);

var product = new Product
{
    Name = "Laptop",
    Price = 65000,
    Stock = 25,
    Category = "Electronics"
};

productService.AddProduct(product);