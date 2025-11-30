✅ ROOTED DEBUG TOOLKIT (v3)

For Founder, Engineers, QA, & Future You

Status: Aligned with locked backend + ROOTED Community launch
Scope: Supabase + App-level sanity checks (ROOTED Core + Community + early vertical prep)

🧠 0. CORE PRINCIPLES

We do not debug by guessing. We use tools.

We never disable RLS.
If something fails, we debug why, we do not turn off security.

We always test as real roles:

individual / community

vendor_free, vendor_premium, vendor_premium_plus

institution_free, institution_premium, institution_premium_plus

admin

We never “just change data.”
We understand what table it lives in and why.

We never bypass governance:

user_tiers

feature_flags

account_status

account_deletion_requests

user_admin_actions

Kids Mode and community safety rules are never disabled for convenience.
Kids Mode is PILOT OFF at Community launch.

Founder, verification, sanctuary, and kids-safety badges are admin-assigned only.
No vendor/institution self-assigns trust.

This toolkit defines the official ways to debug ROOTED.

🧰 1. GLOBAL DEBUG TOOLS
1.1 Supabase SQL Editor

Use for:

Read-only checks of tables

Running the provided debug queries

Verifying RLS behavior by testing as different users (via app)

RULE:

❌ Do not modify schema or disable RLS in the SQL editor.

✅ Only run:

Queries from this toolkit, or

Explicit migration scripts.

All schema changes go through migrations / version control.

1.2 /founder/preview Route

Purpose:
Safe, non-destructive way to test:

Seasons

Holidays

Dark mode

Kids Mode (UI simulation only)

Role/tier simulations (visually)

Rules:

Works via React state only

Does not write to DB

Resets on refresh / navigation

Use it to debug UI behavior without touching real data.

1.3 Feature Flag Helpers

Helpers in public schema:

select public.has_feature('<USER_UUID>', 'can_use_bid_marketplace');

select public.current_user_has_feature('can_use_bid_marketplace');


Use these to quickly answer:

“Can this user bid?”

“Can this user see advanced analytics?”

“Is this user actually premium_plus or did the UI lie?”

“Does this user actually have access to Construction or Arts & Culture?”

They read from public.user_tiers.feature_flags and respect the canonical flag grid.

1.4 Admin Helper

Admin identity check is centralized:

select public.is_admin();


This uses public.user_tiers (role = 'admin', account_status = 'active').

All admin overrides (bids, bulk, analytics, moderation, badges, impacts) are wired through this helper. If it returns false, the user is not admin for debug purposes.

1.5 Test User Matrix

Have real test accounts for end-to-end checks:

individual_test@...

vendor_free_test@...

vendor_premium_test@...

vendor_premium_plus_test@...

institution_free_test@...

institution_premium_test@...

institution_premium_plus_test@...

admin_test@...

Each must have a row in public.user_tiers that matches:

role

tier

account_status = 'active'

Correct feature_flags

Use these for app-level testing, not just SQL.

🧪 2. ONE-SHOT BACKEND HEALTH CHECK (ROOTED HEALTH SNAPSHOT)

This is your “ROOTED Year 1 Health Snapshot.”

Run this when you want to sanity-check core safety:

