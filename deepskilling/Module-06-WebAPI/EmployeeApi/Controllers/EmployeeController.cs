using EmployeeApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EmployeeApi.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize(Roles = "Admin")]
public class EmployeeController : ControllerBase
{
    private static readonly List<Employee> Employees = GetStandardEmployeeList();

    [HttpGet]
    [ProducesResponseType(typeof(List<Employee>), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status500InternalServerError)]
    public ActionResult<List<Employee>> Get()
    {
        return Ok(Employees);
    }

    [HttpGet("{id:int}")]
    [ProducesResponseType(typeof(Employee), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public ActionResult<Employee> Get(int id)
    {
        var employee = Employees.FirstOrDefault(item => item.Id == id);
        return employee is null ? NotFound() : Ok(employee);
    }

    [HttpPost]
    [ProducesResponseType(typeof(Employee), StatusCodes.Status201Created)]
    public ActionResult<Employee> Post([FromBody] Employee employee)
    {
        employee.Id = Employees.Max(item => item.Id) + 1;
        Employees.Add(employee);
        return CreatedAtAction(nameof(Get), new { id = employee.Id }, employee);
    }

    [HttpPut("{id:int}")]
    [ProducesResponseType(typeof(Employee), StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status400BadRequest)]
    public ActionResult<Employee> Put(int id, [FromBody] Employee employee)
    {
        if (id <= 0)
        {
            return BadRequest("Invalid employee id");
        }

        var existing = Employees.FirstOrDefault(item => item.Id == id);
        if (existing is null)
        {
            return BadRequest("Invalid employee id");
        }

        existing.Name = employee.Name;
        existing.Salary = employee.Salary;
        existing.Permanent = employee.Permanent;
        existing.Department = employee.Department;
        existing.Skills = employee.Skills;
        existing.DateOfBirth = employee.DateOfBirth;
        return Ok(existing);
    }

    [HttpDelete("{id:int}")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status404NotFound)]
    public IActionResult Delete(int id)
    {
        var employee = Employees.FirstOrDefault(item => item.Id == id);
        if (employee is null)
        {
            return NotFound();
        }

        Employees.Remove(employee);
        return NoContent();
    }

    private static List<Employee> GetStandardEmployeeList()
    {
        return
        [
            new Employee
            {
                Id = 1,
                Name = "John",
                Salary = 50000,
                Permanent = true,
                Department = new Department { Id = 1, Name = "Technology" },
                Skills = [new Skill { Id = 1, Name = "C#" }, new Skill { Id = 2, Name = "SQL" }],
                DateOfBirth = new DateTime(1992, 4, 21)
            },
            new Employee
            {
                Id = 2,
                Name = "Priya",
                Salary = 65000,
                Permanent = false,
                Department = new Department { Id = 2, Name = "QA" },
                Skills = [new Skill { Id = 3, Name = "Selenium" }, new Skill { Id = 4, Name = "Postman" }],
                DateOfBirth = new DateTime(1995, 11, 8)
            }
        ];
    }
}
