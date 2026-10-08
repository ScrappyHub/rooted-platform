# ROOTED — ENFORCEMENT MATRIX (CANONICAL)

File: /governance/ENFORCEMENT_MATRIX.md

Authority Level: Binding Engineering Law

Enforcement Chain: Constitution → Stop Layer → SQL → RLS → Feature Flags → RPCs → UI

Purpose: Guarantee that every ROOTED law is enforced in the correct backend and UI layer with zero ambiguity.

---

This is the forensic blueprint that prevents:

Governance drift

Shadow features

Accidental privilege escalation

Kids Mode leaks

Profiling

Commercial abuse

Administrative overreach

Vendor/institution misclassification

If a developer breaks the matrix → the code is illegal.

---

## 🔒 1. ENFORCEMENT OVERVIEW

Each ROOTED governance law must map to:

SQL Tables

RLS Policies

Canonical Views

Feature Flags

Admin RPCs

UI Enforcement Rules

If ANY row below is broken → the system becomes non-compliant.

---

## 📘 2. THE FULL ENFORCEMENT MATRIX



## 🧒 2.1 CHILD SAFETY LAWS

| Governance Law | SQL Tables | RLS Enforcement | Canonical Views | Feature Flag | Admin RPC | UI Enforcement |
|----------------|------------|------------------|------------------|--------------|-----------|----------------|
| Supreme Child Safety Clause | user_tiers, kids_mode_overlays, events, landmarks | Blocks pricing, messaging, commerce when kids enabled | kids_safe_events_v1, kids_landmarks_v1 | kids_mode_enabled | admin_set_kids_safe_state() | No pricing, no ads, no booking, no DMs |
| No Messaging to Minors | messages, conversations | Sender must NOT be a minor | N/A | N/A | admin_moderate_conversation() | Messaging disabled |
| No Commerce in Kids Mode | rfqs, bids, subscriptions, payments | Hard deny when kids_mode_enabled=true | N/A | N/A | N/A | Entire marketplace removed |

Cross-Refs:
ROOTED_PLATFORM_CONSTITUTION.md
ROOTED_KIDS_MODE_GOVERNANCE.md
ROOTED_COMMUNITY_TRUST_LAW.md
governance/ROOTED_CONSTITUTIONAL_STOP_LAYER.md

---

## 🔐 2.2 DATA SOVEREIGNTY & PRIVACY

| Governance Law | SQL Tables | RLS Enforcement | Canonical Views | Feature Flag | Admin RPC | UI Enforcement |
|----------------|------------|------------------|------------------|--------------|-----------|----------------|
| User Owns Their Data | auth.users, profiles | user_id = auth.uid() | public_user_profile_v1 | N/A | admin_export_user_data() | Export/edit only by owner |
| No Tracking / Fingerprinting | NONE allowed | No tracking tables permitted | N/A | analytics_enabled (aggregates only) | NONE | No SDKs, no 3rd-party analytics |
| Deletion Rights | account_deletion_requests | Only owner can insert | pending_deletions_v1 | N/A | admin_process_deletion() | Delete button always visible |

Cross-Refs:
ROOTED_DATA_SOVEREIGNTY_LAW.md  
governance/ROOTED_CONSTITUTIONAL_STOP_LAYER.md


---

## 🚫 2.3 ANTI-PROFILING LAW

| Governance Law | SQL Tables | RLS | Canonical Views | Feature Flag | Admin RPC | UI Enforcement |
|----------------|------------|------|------------------|--------------|-----------|----------------|
| No Demographic Segmentation | NONE allowed | N/A | No demographic columns in any view | N/A | N/A | No demographic filters |
| Story-Based Discovery Only | providers, provider_media | Active + moderated only | providers_discovery_v1 | N/A | N/A | Sort only by trust, craft, education |

Cross-Refs:
ROOTED_GOVERNANCE_ETHICS.md  
ROOTED_COMMUNITY_TRUST_LAW.md  
ROOTED_PLATFORM_CONSTITUTION.md


---

## 🐾 2.4 SANCTUARY & NONPROFIT PROTECTION

| Governance Law | SQL Tables | RLS | Canonical Views | Feature Flag | Admin RPC | UI Enforcement |
|----------------|------------|------|------------------|--------------|-----------|----------------|
| No Commerce for Sanctuaries | providers | Blocks all marketplace tables when type='sanctuary' | sanctuary_public_profile_v1 | can_use_marketplace=false | N/A | Marketplace tabs hidden |
| Volunteer-Only Access | events | events.type='volunteer' only | volunteer_events_v1 | N/A | N/A | Volunteer-only cards |

