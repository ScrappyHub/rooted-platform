# ✅ ROOTED PRE-COMMIT GOVERNANCE CHECKLIST  
**Required Before Any Merge to Main / Production**  
**Authority Level:** MANDATORY — LEGALLY BINDING  
**Applies To:** All developers, contractors, maintainers, AI systems, and service accounts  
**Enforcement Chain:**  
ROOTED_PLATFORM_CONSTITUTION.md → STOP LAYER → Database (RLS + Views + Flags + RPCs) → Admin Oversight → UI  

This checklist is a **hard constitutional gate**.  
If **ANY item below fails**, the change **MUST NOT BE MERGED** under ROOTED law.

Cross References:
- `ROOTED_PLATFORM_CONSTITUTION.md`
- `ROOTED_STOP_LAYER.md`
- `ROOTED_KIDS_MODE_GOVERNANCE.md`
- `ROOTED_DATA_SOVEREIGNTY_LAW.md`
- `ROOTED_ACCESS_POWER_LAW.md`
- `ROOTED_COMMUNITY_TRUST_LAW.md`
- `ROOTED_ADMIN_GOVERNANCE.md`
- `ROOTED_ACCOUNT_GOVERNANCE_LAW.md`
- `ROOTED_SANCTUARY_NONPROFIT_LAW.md`
- `ROOTED_CONTRIBUTOR_GOVERNANCE_NOTICE.md`

---

## 🔒 1. CHILD SAFETY & KIDS MODE (SUPREME OVERRIDE)

**Cross-Ref:**  
`ROOTED_KIDS_MODE_GOVERNANCE.md`  
`ROOTED_COMMUNITY_TRUST_LAW.md`  
`ROOTED_PLATFORM_CONSTITUTION.md` (Supreme Child Safety Clause)

- [ ] No code path exposes **pricing, sales, fundraising, booking, RFQs, bids, subscriptions, or ads** to Kids Mode.
- [ ] No provider, vendor, institution, or admin can message a Kids Mode user.
- [ ] All Kids Mode content enforces **backend kids-safe flags** (not UI-only).
- [ ] No holiday overlays reach Kids Mode without **triple consent**:
  - [ ] User opt-in
  - [ ] Business opt-in
  - [ ] Kids-safe approval
- [ ] No Kids Mode feature is monetized in any form.

✅ **If ANY Kids Mode rule is violated → BLOCK MERGE UNDER CONSTITUTIONAL LAW**

---

## 🎭 2. CULTURAL & HOLIDAY CONSENT

**Cross-Ref:**  
`ROOTED_GOVERNANCE_ETHICS.md`  
`ROOTED_DATA_SOVEREIGNTY_LAW.md`

- [ ] No holiday is auto-enabled by default.
- [ ] All holiday logic requires:
  - [ ] User opt-in
  - [ ] Business opt-in
  - [ ] Date validation inside defined holiday window
- [ ] No cultural, religious, ethnic, or political inference exists in code.

✅ **If ANY holiday or cultural logic bypasses consent → BLOCK MERGE**

---

## 🧠 3. DATA SOVEREIGNTY & CONSENT

**Cross-Ref:**  
`ROOTED_DATA_SOVEREIGNTY_LAW.md`  
`ROOTED_PLATFORM_CONSTITUTION.md`

- [ ] No new data collection exists without explicit user-facing consent.
- [ ] No third-party data resale, enrichment, or broker integration is added.
- [ ] No hidden tracking, fingerprinting, background scraping, or silent GPS access exists.
- [ ] All analytics additions are:
  - Transparent
  - Auditable
  - Disablable

✅ **If extractive or silent data logic exists → BLOCK MERGE**

---

## ⚙️ 4. ADMIN POWER & ACCOUNT CONTROL

**Cross-Ref:**  
`ROOTED_ADMIN_GOVERNANCE.md`  
`ROOTED_ACCOUNT_GOVERNANCE_LAW.md`  
`ROOTED_ACCESS_POWER_LAW.md`

