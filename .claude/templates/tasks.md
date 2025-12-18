---
description: Task list template for feature implementation.
---

<!--
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.

  - You MUST replace these with actual tasks
  - Delete component sections (Models, DTOs, etc.) that aren't needed for this phase
  - Each phase file contains tasks for ONE project only (except Phase 1 and Last Phase)

  DO NOT keep these sample tasks in the generated task file.

  PHASE TYPES:
  - Init Phase (Shared Models): Use "Shared Models Template" section below → `tasks-init.md`
  - Middle Phases (Parallel): Use "Parallel Phase Template" section below → `tasks-1.md`, `tasks-2.md`, etc.
  - Polish Phase: Use "Polish Phase Template" section below → `tasks-polish.md`
!-->

---

# Shared Models Template (Init Phase)

# Tasks: [FEATURE NAME] - Init (Shared Models)

## Phase Overview

<!-- Shared DTOs/models between server and client for endpoint communication -->

## Tasks

Load skills using Skill tool: <!-- DELETE this line if not applicable -->

- `[Skill]` <!-- repeat as needed -->

Load guidelines: <!-- DELETE this line if not applicable -->

- `path/to/guideline.md` <!-- repeat as needed -->

### Request/Response DTOs (Server)

- [ ] `[Dto]` in `path/to/[Dto].cs` [New/Update]
  - [prop1]: [prop-type] <!-- repeat as needed -->

### TypeScript Types (Client)

- [ ] `[TypeName]` in `path/to/types.ts` [New/Update]
  - [prop1]: [prop-type] <!-- repeat as needed -->

---

# Parallel Phase Template (Middle Phases)

# Tasks: [FEATURE NAME] - Phase [N] ([Project Name])

## Phase Overview

<!-- Short description of the tasks to be implemented, max 2 lines -->

### [Flow]

<!--
  OPTIONAL: If applicable, describe user/logic flows involved in the feature.
  Repeat as needed for multiple flows.
  Delete this section if not needed.

  Example:
  ### User Registration Flow
  1. User navigates to `Registration` page
  2. User fills out registration form
  3. User submits form
  4. System validates input and creates user account
  5. Call `SendWelcomeEmail` endpoint to send welcome email
-->

## Tasks

Load skills using Skill tool: <!-- DELETE this line if not applicable -->

- `[Skill]` <!-- repeat as needed -->

Load guidelines: <!-- DELETE this line if not applicable -->

- `path/to/guideline.md` <!-- repeat as needed -->

<!-- DELETE sections below that aren't needed for this project -->

### [Service] / [Repository] / [Manager]

- [ ] `[Service]` in `path/to/[Service].cs` [New/Update]
  - Implement [Interface] <!-- if applicable -->
    - [ReturnType] [Method]([ParamType] [param]) <!-- repeat as needed, only if interface is new -->
  - [ReturnType] [Method]([ParamType] [param]) <!-- repeat as needed -->
    - Calls [Service].[Method]([param]) <!-- if applicable, repeat as needed -->

### Endpoints

- [ ] `[Endpoint]` in `path/to/[Endpoint].cs` [New/Update]
  - Route: [HTTPMethod] `[resource-path]`
  - Request: [RequestDto] <!-- reference DTO from Init Phase -->
  - Response: [ResponseDto] <!-- reference DTO from Init Phase -->
  - Calls [Service].[Method]([param]) <!-- if applicable, repeat as needed -->
  - Used by: `[Page/Component]` <!-- if applicable, repeat as needed -->

### Database Entities

- [ ] `[Entity]` in `path/to/[Entity].cs` [New/Update]
  - Properties: [prop1], [prop2] <!-- repeat as needed -->

### [Page] (Frontend)

- [ ] `[Page]` in `path/to/[Page]/index.tsx` [New/Update]
  - Route: `/[route-path]`
  - Hook: `use[Page]` in `path/to/[Page]/use[Page].ts`
    - Methods: [method1], [method2] <!-- repeat as needed -->
    - Calls Endpoints: [Service1], [Service2] <!-- if applicable, repeat as needed -->
  - New Components: [Header], [Content], [Footer] <!-- if applicable, repeat as needed -->
  - Reuses Components: [Sidebar] <!-- if applicable, repeat as needed -->
  - New Shared Components: [Button] in `path/to/[Component].tsx` <!-- if applicable, repeat as needed -->

### Shared React Components

- [ ] `[Component]` in `path/to/[Component].tsx` [New/Update]
  - Props: [prop1], [prop2] <!-- repeat as needed -->

### Shared React Hooks

- [ ] `use[Hook]` in `path/to/[Hook].ts` [New/Update]
  - Returns { [state1], [method1] }

### Unit Tests

- [ ] `[Service]` in `path/to/[Service].cs` [New/Update]
  - [TestMethod] <!-- only unit test name, no additional context or info. repeat as needed -->

### Other Tasks <!-- project file, docs, scripts, configurations etc.. -->

- [ ] `[Entity]` in `path/to/[Entity].cs` [New/Update] <!-- repeat as needed -->

---

# Polish Phase Template

# Tasks: [FEATURE NAME] - Polish & Migrations

## Phase Overview

Final phase: database migrations, build validation, and code quality checks.

## Tasks

### Database Migration

- [ ] `[Table]` in `path/to/[Table].cs` [New/Update/Remove]
  - Columns: [Column1], [Column2] <!-- repeat as needed -->
- [ ] Create database migration using `dotnet ef migrations add [MigrationName]`

### Build Validation

- [ ] Full backend build: `dotnet build`
- [ ] Full frontend checks: `cd src/client && npx tsc --noEmit --skipLibCheck --project tsconfig.app.json && npx eslint .`

### Tests Validation

- [ ] Validate all unit tests pass

### Code Formatting

- [ ] Format files: `cd src/client && npx prettier <files> --write`
