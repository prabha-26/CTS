# Module 12 - Docker

Completed artifacts:

- `Dockerfile.employee-api` builds and publishes the ASP.NET Core Employee API
- `docker-compose.yml` runs the API on port `8080`

## Objective
Learn how to containerize an application so it can be built, shipped, and run consistently across environments.

## What you practice
- Writing a Dockerfile for a .NET app
- Building a container image and publishing the app inside it
- Using Docker Compose to define and run multi-container services
- Exposing application ports and configuring environment variables

## Key concepts
- Images and containers
- Dockerfile instructions such as `FROM`, `COPY`, `RUN`, and `ENTRYPOINT`
- Container port mapping
- Compose services and environment configuration

## Hands-on flow
1. Build the image.
2. Start the service with Docker Compose.
3. Open the Swagger UI in a browser.
4. Stop and remove the containers when the session is over.

## Run
From the `Module-12-Docker` folder:

```bash
docker compose up --build
```

Then open `http://localhost:8080/swagger`.
