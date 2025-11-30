✅ ROOTED — MODERATION SYSTEM (CANONICAL v3)

Purpose:
The Moderation System provides a governed, auditable, admin-controlled approval and denial pipeline for all public-facing content and applications across ROOTED.

Nothing that touches the public map, directory, feed, or discovery layer is allowed to skip this system.

1. Scope

The moderation system applies to:

Events

Landmarks

Vendor applications

Institution applications

(Future) Feed items / community uploads

(Future) Experiences and vertical-specific submissions

Rule:
No submission becomes publicly visible without passing through moderation.

Kids Mode surfaces are filtered even before moderation via kids-safe flags and discovery rules.

Launch doctrine:
Kids Mode is in PILOT OFF state at ROOTED Community launch.
All Kids Mode rules in this document are design law for when Education / Kids verticals go live, but no Kids-specific surfaces are enabled until then.

2. Core Tables
2.1 public.moderation_queue

Single source of truth for all pending and historical moderation actions.

Canonical Fields:

id (uuid, PK)

entity_type (text)
→ event | landmark | vendor_application | institution_application | feed_item (future) | other future types

entity_id (uuid)
→ FK to specific entity table

submitted_by (uuid → auth.users.id)

status (text)
→ pending | approved | rejected | auto_approved

reason (text, nullable)
→ rejection / context notes

reviewed_at (timestamp, nullable)

reviewed_by (uuid → auth.users.id, nullable)

created_at (timestamp)

All moderation behavior keys off this table.

2.2 Entity Columns

Entities that require moderation must have:

moderation_status (text)
→ pending | approved | rejected | auto_approved (if used)

Examples:

events.moderation_status

landmarks.moderation_status

vendor_applications.moderation_status

institution_applications.moderation_status

(Future) feed_items.moderation_status

Public-facing queries must check both:

moderation_status = 'approved'

account_status / feature_flags where relevant

3. Canonical Approval Flow (Events & Landmarks)
3.1 Submission

When a user submits an event or landmark:

Entity row is created with:

moderation_status = 'pending'

Any kids-safe / category flags set by submitter (if available)

A record is inserted into public.moderation_queue with:

entity_type = 'event' or 'landmark'

entity_id = entity UUID

submitted_by = auth.uid()

status = 'pending'

3.2 Admin Review

Admins see all pending items via:

Admin UI: Moderation → Queue

Backend: SELECT from public.moderation_queue filtered by status = 'pending'

They can inspect:

Event / landmark details

Submitter

Kids-safe flags

Vertical / category tags

Provider / application context

3.3 Approval (Admin Only)
select public.admin_moderate_submission(
  '<MODERATION_UUID>',
  'approved',
  'Looks good'
);


This function:

Validates public.is_admin() using public.user_tiers (role = 'admin', account_status = 'active')

Updates underlying entity:

moderation_status = 'approved'

Updates public.moderation_queue for that id:

status = 'approved'

reviewed_at = now()

reviewed_by = auth.uid()

reason = 'Looks good' (or provided reason)

Chains into notifications:

Calls public.notify_submission_approved(...)

Inserts a row into public.notifications

3.4 Public Visibility

ALL public queries for events + landmarks MUST include:

WHERE moderation_status = 'approved'


Kids Mode surfaces add:

AND is_kids_safe = true


This guarantees:

No unreviewed content appears

Kids Mode shows only pre-approved, kid-safe content (when it is eventually enabled)

4. Canonical Rejection Flow (Events & Landmarks)

Rejection is symmetrical:

select public.admin_moderate_submission(
  '<MODERATION_UUID>',
  'rejected',
  'Not appropriate'
);


This function:

Validates public.is_admin()

Updates entity:

moderation_status = 'rejected'

Updates public.moderation_queue:

status = 'rejected'

reviewed_at, reviewed_by

reason = 'Not appropriate' (or custom text)

Fires:

public.notify_submission_rejected(...)

Notification row → user sees rejection with reason

Rejected content:

Never appears in public discovery

May be visible in internal admin views only

5. Vendor & Institution Application Moderation

Vendor and Institution onboarding uses the same moderation pipeline.

5.1 Application Submission

On submission:

Row created in:

public.vendor_applications or

public.institution_applications

with moderation_status = 'pending'

Entry created in public.moderation_queue:

entity_type  = 'vendor_application' or 'institution_application'
entity_id    = application.id
status       = 'pending'
submitted_by = auth.uid()

5.2 Approval

Admin approves via admin_moderate_submission:

Application row:

moderation_status = 'approved'

A provider is created and wired:

public.providers

