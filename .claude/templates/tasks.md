---
description: Task list template for feature implementation.
---

# Tasks: [FEATURE NAME]

<!--
  ============================================================================
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.

  - You MUST replace these with actual tasks
  - Delete component sections (Models, DTOs, etc.) that aren't needed for a project

  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
!-->

## Feature Overview

<!-- Short description of the feature to be implemented, max 2 lines -->

## Phase 1: [Project Title] (P1)

<!-- DELETE sections below that aren't needed for this project -->

### [Service] / [Repository] / [Manager]

- [ ] [Service] in `src/api-logic/Services/[Service].cs` [New/Update]
  - Implement [Interface] <!-- if applicable -->
    - [ReturnType] [Method]([ParamType] [param]) <!-- repeat as needed, only if interface is new -->
  - [ReturnType] [Method]([ParamType] [param]) <!-- repeat as needed -->
    - Calls [Service].[Method]([param]) <!-- if applicable, repeat as needed -->

### Endpoints

- [ ] [Endpoint] in `src/api/Endpoints/[Endpoint]Endpoint.cs` [New/Update]
  - Route: [HTTPMethod] `[resource-path]`
  - Request: [RequestDto] <!-- if no DTO - replace RequestDto with request properties -->
  - Response: [ResponseDto] <!-- if no DTO - replace ResponseDto with response properties -->
  - Calls [Service].[Method]([param]) <!-- if applicable, repeat as needed -->
  - Used by page/component: `[Page/Component]` <!-- if applicable, repeat as needed -->

### Models / DTOs / Entities

- [ ] [Model] in `src/api-logic/Models/[Model].cs` [New/Update]
  - props: [prop1], [prop2] <!-- repeat as needed -->

### [Page] (Frontend)

- [ ] [Page] in `src/client/src/pages/[Section]/[Page].tsx` [New/Update]
  - Route: `/[route-path]`
  - Hook: use[Page] in `src/client/src/hooks/use[Page].ts`
    - Calls Services: [Service1], [Service2] <!-- if applicable, repeat as needed -->
  - New Components: [Header], [Content], [Footer] <!-- if applicable, repeat as needed -->
  - Reuses Components: [Sidebar] <!-- if applicable, repeat as needed -->
  - New Shared Components: [Button] in `src/client/src/components/[Component].tsx` <!-- if applicable, repeat as needed -->

### Shared Components

- [ ] [Component] in `src/client/src/components/[Component].tsx` [New/Update]
  - Props: [prop1], [prop2] <!-- repeat as needed -->

### Shared Hooks

- [ ] use[Feature] in `src/client/src/hooks/use[Feature].ts` [New/Update]
  - Returns { [state1], [method1] }

### Tests

- [ ] Unit test: [Service] in `tests/[Project].Tests/Services/[Service]Tests.cs` [New/Update]
  - [TestMethod]: short description <!-- repeat as needed -->

---

<!-- Copy phase template above to add more user stories -->

---

## Phase N: Polish

- [ ] Refactor React Components using `react-page-refactor` Skill
- [ ] Refactor .NET Services and Managers using `dotnet-refactor` Skill
- [ ] Full backend build: `dotnet build` (for example)
- [ ] Full frontend checks: `cd src/client && npx tsc --noEmit --skipLibCheck --project tsconfig.app.json && npx eslint .` (for example)
- [ ] Validate all tests pass
- [ ] Format files: `cd src/client && npx prettier <files> --write` (for example)
- [ ] Create feature documentation in `docs/features/[feature-name].md` with architecture overview and usage instructions
- [ ] Optimize created feature documentation using the `doc-optimizer` Skill
