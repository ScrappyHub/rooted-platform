✅ ROOTED — OFFICIAL HARDENING TODO (CANONICAL MASTER)

Cross-References:

- /governance/ENFORCEMENT_MATRIX.md  
- /governance/ROOTED_PLATFORM_CONSTITUTION.md  
- /governance/ROOTED_KIDS_MODE_GOVERNANCE.md  
- /governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md  
- /docs/Master_Debug_Toolkit.md  

Status: **Phase 1 – Community + Core Markets**

Rule:  

> Governance → Feature Flags → RLS → Views → UI Gates  
> (Never reversed.)

---

## 1️⃣ USER TIERS & FEATURE FLAGS (CANONICAL LOCK)

✅ Already Locked

- `public.user_tiers` is single authority for:

  - `role`  
  - `tier`  
  - `account_status`  
  - `feature_flags`  

- `has_feature(...)` and `current_user_has_feature(...)` confirmed  
- Premium ≠ Premium Plus  
- Institutions mirror vendor market access  
- Sanctuaries = hard false for all market flags  
- Admin = full access but logged & RLS-enforced  

🔜 Remaining TODO

- Add hard deny flags for:

  - `can_use_experience_market`  
  - `can_use_event_bidding`  

- Add enforcement audit for:

  - RFQs  
  - Bids  
  - Bulk Offers  
  - Experience Quotes (future)  
  - Event Bidding (future)  

---

## 2️⃣ ADMIN OVERRIDE & AUDITABILITY

✅ Already Locked

- `user_admin_actions` exists  
- Admin role enforced via `public.is_admin()`  
- Admin policies verified on:

  - `bids`, `bulk_offers`  
  - analytics views  
  - `moderation_queue`  
  - `provider_badges`  

🔜 Remaining TODO

- Verify RLS for:

  - `notifications` admin read policy  
  - `user_admin_actions` admin read policy  

- Build Admin UI toolkit (Phase 1.5):

  - Moderation queue  
  - Roles & tiers manager  
  - Feature flag panel  
  - Badge assignment  
  - Sanctuary verification  
  - Kids-safe approvals  

---

## 3️⃣ KIDS MODE HARD LOCK (PILOT → EDUCATION)

✅ Already Locked

- Kids Mode:

  - No monetization  
  - No RFQs / bids / bulk / marketplaces  

- `is_kids_safe` enforced for:

  - events  
  - landmarks  

- Kids Explore uses kids-safe content only  

🔜 Remaining TODO

- Kids-safe media approval pipeline (videos/photos)  
- Kids-safe media moderation lane  
- Age bracket enforcement (13–17 volunteer-only where allowed)  
- Kids Explore **event-only** views hardwired  
- Education vertical unlock gate (law + feature flag)  

---

## 4️⃣ SANCTUARY & NONPROFIT ENFORCEMENT

✅ Already Locked

- Sanctuary identified via:

  - `providers.specialty` or type  
  - e.g., `SANCTUARY_VENDOR`, `NONPROFIT_VENDOR`  

- Sanctuaries:

  - ✅ Volunteer events  
  - ✅ Kids education  
  - ❌ RFQs  
  - ❌ Bids  
  - ❌ Bulk  
  - ❌ Commercial analytics  

- `provider_is_sanctuary(...)` function exists  

🔜 Remaining TODO

- Sanctuary-only volunteer view in production  
- Sanctuary filters for:

  - Kids Explore  
  - Volunteer maps  

---

## 5️⃣ COMMUNITY MAP & DISCOVERY ENFORCEMENT

✅ Already Locked

- Default map limit ~25 markers:

  - ~14 Vendors  
  - ~6 Institutions  
  - ~5 Landmarks  
  - Min 3 farms always shown  

- Vendor view favors institutions, institution view favors vendors  
- Backend-only institutions hidden from public  
- Community Spots **not** part of Community vertical at launch  

🔜 Remaining TODO

