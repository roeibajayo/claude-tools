---
description: Execute the implementation plan by processing and executing all tasks defined in tasks.md.
---

# Implementation execution

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

1. Read tasks.md and extract:
   - **REQUIRED**: Complete task list and execution plan
   - **Task phases** and sequential ordering
   - **Task details**: description, file paths, success criteria

2. Execute implementation in phase order:
   - Complete each phase before proceeding to the next
   - Within each phase, follow defined task sequence
   - Execute test tasks before corresponding implementation tasks (TDD)
   - Mark completed tasks as `[X]` in tasks.md after finishing each one

3. Execution priority order:
   - **Setup**: Initialize project structure, dependencies, configuration
   - **Tests**: Write test contracts and integration scenarios
   - **Core**: Implement models, services, CLI commands, endpoints
   - **Integration**: Database connections, middleware, logging, external services
   - **Validation**: Unit tests, performance optimization, documentation

4. Progress tracking:
   - Do NOT report any progress, like: "Let me ..", "Now I will ...", etc.
   - Do NOT report after each task completion
   - Only report errors with context and next steps if blocked
   - Report final status with summary of all completed work
   - **IMPORTANT** For completed tasks, make sure to mark the task off as [X] in the tasks file.

5. Completion criteria:
   - All required tasks marked `[X]`
   - Implemented features match original specification
   - All tests pass
   - Implementation follows technical plan

**Prerequisite**: tasks.md must exist with complete task breakdown. If missing or incomplete, suggest running `/tasks` first.