Cross-Refs:
ROOTED_SANCTUARY_NONPROFIT_LAW.md  
ROOTED_VOLUNTEER_PARTICIPATION_LAW.md

---

## ⚙️ 2.5 ADMIN POWER & ACCESS CONTROL

| Governance Law | SQL Tables | RLS / Triggers | Canonical Views | Feature Flag | Admin RPC | UI Enforcement |
|----------------|------------|----------------|-----------------|--------------|-----------|----------------|
| Admin Actions Must Log | user_admin_actions (append-only) | insert via definer RPC only; append-only trigger | admin_activity_log_v1 | N/A | ALL admin write RPCs via rooted_policy.log_admin_action_v1 | Activity tab on Admin team |
| No Silent Privilege Escalation | user_tiers, admin_team_v1, platform_owners_v1 | trigger enforce_user_tiers_admin_authority_v1 (OWNER_CANNOT_BE_CHANGED, ADMIN_ROLE_CHANGE_VIA_TEAM_ONLY) | admin_my_access_v1 | N/A | admin_team_set_role_v1, admin_set_admin_v1, admin_set_role_tier | Role picker limited by caller's role |
| Role-Scoped Permissions | admin_role_permissions_v1 | assert_admin_can_v1(perm) first statement of every admin write RPC | admin_team_list_v1 | N/A | all admin RPCs (see ADMIN_AUTH_MODEL section 12) | Role/permission matrix on Admin team |
| No Direct SQL to Core Tables | ALL CORE | direct writes denied to clients; photo review and moderation_queue changes guarded by triggers | read-only canonical views | N/A | RPC-only mutation | UI cannot change roles |
| Shared Operator Mailbox | admin_mailbox_items, admin_mailbox_notes | admins only | admin_mailbox_list_v1 | N/A | admin_mailbox_* | Team mailbox page |

Cross-Refs:
ROOTED_ADMIN_GOVERNANCE.md  
ROOTED_ACCESS_POWER_LAW.md  
rooted-core/docs/ADMIN_AUTH_MODEL.md  
governance/ROOTED_CONSTITUTIONAL_STOP_LAYER.md

---

## 🛡️ 2.6 DISCOVERY & MODERATION LAW

| Governance Law | SQL Tables | RLS | Canonical Views | Feature Flag | Admin RPC | UI Enforcement |
|----------------|------------|------|------------------|--------------|-----------|----------------|
| No Shadow Publishing | moderation_queue | Only approved rows selectable | providers_discovery_v1, events_public_v1 | N/A | admin_moderate_item() | Approved only shown |
| Trust = Visibility | providers | Must be active AND discoverable | providers_discovery_v1 | N/A | N/A | Hides inactive |

Cross-Refs:
ROOTED_COMMUNITY_TRUST_LAW.md  
ROOTED_GOVERNANCE_ETHICS.md

---

## 🧒 2.7 KIDS MODE + CONTENT FILTERING

| Governance Law | SQL Tables | RLS | Canonical Views | Feature Flag | Admin RPC | UI Enforcement |
|----------------|------------|------|------------------|--------------|-----------|----------------|
| Kids-Safe Mapping | kids_mode_overlays | Only approved overlays | kids_safe_content_v1 | kids_mode_enabled | admin_assign_kids_overlay() | Adult surfaces hidden |
| No Kids Uploads | provider_media, events | Minors blocked | N/A | N/A | N/A | Upload UI disabled |

Cross-Refs:
ROOTED_KIDS_MODE_GOVERNANCE.md  
ROOTED_PLATFORM_CONSTITUTION.md
governance/ROOTED_CONSTITUTIONAL_STOP_LAYER.md

---

## 🌱 2.8 SEASONAL KNOWLEDGE STREAMS

| Governance Law | SQL Tables | RLS | Canonical Views | Feature Flag | Admin RPC | UI Enforcement |
|----------------|------------|------|------------------|--------------|-----------|----------------|
| Recipes = Premium Plus | recipes | tier='premium_plus' only | seasonal_recipes_v1 | premium_plus_enabled | N/A | Lock icon |
| Seeds / Produce / Crafts | seasonal_items | Public read, moderated | seasonal_current_month_v1 | N/A | admin_rotate_seasonal_month() | Monthly education |
| Kids Seasonal Filters | seasonal_items | Unsafe excluded | kids_seasonal_v1 | kids_mode_enabled | N/A | Safe only |

Cross-Refs:
ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md  
ROOTED_KIDS_MODE_GOVERNANCE.md

