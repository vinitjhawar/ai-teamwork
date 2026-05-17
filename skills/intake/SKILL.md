---
name: intake
description: The one-question router. Asks the user light, medium, or heavy and returns the chosen intensity to clone. Handles default preference memory and the "this time" override syntax.
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

Override syntax: `heavy this time` or `light this time` overrides the stored default for one run only.

## Default memory

After the first successful run, intake asks once:

```
remember <intensity> as your default? (y/n)
```

If `y`, write to `~/.ai-teamwork/preferences.json`:

```json
{ "default_intensity": "medium", "set_at": "2026-05-17T13:50:00Z" }
```

On future runs, intake reads the file. If a default exists, skip the question and proceed directly. Override with `heavy this time` for one run, without overwriting the default.

## Reset

`ai-teamwork reset` clears the stored default and triggers the question on the next run.
