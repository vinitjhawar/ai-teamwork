---
name: intake
description: The one-question router. Asks the user light, medium, or heavy and returns the chosen intensity to clone. Always asks every time unless the user has explicitly set a remembered default with the "remember" or "always" commands.
---

# Intake

One question. Three answers. Done.

## The prompt

```
task received. pick intensity:

light    5 board members, no debate, no employees, no loops
         best for: captions, replies, quick decisions
         ~30 seconds, ~8k tokens

medium   10 employees draft  +  10 board review  +  1 revision loop
         best for: posts, emails, drafts, plans
         ~2 minutes, ~25k tokens

heavy    employees meet  +  full board debate  +  up to 3 revisions
         best for: launches, contracts, CVs, anything irreversible
         ~5 minutes, ~45k tokens

reply: light, medium, or heavy
```

## What each mode actually runs

| | Employees | Board | Meeting | Revision loops | Time | Tokens |
|---|-----------|-------|---------|----------------|------|--------|
| **light**  | 0  | 5  | no   | 0       | ~30s   | ~8k   |
| **medium** | 3 to 5 picked by clone | 10 | no | 1 | ~2min | ~25k |
| **heavy**  | all 10 (if relevant) | 10 | yes | up to 3 | ~5min | ~45k |

In medium and heavy modes, clone picks which employees attend based on the task. A LinkedIn post pulls Writer + Growth + Researcher. A bug fix pulls Engineer + PM. A cover letter pulls Career Agent + Writer. See the [employees index](../employees/README.md) for the full roster.

## Reply parsing

Accept any of: `light`, `l`, `1` → light. `medium`, `m`, `2` → medium. `heavy`, `h`, `3` → heavy. Case-insensitive. Whitespace ignored.

## Memory behaviour (important)

**Default: always ask, every single time.** Intake never auto-prompts "do you want to remember this?" after a run. The question is asked fresh on every task.

A remembered default is set ONLY when the user explicitly says so. Recognised commands:

| User says | Effect |
|-----------|--------|
| `remember this` | Saves the just-picked mode as the default |
| `remember light` | Saves `light` as the default |
| `remember medium` | Saves `medium` as the default |
| `remember heavy` | Saves `heavy` as the default |
| `always heavy` | Same as `remember heavy` |
| `forget my default` | Clears the saved default, back to asking every time |
| `forget` | Same as above |

If a default exists, intake skips the question and uses that default. Override for one run only with `heavy this time`, `light this time`, or `medium this time` (does not change the saved default).

If no default exists (the user has never said "remember"), intake always asks.

## Storage

When the user explicitly sets a default, write to `~/.opencouncil/preferences.json`:

```json
{ "default_intensity": "medium", "set_by_user_at": "2026-05-17T13:50:00Z" }
```

The `set_by_user_at` field exists to make it clear this was a deliberate user action, not an auto-remember.

## Reset

`opencouncil reset` clears the stored default and any other preferences. Same as `forget my default`.
