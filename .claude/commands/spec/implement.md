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

Task files are organized by phase with specific execution order:

- **Init Phase** (optional): `temp-spec/tasks-init.md` - Must be completed FIRST if exists (other phases depend on these DTOs)
- **Middle Phases**: `temp-spec/tasks-{N}.md` (N=1,2,3...) - Can be executed in parallel after Init Phase
- **Polish Phase** (optional): `temp-spec/tasks-polish.md` - Must be completed LAST if exists (migrations, validation)

## Command Checklist

- [ ] Search (`*/guidelines/*.md`) and load all general (server and client) or relevant guidelines markdown files to context, including `.claude/guidelines/GENERAL.md`.
- [ ] Load guidelines skills to context, specifically `dotnet-guidelines` and `react-guidelines`, if relevant to the tasks.
- [ ] Find all phase task files (`temp-spec/tasks-*.md`, ignore `temp-spec/tasks-{N}-completed.md`). If none exist, STOP and suggest running `/spec:tasks` first.
- [ ] Identify phase files: Init phase (`tasks-init.md`), Middle phases (`tasks-{N}.md`), Polish phase (`tasks-polish.md`).
- [ ] If user input specifies a phase (e.g., "init", "p1", "polish"), implement only that phase file directly.
- [ ] If no phase specified, execute in this order (skip phases that don't exist):
  1. **Init phase** (if exists): Implement directly (shared models must exist before other phases)
  2. **Middle phases**: Launch parallel CLI processes using `claude -p`
  3. **Polish phase** (if exists): Implement directly after all middle phase processes complete (migrations & validation)
- [ ] Ensure ALL tasks completed and marked `[X]` in the processed phase file(s).

## Parallel Execution for Middle Phases (CRITICAL)

When executing middle phases (`tasks-1.md`, `tasks-2.md`, etc.), use separate CLI processes:

1. Invoke **multiple Bash tools simultaneously** - one for each phase file
2. Use `run_in_background: true` to avoid timeout (default is 2 min, max 10 min)
3. Each process starts with **fresh context** (no inheritance, no overflow)
4. Use `TaskOutput` to wait for all background processes to complete

**Command per phase:**

```bash
claude -p "/spec:implement p{N}" --model "sonnet" --permission-mode acceptEdits
```

**Example - 2 middle phases = invoke 2 Bash tools simultaneously with `run_in_background: true`:**

```
Bash tool (background): claude -p "/spec:implement p1" --model "sonnet" --permission-mode acceptEdits
Bash tool (background): claude -p "/spec:implement p2" --model "sonnet" --permission-mode acceptEdits
```

Then use `TaskOutput` with each task ID to wait for completion.

## Task Parallelization Within Phases

When implementing tasks within a single phase file, **parallelize tasks** when possible:

1. **Identify parallelizable tasks**: Tasks that modify different files AND have no dependencies on incomplete tasks
2. **Execute in parallel**: Use multiple tool calls in a single message for independent tasks
3. **Sequential when dependent**: Only implement sequentially when a task depends on another incomplete task

**Parallelization rules:**

- Tasks in different files with no shared dependencies → **Parallel**
- Tasks in the same file → **Sequential**
- Task B depends on Task A's output → **Sequential** (A before B)
- Multiple independent new files → **Parallel**

## Progress Tracking and Reporting Guidelines

- Parallelize tasks when they modify different files and have no dependencies on incomplete tasks
- **CRITICAL: After completing EACH task, IMMEDIATELY update the phase file to mark it as completed `[X]`** - do not batch updates
- You are **NOT ALLOWED TO CHANGE ANYTHING** in phase files except marking tasks as completed
- Rename phase files to `temp-spec/tasks-{N}-completed.md` after all tasks are done
- Do NOT report any progress, like: "Let me ..", "Now I will ...", etc.
- Do NOT report after each task completion
- Only report errors with context and next steps if blocked
- Report final status with summary of all completed work
- Unit tests must implement the AAA pattern (Arrange, Act, Assert). Comment // Arrange, // Act, // Assert in the test methods
