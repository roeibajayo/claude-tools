#!/usr/bin/env pwsh
# install.ps1 - Install Claude Tools to parent project
#
# Usage: ./.claude-tools/install.ps1
#
# This script copies all .claude/ files from this submodule
# to the parent project's .claude/ directory.

$ErrorActionPreference = "Stop"

# Get script directory (the .claude-tools submodule location)
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SourceDir = Join-Path $ScriptDir ".claude"

# Get parent directory (the project root)
$ParentDir = Split-Path -Parent $ScriptDir
$TargetDir = Join-Path $ParentDir ".claude"

Write-Host "Claude Tools Installer" -ForegroundColor Cyan
Write-Host "======================" -ForegroundColor Cyan
Write-Host ""

# Check if source .claude directory exists
if (-not (Test-Path $SourceDir)) {
    Write-Host "ERROR: Source directory not found: $SourceDir" -ForegroundColor Red
    Write-Host "Make sure this script is run from within the .claude-tools submodule." -ForegroundColor Red
    exit 1
}

Write-Host "Source: $SourceDir" -ForegroundColor Gray
Write-Host "Target: $TargetDir" -ForegroundColor Gray
Write-Host ""

# Pull latest version from git
Write-Host "Updating to latest version..." -ForegroundColor Yellow
Push-Location $ScriptDir
try {
    $gitOutput = git pull origin main 2>&1
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  $gitOutput" -ForegroundColor Green
    } else {
        Write-Host "  Warning: Could not pull latest version: $gitOutput" -ForegroundColor Yellow
        Write-Host "  Continuing with current version..." -ForegroundColor Yellow
    }
} catch {
    Write-Host "  Warning: Git pull failed: $_" -ForegroundColor Yellow
    Write-Host "  Continuing with current version..." -ForegroundColor Yellow
} finally {
    Pop-Location
}
Write-Host ""

# Create target directory if it doesn't exist
if (-not (Test-Path $TargetDir)) {
    Write-Host "Creating target directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $TargetDir | Out-Null
}

# Function to copy directory recursively
function Copy-Directory {
    param (
        [string]$Source,
        [string]$Destination
    )

    # Create destination directory if it doesn't exist
    if (-not (Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination | Out-Null
    }

    # Copy all items
    Get-ChildItem -Path $Source -Recurse | ForEach-Object {
        $targetPath = $_.FullName.Replace($Source, $Destination)

        if ($_.PSIsContainer) {
            # Create directory
            if (-not (Test-Path $targetPath)) {
                New-Item -ItemType Directory -Path $targetPath | Out-Null
            }
        }
        else {
            # Copy file
            Copy-Item -Path $_.FullName -Destination $targetPath -Force
            Write-Host "  Copied: $($_.FullName.Replace($Source + '\', ''))" -ForegroundColor Green
        }
    }
}

# Perform the copy
Write-Host "Copying files..." -ForegroundColor Yellow
Copy-Directory -Source $SourceDir -Destination $TargetDir

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host ""