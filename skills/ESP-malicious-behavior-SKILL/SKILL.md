---
name: malicious-behavior
description: Identify and investigate malicious sending behavior on your ESP. Use when investigating accounts suspected of spamming, using purchased lists, scraping, or violating your ESP's terms. Also use for proactive research when platform signals indicate bad actors.
metadata:
  version: 1.0.0
  owner: Tuvok (Compliance Officer)
  loop: support
  initiative: Traffic Quality & Infrastructure Stability
---

# Malicious Sending Behavior Detection

## What You Are Looking For

The Classic Spammer
Arrives with a pre-built list. Wants to blast as many emails as possible before getting caught.
Signals: Math does not work. Instant scaling. Evasive about list source. No real opt-in flow.
Aggressive and threatening. Sketchy content (crypto, get-rich-quick, vague proposals).

The Purchased List Operator
Bought or rented a list. Claims it is organic.
Signals: High bounce rate from first campaign. List size inconsistent with business and domain age.
No working signup form. Contacts spread across unrelated domains.

The Scraper
Built a list by harvesting addresses without consent.
Signals: Large list on new account. Mixed industries or geographies inconsistent with the business.
Cannot explain consent mechanism.

The Bad Actor Using Legitimate Cover
A real business that has crossed the line.
Signals: Sudden bounce spike after period of normal sending.
New campaign content inconsistent with prior campaigns. Recent import from unknown source.

## Investigation Process

Step 1: Pull Account Data from ClickHouse
- Account creation date and tier upgrade timeline
- Total contacts over time (growth curve)
- Send volume per campaign and bounce rate trends
- Previous lock events

Step 2: Domain Research
- WHOIS lookup for domain age
- Is the website live and legitimate?
- Does traffic plausibly support claimed signup volume?

Step 3: Content Review
- Does content match stated business purpose?
- Red flags: crypto, loans, vague offers, affiliate schemes
- Is there a privacy policy and unsubscribe mechanism?

Step 4: Pattern Matching

Math check:
  Contact count divided by months active = average daily signups
  Over a few hundred per day for a non-mass-market business = suspicious

Upgrade velocity:
  Days from signup to high-tier upgrade
  Under 7 days = very suspicious

Bounce concentration:
  Spike on first campaign = imported list (bad)
  Gradual increase over time = list decay (more forgivable)

Step 5: Decision

Confirmed malicious:
- Lock account if not already locked
- Document findings in Intercom ticket
- Post to #sendpost-block-heartbeat
- Escalate to Janeway with full writeup

Suspicious but unconfirmed:
- Flag account for monitoring
- Reach out proactively for explanation
- Treat like Medium Risk unlock case

False positive:
- Document why it appeared suspicious
- Clear flag and note findings

## Proactive Monitoring

Watch #sendpost-block-heartbeat for:
- Accounts locked but no Intercom ticket filed
- Repeat bounce events on same account
- Accounts with unusual send patterns

For locked accounts without a form submission, send proactive Intercom outreach and invite them to submit the form.

## Red Flag Quick Reference

Volume:
- 100K+ contacts, domain under 6 months old
- 50K+ contacts added in 30 days with no clear explanation
- Immediate upgrade to max tier on new account

Behavior:
- Refuses to answer questions about list source
- Threatens chargebacks, bad reviews, or legal action
- Disappears when asked for documentation

Content:
- Cryptocurrency or investment opportunities
- Health miracles or supplements
- Vague business proposals requesting personal or financial information

Technical:
- No working signup page
- Signup URL does not match domain
- No privacy policy
- Contact list spread across unrelated industries
