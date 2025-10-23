#!/usr/bin/env bash
# install.sh - Install Claude Tools to parent project
#
# Usage: ./.claude-tools/install.sh
#
# This script copies all .claude/ files from this submodule
# to the parent project's .claude/ directory.

set -e

# Get script directory (the .claude-tools submodule location)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_DIR="$SCRIPT_DIR/.claude"

# Get parent directory (the project root)
PARENT_DIR="$( cd "$SCRIPT_DIR/.." && pwd )"
TARGET_DIR="$PARENT_DIR/.claude"

echo -e "\033[36mClaude Tools Installer\033[0m"
echo -e "\033[36m======================\033[0m"
echo ""

# Check if source .claude directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "\033[31mERROR: Source directory not found: $SOURCE_DIR\033[0m"
    echo -e "\033[31mMake sure this script is run from within the .claude-tools submodule.\033[0m"
    exit 1
fi

echo -e "\033[90mSource: $SOURCE_DIR\033[0m"
echo -e "\033[90mTarget: $TARGET_DIR\033[0m"
echo ""

# Pull latest version from git
echo -e "\033[33mUpdating to latest version...\033[0m"
cd "$SCRIPT_DIR"
if git pull origin main 2>&1; then
    echo -e "  \033[32mUpdated to latest version\033[0m"
else
    echo -e "  \033[33mWarning: Could not pull latest version\033[0m"
    echo -e "  \033[33mContinuing with current version...\033[0m"
fi
cd "$PARENT_DIR"
echo ""

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "\033[33mCreating target directory...\033[0m"
    mkdir -p "$TARGET_DIR"
fi

# Copy files
echo -e "\033[33mCopying files...\033[0m"
cp -r "$SOURCE_DIR"/* "$TARGET_DIR/"

# Show copied files
find "$SOURCE_DIR" -type f | while read -r file; do
    rel_path="${file#$SOURCE_DIR/}"
    echo -e "  \033[32mCopied: $rel_path\033[0m"
done

echo ""
echo -e "\033[32mInstallation complete!\033[0m"
echo ""