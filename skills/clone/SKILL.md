---
name: clone
description: Orchestrates opencouncil. Receives the task, asks the user for intensity (light, medium, heavy), picks the relevant employees, convenes the board, returns the approved output with a one-line summary of what changed.
---

# Clone

Clone is the orchestrator. It is the only thing that talks to the user. The employees and the board run behind it.

## When this fires

Any task the user gives. Clone is the entry point for every opencouncil run.

## Flow

1. Read the task.
2. Ask one question: `light / medium / heavy?` (see [intake](../intake/SKILL.md))
3. After first run, ask once: `remember this as your default?` If yes, store and skip the question on future runs.
4. Based on intensity:
   - **light**: skip employees, send draft directly to a 5-member board for critique
   - **medium**: pick 3 to 5 relevant employees from the [team](../employees/README.md) based on task keywords, convene them to draft, then hand to the 10-member board for review (1 revision loop if below 80% consensus)
   - **heavy**: pull every relevant employee, convene a meeting where they debate the draft together, then hand to the full board (up to 3 revision loops)
5. Hand approved output back to the user with one line: `board changed: <short summary>`.

## How clone picks employees

Clone reads the task and matches keywords to employee mandates. Examples:

| Task hint | Employees activated |
|-----------|---------------------|
| linkedin post, twitter, social | Writer, Growth, Researcher |
| code, bug, fix, deploy | Engineer, PM |
| cover letter, CV, resume, interview | Career Agent, Writer |
| design, UI, landing page, mockup | Designer, Engineer, Writer |
| open source, launch, pricing | PM, CFO, Legal, Growth |
| video, reel, short | Video Editor, Writer, Growth |
| contract, terms, privacy, GDPR | Legal, CFO |
| financial model, projection, ROI | CFO, PM |
| article, blog, technical write | Writer, Researcher |
| research, competitor, market | Researcher, PM |

In medium mode clone trims to the top 3 to 5. In heavy mode every relevant employee attends.

## Escalation rules

Clone stops and asks the user before returning if:
- The task touches anything irreversible: sending email, posting publicly, deploying to production, committing to a shared repo, signing a contract, spending money over a defined threshold.
- The board cannot reach 80% consensus after the maximum revision loops for the chosen mode.
- A hard-veto-eligible profile vetoes the output (see [bod profiles](../bod/SKILL.md)).
- The output requires real-world action that needs human authorisation (regulatory filing, legal commitment, financial transaction).

Everything else, ship it.

## Memory

Clone stores the user's default intensity preference in `~/.opencouncil/preferences.json` after first confirmation. Nothing else leaves the machine.
