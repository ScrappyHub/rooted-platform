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

ROOTED is governed in **strict descending order of authority**:

---

### 1️⃣ ROOTED PLATFORM CONSTITUTION (SUPREME AUTHORITY)

**File:** `ROOTED_PLATFORM_CONSTITUTION.md`  

Defines:

- Platform identity & mission  
- Ethics and non-negotiable boundaries  
- Anti-profiling & non-surveillance law  
- Power limits on admins, devs, institutions  
- Supreme child safety clause  
- Sanctuary & nonprofit absolute protection  
- Founder non-centralization  
- Git-locked authority  

➡ If anything conflicts with the Constitution → **the Constitution always wins.**

---

### 2️⃣ CANONICAL GOVERNANCE LAW FILES (ONLY LEGAL LAWS)

These are the **only legally binding governance law documents inside ROOTED**:

1. **ROOTED Governance & Ethics**  
   `ROOTED_GOVERNANCE_ETHICS.md`  
   - Consent-first design  
   - Political neutrality  
   - Anti-surveillance  
   - Non-extractive growth  
   ✅ Active Law  

2. **ROOTED Data Sovereignty & User Consent**  
   `ROOTED_DATA_SOVEREIGNTY_LAW.md`  
   - User owns all data  
   - No resale  
   - No third-party monetization  
   - Export & deletion rights  
   ✅ Active Law  

3. **ROOTED Platform Access & Power Limitation**  
   `ROOTED_ACCESS_POWER_LAW.md`  
   - Role/tier enforcement  
   - Feature flags are law  
   - GitHub is authority  
   ✅ Active Law  

4. **ROOTED Community Trust & Safety Law**  
   `ROOTED_COMMUNITY_TRUST_LAW.md`  
   - Moderation required  
   - Child protection overrides growth  
   - Permanent bans for predation & abuse  
   ✅ Active Law  

5. **ROOTED Sanctuary & Nonprofit Protection Law**  
   `ROOTED_SANCTUARY_NONPROFIT_LAW.md`  
   - No commerce  
   - Volunteer + education only  
   ✅ Active Law  

6. **ROOTED Admin Overrides & Emergency Access Law**  
   `ROOTED_ADMIN_OVERRIDES_LAW.md`  
   - Logged emergency overrides only  
   ✅ Active Law  

7. **ROOTED Contributor Governance Notice**  
   `ROOTED_CONTRIBUTOR_GOVERNANCE_NOTICE.md`  
   - Developers are legally bound  
   - No silent features  
   ✅ Active Law  

8. **ROOTED Account Governance Law**  
   `ROOTED_ACCOUNT_GOVERNANCE_LAW.md`  
   - `public.user_tiers` = sole source of truth  
   - `user_admin_actions` = immutable audit trail  
   - `account_deletion_requests` = only legal deletion path  
   ✅ Active Law  

9. **ROOTED Kids Mode & Youth Protection Law**  
   `ROOTED_KIDS_MODE_GOVERNANCE.md`  
   - Kids Mode is legal governance  
   - No commerce, no messaging, no ads  
   ✅ Active Law  

---

### 3️⃣ DATABASE ENFORCEMENT (LAW BECOMES CODE)

#### 3.1 Account Governance Layer

Enforced through:

- `public.user_tiers`
- `public.user_admin_actions`
- `public.account_deletion_requests`

Law:

- ❌ No manual SQL updates to role/tier/status  
- ❌ No deletion outside legal deletion pipeline  
- ✅ All admin mutations must be logged  

---

#### 3.2 Canonical Taxonomy & Safety Layer

Enforced through:

- `specialty_types`
- `experience_types`
- `compliance_overlays`
- `landmark_types`
- `kids_mode_overlays`

Law:

- ❌ No hard deletes  
- ❌ No semantic repurposing  
- ✅ Additive expansion only  

---

### 4️⃣ ADMIN OVERSIGHT & MUTATION

Admins operate only through:

- Logged Admin UI
- Admin RPCs

Law:

- ❌ No silent authority  
- ✅ Every action auditable  

---

### 5️⃣ USER INTERFACE (DISPLAY-ONLY LAYER)

UI is:

- Bound by RLS, Views, Feature Flags, Admin RPCs  
- Never a source of truth  

Law:

- ❌ UI cannot override governance  
- ❌ UI cannot suppress legal rights  

---

## 🧒 SUPREME CHILD SAFETY CLAUSE (GLOBAL OVERRIDE)

If child safety ever conflicts with:

- Revenue  
- Growth  
- Ads  
- Analytics  
- Institutions  
- Investors  

➡ **Child Safety ALWAYS wins. No exceptions.**

---

## 🧾 RATIFICATION

Ratified by:

- ✅ The ROOTED Founder  
- ✅ The Governance Framework  
- ✅ First Public Launch  

Once ratified:

- ❌ Cannot be overridden by UI  
- ❌ Cannot be overridden by admins  
- ❌ Cannot be overridden by monetization  
- ❌ Cannot be overridden by investors  

---

ROOTED is not just software.  
It is a **governed civic system with law embedded into code.**
