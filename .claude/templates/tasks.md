---
description: Task list template for feature implementation
---

# Tasks: [FEATURE NAME]

**Organization**: Tasks grouped by user story phase → component type (Models, DTOs, Services, Endpoints, Pages, Components, Hooks)

**Tests**: Optional - only include if explicitly requested

**Paths**: Backend `src/api/`, `src/api-logic/` | Frontend `src/client/src/` | Database: EF Core migrations

## Path Conventions

- **Backend (.NET)**: `src/api/`, `src/api-logic/`
- **Frontend (React)**: `src/client/src/`
- **Database**: SQLite (Entity Framework Core migrations)
- Adjust paths based on actual project structure

<!--
  ============================================================================
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.

  You MUST replace these with actual tasks based on:
  - User stories from spec.md (with their priorities P1, P2, P3...)
  - Feature requirements from plan.md
  - Entities from data-model.md
  - Endpoints from contracts/

  Tasks MUST be organized by user story so each story can be:
  - Implemented independently
  - Tested independently
  - Delivered as an MVP increment

  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
!-->

## Phase 1: Setup

- [ ] Create project structure per implementation plan
- [ ] Initialize .NET project with required NuGet packages (if needed)
- [ ] Initialize React dependencies (if needed)
- [ ] Configure ESLint, Prettier, TypeScript

---

## Phase 2: Foundational ⚠️

> No user story work can begin until this phase is complete

- [ ] Create Entity Framework migration for database schema changes
- [ ] Add base models in `src/api-logic/Models/` (shared across stories)
- [ ] Create shared DTOs in `src/api/Dtos/`
- [ ] Update shared TypeScript types in `src/client/src/types/`
- [ ] Configure middleware or shared services (if needed)
- [ ] Setup SignalR hubs (if real-time needed)

---

## Phase 3: [Story Title] (P1) 🎯 MVP

> **Goal**: [What this story delivers]

<!-- DELETE sections below that aren't needed for this story -->

#### Tests (Optional - delete if not needed)

- [ ] Unit test: [Service] in `tests/[Project].Tests/Services/[Service]Tests.cs`
- [ ] Integration test: [endpoint] in `tests/[Project].Tests/Endpoints/[Endpoint]Tests.cs`

#### Models

- [ ] [Entity1]Model in `src/api-logic/Models/[Entity1]Model.cs`
- [ ] [Entity2]Model in `src/api-logic/Models/[Entity2]Model.cs`

#### DTOs

- [ ] [Request]Dto in `src/api/Dtos/[Request]Dto.cs` → props: [prop1], [prop2]
- [ ] [Response]Dto in `src/api/Dtos/[Response]Dto.cs` → props: [prop1], [prop2]
- [ ] TypeScript types in `src/client/src/types/[entities].ts` → add [Type]

#### Interfaces

- [ ] I[Service] in `src/api-logic/Interfaces/I[Service].cs`
  - [Method1]([ParamType] [param]) → Task<[ReturnType]>
  - [Method2]([ParamType] [param]) → Task<[ReturnType]>
- [ ] I[Repository] in `src/api-logic/Interfaces/I[Repository].cs`
  - [Method1]([ParamType] [param]) → Task<[ReturnType]>
  - [Method2]([ParamType] [param]) → Task<[ReturnType]>

#### Services

- [ ] [Service] in `src/api-logic/Services/[Service].cs`
  - [Method1]([ParamType] [param]) → Task<[ReturnType]>
  - [Method2]([ParamType] [param]) → Task<[ReturnType]>
- [ ] [Repository] in `src/api-logic/Repositories/[Repository].cs`
  - [Method1]([ParamType] [param]) → Task<[ReturnType]>
  - [Method2]([ParamType] [param]) → Task<[ReturnType]>

#### Endpoints

- [ ] [Action][Resource]Endpoint in `src/api/Endpoints/[Resource]/[Action][Resource]Endpoint.cs`
  - Request: [RequestDto] ([prop1], [prop2])
  - Response: [ResponseDto] ([prop1], [prop2])

#### Pages (Frontend - delete if not needed)

- [ ] [Page] in `src/client/src/pages/[Section]/[Page].tsx`

#### Components (Frontend - delete if not needed)

- [ ] [Component] in `src/client/src/components/[Component].tsx`

#### Hooks (Frontend - delete if not needed)

- [ ] use[Feature] in `src/client/src/hooks/use[Feature].ts` → returns { [state1], [method1] }

#### Build Verification

- [ ] Backend: `dotnet build`
- [ ] Frontend: `cd src/client && npx tsc --noEmit --skipLibCheck --project tsconfig.app.json && npx eslint .`

---

<!-- Copy phase template above to add more user stories -->

---

## Phase N: Polish

- [ ] Documentation updates in `docs/`
- [ ] Code cleanup and refactoring
- [ ] Performance optimization
- [ ] Additional tests in `tests/[Project].Tests/` (if needed)
- [ ] Security hardening
- [ ] Full backend build: `dotnet build`
- [ ] Full frontend checks: `cd src/client && npx tsc --noEmit --skipLibCheck --project tsconfig.app.json && npx eslint .`
- [ ] Format files: `cd src/client && npx prettier <files> --write`

---

## Execution Order

**Phase dependencies**: Setup → Foundational ⚠️ → User Stories (P1 → P2 → P3) → Polish

**Within each user story**: Tests → Models → DTOs → Interfaces → Services → Endpoints → Pages → Components → Hooks → Build

---

## Notes

- Delete component sections (Models, DTOs, etc.) that aren't needed for a story
- Each task = one file (avoid file conflicts)
- Each user story should be independently testable
- Commit after completing logical groups of tasks
