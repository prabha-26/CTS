using Microsoft.AspNetCore.Mvc;
using Handson1_WebAPI.Models;

namespace Handson1_WebAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : ControllerBase
    {
        private static List<Product> products = new()
        {
            new Product { Id = 1, Name = "Laptop", Price = 65000 },
            new Product { Id = 2, Name = "Mobile", Price = 30000 }
        };

        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(products);
        }
        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            var product = products.FirstOrDefault(p => p.Id == id);

            if (product == null)
                return NotFound("Product not found.");

            return Ok(product);
        }
        [HttpPost]
        public IActionResult AddProduct(Product product)
        {
            products.Add(product);

            return CreatedAtAction(
                nameof(GetProductById),
                new { id = product.Id },
                product);
        }
        [HttpPut("{id}")]
        public IActionResult UpdateProduct(int id, Product updatedProduct)
        {
            var product = products.FirstOrDefault(p => p.Id == id);

            if (product == null)
                return NotFound("Product not found.");

            product.Name = updatedProduct.Name;
            product.Price = updatedProduct.Price;

            return Ok(product);
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteProduct(int id)
        {
            var product = products.FirstOrDefault(p => p.Id == id);

            if (product == null)
                return NotFound("Product not found.");

            products.Remove(product);

            return Ok("Product deleted successfully.");
        }
    }
}