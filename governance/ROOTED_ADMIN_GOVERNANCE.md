# 🧑‍⚖️ ROOTED — ADMIN GOVERNANCE LAW
Authority Level: Absolute Platform Law  
Enforcement: Constitution → Stop Layer → Database (RLS + RPCs) → Audit Logs → UI  
Effective Date: First Public Launch  

Cross-References:
→ ROOTED_PLATFORM_CONSTITUTION.md  
→ ROOTED_STOP_LAYER.md  
→ ROOTED_ACCOUNT_GOVERNANCE_LAW.md  
→ ROOTED_KIDS_MODE_GOVERNANCE.md  

Admins exist to protect the system — not control it.

---

## ✅ LEGAL ADMIN POWERS

Admins may ONLY execute actions that are:

✅ Enforced by RLS  
✅ Executed via public RPCs  
✅ Logged in public.user_admin_actions  

Allowed Domains:

- Role & tier changes
- Account status changes
- Moderation approvals/rejections
- Feature flag updates
- Badge grants/revocations
- Provider suspensions
- Safety sanctions

---

## ❌ ABSOLUTE PROHIBITIONS

Admins may NEVER:

❌ Assign themselves silent privileges  
❌ Bypass RLS  
❌ Override Kids Mode  
❌ Grant commerce to sanctuaries  
❌ Force holiday activations  
❌ Alter analytics for appearance  
❌ Disable moderation  
❌ Create shadow features  

---

## 🧾 MANDATORY AUDIT LOGGING

Every admin RPC MUST write:

- admin_id
- target_user_id
- action_type
- details (jsonb)
- created_at

Failure to log = Illegal Action.

---

## ⚖️ ENFORCEMENT

Violation results in:

- Immediate admin removal
- Forensic audit
- Permanent governance expulsion
- Legal escalation if applicable

Admins are never above the law.

