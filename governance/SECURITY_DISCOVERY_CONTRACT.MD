# ROOTED – UI ↔ Backend Discovery Contract

## Purpose

This document defines the non-negotiable contract between:
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

For all discovery surfaces:

- ✅ Backend MUST return 6–8 results MAX
- ✅ UI MUST render exactly what backend returns
- ❌ UI may NOT request unlimited results
- ❌ UI may NOT paginate discovery rows by default
- ❌ UI may NOT override result limits

Backend is the source of truth.

---

## 2. UI Layout Rules

All discovery UI components MUST obey:

- One discovery row = one 6–8 vendor set
- Cards must be equal visual weight
- No visual stacking or pay-to-win priority
- No “sponsored” positioning inside discovery rows

---

## 3. Filter Behavior Contract

Filters MAY change:

- Specialty
- Vendor type
- Program type

Filters MAY NOT change:

- Result count
- Radius
- Rotation behavior
- Discovery ranking weight

---

## 4. Rotation Sync Rule

- Backend controls rotation order
- UI receives pre-rotated results
- UI is NOT allowed to reshuffle discovery order
- Page reloads MAY cause rotation
- Button presses MAY trigger new rotated pulls

---

## 5. Vertical Inheritance

This contract applies to:

- ROOTED Community (live)
- Any future vertical that adopts discovery surfaces

Using discovery at all means inheriting this contract.  
Nothing in this document is a promise that other verticals will launch.

Violation = platform-breaking defect.

---

## Final Authority

This is a binding engineering contract.  
Frontend and backend MUST pass QA against this document before any release.
