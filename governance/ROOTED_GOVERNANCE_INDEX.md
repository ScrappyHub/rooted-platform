# ROOTED — GOVERNANCE INDEX & CHAIN OF AUTHORITY (v2)

## 🧭 PURPOSE

This file is the **single entry point** for all governance inside ROOTED.

It defines:

- What laws exist  
- What order they apply in  
- How conflicts are resolved  
- What systems enforce them  
- What documents hold legal authority  

If **anything** contradicts this index → **this index wins.**

---

## 🏛️ GOVERNANCE HIERARCHY (CHAIN OF AUTHORITY)

ROOTED is governed in strict descending order of authority:

### 1️⃣ ROOTED PLATFORM CONSTITUTION

**File:** `ROOTED_PLATFORM_CONSTITUTION.md`  
Defines:

- Platform identity & mission  
- Ethics and non-negotiable boundaries  
- Power limits on admins, devs, and institutions  
- Supreme child safety clause  

➡ If any law or implementation conflicts with the Constitution → the Constitution wins.

---

### 2️⃣ GOVERNANCE LAW FILES (CANONICAL SET)

These are the **only** legally binding governance law docs inside ROOTED:

1. **ROOTED Governance & Ethics**  
   **File:** `ROOTED_GOVERNANCE_ETHICS.md`  
   Scope:
   - Consent-first governance  
   - Kids Mode monetization bans  
   - Non-commercial landmarks  
   - Cultural & holiday consent  
   - Political neutrality  
   - Surveillance prohibition  
   **Status:** ✅ Active Law  

2. **ROOTED Data Sovereignty & User Consent**  
   **File:** `ROOTED_DATA_SOVEREIGNTY_LAW.md`  
   Scope:
   - User owns their data  
   - No third-party resale  
   - No silent tracking  
   - Export / delete / revoke rights  
   **Status:** ✅ Active Law  

3. **ROOTED Platform Access & Power Limitation**  
   **File:** `ROOTED_ACCESS_POWER_LAW.md`  
   Scope:
   - No silent admin power  
   - Mandatory audit logging  
   - Feature flags cannot be bypassed  
   - GitHub is the only implementation authority  
   **Status:** ✅ Active Law  

4. **ROOTED Community Trust & Safety Law**  
   **File:** `ROOTED_COMMUNITY_TRUST_LAW.md`  
   Scope:
   - Moderation required for visibility  
   - Kids protection overrides all growth  
   - Permanent bans for:
     - Predation  
     - Volunteer abuse  
     - Targeting minors  
   **Status:** ✅ Active Law  

5. **ROOTED Sanctuary & Nonprofit Protection Law**  
   **File:** `ROOTED_SANCTUARY_NONPROFIT_LAW.md`  
   Scope:
   - Sanctuaries are:
     - Volunteer-only  
     - Mission-only  
     - No marketplace access  
   - Nonprofits receive added protection from exploitation  
   **Status:** ✅ Active Law  

6. **ROOTED Admin Overrides & Emergency Access Law**  
   **File:** `ROOTED_ADMIN_OVERRIDES_LAW.md`  
   Scope:
   - Logged admin overrides only  
   - Emergency-only internal functions  
   - No hidden bypass authority  
   **Status:** ✅ Active Law  

7. **ROOTED Contributor Governance Notice**  
   **File:** `ROOTED_CONTRIBUTOR_GOVERNANCE_NOTICE.md`  
   Scope:
   - Developers are legally bound by ROOTED law  
   - No “business necessity” excuses for harm  
   - No silent feature injection  
   **Status:** ✅ Active Law  

8. **ROOTED Account Governance Law (NEW)**  
   **File:** `ROOTED_ACCOUNT_GOVERNANCE_LAW.md` (or your canonical admin/governance handoff doc)  
   Scope:
   - `public.user_tiers` as the **sole source of truth** for:
     - role / tier  
     - account_status  
     - feature_flags  
   - `user_admin_actions` as **immutable admin audit log**  
   - `account_deletion_requests` as the only legal deletion path  
   - All status/role/tier/flags changes go through **admin RPCs only**  
   **Status:** ✅ Active Law  

