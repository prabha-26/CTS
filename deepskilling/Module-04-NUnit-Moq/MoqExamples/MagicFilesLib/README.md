# MagicFilesLib - Moq Handson 2

## Objective

To learn how to use the Moq framework for mocking file system dependencies while writing unit tests using NUnit.

## Project Description

MagicFilesLib demonstrates unit testing by mocking a directory explorer instead of accessing the actual file system.

The application uses Dependency Injection to inject an implementation of `IDirectoryExplorer` into the `MagicFileExplorer` class. During testing, the directory explorer is replaced with a mock object using Moq.

## Technologies Used

- C#
- .NET 10.0
- NUnit
- Moq
- Visual Studio 2026

## Project Structure

```
MagicFilesLib
│
├── IDirectoryExplorer.cs
├── DirectoryExplorer.cs
├── MagicFileExplorer.cs
│
DirectoryExplorer.Tests
│
└── DirectoryExplorerTests.cs
```

## Concepts Covered

- NUnit Framework
- Moq Framework
- Dependency Injection
- Interface Mocking
- Constructor Injection
- TestFixture
- OneTimeSetUp
- Assert.That()

## Test Scenario

- Mock the directory explorer.
- Return a predefined list of files.
- Verify that the file count is returned correctly.

## Test Result

```
Passed: 1
Failed: 0
Skipped: 0
```

## Learning Outcome

- Learned to mock file system operations.
- Understood Dependency Injection using interfaces.
- Practiced isolated unit testing with Moq.
- Successfully verified business logic without depending on the file system.

