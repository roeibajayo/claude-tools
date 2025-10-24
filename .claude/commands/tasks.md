---
description: Generate an actionable, dependency-ordered tasks.md for the feature based on available design artifacts.
---

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
   - Phase 1: Setup tasks (project initialization)
   - Phase 2: Foundational tasks (blocking prerequisites for all user stories)
   - Phase 3+: One phase per user story
   - Each phase includes: story goal, tests (if requested), implementation tasks
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
2. **[Story] label**: REQUIRED for user story phase tasks only
   - Setup phase: NO story label
   - Foundational phase: NO story label
   - User Story phases: MUST have story label
   - Polish phase: NO story label
3. **Description**: Clear action with exact file path
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

1. **From User Stories** - PRIMARY ORGANIZATION:

   - Each user story (P1, P2, P3...) gets its own phase
   - Within each story phase, group tasks by component type:
     - **Tests** (if requested): Contract tests, integration tests
     - **Models**: Database models, entities
     - **DTOs**: Request/Response data transfer objects
     - **Interfaces**: Service interfaces, contracts
     - **Services**: Business logic implementation
     - **Endpoints**: API endpoints, controllers
     - **Pages**: Full page components (Frontend)
     - **Components**: Reusable UI components (Frontend)
     - **Hooks**: Custom React hooks (Frontend)
     - **Utilities**: Helper functions, shared code
   - Mark story dependencies (most stories should be independent)

2. **From Contracts**:

   - Map each contract/endpoint → to the user story it serves
   - Place endpoint tasks in the **Endpoints** section of that story's phase
   - If tests requested: Place contract tests in **Tests** section before implementation

3. **From Data Model**:

   - Map each entity to the user story(ies) that need it
   - Place entity tasks in the **Models** section of that story's phase
   - If entity serves multiple stories: Put in earliest story or Setup phase
   - DTOs go in the **DTOs** section

4. **From Setup/Infrastructure**:
   - Shared infrastructure → Setup phase (Phase 1)
   - Foundational/blocking tasks → Foundational phase (Phase 2)
   - Story-specific setup → within that story's phase

### Phase Structure

- **Phase 1**: Setup (project initialization)
- **Phase 2**: Foundational (blocking prerequisites - MUST complete before user stories)
- **Phase 3+**: User Stories in priority order (P1, P2, P3...)
  - Within each story, tasks grouped by component type:
    - Tests (if requested) - write first, ensure they fail
    - Models - data layer
    - DTOs - API contracts
    - Interfaces - abstractions
    - Services - business logic
    - Endpoints - API layer
    - Pages - full page views (Frontend)
    - Components - reusable UI (Frontend)
    - Hooks - custom React hooks (Frontend)
  - Each phase should be a complete, independently testable increment
- **Final Phase**: Polish & Cross-Cutting Concerns