- Seasonal + curated boost ordering wired into default map view  
- Canonical farm detection (specialty vs badge)  
- Landmark vertical visibility enforcement  

---

## 6️⃣ LICENSING, INSURANCE & COMPLIANCE VAULT

✅ Already Locked (Law)

- No market access without:

  - `LICENSED`  
  - `INSURED`  
  - OR verified admin compliance  

- Proof badges:

  - `LICENSED`  
  - `INSURED`  
  - `USDA_ORGANIC`  
  - `ETHICALLY_SOURCED`  

Badges affect:

- Discovery  
- Market eligibility  
- Kids visibility  

All compliance docs are **PRIVATE**:

- Licenses  
- Insurance  
- Health permits  
- Employee records  
- Tax documents  

🔜 Remaining TODO

- Private media bucket for compliance documents  
- Admin-only access policy  
- Owner-only read policy  
- Compliance badge verification UI  

---

## 7️⃣ FIVE-TIER MARKET ARCHITECTURE

✅ Locked Structure

1. Community Discovery (non-commercial)  
2. Bulk Goods Market (Premium / Premium Plus)  
3. Institutional RFQs & Bids (Institutions + Premium Plus)  
4. Experience Quote Market (Institutions + Premium Plus)  
5. Event-Based Institutional Bidding (Institutions + Premium Plus)  

Analytics law:

- Premium Plus → full analytics  
- Premium → bulk analytics only  
- Institutions → their own RFQs / events only  
- Community & Sanctuaries → none  

🔜 Remaining TODO

- Experience Quote analytics schema  
- Event Bidding analytics schema  
- Institutional performance dashboards  
- Locked payment flow design for experiences  

---

## 8️⃣ LANDMARK VERTICAL CANONICALIZATION

✅ Already Locked

Landmark types:

- Community  
- Education  
- Arts & Culture  
- Adult Experience  

Rules:

- Animal sanctuaries = community + education only  
- “Experience” landmarks = never Kids Mode  
- Adult adventure = waiver required  
- Nightlife = excluded from Kids forever  

🔜 Remaining TODO

- Final `landmarks.landmark_type` → vertical enforcement mapping  
- Adult Experience vertical hard gate  

---

## 9️⃣ MODERATION PIPELINE (CANONICAL V2)

✅ Already Locked

- `moderation_queue`  
- `admin_moderate_submission(...)`  
- Events, landmarks, vendor apps, institution apps  
- Notifications wired  
- No auto-approval  

🔜 Remaining TODO

- Community uploads (future)  
- Kids-safe media moderation lane  

---

## 🔟 ANALYTICS & INTERNAL TABLE RLS

✅ Already Identified

- One internal analytics table missing RLS was found.

🔜 Remaining TODO

- Enable RLS on remaining internal analytics tables  
- Add:

  - System insert-only  
  - Admin full read  

- Re-run security/health snapshot afterward  

---

## 1️⃣1️⃣ INSTITUTION PARITY ENFORCEMENT

✅ Already Locked

- Institutions mirror vendor markets:

  - Create RFQs  
  - Issue event bids  
  - Request experience quotes  
  - See their own analytics  

🔜 Remaining TODO

- Verify RLS parity on:

  - `rfqs`  
  - `bids`  
  - `experience_quotes`  
  - `event_bids`  

---

## 1️⃣2️⃣ ADMIN TOOLKIT (PHASE 1.5)

Not required for launch, but formally tracked:

- Moderation queue UI  
- Feature flag admin panel  
- Badge assignment panel  
- Sanctuary verification panel  
- Kids-safe approval panel  
- Institutional verification panel  

---

## ✅ STATUS SUMMARY

Hard Locked & Verified:

- Ethics & Constitution  
- Data Sovereignty  
- Sanctuary Law  
- Kids Mode Law  
- Market separation  
- Licensing & Trust  
- Community map fairness  
- Farm priority  
- No social monetization  
- No child monetization  
- No data extraction  

Remaining work is **clean, finite, and sequential.**  
There is no longer “infinite system sprawl” — only execution.
