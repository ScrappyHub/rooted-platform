# ✅ ROOTED PRE-COMMIT GOVERNANCE CHECKLIST  
**Required Before Any Merge to Main / Production**  
**Authority Level:** Mandatory  
**Applies To:** All developers, contractors, and maintainers

This checklist is a **hard gate**.  
If ANY item below is not satisfied, the change **may not be merged**.

---

## 🔒 1. CHILD SAFETY & KIDS MODE

- [ ] No code path exposes **pricing, sales, fundraising, booking, RFQs, bids, or subscriptions** to Kids Mode.
- [ ] No provider or institution can message a Kids Mode user.
- [ ] All Kids Mode content paths enforce **kids-safe flags** at the backend.
- [ ] No holiday overlays reach Kids Mode without **triple consent** (user + business + kids-safe).
- [ ] No Kids Mode features are monetized in any way.

✅ If any Kids Mode rule is violated → **BLOCK MERGE**

---

## 🎭 2. CULTURAL & HOLIDAY CONSENT

- [ ] No holiday is auto-enabled by default.
- [ ] All holiday logic requires:
  - [ ] User opt-in
  - [ ] Business opt-in
  - [ ] Date in defined holiday window
- [ ] No cultural or religious inference is introduced anywhere in code.

✅ If ANY holiday appears without dual/triple consent → **BLOCK MERGE**

---

## 🧠 3. DATA SOVEREIGNTY & CONSENT

- [ ] No new data collection occurs without explicit user-facing consent.
- [ ] No third-party data resale, enrichment, or broker integration is added.
- [ ] No hidden tracking, fingerprinting, or silent background collection exists.
- [ ] All analytics additions are transparent, auditable, and disablable.

✅ If silent or extractive data logic is present → **BLOCK MERGE**

---

## ⚙️ 4. ADMIN POWER & ACCESS CONTROL

- [ ] All privileged actions are logged in `user_admin_actions`.
- [ ] No new admin bypass, debug override, or silent escalation exists.
- [ ] Feature flags remain the source of truth — UI-only gating is not relied upon.
- [ ] Sanctuaries and non-commercial entities are not granted commercial tools.

✅ If unlogged power is added → **BLOCK MERGE**

---

## 🛡️ 5. DISCOVERY, MODERATION & TRUST

- [ ] All public discovery paths require **approved moderation status**.
- [ ] No entity appears publicly without:
  - Approved moderation
  - Active account status
  - Explicit discoverability enabled
- [ ] No “shadow publish” or auto-approval logic is introduced.

✅ If moderation is bypassed → **BLOCK MERGE**

---

## 🗺️ 6. LANDMARK & COMMUNITY SPOT SAFETY

- [ ] Landmarks remain **100% non-commercial**.
- [ ] No pricing, ads, RFQs, bids, or booking are attached to landmarks.
- [ ] Community spot uploads remain blocked for non-admins.
- [ ] Kids Mode has no community upload/edit access.

✅ If community spot safety weakens → **BLOCK MERGE**

---

## 🧾 7. CODE & GOVERNANCE ALIGNMENT

- [ ] This change does NOT conflict with:
  - `ROOTED_PLATFORM_CONSTITUTION.md`
  - `ROOTED_GOVERNANCE_ETHICS.md`
  - `ROOTED_DATA_SOVEREIGNTY_LAW.md`
  - `ROOTED_ACCESS_POWER_LAW.md`
  - `ROOTED_COMMUNITY_TRUST_LAW.md`
- [ ] If it introduces new logic touching governance, the relevant law file is updated in the same commit.

---

## ✅ FINAL MERGE ATTESTATION

By merging this code, I affirm that:

- I have reviewed **all ROOTED governance laws**.
- This commit violates **none** of them.
- I accept full responsibility for governance compliance.

**Name:** __________________________  
**Role:** __________________________  
**Date:** __________________________  

---
