# Module 06 - ASP.NET Core Web API

Reference materials:

- `ReferenceMaterials/1. WebApi_Handson.docx`
- `ReferenceMaterials/2. WebApi_Handson.docx`
- `ReferenceMaterials/3. WebApi_Handson.docx`
- `ReferenceMaterials/4. WebApi_Handson.docx`
- `ReferenceMaterials/5. WebApi_Handson.docx`
- `ReferenceMaterials/6. WebApi_Handson.docx`

Mandatory checklist from the reference tracker:

- Web API handouts 1-6 are represented in `EmployeeApi` through controllers, CRUD endpoints, Swagger/OpenAPI, filters, CORS, and JWT authorization.

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
