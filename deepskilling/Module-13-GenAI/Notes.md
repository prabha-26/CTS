# Module 13 - Generative AI

Completed artifacts:

- `GenAiConsole` demonstrates calling a chat completion API from C#
- `Prompts.md` contains practical prompts for code explanation, testing, SQL optimization, and debugging

## Objective
Explore how generative AI can be integrated into a .NET application to assist with coding, debugging, and problem solving.

## What you practice
- Calling a chat completion API from a C# console app
- Sending prompts and reading model responses
- Using environment variables for API keys
- Building prompt templates for coding and debugging tasks

## Key concepts
- Large language models and chat completion APIs
- Prompt engineering basics
- HTTP client usage in C#
- Handling API responses and parsing JSON
- Securely keeping secrets outside source code

## Hands-on flow
1. Set your OpenAI API key as an environment variable.
2. Run the console app.
3. Enter a coding or debugging question.
4. Review the response and use it as a starting point for your own solution.

## Run
```bash
cd GenAiConsole
export OPENAI_API_KEY="your-key"
dotnet run
```
