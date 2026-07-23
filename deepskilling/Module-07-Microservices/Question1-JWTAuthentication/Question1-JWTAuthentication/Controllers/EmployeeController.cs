using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Question1_JWTAuthentication.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize]
    public class EmployeeController : ControllerBase
    {
        [HttpGet]
        public IActionResult GetEmployees()
        {
            return Ok(new[]
            {
                new
                {
                    Id = 1,
                    Name = "Ramesh",
                    Department = "IT"
                },
                new
                {
                    Id = 2,
                    Name = "Suresh",
                    Department = "HR"
                }
            });
        }
    }
}