using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;

var apiKey = Environment.GetEnvironmentVariable("OPENAI_API_KEY");
if (string.IsNullOrWhiteSpace(apiKey))
{
    Console.WriteLine("Set OPENAI_API_KEY before running this sample.");
    return;
}

Console.Write("Ask a question: ");
var userPrompt = Console.ReadLine();
if (string.IsNullOrWhiteSpace(userPrompt))
{
    Console.WriteLine("Prompt cannot be empty.");
    return;
}

using var client = new HttpClient();
client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);

var payload = new
{
    model = "gpt-4o-mini",
    messages = new[]
    {
        new { role = "system", content = "You are a concise .NET full-stack engineering mentor." },
        new { role = "user", content = userPrompt }
    }
};

var response = await client.PostAsync(
    "https://api.openai.com/v1/chat/completions",
    new StringContent(JsonSerializer.Serialize(payload), Encoding.UTF8, "application/json"));

var json = await response.Content.ReadAsStringAsync();
if (!response.IsSuccessStatusCode)
{
    Console.WriteLine(json);
    return;
}

using var document = JsonDocument.Parse(json);
var answer = document.RootElement
    .GetProperty("choices")[0]
    .GetProperty("message")
    .GetProperty("content")
    .GetString();

Console.WriteLine(answer);
