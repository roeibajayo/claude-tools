# Claude Tools

A collection of Claude Code tools and workflows for structured project development.

## Installation

1. Add this repository as a submodule to your project:

```bash
cd /path/to/your/project
git submodule add https://github.com/roeibajayo/claude-tools.git .claude-tools
git submodule update --init --recursive
```

2. Run the installation script:

```powershell
# Windows
.\.claude-tools\install.ps1

# Linux/Mac
./.claude-tools/install.sh
```

This copies all `.claude/` files from the submodule to your project's `.claude/` directory.

## Updating

To update to the latest version, simply re-run the installation script:

```powershell
# Windows
.\.claude-tools\install.ps1

# Linux/Mac
./.claude-tools/install.sh
```

The script automatically pulls the latest version from git before copying files.
