# Roadmap

Three versions. Each shipped only when the previous one has real users.

## v1 (now)

The disagreement engine, standalone.

- Three intensity modes: light, medium, heavy.
- One question intake. Default preference memory after first run.
- Ten board profiles with hard and soft veto rules.
- Domain swap for tagged tasks.
- Escalation rules that force a stop on irreversible actions.
- One example transcript per major use case.

Status: shipped.

## v2 — wrapper mode

Open Council intercepts the output of any other Claude Code skill you already use and runs the board gate on top.

- Wrap an existing skill: `opencouncil wrap <skill-name>`.
- The wrapped skill runs as normal, the output goes through the board before reaching the user.
- Preserves the wrapped skill's voice and behaviour. Adds only the quality gate.
- Use cases: wrap a copywriting skill, a code review skill, a slide deck skill.

Why second: the standalone product needs real users first so we know which skills people most want wrapped.

Status: design only.

## v3 — full team mode

Ten specialist employees (Engineer, Designer, Writer, Researcher, Video Editor, Growth Strategist, CFO, Career Agent, Legal & Compliance, Clone-as-orchestrator) that the opencouncil can delegate to for complex multi-step tasks.

- Each employee is itself a skill loaded with a stack of best-in-class sub-skills.
- Clone receives the task, decomposes it, deploys the relevant employees, collects their outputs, and runs the board over the synthesis.
- For tasks where one specialist is enough, clone deploys just that one. The board still reviews.

Why third: this is the most powerful but also the most expensive in tokens and the most complex to build right. Shipping it before v1 has traction is the wrong order.

Status: architecture sketch only.

## Things that will not be in opencouncil

- Web UI. Open Council is a Claude Code skill, not a SaaS.
- Telemetry. Nothing leaves the machine.
- A marketplace. The repo is the marketplace.
- Multi-model routing. Whatever model Claude Code is configured for is the model the board uses.
- Voice or video interfaces.

## How to influence the roadmap

Open an issue. Tag it `roadmap`. The most-upvoted issues get pulled into the next version.
