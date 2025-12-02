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



2.1 CHILD SAFETY LAWS
Governance Law	SQL Table(s)	RLS Enforcement	View(s)	Feature Flag	Admin RPC	UI Enforcement
Supreme Child Safety Clause	user_tiers, kids_mode_overlays, events, landmarks	RLS blocks pricing, messaging, commerce	kids_safe_events_v1, kids_landmarks_v1	kids_mode_enabled	admin_set_kids_safe_state()	No pricing, no ads, no bookings, no direct messaging
No messaging to minors	messages, conversations	Sender must NOT be a minor	N/A	N/A	admin_moderate_conversation()	Messaging buttons hidden in Kids Mode
No commerce in Kids Mode	rfqs, bids, subscriptions, payments	Hard RLS deny when kids_mode_enabled=true	N/A	N/A	N/A	Entire billing/marketplace UI removed in Kids Mode
2.2 DATA SOVEREIGNTY & PRIVACY
Governance Law	SQL Table(s)	RLS Enforcement	View(s)	Feature Flag	Admin RPC	UI Enforcement
User owns their data	auth.users, profiles	Row-level user_id = auth.uid()	public_user_profile_v1	N/A	admin_export_user_data()	Export & edit buttons allowed only by user
No tracking / fingerprinting	N/A	No tracking tables permitted	N/A	analytics_enabled (only aggregated)	None allowed	No SDKs, no 3rd-party analytics
Deletion rights	account_deletion_requests	Only owner can request	pending_deletions_v1	N/A	admin_process_deletion()	Delete account button always accessible
2.3 ANTI-PROFILING LAW
Governance Law	SQL Table(s)	RLS Enforcement	View(s)	Feature Flag	Admin RPC	UI Enforcement
No demographic segmentation	NONE allowed	N/A	No demographic fields in ANY view	N/A	N/A	No demographic filters, no identity labels
Story-based discovery only	providers, provider_media	Discovery requires moderation + active status	providers_discovery_v1	N/A	N/A	Sort ONLY by trust, compliance, craft, education
2.4 SANCTUARY & NONPROFIT PROTECTION LAW
Governance Law	SQL Table(s)	RLS Enforcement	View(s)	Feature Flag	Admin RPC	UI Enforcement
Sanctuaries cannot do commerce	providers	RLS blocks all marketplace tables for type='sanctuary'	sanctuary_public_profile_v1	can_use_marketplace=false	N/A	Marketplace tabs hidden
Volunteer-only access	events	events.type='volunteer' only allowed for sanctuary_id	volunteer_events_v1	N/A	N/A	Experience cards restricted to volunteer/education
2.5 ADMIN POWER & ACCESS CONTROL
Governance Law	SQL Table(s)	RLS Enforcement	View(s)	Feature Flag	Admin RPC	UI Enforcement
Admin actions must log	user_admin_actions	Insert restricted to admin RPCs	admin_activity_v1	N/A	All admin RPCs log mutations	Admin UI shows audit trail
No silent privilege escalation	user_tiers	RLS: admin cannot update directly	public_user_tier_v1	N/A	admin_update_user_role()	UI prevents changes outside RPC
No direct SQL to core tables	ALL	RLS denies direct mutation	Canonical read-only views enforce law	N/A	RPC-only mutation	UI cannot mutate roles or tiers
2.6 DISCOVERY & MODERATION LAW
Governance Law	SQL Table(s)	RLS Enforcement	View(s)	Feature Flag	Admin RPC	UI Enforcement
No shadow publishes	moderation_queue	Only approved content appears in views	providers_discovery_v1, events_public_v1	N/A	admin_moderate_item()	UI only shows approved content
Trust = visibility	providers	provider.active AND discoverable must be true	providers_discovery_v1	N/A	N/A	UI hides inactive, unmoderated, or undiscoverable providers
2.7 KIDS MODE + CONTENT FILTERING
Governance Law	SQL Table(s)	RLS Enforcement	View(s)	Feature Flag	Admin RPC	UI Enforcement
Kids-safe mapping	kids_mode_overlays	RLS ensures only approved overlays appear	kids_safe_content_v1	kids_mode_enabled	admin_assign_kids_overlay()	Kids Mode hides adult surfaces
No Kids uploads	provider_media, events	RLS blocks minors from uploading	N/A	N/A	N/A	UI disables upload buttons
2.8 SEASONAL KNOWLEDGE STREAMS
Governance Law	SQL Table(s)	RLS Enforcement	View(s)	Feature Flag	Admin RPC	UI Enforcement
Recipes = Premium Plus only	recipes	RLS restricts to tier='premium_plus'	seasonal_recipes_v1	premium_plus_enabled	N/A	Lock icon + upsell
Seeds/Produce/Crafts = all users	seasonal_items	Public read (moderated only)	seasonal_current_month_v1	N/A	admin_rotate_seasonal_month()	Surface monthly education
Kids Mode seasonal filters	seasonal_items	RLS excludes unsafe items	kids_seasonal_v1	kids_mode_enabled	N/A	Kids UI shows only safe crafts/produce


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
