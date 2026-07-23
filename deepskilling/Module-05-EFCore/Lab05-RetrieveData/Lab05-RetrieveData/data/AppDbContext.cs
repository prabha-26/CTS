using Microsoft.EntityFrameworkCore;
using Lab05_RetrieveData.Models;

namespace Lab05_RetrieveData.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<Product> Products { get; set; }
    }
}