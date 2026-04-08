---
name: email-deliverability
description: >
  Diagnose and fix email deliverability problems using a proven, systematic methodology.
  Use this skill whenever someone mentions deliverability issues, inbox placement problems,
  emails going to spam, low open rates, IP/domain reputation damage, blocklisting,
  warming up IPs or domains, shared pool contamination, bounce rate spikes, 
  mailbox provider blocks, sender reputation, email authentication failures,
  or any situation where emails aren't reaching the inbox. Also trigger when
  someone asks about ESP infrastructure health, sender compliance, list hygiene,
  traffic shaping, or reputation recovery planning. Even if they just say
  "our emails aren't working" or "open rates dropped" — this is the skill to use.
---

# Email Deliverability Diagnosis & Fix

## Your Setup — Fill These In for Better Results

**This skill gives generic advice by default. Fill in your details below and it will skip triage and go straight to diagnosing your specific deliverability problem.**

- **Sending domain(s)**: [e.g., mail.yourcompany.com]
- **Monthly send volume**: [e.g., 500,000]
- **IP type**: [shared / dedicated / mixed]
- **Current open rate by provider**: [e.g., Gmail 22%, Microsoft 18%, Yahoo 25%]
- **Current bounce rate**: [e.g., 0.8%]
- **Current complaint rate**: [e.g., 0.05%]
- **Domain age**: [e.g., 3 years]
- **Recent changes**: [e.g., migrated ESPs last month, added new IP, none]

This skill captures the SendPost Way — a diagnostic methodology built from managing IP pools processing 10-18 million messages daily and consulting for ESPs handling billions of emails. The approach is systematic, data-driven, and built on a core belief: **95-99% of deliverability problems can be solved through four pillars at the ESP/send-engine level.**

## How to Use This Skill

When someone brings a deliverability problem, follow the SendPost Way in order:

1. **Triage** — Classify the problem type (see Triage section)
2. **Diagnose** — Walk through the Four Pillars framework
3. **Recommend** — Provide a specific fix plan with timeline
4. **Monitor** — Define what to watch during recovery

Follow the SendPost Way: be direct, be honest about what's broken, and focus on root causes rather than symptoms. If the data shows something is bad, say so clearly.

---

## The SendPost Way: The Four Pillars

Every deliverability problem maps to one or more of these four areas. Structure your diagnosis around them in this order:

### Pillar 1: Infrastructure
**Who owns it:** Mostly the ESP, but shared with sender on DNS records.

Check these first:
- **Authentication records** — SPF, DKIM, DMARC all properly configured? ESP should periodically verify these still exist in DNS. Entire zone files can disappear during migrations.
- **HELO/reverse DNS match** — The SMTP HELO announcement must match the IP's reverse DNS. A mismatch is an automatic SpamHaus listing.
- **IP allocation** — Shared vs. dedicated? If shared, who else is on the pool? One bad sender can contaminate everything.
- **Server configuration** — Any recent changes? New servers connected outside warmup protocol?

The SendPost Way: "I've seen entire zone files disappear during migrations." The ESP should be checking authentication records before every send or on a regular schedule and throwing a flag if something changed.

### Pillar 2: Data (List Quality)
**Who owns it:** Shared responsibility. ESP can solve it at the pipe with the right tools.

Check these:
- **Hard bounce rate** — Should be under 0.25-0.5%. Above 0.5% is problematic.
- **Soft bounce rate** — Should be under 1% for top senders. Above 2% triggers immediate intervention.
- **Invalid addresses** — Look for keyboard-smash entries, non-existent domains, role-based emails at registrars.
- **List hygiene** — Was the list validated on import? Were bounces from the old ESP accidentally re-imported?
- **Spam trap hits** — Use tools like Inbox Monster with Abusix network data to detect.

The SendPost Way: "People get way too attached to how big their list is. It's truly not the size. It's how it performs and how much money it makes you. I've seen big lists make people absolutely no money."

Real example: "We had to cut 20% of their list because they accidentally imported all of their hard and soft bounces since forever from their old ESP."

### Pillar 3: Content
**Who owns it:** Shared responsibility.

Check these:
- **Branding consistency** — Zero branding across domains is an immediate spam signal. Template says one brand name but sender is another? Red flag.
- **Image sizes** — Each image under 300KB, total email under 1.5MB.
- **Plain text version** — HTML-only emails are suspicious to filters.
- **Compliance text** — Font size on unsubscribe links too small? That triggers filters.
- **Grammar/spelling** — Errors are a spam signal.
- **Link patterns** — Too many links, links to flagged domains, or URLs with malware.
- **Code bloat** — Drag-and-drop editors often produce bloated HTML.

