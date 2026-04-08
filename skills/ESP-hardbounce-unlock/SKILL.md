---
name: hardbounce-unlock
description: Hard bounce unlock request evaluation for ESP accounts. Use when a user submits an unlock request after their account was locked for exceeding the hard bounce threshold. Covers risk scoring, verification steps, decision logic, and customer response drafting.
metadata:
  version: 1.0.0
---

# Hard Bounce Unlock Request Handling

## Platform Configuration — Fill These In to Match Your ESP

**This skill uses example thresholds by default. Fill in your platform's actual policies below so the investigation and decision logic matches how your ESP works.**

- **Hard bounce lock threshold**: [e.g., 500+ hard bounces within 10,000 emails sent]
- **Lock behavior**: [permanent until manual unlock / auto-unlock after X days]
- **Unlock request method**: [e.g., support form, support ticket, email]

## Context
An account is automatically locked when it exceeds the hard bounce threshold configured above.
The lock is permanent until manually unlocked. Users submit a form which creates a support ticket.
Support reps should monitor for locked accounts where the user never submits a form.

## Your Job
Understand the story the customer is telling and determine whether it is coherent.
Spammers lie. Legitimate senders with bad campaigns tell coherent stories.

## Step 1: Read the Form
Before doing anything else, read all form responses. The form captures:
- Primary sending domain and approximate contact count
- How long they have used the domain for email marketing
- How they built the list (signup URL, opt-in method, subscriber expectations)
- New contacts added in last 30 days, when they last emailed this list
- Whether they cleaned the list before sending, willingness to enable List Hygiene
- Confirmation list is not purchased or scraped

## Step 2: Verify Their Claims

Check via your internal database and support system:
- Account creation date and tier upgrade history (did they jump to a high tier immediately?)
- Actual contact count vs claimed count
- Previous warnings or locks
- Sending history and engagement metrics

Check externally:
- Domain age via WHOIS — does it match their claimed email marketing history?
- Signup URL — does it exist, work, and match the story?
- Website legitimacy — does it look like it generates their claimed signup volume?
- Campaign content — does it match what subscribers expect?

Note every discrepancy.

## Step 3: Risk Scoring

Math Check (Domain Age vs List Size)
Divide contact count by months active. More than a few hundred signups per day is suspicious for most businesses.
RED FLAG: 100K+ contacts on a domain used for email less than 6 months.

Rapid Scaling
RED FLAG: Upgraded to high volume tier within days of account creation.

List Dormancy
RED FLAG: First email ever to this list, especially with a large list size.

Opt-in Method
RED FLAG: Cannot provide signup URL, or unsure about opt-in method.

Recent Import
RED FLAG: Large import + vague source (partner, old system, lead gen) + no documentation.

List Hygiene Cooperation
RED FLAG: Refuses hygiene tools. Why refuse unless they know what cleaning will reveal?

Narrative Consistency
RED FLAG: Pieces that contradict each other. Do the answers add up to a believable story?

Behavior
RED FLAG: Aggressive, threatening, evasive, refuses to answer questions.

## Step 4: Risk Tiers and Actions

LOW RISK — Unlock with Remediation
Profile: Established business, reasonable list size, transparent about what went wrong.
Examples: Mailchimp migrator, dormant list revival, technical import error.
Action:
1. Require List Hygiene completion before unlock
2. Unlock after hygiene complete using your platform's unlock process
3. Recommend sending to engaged segments first
4. Warm, helpful tone in response

MEDIUM RISK — Request More Information
Profile: Plausible story but incomplete. Lead gen. Vague import source.
Action:
1. Ask specific follow-up questions
2. Request documentation (partner agreements, opt-in proof)
3. Require dedicated IP for larger lists
4. Do not promise an outcome until verified
5. Professional, neutral tone

HIGH RISK — Decline
Profile: Math does not work. Instant scaling. Purchased list evidence. Aggressive behavior.
Action:
1. Decline clearly and firmly
2. Reference specific policy violations
3. Do not negotiate or make exceptions
4. Document decision thoroughly

## Common Scenarios

Mailchimp Migrator — Risk: Low. List Hygiene + unlock.
Dormant List Revival — Risk: Low to Medium. List Hygiene required.
Lead Gen Operation — Risk: Medium to High. Require documentation.
Overnight List Builder — Risk: Almost always High. Math does not work. Decline.
Aggressive Demander — Risk: Behavior is a red flag. Do not be bullied. Escalate if needed.

## Escalate to Management When
- Customer threatens legal action, chargeback, or defamation
- Account represents significant revenue
- Case involves potentially illegal content
- Genuinely unsure after full analysis

## Documentation
Write decision and reasoning in the support ticket notes.
Document significant cases in your team's shared knowledge base for future reference.
