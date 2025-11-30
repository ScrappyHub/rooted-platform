ROOTED OPEN HARDENING TASKS (OFFICIAL SECURITY + SAFETY TODO)

File: ROOTED_OPEN_HARDENING_TASKS.md
Authority Level: Canonical Engineering Doctrine
Scope: Platform Lockdown, Safety, Vertical Readiness
Status: Live & Enforced

🔒 SECURITY

 Enable RLS on internal analytics tables (if any remain)

 Add admin_can_read_all on:

bids

bulk_offers

bulk_offer_analytics

vendor_analytics_basic_daily

vendor_analytics_advanced_daily

provider_impact_snapshots

moderation_queue

provider_badges

 Add admin read/write on:

notifications

user_admin_actions

👑 ADMIN

 Universal admin override for:

Bids

Bulk Offers

Bulk Analytics

Standard Analytics

Moderation Queue

Badges

Provider Impact

 Add admin notifications on:

All submissions

All moderation outcomes

 Admin alert fan-out pipeline (future)

🏛️ INSTITUTIONS

 Institutions mirror vendor access across:

UI

API

SQL Views

RLS

Feature Flags

 Institutions:

Premium → Bulk + Basic Analytics

Premium Plus → Bulk + Basic + Advanced + Bidding

🧒 KIDS MODE

 Kids Mode monetization bans enforced globally

 Age brackets (future):

4–7

8–12

13–17 (read-only)

 Volunteer age restrictions by bracket

 Kids-safe content must:

Have is_kids_safe = true

Be moderation_status = 'approved'

Belong to a provider with KIDS_MODE_SAFE badge

 Kids-safe videos require admin approval

🐾 SANCTUARIES

 Sanctuary vendors:

Volunteer events only

No marketplace tools

No pricing

 Add specialty tag: SANCTUARY_VENDOR

 Sanctuary access locked at policy level

📊 BULK MARKETPLACE ANALYTICS (NEW – LOCKED FOR LATER BUILD)

 Add feature flag: can_view_bulk_marketplace_analytics

 Premium + Premium Plus Vendors → true

 Premium + Premium Plus Institutions → true

 Add bulk_marketplace_analytics_view

 Owner-based RLS + admin override

🗺️ MUNICIPALITIES (FUTURE VERTICAL – PREWIRED)

 Stored as institutions in backend

 Not discoverable in community

 Legal-only backend access

 Emergency + infrastructure vertical later

🧠 DATA + MEDIA

 Kids-safe media moderation enforced

 Provider media ownership enforced

 Video transcription for kids content (future)

 AI flag assistance (future, admin-gated)


 ---


 A Kids-safe providers view definition (kids_safe_providers) you can drop into SQL when you’re ready, which:

Joins providers, provider_badges, and provider_media

Filters to KIDS_MODE_SAFE + approved/public media

Is safe for the Kids Explore page to query against

🧱 GOVERNANCE & DOCS

 Constitution locked

 Governance & Ethics law active

 Data Sovereignty law active

 Community Trust law active

 Access & Power law active

 Sanctuary law active

 Contributor governance notice active

 Governance Index created

 Open Hardening Task List created
