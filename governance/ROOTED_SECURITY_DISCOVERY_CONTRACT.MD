# 🔍 ROOTED – UI ↔ Backend Discovery Contract

Authority Level: Binding Engineering Contract  
Enforcement: Governance → Backend (Views + RLS) → UI  
Effective Date: First Public Launch  

This document defines the **non-negotiable contract** between:

- Backend discovery APIs  
- Frontend UI discovery layouts  
- Card rendering behavior across all current and future ROOTED verticals  

This contract ensures:

- Fair exposure  
- Visual consistency  
- Anti-manipulation enforcement  
- Backend and frontend never drift apart  

---

## 1. Global Card Limit Contract

For all discovery surfaces (home rows, carousels, featured sections):

- ✅ Backend MUST return **6–8 results max** per discovery row  
- ✅ UI MUST render **exactly** what backend returns  
- ❌ UI may NOT request unlimited results  
- ❌ UI may NOT paginate discovery rows by default  
- ❌ UI may NOT override result limits or “show more” without a new backend call  

Backend is the **source of truth** for discovery limits.

---

## 2. UI Layout Rules

All discovery UI components MUST obey:

- One discovery row = one 6–8 item set  
- Cards must be **equal visual weight**  
- No visual stacking or “pay-to-win” priority within a row  
- No “sponsored” positioning inside a discovery row  

If sponsored placements ever exist in other surfaces,  
they **must not** infiltrate discovery rows that obey this contract.

---

## 3. Filter Behavior Contract

Filters MAY change:

- Specialty or category  
- Vendor/institution type  
- Program or experience type  

Filters MAY NOT change:

- Result count per discovery row  
- Geographic radius contract (if defined by backend)  
- Rotation behavior rules  
- Core ranking weight logic  

Filters are **refinements**, not a way for the UI to break discovery law.

---

## 4. Rotation Sync Rule

- Backend controls **rotation order**  
- UI receives **pre-rotated** ordered results  
- UI is **not allowed** to reshuffle discovery order locally  
- Page reloads MAY cause a new rotation (via backend)  
- Explicit refresh / “new picks” buttons MAY trigger new backend pulls  

Any local reshuffling or biasing in the UI is considered a violation.

---

## 5. Vertical Inheritance

This contract applies to:

- ✅ ROOTED Community (live)  
- ✅ Any future vertical that adopts discovery surfaces  

Using any “discovery” UI pattern implies accepting this contract.  
Nothing in this file is a promise that other verticals will launch; it only governs behavior if they do.

Violation of this contract is a **platform-level defect**, not just a “frontend bug.”

---

## 6. Security & Governance Cross-Reference

Discovery behavior must comply with:

- `ROOTED_ACCESS_POWER_LAW.md` (no shadow privileges or backdoor boosting)  
- `ROOTED_GOVERNANCE_ETHICS.md` (no exploitative or manipulative sorting)  
- `ROOTED_COMMUNITY_TRUST_LAW.md` (moderation and trust as preconditions)  
- `ROOTED_SANCTUARY_NONPROFIT_LAW.md` (no commercial boosting for sanctuaries)  

Backend views define **who is eligible** to appear.  
This contract defines **how eligible results are rendered**.

---

## Final Authority

This is a binding engineering contract.  

Frontend and backend MUST pass QA against this document **before any release** that touches discovery.

If UX, product, or growth goals conflict with this contract →  
**this contract wins.**
