# ⚖️ ROOTED_ADMIN_GOVERNANCE.md (Canonical)

Authority Level: Constitutional Enforcement Layer
Enforcement Chain:
Constitution → Stop Layer → Admin RPCs → RLS → Views → UI
Applies To: Admins, Moderators, Developers, Service Accounts
Effective Date: First Public Deployment

This file defines the only legal administrative powers inside ROOTED.
Admins protect the system — they do not control it.

Cross-References:

ROOTED_PLATFORM_CONSTITUTION.md

ROOTED_STOP_LAYER.md

ROOTED_ADMIN_OVERRIDES_LAW.md

ROOTED_ACCOUNT_GOVERNANCE_LAW.md

ROOTED_ACCESS_POWER_LAW.md

ROOTED_COMMUNITY_TRUST_LAW.md

ROOTED_KIDS_MODE_GOVERNANCE.md

ROOTED_CONTRIBUTOR_GOVERNANCE_NOTICE.md

🧭 1. Purpose of Admin Governance

Admins operate within strict limits to:

Protect users

Enforce trust & safety

Maintain moderation flows

Uphold constitutional law

Admins do not possess authority to:

Change governance

Override safety systems

Modify access law

Change platform identity

Make political/economic decisions for ROOTED

All admin power is bounded, logged, reversible, and non-transferable.

🛡️ 2. Allowed Admin Powers (Fully Legal)

Admins may perform actions ONLY through approved RPCs and logged paths:

2.1 User & Account Management

Approve / reject moderation items

Lock / unlock accounts

Suspend / reinstate providers

Change account status (active, suspended)

Initiate account deletion workflow (never silent deletion)

2.2 Feature & Access Controls

Toggle feature flags

Manage non-commercial access states

Manage Kids Mode safety exemptions (safe → safer, never weaker)

2.3 Marketplace & Vendor Oversight

Remove fraudulent listings

Remove unsafe events

Remove adult-only content outside policy

2.4 Safety & Incident Actions

Execute safety escalations

Trigger emergency internal-only functions

Freeze accounts during investigations

All powers require a logged entry in user_admin_actions.

❌ 3. Forbidden Powers (Absolute Prohibitions)

These cannot be granted under ANY circumstance.

Admins may never:

3.1 Attempt to Gain Silent Power

Bypass RLS

Execute direct SQL updates to roles, tiers, or security columns

Create shadow admin routes

Use service-role keys outside sanctioned RPCs

3.2 Violate Child Safety

Override Kids Mode

Grant messaging access to minors

Show commercial surfaces to Kids Mode

Bypass youth-safe overlays

Constitutional Override Applies.

3.3 Violate Sanctuary & Nonprofit Protection

Grant commercial tools to sanctuaries

Enable bidding / bulk commerce

Enable Premium/Premium+ tiers

3.4 Violate Data Sovereignty

Export user data silently

Access private data outside legal scope

Introduce third-party tracking

3.5 Violate Cultural & Holiday Consent

Auto-enable holidays

Add cultural inference logic

3.6 Alter Discoverability Unlawfully

Force public visibility

Override moderation

Publish unapproved content

🧾 4. Mandatory Audit Logging

Every admin action must be written to:

public.user_admin_actions


Logged fields:

admin_id

target_user_id

action_type

action_details (JSONB)

timestamp

Failure to log = illegal action, automatically invalid under governance law.

🚨 5. Emergency Powers

Emergency RPC functions:

Begin with _admin_*_internal

Are service-role protected

Are NOT accessible by any user session

Auto-log full incident context

Emergency power may only be used for:

Child safety

Catastrophic system failure

Security threats

Legal compliance

Use outside these = prohibited & punishable violation.

⚖️ 6. Enforcement & Consequences

Violations result in:

Immediate admin removal

Full forensic audit

Governance expulsion

Account lock

(If applicable) legal escalation

No admin, founder, developer, or contractor is exempt.

🔚 Final Declaration

Admins operate under law, not discretion.
ROOTED’s governance is constitution-first, not admin-first.

This file is binding and enforced at the database level.