9. **ROOTED Kids Mode & Youth Protection Law (NEW)**  
   **File:** `KIDS_MODE_GOVERNANCE.md`  
   Scope:
   - Kids Mode as a **governance contract**, not a theme  
   - Age-appropriate overlays via `kids_mode_overlays`  
   - Forbidden surfaces in Kids Mode (medical, security, adult-only)  
   **Status:** ✅ Active Law  

---

### 3️⃣ DATABASE ENFORCEMENT (NON-NEGOTIABLE)

This is where governance becomes **code and SQL**.

#### 3.1 Account Governance Layer

Enforced through:

- `public.user_tiers`
  - `role` (guest / individual / vendor / institution / admin)  
  - `tier` (free / premium / premium_plus)  
  - `account_status` (active / suspended / locked / pending_deletion)  
  - `feature_flags` (JSONB, vertical + consent gates)

- `public.user_admin_actions`
  - Immutable record of **every** admin mutation

- `public.account_deletion_requests`
  - Legal-grade deletion pipeline status

- Admin RPCs:
  - `admin_get_user_accounts()`
  - `admin_set_account_status()`
  - `admin_set_role_tier()`
  - `admin_update_feature_flags()`

**Law:**

- ❌ No manual SQL updates for role/tier/status/feature flags in day-to-day ops  
- ❌ No account deletion outside `account_deletion_requests` pipeline  
- ✅ All admin mutations must log in `user_admin_actions`

#### 3.2 Canonical Taxonomy & Safety Layer

Enforced through:

- `badges` (trust & discovery)
- `specialty_types` (global vertical taxonomy)
- `experience_types` (cross-vertical experiences)
- `compliance_overlays` (legal & safety constraints)
- `landmark_types` (map & discovery)
- `kids_mode_overlays` (youth education translation)

**Law:**

- ❌ No hard deletes from these tables  
- ❌ No semantic repurposing of existing codes  
- ✅ New codes must be additive, mapped to existing verticals  

**Canonical reference:** `TAXONOMY_CANONICAL.md`

---

### 4️⃣ ADMIN OVERSIGHT & MUTATION

Admins operate through:

- Admin UI (backed only by admin RPCs)
- No direct writes to core tables outside allowed RPCs

**Canonical reference:**

- `ADMIN_GOVERNANCE.md`
- `ROOTED_ADMIN_OVERRIDES_LAW.md`

Law:

- ❌ No silent admin actions  
- ✅ Every mutation is auditable  
- ✅ Admin powers are narrow and governance-bound  

---

### 5️⃣ USER INTERFACE (DISPLAY ONLY)

The UI is:

- A **representation**, not a source of truth  
- Bound by:
  - RLS
  - Views
  - Feature flags
  - Admin RPCs

Law:

- ❌ UI cannot grant access that database governance denies  
- ❌ UI cannot suppress legal rights (export, delete, consent)  
- ✅ UI must reflect the state of governance truth, not define it  

---

## 🧒 SUPREME CHILD SAFETY CLAUSE (GLOBAL OVERRIDE)

If child safety ever conflicts with:

- Revenue  
- Growth  
- Analytics  
- Advertising  
- Institutional pressure  
- Investor pressure  

➡ **Child safety ALWAYS wins.** No exceptions.  
This applies across all verticals and all future expansions.

Kids Mode law + governance ethics + account governance must **always** side with protection of minors.

---

## 🧾 RATIFICATION

This governance structure is ratified by:

- ✅ The ROOTED Founder  
- ✅ The ROOTED Governance Framework  
- ✅ The first public deployment of the platform  

Once ratified:

- ❌ Cannot be overridden by UI  
- ❌ Cannot be overridden by admin convenience  
- ❌ Cannot be overridden by monetization  
- ❌ Cannot be overridden by investors  

If any future change attempts to weaken:

- Data sovereignty  
- Account governance  
- Kids Mode protection  
- Compliance overlays  

➡ That change is invalid under this index.

ROOTED is not just an app.  
It is a governed civic system with **law baked into the database and code.**
****
