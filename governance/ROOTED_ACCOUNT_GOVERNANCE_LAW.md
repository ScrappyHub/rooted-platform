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

## ✅ ROLE LAW (NO SELF-SERVICE ROLES)

- **Every account starts as `community`.** Provisioning any other role is refused (`ACCOUNT_MUST_BE_PROVISIONED_COMMUNITY`).
- **Nobody chooses or changes their own role**, not at sign-up and not later. `public.set_my_role_and_tier` only toggles kids mode (community accounts only); any role in it is refused (`ROLE_CHANGE_REQUIRES_APPROVAL`).
- **To become a vendor or institution, an account submits one application:** `rooted_api.submit_role_application_v1(role, application)`. The application is validated field by field and must name an open vertical. A vendor must confirm being 18 or older, and kids-mode accounts can't apply. Only one application or role request can be open at a time.
- **An admin decides the application** (`public.admin_decide_role_application_v1`: approve, reject, or needs_info, always with a reason; WBS 1.37 admin-session layer). Approval grants the role and records the constitutional application decision in one transaction. Rejection rejects both. needs_info lets the applicant correct the application (`update_my_role_application_v1`); the vertical can't be changed. The applicant is notified of every decision and may withdraw while the application is open. An admin can never decide their own application.
- Other role changes (for example back to `community`) use `rooted_api.request_my_role_change_v1` and admin approval. Vendor/institution can't be requested that way.
- Approval is refused while the account would become `community` but still owns providers or holds memberships, or while a paid subscription is live (subscriptions are role-scoped).
- **Existing roles that predate this rule are under ratification review:** each one stays in place until an admin approves (ratified) or rejects (returned to `community`, refused while providers or a subscription remain). The account holder can't cancel a ratification review.
- The only other role path is the governed admin RPC `admin_set_role_tier`, never on the admin's own account. The database refuses **every other role write**, including raw SQL, forged session settings and service code.
- **Every role event is audited:** requests, cancellations, decisions and every actual change (`ROLE_CHANGED` on every path) go to append-only evidence, and admin decisions also go to `user_admin_actions`.
- `admin` is never self-service.

---

## ✅ TIER & ENTITLEMENT LAW

- A paid tier (`premium`, `premium_plus`) exists only with canonical subscription authority (active subscription + matching `billing_entitlements`) or an audited admin grant.
- Paid feature flags derive from (role, tier). Flags that no governed logic consumes are not allowed (no silent feature injections).
- **Billing lanes.** Every paid price belongs to exactly one lane: `vendor`, or `institution:<type>` (hospital, jail, nonprofit, school, university, generic). An account may buy, switch to, or be granted access by only the prices of its own lane. A subscription on another lane's price grants nothing.
- **Institution type.** An institution's billing type comes from its approved application or from an audited admin decision that records how the type was verified. An institution without a recorded type cannot buy a paid plan.
- **Plan changes.** Customers change plans only within their own lane. An account without a lane may still cancel; cancelling is never blocked.
- **Drift review.** Paid access that the payment provider does not back is detected and recorded for admin review. It is never downgraded automatically; every downgrade or dismissal is an audited admin decision with notes.

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
The 3 `providers.is_founding_member = true` rows that predate WBS 1.23, the disabled legacy vertical-specific founding-vendor trigger and the `founding_partners_v1` view are **historical and non-authoritative**. They are frozen, grant nothing and do not consume capacity.

§7 — Founder ≠ authority  
Founder status never grants admin, provider ownership, payment, refund or any other authority.

---

## ✅ PROVIDER OWNERSHIP & RETIREMENT LAW

- **Ownership changes only by approved transfer.** The owner proposes (`rooted_api.propose_provider_ownership_transfer_v1`). The recipient, who must be an active, approved vendor or institution, accepts (`rooted_api.respond_provider_ownership_transfer_v1`). An admin approves (`public.admin_decide_provider_ownership_transfer_v1`, WBS 1.37 admin-session layer). Either party may cancel before the decision.
- The database refuses **every other owner change** (`PROVIDER_OWNERSHIP_CHANGE_REQUIRES_APPROVAL`), including raw SQL, forged session settings and service code.
- **Closing a provider means retiring it.** The owner requests (`rooted_api.request_provider_retirement_v1`) and an admin approves (`public.admin_decide_provider_retirement_v1`). `RETIRED` is terminal: the provider becomes inactive and undiscoverable, open transfers are cancelled, and **every record is kept**. Providers are never deleted.
- A retired provider can't be transferred, reactivated or retired again.
- Retired providers are historical. They don't block the owner's account deletion or a return to `community`. Live providers do.
- Founder economics stay with the original founder user (Founding Provider Law §4–§5). Recognition stays with the provider.
- Every step writes append-only evidence to `rooted_policy.provider_governance_events_v1`. Admin decisions also write `user_admin_actions`.

---

## ✅ PRIVACY OF ACCOUNT STATE

A caller can ask about **their own** role, compliance or entitlements, never someone else's. Admins and internal governed code are excepted. Read predicates that take a user id are bound to the caller.

---

## ✅ LEGAL DELETION PIPELINE

ALL deletions route through `public.account_deletion_requests` and end in a **soft delete**:

1. The account holder requests deletion (`rooted_api.request_my_account_deletion_v1`) and may cancel while pending (`rooted_api.cancel_my_account_deletion_v1`).
2. An admin approves or rejects (`public.admin_decide_account_deletion_v1`, WBS 1.37 admin-session layer). An admin cannot approve their own deletion, and an admin account must be demoted before it can be deleted.
3. Live provider ownership and memberships must be resolved first, by an approved transfer or retirement. Deletion is not provider dissolution.
4. On approval the account becomes `soft_deleted`: identity banned, sessions revoked, and the request plus evidence retained.

5. **Billing:** if a subscription was live, a cancellation request is queued automatically. The billing worker cancels the subscription in Stripe and records the result. Failures retry, then go to manual review. Admins can retry or record a manual resolution with notes. These records are permanent.
6. **Retention (`ROOTED_ACCOUNT_RETENTION_V1`):**
   - **At soft delete:** device tokens and notifications are removed.
   - **After 30 days, once billing is closed:** personal data is redacted in place. That covers the identity email, phone and metadata; application contact details; messages, posts and comments; and free-text reasons.
   - **Kept:** financial, governance and audit records, business names and the Stripe customer id. Financial records are kept for 7 years.
   - **Evidence:** every redaction is recorded, append-only.

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
❌ No self-selected or unapproved roles  
❌ No unapproved provider ownership changes  
❌ No provider deletion (retire instead)  

---

Accounts are governed by LAW, not convenience.
