---
name: ellie
description: CLI for Ellie Daily Planner - manage tasks, lists, and labels.
---

# Ellie CLI

Command-line interface for the Ellie Daily Planner API.

## When to use

Use this skill when the user asks to:
- Check their tasks or schedule
- Create, update, or complete tasks
- Manage their task lists or labels
- Get brain dump tasks
- Search for tasks

## Commands

```bash
# User info
ellie users me
ellie users usage

# Labels
ellie labels list
ellie labels create --name "Work" --color "#FF5733"

# Lists
ellie lists list

# Tasks
ellie tasks list --date 2024-01-15
ellie tasks by-list --list-id <id>
ellie tasks braindump
ellie tasks get <id>
ellie tasks search "meeting"
ellie tasks create --desc "New task" --date 2024-01-15
ellie tasks update <id> --desc "Updated task"
ellie tasks complete <id>
ellie tasks delete <id>
```

## JSON Output

Add `--json` for machine-readable output:
```bash
ellie users me --json
ellie tasks list --date 2024-01-15 --json
```

## Authentication

The CLI uses the `ELLIE_API_KEY` environment variable for authentication.
