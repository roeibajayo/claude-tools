# IMPORTANT General Guidelines

- NEVER leave comments like "in the meantime, simulate...", "TODO: implement", "For now we'll just ... in a real implementation ..." etc. ALWAYS FULLY implement the user's request, whether the request is small or large, without leaving placeholders. If you need more context or information to complete the request, ask for it explicitly.
- NEVER try to resolve build errors by removing the problematic files or code.
- NEVER execute database queries, and don't apply any migrations or schema changes.
- NEVER drop database databases, tables or collections.
- If the users points to a specific file called `GetFiles.cs` and you didn't such file, but you did find a file named `GetFile.cs` in the repository, use that file, because it is likely a typo. this applies to all files or paths or references or functions or variables, not just the one mentioned.
- Don't modify existing files that ignored by `.gitignore`.
- If the files you edit are changed by the user - you should not change them back, unless the user explicitly asks you to do so.
- Update this `CLAUDE.md` file with any general guidelines or conventions that are not already covered.
- Update `PROJECT.md` with any new modules, pages, shared components, shared hooks, shared utilities or significant changes to existing functionality.
- NEVER log sensitive data (API keys, passwords, tokens).
- NEVER expose internal IDs in error messages.
- NEVER duplicate code or functionality, always search for existing solutions before implementing new ones. if you find duplicate code, refactor it into a shared function or component, if not - create a new one.
- NEVER duplicate implementations, always share code between similar features.
- ALWAYS use int enums with starting values of 1, whether in TypeScript or C#. NEVER use string enums.
- ALWAYS use English for all code, comments, and documentation. No exceptions.
- Correct spelling and grammar in all user-facing text.

# IMPORTANT Task Checklist

EVERY feature, bug or user request should follow these steps:

- [ ] Frontend Design: Ensure support for responsive design.
- [ ] Types: DTOs match between client and server/host.
- [ ] Security: Input validation and authorization checks.
- [ ] Database: Migrations created if entities changed.
- [ ] Server Unit Tests: Create unit tests for logic and make sure they pass.
- [ ] Frontend TypeScript: If any frontend changes are made, run `cd <client> && npx tsc --noEmit --skipLibCheck --project tsconfig.app.json && npx eslint .` and ensure no errors.
      DON'T run build for production to make sure the code is not broken.
- [ ] Frontend Prettier: If any frontend changes are made for `*.{js,ts,jsx,tsx,css,json,scss}` files, run `cd <client> && npx prettier <path/to/file> --write` and ensure no errors.
- [ ] Server Solution Build: If any backend changes are made, run `dotnet build` in the root and ensure no build errors for the entire solution.
- [ ] Guidelines: ENSURE ALL guidelines are followed and updated as necessary, specifically the guidelines in this file.
- [ ] Duplication: Check for and eliminate any code duplication.
- [ ] Docs: Update documentation to reflect changes, all docs files located at `docs/`.

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
- NEVER inject `IHttpClientFactory` or use `HttpClient` for HTTP requests, instead inject the `RoeiBajayo.Infrastructure.Http.IRestClient` interface.
- NEVER register services directly in `IServiceCollection`. Instead, use the `ITransientService`, `IScopedService`, or `ISingletonService` interfaces to register services with the appropriate lifetimes.
- ALWAYS use `ILogger` with Structured logging to log, no string interpolation and no other logging methods.
- ALWAYS use cancellation tokens for asynchronous methods.
- ALWAYS use `IMemoryCore` for time-based in-memory caching, NEVER use `IMemoryCache`.
- ALWAYS use Data Transfer Objects (DTO) for API communication, validated with attributes.
- ALWAYS use `x` as a parameter name in lambdas and anonymous functions.

# IMPORTANT Frontend Guidelines

- NEVER use `useState` or `useEffect` directly in React Components. ALWAYS use custom hook in separated for that (e.g., `useBot`, `useBacktesting`).
- NEVER combine multiple hooks or components in a single file, even if they are small. EVERY hook, component or Modal should have its OWN file, e.g., `useBot.ts`, `BotComponent.tsx`.
- React components should ALWAYS be functions with default export (`export default function ComponentName() {}`), not class-based or arrow functions.
- NEVER use `any` type OR anonymous types in TypeScript, ALWAYS use explicit types, if not existing - create them.
- If there are errors in linting with external libraries, use context7 to fix them.

# IMPORTANT Backend-Frontend Integration

- ALL Request and Response models must be shared between Client and Host. If you create a new model or modify an existing one, ensure it is reflected in both projects.
- The server's json output naming convention is camelCase, and the TypeScript interface should be camelCase.

# IMPORTANT Testing

- Follow Arrange-Act-Assert pattern.
- Mock external dependencies for isolated testing.
