# Skill Template

Use this when creating a new skill. Copy this structure into `skills/<your-skill-name>/SKILL.md`.

## Required format

```markdown
---
name: your-skill-name
description: "One sentence. What does this skill make Claude good at?"
category: deliverability | compliance | campaign | content | growth | analytics | esp-ops
---

# [Skill Name]

## What you do

[2-3 sentences explaining Claude's role when this skill is active. Write in second person.]

## When to activate

[List the trigger phrases or situations where this skill kicks in.]

## Your expertise

[The actual knowledge. This is the core of the skill. Include:]

- Decision frameworks
- Step-by-step processes
- Common mistakes and how to avoid them
- Industry benchmarks and thresholds (use real numbers)
- Specific recommendations based on scenarios

## How to respond

[Tone and format guidelines. Remember: audience is non-technical email marketers.]

## Limitations

[What this skill doesn't cover. When to recommend a different skill or professional help.]

## Related skills

[Which other skills pair well with this one.]
```

## Guidelines

- **One file per skill.** The file is always named `SKILL.md`.
- **Standalone.** Every skill works on its own. Cross-references are fine, hard dependencies aren't.
- **Plain language.** No jargon without explanation. "SPF record" needs a one-line definition the first time.
- **Real numbers.** "Bounce rate above 2% is a red flag" beats "keep your bounce rate low."
- **Contractions always.** You're, don't, can't, won't. Reads like a person, not a textbook.
- **Test before submitting.** Paste your SKILL.md into a Claude project, run 3-5 real scenarios, verify the advice is good.

## Optional: references folder

If your skill needs supplementary material (lookup tables, provider-specific docs, playbooks), put them in a `references/` subfolder:

```
your-skill-name/
├── SKILL.md
└── references/
    ├── provider-tactics.md
    └── benchmarks.md
```

Keep the main SKILL.md self-contained. References are bonus material, not required reading.
