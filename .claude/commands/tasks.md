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
   - Validate task completeness (each project has all needed tasks, independently testable)
   - Find existing components/services that can be extended or reused
   - Detect similar features for pattern reuse
   - Identify shared utilities and helpers
   - Map dependencies to avoid duplication

2. **Generate tasks.md**: Use `.claude/templates/tasks.md` as structure, fill with:
   - Generate tasks organized by Project (see Task Generation Rules below)
   - Project-specific phases (P1, P2, P3...): no mixing projects and no separated phases for single project
   - Each project includes implementation tasks only
   - Each task must be specific enough that an LLM can complete it without additional context
   - Final Phase: Polish & cross-cutting concerns
   - All tasks must follow the strict checklist format (see Task Generation Rules below)
   - Clear file paths for each task
   - Dependencies section showing project completion order

## Task Generation Rules

**CRITICAL**: Tasks MUST be organized by Project to enable independent implementation and testing.

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
3. `[New]` or `[Update]` or `[Remove]` designation

**Examples**:

- ✅ CORRECT: `- [ ] Create project structure per implementation plan`
- ✅ CORRECT: ``- [ ] Implement authentication middleware in `src/middleware/auth.py` ``
- ✅ CORRECT: ``- [ ] Create User model in `src/models/user.py` ``
- ✅ CORRECT: ``- [ ] Implement UserService in `src/services/user_service.py` ``
- ❌ WRONG: `Create model` (missing checkbox)
- ❌ WRONG: `- [ ] Create model` (missing file path)
- ❌ WRONG: `- [ ] Create User model in src/models/user.py` (missing backticks around file path)

### Task Organization

- Each project (P1, P2, P3...) gets its own phase
- Each project section should contains only backend or frontend tasks as applicable, not mixed
- Within each project, group tasks by component type
- Each Service / Repository / Manager / Page should be in separated section
