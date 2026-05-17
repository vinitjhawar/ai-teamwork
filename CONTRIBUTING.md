# Contributing to Open Council

Three ways to help, in order of impact.

## 1. Add a board profile

The board ships with ten default profiles in [docs/bod-profiles.md](docs/bod-profiles.md). New profiles are welcome, especially domain experts (medical, legal, automotive, climate, etc.). To add one:

1. Open `docs/bod-profiles.md`.
2. Add your profile in the same shape as the existing ten: emoji, lens, reflexes, veto level, typical flag.
3. Open a PR titled `profile: <name>`.

Profile PRs are merged fast if they pass three rules:
- The profile is genuinely distinct from the existing ten (no near-duplicates).
- The veto level matches the kind of mistake it catches (hard for safety, soft for taste).
- The "typical flag" reads like a real critique, not a description of one.

## 2. Add a worked example

Real before-and-after transcripts in `examples/` are the most persuasive part of this repo. Anyone shipping a opencouncil-reviewed output for real work can contribute one. Use [examples/linkedin-post.md](examples/linkedin-post.md) as the template. Anonymise anything sensitive.

## 3. Report a sycophancy escape

If the board approved an output that turned out to be wrong, open an issue with the label `escape`. Include:
- The original prompt.
- The board's verdict and reasoning.
- The actual failure mode.
- Which profile *should* have caught it.

Every escape is a chance to refine a profile or add a new one.

## What not to send

- Generic "make it more agentic" PRs. The product is the disagreement layer, not orchestration breadth.
- Profile PRs whose reflexes overlap an existing profile by more than half. We will close them with a note about which existing profile to extend instead.
- Anything that adds dependencies. Open Council is intentionally zero-install beyond Claude Code.

## House style for any markdown change

- No em dash or en dash. Use comma, period, colon, or parentheses.
- Plain words. Short sentences.
- Lowercase headings except where proper nouns appear.
- No emojis except inside the board profile cards.
