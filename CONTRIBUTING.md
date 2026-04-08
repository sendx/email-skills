# Contributing

Thanks for wanting to contribute. Here's how.

## Before you start

Check the existing skills first. If something similar exists, improve it rather than creating a new one. There are 15 skills across deliverability, compliance, campaigns, copywriting, growth, analytics, and ESP operations.

## Creating a new skill

1. Fork the repo
2. Create `skills/<your-skill-name>/SKILL.md`
3. Follow the format in [SKILL_TEMPLATE.md](SKILL_TEMPLATE.md)
4. Run `./validate-skills.sh` to check your frontmatter
5. Test your skill by pasting the SKILL.md into a Claude project and running through several real scenarios
6. Write a clear PR description explaining what the skill does and why it's useful
7. Submit a PR

## Quality bar

Your skill should:

- **Focus on one thing.** "Email marketing" is too broad. "Cleaning bounce lists" is right.
- **Work for non-technical people.** Our audience is email marketers, not developers.
- **Include real numbers.** "Your bounce rate should stay under 2%" beats "keep your bounce rate low."
- **Be tested.** If you haven't used it in Claude and verified it gives good advice, it's not ready.
- **Stand alone.** Don't require other skills to work. Cross-references are fine, dependencies aren't.

## Improving existing skills

Found something wrong or incomplete? Great.

- Small fixes (typos, unclear wording): just submit a PR
- Bigger changes (new sections, different approaches): open an issue first so we can discuss

## Skill naming

- Folder names: lowercase, hyphens, no spaces (e.g., `smart-segmentation`)
- The skill file inside is always `SKILL.md`
- Reference material goes in a `references/` subfolder if needed

## Writing style

- Plain English, no jargon without explanation
- Use contractions (you're, don't, can't)
- Short sentences when possible
- Real benchmarks and thresholds over vague advice
- Match the tone of the existing skills

## Questions?

Open an issue or email hello@sendx.io.
