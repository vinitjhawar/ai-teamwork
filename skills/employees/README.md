# Your team

Ten employees that draft the work before the board reviews it. Each one is loaded with a curated stack of best-in-class Claude Code skills from the public ecosystem. They activate in **medium** and **heavy** modes only. Light mode skips them and goes straight to a 5-member board pass.

| | Role | Mandate |
|---|------|---------|
| 🛠️ | [Engineer](engineer/SKILL.md) | ships code that runs |
| 🎨 | [Designer](designer/SKILL.md) | kills the AI look |
| ✍️ | [Writer](writer/SKILL.md) | cuts filler before you do |
| 🔬 | [Researcher](researcher/SKILL.md) | brings the receipts |
| 🎬 | [Video Editor](video-editor/SKILL.md) | tightens every cut |
| 📈 | [Growth Strategist](growth/SKILL.md) | where the eyeballs are |
| 💰 | [CFO](cfo/SKILL.md) | is it worth the spend |
| 📋 | [Career Agent](career/SKILL.md) | your CV, your cover letter |
| ⚖️ | [Legal & Compliance](legal/SKILL.md) | where you could get sued |
| 📐 | [Product Manager](pm/SKILL.md) | what to build, why now |

## How they get loaded

Each employee SKILL.md ships with the install commands for its full skill stack (5-12 skills from the curated catalogue: vercel-labs, supabase, obra/superpowers, anthropics/skills, emilkowalski, kylezantos, sergebulaev, lawvable, alirezarezvani, and others). Run the install commands in your shell once and the employee is fully trained.

When you trigger ai-teamwork in medium or heavy mode, Clone picks the employees relevant to your task, convenes them, and they draft together. The Board reviews the draft. You see the verdict.

## Who activates when

Not every task needs all ten employees. Clone picks based on the task description:

- "write a LinkedIn post" → Writer, Growth, Researcher
- "fix this bug" → Engineer, PM
- "draft a cover letter" → Career Agent, Writer
- "design a landing page" → Designer, Engineer, Writer
- "should I open-source this" → PM, CFO, Legal, Strategist
- "edit this video" → Video Editor, Writer, Growth

In heavy mode, all relevant employees attend the meeting. In medium mode, Clone trims to the top 3-5.

## Adding a new employee

Open a PR with a new folder under `skills/employees/<name>/SKILL.md`. Follow the template of the existing ten. The board will review your PR like any other contribution.
