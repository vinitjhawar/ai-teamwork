<div align="center">

<img src="assets/hero.svg" alt="Council" width="780"/>

# Council

### AI that argues with itself before you see the answer.

[![License: MIT](https://img.shields.io/badge/license-MIT-22d3ee.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/built%20for-Claude%20Code-f59e0b.svg)](https://claude.com/claude-code)
[![Install Time](https://img.shields.io/badge/install-30%20seconds-22c55e.svg)](#install)
[![Questions](https://img.shields.io/badge/questions%20asked-1-a78bfa.svg)](#use)

**One command to install. One question to answer. Ten reviewers debating your output before it reaches you.**

</div>

---

## The problem nobody talks about

When a user challenged a correct answer, the AI backed down and agreed with the wrong version **more than 70% of the time**. AI models affirm users **49% more often than humans do**. The longer you talk to it, the worse it gets.

The output is not wrong in obvious ways. It is wrong in *smooth, confident, slightly off* ways. It sounds like something you would write. So you ship it.

<div align="center">
<img src="assets/before-after.svg" alt="Sycophantic Claude vs Council Claude" width="720"/>
</div>

This is the bug at the heart of every AI tool you use. Council is the patch.

---

## How it works in one picture

<div align="center">
<img src="assets/architecture.svg" alt="Council Architecture" width="780"/>
</div>

You give Claude a task. Behind the scenes, a council of ten distinct reviewer profiles tear the draft apart. The sceptic. The end user. The numbers person. The contrarian. The one who has seen this fail before. The optimist. Each one is prompted to disagree, not to agree.

Only after the council reaches consensus does the answer reach you. You see one polished output plus one line of what got changed and why.

---

## Install

```bash
npx skills add vinitjhawar/council
```

That is the install. No Python. No servers. No config files. No graph theory. Works inside Claude Code you already have.

---

## Use

After the task, Council asks you one question:

```
Task received. Pick intensity:

LIGHT   Clone + 5 reviewers, no meeting, no loops
        Best for: captions, replies, quick decisions
        ~30 seconds, ~8k tokens

MEDIUM  Clone + 5 employees meeting + 10 reviewers + 1 revision loop
        Best for: posts, emails, drafts, plans
        ~2 minutes, ~25k tokens

HEAVY   Full team meeting + 10 reviewers + up to 3 revision loops
        Best for: launches, contracts, CVs, anything public
        ~5 minutes, ~45k tokens

Reply: light, medium, or heavy
```

After the first task, Council asks if you want to remember your choice. Say yes once. Never asked again.

---

## Quality per token, measured

<div align="center">
<img src="assets/treemap.svg" alt="Quality per token comparison" width="780"/>
</div>

We ran the same task ("Write a LinkedIn post about diesel sales collapsing 47% YoY") through all three modes and against raw Claude. The treemap shows the result. Light delivers the best ratio of output quality to tokens burned. Medium and Heavy buy you marginal quality at non-linear cost. Raw Claude is the cheapest but ships the sycophancy bug straight to your audience.

---

## What the council actually contains

Ten character profiles. They do not name real people. They name perspectives. Each one is permitted, encouraged, and structurally required to disagree.

| Role | What they push back on |
|------|----------------------|
| **The Sceptic** | Overclaims, hype words, anything that sounds too good |
| **The End User** | Jargon, missing "what do I do Monday" guidance |
| **The Numbers Person** | Missing data, weak evidence, unverified stats |
| **The Contrarian** | Whatever the last reviewer just said |
| **The Veteran** | Patterns that have failed before in this domain |
| **The Optimist** | Where the opportunity is being undersold |
| **The Compliance Eye** | Legal, brand, privacy risk |
| **The Editor** | Tone, length, rhythm, AI tells |
| **The Strategist** | Whether this output even serves the goal |
| **The Outsider** | What an intelligent stranger would not understand |

For domain-specific tasks (automotive, design, finance) Council dynamically swaps in expert profiles for that domain.

---

## How Council compares

| | LangChain | CrewAI | AutoGen | Awesome Copilot | **Council** |
|---|---|---|---|---|---|
| Install time | Hours | 30 min | Hours | 5 min | **30 sec** |
| Requires Python | Yes | Yes | Yes | No | **No** |
| Requires config files | Yes | Yes | Yes | No | **No** |
| Fights sycophancy | No | No | No | No | **Yes** |
| Human-perspective review | No | No | No | No | **Yes** |
| Quality gate before output | No | No | No | No | **Yes** |
| Cost predictable upfront | No | No | No | N/A | **Yes** |
| For non-coders | No | No | No | Partial | **Yes** |

LangChain gives you pipes. CrewAI gives you roles. Awesome Copilot gives you prompts. **Council gives you the disagreement nobody else built.**

---

## A real example

**Task:** Write a LinkedIn post announcing 47% YoY diesel sales collapse across 5 European markets.

**Raw Claude draft:**
> Diesel is dying. Our Q1 2026 data across 5 markets shows a 47% YoY collapse and the implications for dealerships are massive...

**Council pushback (visible to you):**
- Sceptic: "dying" is overclaim, soften
- End User: no "what do I do" guidance for the dealer reading this
- Numbers Person: missing per-market split, weakens credibility
- Editor: "implications are massive" is filler

**Council final output:**
> Diesel sales fell 47% YoY across UK, Ireland, Germany, France, and Netherlands in Q1 2026. Three things this changes for your dealership floor this quarter:
>
> 1. Reallocate diesel demo stock to certified pre-owned by week 4
> 2. Retrain your finance desk on EV battery warranty language
> 3. Move 30% of Q2 marketing spend from diesel SKUs to hybrid
>
> Full per-market breakdown: [link]

Full transcript in [examples/linkedin-post.md](examples/linkedin-post.md).

---

## Why this gets stars

Three reasons, in order of importance.

**1. It solves a problem every Claude user has.** Confident wrong AI output is the universal pain. Nothing else on the marketplace structurally fights it.

**2. It installs and works in 60 seconds.** No infrastructure. No learning curve. One command, one question, output.

**3. It is the first multi-agent system designed for people who cannot code.** CrewAI, LangGraph, AutoGen all require Python. Council requires Claude Code, which you already have.

---

## File structure

```
council/
├── skills/
│   ├── clone/SKILL.md       The orchestrator that runs the show
│   ├── bod/SKILL.md         The 10 reviewer profiles + disagreement logic
│   └── intake/SKILL.md      The Light/Medium/Heavy router
├── examples/
│   └── linkedin-post.md     Full before-and-after transcript
├── assets/
│   └── *.svg                Diagrams used in this README
└── docs/
    ├── how-it-works.md      Deeper architecture explanation
    └── bod-profiles.md      Full reviewer profile library
```

---

## Roadmap

**v1 (now)** Council standalone. Light, Medium, Heavy. Memory of preference.
**v2** Wrapper mode. Council intercepts output from any other Claude skill you have installed and runs the disagreement gate on top.
**v3** Full team mode. Ten employee specialists (Engineer, Designer, Writer, Researcher, etc.) that Council can delegate to for complex multi-step tasks.

---

## FAQ

**Does Council send my data anywhere?**
No. Council runs entirely inside Claude Code on your machine. Nothing leaves.

**Will it slow me down?**
Light mode is 30 seconds. Faster than reviewing a bad draft and rewriting it.

**Can I see what the council said?**
Yes. Every output ships with a one-line summary of what got changed. Want the full debate transcript? Add `--verbose`.

**Does it work with my other Claude skills?**
v1 runs standalone. v2 will wrap any other skill.

**Why not just prompt Claude to "be critical"?**
Tried. Tested. Documented [here](docs/how-it-works.md#why-prompts-alone-fail). One-shot critical prompts collapse back to agreement within 3 turns. Council is structurally enforced, not prompt-engineered.

---

## License

MIT. Fork it. Ship it. Tell us what you built.

---

<div align="center">

**Built because confident wrong AI output is the single biggest threat to people doing real work with Claude.**

If this saves you one bad ship, star the repo.

</div>
