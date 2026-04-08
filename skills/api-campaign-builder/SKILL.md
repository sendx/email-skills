---
name: api-campaign-builder
description: "Create, schedule, and manage HTML email campaigns through the SendX REST API."
category: infrastructure
difficulty: intermediate
---

# API Campaign Builder

## What you do

You help developers and technical marketers use the SendX API to create HTML email campaigns, schedule them for review or immediate sending, and monitor delivery. You translate marketing goals into working API calls — with correct authentication, entity references, and scheduling logic.

## When to activate

- "How do I create a campaign via the API?"
- "I need to schedule an email through SendX's API"
- "Set up a campaign that goes to my approval queue first"
- "Send an HTML email to a list using the API"
- "How do I check if my campaign was sent?"
- "Create a campaign but don't send it yet"
- Any request involving SendX REST endpoints for campaigns, senders, or templates

## Your expertise

### Authentication

Every request needs your team API key in the header:

```
X-Team-ApiKey: YOUR_API_KEY
```

Base URL: `https://api.sendx.io/api/v1/rest`

All requests use `Content-Type: application/json`.

---

### Entity ID prefixes

SendX IDs follow a predictable pattern. Always use the full prefixed ID:

| Entity   | Prefix      | Example                          |
|----------|-------------|----------------------------------|
| Campaign | `campaign_` | `campaign_abc123def456`          |
| Sender   | `sender_`   | `sender_xyz789ghi012`            |
| List     | `list_`     | `list_mno345pqr678`             |
| Tag      | `tag_`      | `tag_stu901vwx234`              |
| Template | `template_` | `template_yza567bcd890`         |
| Segment  | `segment_`  | `segment_efg123hij456`          |

---

### The campaign creation workflow

Follow this order every time:

```
1. Create or fetch a Sender
2. Create or fetch a Template (optional — you can inline HTML)
3. Create the Campaign (with targeting + schedule settings)
4. Check status via Report endpoint
```

---

### Step 1 — Sender

**Create a sender:**

```bash
curl -X POST https://api.sendx.io/api/v1/rest/sender \
  -H "X-Team-ApiKey: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Marketing Team",
    "email": "marketing@yourcompany.com",
    "replyTo": "support@yourcompany.com"
  }'
```

Response includes the `id` (e.g. `sender_abc123`). Save this — you'll need it for the campaign.

**List existing senders:**

```bash
curl -X GET "https://api.sendx.io/api/v1/rest/sender?offset=0&limit=10" \
  -H "X-Team-ApiKey: YOUR_API_KEY"
```

---

### Step 2 — Template (optional)

If you want to reuse HTML across campaigns, save it as a template first.

**Create a template:**

```bash
curl -X POST https://api.sendx.io/api/v1/rest/template/email \
  -H "X-Team-ApiKey: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "April Newsletter",
    "htmlCode": "<html><body><h1>Hello {{contact.firstName}}</h1><p>Your content here.</p></body></html>"
  }'
```

**List existing templates:**

```bash
curl -X GET "https://api.sendx.io/api/v1/rest/template/email?offset=0&limit=10&search=newsletter" \
  -H "X-Team-ApiKey: YOUR_API_KEY"
```

You can skip templates entirely and put HTML directly in the campaign's `htmlCode` field.

---

### Step 3 — Create the campaign

This is the core call. Here's every field that matters:

```bash
curl -X POST https://api.sendx.io/api/v1/rest/campaign \
  -H "X-Team-ApiKey: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "April Product Update",
    "subject": "What we shipped this month",
    "sender": "sender_abc123",
    "htmlCode": "<html><body><h1>Hi {{contact.firstName}}</h1><p>Here is what is new...</p></body></html>",
    "scheduleType": 0,
    "scheduleCondition": "2026-04-15T10:00:00.000Z",
    "timezone": "America/New_York",
    "includedSegmentIds": ["segment_efg123"],
    "includedListIds": ["list_mno345"],
    "includedTagIds": ["tag_stu901"],
    "excludedSegmentIds": [],
    "excludedListIds": [],
    "excludedTagIds": []
  }'
```

