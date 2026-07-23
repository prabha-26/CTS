    using Microsoft.EntityFrameworkCore;
    using Microsoft.Extensions.Configuration;
    using Lab05_RetrieveData.Data;

    var configuration = new ConfigurationBuilder()
        .SetBasePath(Directory.GetCurrentDirectory())
        .AddJsonFile("appsettings.json")
        .Build();

    var options = new DbContextOptionsBuilder<AppDbContext>()
        .UseSqlServer(configuration.GetConnectionString("RetailDbConnection"))
        .Options;

    using var context = new AppDbContext(options);

    Console.WriteLine("Connected Database: " + context.Database.GetDbConnection().Database);

var productService = new ProductService(context);

    var products = await productService.GetAllProductsAsync();

    Console.WriteLine("===== ALL PRODUCTS =====");

    foreach (var product in products)
    {
        Console.WriteLine($"ID       : {product.ProductId}");
        Console.WriteLine($"Name     : {product.Name}");
        Console.WriteLine($"Price    : {product.Price}");
        Console.WriteLine($"Stock    : {product.Stock}");
        Console.WriteLine($"Category : {product.Category}");
        Console.WriteLine("----------------------------");
    }