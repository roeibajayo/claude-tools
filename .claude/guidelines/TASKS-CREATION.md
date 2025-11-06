# Tasks Creation Guidelines

## Output file guidelines

- Task must be specific enough that an LLM can complete it without additional context
- Each task should be a single, atomic action
- Project-specific phases (P1, P2, P3...): no mixing projects and no separated phases for single project
- Each project includes implementation tasks only
- Use checkboxes for trackability
- Indicate [New], [Update], or [Delete] for each task

## Anti-Patterns

### 1. Code Snippets in Tasks

**Bad**: Including code snippets or line numbers in task descriptions.

**Good Practice**: Describe what needs to be done, not how to do it with specific code.

### 2. Incorrect File Paths

**Bad**: Assuming file locations without verification.

**Example Bad**: `src/api/Logic/Interfaces/...` (incorrect path)

**Example Good**: `src/api-logic/Interfaces/...` (verified path)

**Good Practice**: Always verify actual file paths in codebase.

### 3. Missing Required Fields in DTOs

**Bad**: Creating DTOs that don't match backend/frontend expectations.

**Example**: Forgetting to add request DTO when creating new endpoint.

**Good Practice**: Check similar endpoints for required DTO patterns.

### 4. Inconsistent Naming Conventions

**Bad**: Using different naming than existing patterns.

**Example Bad**: `ClearHistory` (doesn't match existing terminology)

**Example Good**: `ClearContext` (matches "Reset Context" terminology)

**Good Practice**: Review existing naming for similar features.

### 5. Assuming Component Props Without Verification

**Bad**: Adding props to components without checking current prop interface.

**Good Practice**: Read component files to verify current prop structure.

### 6. Not Checking for Shared Utilities

**Bad**: Implementing new utilities that may already exist in the codebase.

**Good Practice**: Search for similar utilities before adding to tasks.

### 7. Missing Validation in Backend Endpoints

**Bad**: Not validating entity existence before operations.

**Example**: Not checking if session exists before resetting context.

**Good Practice**: Always validate entities exist and are in correct state.

### 8. Task Descriptions Without Code Details

**Bad**: Task descriptions should focus on WHAT needs to be done and WHICH pattern to follow, not HOW to implement it with specific code.

**Example**: Original task had: "Creates system message using `messageService.CreateMessageAsync(sessionId, new CreateMessageRequest(MessageType.System, "Agent history has been cleared", null, null, MessageStatus.Done), cancellationToken)`"

**Good Practice**: "Creates system message using `messageService.CreateMessageAsync` with `CreateMessageRequest` (Type: `MessageType.System`, Content: `"Agent history has been cleared"`, Status: `MessageStatus.Done`)"

### 9. Order Tasks by Dependency Chain

**Bad**: When one task depends on another (e.g., constructor injection before method implementation), order them correctly in the task list.

**Example**: "Add `IMessageService` to constructor" task BEFORE "Implement `ResetContextAsync`" task (Constructor must be updated before the method can use the injected service)

**Good Practice**:

- Identify dependency relationships between tasks
- Order tasks so dependencies come first
- Consider adding "Required for..." notes to clarify relationships

### 10. Reference Existing Patterns for Implementation

**Bad**: Instead of describing full implementation, reference existing similar code as a pattern to follow.

**Examples**:

- Instead of full implementation details, added: "Follow pattern from `CleanMessagesAsync` but create message instead of deleting messages"
- Shortened endpoint task to: "Follow pattern from `ResetSessionEndpoint` and `CleanMessagesEndpoint`"

### 11. Avoid Over-Specification in Conditional Logic Tasks

**Bad**: When tasks involve conditional UI rendering, describe the conditions and what should happen, not the exact syntax.

**Examples**:

- Instead of: "if (step.stepType === WorkflowStepType.ClearContext) { return null; }"
- Used: "Hide content textarea when step type is ClearContext"
- Added: "Follow same pattern as Task step UI logic"

**Good Practice**:

- Describe UI behavior (show/hide/enable/disable)
- Reference existing patterns in the same component
- Let implementer handle conditional logic syntax

---

## Task Structure Best Practices

### Phased Approach

- Phase 1: Backend changes
- Phase 2: Frontend changes
- Phase 3: Unit tests and polish

### Descriptive Task Names

- Include what is being changed and where
- Include key method/property names
- Include file paths for new files
