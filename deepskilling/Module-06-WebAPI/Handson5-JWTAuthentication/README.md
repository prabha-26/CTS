# Handson 5 - JWT Authentication in ASP.NET Core Web API

## Objective
Implement JWT (JSON Web Token) based authentication in an ASP.NET Core Web API to secure API endpoints.

---

## Technologies Used

- ASP.NET Core Web API (.NET 10)
- C#
- JWT Authentication
- Swagger
- Visual Studio 2022

---

## Project Structure

```
Handson5-JWTAuthentication
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
└── Handson5-JWTAuthentication.http
```

---

## Features

- User Login
- JWT Token Generation
- JWT Authentication
- Protected API using Authorize Attribute
- Employee API accessible only with valid token

---

## API Endpoints

### Login

**POST**

```
/api/Auth/login
```

Request Body

```json
{
  "username": "admin",
  "password": "admin123"
}
```

Response

```json
{
  "token": "<JWT_TOKEN>"
}
```

---

### Get Employees (Protected)

**GET**

```
/api/Employee
```

Header

```
Authorization: Bearer <JWT_TOKEN>
```

Response

```json
[
  {
    "id": 1,
    "name": "Ramesh",
    "department": "IT"
  },
  {
    "id": 2,
    "name": "Suresh",
    "department": "HR"
  }
]
```

---

## Authentication Flow

1. User sends username and password.
2. Server validates credentials.
3. JWT Token is generated.
4. Client stores the token.
5. Token is sent in the Authorization header.
6. Protected API validates the token before returning data.

---

## JWT Configuration

- Authentication Scheme: Bearer
- Algorithm: HS256
- Issuer: mySystem
- Audience: myUsers

---

## How to Run

1. Open the project in Visual Studio 2022.
2. Restore NuGet packages.
3. Build the project.
4. Run the application.
5. Open Swagger.
6. Call the Login API.
7. Copy the generated JWT token.
8. Access the protected Employee API using the token.

---

## Learning Outcomes

- ASP.NET Core Authentication
- JWT Token Generation
- Claims-Based Authentication
- Bearer Token Authentication
- Authorization using `[Authorize]`
- Securing Web APIs

---

## Output

- Successfully generated JWT Token.
- Protected API returned **401 Unauthorized** without a token.
- Protected API returned **200 OK** with a valid JWT token.
- Employee details retrieved successfully.

---
