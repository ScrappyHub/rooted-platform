# ROOTED_CORE_SYSTEM_GOVERNANCE.md

Authority Level: HIGH (below Stop Layer, above vertical docs)  
Effective Scope: All ROOTED verticals (Community, Education, Construction, Experiences, Arts & Culture)  
If this file and a vertical doc disagree → this file wins.  
If this file and the Stop Layer / Constitution disagree → **Stop Layer + Constitution win.**

---

## 0. Cross-References (Canonical Stack)

Top-level authority:

- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`
- `/governance/ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md`

Primary laws this file inherits:

- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`
- `/governance/ROOTED_DATA_SOVEREIGNTY_LAW.md`
- `/governance/ROOTED_ACCESS_POWER_LAW.md`
- `/governance/ROOTED_COMMUNITY_TRUST_LAW.md`
- `/governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md`
- `/governance/ROOTED_ADMIN_GOVERNANCE.md`
- `/governance/ROOTED_ACCOUNT_GOVERNANCE_LAW.md`
- `/governance/ROOTED_PRE_COMMIT_GOVERNANCE_CHECKLIST.md`
- `/governance/ROOTED_FOUNDER_PROTECTION_AND_SUCCESSION.md`
- `/governance/ENFORCEMENT_MATRIX.md`

Vertical-specific docs this file binds together (existing or future):

- `/governance/ROOTED_COMMUNITY_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_EDUCATION_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_CONSTRUCTION_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_EXPERIENCES_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_ARTS_CULTURE_VERTICAL_GOVERNANCE.md`

Implementation-level contracts (not law, but must obey law):

- `/governance/ROOTED_VERTICAL_ACCESS_CONTRACT.md`
- `/docs/ROOTED_FRONTEND_SYSTEM_CONTRACT.md`
- `/docs/Master_Debug_Toolkit.md`
- `/docs/ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md`

---

## 1. What This File Does

This document:

1. Defines how **roles, tiers, feature flags, and verticals** relate to each other.  
2. States that there is **one ROOTED identity per human**, reused across verticals.  
3. Defines how **Kids Mode** and **sanctuaries** sit in the system across verticals.  
4. Delegates per-vertical details to vertical governance docs, without letting them contradict core law.

This document does **not**:

- Change Stop Layer / Constitution.
- Define SQL schemas.
- Define UI design.

---

## 2. Single Identity, Multiple Verticals

1. ROOTED uses **one identity layer** for all verticals:
   - Users are linked via `auth.users` + `public.user_tiers`.
2. A person may:
   - Be a community member only.
   - Be a vendor/institution in one or more verticals.
   - Be an admin (strictly governed).
3. Vertical access is controlled by:
   - `user_tiers.role` (`community`, `vendor`, `institution`, `admin`, etc.).
   - `user_tiers.tier` (`free`, `premium`, `premium_plus`, etc.).
   - `user_tiers.feature_flags` (e.g. `vertical_construction_access`, `vertical_education_access`).

**No vertical may require a separate ROOTED account.**  
All verticals must respect this file and `/governance/ROOTED_VERTICAL_ACCESS_CONTRACT.md`.

---

## 3. Roles, Tiers & Power (Cross-Law Summary)

This section summarizes existing law; it does not override it.

- **Roles** (governed by `ROOTED_ACCESS_POWER_LAW.md`):
  - `community_member` (default, lowest power)
  - `vendor`
  - `institution`
  - `admin`
- **Tiers** (defined in Constitution / Access Law):
  - `free`
  - `premium`
  - `premium_plus`
- **Power is always limited by:**
  - Access & Power Law
  - Admin Governance
  - Kids Mode Governance
  - Sanctuary Nonprofit Law

Where there is conflict between “more tools” and “safety / kids / sanctuaries” →  
**Kids & sanctuary law win** (see Stop Layer + Kids Law).

---

## 4. Vertical Model (High-Level)

ROOTED currently has five governed verticals:

1. **Community** — public, non-commercial discovery & trust.
2. **Education** — field trips, learning experiences, institution-grade coordination.
3. **Construction** — B2B construction and infrastructure marketplace & analytics.
4. **Experiences** — adventure / activities vertical with trust, safety, and eligibility rules.
5. **Arts & Culture** — venues, galleries, events, cultural discovery.

Each vertical must:

- Map its specifics into a vertical doc, e.g.:
  - `/governance/ROOTED_COMMUNITY_VERTICAL_GOVERNANCE.md`
- Respect:
  - Kids Mode law
  - Sanctuary law (where applicable)
  - Data Sovereignty law
  - Access & Power law
- Use **the same identity & tier model** defined in this file.

---

## 5. Kids Mode & Sanctuaries Across Verticals

This file does NOT redefine Kids or sanctuary law. It **binds** them across verticals:

1. Kids Mode:
   - Rules are defined in `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`.
   - All verticals **must** implement Kids Mode as:
     - View-only, non-commercial experience.
     - No direct messaging.
     - No donations, bids, or monetization.
   - Vertical docs may define *where* Kids content appears, but not weaken protections.

2. Sanctuaries & rescues:
   - Law is defined in `/governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md`.
   - These entities **may only**:
     - Run volunteer & education events.
   - They **may not**:
     - Use commercial tools (bids, bulk markets, RFQs).
   - Only **Community** (and any explicitly allowed verticals) may surface sanctuaries, and always under sanctuary law.

---

## 6. Vertical Access & Invitation (Delegated)

The detailed rules for:

- Unlocking new verticals for existing users.
- Inviting trusted users from one vertical into another.
- Enforcing feature flags for `*_access`.

…are defined in:

- `/governance/ROOTED_VERTICAL_ACCESS_CONTRACT.md`

This file declares that all vertical access must **obey** that contract.

---

## 7. Frontend & Figma Contracts (Non-Law but Binding)

Implementation details (routes, components, Figma pages) live in:

- `/docs/ROOTED_FRONTEND_SYSTEM_CONTRACT.md`
- vertical-specific FE/BE contracts under `/docs/`

Those documents:

- May not introduce new roles, tiers, or laws.
- Must reference this file and the Stop Layer.
- Are allowed to get deleted or refactored **only** if this file and the Stop Layer remain consistent.

---

## 8. Change Control

Any change that:

- Adds a new vertical,
- Adjusts role/tier semantics,
- Changes how Kids Mode or sanctuaries cross verticals,

…must:

1. Update this file.  
2. Update the relevant vertical governance doc(s).  
3. Be checked against:
   - `/governance/ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md`
   - `/governance/ENFORCEMENT_MATRIX.md`
   - `/governance/ROOTED_PRE_COMMIT_GOVERNANCE_CHECKLIST.md`

If a proposed change conflicts with Stop Layer or Constitution → it is not allowed.
