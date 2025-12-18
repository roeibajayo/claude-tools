---
description: Execute the implementation plan by processing and executing all tasks defined in phase task files.
---

# Implementation execution

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Phase File Structure

Task files are organized by phase: `temp-spec/tasks-1.md`, `temp-spec/tasks-2.md`, etc.

## Command Checklist

- [ ] Search (`*/guidelines/*.md`) and load all general (server and client) or relevant guidelines markdown files to context, including `.claude/guidelines/GENERAL.md`.
- [ ] Load guidelines skills to context, specifically `dotnet-guidelines` and `react-guidelines`, if relevant to the tasks.
- [ ] Find all phase task files (`temp-spec/tasks-*.md`, ignore `temp-spec/tasks-{N}-completed.md`). If none exist, STOP and suggest running `/spec:tasks` first.
- [ ] If user input specifies a phase (e.g., "p1", "phase 2"), implement only that phase file.
- [ ] If no phase specified, implement ALL phase files in order (p1, p2, p3...).
- [ ] Implement all tasks from the phase file(s), following the `Progress Tracking and Reporting Guidelines` below.
- [ ] Ensure ALL tasks completed and marked `[X]` in the processed phase file(s).

## Progress Tracking and Reporting Guidelines

- Implement tasks sequentially as listed in each phase file, skipping any already marked as `[X]`
- After completing each task, update the phase file to mark it as completed `[X]`
- You are **NOT ALLOWED TO CHANGE ANYTHING** in phase files except marking tasks as completed
- Rename phase files to `temp-spec/tasks-{N}-completed.md` after all tasks are done
- Do NOT report any progress, like: "Let me ..", "Now I will ...", etc.
- Do NOT report after each task completion
- Only report errors with context and next steps if blocked
- Report final status with summary of all completed work
- Unit tests must implement the AAA pattern (Arrange, Act, Assert). Comment // Arrange, // Act, // Assert in the test methods
