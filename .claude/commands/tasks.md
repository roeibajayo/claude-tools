---
description: Generate an actionable tasks.md for the feature based on available design artifacts.
---

# Tasks generation

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. **Execute task generation workflow**:

   - Generate tasks organized by user story (see Task Generation Rules below)
   - Generate dependency graph showing user story completion order
   - Validate task completeness (each user story has all needed tasks, independently testable)

2. **Generate tasks.md**: Use `.claude/templates/tasks.md` as structure, fill with:
   - Phase 1+: One phase per user story
   - Each phase includes implementation tasks only
   - Final Phase: Polish & cross-cutting concerns
   - All tasks must follow the strict checklist format (see Task Generation Rules below)
   - Clear file paths for each task
   - Dependencies section showing story completion order

The tasks.md should be immediately executable - each task must be specific enough that an LLM can complete it without additional context.

## Task Generation Rules

**CRITICAL**: Tasks MUST be organized by user story to enable independent implementation and testing.

**Tests are OPTIONAL**: Only generate test tasks if explicitly requested in the feature specification or if user requests TDD approach.

### Checklist Format (REQUIRED)

Every task MUST strictly follow this format:

```text
- [ ] Description with file path
```

**Format Components**:

1. **Checkbox**: ALWAYS start with `- [ ]` (markdown checkbox)
2. **Description**: Clear action with exact file path
   - File paths should use forward slashes `/` even on Windows
   - File paths should be surrounded by backticks `` ` `` for clarity

**Examples**:

- ✅ CORRECT: `- [ ] Create project structure per implementation plan`
- ✅ CORRECT: `` - [ ] Implement authentication middleware in `src/middleware/auth.py`  ``
- ✅ CORRECT: `` - [ ] Create User model in `src/models/user.py`  ``
- ✅ CORRECT: `` - [ ] Implement UserService in `src/services/user_service.py`  ``
- ❌ WRONG: `Create model` (missing checkbox)
- ❌ WRONG: `- [ ] Create model` (missing file path)
- ❌ WRONG: `- [ ] Create User model in src/models/user.py` (missing backticks around file path)

### Task Organization

- Each user story (P1, P2, P3...) gets its own phase
- User stories should contains only backend or frontend tasks as applicable, not mixed
- Within each story phase, group tasks by component type:
  - Backend:
    - **Interfaces**: Service interfaces, contracts
    - **Services**: Business logic implementation
    - **Endpoints**: API endpoints, controllers
    - **Models**: Database models, entities, data transfer objects
    - **Utilities**: Helper functions, shared code
    - **Tests**: Contract tests
  - Frontend:
    - **Pages**: Full page components
    - **Components**: Reusable UI components
    - **Hooks**: Custom React hooks
    - **Utilities**: Helper functions, shared code