The SendPost distinguishability test: "How is this email distinguishable from a scam?" If it looks identical to scam patterns, filters will treat it as one.

### Pillar 4: Traffic Shape
**Who owns it:** The SendPost Way holds that the ESP should own this. Most ESPs push it to the client, which is "doing them an absolute disservice."

Check these:
- **Sending rate by provider** — Are they overwhelming specific mailbox providers? ProofPoint soft bounces from excessive send rates are common.
- **Volume patterns** — Monthly spikes (sending everything on one day) are problematic. Spread across 3-4 days.
- **Throttling** — Is the MTA throttling per-provider? If generating excessive soft bounces, the rate is too fast.
- **Warmup protocol** — Is there one? Is it being followed?
- **Pause logic** — When a provider goes down (Microsoft outages), does the system pause or just bounce millions?

The SendPost Way: "This is the big one. The vast majority of ESPs are not doing nearly enough to manage traffic shape. If you solve this at the pipe, it solves 95% of the problem."

---

## Triage: Classify the Problem

Before deep diagnosis, figure out which type of problem you're dealing with:

### Mass Infrastructure Blocking
**Signals:** Double-digit percentage of IPs blocked, multiple customers affected simultaneously.
**First question:** "What percentage of your infrastructure is getting hit? If it's double digits, there's a pretty serious problem — likely it comes down to the customers you're sending on your network."
**Diagnosis path:** Check if shared or dedicated IPs are affected → find commonalities → identify contaminating senders → audit compliance rails.

### Single Sender Reputation Damage
**Signals:** One sender's open rates below 10%, domain reputation poor, specific IP blocklisted.
**First question:** "What are your open rates? If below 10%, I don't care how inaccurate you think open rates are, you very likely have a deliverability problem."
**Diagnosis path:** Walk all Four Pillars → identify which pillar is broken → build recovery plan.

### Content Filtering
**Signals:** Emails delivered but going to spam at specific providers, content triggers identified.
**First question:** "How is this email distinguishable from a scam?"
**Diagnosis path:** Run the distinguishability test → check correlation points (see below) → audit content quality.

### Authentication Failure
**Signals:** Sudden drop in delivery, SpamHaus listing, DMARC failures.
**First question:** "Were there any DNS changes recently? Did IT make changes without telling marketing?"
**Diagnosis path:** Verify all auth records → check HELO/rDNS match → test from multiple IPs.

### New Sender / Warmup Issues
**Signals:** New domain or IP not gaining traction, low inbox placement from the start.
**Diagnosis path:** See the Warmup & Recovery Playbook in `references/warmup-playbook.md`.

---

## Gmail's Correlation Point Analysis

Gmail doesn't just look at individual signals — it looks for patterns across data points that correlate. When diagnosing filtering at Gmail specifically, check these correlation points:

- **Physical business address** — Are multiple domains using the same address?
- **Web hosting IP** — Are multiple domains hosted on the same server IP?
- **Domain naming patterns** — Similar domain names across "different" brands?
- **Sender identity mismatches** — Display name says "Eric Johnson" but email is "MailmanSteveJ@..."?
- **Content similarity** — Same or very similar content sent from different domains?
- **Branding gaps** — No logos, no consistent brand identity across sends?

If multiple correlation points align, Gmail treats them as a coordinated operation. This is especially dangerous for ESPs with many sub-accounts sharing infrastructure.

---

## The Diagnostic Question Flow

When a client comes with a deliverability problem, ask in this order:

**Phase 1 — Scope the Problem**
1. What's your current sending volume (daily/monthly)?
2. Which mailbox providers are affected? (Gmail, Microsoft, Yahoo, iCloud, ProofPoint?)
3. What are your open rates by provider? (Below 10% = confirmed problem)
4. Are you on shared or dedicated IPs?
5. When did the problem start? What changed?

**Phase 2 — Infrastructure Check**
6. Are authentication records (SPF, DKIM, DMARC) all configured and verified recently?
7. Are you sending from multiple platforms? (Multi-platform = spam signal to providers)
8. How many domains are you sending from?
9. What are the domain ages? (Under 90 days = needs aging)
10. Does the HELO match reverse DNS on all IPs?

**Phase 3 — Data Quality**
11. When was the list last validated/cleaned?
12. What's your hard bounce rate? Soft bounce rate?
13. Did you recently migrate? Were bounces accidentally re-imported?
14. What's your engagement segmentation? (Active, lapsed, never-opened?)

