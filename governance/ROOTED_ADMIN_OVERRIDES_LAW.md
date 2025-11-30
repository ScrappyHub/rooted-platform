# 🧑‍⚖️ ROOTED ADMIN OVERRIDES LAW (CANONICAL)

Admins exist to protect the system — not control it.

This law defines the only legal administrative powers inside ROOTED.

---

## ✅ LEGAL ADMIN POWERS

Admins may only perform actions that are:

- Governed by feature flags
- Enforced by RLS
- Executed via public RPCs
- Logged in `public.user_admin_actions`

### Allowed Admin Domains:

- User Role & Tier changes
- Account status changes
- Moderation approvals/rejections
- Feature flag updates
- Badge grants/revocations
- Provider suspensions
- Sanctions & safety enforcement

---

## ❌ ABSOLUTE PROHIBITIONS

Admins may **never**:

- Assign themselves silent privileges
- Bypass RLS via direct SQL
- Override Kids Mode
- Grant monetized tools to prohibited entities
- Force holiday activations
- Alter analytics data for appearance
- Disable moderation controls
- Deploy shadow features outside governance

---

## 🧾 MANDATORY AUDIT LOGGING

Every admin RPC **must**:

1. Call `public.is_admin()`
2. Write a row to `public.user_admin_actions`
3. Store:
   - admin_id
   - target_user_id
   - action_type
   - details (jsonb)
   - created_at

Failure to log = illegal action.

---

## 🚨 EMERGENCY OVERRIDES

Only the following may bypass `public.is_admin()`:

- Internal `_admin_*_internal` functions
- Service-role only
- Not exposed to frontend
- Not callable from user sessions

Emergency use requires:

- Incident Reason
- Timestamp
- Post-action audit review

---

## ⚖️ ENFORCEMENT

Any violation of this law results in:

- Immediate admin removal
- Forensic audit
- Governance expulsion
- Possible legal escalation