provider_type = 'vendor' or 'institution'

owner_user_id = applicant

Vendor/Institution is activated according to:

public.user_tiers

feature_flags

account_status

public.moderation_queue updated:

status = 'approved'

reviewed_at, reviewed_by

Notification sent:

submission_approved / *_application_approved

5.3 Rejection

Admin rejection:

Application:

moderation_status = 'rejected'

No provider access is granted

public.moderation_queue:

status = 'rejected'

Reason stored

Notification sent:

submission_rejected / *_application_rejected

Rule:
Applications are never auto-approved. They always enter moderation_queue.

6. Internal SQL Override (Maintenance Only)

A protected internal function exists for emergency manual fixes:

select public._admin_moderate_submission_internal(
  '<MODERATION_UUID>',
  '<new_status>',
  '<reason>'
);


Characteristics:

Bypasses public.is_admin() check

Intended for:

Incident response

Data recovery

Hotfixes via SQL editor

Rules:

🚫 NEVER exposed in Supabase’s “Exposed Functions”

🚫 NEVER called from frontend / mobile clients

✅ ONLY used manually by founder / root-level ops

Pattern:
Any function prefixed with _admin_ or _debug_ is considered internal-only.

7. Security Guarantees

The moderation system guarantees:

✅ Only admins can approve or reject via admin_moderate_submission

✅ All actions are auditable:

moderation_queue

user_admin_actions (for account-level changes)

notifications history

✅ No public bypass paths exist:

All discovery queries respect moderation_status = 'approved'

✅ RLS remains enforced:

Non-admins see only their own submissions + allowed entities

✅ Kids Mode content is:

Filtered by is_kids_safe

Never shows unmoderated entities

Not exposed at all while Kids Mode is in pilot OFF

✅ Sanctuary / rescue / nonprofit entities:

May post volunteer events

Are mission-only (no marketplace tools, no commercial ads)

Still pass through moderation

✅ Municipalities & civic entities:

May exist in schema/backend for later verticals

Are discovery-off in ROOTED Community by default

Must go through moderation when/if surfaced in any vertical

8. Vertical Compatibility

The moderation system is vertical-agnostic and applies to:

✅ ROOTED Community

✅ ROOTED Construction

✅ ROOTED Arts & Culture

✅ ROOTED Education

✅ ROOTED Experiences

✅ Future verticals

Any new public-facing submission type must:

Include moderation_status on its table

Insert a row into public.moderation_queue

Use admin_moderate_submission as its approval/denial gate

Respect moderation_status = 'approved' in discovery queries

9. Admin Moderation & Governance Integration

Admin identity is defined solely in public.user_tiers and the helper:

role = 'admin'

account_status = 'active'

public.is_admin() returns true

RPCs exposed to the frontend for admin are strictly limited to:

public.admin_get_user_accounts

public.admin_set_role_tier

public.admin_set_account_status

public.admin_update_feature_flags

public.admin_moderate_submission

(Optional) public.admin_resend_notification

Each exposed admin RPC:

✅ Uses SECURITY DEFINER

✅ Calls public.is_admin() at the top

✅ Writes to public.user_admin_actions for account-level changes

✅ For moderation:

Logs to moderation_queue

Chains into notification helpers

Internal helpers like:

_admin_moderate_submission_internal

_admin_grant_default_badges_for_provider_internal

_debug_*

are:

🚫 Not exposed as public RPCs

✅ Used only by outer admin RPCs or service-role contexts

10. Community Uploads & Safety (Current Doctrine)

Community uploads (e.g., community spots / user-submitted places) follow this policy:

Schema-level support can exist.

Feature-level behavior is:

Globally gated behind a core app setting / feature flag
(e.g. community_uploads_enabled = false in app_settings or config store)

Default: disabled for launch.

Kids Mode never has access to community upload flows.

Municipal / civic uploads are discovery-off in Community vertical until the dedicated vertical is launched.

When enabled in the future, all community uploads:

Enter moderation_queue

Require admin approval

Are filtered out of Kids Mode unless explicitly marked kids-safe

Until then:

UI may show previews / read-only, but no production community upload path is active.

11. Canonical Status

This file is CANONICAL and applies platform-wide:

It defines how all public submissions move from:

pending → approved or rejected

It defines the only legal approval mechanism:

public.admin_moderate_submission(...)

It defines the relationship between:

Moderation

Admin governance

Notifications

Discovery

Kids Mode

Sanctuary / nonprofit protection

Municipal discovery hibernation

If any future code, vertical, or AI suggestion conflicts with this Moderation System:

This Moderation System wins.
