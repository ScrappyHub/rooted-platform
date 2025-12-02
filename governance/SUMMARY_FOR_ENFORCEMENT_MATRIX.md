# 🧾 ROOTED — LAW → SQL → UI ENFORCEMENT MATRIX

| LAW | SQL ENFORCEMENT | UI ENFORCEMENT |
|-----|------------------|----------------|
Kids Mode | user_tiers.feature_flags, kids_mode_overlays, RLS | Kids-only discovery & no monetization |
Data Sovereignty | No identity segmentation, no tracking tables | No demographic filters |
Sanctuary Protection | provider_type + RLS locks | No commerce shown |
Admin Governance | user_admin_actions + RPC only | No debug bypass |
Account Governance | user_tiers, account_deletion_requests | UI reflects DB only |
Anti-Profiling Law | No identity columns in discovery views | No identity filters |
Stop Layer | GitHub governance files only | UI cannot override |

Violation at any layer = platform defect.

