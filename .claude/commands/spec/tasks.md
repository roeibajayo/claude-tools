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

Your objective is to generate a comprehensive `tasks.md` file that outlines all necessary implementation steps.
Use **MUST** use `../../templates/tasks.md` as structure, following the `Task Generation Rules` and `Tasks Creation Guidelines`.
**DO NOT DEVIATE FROM THE TEMPLATE STRUCTURE**.
**DO NOT** generate any docs (.md files) file other than `tasks.md`.

## Command Checklist

- [ ] Search and load all general (server and client) guidelines markdown files to context, including `.claude/guidelines/GENERAL.md`.
- [ ] Load guidelines skills to context, specifically `dotnet-guidelines` and `react-guidelines`, if relevant to the tasks.
- [ ] Ensure `temp-spec/explain.md` is loaded to context, if exists.
- [ ] Ensure `temp-spec/tech-explain.md` is loaded to context, if exists.
- [ ] Generate `temp-spec/tasks.md` following the `Task Generation Rules` and `Tasks Creation Guidelines`.

## Task Generation Rules

**CRITICAL**: Tasks MUST be organized by Project to enable independent implementation.

**Format Components**:

1. **Checkbox**: ALWAYS start with `- [ ]` (markdown checkbox)
2. **Description**: Clear action with exact file path
   - File paths should use forward slashes `/` even on Windows
   - File paths should be surrounded by backticks `` ` `` for clarity
3. Indicate [New], [Update], or [Delete] for each task

### Task Organization

- Each project (P1, P2, P3...) gets its own phase
- Each project section should contains only backend or frontend tasks as applicable, not mixed
- Within each project, group tasks by component type AS IN THE TEMPLATE

---

@../../guidelines/TASKS-CREATION.md
