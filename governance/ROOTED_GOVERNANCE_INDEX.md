# 🏛️ ROOTED — GOVERNANCE INDEX & CHAIN OF AUTHORITY (v3 CANONICAL)

File: /governance/ROOTED_GOVERNANCE_INDEX.md  
Authority Level: **Supreme Governance Router**  
Enforcement Chain:

CONSTITUTION  
→ STOP LAYER  
→ CANONICAL LAW FILES  
→ DATABASE (RLS + VIEWS + RPCs)  
→ ADMIN ACTIONS  
→ UI SURFACES  

Effective Date: First Public Launch  
Status: ✅ LOCKED | ✅ BINDING | ✅ NON-OPTIONAL

---

## 🧭 PURPOSE

This file is the **single authoritative router** for all governance inside ROOTED.

It defines:

- What laws exist
- What order they apply in
- How conflicts are resolved
- Which systems enforce which laws
- What documents carry **legal authority**

> If anything contradicts this file → **THIS FILE WINS.**

No UI, feature, admin action, investor request, or experiment may bypass this chain.

---

## 🏛️ GOVERNANCE HIERARCHY  
### (STRICT ORDER OF POWER — NO EXCEPTIONS)

---

### **1️⃣ ROOTED PLATFORM CONSTITUTION (SUPREME AUTHORITY)**

File:
`ROOTED_PLATFORM_CONSTITUTION.md`

Defines:

- Platform identity & non-negotiable mission
- Anti-profiling & anti-surveillance doctrine
- Supreme child safety law
- Sanctuary & nonprofit absolute protection
- Founder non-centralization & successor lock
- Git-locked authority
- No unlimited power principle

➡ If **ANYTHING** conflicts with the Constitution →  
**The Constitution ALWAYS wins.**

---

### **2️⃣ ROOTED CONSTITUTIONAL STOP LAYER (ENFORCEMENT SHIELD)**

File:
`ROOTED_STOP_LAYER.md`

Purpose:

- Freezes all critical governance permanently
- Blocks:
  - Political override
  - Investor override
  - Admin override
  - Emergency override of Kids Mode
- Locks:
  - Kids Mode
  - Sanctuary Protection
  - Data Sovereignty
- Prohibits silent power anywhere in the system

➡ If anything attempts to bypass governance →  
**The Stop Layer nullifies it instantly.**

---

### **3️⃣ CANONICAL GOVERNANCE LAW SET (ONLY LEGAL LAWS)**

These are the **ONLY documents** below the Constitution that can define:

- Power
- Access
- Safety
- Data use
- Monetization
- Enforcement authority

**The Canonical Law Set:**

- `ROOTED_GOVERNANCE_ETHICS.md`
- `ROOTED_DATA_SOVEREIGNTY_LAW.md`
- `ROOTED_ACCESS_POWER_LAW.md`
- `ROOTED_COMMUNITY_TRUST_LAW.md`
- `ROOTED_SANCTUARY_NONPROFIT_LAW.md`
- `ROOTED_KIDS_MODE_GOVERNANCE.md`
- `ROOTED_ADMIN_GOVERNANCE.md`
- `ROOTED_ACCOUNT_GOVERNANCE_LAW.md`
- `ROOTED_CONTRIBUTOR_GOVERNANCE_NOTICE.md`
- `ROOTED_PRE_COMMIT_GOVERNANCE_CHECKLIST.md`
- `ROOTED_FOUNDER_PROTECTION_AND_SUCCESSION.md`

➡ **NO document outside this list may define power, access, safety, or monetization rights.**

All other documents are **implementation references**, not law.

---

## ⚖️ 4️⃣ DATABASE AS THE PRIMARY ENFORCEMENT ENGINE

The database is the **first real enforcement surface** for governance.

Enforcement Layers:

- ✅ RLS Policies
- ✅ Security Definer RPCs
- ✅ Read-Only Views
- ✅ Insert-Only Pipelines
- ✅ Audit Tables

Canonical Enforced Tables:

- `user_tiers`
- `user_admin_actions`
- `moderation_queue`
- `providers`
- `events`
- `landmarks`
- `rfqs`
- `bids`
- `bulk_offers`
- `notifications`

Rules:

- UI is **never trusted alone**
- Admins **never bypass RLS**
- Service roles **never bypass governance law**
- All violations become **audit events**

---

## 🧑‍⚖️ 5️⃣ ADMIN AS CONTROL — NOT AS POWER

Admins sit **below the database** in the chain.

They:

- ✅ Execute law via RPCs
- ✅ Moderate content
- ✅ Assign roles & feature flags
- ✅ Verify badges & sanctuaries

They **DO NOT**:

- Override Kids Mode
- Grant sanctuary monetization
- Inject discovery bias
- Delete audit history
- Alter governance law

All admin actions:

- Must route through RPCs
- Must write to `user_admin_actions`
- Must respect `public.is_admin()` + `account_status = active`

---

## 🖥️ 6️⃣ UI AS THE LAST & WEAKEST LAYER

The UI:

- Reflects governance
- DOES NOT define governance
- NEVER overrides:
  - RLS
  - Feature flags
  - Moderation status
  - Kids Mode
  - Sanctuary protection

If UI behavior ever conflicts with:

- Database enforcement
- Governance law
- Canonical contracts

➡ The UI is **wrong and must be fixed**.

---

## 🔔 7️⃣ CANONICAL IMPLEMENTATION DOCUMENTS (NON-LAW, BUT BINDING)

These documents **do not define law**, but they **bind implementation**:

- `ROOTED_SECURITY.md`
- `ROOTED_SECURITY_DISCOVERY_CONTRACT.md`
- `ROOTED_MODERATION_SYSTEM.md`
- `ROOTED_NOTIFICATIONS.md`
- `ROOTED_MASTER_DEBUG_TOOLKIT.md`
- `ROOTED_PRE_LAUNCH_ABUSE_TEST_MATRIX.md`
- `ROOTED_SEEDING_CANONICAL.sql`
- `ROOTED_TAXONOMY_CANONICAL.md`
- `ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md`
- `ROOTED_OPEN_HARDENING_TASKS.md`

These files:

- Must never conflict with law
- Must implement law exactly
- Can evolve only if law allows it

---

## 🧬 8️⃣ CONFLICT RESOLUTION RULE (ABSOLUTE)

If a conflict appears between:

UI vs Database → **Database wins**  
Admin vs RLS → **RLS wins**  
Feature Request vs Governance → **Governance wins**  
Business Goal vs Kids Mode → **Kids Mode wins**  
Profit vs Sanctuary Protection → **Sanctuary wins**  
Speed vs Auditability → **Auditability wins**

There is **no exception path**.

---

## 🛑 9️⃣ FORBIDDEN GOVERNANCE ACTIONS (PERMANENTLY ILLEGAL)

- Bypassing Kids Mode filters
- Granting monetization to sanctuaries
- Creating shadow admin roles
- Mutating `user_tiers` outside RPCs
- Silent deletion of audit records
- Discovery bias injection
- Demographic-based ranking
- Political content propagation
- Emergency override of law

Any attempt to implement these is treated as a **platform violation**.

---

## ✅ 1️⃣0️⃣ CANONICAL STATUS

This Governance Index is:

- ✅ Binding on all contributors
- ✅ Binding on all admins
- ✅ Binding on all AI systems
- ✅ Binding on all future verticals
- ✅ Binding across all ROOTED codebases

Once this file is committed:

> **ROOTED governance is officially frozen at the authority level.**

Everything that follows is **pure execution only**.
