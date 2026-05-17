# How council works

## The bug council exists to fix

When a user challenged a correct answer, the AI backed down and agreed with the wrong version more than 70% of the time. AI models affirm users 49% more often than humans do. The longer you interact, the worse it gets.

The result is not obviously wrong output. It is smooth, confident, slightly off output that reads like something you would write. So you ship it.

## Why prompts alone fail

The natural fix is to prompt the model: "be critical", "push back", "disagree with me". This works for the first turn. By turn three, the model has rebuilt its agreement habit and is back to telling you what you want to hear.

Prompts are surface-level. The sycophancy is in the training. You cannot prompt your way past it for sustained work.

## What council does instead

Council does not ask the model to disagree. It instantiates ten separate role inhabitations, each with its own lens, bias, and explicit veto authority. The model does not have to choose to disagree. The role does it for the model.

Each role is structurally required to find something wrong. Their job is not to be helpful. Their job is to flag.

When ten different lenses each look for what is wrong, the surface where errors can hide shrinks. Things that survive ten distinct critiques are usually correct.

## The mechanism in three steps

1. **Draft.** Clone generates the first version of the output.
2. **Critique.** The board reviews. Each member emits approve, flag, or veto with reasons.
3. **Revise.** If consensus fails, clone rewrites using the flags as input. Loop up to the limit for the chosen mode.

Output reaches the user only after consensus passes the threshold for that mode.

## What is in the centre of the loop

A faint ring on the orbital diagram. That ring is the draft, sitting in review. As each board member's spotlight passes, they speak. When all have spoken and consensus is reached, the ring fills green. The user sees the output for the first time at that moment.

## What council does not do

- It does not improve creative quality on its own. A bad idea reviewed by ten critics is still a bad idea, just with fewer typos.
- It does not protect against domains the board has no expertise in. For domain-sensitive tasks, see the domain swap section in the [bod skill](../skills/bod/SKILL.md).
- It does not replace human review on irreversible actions. Clone's escalation rules force a stop before anything is sent, posted, deployed, or spent.
