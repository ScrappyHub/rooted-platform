# 🧠 ROOTED — ACCOUNT GOVERNANCE LAW
Authority Level: Absolute Platform Law  
Enforcement: Constitution → Stop Layer → Database → Admin RPCs → UI  
Effective Date: First Public Launch  
Revision: WBS 2 alignment, 2026-09-22 (brought into agreement with the enforced database)

Cross-References:
→ ROOTED_PLATFORM_CONSTITUTION.md  
→ ROOTED_STOP_LAYER.md  
→ ROOTED_ADMIN_GOVERNANCE.md  

---

## ✅ SOLE SOURCE OF TRUTH

The ONLY legal authority for account state is:

public.user_tiers

Fields:

- role — `community | vendor | institution | admin`
- tier — `free | premium | premium_plus`
- account_status — `active | suspended | soft_deleted`
- feature_flags

JWT claims, frontend state and profile fields are never account authority.

---

## ✅ ACCOUNT STATUS LAW

| Status | Meaning | Enforced effect |
|---|---|---|
| `active` | Normal account | May act, subject to all other authority |
| `suspended` | Temporarily removed by an admin | Auth identity banned, all sessions revoked, every governed write denied, direct table writes denied |
| `soft_deleted` | Deleted through the governed pipeline | Same as suspended, and **terminal**: no path back to `active` |

Rules (database-enforced):

- Every new account is provisioned `active`.
- No person may change their own account status.
- `soft_deleted` can only be entered through the governed deletion pipeline.
- The last active admin can never be suspended or deleted.
- Every status change writes append-only evidence to `rooted_policy.account_governance_events_v1`.

---

## ✅ ADMIN AUDIT LAW

All privileged changes MUST be logged to:

public.user_admin_actions

`user_admin_actions` is append-only and can never be removed with an identity.

---

## 🔒 FOUNDING PROVIDER LAW (CANONICAL: WBS 1.23)

§1 — Program  
Founding Provider status is governed by `rooted_policy.founder_programs_v1` (`FOUNDING_PROVIDER_V1`). The founder epoch begins at the **first governed enrollment**.

§2 — Capacity  
At most **3** governed founder enrollments may exist (`max_governed_enrollments = 3`).

§3 — Authority chain  
Founder status is created only through the governed enrollment lifecycle:  
request (`request_founding_provider_enrollment_v1`) → admin decision with evidence (`admin_decide_founding_provider_enrollment_v1`, WBS 1.37 admin-session layer) → materialization (`admin_materialize_founding_provider_enrollment_v1`) → economic entitlement (`admin_materialize_founder_economic_entitlement_v1`).  
No table edit, legacy trigger, badge backfill or UI may create founder status. `providers.is_founding_member` is a projection that the database refuses to set without a governed enrollment.

§4 — Economic entitlement  
The original founder **user** receives:
- Lifetime Premium floor
- Permanent 50% discount on Premium Plus
- Founders Badge (lifetime)

Economic benefits belong to the original founder user and do **not** transfer with the provider. The provider's recognition survives an ownership transfer. The effective entitlement is resolved by `rooted_policy.resolve_effective_account_entitlement_v1`. Billing must use it, not raw flags.

§5 — Non-transferability  
Founder economics cannot be transferred, sold, inherited or applied to another account.

§6 — Legacy state  
The 3 `providers.is_founding_member = true` rows that predate WBS 1.23, the disabled `assign_founding_agriculture_vendor_v1` trigger and the `founding_partners_v1` view are **historical and non-authoritative**. They are frozen, grant nothing and do not consume capacity.

§7 — Founder ≠ authority  
Founder status never grants admin, provider ownership, payment, refund or any other authority.

---

## ✅ LEGAL DELETION PIPELINE

ALL deletions route through `public.account_deletion_requests` and end in a **soft delete**:

1. The account holder requests deletion (`rooted_api.request_my_account_deletion_v1`) and may cancel while pending (`rooted_api.cancel_my_account_deletion_v1`).
2. An admin approves or rejects (`public.admin_decide_account_deletion_v1`, WBS 1.37 admin-session layer). An admin cannot approve their own deletion, and an admin account must be demoted before it can be deleted.
3. Provider ownership and provider memberships must be resolved first. Deletion is not provider dissolution.
4. On approval the account becomes `soft_deleted`: identity banned, sessions revoked, and the request plus evidence retained.

❌ No hard deletes. Raw deletion of `auth.users` is refused by the database (`ROOTED_HARD_DELETE_FORBIDDEN`). Any future legal-erasure purge must be its own governed, audited migration.  
❌ No monetization blocking deletion. A live subscription never blocks approval; it is recorded as `billing_cancellation_required` for the billing lane.  
❌ No silent account erasure. Every step writes append-only evidence and an admin audit row.

---

## ❌ PROHIBITIONS

❌ No direct SQL role edits  
❌ No manual tier bypass  
❌ No silent feature injections  
❌ No monetization overrides  
❌ No self-service status changes  

---

Accounts are governed by LAW, not convenience.
