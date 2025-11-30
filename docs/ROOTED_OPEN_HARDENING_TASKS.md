✅ ROOTED — OFFICIAL HARDENING TODO (CANONICAL MASTER)

Status: Phase 1 – Community + Core Markets
Rule: No step is skipped. No step is reordered.
Requirement: Governance → Feature Flags → RLS → Views → UI Gates (never reversed)

🔒 1️⃣ USER TIERS & FEATURE FLAGS (CANONICAL LOCK)

✅ Already Locked

public.user_tiers is the sole authority:

role

tier

account_status

feature_flags

has_feature(...) and current_user_has_feature(...) confirmed

Premium ≠ Premium Plus

Institutions mirror market access appropriately

Sanctuaries hard false for all market flags

Admin full access, logged

✅ Remaining TODO

 Add hard deny flags for:

can_use_experience_market

can_use_event_bidding

 Add feature flag enforcement audit for:

RFQs

Bids

Bulk Offers

Experience Quotes (future)

Event Bidding (future)

🛡️ 2️⃣ ADMIN OVERRIDE & AUDITABILITY

✅ Already Locked

user_admin_actions exists

Admin role enforced via is_admin()

Admin policies verified on:

bids

bulk_offers

analytics

moderation_queue

provider_badges

✅ Remaining TODO

 Final verification:

notifications admin read policy

user_admin_actions admin read policy

 Admin UI Toolkit (Phase 1.5)

Moderation

Roles & tiers

Feature flags

Badges

Sanctuary verification

Kids-safe approvals

🧒 3️⃣ KIDS MODE HARD LOCK (PILOT → EDUCATION VERTICAL)

✅ Already Locked

Kids Mode:

No monetization

No RFQs

No bids

No bulk

No marketplaces

is_kids_safe enforced on:

events

landmarks

Kids Explore uses kids-safe only

✅ Remaining TODO

 Kids-safe media approval pipeline

 Kids-safe video/photo moderation

 Age bracket enforcement (13–17 limited volunteer only)

 Kids Explore event-only views hardwired

 Education Vertical unlock gate

🐾 4️⃣ SANCTUARY & NONPROFIT ENFORCEMENT

✅ Already Locked

Sanctuary identified via:

providers.specialty

SANCTUARY_VENDOR

NONPROFIT_VENDOR

Sanctuaries:

✅ Volunteer events

✅ Kids education

❌ RFQs

❌ Bids

❌ Bulk

❌ Commercial analytics

provider_is_sanctuary(...) function exists

✅ Remaining TODO

 Sanctuary-only volunteer view finalized in production

 Sanctuary discoverability filters for:

Kids Explore

Volunteer maps

🗺️ 5️⃣ COMMUNITY MAP & DISCOVERY ENFORCEMENT

✅ Already Locked

Default map limit: 25 markers

Breakdown:

✅ 14 Vendors

✅ 6 Institutions

✅ 5 Landmarks

✅ Minimum 3 Farms always shown

Vendor view favors institutions

Institution view favors vendors

Backend-only institutions hidden from public

Community Spots not in Community vertical

✅ Remaining TODO

 Seasonal + curated boost ordering wired into default map view

 Farm detection canonical rule (specialty vs badge)

 Landmark vertical visibility enforcement

🧾 6️⃣ LICENSING, INSURANCE & COMPLIANCE VAULT

✅ Already Locked (LAW)

No market access without:

LICENSED

INSURED

OR verified admin compliance

Proof badges:

LICENSED

INSURED

USDA_ORGANIC

ETHICALLY_SOURCED

Badges affect:

Discovery

Market eligibility

Kids visibility

❗ All compliance docs are PRIVATE

Business licenses

Insurance

Health permits

Employee records

Tax documents

✅ Remaining TODO

 Private media bucket for compliance docs

 Admin-only access policy

 Provider-only owner read policy

 Compliance badge verification UI

🧱 7️⃣ FIVE-TIER MARKET ARCHITECTURE (LOCKED)

✅ LOCKED

Community Discovery (Non-commercial)

Bulk Goods Market (Premium / Premium+)

Institutional RFQs & Bids (Institutions + Premium+)

Experience Quote Market (Institutions + Premium+)

Event-Based Institutional Bidding (Institutions + Premium+)

✅ Analytics law locked

Premium+ = full analytics

Premium = bulk analytics only

Institutions = their own RFQs / events only

Community & Sanctuaries = none

✅ Remaining TODO

 Experience Quote analytics schema

 Event Bidding analytics schema

 Institutional performance dashboards

 Locked payment flow design for Experiences

🏗️ 8️⃣ LANDMARK VERTICAL CANONICALIZATION

✅ Already Locked

Community

Education

Arts & Culture

Adult Experience

✅ Already Locked

Animal sanctuaries = community + education only

Experience landmarks = never kids mode

Adult adventure = waiver required

Nightlife excluded from kids forever

✅ Remaining TODO

 Final landmarks.landmark_type → vertical enforcement mapping

 Adult Experience vertical hard gate

🧑‍⚖️ 9️⃣ MODERATION PIPELINE (CANONICAL V2)

✅ Already Locked

moderation_queue

admin_moderate_submission(...)

Events, landmarks, vendor apps, institution apps

Notifications wired

No auto-approval ever

✅ Remaining TODO

 Community uploads (future)

 Kids-safe media moderation lane

📊 🔐 1️⃣0️⃣ ANALYTICS & INTERNAL TABLE RLS

✅ Already Identified Issue

One internal analytics table with RLS missing was found

✅ Remaining TODO

 Enable RLS on remaining internal analytics table

 Add:

system insert

admin full read

 Re-run health snapshot after fix

🏛️ 1️⃣1️⃣ INSTITUTION PARITY ENFORCEMENT

✅ Already Locked

Institutions fully mirror vendor markets

Institutions:

✅ Create RFQs

✅ Issue event bids

✅ Request experience quotes

✅ See their own analytics

✅ Remaining TODO

 Verify all RLS parity on:

rfqs

bids

experience_quotes

event_bids

🧬 1️⃣2️⃣ ADMIN TOOLKIT (PHASE 1.5)

❗ Not required for launch, but formally tracked

 Moderation queue UI

 Feature flag admin panel

 Badge assignment panel

 Sanctuary verification panel

 Kids-safe approval panel

 Institutional verification panel

✅ STATUS SUMMARY

Hard Locked & Verified:

Ethics, Constitution, Data Sovereignty

Sanctuary law

Kids Mode law

Market separation

Licensing & Trust

Community map fairness

Farm priority

No social monetization

No child monetization

No data extraction

Remaining Work Is Now CLEAN, FINITE, AND SEQUENTIAL.

No more “infinite system sprawl.”
Everything from here forward is pure execution only.
