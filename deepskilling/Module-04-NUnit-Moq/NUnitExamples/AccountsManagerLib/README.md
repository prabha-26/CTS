# NUnit Handson 4 - AccountsManagerLib

## Objective

To test the user authentication functionality using NUnit.

## Project

AccountsManagerLib

## Features Tested

- Valid user authentication
- Invalid user authentication
- Exception handling for empty or null inputs

## NUnit Concepts Covered

- TestFixture
- SetUp
- TestCase
- ClassicAssert.AreEqual
- Assert.Throws

## Test Scenarios

### Valid Credentials

- user_11 / secret@user11
- user_22 / secret@user22

Expected Result:
Displays a welcome message.

### Invalid Credentials

Returns:

Invalid user id/password

### Exception Handling

Throws FormatException when the username or password is null or empty.

## Verification

Executed all test cases successfully.

## Outcome

Successfully tested the AccountsManager library using NUnit parameterized tests and exception handling.