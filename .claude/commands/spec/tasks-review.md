---
description: Review tasks.md file.
---

# Tasks review

## Command Checklist

- [ ] Ensure `temp-spec/tasks.md` is loaded to context, if not exists then STOP and suggest running `/spec:tasks` first.
- [ ] Ensure **ALL** methods/endpoints/hooks etc mentioned in `tasks.md` actually exist in the codebase.
- [ ] Ensure every task meets existing project conventions for naming, structure, imports - update tasks accordingly.
- [ ] Review every task for new Component or Service to detect and reuse common patterns across files, if found - update tasks accordingly.
- [ ] Think for new Components and Services tasks to detect similar existing components, if found - update tasks accordingly to extend/reuse them.
- [ ] Analyze for identify shared utilities and helpers, if found - update tasks accordingly
- [ ] Analyze changes to extract review patterns and anti-patterns for future improvements, save in `temp-spec/tasks-review-patterns.md`.
