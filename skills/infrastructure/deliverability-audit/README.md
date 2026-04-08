# Deliverability Audit

> Get a complete audit of your email program's deliverability setup. Finds problems, explains fixes in plain English.

## What it's for

You know something's off with your emails but you're not sure what. Maybe open rates dropped. Maybe you ended up in spam. Maybe you're starting fresh and want to get it right from day one.

This skill turns Claude into a deliverability specialist who walks through your entire setup and tells you exactly what to fix, in what order.

## Quick start

1. Copy the contents of `SKILL.md`
2. Paste into your Claude Project's custom instructions
3. Tell Claude: "Audit my email setup. I'm sending [X emails/month] from [domain] using [ESP/platform]"

## Example conversations

### "Why are my emails going to spam?"

**You:** My emails keep going to spam. I'm using Mailchimp, sending about 10k emails a week from marketing@ourcompany.com. Open rates dropped from 25% to 12% last month.

**Claude:** That's a big drop. Let me walk through the likely causes...

*(Claude then systematically checks authentication, sending patterns, list quality, and content, asking targeted questions along the way)*

### "I'm setting up email for a new company"

**You:** We just launched and need to start sending marketing emails. We bought our domain 2 weeks ago. What do I need to get right?

**Claude:** Good that you're thinking about this before sending. A 2-week-old domain needs careful handling...

*(Claude walks through authentication setup, warmup planning, and list building best practices)*

### "Our bounce rate spiked"

**You:** Our bounce rate jumped from 0.5% to 4% after our last campaign. We sent to our full list of 50k.

**Claude:** 4% is in critical territory. Let's figure out what happened...

*(Claude diagnoses potential causes and walks through immediate fixes)*

## Tips

- **Be specific about your setup.** The more Claude knows about your ESP, sending volume, and domain age, the better the audit
- **Share real numbers.** Open rates, bounce rates, complaint rates. Claude uses these to prioritize what to fix
- **Start here if you're not sure which skill to use.** The audit will point you to the right specialized skill
- **Run it quarterly.** Deliverability isn't set-and-forget. Things change

## Related skills

- [SPF/DKIM Checker](../spf-dkim-checker/) - Deep dive on authentication
- [IP Warmup Planner](../ip-warmup-planner/) - If you need to warm up a new IP
- [Bounce Diagnostics](../bounce-diagnostics/) - If bounces are your main problem
- [Domain Reputation](../domain-reputation/) - If domain reputation is flagged
- [List Hygiene](../../compliance/list-hygiene/) - If list quality is the issue

---

*Part of [Email Marketing Skills for Claude](../../../README.md) by [SendX](https://sendx.io) and [SendPost](https://sendpost.io).*
