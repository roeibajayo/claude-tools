---
description: Review phase task files.
---

# Tasks review

## Phase Structure

Task files follow this structure:

- **Init Phase** (optional): `temp-spec/tasks-init.md` - DTOs/models shared between server and client
- **Middle Phases**: `temp-spec/tasks-{N}.md` (N=1,2,3...) - Implementation tasks that can run in parallel
- **Polish Phase** (optional): `temp-spec/tasks-polish.md` - Database migrations and validation

## Command Checklist

- [ ] Find all phase task files (`temp-spec/tasks-*.md`, ignore `temp-spec/tasks-{N}-completed.md`). If none exist, STOP and suggest running `/spec:tasks` first.
- [ ] Load all phase task files to context.
- [ ] **Init Phase Review** (if exists): Verify all shared models/DTOs are defined and match between server (C#) and client (TypeScript)
- [ ] **Middle Phases Review**: Ensure tasks reference DTOs from Init Phase if it exists (not redefine them)
- [ ] **Polish Phase Review** (if exists): Verify migrations reference correct entities and validation commands are accurate
- [ ] Ensure **ALL** methods/endpoints/hooks etc mentioned in task files actually exist in the codebase
- [ ] Ensure **ALL** tasks meet existing project conventions for naming, structure, imports - update tasks accordingly
- [ ] Review every task for new Component or Service to detect and reuse common patterns across files, if found - update tasks accordingly
- [ ] Think for new Components and Services tasks to detect similar existing components, if found - update tasks accordingly to extend/reuse them
- [ ] Analyze for identify shared utilities and helpers, if found - update tasks accordingly
- [ ] Ensure **ALL** tasks following the `Tasks Creation Guidelines`

## Review Patterns (Good Practices)

### 1. Verify All Referenced Components Exist

**Pattern**:
Before approving tasks, verify that all mentioned interfaces, classes, methods, and files actually exist in the codebase.
When tasks reference DTOs or request objects, verify that the properties mentioned actually exist.

**Example Checks**:

- Interface methods exist with correct signatures
- Class implementations match interfaces
- File paths are accurate
- Enums are in correct locations
- DTOs match internal request/response patterns

### 2. Match Frontend and Backend DTO Patterns

**Pattern**: Frontend API methods should mirror backend endpoint structure.

**Example**:

Backend:

```csharp
// Route: POST /api/workflows/steps/{stepId}/execute-task
// Body: { sessionId }
```

Frontend:

```typescript
async executeStepTask(stepId: number, sessionId: number): Promise<Response> {
  return fetchPost(`/api/workflows/steps/${stepId}/execute-task`, { sessionId });
}
```

---

@../../guidelines/TASKS-CREATION.md
