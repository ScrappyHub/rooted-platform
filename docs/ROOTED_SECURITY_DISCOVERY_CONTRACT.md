# 🧭 ROOTED – UI ↔ Backend Discovery Contract (CANONICAL)

Cross-References:

- /governance/ENFORCEMENT_MATRIX.md  
- /governance/ROOTED_COMMUNITY_TRUST_LAW.md  
- /governance/ROOTED_PLATFORM_CONSTITUTION.md  
- /governance/ROOTED_ANTI_PROFILING_LAW.md (if split out)  
- /docs/TAXONOMY_CANONICAL.md  

Purpose: This document defines the **non-negotiable contract** between:

- Backend discovery APIs  
- Frontend UI discovery layouts  
- Card rendering behavior across all ROOTED verticals that use discovery  

This contract enforces:

- Fair exposure  
- Visual consistency  
- Anti-manipulation  
- No UI/Backend drift over time  

Violation = **platform-breaking defect**.

---

## 1️⃣ Global Card Limit Contract

For **all discovery surfaces** in all verticals:

- ✅ Backend MUST return **6–8 results MAX** per discovery row  
- ✅ UI MUST render **exactly what backend returns**  
- ❌ UI may NOT request unlimited results  
- ❌ UI may NOT paginate discovery rows by default  
- ❌ UI may NOT override backend result limits  

Backend discovery views & RPCs are the **source of truth** for:

- Which entities appear  
- How many entities appear  
- In what order they appear  

---

## 2️⃣ UI Layout Rules

Discovery UI components MUST obey:

- One discovery row = **one 6–8 vendor/institution set**  
- All cards use:

  - Equal visual weight  
  - Equal opportunity to be clicked  

- No visual stacking or “tower cards” that imply priority  
- No pay-to-win priority inside discovery rows  
- No “sponsored” or “ad” positioning within core discovery rows  

If ROOTED adds **separately labeled** sponsorship surfaces, they must be:

- Clearly marked as “sponsored”  
- Physically separated from canonical discovery rows  

---

## 3️⃣ Filter Behavior Contract

Filters MAY change:

- Specialty  
- Vendor / institution type  
- Program type  
- Kids Mode vs normal mode  

Filters MAY **NOT** change:

- Result count (6–8)  
- Baseline radius chosen by backend  
- Rotation behavior parameters  
- Discovery ranking weights  

Backend owns:

- Ranking algorithm  
- Rotation cadence  
- Geo radius and fairness constraints  

UI’s job is to request with parameters, not to re-rank or expand the set.

---

## 4️⃣ Rotation Sync Rule

Rotation rules:

- Backend controls rotation order and eligibility  
- UI receives **pre-rotated** results  
- UI is **not allowed** to reshuffle, re-order, or re-sort discovery order  

Allowed:

- Page reloads MAY cause a new rotated pull  
- Explicit refresh or “shuffle” buttons MAY trigger new backend requests  

Not allowed:

- Random client-side shuffling  
- Local storage hacks that pin certain providers without backend law  

---

## 5️⃣ Vertical Inheritance

This contract applies to:

- ✅ ROOTED Community (live)  
- ✅ Any future vertical that adopts “discovery” surfaces  

Adopting discovery at all implies:

> “This vertical inherits the UI ↔ Backend discovery contract.”

Nothing here guarantees another vertical launches; it only states:

- If a vertical uses discovery rows → it must follow this document.  

---

## 6️⃣ Anti-Profiling & Fairness Integration

This contract is tightly bound to:

- Anti-profiling law (no demographic ranking)  
- Community trust & fairness law  

Therefore:

- Discovery ranking cannot use demographics, religion, race, income, or inferred sensitive attributes  
- Ranking is based on:

  - Trust & compliance badges  
  - Youth safety & sanctuary law  
  - Activity & moderation status  
  - Seasonal logic defined in governance  

Any attempt to add “high-value user” scoring or demographic targeting to discovery is **illegal under ROOTED law**.

---

## 7️⃣ Final Authority

This document is a **binding engineering contract**.

Before any release:

- Frontend and backend MUST pass QA against this contract  
- Any refactor or experiment must confirm:

  - Result counts are unchanged  
  - Ordering is backend-owned  
  - UI does not re-rank  

If there is conflict between:

- A product request, and  
- This contract or governance laws  

Then:

> The discovery contract + governance law win. The product request is rejected or redesigned.
