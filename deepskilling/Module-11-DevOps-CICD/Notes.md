# Module 11 - DevOps CI/CD

Completed artifacts:

- `.github/workflows/dotnet-ci.yml` for GitHub Actions
- `Jenkinsfile` for a basic Jenkins pipeline

## Objective
Understand how continuous integration and delivery pipelines automate build, test, and deployment steps.

## What you practice
- Restoring and building .NET projects automatically
- Running tests in CI pipelines
- Defining jobs and stages for build validation
- Using a simple pipeline to enforce code quality before merge

## Key concepts
- CI vs CD
- Pipeline stages such as restore, build, and test
- GitHub Actions workflow syntax
- Jenkins declarative pipeline structure
- Triggering automated execution on push or pull request

## Hands-on flow
1. Review the GitHub Actions workflow.
2. Review the Jenkins pipeline definition.
3. Update the paths if you place the projects in a different folder structure.
4. Extend the pipeline with test or deployment steps as the project grows.

## Practical use
The sample workflow restores and builds the Web API project and the EF Core sample. The Jenkins file also includes a test stage placeholder for NUnit-based validation.
