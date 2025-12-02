# 🧾 ROOTED — ACCOUNT GOVERNANCE LAW

Authority Level: Absolute Platform Law  
Enforcement: Constitution → Database (RLS + RPCs + Views)  
Effective Date: First Public Launch  

This law defines the **only legal way accounts may be governed inside ROOTED.**

---

## ✅ SOLE SOURCE OF TRUTH

`public.user_tiers` is the ONLY legal source of truth for:

- role
- tier
- account_status
- feature_flags

No other table, cache, or UI state may override this.

---

## ✅ LEGAL ACCOUNT STATUS VALUES

Only these values are permitted:

- active
- suspended
- locked
- pending_deletion

Any undefined 상태 = illegal.

---

## ✅ ADMIN MUTATION PIPELINE (REQUIRED)

All account changes MUST go through:

- `admin_set_account_status()`
- `admin_set_role_tier()`
- `admin_update_feature_flags()`

Direct SQL edits are forbidden.

---

## ✅ IMMUTABLE AUDIT SYSTEM

All changes MUST be recorded in:

- `public.user_admin_actions`

This log is:

✅ Append-only  
✅ Non-editable  
✅ Forensic-grade  

---

## ✅ LEGAL DELETION PIPELINE

All deletions MUST go through:

- `public.account_deletion_requests`

No manual deletions.
No silent deletions.
No monetization blocks allowed.

---

## ❌ ABSOLUTE PROHIBITIONS

- No shadow roles
- No shadow flags
- No invisible suspensions
- No monetization coercion blocking deletion

---

## ⚖️ ENFORCEMENT

Violations trigger:

- Immediate privilege removal
- Full audit
- Potential governance termination

---

**Cross-Reference:**
- ROOTED_PLATFORM_CONSTITUTION.md  
- ROOTED_DATA_SOVEREIGNTY_LAW.md  
- ROOTED_ADMIN_GOVERNANCE.md  
- ROOTED_ACCESS_POWER_LAW.md  
