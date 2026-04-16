# Email Marketing Skills

A collection of AI agent skills for email marketing, built by SendX and SendPost.

## Repo structure

- `skills/<skill-name>/SKILL.md` — each skill is a standalone markdown file
- All skills are flat: `skills/<skill-name>/SKILL.md`
- Categories are organizational labels in the README, not filesystem directories

## Skill format

Every SKILL.md has YAML frontmatter:
```yaml
---
name: skill-name
description: "One sentence description"
category: deliverability | compliance | campaign | content | growth | analytics | esp-ops
---
```

Followed by the skill instructions in markdown.

## How skills work

Each skill gives the agent specialized knowledge for one email marketing task. Skills reference each other by name (e.g., "see the `deliverability-guide` skill for more on authentication").

The `email-deliverability-expert-skill` includes a `references/` folder with supplementary docs: provider-specific tactics, shared pool management, and a warmup playbook.

## Key context

- **SendX** = email marketing platform (campaigns, automation, segmentation, analytics)
- **SendPost** = email infrastructure API (IP management, bounce processing, deliverability monitoring)
- Target audience for skills = non-technical email marketers
- Skills should use plain language, avoid jargon, include real benchmarks and thresholds
- Every claim should be actionable: "your bounce rate is above 2%" beats "your bounce rate is high"

## Available skills

- `ab-testing` — Email A/B testing
- `api-campaign-builder` — SendX API campaign management
- `campaign-strategy` — Campaign type selection
- `compliance-navigator` — Email privacy law compliance
- `deliverability-guide` — Authentication, reputation, inbox placement
- `email-analytics` — Metric interpretation and actions
- `email-copywriting` — Subject lines, preview text, body copy
- `email-deliverability-expert-skill` — Advanced deliverability diagnosis (has references/)
- `esp-hardbounce-unlock` — Hard bounce unlock evaluation
- `esp-malicious-behavior` — Malicious sender investigation
- `industry-playbooks` — Vertical-specific email strategies
- `deliverability-audit` — Full deliverability audit
- `list-growth-engine` — List building with popups, forms, lead magnets
- `smart-segmentation` — List segmentation and targeting
- `workflow-automation` — Automated email sequences

## Adding a new skill

1. Create `skills/<skill-name>/SKILL.md`
2. Follow the format in `SKILL_TEMPLATE.md`
3. Run `./validate-skills.sh` to check frontmatter
4. Test the skill in Claude before submitting
