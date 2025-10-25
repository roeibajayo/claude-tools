---
description: Task list template for feature implementation.
---

# Tasks: [FEATURE NAME]

<!--
  ============================================================================
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.

  You MUST replace these with actual tasks based on:
  - User stories from spec.md (with their priorities P1, P2, P3...)
  - Delete component sections (Models, DTOs, etc.) that aren't needed for a story

  Tasks MUST be organized by user story so each story can be:
  - Implemented independently
  - Tested independently

  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
!-->

## Phase 1: [Story Title] (P1)

<!-- DELETE sections below that aren't needed for this story -->

### Interfaces

- [ ] I[Service] in `src/api-logic/Interfaces/I[Service].cs`
  - [ReturnType] [Method]([ParamType] [param]) <!-- repeat as needed -->

### Services

- [ ] [Service] in `src/api-logic/Services/[Service].cs`
  - Implement [Interface] <!-- if applicable -->
  - [ReturnType] [Method]([ParamType] [param]) <!-- repeat as needed -->
  - Calls [Service].[Method]([param]) <!-- if applicable, repeat as needed -->

### Endpoints

- [ ] [Action][Resource]Endpoint in `src/api/Endpoints/[Resource]/[Action][Resource]Endpoint.cs`
  - Route: [HTTPMethod] `[resource-path]`
  - Request: [RequestDto] <!-- if no DTO - replace RequestDto with request properties -->
  - Response: [ResponseDto] <!-- if no DTO - replace ResponseDto with response properties -->
  - Calls [Service].[Method]([param]) <!-- if applicable, repeat as needed -->

### Models

- [ ] [Model] in `src/api-logic/Models/[Model].cs`
  - props: [prop1], [prop2]

### Pages

- [ ] [Page] in `src/client/src/pages/[Section]/[Page].tsx`
  - Route: `/[route-path]`
  - Components: [Component1], [Component2]

### Components

- [ ] [Component] in `src/client/src/components/[Component].tsx`

### Hooks

- [ ] use[Feature] in `src/client/src/hooks/use[Feature].ts`
  - Returns { [state1], [method1] }

### Tests

- [ ] Unit test: [Service] in `tests/[Project].Tests/Services/[Service]Tests.cs`
  - [TestMethod]: short description <!-- repeat as needed -->

---

<!-- Copy phase template above to add more user stories -->

---

## Phase N: Polish

- [ ] Search for existing components/utilities/hooks/endpoints/services etc - if similar functionality exists, refactor to reuse
- [ ] Code cleanup and refactoring: Remove unused code, Remove code duplications,Performance optimization, Security hardening
- [ ] Validate all tests pass
- [ ] Full backend build: `dotnet build`
- [ ] Full frontend checks: `cd src/client && npx tsc --noEmit --skipLibCheck --project tsconfig.app.json && npx eslint .`
- [ ] Format files: `cd src/client && npx prettier <files> --write`