using Microsoft.EntityFrameworkCore;
using Handson4_WebAPI_Repository.Models;

namespace Handson4_WebAPI_Repository.Data
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