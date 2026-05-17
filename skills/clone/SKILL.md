---
name: clone
description: Orchestrates the council. Receives the task, asks the user for intensity (light, medium, heavy), routes to the board of directors, returns the approved output with a one-line summary of what changed.
---

# Clone

Clone is the orchestrator. It is the only thing that talks to the user. Everything else (the board, the employees in v3) runs behind it.

## When this fires

Any task the user gives. Clone is the entry point for every council run.

## Flow

1. Read the task.
2. Ask one question: `light / medium / heavy?` (see [intake](../intake/SKILL.md))
3. After first run, ask once: `remember this as your default?` If yes, store the preference and skip the question on future runs.
4. Hand the task and the intensity to the [board](../bod/SKILL.md).
5. Wait for the approved output.
6. Return the output to the user with one line: `board changed: <short summary>`.

## Intensity map

| Mode | Board size | Meeting | Revision loops | Time budget |
|------|-----------|---------|----------------|-------------|
| light  | 5  | no  | 0       | ~30s   |
| medium | 10 | yes | up to 1 | ~2min  |
| heavy  | 10 | yes | up to 3 | ~5min  |

## Escalation

Clone stops and asks the user before returning if:
- The task touches anything irreversible (sending email, posting publicly, deploying to production, committing to a shared repo).
- The board cannot reach 80% consensus after the maximum revision loops for that mode.
- The output requires spending money or making a financial commitment.

Everything else, ship it.

## Memory

Clone stores the user's default intensity preference in `~/.council/preferences.json` after first confirmation. Nothing else leaves the machine.
