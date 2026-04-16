# Versions

## v1.0.1 — Marketplace & Layout Fix

- Added `.claude-plugin/marketplace.json` for `/plugin marketplace add` support
- Flattened `infrastructure/deliverability-audit` to `deliverability-audit` for consistent skill layout
- Updated all references across README, CLAUDE.md, AGENTS.md
- Fixed VERSIONS.md reference from nonexistent `manifest.json` to `marketplace.json`
- Removed orphaned `skills/infrastructure/` directory

## v1.0.0 — Initial Release

15 email marketing skills covering deliverability, compliance, campaign strategy, copywriting, automation, analytics, and ESP operations.

### Skills

- `ab-testing` — Email A/B testing
- `api-campaign-builder` — SendX API campaign management
- `campaign-strategy` — Campaign type selection
- `compliance-navigator` — Email privacy law compliance
- `deliverability-guide` — Authentication, reputation, inbox placement
- `email-analytics` — Metric interpretation and actions
- `email-copywriting` — Subject lines, preview text, body copy
- `email-deliverability-expert-skill` — Advanced deliverability diagnosis
- `esp-hardbounce-unlock` — Hard bounce unlock evaluation
- `esp-malicious-behavior` — Malicious sender investigation
- `industry-playbooks` — Vertical-specific email strategies
- `deliverability-audit` — Full deliverability audit
- `list-growth-engine` — List building
- `smart-segmentation` — List segmentation and targeting
- `workflow-automation` — Automated email sequences

### Repo files

- `CLAUDE.md` — Claude Code project context
- `AGENTS.md` — Codex/Cursor/Windsurf context
- `.claude-plugin/marketplace.json` — Plugin marketplace support
- `CONTRIBUTING.md` — Contribution guidelines
- `SKILL_TEMPLATE.md` — Template for new skills
- `validate-skills.sh` — Frontmatter validation script
