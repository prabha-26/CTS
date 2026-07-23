# CustomerCommLib - Moq Handson 1

## Objective

To learn how to perform unit testing using the Moq framework by mocking external dependencies instead of using their actual implementations.

## Project Description

CustomerCommLib demonstrates how to use Dependency Injection and the Moq framework to test a class that depends on an email sending service.

The `CustomerComm` class sends an email through the `IMailSender` interface. During testing, the actual email service is replaced with a mock object, allowing the business logic to be tested independently.

## Technologies Used

- C#
- .NET 10.0
- NUnit
- Moq
- Visual Studio 2026

## Project Structure

```
CustomerCommLib
│
├── CustomerComm.cs
├── IMailSender.cs
├── MailSender.cs
│
CustomerComm.Tests
│
└── CustomerCommTests.cs
```

## Concepts Covered

- Unit Testing
- NUnit Framework
- Moq Framework
- Mock Objects
- Dependency Injection
- Constructor Injection
- Interfaces
- TestFixture
- OneTimeSetUp
- Assert.That()

## Test Scenario

- Verify that `SendMailToCustomer()` returns **true**.
- Mock the `IMailSender` dependency using Moq.
- Ensure no real email is sent during testing.

## Test Result

```
Passed: 1
Failed: 0
Skipped: 0
```

## Learning Outcome

- Understood the importance of Dependency Injection.
- Learned how to isolate dependencies using Moq.
- Successfully created and executed unit tests with mocked objects.
- Verified application behavior without depending on external services.

