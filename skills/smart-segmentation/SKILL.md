---
name: smart-segmentation
description: "Organize your list with segments and tags so the right people get the right email at the right time."
category: campaign-strategy
difficulty: beginner
---

# Smart Segmentation

## Your Setup — Fill These In for Better Results

**This skill gives generic advice by default. Fill in your details below and it will tailor engagement tiers, dormancy windows, and sunset timelines to your business.**

- **Industry**: [e.g., ecommerce, SaaS, non-profit, content/media]
- **List size**: [e.g., 25,000]
- **Sending frequency**: [e.g., 2x/week, daily, monthly]
- **Current open rate**: [e.g., 22%]
- **Current click rate**: [e.g., 3.5%]

## What you do

You're the traffic cop of your email list. With thousands of contacts in your database, you can't send everyone the same email—your product people care about features you don't mention to your support team, and new subscribers need onboarding while long-time subscribers need to be re-engaged. Segmentation is how you organize your list so the right person gets the right message. Without it, you're sending irrelevant email to everyone and wondering why engagement is low.

## When to activate

Activate this skill when you:
- Have more than 500 contacts and want to send targeted campaigns
- Notice people are unsubscribing after receiving irrelevant emails
- Want to know which segments are most engaged
- Are building your first email sequences and need to segment audiences
- Are trying to improve click rates and open rates (not just volume)
- Need to organize contacts by where they came from, what they bought, or how they behave

## Your expertise

### Lists vs. Tags vs. Segments: Know the difference

These three tools do different jobs. Use them wrong and you'll waste time.

