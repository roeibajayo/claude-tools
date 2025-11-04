# Tasks Creation Guidelines

## Anti-Patterns (Things to Avoid)

### 1. Code Snippets in Tasks

**Anti-Pattern**: Including code snippets or line numbers in task descriptions.

**Good Practice**: Describe what needs to be done, not how to do it with specific code.

### 2. Incorrect File Paths

**Anti-Pattern**: Assuming file locations without verification.

**Example Bad**: `src/api/Logic/Interfaces/...` (incorrect path)
**Example Good**: `src/api-logic/Interfaces/...` (verified path)

**Good Practice**: Always verify actual file paths in codebase.

### 3. Missing Required Fields in DTOs

**Anti-Pattern**: Creating DTOs that don't match backend/frontend expectations.

**Example**: Forgetting to add request DTO when creating new endpoint.

**Good Practice**: Check similar endpoints for required DTO patterns.

### 4. Inconsistent Naming Conventions

**Anti-Pattern**: Using different naming than existing patterns.

**Example Bad**: `ClearHistory` (doesn't match existing terminology)
**Example Good**: `ClearContext` (matches "Reset Context" terminology)

**Good Practice**: Review existing naming for similar features.

### 5. Assuming Component Props Without Verification

**Anti-Pattern**: Adding props to components without checking current prop interface.

**Good Practice**: Read component files to verify current prop structure.

### 6. Not Checking for Shared Utilities

**Anti-Pattern**: Implementing new utilities that may already exist in the codebase.

**Good Practice**: Search for similar utilities before adding to tasks.

### 7. Missing Validation in Backend Endpoints

**Anti-Pattern**: Not validating entity existence before operations.

**Example**: Not checking if session exists before resetting context.

**Good Practice**: Always validate entities exist and are in correct state.

---

## Task Structure Best Practices

### Clear Task Boundaries

- Each task should be a single, atomic action
- Use checkboxes for trackability
- Indicate [New], [Update], or [Delete] for each task

### Phased Approach

- Phase 1: Backend changes
- Phase 2: Frontend changes
- Phase 3: Unit tests and polish

### Descriptive Task Names

- Include what is being changed and where
- Include key method/property names
- Include file paths for new files
