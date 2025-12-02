Authority Level: Absolute Platform Law
Enforcement: Constitution → Stop Layer → Database
Effective Date: First Public Launch

This file defines the only legal way accounts exist, change, suspend, or terminate inside ROOTED.

If this file conflicts with:

ROOTED_PLATFORM_CONSTITUTION.md

ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md

👉 Those files override this one immediately.

1. SINGLE SOURCE OF TRUTH

All identity state is defined ONLY in:

public.user_tiers

This table exclusively controls:

role (guest / individual / vendor / institution / admin)

tier (free / premium / premium_plus)

account_status (active / suspended / locked / pending_deletion)

feature_flags (JSONB)

No other table, UI element, or API may override this.

2. ADMIN MUTATION LOG (MANDATORY)

All governance mutations must log into:

public.user_admin_actions

No mutation has legal authority without a log entry.

3. ACCOUNT DELETION (ONLY LEGAL PATH)

All account deletion flows must use:

public.account_deletion_requests

Deletion states:

pending

in_progress

completed

No hard deletes are allowed outside this pipeline.

Monetization may NEVER block deletion.

Cross-Reference:
ROOTED_DATA_SOVEREIGNTY_LAW.md

4. ACCOUNT STATUS EFFECTS
Status	Effect
active	Normal access
suspended	No posting, messaging, or editing
locked	No login
pending_deletion	All creation blocked
5. FEATURE FLAGS ARE LAW

Feature flags are:

The only legal gating mechanism

Enforced at:

SQL

Views

RLS

RPC

UI

No UI-only paywalls are legal.

6. ROLE / TIER MIRROR LAW

Institution and Vendor access must mirror at matching tiers.

No shadow monetization by role.

Cross-Reference:
ROOTED_ACCESS_POWER_LAW.md

7. KIDS MODE & ACCOUNT GOVERNANCE

If kids_mode_enabled = true:

Messaging is disabled

Monetization is disabled

Discovery is restricted

Educational overlays only

Cross-Reference:
ROOTED_KIDS_MODE_GOVERNANCE.md

8. PROHIBITED PRACTICES

❌ Manual role edits via SQL
❌ Silent tier upgrades
❌ Account resurrection after deletion
❌ Shadow flags
❌ Hidden bans
❌ Revenue-based access overrides

9. VIOLATIONS

Violations result in:

Immediate admin audit

Platform lockdown if systemic

Permanent governance removal

Legal escalation where applicable

✅ All accounts in ROOTED are governed — not improvised.
