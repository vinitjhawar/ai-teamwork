---
name: wrapper
description: Wraps any other Claude Code skill you have installed and runs the ai-teamwork board review on top of its output. Activates when the user prefixes a skill call with "wrap" or sets wrapping as default. Part of v2.
---

# Wrapper mode (v2)

ai-teamwork's second mode. Instead of running its own employees, the wrapper intercepts the output of any other Claude Code skill you have installed and runs the board review gate on top of it. Your existing skill keeps its voice and behaviour. Only the quality gate is added.

## How it works

1. You invoke any skill you have installed, prefixed with `wrap`. Example: `wrap marketing-storyteller draft a Reels script.`
2. The wrapped skill runs normally and produces its output.
3. The board reads the output.
4. If consensus passes (8 of 10, zero hard vetoes), the output reaches you with a one-line summary.
5. If consensus fails, the wrapper sends the board flags back to the wrapped skill as input and asks for a revision. Up to 3 loops.

## Why this matters

Most users already have a stack of Claude Code skills they like. Switching off them to use ai-teamwork is friction. Wrapper mode means you keep your existing tools and just add the quality gate on top.

## Compatible skills

Any skill that:
- Produces a discrete text output (not a long-running session)
- Accepts revision feedback as input on re-invocation
- Runs inside Claude Code

This covers the vast majority of skills on the public catalogue.

## Activation

Three ways:

```bash
# one-off wrap
wrap <skill-name> <args>

# set wrapping as default for a skill
ai-teamwork wrap-default <skill-name>

# unwrap (revert to plain skill behaviour)
ai-teamwork unwrap <skill-name>
```

## Status

v2 release: design complete, implementation in progress. Track at [ROADMAP.md](../../ROADMAP.md).
