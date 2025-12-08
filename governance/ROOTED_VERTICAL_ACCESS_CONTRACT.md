# ROOTED_VERTICAL_ACCESS_CONTRACT.md

Authority Level: HIGH (below CORE_SYSTEM_GOVERNANCE, above vertical docs)  
Scope: How a single ROOTED identity can access multiple verticals.  
If this file and a vertical doc disagree → this file wins.  

---

## 0. Cross-References

- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`
- `/governance/ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md`
- `/governance/ROOTED_CORE_SYSTEM_GOVERNANCE.md`
- `/governance/ROOTED_ACCESS_POWER_LAW.md`
- `/governance/ROOTED_ACCOUNT_GOVERNANCE_LAW.md`
- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`
- `/governance/ROOTED_COMMUNITY_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_EDUCATION_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_CONSTRUCTION_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_EXPERIENCES_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_ARTS_CULTURE_VERTICAL_GOVERNANCE.md`

Implementation references:

- `/docs/ROOTED_FRONTEND_SYSTEM_CONTRACT.md`
- `/docs/Master_Debug_Toolkit.md`

---

## 1. Single Account Principle

1. All humans have **one ROOTED account** (one `auth.users` row).  
2. Vertical access is controlled by:
   - `user_tiers.role`
   - `user_tiers.tier`
   - `user_tiers.feature_flags`
3. No vertical may require a second login, second email, or a shadow identity.

---

## 2. Vertical Access Flags

Each vertical uses explicit feature flags (examples, not schema):

- `vertical_community_access`
- `vertical_education_access`
- `vertical_construction_access`
- `vertical_experiences_access`
- `vertical_arts_culture_access`

A user:

- May see **discovery-only** surfaces without these flags (e.g. Community map).  
- Must have the proper flag(s) to:
  - Host events / trips / experiences.
  - Use dashboards, RFQs, bids, bulk market, analytics.
  - Post into that vertical’s B2B tools.

Backend defines which flags exist; frontend must **only read** and never invent them.

---

## 3. Trust-Based Invitations Between Verticals

Examples (non-exhaustive):

- A vendor with a clean history in **Community** may be invited into **Experiences**.
- An institution with repeated successful field trips may gain **Education** premium or premium_plus capabilities.
- A volunteer with N+ completed events in Community may be allowed to submit Experiences once.

Any such cross-vertical upgrade must:

1. Be initiated or confirmed by Admin Governance or clear automated criteria.  
2. Set the appropriate feature flags and/or role/tier.  
3. Never bypass Kids, Sanctuary, or Access & Power law.

Vertical docs (**Education, Construction, Experiences, Arts & Culture**) must describe their own “who can join” rules, but this file enforces:

> no second account, no shadow identity.

---

## 4. Kids Mode & Non-Commercial Surfaces

Vertical access must never undermine Kids Mode:

- Kids Mode remains **non-commercial** in all verticals.
- No feature flag may create a “paid Kids Mode”.
- Vendors/institutions may feed approved content into Kids Mode surfaces, but:
  - No analytics
  - No monetization
  - No pressure flows

Community and Education vertical docs define where Kids Mode appears, but must reference:

- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`
- this contract
- `/governance/ROOTED_CORE_SYSTEM_GOVERNANCE.md`

---

## 5. Admin, Institutions, and 2FA (Vertical-Aware)

- Admin roles (`role = 'admin'`) are vertical-wide by design but power is **limited by law**.
- Institutions must meet stronger security requirements (e.g., 2FA) to use vertical tools.

This contract requires:

- 2FA enforcement logic for:
  - Admin routes
  - Institution dashboards  
- Frontend checks may redirect; backend checks (RLS/RPC) must **block**.

The precise technical enforcement lives in:

- `/governance/ROOTED_ADMIN_GOVERNANCE.md`
- `/docs/ROOTED_FRONTEND_SYSTEM_CONTRACT.md`

---

## 6. Changes & Review

Any change that:

- Introduces a new vertical,
- Changes vertical access flags,
- Alters trust-based promotion logic,

…must:

1. Update this file.  
2. Update `/governance/ROOTED_CORE_SYSTEM_GOVERNANCE.md`.  
3. Be checked against the Stop Layer and Enforcement Matrix.  
4. Be documented in `/docs/Master_Debug_Toolkit.md` as a risk review item.
