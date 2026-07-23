using Microsoft.AspNetCore.Mvc;
using Handson4_WebAPI_Repository.Interfaces;
using Handson4_WebAPI_Repository.Models;

namespace Handson4_WebAPI_Repository.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly IProductRepository _repository;

        public ProductsController(IProductRepository repository)
        {
            _repository = repository;
        }

        // GET: api/Products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> GetProducts()
        {
            return Ok(await _repository.GetAllAsync());
        }

        // GET: api/Products/1
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetProduct(int id)
        {
            var product = await _repository.GetByIdAsync(id);

            if (product == null)
                return NotFound();

            return Ok(product);
        }

        // POST: api/Products
        [HttpPost]
        public async Task<ActionResult> AddProduct(Product product)
        {
            await _repository.AddAsync(product);

            return CreatedAtAction(nameof(GetProduct),
                new { id = product.ProductId },
                product);
        }

        // PUT: api/Products/1
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateProduct(int id, Product product)
        {
            if (id != product.ProductId)
                return BadRequest();

            await _repository.UpdateAsync(product);

            return NoContent();
        }

        // DELETE: api/Products/1
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            await _repository.DeleteAsync(id);

            return NoContent();
        }
    }
}