**Lists**: Think of a list as a *subscription*. When someone joins your email list, they opt in to receive emails from that list. You can have multiple lists (Main List, Blog Subscribers, Webinar Attendees, Premium Members). Each list has:
- Double opt-in (person signs up, confirms email, *then* they're added). This makes sure you don't accidentally email typos or fake addresses.
- A confirmation email (lets people know they've subscribed, sets expectations).
- Per-list analytics (open rate, click rate, unsubscribe rate for that list specifically).

Use lists when you want separate audiences that don't mix. A "Blog Subscribers" list is different from a "Customers" list—different signup source, different content expectations.

**Tags**: Think of a tag as a *label*. It doesn't represent subscription; it represents a characteristic or action. You can have unlimited tags and assign them via CSV import, API, automation, workflows, or manually. Someone on your list can have 0 tags or 50 tags. Examples: "Viewed pricing page," "Downloaded guide," "Attended webinar 2024," "Customer – eCommerce," "High engagement," "Bounced email."

Use tags when you want to mark a specific behavior or attribute on a contact *within* a list. A customer can be tagged both "Purchased in 2024" *and* "High engagement" *and* "Attended webinar."

**Segments (Smart Lists)**: These are dynamic, rule-based groups. You set conditions, and SendX automatically adds/removes people as they match those rules. A segment is live—it updates in real time. 

Example segment: "Active customers who haven't opened email in 30 days." SendX finds everyone with the tag "Purchased in last 12 months" *and* zero opens in the last 30 days, and groups them together. Tomorrow, if someone from that group opens an email, they're automatically removed from the segment.

Use segments when you want to target based on *behavior* or *combinations* of data, not just static labels.

### The 8+ Condition Types: Build powerful segments

When you create a segment, you can filter by:

1. **List membership**: "Everyone on my Main List" or "Everyone except my Premium List."
2. **Tag membership**: "People tagged 'Customer' and 'High engagement'."
3. **Campaign engagement**: "People who opened my Black Friday email" or "People who never opened anything."
4. **Drip engagement**: "People currently enrolled in my onboarding sequence" or "People who completed it."
5. **Custom fields**: "People whose budget dropdown is set to $50K+, date field shows signup after Jan 1, etc."
6. **Custom events**: Business-specific events. Did someone trigger a "View premium content" event? Did they hit a "5 abandoned cart" event? Send them a custom email. (You define these schemas—they're flexible.)
7. **Contact source**: "People who came from Facebook ads" vs. "People who came from organic search."
8. **Unsubscribe reason**: "People who unsubscribed because 'too frequent' can be sent to your less-frequent list." (Use carefully.)

**AND/OR logic**: You can layer these. "Customers who opened the last email *and* downloaded the product guide" (AND). Or "People who viewed pricing *or* requested a demo" (OR). Combine them to get as specific as you need.

### A Starter Segmentation Framework: Build your first 5 segments

You don't need 50 segments. Start with these five—they cover 80% of email marketing needs:

**1. Engagement Tier: High, Medium, Low (based on SendX's engagement score)**

SendX automatically calculates an engagement score for every contact (usually a 0-100 number). It's based on opens, clicks, list tenure, and how recently they've engaged. Use it.

- **High Engagement** (score 70+): These people open your emails and click links. Send them frequently, experiment with advanced content, ask for feedback, try new formats.
- **Medium Engagement** (score 40-69): These people open sometimes. Send them your best content, don't oversaturate.
- **Low Engagement** (score below 40): These people barely interact. Either re-engage them with a specific sequence ("We miss you!") or sunset them (see Limitations).

Build segments for each tier using the engagement score field. Adjust the thresholds based on your industry and volume.

**2. Lifecycle Stage: Subscriber, Customer, Churned**

Where is someone in their journey with your company?

- **Subscriber only** (tagged "Email Subscriber" but no "Purchased"): Send educational content, build trust, soft sells. These people have expressed interest but haven't converted.
- **Customer** (tagged "Purchased"): Send product tips, exclusive offers, upsells. They've already said yes once.
- **Churned** (customer 12+ months ago, no recent purchase): Try a "We miss you" winback email. If no response in 60 days, move to sunset.

**3. Source Tracking: Where they came from**

Tag people when they sign up. Ads? Blog? Referral? Organic? This matters because channels tell you something about expectations.

- **Paid ads**: Typically more impatient, expect immediate value. Send a quick win upfront.
- **Blog**: Interested in education. Heavy on content, lighter on selling.
- **Referral**: Already trust someone who trusts you. Treat them like insiders.

Build a segment for each source and adjust your messaging tone.

**4. Interest/Product Area: What they care about**

If you sell multiple products or cover multiple topics, use tags and segments to split them.

- **Product A users** vs. **Product B users**: Send relevant tips for each.
- **Blog readers interested in growth** vs. **Blog readers interested in compliance**: Different segments, different content.

Use custom fields (dropdown) and tags to mark interests. Then build segments for each.

**5. Re-engagement Candidates: People who've gone dormant**

Define "dormant" based on your sending frequency:
- If you send weekly: 90 days with zero opens = dormant.
- If you send daily: 30 days with zero opens = dormant.

Create a segment called "Inactive 90 days" that targets these people. Build a win-back email series: "It's been a while—here's what you missed," etc. If they don't engage within another 30 days, move them to a sunset list (see Limitations).

### Putting it together: A segmentation workflow

1. **Week 1: Start with source and engagement**. Tag people based on where they signed up. Use SendX's engagement score to build high/medium/low segments. This alone helps.

2. **Week 2-3: Add custom fields**. Set up 2-3 custom fields that matter to your business (company size, industry, budget, product interest). Collect these on signup forms or import via CSV if you have historical data.

3. **Week 4: Build lifecycle segments**. Tag customers when they purchase. Tag partners, fans, beta testers—whatever matters. Use these tags to build segments.

4. **Ongoing: Track behavior with custom events**. If someone abandons a checkout, trigger a custom event "Abandoned checkout." Build a segment around it. If someone requests a demo, tag it and send a demo-specific nurture.

### MX-Based Segmentation: Deliverability trick

This is advanced but surprisingly useful: Segment by email provider domain (Gmail vs. Outlook vs. Yahoo vs. corporate).

Why? Different providers have different spam filters. Gmail users are used to heavy promotional email. Yahoo users are more conservative. Corporate emails (yourcompany.com) might need different messaging.

SendX can segment by MX domain. You could send a test campaign to a small Gmail segment, then roll it out more widely once you know it lands in the inbox (not spam).

Use this for A/B testing sender reputation and deliverability troubleshooting.

## How to respond

When someone asks "How do I segment my list?":

1. **Start with what you know**: Ask: Do you know where each subscriber came from? Do you track purchases? Do you know what people are interested in? Start there. Don't over-engineer.

2. **Recommend the three-tier setup**: 
   - **Lists**: One main list (for now). If you have vastly different audiences, consider a second one.
   - **Tags**: Add 5-10 tags that matter. Source (ads, blog, referral), status (subscriber, customer), interest (product A, product B).
   - **Segments**: Build 3-5 segments using those tags. Don't build more than you can manage in week 1.

3. **Connect segments to campaigns**: Ask: What are you trying to achieve? "Reactivate inactive people?" Build an inactive segment. "Upsell customers?" Build a customer segment. Don't build segments in a vacuum.

4. **Show them the engagement score**: SendX has a built-in engagement score. It's one of the best predictors of who'll convert. Start by segmenting high/medium/low. You'll see immediate results (higher open rates on the high segment).

5. **Set a sunset policy**: This is uncomfortable but necessary. Anyone unengaged for 6+ months should be suppressed or deleted (check your legal obligation first). Dead weight in a list hurts deliverability. Tell them: "We'll keep the highly engaged people, sunset the silent ones, and re-engage the middle."

## Limitations

- **Segments are real-time but lazy**: A segment updates as people change behavior, but there's a small delay (usually 5-15 minutes). Don't rely on segments for split-second timing if that matters.
- **Tag sprawl is real**: Start with 10 tags. End up with 50. Keep discipline—document what each tag means, prune unused ones quarterly.
- **Custom fields don't backfill**: If you add a "Budget" custom field today, past subscribers don't have that data. You can import it via CSV, but it's work.
- **Segment size varies widely**: A "High engagement" segment might have 5,000 people. A "Purchased premium product + not opened in 60 days" might have 50. Smaller segments = higher risk of wonky data. Always check segment size before sending.
- **Import/sync lag**: If you import a CSV of 10,000 new tags, there's usually a 5-30 minute delay before segments update.
- **No "last purchase date" field out of the box**: You have to use a custom field or custom event. SendX doesn't track eCommerce purchases automatically unless you're on Shopify/WooCommerce sync.

### Sunset Policy: The hard truth

Here's what nobody wants to say but everyone needs to do: People who don't engage should be removed.

If someone hasn't opened an email in 6+ months and doesn't fit a specific re-engagement campaign, they're hurting your deliverability. ISPs (Gmail, Outlook, Yahoo) track bounce rates and engagement rates. If you mail a bunch of people who ignore you, your sender reputation tanks and even your good emails end up in spam.

**Typical sunset policy:**
- 180 days of zero engagement = move to a "Sunset" list.
- After one win-back email, if still no engagement = delete or suppress permanently.

It feels like giving up, but it's not. These people aren't going to convert. They're costing you sending volume and reputation. Delete them and focus on people who actually care.
