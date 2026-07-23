# Module 07 - Microservices

Coverage checklist:

- Question 1: Implement JWT Authentication in ASP.NET Core Web API - completed in `JwtAuthMicroservice`.

Hands-on implemented in `JwtAuthMicroservice`.

## Objective
Understand the building blocks of a small microservice-style authentication service using ASP.NET Core.

## What you practice
- Building a lightweight service with minimal APIs
- Issuing JWT tokens after successful authentication
- Protecting endpoints with authorization requirements
- Exposing Swagger for easy testing
- Showing how a microservice can validate users and roles independently

## Key concepts
- Authentication vs authorization
- JWT claims and signing keys
- Protected endpoints with `[Authorize]` and `RequireAuthorization()`
- Service-oriented design with a focused responsibility

## Hands-on flow
1. Run the service locally.
2. Call `POST /login` with `admin/password`.
3. Copy the returned token and use it in the `Authorization: Bearer ...` header.
4. Call `GET /orders` to verify the protected endpoint.

## Run
```bash
cd JwtAuthMicroservice
dotnet restore
dotnet run
```

Use Swagger at `/swagger` to try the endpoints interactively.
