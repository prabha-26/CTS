using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace EmployeeApi.Filters;

public class CustomExceptionFilter : IExceptionFilter
{
    public void OnException(ExceptionContext context)
    {
        var logLine = $"{DateTime.UtcNow:o} {context.Exception}\n";
        File.AppendAllText("api-errors.log", logLine);
        context.Result = new ObjectResult("An internal server error occurred.")
        {
            StatusCode = StatusCodes.Status500InternalServerError
        };
        context.ExceptionHandled = true;
    }
}
