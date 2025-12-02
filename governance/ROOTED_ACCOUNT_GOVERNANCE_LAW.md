# 🧾 ROOTED_ACCOUNT_GOVERNANCE_LAW.md (Canonical)

Authority Level: Constitutional Enforcement Layer
Enforcement Chain:
Constitution → Stop Layer → RLS → Admin RPCs → UI
Applies To: ALL user accounts, including:
Community • Vendors • Institutions • Sanctuaries • Developers • Admins • Parents/Guardians

---

Cross-References:

ROOTED_PLATFORM_CONSTITUTION.md

ROOTED_STOP_LAYER.md

ROOTED_ADMIN_GOVERNANCE.md

ROOTED_DATA_SOVEREIGNTY_LAW.md

ROOTED_ACCESS_POWER_LAW.md

ROOTED_KIDS_MODE_GOVERNANCE.md

ROOTED_CONTRIBUTOR_GOVERNANCE_NOTICE.md

---

🧬 1. Account Governance Principles

Account governance inside ROOTED protects:

Safety

Consent

Trust

Identity integrity

Non-commercial status of restricted entities

Children

Nonprofits

Sanctuaries

Community institutions

This file defines the only legal rules for account lifecycle.

---

🧩 2. Source of Truth Tables (Immutable)

The following tables carry legal weight:

2.1 public.user_tiers

Defines:

role

tier

feature_flags

compliance_flags

kids_mode_enabled

This table is immutable except through admin RPCs.

2.2 public.user_admin_actions

Defines:

audit trail for all privilege-affecting events

This table is never edited or deleted.

2.3 public.account_deletion_requests

The only legal entry point for account deletion.

---

🔒 3. Illegal Account Mutations

The following actions are fully prohibited:

Direct SQL modifications to public.user_tiers

Silent deletions or tier updates

Upgrading/downgrading bypassing Stripe workflow

Kids Mode flag changes through UI-only logic

Commercial tier assignment to sanctuaries

Messaging access granted to minors

Self-assigning admin privileges

Reintroducing deleted accounts outside the legal deletion pipeline

All such attempts = invalid, logged violation, and automatic block.

---

🧒 4. Youth & Kids Mode Account Rules

Cross-Ref: ROOTED_KIDS_MODE_GOVERNANCE.md

Kids Mode accounts:

Cannot message

Cannot see pricing or sales

Cannot access marketplaces

Cannot access vendor tools

Cannot independently publish content

Cannot appear as independent volunteers

Parents/guardians may intake on behalf of minors.

Youth (13–17):

Limited volunteer visibility

No paid roles

No RFQs

No institutional messaging

---

🐾 5. Sanctuary & Nonprofit Account Rules

Cross-Ref: ROOTED_SANCTUARY_NONPROFIT_LAW.md

Sanctuaries & mission nonprofits:

Cannot access paid tiers

Cannot access bidding or bulk marketplace

Cannot run paid experiences

Can host volunteer & education events only

Cannot be charged monetization fees

Their protection is permanent and immune to leadership change.

---

⚙️ 6. Account Status & Enforcement

Valid statuses:

active

suspended

locked

under_review

deleted_pending

deleted_final

Only Admin RPCs may perform transitions.

Direct SQL → blocked, logged, invalid.

---

🧾 7. Legal Deletion Process (Required)

Deletion requests:

User submits deletion

System logs to account_deletion_requests

Admin reviews

Soft-delete activation

Hard-delete after retention window

ROOTED may not deny deletion based on:

Revenue

Tier

Institutional pressure

Data value

---

🧠 8. Cross-Vertical Identity Stability

No vertical may:

Create “shadow accounts”

Duplicate identities

Create cross-vertical segmentation

Infer demographics

Create monetization based on identity

Accounts remain human-first, not marketing-first.

---

🔚 Final Declaration

Account governance is not a feature.
It is constitutional law embedded in ROOTED’s database, infrastructure, and UI.

No developer, admin, actor, founder, or institution may override this file.