WITH critical_tables AS (
  SELECT unnest(ARRAY[
    'user_tiers',
    'providers',
    'provider_media',
    'vendor_media',
    'rfqs',
    'bids',
    'bulk_offers',
    'bulk_offer_analytics',
    'events',
    'event_registrations',
    'landmarks',
    'conversations',
    'conversation_participants',
    'messages',
    'feed_items',
    'feed_comments',
    'feed_likes',
    'vendor_analytics_basic_daily',
    'vendor_analytics_advanced_daily',
    'vendor_analytics_daily',
    'account_deletion_requests',
    'provider_impact_snapshots'  -- internal analytics, RLS + admin-only
  ]) AS table_name
),
rls_status AS (
  SELECT
    c.relname AS table_name,
    c.relrowsecurity AS rls_enabled
  FROM pg_class c
  JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE n.nspname = 'public'
),
policy_counts AS (
  SELECT
    schemaname AS schema_name,
    tablename AS table_name,
    COUNT(*) AS policy_count
  FROM pg_policies
  WHERE schemaname = 'public'
  GROUP BY schemaname, tablename
),
feature_matrix AS (
  SELECT
    role,
    tier,
    feature_flags ->> 'can_use_bid_marketplace'      AS can_use_bid_marketplace,
    feature_flags ->> 'can_use_bulk_marketplace'     AS can_use_bulk_marketplace,
    feature_flags ->> 'can_view_basic_analytics'     AS can_view_basic_analytics,
    feature_flags ->> 'can_view_advanced_analytics'  AS can_view_advanced_analytics
  FROM public.user_tiers
),
function_check AS (
  SELECT
    EXISTS (
      SELECT 1
      FROM pg_proc p
      JOIN pg_namespace n ON n.oid = p.pronamespace
      WHERE n.nspname = 'public'
        AND p.proname = 'has_feature'
    ) AS has_feature_fn,
    EXISTS (
      SELECT 1
      FROM pg_proc p
      JOIN pg_namespace n ON n.oid = p.pronamespace
      WHERE n.nspname = 'public'
        AND p.proname = 'current_user_has_feature'
    ) AS current_user_has_feature_fn,
    EXISTS (
      SELECT 1
      FROM pg_proc p
      JOIN pg_namespace n ON n.oid = p.pronamespace
      WHERE n.nspname = 'public'
        AND p.proname = 'is_admin'
    ) AS is_admin_fn
)
SELECT
  'TABLE_RLS_STATUS' AS section,
  ct.table_name      AS key,
  COALESCE(rs.rls_enabled, false)::text AS value,
  COALESCE(pc.policy_count, 0)::text    AS extra
FROM critical_tables ct
LEFT JOIN rls_status   rs ON rs.table_name = ct.table_name
LEFT JOIN policy_counts pc ON pc.table_name = ct.table_name

UNION ALL

SELECT
  'FUNCTION_CHECK'    AS section,
  'has_feature'       AS key,
  has_feature_fn::text  AS value,
  NULL::text            AS extra
FROM function_check

UNION ALL

SELECT
  'FUNCTION_CHECK'           AS section,
  'current_user_has_feature' AS key,
  current_user_has_feature_fn::text AS value,
  NULL::text                         AS extra
FROM function_check

UNION ALL

SELECT
  'FUNCTION_CHECK'  AS section,
  'is_admin'        AS key,
  is_admin_fn::text AS value,
  NULL::text        AS extra
FROM function_check

UNION ALL

SELECT
  'FEATURE_MATRIX' AS section,
  role || ':' || COALESCE(tier, 'none') AS key,
  jsonb_build_object(
    'can_use_bid_marketplace',      can_use_bid_marketplace,
    'can_use_bulk_marketplace',     can_use_bulk_marketplace,
    'can_view_basic_analytics',     can_view_basic_analytics,
    'can_view_advanced_analytics',  can_view_advanced_analytics
  )::text AS value,
  NULL::text AS extra
FROM feature_matrix

ORDER BY section, key;

How to read it

TABLE_RLS_STATUS

value = true → RLS is ON ✅

extra = number of RLS policies

FUNCTION_CHECK

has_feature, current_user_has_feature, and is_admin must all be true.

FEATURE_MATRIX

Check each role:tier JSON against your canonical feature grid for:

Bids

Bulk marketplace

Basic analytics

Advanced analytics

If something is off:

Fix via migrations / policy updates, not by flipping RLS OFF.

🧩 3. AREA-SPECIFIC DEBUG QUERIES

(All of these are read-only sanity checks — not mutation tools.)

3.1 Roles & Feature Flags
SELECT
  user_id,
  role,
  tier,
  account_status,
  feature_flags
FROM public.user_tiers
ORDER BY role, tier
LIMIT 100;


Use when:

“I’m premium_plus but can’t bid.”

“This vendor should see bulk analytics but doesn’t.”

“This institution says they have Construction access.”

3.2 Admin Governance & Audit

View what the Admin Panel sees:

SELECT *
FROM public.admin_user_accounts
ORDER BY role, tier, email
LIMIT 100;


Check admin actions log:

SELECT
  admin_id,
  target_user_id,
  action_type,
  details,
  created_at
FROM public.user_admin_actions
ORDER BY created_at DESC
LIMIT 50;


Use when:

A user suddenly can’t access something

You need to see who changed role/tier/status

3.3 Providers & Ownership
SELECT
  p.id,
  p.name,
  p.provider_type,
  p.vertical,
  p.owner_user_id,
  p.created_at