- [ ] All privileged actions are logged in `public.user_admin_actions`.
- [ ] No direct SQL bypass is introduced for role, tier, flags, or account status.
- [ ] All role, tier, and status changes occur only through Admin RPCs.
- [ ] Feature flags remain source of truth — no UI-only gating.
- [ ] Sanctuaries and non-commercial entities are not granted:
  - Paid tiers
  - Bidding
  - Bulk marketplace
  - Monetized tools

✅ **If unlogged admin power exists → BLOCK MERGE**

---

## 🛡️ 5. DISCOVERY, MODERATION & TRUST

**Cross-Ref:**  
`ROOTED_COMMUNITY_TRUST_LAW.md`  
`SECURITY_DISCOVERY_CONTRACT.md`

- [ ] All public discovery paths require:
  - Approved moderation
  - Active account status
  - Explicit discoverability enabled
- [ ] No draft, rejected, or unreviewed content is publicly reachable.
- [ ] No “shadow publish,” auto-approval, or hidden visibility logic exists.

✅ **If moderation can be bypassed → BLOCK MERGE**

---

## 🗺️ 6. LANDMARK & COMMUNITY SPOT SAFETY

**Cross-Ref:**  
`ROOTED_COMMUNITY_TRUST_LAW.md`  
`ROOTED_ACCESS_POWER_LAW.md`

- [ ] Landmarks remain **100% non-commercial**.
- [ ] No pricing, ads, RFQs, bids, booking, or monetization are attached to landmarks.
- [ ] Community uploads to landmarks remain **admin-controlled only**.
- [ ] Kids Mode has **no edit, upload, or commercial interaction** with landmarks.

✅ **If landmark safety is weakened → BLOCK MERGE**

---

## 🐾 7. SANCTUARY & NONPROFIT PROTECTION

**Cross-Ref:**  
`ROOTED_SANCTUARY_NONPROFIT_LAW.md`

- [ ] Sanctuaries cannot access:
  - Paid tiers
  - RFQs
  - Bidding
  - Bulk markets
- [ ] Sanctuaries only host:
  - Volunteer events
  - Education events
- [ ] No financial extraction mechanisms exist for protected entities.

✅ **If sanctuary protections weaken → BLOCK MERGE**

---

## 🧾 8. CODE ↔ GOVERNANCE ALIGNMENT

**Cross-Ref:**  
All governance files

- [ ] This change conflicts with **NONE** of the following:
  - `ROOTED_PLATFORM_CONSTITUTION.md`
  - `ROOTED_STOP_LAYER.md`
  - `ROOTED_GOVERNANCE_ETHICS.md`
  - `ROOTED_DATA_SOVEREIGNTY_LAW.md`
  - `ROOTED_ACCESS_POWER_LAW.md`
  - `ROOTED_COMMUNITY_TRUST_LAW.md`
  - `ROOTED_KIDS_MODE_GOVERNANCE.md`
  - `ROOTED_ADMIN_GOVERNANCE.md`
  - `ROOTED_ACCOUNT_GOVERNANCE_LAW.md`
- [ ] If governance logic is touched, the relevant law file is updated in the same commit.

✅ **If governance drift exists → BLOCK MERGE**

---

## ✅ FINAL MERGE ATTESTATION (LEGALLY BINDING)

By merging this code, I attest that:

- I have reviewed the **ROOTED Constitution, Stop Layer, and all Governance Laws**.
- This commit violates **NONE** of them.
- I understand violations result in:
  - Immediate access revocation
  - Permanent governance removal
  - Possible legal escalation

**Name:** __________________________  
**Role:** __________________________  
**Date:** __________________________  

---

✅ This checklist is a **constitutional enforcement instrument**.  
✅ No convenience, profit, timeline, or pressure overrides this gate.
