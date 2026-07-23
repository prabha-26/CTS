using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Lab03_CodeFirstMigration.Data;

var configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json")
    .Build();

var options = new DbContextOptionsBuilder<AppDbContext>()
    .UseSqlServer(configuration.GetConnectionString("RetailDbConnection"))
    .Options;

using var context = new AppDbContext(options);

Console.WriteLine("Database connection configured successfully.");