---
ROOTED OFFICIAL YOUTH PARTICIPATION LAW

---

## 1. Age Tiers & Account Rules

ROOTED recognizes age tiers, not exact birthdays in the UI:

0–12 → Children (no independent account)

13–17 → Youth (limited accounts)

18+ → Adults (full account classes by role/tier)

1.1 Children (0–12)

No standalone ROOTED accounts.

May only use ROOTED:

Through Kids Mode, activated and controlled by a parent/guardian.

On shared devices under parental control.

Kids Mode for 0–12 is:

Read-only learning (landmarks, experiences, stories).

No markets, no messaging, no uploads, no account-level actions.

1.2 Youth (13–17)

May have their own ROOTED accounts (role = individual/community).

Are NOT treated as adults in discovery or markets.

Discovery is:

Reduced / age-filtered.

Focused on farms, sanctuaries, educational institutions, community spaces
– not on full adult event / nightlife spaces.

Volunteer access is restricted as:

13–17 may only volunteer at:

Farms

Sanctuaries / rescues

Clearly educational, moderated institutions (libraries, schools, museums)
when configured later

Youth volunteer opportunities:

Must pass moderation.

Must be flagged as youth-appropriate.

Youth accounts:

Have no direct access to RFQs, bids, bulk markets, or procurement.

Have no access to direct vendor/institution messaging channels.

1.3 Youth → Vendor Upgrade (18+)

At 18½ (18 and a buffer to prevent lying), a youth can:

Apply to become a vendor in the Community vertical.

The upgrade is not automatic:

Application → moderation → provider creation.

If approved, their role changes:

from individual/community → vendor

All vendor rules and feature flags apply.

This upgrade path:

Is back-end controlled

Must not depend on client UI alone

Must be documented and handled via admin/moderation + user_tiers

If there’s ever a conflict between “youth convenience” and “youth safety” → youth safety wins.

---

## 2️⃣ Kids Mode + Events / Landmarks (Law Level)

This is the part that touches community discovery:

2.1 Events (General)

For all events:

Must have:

A moderation state (e.g. moderation_status = 'pending' | 'approved' | 'rejected')

Public discovery (non-kids) must require:

moderation_status = 'approved'

Host must be:

A valid provider (vendor or institution)

Or, in future, a tightly controlled nonprofit/mission entity

2.2 Events in Kids Context

When content appears in Kids Mode or Kids Explore:

Kids surfaces may only show events that are:

✅ Approved via moderation

✅ Explicitly marked kids-safe (event-level flag / category)

✅ Hosted by:

Farms

Sanctuaries / rescues

Kids-friendly institutions (schools, libraries, museums)

Other entities that pass your safety rules

Kids Mode events must NOT expose:

❌ Price

❌ “Book now / buy” actions

❌ Donation or fundraising CTAs

❌ Ticketing flows

❌ Links or experiences that land them directly on sales funnels

Kids Mode events = field trip / visit / volunteer / learn, not commerce.

2.3 Landmarks

Landmarks are locked by your governance:

Always educational.

Never monetized.

Can be:

Farms, historical markers, cultural spaces, nature areas, etc.

For kids surfaces:

Only landmarks that are:

Marked kids-safe

Approved in moderation

No landmark may show:

Ticket prices

Donation requests

Booking flows

Landmarks = map-based, educational, non-commercial “things to learn about.”

---

## 3️⃣ Kids-Safe Tags & Admin Control (Automation Law)

3.1 Kids-Safe Tags

Any provider, event, landmark, or media that wants a kids-safe flag:

Must go through moderation.

Cannot self-assign kids-safe in a way that bypasses admin review.

Kids-safe tags MUST be:

Assigned or approved by:

Admin via moderation tools, or

A validated pipeline that inserts into moderation_queue and then an admin RPC.

3.2 Kids-Safe Media (Videos, Photos, etc.)

Any media surface that shows in Kids Mode:

Must be attached to:

An approved kids-safe event/landmark/provider

Must be moderated:

No auto-approval from raw uploads.

“This is safe for kids” cannot ever be:

A checkbox that instantly takes effect.

Law: Kids-safe is an admin-approved state, not a user toggle.
