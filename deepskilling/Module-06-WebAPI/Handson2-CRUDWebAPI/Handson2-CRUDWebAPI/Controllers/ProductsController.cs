using Microsoft.AspNetCore.Mvc;
using Handson2_CRUDWebAPI.Models;

namespace Handson2_CRUDWebAPI.Controllers
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

        // GET: api/Products
        [HttpGet]
        public IActionResult GetAllProducts()
        {
            return Ok(products);
        }

        // GET: api/Products/1
        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            var product = products.FirstOrDefault(p => p.Id == id);

            if (product == null)
                return NotFound("Product not found.");

            return Ok(product);
        }

        // POST: api/Products
        [HttpPost]
        public IActionResult AddProduct(Product product)
        {
            products.Add(product);

            return CreatedAtAction(
                nameof(GetProductById),
                new { id = product.Id },
                product);
        }

        // PUT: api/Products/1
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

        // DELETE: api/Products/2
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