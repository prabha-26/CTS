# Module 09 - Debugging

Hands-on implemented in `DebuggingDemo`.

## Objective
Learn how to diagnose issues in a .NET console app using Visual Studio Code or Visual Studio debugging tools.

## What you practice
- Setting breakpoints in code
- Stepping through loops and method calls
- Inspecting variables in the Locals and Watch windows
- Creating conditional breakpoints for specific business rules
- Tracing exceptions and understanding the call stack

## Key concepts
- Breakpoints and tracepoints
- Step Into, Step Over, and Step Out
- Conditional breakpoints
- Exception handling during debugging
- Inspecting runtime state and expression values

## Hands-on flow
1. Open the demo app in the debugger.
2. Set a breakpoint on the loop in `Program.cs`.
3. Inspect `Quantity`, `UnitPrice`, and `Total` for each item.
4. Add a conditional breakpoint for `order.Total > 10000`.
5. Change one quantity to `-1` to observe how an exception is handled.

## Run
```bash
cd DebuggingDemo
dotnet run
```
