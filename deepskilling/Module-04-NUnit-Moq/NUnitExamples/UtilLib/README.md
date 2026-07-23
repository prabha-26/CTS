# NUnit Handson 3 - URL Host Name Parser

## Objective

Learn to write NUnit test cases for string parsing methods and validate exception handling.

## Project

UtilLib

## Features Tested

- Host name extraction from HTTP URLs
- Host name extraction from HTTPS URLs
- Invalid URL protocol handling
- Exception testing

## NUnit Concepts Used

- TestFixture
- SetUp
- Test
- TestCase
- Assert.That
- Assert.Throws

## Verification

Executed multiple test cases to verify correct host name extraction and validated that invalid protocols throw a `FormatException`.

## Outcome

Successfully implemented NUnit test cases for the `ParseHostName()` method and verified both valid and invalid input scenarios.