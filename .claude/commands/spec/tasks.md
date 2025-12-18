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

Your objective is to generate comprehensive task files that outline all necessary implementation steps.
You **MUST** use `.claude/templates/tasks.md` as structure for each phase file, following the `Tasks Creation Guidelines`.
**DO NOT DEVIATE FROM THE TEMPLATE STRUCTURE**.
**DO NOT** generate any docs (.md files) files other than task files.

### Phase File Structure

- Each phase gets its own file: `temp-spec/tasks-1.md`, `temp-spec/tasks-2.md`, etc.
- Each file contains tasks for ONE project/phase only (e.g., Backend Logic, Frontend)
- File naming: `tasks-{N}.md` where N is the phase number (1, 2, 3...)

## Command Checklist

- [ ] Search and load all general (server and client) guidelines markdown files to context, including `.claude/guidelines/GENERAL.md`.
- [ ] Load guidelines skills to context, specifically `dotnet-guidelines` and `react-guidelines`, if relevant to the tasks.
- [ ] Ensure `temp-spec/explain.md` is loaded to context, if exists.
- [ ] Ensure `temp-spec/tech-explain.md` is loaded to context, if exists.
- [ ] Determine how many phases/projects are needed for the feature.
- [ ] Generate separate `temp-spec/tasks-{N}.md` files for each phase, following the `Tasks Creation Guidelines`.

@../../guidelines/TASKS-CREATION.md
