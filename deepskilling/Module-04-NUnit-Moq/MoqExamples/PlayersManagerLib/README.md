# PlayersManagerLib - Moq Handson 3

## Objective

To learn how to perform unit testing using the Moq framework by mocking database access through interfaces.

## Project Description

PlayersManagerLib demonstrates how to unit test business logic by mocking the data access layer using Moq.

The application retrieves player information through the `IPlayerMapper` interface. During unit testing, the actual database access is replaced with a mock object, ensuring isolated and reliable tests.

## Technologies Used

- C#
- .NET 10.0
- NUnit
- Moq
- Visual Studio 2026

## Project Structure

```
PlayersManagerLib
│
├── Player.cs
├── IPlayerMapper.cs
├── PlayersManager.cs
│
PlayerManager.Tests
│
└── PlayerManagerTests.cs
```

## Concepts Covered

- Unit Testing
- NUnit Framework
- Moq Framework
- Dependency Injection
- Mock Objects
- Interface Mocking
- Constructor Injection
- TestFixture
- OneTimeSetUp
- Assert.That()

## Test Scenario

- Mock the `IPlayerMapper` interface.
- Return a sample Player object.
- Verify that the correct player details are returned.
- Ensure no actual database interaction occurs.

## Test Result

```
Passed: 1
Failed: 0
Skipped: 0
```

## Learning Outcome

- Learned to mock database dependencies using Moq.
- Understood dependency injection for testability.
- Practiced isolated unit testing without external resources.
- Successfully verified business logic independently.

