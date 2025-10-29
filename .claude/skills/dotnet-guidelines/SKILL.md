---
name: dotnet-guidelines
description:
  dotnet coding guidelines and best practices. MUST follow these rules.
  Use when reviewing or writing .NET code.
---

# IMPORTANT Server Guidelines

- ALWAYS Use Primary Constructors for classes.
- ALWAYS Prefer `record` types for immutable data structures.
- NEVER mix multiple classes or DTOs in a single file, even if they are small. Filename ALWAYS matches the class or DTO name, for example `UserDto.cs` for a `UserDto` class.
- Private fields should NOT be prefixed with `_` (e.g., `repository` not `_repository`).
- Add (.) to the end of all server-side log messages.
- Use `string?` over `string` for nullable strings.
- Use `var` for local variables when type is obvious.
- Don't use Regions in code files.
- Use Collection initializers for collections: instead of `new List<string>()`, use `new() { "item1", "item2" }`, and instead of `list.ToArray()` use `[.. list]`.
- Use Anonymous function static: instead of `list.Select(x => new Dto(x.SameProperty))`, use `list.Select(static x => new Dto(x.SameProperty))`.
- ALWAYS use `sealed` accessor for classes or records if not intended for inheritance.
- ALWAYS use `internal` accessor for internal classes or records.
- NEVER inject or create `HttpClient` and `IHttpClientFactory`, instead use the `IRestClient` interface.
- NEVER register services directly in `IServiceCollection`. Instead, use the `ITransientService`, `IScopedService`, or `ISingletonService` interfaces to register services with the appropriate lifetimes.
- ALWAYS use `ILogger` with Structured logging to log, no string interpolation and no other logging methods.
- ALWAYS use cancellation tokens for asynchronous methods.
- ALWAYS use `IMemoryCore` for time-based in-memory caching, NEVER use `IMemoryCache`.
- ALWAYS use Data Transfer Objects (DTO) for API communication, validated with attributes.
- ALWAYS use `x` as a parameter name in lambdas and anonymous functions.
- If any backend changes are made, run `dotnet build` in the root and ensure no build errors for the entire solution.
