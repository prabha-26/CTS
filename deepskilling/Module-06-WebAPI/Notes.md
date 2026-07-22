# Module 06 - ASP.NET Core Web API

Hands-on implemented in `EmployeeApi`.

## Objective
Build a RESTful API that can create, read, update, and delete employee records using ASP.NET Core.

## What you practice
- Creating controllers with `HttpGet`, `HttpPost`, `HttpPut`, and `HttpDelete`
- Defining request and response models for `Employee`, `Department`, and `Skill`
- Returning typed results using `ActionResult<T>`
- Using Swagger/OpenAPI for API documentation
- Applying custom exception and authorization filters
- Configuring CORS for local client access
- Generating JWT tokens and protecting endpoints with role-based authorization

## Key concepts
- `[ApiController]` and attribute routing
- `[FromBody]` for model binding
- `UseSwagger()` and `UseSwaggerUI()`
- `AddAuthentication()` and `AddAuthorization()`
- JWT bearer validation and claims

## Hands-on flow
1. Restore and run the API project.
2. Open `/swagger` to explore the endpoints.
3. Call `GET /api/Auth/token` to receive a JWT.
4. Use the returned token in the `Authorization` header for protected employee endpoints.

## Run
```bash
cd EmployeeApi
dotnet restore
dotnet run
```

Open `http://localhost:5000/swagger` (or the local URL shown in the console).
