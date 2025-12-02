# 🔐 ROOTED — GOVERNANCE ENFORCEMENT MATRIX (LAW → SQL → UI)

This document shows **exactly how ROOTED law becomes real technical enforcement.**

Every governance promise must map to:

✅ Database Control  
✅ RLS  
✅ Views  
✅ Feature Flags  
✅ Admin RPCs  
✅ UI Reflection  

---

## 🧒 CHILD SAFETY SUPREMACY

Law Source:
- ROOTED_PLATFORM_CONSTITUTION.md
- ROOTED_KIDS_MODE_GOVERNANCE.md
- ROOTED_COMMUNITY_TRUST_LAW.md

Database:
- public.user_tiers.feature_flags.kids_mode_enabled
- kids_mode_overlays
- compliance_overlays (YOUTH_SAFETY)

RLS:
- Filters all kids-visible content
- Blocks monetization tables when kids_mode_enabled = true

UI:
- No pricing
- No messaging
- No payments
- No RFQs/Bids
- No ads

---

## 🔐 DATA SOVEREIGNTY & PRIVACY

Law Source:
- ROOTED_DATA_SOVEREIGNTY_LAW.md

Database:
- public.account_deletion_requests
- Controlled export views
- No third-party identity joins

RLS:
- Users access only their data
- No admin raw data escalation

UI:
- Data export tools
- Delete request flows
- No dark patterns

---

## 🚫 ANTI-PROFILING & NON-IDENTITY SORTING

Law Source:
- ROOTED_PLATFORM_CONSTITUTION.md
- ROOTED_COMMUNITY_TRUST_LAW.md

Database:
- No demographic columns
- No identity sorting fields

Views:
- Discovery driven by craft, service, trust only

UI:
- No identity filters
- No demographic targeting
- No bias controls

---

## 🐾 SANCTUARY & NONPROFIT PROTECTION

Law Source:
- ROOTED_SANCTUARY_NONPROFIT_LAW.md

Database:
- provider_type = sanctuary locked from monetization
- Feature flags always false for commerce

RLS:
- Blocks access to bids, bulk, payments

UI:
- Volunteer + education only
- No pricing
- No upgrades

---

## ⚙️ ADMIN POWER LIMITATION

Law Source:
- ROOTED_ADMIN_GOVERNANCE.md
- ROOTED_ACCOUNT_GOVERNANCE_LAW.md

Database:
- public.user_admin_actions (immutable log)
- Admin RPCs only
- No direct SQL mutations allowed

RLS:
- Admin scopes enforced
- No cross-tenant access

UI:
- Admin panels only call RPCs
- No hidden admin toggles

---

## 🧮 ROLE & TIER ENTITLEMENT

Law Source:
- ROOTED_ACCESS_POWER_LAW.md

Database:
- public.user_tiers (sole source of truth)

RLS:
- Role & tier filters on:
  - bids
  - bulk_offers
  - analytics
  - procurement

UI:
- Feature visibility mirrors backend entitlement

---

## 🗺️ DISCOVERY & ROTATION INTEGRITY

Law Source:
- ROOTED_SECURITY_DISCOVERY_CONTRACT.md

Database:
- Rotated discovery views
- Hard result limits

Views:
- 6–8 items max
- Backend-controlled rotation order

UI:
- Renders exactly what backend sends
- No reshuffle
- No sponsored slotting

---

## 🧾 ACCOUNT DELETION & CONSENT REVOCATION

Law Source:
- ROOTED_ACCOUNT_GOVERNANCE_LAW.md
- ROOTED_DATA_SOVEREIGNTY_LAW.md

Database:
- public.account_deletion_requests
- Immutable deletion log

RLS:
- Prevents platform access after finalization

UI:
- Deletion request tools
- Revocation confirmations

---

## ✅ FINAL ENFORCEMENT GUARANTEE

If **any new feature** does not map to:

✅ A Law File  
✅ A Database Rule  
✅ An RLS Rule  
✅ A View  
✅ A Feature Flag  
✅ An Admin RPC  
✅ A UI Reflection  

➡ That feature is **illegal to deploy inside ROOTED**.

ROOTED does not rely on trust in people.
It relies on **trust in enforcement.**
