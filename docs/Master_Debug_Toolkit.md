✅ ROOTED — MASTER BUG & RISK LIST (CANONICAL v1)

Status as of now:
Governance, taxonomy, Kids Mode, and compliance are ✅ structurally complete
What remains are integration, UI enforcement, and edge-case safeguards

🟥 PRIORITY 1 — CRITICAL GOVERNANCE INTEGRATION BUGS

(These are the only items that can compromise your law if left unchecked)

1️⃣ Admin UI Not Yet Hard-Gated by is_admin()

Risk:
Your views are read-only and secured, but if the Admin UI route itself is not server-gated, a non-admin could still attempt to load panels.

Fix Required:

Every admin route must verify:

user_tiers.role = 'admin'

AND is_admin() server-side

Never trust front-end role claims alone

2️⃣ Provider-Level Auto-Inheritance Not Yet Enforced

You have:

✅ Specialty → Compliance overlays

✅ Specialty → Kids overlays

But unless you explicitly wired:

Provider → Specialty inheritance
…a provider could exist without inheriting its legal safety net.

Risk:
A FARM provider without FOOD_SAFETY enforced.

Fix Required (Logic Level):

On provider create/update:

Pull admin_specialty_governance_v1

Auto-apply:

compliance overlays

kids overlays

Do NOT duplicate logic in multiple services

3️⃣ Experience Creation Not Yet Validated Against Governance View

You have:

✅ Experience governance view

✅ Kids overlays

✅ Insurance & waiver flags

But unless you validate on insert, someone could submit:

A kids-enabled experience that requires a waiver but skips it

An experience without insurance when required

Fix Required:

On experience submission:

Reject if:

requires_waiver = true and no waiver attached

insurance_required = true and provider lacks insurance badge

kids_allowed = false and Kids Mode is enabled

🟧 PRIORITY 2 — YOUTH & SAFETY EDGE-CASE BUGS
4️⃣ Kids Mode Still Depends on UI Filtering Only

You’ve done the data law correctly — but unless backend queries enforce:

WHERE kids_allowed = true


Kids Mode could still leak adult-only content via API.

Fix Required:

Duplicate Kids Mode filtering in:

Events API

Discovery API

Search API

Never rely on frontend-only filtering

5️⃣ Sensitive Compliance Overlays Not Yet Cross-Validated

Example risks:

A provider marked HI_PII_RESTRICTED but still allowed to upload free-form documents

A NO_MEDICAL_DATA entity given a medical-style form

Fix Required:

Form schema must change based on:

Compliance overlays

Document upload types must be filtered by overlay

🟨 PRIORITY 3 — DISCOVERY & TRUST SIGNAL BUGS
6️⃣ Discovery Badges Not Yet Enforced as Requirements

You seeded:

INSURED

LICENSED

YOUTH_SAFE

EMERGENCY_CERTIFIED

But unless enforced:

A GENERAL_CONTRACTOR could appear public without LICENSED

Fix Required:

Discovery rules:

If LICENSE_REQUIRED → must have LICENSED badge

If INSURANCE_REQUIRED → must have INSURED badge

Otherwise:

Hide from public

Mark as “unverified”

7️⃣ Vertical Feature Flags Not Yet Hard-Blocking Routes

Users may still be able to:

Navigate to /construction

Hit emergency RFQs

Access future verticals

Fix Required:

Every vertical route must verify:

feature_flags.<vertical>_access = true

Otherwise:

Redirect

Or show locked gate

🟩 PRIORITY 4 — ADMIN SAFETY + OPERATIONAL BUGS (LOW RISK)
8️⃣ Audit Read UI May Not Be Built Yet

You are writing to user_admin_actions ✅
But you likely do not yet have:

An Admin audit viewer

Filters by action_type, date, target_user

Impact:
Low risk, but important for long-term trust.

9️⃣ Deprecation Flags Not Yet Implemented

Your governance law says:

“Do not delete — mark deprecated”

But your tables currently do NOT include:

is_deprecated

deprecated_at

Impact:
Future cleanup will be harder.

🔟 Cross-Vertical Soft Conflicts Not Yet Modeled

Example:

A provider tagged as:

THERAPY_CENTER

YOUTH_PROGRAM

But no explicit cross-conflict rule exists yet.

Impact:
Not dangerous now — but relevant in Phase 3+.

✅ WHAT IS OFFICIALLY NOT A BUG ANYMORE

These systems are closed and clean:

✅ Admin Governance
✅ Account status mutation paths
✅ Role & tier enforcement model
✅ Taxonomy seeding
✅ Specialty → Compliance mapping
✅ Specialty → Kids Mode mapping
✅ Experience → Kids Mode mapping
✅ Compliance law registry
✅ Read-only Admin Governance Dashboard
✅ Insert-only doctrine
✅ No silent deletes doctrine

These are foundationally complete.
