---
name: intake
description: The one-question router. Asks the user light, medium, or heavy and returns the chosen intensity to clone. Handles default preference memory.
---

# Intake

One question. Three answers. Done.

## The prompt

```
task received. pick intensity:

light    5 reviewers, no meeting, no loops
         best for: captions, replies, quick decisions
         ~30 seconds, ~8k tokens

medium   10 reviewers, team meeting, 1 revision loop
         best for: posts, emails, drafts, plans
         ~2 minutes, ~25k tokens

heavy    10 reviewers, full meeting, up to 3 revision loops
         best for: launches, contracts, CVs, anything public
         ~5 minutes, ~45k tokens

reply: light, medium, or heavy
```

## Reply parsing

Accept any of: `light`, `l`, `1` → light. `medium`, `m`, `2` → medium. `heavy`, `h`, `3` → heavy. Case-insensitive. Leading or trailing whitespace ignored.

Override syntax: `heavy this time` or `light this time` overrides the stored default for one run only.

## Default memory

After the first successful run, intake asks once:

```
remember <intensity> as your default? (y/n)
```

If `y`, write to `~/.council/preferences.json`:

```json
{ "default_intensity": "medium", "set_at": "2026-05-17T13:50:00Z" }
```

On future runs, intake reads the file. If a default exists, skip the question and proceed directly. If the user types an override (`heavy this time`), respect it for one run, do not overwrite the default.

## Reset

`council reset` clears the stored default and triggers the question on the next run.
