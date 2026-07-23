using Microsoft.EntityFrameworkCore;
using Lab05_RetrieveData.Models;

namespace Lab05_RetrieveData.Data
{
    public class ProductService
    {
        private readonly AppDbContext _context;

        public ProductService(AppDbContext context)
        {
            _context = context;
        }

        public async Task<List<Product>> GetAllProductsAsync()
        {
            return await _context.Products.ToListAsync();
        }

        public async Task<Product?> GetProductByIdAsync(int id)
        {
            return await _context.Products.FindAsync(id);
        }

        public async Task<Product?> GetExpensiveProductAsync(decimal price)
        {
            return await _context.Products
                .FirstOrDefaultAsync(p => p.Price > price);
        }
    }
}