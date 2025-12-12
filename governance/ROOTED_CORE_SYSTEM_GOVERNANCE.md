# 🧬 ROOTED — CORE SYSTEM GOVERNANCE (CANONICAL)

**Authority Level:** HIGH  
*(Below the Stop Layer & Constitution, Above All Vertical Docs)*  
**Effective Scope:** All ROOTED Verticals  

## ⚠️ Conflict Rule

- If this file conflicts with a **Vertical Governance Doc** → **THIS FILE WINS**
- If this file conflicts with the **Stop Layer or Constitution** → **STOP LAYER + CONSTITUTION WIN**

---

## 0. 🔗 Canonical Cross-References

### ✅ Supreme Authority

- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`
- `/governance/ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md`

### ✅ Primary Inherited Law

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

### ✅ Bound Vertical Governance

- `/governance/ROOTED_COMMUNITY_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_EDUCATION_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_CONSTRUCTION_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_EXPERIENCES_VERTICAL_GOVERNANCE.md`
- `/governance/ROOTED_ARTS_CULTURE_VERTICAL_GOVERNANCE.md`

### ✅ Implementation Contracts (Non-Law, Binding)

- `/governance/ROOTED_VERTICAL_ACCESS_CONTRACT.md`
- `/docs/ROOTED_FRONTEND_SYSTEM_CONTRACT.md`
- `/docs/Master_Debug_Toolkit.md`
- `/docs/ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md`

---

## 1. 🎯 Purpose of This File

This file is the **system-wide governor** that binds:

- Identity
- Roles & tiers
- Feature flags
- Vertical interoperation
- Kids Mode & Sanctuary behavior across ROOTED

This file **DOES NOT**:

- Define database schema  
- Define UI design  
- Override the Stop Layer or Constitution  

---

## 2. 🆔 Single Identity Doctrine (Hard Law)

- Every human has **ONE ROOTED identity**
- One `auth.users` row  
- One `public.user_tiers` row  
- Multiple verticals may attach to this same identity  

🚫 No second account  
🚫 No shadow login  
🚫 No duplicate identity per vertical  

All verticals **MUST** reuse:

- `user_tiers.role`
- `user_tiers.tier`
- `user_tiers.feature_flags`

---

## 3. ⚖️ Roles, Tiers & Power (Cross-Law Binding Summary)

### Roles
- `community_member`
- `vendor`
- `institution`
- `admin`

### Tiers
- `free`
- `premium`
- `premium_plus`

### 🔒 Non-Negotiable Rule

No tier upgrade may bypass:

- Kids Mode Law
- Sanctuary Law
- Admin Governance Law
- Data Sovereignty Law  

**More power never overrides safety.**

---

## 4. 🧭 ROOTED Vertical Model (Law-Bound)

ROOTED operates five verticals:

1. **Community** — civic discovery, food, land, trust  
2. **Education** — institutions, learning, field trips, sessions  
3. **Construction** — B2B infrastructure & services  
4. **Experiences** — guided activities, outdoor & adventure  
5. **Arts & Culture** — venues, galleries, shows, cultural life  

Each vertical:

- Must define its scope in its own Vertical Governance file  
- May **NOT** override:
  - Kids Mode
  - Sanctuary Protection
  - Access & Power Law
  - Data Law  
- Must use the **same identity + tier system**

---

## 5. 🧒 Kids Mode & 🐾 Sanctuary Binding Across All Verticals

### 🧒 Kids Mode

Defined **ONLY** in:

- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`

All verticals must enforce:

- Non-commercial
- No messaging
- No donations
- No analytics
- No pressure mechanics  

Vertical docs may describe *where* Kids content appears,  
but **may never weaken protection.**

---

### 🐾 Sanctuaries & Rescues

Governed **ONLY** by:

- `/governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md`

Sanctuaries must **NEVER**:

- Monetize
- Bid
- Use RFQs
- Enter bulk markets  

They may **ONLY**:

- Host volunteer work
- Host education  

Only **Community** (and explicitly authorized verticals) may surface sanctuaries.

---

## 6. 🔑 Vertical Access & Invitations

All vertical access rules live in:

- `/governance/ROOTED_VERTICAL_ACCESS_CONTRACT.md`

This file enforces **cross-vertical integrity**.  
Vertical docs **may NOT redefine identity or access mechanics.**

---

## 7. 🖥️ Frontend & Figma Are Bound — But Not Law

Frontend, Vercel, Figma, and UI flows:

- ✅ May only **IMPLEMENT** law  
- ❌ May **NOT DEFINE** law  

Contracts live in:

- `/docs/ROOTED_FRONTEND_SYSTEM_CONTRACT.md`

---

## 8. 🛑 Change Control (Hard Lock)

Any change that impacts:

- Roles
- Tiers
- Kids Mode
- Sanctuaries
- Vertical access
- Identity

**MUST:**

1. Update this file  
2. Update Vertical Governance  
3. Pass:
   - Stop Layer
   - Enforcement Matrix
   - Pre-Commit Checklist  

---

# ROOTED — Vertical Boundary Diagram

                    ROOTED PLATFORM GOVERNANCE
                              │
                    ROOTED CORE (identity, RLS, views)
      ┌───────────────────────┼────────────────────────┐
      │                       │                        │
 COMMUNITY                 EDUCATION               INFRASTRUCTURE
 (public layer)           (youth & learning)       (systems literacy)
      │                       │                        │
 AGRICULTURE          SCIENCE & MAKER            META INFRASTRUCTURE
 ENVIRONMENT          MENTAL HEALTH              REGIONAL INTEL
 COMMUNITY SERVICES   EXPERIENCES                LAND RESOURCES
 ARTS & CULTURE       (non-commercial)           MANUFACTURING

---

## Vertical Inheritance Rule

Every vertical is an application layer on top of ROOTED Core.
ROOTED Core owns:

- Identity (roles, tiers)
- Permissions (RLS)
- Feature flags
- Providers + Media
- Events, Landmarks, Messaging
- RFQs, Bids, Bulk, Workforce
- Seasonal & regional intelligence
- Kids Mode & sanctuary enforcement
- Notifications & moderation
- Billing & payment governance

Verticals may NOT redefine:
- roles
- tiers
- access rules
- moderation power
- discovery/GEO law
- kids/sanctuary/profiling rules

---

## ✅ STATUS

**CORE SYSTEM GOVERNANCE IS NOW CANONICALLY LOCKED**  
All work beyond this point is **execution only**.
