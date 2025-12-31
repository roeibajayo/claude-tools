---
description: Generate an actionable tasks.md for the feature based on available design artifacts.
---

# Tasks generation

Your objective is to generate comprehensive task files that outline all necessary implementation steps.

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Tasks Generation Guidelines (CRITICAL)

- You **MUST** use `.claude/templates/tasks.md` as structure for each phase file, following the `Tasks Creation Guidelines`.
- **DO NOT DEVIATE FROM THE TEMPLATE STRUCTURE**.
- **DO NOT** generate any docs (.md files) files other than task files and the plan summary.
- Generate tasks by MVP first, incremental delivery.
- Each phase should be a complete, independently testable increment.

### Phase File Structure

- **Init phase** (optional): `temp-spec/tasks-init.md` (shared models) - only if feature has shared DTOs
- **Middle phases**: `temp-spec/tasks-1.md`, `temp-spec/tasks-2.md`, etc.
- **Polish phase** (optional): `temp-spec/tasks-polish.md` (migrations, validation) - only if feature needs migrations or validation

**Single Phase Optimization**: If the feature only requires ONE phase (e.g., a simple single-project feature), create just `tasks-1.md` with all tasks using the full template structure. Do NOT split into init/middle/polish phases. The implementation will execute it directly without spawning background agents.

### Phase Order (CRITICAL)

Phases **MUST** follow this specific order:

1. **Init Phase - Shared Models** (optional): Contains ONLY shared models/DTOs between server and client (endpoint request/response models). Skip if feature has no new shared models. This phase must be completed first as other phases depend on these models.

2. **Middle Phases (2 to N-1) - Parallel Implementation**: These phases can run in parallel. Each file contains tasks for ONE project only (e.g., Backend Logic, Frontend). Organize by project type:
   - Backend services, repositories, endpoints
   - Frontend pages, components, hooks
   - Other independent modules

3. **Polish Phase** (optional): Contains finalization tasks. Skip if feature has no migrations or special validation needs:
   - Database migrations (`dotnet ef migrations add [MigrationName]`)
   - Build validation
   - Tests validation
   - Code formatting

### Plan Summary File

Generate `temp-spec/tasks-plan.md` with the following structure:

```markdown
# Implementation Plan: [FEATURE NAME]

## Overview

<!-- 2-3 sentence summary of what the feature does -->

## Phases

### Phase 1

#### Summary

<!-- 1-2 sentence description of what this phase accomplishes -->

#### Key Components:

<!-- comma-separated list of main components/services being created or modified -->

### Phase 2

<!-- repeat for each phase -->
```

## Command Checklist

- [ ] Search and load all general (server and client) guidelines markdown files to context, including `.claude/guidelines/GENERAL.md`.
- [ ] Load guidelines skills to context, specifically `dotnet-guidelines` and `react-guidelines`, if relevant to the tasks.
- [ ] Ensure `temp-spec/explain.md` is loaded to context, if exists.
- [ ] Ensure `temp-spec/tech-explain.md` is loaded to context, if exists.
- [ ] Determine how many phases/projects are needed for the feature.
- [ ] Generate `temp-spec/tasks-init.md` for **Init Phase** (DTOs/models shared between server and client). **Skip if no shared models needed.**
- [ ] Generate `temp-spec/tasks-{N}.md` files for **Middle Phases** (parallel implementation tasks, N=1,2,3...), one per project.
- [ ] Generate `temp-spec/tasks-polish.md` for **Polish Phase** (database migrations, validation). **Skip if no migrations or special validation needed.**
- [ ] Generate `temp-spec/tasks-plan.md` summarizing all phases and the overall implementation plan.

@../../guidelines/TASKS-CREATION.md