---

## 2.9 IMPLEMENTATION STATUS (verified against the live database, 2026-10-10)

The tables above name some objects under their target (planned) names. This list records what actually exists, so the matrix never claims more than the database enforces.

| Law row | Implemented as |
|---|---|
| Role change RPC `admin_update_user_role` | `admin_set_role_tier`, `admin_decide_role_change_v1`, `admin_team_set_role_v1` |
| Moderation RPC `admin_moderate_item` | `admin_moderate_submission` (+ `admin_review_document_v1`, `admin_review_lane_item_v1`) |
| Deletion RPC `admin_process_deletion`, view `pending_deletions_v1` | `admin_decide_account_deletion_v1`, `admin_list_account_deletion_requests_v1`, table `account_deletion_requests` |
| `admin_activity_v1` | `rooted_api.admin_activity_log_v1` |
| `admin_set_kids_safe_state`, `admin_assign_kids_overlay`, `kids_safe_content_v1`, `kids_landmarks_v1`, `kids_seasonal_v1` | NOT BUILT. Kids Mode is off at launch (launch switch `kids_mode` = false). The kid-safe views that do exist: `kids_safe_events_v1`, `community_kids_safe_zones_v1`, `landmarks_public_kids_v1`, `seasonal_*_current_v1` with `is_kids_safe`. Build the rest before turning the switch on. |
| `admin_export_user_data`, `public_user_profile_v1`, `public_user_tier_v1`, `profiles` | NOT BUILT. Profile data is in `user_tiers` and account tables. |
| `admin_moderate_conversation` | NOT BUILT. |
| `admin_rotate_seasonal_month`, `seasonal_recipes_v1`, `sanctuary_public_profile_v1` | NOT BUILT as named; seasonal views are `seasonal_*_current_v1`. |

Rule: nothing in this table is marked done until it exists in the database and has a test.

## 🔨 3. MUTATION RULES (CANONICAL)
❌ You may NOT mutate directly:

providers

rfqs

bids

bulk_offers

user_tiers

subscriptions

payments

account_deletion_requests

ALL mutations must go through:

SECURITY DEFINER Admin RPCs

---

## 🛑 4. NON-NEGOTIABLE RLS GUARDRAILS

These cannot ever be bypassed:

Hard Deny Rules:

Kids Mode cannot view commerce

Sanctuaries cannot access procurement

Admins cannot perform silent mutations

Youth accounts cannot DM vendors/institutions

Providers cannot appear without moderation approval

No demographic filters in ANY query

No unreviewed content in ANY discovery view

Everything else is optional — these are not.

---

## 📚 5. CROSS-REFERENCE MAP

| Law File | Defines | Enforced By |
|----------|----------|--------------|
| ROOTED_PLATFORM_CONSTITUTION.md | Platform identity, ethics, child safety supremacy, anti-profiling doctrine | All database layers, all RLS, all views, all RPCs, UI constraints |
| ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md | Absolute override authority | ALL layers (GitHub → Database → Admin → UI) |
| ROOTED_DATA_SOVEREIGNTY_LAW.md | No tracking, no resale, user data ownership | profiles, auth.users, RLS policies |
| ROOTED_COMMUNITY_TRUST_LAW.md | Moderation, trust, visibility requirements | moderation_queue, discovery views |
| ROOTED_ACCESS_POWER_LAW.md | Power limits, feature flags, role enforcement | user_tiers, audit tables, feature flags |
| ROOTED_KIDS_MODE_GOVERNANCE.md | Child visibility filters, kids-safe content | kids_mode_overlays, kids-safe views |
| ROOTED_SANCTUARY_NONPROFIT_LAW.md | No commerce for sanctuaries | provider_type, RLS on market tables |
| ROOTED_ACCOUNT_GOVERNANCE_LAW.md | Role, tier, status, deletion pipeline | user_tiers, account_deletion_requests |
| ROOTED_ADMIN_GOVERNANCE.md | Admin RPC limits, audit enforcement | admin_* RPCs, user_admin_actions |
| ROOTED_VOLUNTEER_PARTICIPATION_LAW.md | Youth participation & volunteer protection | events, event_registrations, age gating |

---

## 🧩 6. FINAL ENGINEERING GUARANTEE

If a developer follows this matrix:

No illegal feature can ship

No governance rule can be bypassed

No admin can overreach

No kid can be exposed to unsafe content

No sanctuary can be monetized

No profiling can ever surface

No shadow power can exist

No partner/investor can alter the platform

ROOTED becomes a legally defendable civic system.
