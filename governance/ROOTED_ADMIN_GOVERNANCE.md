Authority Level: Canonical Governance Law
Enforcement: Constitution → Stop Layer → Database (RLS + RPCs) → Admin UI
Effective Date: First Public Launch

This file governs all administrative power inside ROOTED.

If this file conflicts with:

ROOTED_PLATFORM_CONSTITUTION.md

ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md

👉 Those files override this one immediately.

1. PURPOSE

Admin access exists only for platform safety and continuity, never for:

Profit extraction

Political influence

Discovery manipulation

Personal convenience

Investor pressure

Admin power is custodial, not sovereign.

2. WHO IS AN ADMIN (LEGAL DEFINITION)

A user is an Admin ONLY IF:

public.user_tiers.role = 'admin'

public.user_tiers.account_status = 'active'

No UI toggle, environment variable, or backend key grants admin status outside public.user_tiers.

Cross-Reference:
ROOTED_ACCOUNT_GOVERNANCE_LAW.md
ROOTED_ACCESS_POWER_LAW.md

3. WHAT ADMINS ARE ALLOWED TO DO

Admins may ONLY perform the following actions:

Account status changes (active / suspended / locked)

Role adjustments (user ↔ vendor ↔ institution ↔ admin)

Tier adjustments (free / premium / premium_plus)

Feature flag updates (governed)

Moderation decisions (approve / reject)

Emergency safety interventions

Abuse response actions

All actions MUST go through admin RPCs only.

4. WHAT ADMINS ARE NEVER ALLOWED TO DO

❌ Bypass RLS
❌ Create shadow permissions
❌ Grant commercial access to prohibited entities
❌ Override Kids Mode
❌ Force holiday activation
❌ Suppress lawful speech
❌ Alter analytics
❌ Target discovery for revenue
❌ Access raw PII outside scoped views
❌ Perform manual SQL edits to governance tables

Cross-References:
ROOTED_KIDS_MODE_GOVERNANCE.md
ROOTED_COMMUNITY_TRUST_LAW.md
ROOTED_DATA_SOVEREIGNTY_LAW.md

5. MANDATORY ADMIN LOGGING (NON-NEGOTIABLE)

Every admin mutation MUST be recorded in:

public.user_admin_actions

This includes:

Role changes

Tier changes

Feature flag changes

Suspensions

Lockouts

Forced provider disablement

Moderation approvals / rejections

Revenue tool revocation

Unlogged admin action = platform law violation.

6. EMERGENCY POWERS (STRICTLY LIMITED)

Admins may perform emergency actions ONLY to prevent:

Child harm

Physical danger

Real-world criminal activity

Data poisoning

Infrastructure compromise

Emergency powers:

Are time-limited

Are scope-limited

Are fully logged

Are automatically audited

Cross-Reference:
ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md

7. ADMINS ARE BOUND BY LAW

Admins are legally bound by:

Platform Constitution

Stop Layer

Data Sovereignty Law

Kids Mode Governance

Sanctuary & Nonprofit Law

“I was an admin” is never a legal defense.

8. VIOLATIONS

Any admin who violates governance is subject to:

Immediate privilege revocation

Full internal audit

Permanent governance disqualification

Legal escalation where applicable

✅ Admin power in ROOTED is logged, audited, and law-bound.
✅ No admin is sovereign.
✅ No admin outranks the Constitution.
