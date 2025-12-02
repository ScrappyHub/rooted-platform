# ⚖️ ROOTED — ADMIN GOVERNANCE LAW

Authority Level: Absolute Platform Law  
Enforcement: Constitution → RLS + Feature Flags + Admin RPCs  
Effective Date: First Public Launch  

Admins exist to protect ROOTED — not control it.

---

## ✅ LEGAL ADMIN POWERS (LIMITED & LOGGED)

Admins may ONLY perform actions that are:

✅ Governed by Feature Flags  
✅ Enforced by RLS  
✅ Executed via public RPCs  
✅ Logged in `public.user_admin_actions`  

### Allowed Domains:

- User Role changes
- Tier changes
- Account status changes
- Moderation approvals/rejections
- Feature flag updates
- Badge grants/revocations
- Provider suspensions
- Safety enforcement actions

---

## ❌ ABSOLUTE PROHIBITIONS

Admins may NEVER:

- Assign themselves silent privileges
- Write direct SQL to bypass RLS
- Override Kids Mode
- Monetize sanctuaries
- Force discovery placement
- Edit analytics for appearances
- Silence reports without trace
- Create shadow features

---

## 🧾 MANDATORY AUDIT LOGGING

Every admin RPC MUST:

1. Call `public.is_admin()`
2. Write to `public.user_admin_actions`
3. Store:
   - admin_id
   - target_user_id
   - action_type
   - details
   - created_at

Failure to log = illegal action.

---

## 🚨 EMERGENCY OVERRIDES (INTERNAL ONLY)

Only internal service-role functions may bypass `public.is_admin()`:

- `_admin_*_internal`
- Not exposed to frontend
- Not callable by user sessions

Emergency use requires:

- Incident reason
- Timestamp
- Post-action audit

---

## ⚖️ ENFORCEMENT

Violations result in:

- Immediate admin removal
- Forensic audit
- Governance expulsion
- Possible legal escalation

---

**Cross-Reference:**
- ROOTED_PLATFORM_CONSTITUTION.md  
- ROOTED_ACCESS_POWER_LAW.md  
- ROOTED_ADMIN_OVERRIDES_LAW.md  
- ROOTED_COMMUNITY_TRUST_LAW.md  
- ROOTED_KIDS_MODE_GOVERNANCE.md  
