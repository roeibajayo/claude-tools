# CLAUDE.md

## Repository Purpose

This is a collection of Claude Code tools and workflows for project development. It provides:

- Slash commands for task generation, implementation, and documentation optimization
- Skills for refactoring assistance and skill creation
- Task management templates for structured feature development

## Installation Method

This repository is designed to be used as a **git submodule** in other projects:

1. Add as submodule: `git submodule add https://github.com/roeibajayo/claude-tools .claude-tools`
2. Run installation script: `./.claude-tools/install.ps1` (Windows) or `./.claude-tools/install.sh` (Linux/Mac)
3. The script copies all `.claude/` files from the submodule to the parent project's `.claude/` directory

This approach allows:

- Version-controlled tool updates via `git submodule update`
- Consistent tooling across multiple projects
- Easy updates by pulling submodule changes and re-running install script

## Development Commands

### Formatting

```bash
npm run format
```

Formats all files using Prettier with the project's configuration.