---

### Schedule types — the critical field

| scheduleType | What it does                          | When to use                            |
|:------------:|---------------------------------------|----------------------------------------|
| **0**        | Schedule for later                    | Needs approval, or send at a set time  |
| **1**        | Send immediately                      | Ready to go right now                  |
| **2**        | Trigger via automation                | Part of a workflow                     |
| **3**        | Recurring                             | Digest or periodic send                |

**To hold a campaign for approval:** Use `scheduleType: 0` with a future `scheduleCondition`. The campaign sits in "Scheduled" state where a human can review it in the SendX dashboard before it fires.

**To create a draft for later:** Use `scheduleType: 0` without a `scheduleCondition` (or with a far-future date). This parks the campaign so someone can open it, review, set the real time, and approve.

**To send right now:** Use `scheduleType: 1`. The campaign enters the sending queue immediately.

---

### Campaign status codes

After creating a campaign, check its status via the report endpoint:

| Status | Meaning           | What's happening                                     |
|:------:|-------------------|------------------------------------------------------|
| 0      | Draft             | Created but not scheduled or sent                    |
| 1      | Scheduled         | Queued — waiting for the scheduled time              |
| 2      | Sending           | Currently being delivered                            |
| 3      | Sent              | Delivery complete                                    |
| 4      | Quarantined       | Flagged for review by the system                     |
| 5      | Evaluating        | System is checking content/targeting                 |
| 6      | Evaluation Failed | Something didn't pass — check the dashboard          |
| 7      | Warming Up        | IP warmup throttling is active                       |

---

### Step 4 — Check campaign status and reports

**Get a campaign report:**

```bash
curl -X GET "https://api.sendx.io/api/v1/rest/report/campaign/campaign_abc123" \
  -H "X-Team-ApiKey: YOUR_API_KEY"
```

Response includes:

- `clickCount`, `openCount`, `unsubscribeCount`, `bounceCount`, `spamReportCount`
- `linkStats` — per-link click data
- `status` — one of the status codes above

---

### Targeting: who gets the email

You have three include arrays and three exclude arrays:

```json
{
  "includedListIds": ["list_aaa", "list_bbb"],
  "includedTagIds": ["tag_ccc"],
  "includedSegmentIds": ["segment_ddd"],
  "excludedListIds": ["list_eee"],
  "excludedTagIds": ["tag_fff"],
  "excludedSegmentIds": []
}
```

**Logic:** Send to anyone in ANY included list/tag/segment, EXCEPT anyone in ANY excluded list/tag/segment. Exclusions always win.

---

### Full Python example: create and schedule a campaign for approval

```python
import requests

API_KEY = "your_api_key_here"
BASE = "https://api.sendx.io/api/v1/rest"
HEADERS = {
    "X-Team-ApiKey": API_KEY,
    "Content-Type": "application/json"
}

# 1. Create a sender (or use an existing one)
sender_resp = requests.post(f"{BASE}/sender", headers=HEADERS, json={
    "name": "Product Team",
    "email": "product@yourcompany.com",
    "replyTo": "product@yourcompany.com"
})
sender_id = sender_resp.json()["id"]
print(f"Sender: {sender_id}")

# 2. Create the campaign — scheduled for later (approval queue)
campaign_resp = requests.post(f"{BASE}/campaign", headers=HEADERS, json={
    "name": "April Product Update",
    "subject": "Here's what we shipped in April",
    "sender": sender_id,
    "htmlCode": """
    <html>
    <body style="font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto;">
        <h1>Hi {{contact.firstName}},</h1>
        <p>Here's what's new this month.</p>
        <a href="https://yourcompany.com/updates" 
           style="background: #4F46E5; color: white; padding: 12px 24px; 
                  text-decoration: none; border-radius: 6px;">
            See updates
        </a>
    </body>
    </html>
    """,
    "scheduleType": 0,
    "scheduleCondition": "2026-04-15T14:00:00.000Z",
    "timezone": "America/New_York",
    "includedListIds": ["list_your_main_list"],
    "includedTagIds": [],
    "includedSegmentIds": [],
    "excludedListIds": [],
    "excludedTagIds": ["tag_unengaged_90d"],
    "excludedSegmentIds": []
})
campaign_id = campaign_resp.json()["id"]
print(f"Campaign: {campaign_id}")
print(f"Status: {campaign_resp.json().get('status')}")

# 3. Check the report later
report_resp = requests.get(
    f"{BASE}/report/campaign/{campaign_id}", headers=HEADERS
)
report = report_resp.json()
print(f"Opens: {report.get('openCount', 0)}")
print(f"Clicks: {report.get('clickCount', 0)}")
print(f"Bounces: {report.get('bounceCount', 0)}")
```

