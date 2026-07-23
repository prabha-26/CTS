using Microsoft.EntityFrameworkCore;
using Handson3_WebAPI_EFCore.Models;

namespace Handson3_WebAPI_EFCore.Data
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