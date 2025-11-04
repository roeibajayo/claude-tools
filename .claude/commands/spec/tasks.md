---
description: Generate an actionable tasks.md for the feature based on available design artifacts.
---

# Tasks generation

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Tasks Generation Guidelines

**Use `.claude/templates/tasks.md` as structure**

- Task must be specific enough that an LLM can complete it without additional context
- Project-specific phases (P1, P2, P3...): no mixing projects and no separated phases for single project
- Each project includes implementation tasks only
- Clear file paths for each task
- Generate tasks organized by Project, following the Task Generation Rules below
- Final Phase: Polish & cross-cutting concerns

## Command Checklist

- [ ] Ensure `temp-spec/explain.md` is loaded to context, if exists.
- [ ] Ensure `temp-spec/tech-explain.md` is loaded to context, if exists.
- [ ] Generate `temp-spec/tasks.md` following the `Tasks Generation` guidelines above.

## Task Generation Rules

**CRITICAL**: Tasks MUST be organized by Project to enable independent implementation and testing.

**Note**: if task is Update or Remove, add small description of why it is needed.

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
- Within each project, group tasks by component type AS IN THE TEMPLATE
