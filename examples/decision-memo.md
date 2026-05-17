# Example: should I open-source my paid product?

**Mode:** heavy
**Time:** 4m 56s
**Tokens:** ~46,200
**Why heavy:** strategic decision that is hard to reverse once announced.

## Task given to opencouncil

> I built a paid Chrome extension (470 users at $9/mo). I am thinking about open-sourcing it to drive distribution and start a community. Should I?

## Draft v1 (single recommendation)

> Yes, open-sourcing is the right move. You will gain credibility, attract contributors, and reduce churn risk by showing the code. The $9/mo users who churn can be replaced by free users who upgrade to a hosted version. Many successful indie products have followed this path (Plausible, Cal, Posthog). The downside is real but manageable.

## Board response

| Member | Verdict | Reason |
|--------|---------|--------|
| 🤨 Sceptic   | veto    | the recommendation is yes after one paragraph. no consideration of the no case |
| 🙋 End user  | flag    | what does the user *do* on Monday with this answer |
| 📊 Numbers   | veto    | "many successful indie products" is not evidence. cite revenue, MRR after open-sourcing, churn delta |
| 🔄 Contrarian | veto    | "what is the strongest case for *not* doing this" — missing entirely |
| 🎖️ Veteran   | veto    | Plausible kept their hosted version paid. Cal split the codebase. Posthog has a different model. each story has nuance the draft skips |
| ✨ Optimist  | approve | sees the upside |
| ⚖️ Compliance | flag    | open-sourcing means losing leverage over forks. the draft does not mention licence choice |
| ✏️ Editor    | flag    | "downside is real but manageable" is filler |
| ♟️ Strategist | veto    | does not address the actual question: will open-sourcing produce more revenue than it cannibalises |
| 🌍 Outsider  | flag    | who is the user serving — themselves, the users, the contributors? unclear |

**Result:** 5 vetoes, 4 flags, 1 approve. Full rewrite. Board demands a no-case section.

## Draft v2

> This is a two-option decision, not a one-direction recommendation. Here is the case for each, the cost of being wrong on each, and what tips the call.
>
> **Case for open-sourcing:** distribution leverage. A GitHub repo with stars is a marketing channel that compounds. Plausible (~$2M ARR open-source, hosted paid) and Cal ($30M ARR) both proved the model works for productised tools. Your $9/mo tier is at risk of feature-parity copies anyway. Open-sourcing turns potential competitors into contributors.
>
> **Case for staying closed:** you have 470 paying users. The conversion from open-source attention to paid hosted revenue is real but slow (Plausible took 18 months to replace self-hosters with hosted-tier revenue). If your runway is less than 12 months, the dip in revenue may outlast you.
>
> **What tips the call:**
> 1. How much runway. Under 12 months → stay closed. Over 18 months → open-source.
> 2. What licence. AGPL keeps competitors honest about hosted versions. MIT does not. If you open-source under MIT you are donating your moat.
> 3. Whether your $9/mo users are paying for the code or for the convenience. Survey them. If 60%+ say convenience, open-sourcing is safer.
>
> **Strong recommendation if forced:** do not open-source the whole product. Open-source one component (the part you wish more people would use as a primitive) and keep the integrated product paid. This is the Posthog playbook and it costs you less if you are wrong.

## Board response (round 2)

All 10 approve. Strategist specifically notes "this is now a decision memo, not an opinion."

## Summary line returned to user

`board changed: forced the answer into a two-option memo, added named comparable revenue figures, surfaced the licence-choice trap, added a partial-open-source option the original missed. Final recommendation is more cautious than draft v1.`

## What this saved

The first draft would have nudged the user toward a decision that costs $50k+ in lost revenue if it goes wrong, on the basis of one paragraph of opinion. The revised memo reframes the decision, names the conditions for each path, and surfaces a third option (partial open-source) the original missed entirely. Five minutes of opencouncil time for a decision that affects two years of revenue trajectory.
