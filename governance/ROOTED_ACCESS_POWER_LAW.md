# ROOTED – Platform Access & Power Limitation Law

Version: Canonical  
Authority Level: Absolute Platform Law  
Enforcement: RLS + Feature Flags + Admin RPCs + Audit Logs  
Effective Date: First Public Deployment

---

## 🧭 PURPOSE

This law exists to ensure that **no human, account, or system inside ROOTED can ever possess unchecked power.**

ROOTED explicitly rejects:

- Silent control
- Shadow privileges
- Unlogged overrides
- “Founder exception” logic
- Revenue-driven privilege escalation

Power inside ROOTED must always be:

- ✅ Logged  
- ✅ Audited  
- ✅ Role-scoped  
- ✅ Tier-scoped  
- ✅ Feature-flag-scoped  
- ✅ Time-bounded when possible  

---

## 👤 ADMIN POWER IS RESTRICTED BY LAW

Admins **do not own ROOTED**. They are stewards bound by this law.

Admins may only act through:

- RLS-protected tables
- SECURITY DEFINER RPCs
- Feature flag gates
- Audit-logged operations

Every admin action that mutates governance or accounts **must write to**:

- `public.user_admin_actions`  
- or a documented, append-only audit table

---

## ✅ PERMITTED ADMIN ACTIONS (LOGGED ONLY)

Admins may perform:

- Role changes
- Tier changes
- Feature flag updates
- Account suspensions or lockouts
- Badge grants or revocations
- Provider sanctions
- Moderation approvals and rejections

These actions must be:

- ✅ Logged  
- ✅ Auditable  
- ✅ Reversible where possible  
- ✅ Reviewable by other admins  

---

## ❌ ABSOLUTE ADMIN PROHIBITIONS

Admins may **never**:

- Bypass RLS via ad-hoc SQL for user-facing data
- Grant commercial tools to prohibited entities (e.g., sanctuaries)  
- Override Kids Mode protections or monetize kids
- Force holiday or cultural activation without consent
- Silence lawful community activity for personal or commercial gain
- Inflate or manipulate analytics reporting
- Manipulate discovery ranking for private deals
- Deploy shadow features outside governance docs
- Override moderation outcomes without trace

There are **no exceptions** — including founders.

---

## 🧾 GIT-LOCKED AUTHORITY

All access rules must exist in:

- GitHub governance files (this repo)
- Supabase functions
- RLS policies / migrations

If a rule is **not written in GitHub**, it has **no legal authority** inside ROOTED.

Git is the canonical record of:

- Laws
- Migrations
- Admin RPC definitions
- RLS policies

---

## 🧒 SUPREME CHILD SAFETY CLAUSE

If child safety ever conflicts with:

- Revenue
- Growth
- Analytics
- Advertising
- Institutional pressure
- Investor pressure

➡ **Child safety ALWAYS wins.** No exceptions.

Kids Mode monetization is permanently banned.  
Landmarks and kids attention cannot be sold.

---

## 🧑‍⚖️ FOUNDER NON-CENTRALIZATION CLAUSE

ROOTED is not permitted to structurally depend on the founder for:

- Daily operational control  
- Emergency override authority  
- Governance enforcement  
- Revenue gatekeeping  
- Platform identity or branding decisions  

The founder:

- Must not be required to be present for ROOTED to function  
- Must not be treated as a single point of failure  
- Must not be secretly granted special powers  
- Must be removable from admin roles without breaking the system  

All privileged powers must be:

- ✅ Role-scoped  
- ✅ Logged  
- ✅ Audited  
- ✅ Revocable  

ROOTED is governed by **law**, not personality.  
No one is exempt.

---

## 🚨 ENFORCEMENT

Any unlogged or abusive use of power results in:

- Immediate privilege revocation  
- Forensic audit of affected data  
- Permanent governance removal  
- Possible legal escalation depending on jurisdiction  

This law binds:

- Admins
- Developers
- Founders
- Contractors
- Service accounts

---

## 🌐 SCOPE

This law applies across:

- ROOTED Core
- ROOTED Community (live)
- All present and future verticals (Construction, Education, etc.), whether they ever launch or not

If any future feature, vertical, or partner attempts to bypass this law:

➡ This law wins.
