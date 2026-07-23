using Microsoft.EntityFrameworkCore;
using Lab03_CodeFirstMigration.Models;

namespace Lab03_CodeFirstMigration.Data
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