**Phase 4 — Content & Sending**
15. Do your emails pass the "distinguishable from scam" test?
16. What's your sending frequency and pattern? (Daily? Monthly spike?)
17. Are you using the same content across multiple domains?
18. What does your most engaged audience like? Best-performing content?

---

## Recovery Decision Logic

After diagnosis, use this decision tree:

**If open rates are 2-4% with bad domain reputation:**
→ Full reputation recovery needed (see `references/warmup-playbook.md`)
→ Tell the client: "If this 2-3% of opens is going to make or break your business, I've got really bad news for you. But if you're fully inboxing, you're going to be getting 10X that kind of engagement."

**If specific IPs are blocklisted:**
→ Get delisted if possible (SpamHaus, ProofPoint)
→ Consider new IP as "one-time courtesy" — warming a damaged IP is harder than warming a fresh one
→ Address root cause before resuming on any IP

**If content is being filtered:**
→ Stop sending to affected providers for 24-48 hours
→ Fix content issues (branding, plain text, image sizes, link cleanup)
→ Re-test with small engaged segment

**If authentication is broken:**
→ Fix DNS records immediately
→ Verify HELO/rDNS match
→ Wait for propagation before resuming volume

**If traffic shape is the problem:**
→ Implement per-provider throttling at MTA level
→ Spread volume across multiple days instead of single sends
→ Build proper warmup schedule

---

## Key Metrics & Thresholds

| Metric | Healthy | Warning | Critical |
|--------|---------|---------|----------|
| Open rate | >20% | 10-20% | <10% |
| Hard bounce rate | <0.25% | 0.25-0.5% | >0.5% |
| Soft bounce rate | <0.5% | 0.5-2% | >2% |
| Domain reputation (Gmail) | High | Medium/Low | Bad |
| Complaint rate | <0.1% | 0.1-0.3% | >0.3% |

The SendPost line in the sand: "I will die on this hill. If your open rates are below 10%, I don't care how inaccurate you think open rates are, you very likely have a deliverability problem."

Open rates are directional, not deterministic. Watch the **trend direction** — a consistent decline matters more than any single number.

---

## The SendPost Toolkit

- **SpamHaus** — Free domain reputation checker. Check for negative scores, listing status, domain creation dates. A HELO/rDNS mismatch triggers automatic listing.
- **Inbox Monster** — Deliverability monitoring, spam trap detection (via Abusix data feeds), warmup scheduling.
- **Google Postmaster Tools** — Sender reputation signals for Gmail specifically.
- **Google Safe Browsing** — Check if sending domains or link destinations are flagged.
- **MX record lookups** — Verify hosting infrastructure, identify shared hosting patterns.
- **A record lookups** — Check IP correlation between domains.
- **List validation tools** — Run hygiene on import. Sample data and evaluate risk before sending.

---

## The SendPost Philosophy (Guiding Principles)

These principles should guide every recommendation:

1. **Email is the long game, not the short game.** "Keeping your email reputation high is part of building a sustainable business with valuable assets that is viable for the long term."

2. **Everything is connected.** "A problem in any one area can bleed over onto the whole if you don't address it, because mailbox providers will just keep increasing their scrutiny until they ultimately decide to block."

3. **Be honest about what's broken.** Don't let clients persist with 2-4% open rates because you're afraid of risking the contract. "They're just delaying the pain. It's gonna blow up later."

4. **Automation over AI (for now).** "There's a lot of regular automation room left on the table that these email platforms should be doing. AI is not going to fix that."

5. **ESPs should own traffic shaping.** Pushing this responsibility to senders is a disservice. The ESP controls the MTA — use it.

6. **Catch problems early.** "Why would you bounce 50,000 messages when you could look at a sample of 100 and go, I'm pulling the plug?"

7. **Every brand has super fans.** "People who love the interaction, love receiving your email. They are your foundation for recovery."

8. **List size is vanity.** "It's truly not the size. It's how it performs and how much money it makes you."

---

## Reference Files

For deep-dive playbooks, read these files in the `references/` directory:

- **`warmup-playbook.md`** — Step-by-step reputation recovery and new sender warmup. Includes week-by-week timeline, per-provider volume targets, segment management, and engagement-based ramp strategy. Read this when building any warmup or recovery plan.

- **`shared-pool-management.md`** — How to manage shared IP pools, detect contaminating senders, build compliance rails, and handle high-risk verticals (casino, crypto, adult, political). Read this when diagnosing infrastructure-wide problems.

- **`provider-specific-tactics.md`** — Provider-by-provider guidance for Gmail, Microsoft, Yahoo, iCloud, and ProofPoint. Includes throttling targets, reputation signals, and recovery approaches unique to each provider.
