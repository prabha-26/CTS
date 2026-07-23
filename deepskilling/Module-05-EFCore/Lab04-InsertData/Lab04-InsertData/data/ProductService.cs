using Lab04_InsertData.Models;

namespace Lab04_InsertData.Data
{
    public class ProductService
    {
        private readonly AppDbContext _context;

        public ProductService(AppDbContext context)
        {
            _context = context;
        }

        public void AddProduct(Product product)
        {
            _context.Products.Add(product);
            _context.SaveChanges();

            Console.WriteLine("Product added successfully.");
        }
    }
}