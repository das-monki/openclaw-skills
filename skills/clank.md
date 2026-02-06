---
name: clank
description: CLI for Clank task manager - create and manage background tasks.
---

# Clank CLI

Command-line interface for the Clank task management system.

## When to use

Use this skill when the user asks to:
- Create a background task or job
- Check task status or progress
- List running or completed tasks
- Cancel or manage tasks

## Environment

The CLI connects to the Clank API via `CLANK_API` environment variable.

## Commands

```bash
# List tasks
clank tasks list
clank tasks list --status running
clank tasks list --status completed

# Get task details
clank tasks get <task-id>

# Create a new task
clank tasks create --name "My task" --command "echo hello"

# Cancel a task
clank tasks cancel <task-id>

# Watch task output
clank tasks logs <task-id>
clank tasks logs <task-id> --follow
```

## Task Creation

When creating tasks, specify:
- `--name`: Human-readable task name
- `--command`: The command to execute
- `--timeout`: Optional timeout duration
- `--env`: Environment variables (can be repeated)

Example:
```bash
clank tasks create \
  --name "Build project" \
  --command "nix build" \
  --timeout 30m
```
