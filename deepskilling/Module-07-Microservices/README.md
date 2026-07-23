# Question 1 - JWT Authentication

## Objective
Implement JWT (JSON Web Token) based authentication in ASP.NET Core Web API to secure API endpoints.

## Technologies Used
- ASP.NET Core Web API
- C#
- JWT Authentication
- Swagger
- Visual Studio 2022

## Features
- User Login API
- JWT Token Generation
- Secure API using JWT Authentication
- Protected Employee API
- Swagger API Testing

## Project Structure

```
Question1-JWTAuthentication
│
├── Controllers
│   ├── AuthController.cs
│   └── EmployeeController.cs
│
├── Models
│   └── LoginModel.cs
│
├── Program.cs
├── appsettings.json
└── README.md
```

## API Endpoints

### Login

```
POST /api/Auth/login
```

Returns a JWT token for valid credentials.

### Employee

```
GET /api/Employee
```

Protected endpoint that requires a valid JWT token.

## How to Run

1. Open the project in Visual Studio.
2. Restore NuGet packages.
3. Build the project.
4. Run the application.
5. Open Swagger.
6. Test the Login API.
7. Use the generated JWT token to access protected APIs.

## Output

- JWT Token generated successfully.
- Protected Employee API accessed using JWT Authentication.

