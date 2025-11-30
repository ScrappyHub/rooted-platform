# ⚙️ ROOTED PLATFORM ACCESS & POWER LIMITATION LAW  
Version: Canonical  
Authority Level: Absolute Platform Law  
Enforcement: RLS + Feature Flags + Admin RPCs + Audit Logs  
Effective Date: First Public Deployment

---

## 🧭 PURPOSE

This law exists to ensure that **no human, account, or system inside ROOTED can ever possess unchecked power**.

ROOTED explicitly rejects:

- Silent control
- Shadow privileges
- Unlogged overrides
- “Founder exception” logic
- Revenue-driven privilege escalation

Power inside ROOTED must always be:

✅ Logged  
✅ Audited  
✅ Role-scoped  
✅ Tier-scoped  
✅ Feature-flag-scoped  
✅ Time-bounded when possible  

---

## 👤 ADMIN POWER IS RESTRICTED BY LAW

Admins **do not own ROOTED**. They are stewards bound by this law.

Admins may only act through:

- RLS-protected tables
- SECURITY DEFINER RPCs
- Feature flag gates
- Audit-logged operations

Every admin action **must write to**:

`public.user_admin_actions`

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

✅ Logged  
✅ Auditable  
✅ Reversible  
✅ Reviewable  

---

## ❌ ABSOLUTE ADMIN PROHIBITIONS

Admins may **never**:

- Bypass RLS
- Grant commercial tools to prohibited entities (e.g., sanctuaries)
- Override Kids Mode protections
- Force holiday activation
- Silence lawful community activity
- Inflate or manipulate analytics
- Manipulate discovery for profit
- Deploy shadow features outside governance
- Override moderation outcomes without trace

There are **no exceptions** — including founders.

---

## 🧾 GIT-LOCKED AUTHORITY

All access rules must exist in:

- GitHub governance files
- Supabase functions
- RLS policies

> If a rule is not written in GitHub, it has **no legal authority inside ROOTED**.

---

## 🚨 ENFORCEMENT

Any unlogged or abusive use of power results in:

- Immediate privilege revocation
- Full forensic audit
- Permanent governance removal
- Potential legal escalation

This law binds:

- Admins
- Developers
- Founders
- Contractors
- Service accounts

## Founder Non-Centralization Clause

ROOTED is not permitted to structurally depend on the founder for:

- Daily operational control
- Emergency override authority
- Governance enforcement
- Revenue gatekeeping
- Political positioning
- Platform identity

The founder:

- Must not be required to be present for ROOTED to function
- Must not be treated as a single point of failure
- Must not be transformed into a power authority
- Must not be systemically irreplaceable

All privileged powers must be:
✅ Role-scoped  
✅ Logged  
✅ Audited  
✅ Revocable  

ROOTED is governed by law, not personality.
No one is exempt.