FROM public.providers p
ORDER BY p.created_at DESC
LIMIT 50;


Use when:

A vendor can’t see their provider profile

An institution can’t access RFQs or events tied to them

3.4 RFQs & Bids

RFQs:

SELECT
  r.id AS rfq_id,
  r.title,
  r.status,
  r.institution_id,
  p.name AS institution_name,
  p.provider_type,
  p.owner_user_id AS institution_user_id,
  r.created_at
FROM public.rfqs r
JOIN public.providers p ON p.id = r.institution_id
ORDER BY r.created_at DESC
LIMIT 50;


Bids:

SELECT
  b.id AS bid_id,
  b.rfq_id,
  b.vendor_id,
  b.status,
  vp.name AS vendor_name,
  vp.owner_user_id AS vendor_user_id,
  b.created_at
FROM public.bids b
JOIN public.providers vp ON vp.id = b.vendor_id
ORDER BY b.created_at DESC
LIMIT 50;


Use when:

A premium_plus vendor can’t bid → check feature_flags + provider ownership

An institution can’t see bids → confirm their RFQ’s institution_id matches their provider

3.5 Bulk Offers & Analytics
SELECT
  bo.id,
  bo.provider_id,
  bo.title,
  bo.is_active,
  p.name AS vendor_name,
  p.owner_user_id,
  bo.created_at
FROM public.bulk_offers bo
JOIN public.providers p ON p.id = bo.provider_id
ORDER BY bo.created_at DESC
LIMIT 50;

SELECT
  a.id,
  a.offer_id,
  a.vendor_user_id,
  a.impressions,
  a.clicks,
  a.saves,
  a.bids_count,
  a.created_at
FROM public.bulk_offer_analytics a
ORDER BY a.created_at DESC
LIMIT 50;


Use when:

Vendor says “my bulk analytics look wrong”

You want to confirm analytics are being written and read correctly

3.6 Media (Provider & Vendor)
SELECT *
FROM public.provider_media
ORDER BY created_at DESC
LIMIT 20;

SELECT *
FROM public.vendor_media
ORDER BY created_at DESC
LIMIT 20;


Use when:

Uploads aren’t appearing

Wrong provider is attached to media

3.7 Events & Registrations
SELECT
  e.id,
  e.title,
  e.status,
  e.moderation_status,
  e.provider_id,
  p.name AS host_name,
  p.owner_user_id AS host_user_id,
  e.created_at
FROM public.events e
JOIN public.providers p ON p.id = e.provider_id
ORDER BY e.created_at DESC
LIMIT 50;

SELECT
  r.id,
  r.event_id,
  r.user_id,
  e.title AS event_title,
  r.created_at
FROM public.event_registrations r
JOIN public.events e ON e.id = r.event_id
ORDER BY r.created_at DESC
LIMIT 50;


Use when:

Hosts can’t see registrations

Users claim they registered but you don’t see data

3.8 Landmarks
SELECT
  id,
  title,
  is_published,
  is_kids_safe,
  category,
  created_by,
  created_at
FROM public.landmarks
ORDER BY created_at DESC
LIMIT 50;


Use when:

A landmark doesn’t appear on the map

Kids view misses something (check is_kids_safe)

3.9 Messaging
SELECT
  c.id,
  c.created_by,
  c.created_at
FROM public.conversations c
ORDER BY c.created_at DESC
LIMIT 50;

SELECT
  cp.conversation_id,
  cp.user_id
FROM public.conversation_participants cp
ORDER BY cp.conversation_id DESC
LIMIT 50;

SELECT
  m.id,
  m.conversation_id,
  m.sender_id,
  m.content,
  m.created_at
FROM public.messages m
ORDER BY m.created_at DESC
LIMIT 50;


Use when:

A vendor or institution can’t see a conversation

Messages aren’t appearing in a thread

3.10 Feed Items & Likes
SELECT
  id,
  author_id,
  visibility_scope,
  is_kids_safe,
  created_at
FROM public.feed_items
ORDER BY created_at DESC
LIMIT 50;

SELECT
  id,
  feed_id,
  user_id,
  created_at
FROM public.feed_likes
ORDER BY created_at DESC
LIMIT 50;


Use when:

Posts don’t show up

Like counts look off → you can count feed_likes per feed_id

3.11 Seasonal Featured Providers

Season + featured logic is driven by a view:

public.providers_discovery_v1

