# ⚙️ ROOTED — PLATFORM ACCESS & POWER LIMITATION LAW

Version: Canonical  
Authority Level: Absolute Platform Law  
Enforcement: Constitution → Stop Layer → RLS + Feature Flags + Admin RPCs + Audit Logs → UI  
Effective Date: First Public Deployment  

Cross-References:
→ ROOTED_PLATFORM_CONSTITUTION.md  
→ ROOTED_STOP_LAYER.md  
→ ROOTED_ADMIN_GOVERNANCE.md  
→ ROOTED_ACCOUNT_GOVERNANCE_LAW.md  
→ ROOTED_KIDS_MODE_GOVERNANCE.md  

---

## 🧭 PURPOSE

This law exists to ensure that:

👉 No human, account, service, or system inside ROOTED can ever possess unchecked power.

ROOTED explicitly rejects:

- Silent control  
- Shadow privileges  
- Unlogged overrides  
- “Founder exception” logic  
- Revenue-driven privilege escalation  

All power inside ROOTED must always be:

✅ Logged  
✅ Audited  
✅ Role-scoped  
✅ Tier-scoped  
✅ Feature-flag scoped  
✅ Time-bounded where possible  

---

## 👤 ADMIN POWER IS RESTRICTED BY LAW

Admins do NOT own ROOTED.  
They are stewards bound by this law.

Admins may act only through:

- RLS-protected tables  
- SECURITY DEFINER RPCs  
- Feature flag gates  
- Audit-logged operations  

Every admin action that mutates governance, access, safety, or monetization MUST write to:

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

All permitted actions must be:

✅ Logged  
✅ Auditable  
✅ Reversible where possible  
✅ Reviewable by other admins  

---

## ❌ ABSOLUTE ADMIN PROHIBITIONS

Admins may NEVER:

- Bypass RLS via ad-hoc SQL for user-facing data  
- Grant commercial tools to prohibited entities (e.g., sanctuaries)  
- Override Kids Mode protections  
- Monetize children  
- Force holiday or cultural activation without consent  
- Silence lawful community activity for personal, political, or commercial gain  
- Inflate or manipulate analytics reporting  
- Manipulate discovery ranking for private deals  
- Deploy shadow features outside governance docs  
- Override moderation outcomes without trace  

👉 There are NO exceptions — including the Founder.

---

## 🧾 GIT-LOCKED AUTHORITY

All access rules must exist in:

- GitHub governance files  
- Supabase functions  
- RLS policies & migrations  

If a rule is NOT written in GitHub → it has NO legal authority inside ROOTED.

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

➡ CHILD SAFETY ALWAYS WINS. NO EXCEPTIONS.

Kids Mode monetization is PERMANENTLY banned.  
Landmarks and children’s attention may NEVER be sold.

---


🔒 FOUNDING PROVIDER ECONOMIC ENTITLEMENT LAW (CANONICAL)

§1 — Definition
A Founding Provider is the first provider account ever created in the ROOTED system whose provider row is assigned a valid primary_vertical.

§2 — Immutable Status
The Founding Provider receives a non-revocable, lifetime economic entitlement consisting of:

Lifetime Premium Tier (cannot be downgraded)

Permanent 50% discount on any upgrade to Premium Plus

A Founders Badge displaying publicly on their provider profile

Internal is_founding_member = true written to their provider record

§3 — Authority Chain

This badge may not be granted manually by admins.

No table, RPC, or UI may modify or delete the founding privilege.

Only the Founding Provider Enrollment Trigger may assign it, and only once.

§4 — Economics Law Enforcement
Billing systems, edge functions, and upgrade flows must always read:

providers.is_founding_member = true
OR

user_tiers.feature_flags->>'founding_member' = 'true'

to determine:

Free Premium tier forever

Discounted Premium Plus rate

§5 — Non-transferability
The founding status cannot be transferred, sold, inherited, or applied to any other provider account.

§6 — Registry
The founding provider’s UUID must be permanently registered in:

ROOTED_FOUNDER_PROTECTION_AND_SUCCESSION.md

---

## 🧑‍⚖️ FOUNDER NON-CENTRALIZATION CLAUSE

ROOTED is NOT permitted to structurally depend on the Founder for:

- Daily operational control  
- Emergency override authority  
- Governance enforcement  
- Revenue gatekeeping  
- Platform identity or branding decisions  

The Founder:

- Must NOT be required for ROOTED to function  
- Must NOT be treated as a single point of failure  
- Must NOT be secretly granted special powers  
- Must be removable from admin roles without breaking the system  

All privilege inside ROOTED must be:

✅ Role-scoped  
✅ Logged  
✅ Audited  
✅ Revocable  

ROOTED is governed by LAW — not personality.  
No one is exempt.

---

## 🚨 ENFORCEMENT

Any unlogged or abusive use of power results in:

- Immediate privilege revocation  
- Forensic audit of affected data  
- Permanent governance removal  
- Legal escalation where applicable  

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
- ROOTED Community  
- All present and future verticals  

If any feature, vertical, partner, or actor attempts to bypass this law:

➡ This law wins.

---

## CLARIFICATION: OWNER IS A ROLE, NOT AN EXCEPTION (2026-10-10)

"There are NO exceptions, including the Founder" stays absolute. The platform Owner is a database-defined admin role with the widest permission set (see ADMIN_GOVERNANCE, ADMIN_AUTH_MODEL sections 11-14). It does not bypass logging, RLS, Kids Mode protections or any prohibition in this law. Every Owner action is audited the same as any other admin's.
