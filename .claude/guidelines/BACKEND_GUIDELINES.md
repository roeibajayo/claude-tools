# Backend Guidelines

## Dependency Injection Guidelines

Don't register services directly in `IServiceCollection`. Instead, use the `ITransientService`, `IScopedService`, or `ISingletonService` interfaces to register services with the appropriate lifetimes.

### Example #1

Instead of this:

```csharp
// Don't register services directly like this:
services.AddTransient<IMyService, MyService>();

// Use the marker interface for registration:
public class MyService : ITransientService<IMyService> {}
```

### Example #2

```csharp
// Don't register services directly like this:
services.AddTransient<MyService>();

// Use the marker interface for registration:
public class MyService : ITransientService {}
```

## Core Interfaces & Components

### API Endpoint Interfaces

- **IGetEndpoint**: Marker for GET HTTP endpoints
- **IPostEndpoint**: Marker for POST HTTP endpoints
- **IPutEndpoint**: Marker for PUT HTTP endpoints
- **IDeleteEndpoint**: Marker for DELETE HTTP endpoints

### Logic Components

- **Managements**:
  location: `server/Polygent.Logic/Managements`
  Components responsible for managing business logic and application state, not responsible for data access or presentation.
- **Repositories**:
  location: `server/Polygent.Logic/Repositories`
  Components responsible for data access and persistence, typically interacting with a database or external API.
- **Services**:
  location: `server/Polygent.Logic/Services`
  Components that encapsulate business logic and provide functionality to the application, often coordinating between repositories and other services.

## Common Tasks

### Add New API Endpoint

**Steps**:

1. Create request and response DTOs in `server/Dtos/`.
2. Create class in `server/Endpoints/<Domain>/<Name>Endpoint.cs`.
3. Implement interface: `IGetEndpoint`, `IPostEndpoint`, `IPutEndpoint`, or `IDeleteEndpoint`.
4. Define `Route` (e.g., `/api/bots/{id}/stats`).
5. Implement `Execute` delegate with dependency injection.

**Template**:

```csharp
internal sealed class GetBotStatsEndpoint // NEVER inject required services here but in the Delegate below
 : IGetEndpoint
{
    public string Route => "/api/bots/{id}/stats";
    public Delegate Execute => static async (
        [FromRoute] Guid id,
        IBotsRepository botsRepo,
        CancellationToken ct) =>
    {
        var stats = await botsRepo.GetStats(id, ct);
        return stats is null ? Results.NotFound() : Results.Ok(stats);
    };
}
```

### Add Frontend API Client

In `client/frontend/src/api/<domain>.ts`:

```typescript
export const getBotStats = async (botId: string): Promise<BotStats> => {
  return fetchGet<BotStats>(`/api/bots/${botId}/stats`);
};
```

## Testing

- xUnit with Moq for mocking, Verify for snapshots.

## Development Commands

### Backend (.NET)

- Build the solution:

  ```bash
  cd server/Polygent
  dotnet build Polygent.sln
  ```

- Run all tests

  ```bash
  cd client/backend/tests # or: host/tests
  dotnet test --logger "console;verbosity=detailed"
  ```

- Run specific test

  ```bash
  dotnet test --filter "FullyQualifiedName~<TestClassName>"
  ```

- Create database migration (Client only)

  ```bash
  cd server/Polygent
  dotnet ef migrations add <MigrationName>
  ```