---

### Transactional emails (one-off sends)

For password resets, receipts, or triggered notifications — not campaigns:

**Send using a saved template:**

```bash
curl -X POST https://api.sendx.io/api/v1/rest/send/template \
  -H "X-Team-ApiKey: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "templateId": "template_yza567bcd890",
    "sender": "sender_abc123",
    "tags": {"firstName": "Alex", "orderNumber": "12345"}
  }'
```

**Send raw HTML:**

```bash
curl -X POST https://api.sendx.io/api/v1/rest/send/email \
  -H "X-Team-ApiKey: YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "sender": "sender_abc123",
    "subject": "Your receipt",
    "htmlCode": "<html><body><p>Thanks for your purchase.</p></body></html>"
  }'
```

---

### HTTP status codes

| Code | Meaning                                    |
|:----:|--------------------------------------------|
| 200  | Success                                    |
| 400  | Bad request — check your JSON body         |
| 401  | Invalid API key                            |
| 404  | Entity not found — check the ID prefix     |
| 422  | Validation error — missing required field  |
| 500  | Server error — retry after a moment        |

---

### Common merge tags

Use these inside `htmlCode` or `subject`:

- `{{contact.firstName}}` — first name
- `{{contact.lastName}}` — last name
- `{{contact.email}}` — email address
- `{{contact.company}}` — company name

---

### Common mistakes

1. **Forgetting the ID prefix.** `abc123` won't work — use `sender_abc123`.
2. **Using scheduleType 1 when you wanted approval.** That sends immediately. Use 0 for the approval queue.
3. **Empty targeting.** You must include at least one list, tag, or segment. An empty campaign has no recipients.
4. **Missing sender.** Every campaign needs a sender ID. Create one first.
5. **Bad timezone string.** Use IANA format: `America/New_York`, `Europe/London`, `Asia/Kolkata`. Not abbreviations like EST or IST.
6. **HTML without inline styles.** Email clients strip `<style>` blocks. Always inline your CSS.

## How to respond

- Lead with a working code example. Explain after.
- Always show the full curl or Python — no pseudocode.
- When the user says "schedule for approval" or "don't send yet," use `scheduleType: 0`.
- When the user says "send now," use `scheduleType: 1`.
- Remind users to verify their sender email is authenticated (SPF/DKIM) before sending.
- If the user asks about something the API can't do (like drag-and-drop design), point them to the SendX dashboard.

## Limitations

- The API doesn't support visual email building. HTML must be provided as a string.
- A/B testing campaigns can't be created via API — use the dashboard.
- Automation workflows (scheduleType 2) are configured in the dashboard, not via this endpoint.
- The API doesn't expose real-time sending progress. Poll the report endpoint for delivery stats.
- Rate limits aren't publicly documented. If you hit 429 errors, add exponential backoff.
- Recurring campaigns (scheduleType 3) need dashboard configuration for the recurrence pattern.
