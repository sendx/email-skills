# Email Marketing Skills for AI Agents

AI agent skills for email marketing. Deliverability, compliance, copywriting, automation, analytics, and growth. Built for marketers who want Claude (or any AI agent) to actually know what it's talking about when it comes to email.

Works with Claude Code, Claude.ai Projects, OpenAI Codex, Cursor, Windsurf, and any agent that supports markdown skills.

Built by the team at [SendX](https://sendx.io) (email marketing platform) and [SendPost](https://sendpost.io) (email infrastructure API). We've helped companies send billions of emails. These skills capture what we've learned.

**Contributions welcome!** Found a way to improve a skill or have a new one to add? [Open a PR](#contributing).

## What are skills?

Skills are markdown files that give AI agents specialized knowledge for specific tasks. Add one to your project and your agent knows the difference between a soft bounce and a hard bounce, can plan an IP warmup schedule, or write a subject line that doesn't end up in spam.

No coding. No setup beyond copy-paste (or a one-liner install). Just better answers about email.

## How skills work together

Every skill is standalone, but they cross-reference each other. The `deliverability-guide` skill might point you to `email-deliverability-expert-skill` for deeper diagnosis. The `campaign-strategy` skill references `smart-segmentation` when your targeting needs work.

```
                         ┌─────────────────────────────────────┐
                         │       Your Email Program            │
                         └──────────────────┬──────────────────┘
                                            │
         ┌──────────────┬───────────────────┼───────────────────┬──────────────┐
         ▼              ▼                   ▼                   ▼              ▼
   ┌──────────┐   ┌──────────┐       ┌──────────┐       ┌──────────┐   ┌──────────┐
   │ Strategy │   │ Content  │       │  Mail    │       │  Growth  │   │  Ops &   │
   │          │   │  & Copy  │       │  Infra   │       │          │   │  Intel   │
   ├──────────┤   ├──────────┤       ├──────────┤       ├──────────┤   ├──────────┤
   │campaign- │   │email-    │       │deliver-  │       │list-     │   │email-    │
   │strategy  │   │copywritng│       │ability-* │       │growth-   │   │analytics │
   │ab-testing│   │industry- │       │complianc-│       │engine    │   │ESP-hard- │
   │smart-    │   │playbooks │       │navigator │       │workflow- │   │bounce-   │
   │segment   │   │          │       │ESP-*     │       │automtion │   │unlock    │
   │workflow- │   │          │       │infra/    │       │api-camp- │   │ESP-mali- │
   │automtion │   │          │       │deliv-aud │       │builder   │   │cious     │
   └────┬─────┘   └────┬─────┘       └────┬─────┘       └────┬─────┘   └────┬─────┘
        │              │                   │                  │              │
        └──────────────┴─────────┬─────────┴──────────────────┴──────────────┘
                                 │
                  Skills cross-reference each other:
                  campaign-strategy ↔ smart-segmentation
                  deliverability-guide ↔ email-deliverability-expert-skill
                  email-copywriting ↔ ab-testing ↔ email-analytics
                  workflow-automation ↔ smart-segmentation ↔ list-growth-engine
```

## Available skills

| Skill | Description |
| --- | --- |
| [ab-testing](skills/ab-testing) | Run email A/B tests that produce measurable results and guide future campaign decisions. |
| [api-campaign-builder](skills/api-campaign-builder) | Create, schedule, and manage HTML email campaigns through the SendX REST API. |
| [campaign-strategy](skills/campaign-strategy) | Pick the right SendX campaign type for any email marketing situation. |
| [compliance-navigator](skills/compliance-navigator) | Navigate email privacy laws and stay compliant worldwide. |
| [deliverability-guide](skills/deliverability-guide) | Master email authentication, reputation, and list hygiene to keep emails in the inbox. |
| [email-analytics](skills/email-analytics) | Understand what your email metrics mean and know what action to take based on the numbers. |
| [email-copywriting](skills/email-copywriting) | Write subject lines, preview text, and body copy that gets opened, read, and clicked. |
| [email-deliverability-expert-skill](skills/email-deliverability-expert-skill) | Diagnose and fix email deliverability problems using SendX's proven methodology. |
| [ESP-hardbounce-unlock](skills/ESP-hardbounce-unlock) | Hard bounce unlock request evaluation for ESP accounts. |
| [ESP malicious-behavior-SKILL](skills/ESP%20malicious-behavior-SKILL) | Identify and investigate malicious sending behavior on your ESP. |
| [industry-playbooks](skills/industry-playbooks) | Implement proven email strategies tailored to your industry using SendX features built for your business type. |
| [infrastructure/deliverability-audit](skills/infrastructure/deliverability-audit) | Full audit of an email program's deliverability setup. Finds problems, explains fixes in plain English. |
| [list-growth-engine](skills/list-growth-engine) | Grow your email list using popups, forms, and landing pages with trigger strategies and lead magnets. |
| [smart-segmentation](skills/smart-segmentation) | Organize your list with segments and tags so the right people get the right email at the right time. |
| [workflow-automation](skills/workflow-automation) | Build multi-step email sequences that respond to customer actions automatically. |

## Skill categories

### Deliverability & Infrastructure
`deliverability-guide` · `email-deliverability-expert-skill` · `infrastructure/deliverability-audit` · `compliance-navigator`

### Campaign Strategy & Execution
`campaign-strategy` · `ab-testing` · `smart-segmentation` · `workflow-automation`

### Content & Copy
`email-copywriting` · `industry-playbooks`

### Growth & Acquisition
`list-growth-engine` · `api-campaign-builder`

### Analytics & Measurement
`email-analytics`

### ESP Operations
`ESP-hardbounce-unlock` · `ESP malicious-behavior-SKILL`

## Installation

### Option 1: CLI Install (Recommended)

```bash
# Install all skills
npx skills add sendx/email-marketing-skills

# Install specific skills
npx skills add sendx/email-marketing-skills --skill deliverability-guide email-copywriting

# List available skills
npx skills add sendx/email-marketing-skills --list
```

### Option 2: Claude Code Plugin

```bash
/plugin marketplace add sendx/email-marketing-skills
/plugin install email-marketing-skills
```

### Option 3: Claude.ai Projects (Non-technical)

This is the easiest path if you're not a developer.

1. Open [claude.ai](https://claude.ai) and create a new Project
2. Go to the skill you want (e.g., `skills/deliverability-guide/`)
3. Copy the contents of `SKILL.md`
4. Paste into your Project's custom instructions
5. Start chatting. Claude now has that expertise.

### Option 4: Clone and Copy

```bash
git clone https://github.com/nicksendx/email-marketing-skills.git
cp -r email-marketing-skills/skills/* .agents/skills/
```

### Option 5: Git Submodule

```bash
git submodule add https://github.com/nicksendx/email-marketing-skills.git .agents/email-marketing-skills
```

### Option 6: Fork and Customize

1. Fork this repo
2. Customize skills for your specific email setup
3. Clone your fork into your projects

## Agent compatibility

| Agent | How to use |
| --- | --- |
| **Claude Code** | Clone to `~/.claude/skills/` or use plugin install |
| **Claude.ai** | Copy SKILL.md contents into Project custom instructions |
| **OpenAI Codex** | Clone to `.agents/skills/` — reads AGENTS.md |
| **Cursor** | Clone to `.cursor/skills/` or `.agents/skills/` |
| **Windsurf** | Clone to `.agents/skills/` |
| **Any agent** | Copy SKILL.md into your agent's context or system prompt |

## Usage

Once installed, just ask your agent to help with email tasks:

```
"Why are my emails going to spam?"
→ Uses deliverability-guide + email-deliverability-expert-skill

"Write a welcome email sequence for new subscribers"
→ Uses workflow-automation + email-copywriting

"I need to warm up a new IP address"
→ Uses infrastructure/deliverability-audit + deliverability-guide

"What should my abandoned cart email say?"
→ Uses industry-playbooks + email-copywriting + campaign-strategy

"Our open rates dropped 40% this month"
→ Uses email-analytics + deliverability-guide
```

**Pro tip:** Start with the `infrastructure/deliverability-audit` skill. It'll tell you where your biggest problems are and which other skills to use next.

## Who built this?

These skills come from the team at **[SendX](https://sendx.io)** and **[SendPost](https://sendpost.io)**.

SendX is an email marketing platform built for growth teams. SendPost is the email infrastructure API that powers deliverability monitoring, IP warmup, and bounce processing under the hood.

We've been in the email business for years. These skills capture the patterns we see repeated across thousands of customers, the mistakes that destroy campaigns, and the specific strategies that consistently work.

### Why give this away?

Email marketing knowledge shouldn't be locked behind expensive consultants. Too many marketers are making avoidable mistakes because the good advice is buried in technical docs nobody reads.

And if these skills work for you, you might check out our products. The skills work with any email platform, but they work even better with ours.

**Using SendX?** The campaign strategy and copywriting skills are tuned for SendX's segmentation, automation, and reporting. [Try SendX free →](https://sendx.io)

**Running your own infrastructure?** The deliverability skills pair perfectly with SendPost's APIs. [Explore SendPost →](https://sendpost.io)

## Contributing

Found a way to improve a skill? Have expertise to share? PRs and issues welcome.

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

The short version: keep skills focused on one specific area, write for non-technical email marketers, include real numbers and thresholds, and test your skill in Claude before submitting.

## License

[MIT](LICENSE) — use these however you want.

---

*Built by the email team at [SendX](https://sendx.io) and [SendPost](https://sendpost.io).*