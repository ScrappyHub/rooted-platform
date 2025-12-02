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

🔒 1. ENFORCEMENT OVERVIEW

Each ROOTED governance law must map to:

SQL Tables

RLS Policies

Canonical Views

Feature Flags

Admin RPCs

UI Enforcement Rules

If ANY row below is broken → the system becomes non-compliant.

---

📘 2. THE FULL ENFORCEMENT MATRIX



🧒 2.1 CHILD SAFETY LAWS
Law	SQL Tables	RLS Enforcement	Views	Feature Flag	Admin RPC	UI Enforcement
Supreme Child Safety Clause	user_tiers, kids_mode_overlays, events, landmarks	Blocks pricing, messaging, commerce when kids enabled	kids_safe_events_v1, kids_landmarks_v1	kids_mode_enabled	admin_set_kids_safe_state()	No pricing, no ads, no bookings, no DM
No Messaging to Minors	messages, conversations	Sender must NOT be a minor	N/A	N/A	admin_moderate_conversation()	Messaging buttons hidden
No Commerce in Kids Mode	rfqs, bids, subscriptions, payments	Hard RLS deny when kids_mode_enabled = true	N/A	N/A	N/A	Entire marketplace removed

Cross-Refs:

ROOTED_PLATFORM_CONSTITUTION.md

ROOTED_KIDS_MODE_GOVERNANCE.md

ROOTED_COMMUNITY_TRUST_LAW.md

STOP LAYER

🔐 2.2 DATA SOVEREIGNTY & PRIVACY
Law	SQL Tables	RLS Enforcement	Views	Feature Flag	Admin RPC	UI Enforcement
User Owns Their Data	auth.users, profiles	user_id = auth.uid()	public_user_profile_v1	N/A	admin_export_user_data()	Export & edit only by owner
No Tracking / Fingerprinting	NONE allowed	No tracking tables permitted	N/A	analytics_enabled (aggregates only)	❌ None allowed	No SDKs / no 3rd-party analytics
Deletion Rights	account_deletion_requests	Only owner can insert	pending_deletions_v1	N/A	admin_process_deletion()	Delete button always visible

Cross-Refs:

ROOTED_DATA_SOVEREIGNTY_LAW.md

STOP LAYER

🚫 2.3 ANTI-PROFILING LAW
Law	SQL Tables	RLS	Views	Feature Flag	Admin RPC	UI Enforcement
No Demographic Segmentation	❌ NONE allowed	N/A	❌ No demographic fields in ANY view	N/A	N/A	No demographic filters
Story-Based Discovery Only	providers, provider_media	Requires active + moderated	providers_discovery_v1	N/A	N/A	Sort ONLY by trust, craft, education

Cross-Refs:

ROOTED_GOVERNANCE_ETHICS.md

ROOTED_COMMUNITY_TRUST_LAW.md

ROOTED_PLATFORM_CONSTITUTION.md

🐾 2.4 SANCTUARY & NONPROFIT PROTECTION
Law	SQL Tables	RLS	Views	Feature Flag	Admin RPC	UI Enforcement
No Commerce for Sanctuaries	providers	Blocks all marketplace tables for type='sanctuary'	sanctuary_public_profile_v1	can_use_marketplace=false	N/A	Marketplace tabs hidden
Volunteer-Only Access	events	events.type='volunteer' only	volunteer_events_v1	N/A	N/A	Volunteer-only cards

Cross-Refs:

ROOTED_SANCTUARY_NONPROFIT_LAW.md

ROOTED_VOLUNTEER_PARTICIPATION_LAW.md

⚙️ 2.5 ADMIN POWER & ACCESS CONTROL
Law	SQL Tables	RLS	Views	Feature Flag	Admin RPC	UI Enforcement
Admin Actions Must Log	user_admin_actions	Insert restricted to RPC	admin_activity_v1	N/A	✅ All admin RPCs	Audit trail visible
No Silent Privilege Escalation	user_tiers	Admin cannot update directly	public_user_tier_v1	N/A	admin_update_user_role()	No UI bypass
No Direct SQL to Core Tables	ALL CORE	Canonical views deny direct mutation	Read-only canonical views	N/A	RPC-only mutation	UI cannot change roles

Cross-Refs:

ROOTED_ADMIN_GOVERNANCE.md

ROOTED_ACCESS_POWER_LAW.md

STOP LAYER

🛡️ 2.6 DISCOVERY & MODERATION LAW
Law	SQL Tables	RLS	Views	Feature Flag	Admin RPC	UI Enforcement
No Shadow Publishing	moderation_queue	Only approved rows selectable	providers_discovery_v1, events_public_v1	N/A	admin_moderate_item()	UI shows approved only
Trust = Visibility	providers	Must be active AND discoverable	providers_discovery_v1	N/A	N/A	Hides inactive/unapproved

Cross-Refs:

ROOTED_COMMUNITY_TRUST_LAW.md

ROOTED_GOVERNANCE_ETHICS.md

🧒 2.7 KIDS MODE + CONTENT FILTERING
Law	SQL Tables	RLS	Views	Feature Flag	Admin RPC	UI Enforcement
Kids-Safe Mapping	kids_mode_overlays	Only approved overlays	kids_safe_content_v1	kids_mode_enabled	admin_assign_kids_overlay()	Adult surfaces hidden
No Kids Uploads	provider_media, events	Minors blocked	N/A	N/A	N/A	Upload UI disabled

Cross-Refs:

ROOTED_KIDS_MODE_GOVERNANCE.md

ROOTED_PLATFORM_CONSTITUTION.md

🌱 2.8 SEASONAL KNOWLEDGE STREAMS
Law	SQL Tables	RLS	Views	Feature Flag	Admin RPC	UI Enforcement
Recipes = Premium Plus	recipes	tier='premium_plus'	seasonal_recipes_v1	premium_plus_enabled	N/A	Lock icon + upsell
Seeds / Produce / Crafts	seasonal_items	Public read, moderated	seasonal_current_month_v1	N/A	admin_rotate_seasonal_month()	Monthly education
Kids Seasonal Filters	seasonal_items	Unsafe excluded	kids_seasonal_v1	kids_mode_enabled	N/A	Safe only

Cross-Refs:

ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md

ROOTED_KIDS_MODE_GOVERNANCE.md

---

🔨 3. MUTATION RULES (CANONICAL)
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

🛑 4. NON-NEGOTIABLE RLS GUARDRAILS

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

📚 5. CROSS-REFERENCE MAP
Law File	Defines	Enforced By
ROOTED_PLATFORM_CONSTITUTION.md	Identity, ethics, children, profiling	Every database layer
ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md	Absolute override	ALL layers
ROOTED_DATA_SOVEREIGNTY_LAW.md	No tracking, no resale	Profiles + RLS
ROOTED_COMMUNITY_TRUST_LAW.md	Moderation + trust	moderation_queue
ROOTED_ACCESS_POWER_LAW.md	Power limits	user_tiers, audit tables
ROOTED_KIDS_MODE_GOVERNANCE.md	Child filters	kids_mode_overlays
ROOTED_SANCTUARY_NONPROFIT_LAW.md	No commerce for sanctuaries	provider_type
ROOTED_ACCOUNT_GOVERNANCE_LAW.md	Role, tier, deletion	user_tiers, deletion_requests
ROOTED_ADMIN_GOVERNANCE.md	Admin RPC limits	admin_* RPCs
ROOTED_VOLUNTEER_PARTICIPATION_LAW.md	Youth participation	events

---

🧩 6. FINAL ENGINEERING GUARANTEE

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