public.seasonal_featured_providers_v1 (seasonal boost)

Debug what’s seasonally “hot” right now:

SELECT *
FROM public.seasonal_featured_providers_v1
ORDER BY seasonal_score DESC, name
LIMIT 50;


Season Debug Qs:

“Given today, which tags are active?”

“Which vendors are considered seasonally featured?”

If the view is empty during a big season → seed is wrong or filters too strict.

3.12 Moderation & Notifications

Moderation queue (events/landmarks/applications):

SELECT
  id,
  entity_type,
  entity_id,
  submitted_by,
  status,
  reason,
  created_at,
  reviewed_at,
  reviewed_by
FROM public.moderation_queue
ORDER BY created_at DESC
LIMIT 50;


Notifications:

SELECT
  id,
  user_id,
  type,
  title,
  delivered,
  created_at,
  delivered_at
FROM public.notifications
ORDER BY created_at DESC
LIMIT 50;


Use when:

Submissions are stuck in pending

Users say “I never got the approval notification”

3.13 Community Uploads Safety (Global Hibernation Check)

If community uploads exist, they must be globally gated.

Check the toggle (pattern):

SELECT *
FROM public.app_settings
WHERE key = 'community_uploads_enabled';


Expected for now:

value = 'false' (or absent → treated as disabled)

RLS on community upload tables requires this flag = true.

This ensures:

Community uploads are possible at schema level

But blocked until you deliberately turn them on

Kids Mode never accesses community uploads

🧭 4. /founder/preview DEBUG FLOWS

These are manual click-through tests. You don’t touch SQL here.

4.1 Seasons Test

In /founder/preview:

Switch season → Spring, Summer, Fall, Winter.

Confirm:

Home UI colors change

Map / cards visually respond

Experiences and vendor tiles pick up seasonal styling

4.2 Holiday Consent Test

In /founder/preview:

Enable a holiday set (e.g. us_civic_holidays)

Toggle:

User holiday set ON/OFF

Business holiday set ON/OFF

Confirm:

Holiday overlays only appear when:

Date matches

User opted in

Business opted in

Kids Mode still has no holidays by default.

4.3 Dark Mode Test

Toggle dark mode.

Walk through:

Home

Map

Profiles

Experiences

Kids pages (when live)

Check:

No white-on-white text

Cards and modals have clear contrast

4.4 Kids Mode Test (Future-Ready)

When Kids Mode surfaces are enabled:

Turn on Kids Mode in preview.

Confirm:

No RFQs, bids, marketplaces

No messaging

No institution dashboards

Only kids-safe experiences and landmarks

Turn Kids Mode off:

Confirm normal views are restored

Confirm no stale “kids” filters remain in adult views

At launch, this is UI simulation only; no real Kids Mode DB writes are allowed.

🚨 5. WHEN SOMETHING LOOKS WRONG (FLOW)
Case 1 — User can’t do something they should be able to

Check public.user_tiers row for that user:

role, tier, account_status

feature_flags

Run:

SELECT public.has_feature('<USER_UUID>', '<flag_name>');


Confirm RLS policies on the relevant table.

Test the same flow in the app as that test user.

Case 2 — User can do something they should NOT be able to

Check if their role or tier is wrong.

Check if UI is logged in as another account.

Confirm:

RLS enabled on the table

No “catch-all” policy like:

USING (true)
FOR ALL TO authenticated


For trust/safety/founder bugs, confirm provider_badges rows were only ever written by admin.

Case 3 — Data exists in SQL but not in UI

Use the appropriate query from Section 3 to confirm data is present.

If present:

Bug is in UI filters / query parameters / route

If missing:

The INSERT path is broken

Check IDs:

user_id

provider_id

institution_id

Foreign keys

🧱 6. RED-LINE SAFETY INVARIANTS

These are never violated, even in debug:

❌ Never disable RLS “just to check something”

❌ Never run UPDATE/DELETE directly on user_tiers for real users in production

❌ Never open community uploads for Kids Mode

❌ Never expose community member profiles publicly

❌ Never grant sanctuary / rescue entities commercial access

❌ Never bypass the account deletion pipeline

❌ Never let vendors/institutions self-assign founder / verified / safety badges

If you need to hotfix something:

Do it once, via a documented migration, and update the relevant docs & policies.

This document is canonical.
If a future script, function, or AI suggestion conflicts with this toolkit → this toolkit wins.
