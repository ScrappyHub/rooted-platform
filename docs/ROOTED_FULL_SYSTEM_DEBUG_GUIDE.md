ROOTED – FULL SYSTEM DEBUG GUIDE (HONEST PASS)

This is the master debug playbook for everything that exists today across ROOTED:

ROOTED Core (auth, roles, RLS, media, GEO, analytics)

ROOTED Community Vertical (directory, feeds, events, landmarks, basic marketplaces)

ROOTED Construction Vertical (schema + hardening docs, pre-production)

Future verticals (healthcare, education, arts & culture, environment, disaster, emergency, workforce, etc.) → planning only, not live, do not treat as active software.

This guide is brutally honest:
If something is not built, it says so.
If something is fragile, it says so.
If something is production-strong, it says so.

0. How To Use This Guide

When you (or another dev / AI) are debugging ROOTED:

Start at Layer 1 – Core Platform (Supabase, auth, roles).

Then debug Community Vertical (the only fully live vertical).

Then apply the Construction Hardening Checklist (backend only).

Treat all other vertical repos as documentation & roadmap, not active apps.

Never assume a feature exists because a document mentions it.
This doc is the source of truth for “what we can debug right now”.

1. Debug Layers Overview
1.1 Layers

ROOTED has these main layers:

Core Platform

Supabase project

user_tiers, feature_flags

Providers, media, GEO, analytics

RLS policies and security

Community Vertical (LIVE)

Directory (vendors / institutions / landmarks)

Feeds & comments (with restrictions)

Events & volunteer listings

Kids Mode front-end

Seasonal & holiday overlays (logic present, some wiring pending)

Basic analytics surface

Construction Vertical (PRE-PRODUCTION)

Fully written schemas & flows

Pre-production audit report

Hardening checklist

Backend only so far (no app UI wired yet)

Future Verticals (PLANNING ONLY)

Healthcare

Arts & culture

Education

Environment

Disaster, Emergency, Workforce, etc.

Repos exist, but are framework + docs, not functioning apps.

2. Global Debug Tools (What You Use)

For every layer, your standard toolkit is:

Supabase Dashboard

Table editor

SQL editor

RLS policy viewer & tester

Front End

Browser dev tools (Network, Console, Storage)

Mobile device / dev tools (responsive views)

Feature flags in UI (toggles, kids mode, login states)

HTTP / API

Postman / Thunder Client / Insomnia for direct API calls (once you expose endpoints)

Supabase client logs / JS network calls from the app

Logging & Observability (Future)

Console logging in front-end

Supabase logs (for auth, RLS errors)

Edge function logs (once implemented)

If a debug step mentions a tool you don’t have yet (like edge logs), that means: planned, not yet wired.

3. CORE PLATFORM – DEBUG CHECKLIST
3.1 Auth & user_tiers

Goal: every signed-in user has exactly one correct user_tiers row and role/tier behaves as expected.

Steps:

In Supabase:

Open user_tiers table.

For each test account:

role is one of: vendor, institution, admin, individual/community.

tier is one of: free, premium, premium_plus.

feature_flags JSON exists and matches expectations.

In app (Community UI):

Log in as each type:

Free vendor

Premium Plus vendor

Institution

Individual

Confirm:

They see the right dashboard / sections.

They do not see tools outside their tier (e.g., free vendor shouldn’t see premium analytics).

If it fails:

Likely missing or wrong user_tiers row.

RLS might be rejecting the query silently (check Supabase logs).

3.2 RLS & Permissions

Goal: No one can read/write what they shouldn’t, and free users can still do allowed actions.

High-risk tables to sanity check:

providers

provider_media / vendor_media

rfqs, bids, bulk_offers

conversations, conversation_participants, messages

events, event_registrations

landmarks

feed_items, feed_comments, feed_likes

vendor_analytics_*

Debug pattern:

For each table:

In a new private window, log in as each test user type (or use Supabase row-level testing).

Try:

SELECT (view)

INSERT (create)

UPDATE (edit own item)

DELETE (where allowed)

Confirm:

Vendor can update only their own rows.

Institution can see what they should, not others’ internal data.

Admin sees everything where policy allows.

If you hit errors like:

new row violates row-level security policy

→ The policy is working, but you might need a more specific condition.

If you never hit RLS errors but see too much data → RLS is too weak.

3.3 Media & Storage

Buckets:

rooted-public-media

rooted-protected-media

Debug:

Upload from UI as:

Vendor

Institution

Confirm:

Upload succeeds and shows in UI.

Public images load without auth where expected.

Protected media does not open in a private/incognito tab without auth.

In Supabase:

Browse objects.

Check path naming conventions (e.g., /vendors/{id}/...).

3.4 GEO & Discovery

You already have global GEO rules documented.
Debug steps:

In Community UI:

Trigger “Discover Vendors / Map”.

Change radius, category, and filters.

Confirm:

You see only curated vendors (controlled by GEO rules).

Municipal layers are not visible to regular users (this was a previous issue).

In Supabase:

Check the providers / GEO-related tables and confirm:

No random providers are marked as “featured” without intention.

No municipality / backend-only data is flagged as public.

If a municipal entity shows up:
→ That’s a UI bug + mis-flagged record.

4. COMMUNITY VERTICAL – UI & FLOW DEBUG

This is your live vertical. Treat this as production.

4.1 Directory (Vendors / Institutions / Community Spots)

Debug Steps:

Search:

By name

By category (farm, bakery, butcher, etc.)

By distance

Confirm:

Results are accurate.

No duplicates.

Closed or inactive providers don’t show.

For each provider, open profile:

Media loads.

Description doesn’t break layout.

No admin-only fields leaking (internal tags, notes, etc.).

4.2 Feed (Community Posts)

You’ve said you don’t want heavy social mechanics.

Debug:

Create posts as:

Individual

Vendor

Institution

Confirm:

Posts appear in the correct feed.

Kids Mode never shows full public feed (just curated / kids-safe content).

Comments & Likes:

Comments should be restricted / low-emphasis.

Likes exist but not central (no like spam views).

No one can post anonymously.

If you see:

Comment boxes in Kids Mode

Engagement-heavy UI (like counts everywhere)

→ That’s UI to de-emphasize or hide.

4.3 Events & Volunteering

Debug:

Create a public event (non-kids).

Create a kids-safe event.

Create a volunteer opportunity.

Check:

Event cards show:

Date, time, location

Whether volunteer or regular event

Kids Mode:

Shows only kids-safe events

Hides prices and payment CTAs

Registration:

Buttons work

Confirmations are clear

4.4 Kids Mode (CRITICAL)

Treat this as safety-critical UI, not just a theme.

Debug Flow:

Enter Kids Mode:

Requires parent flow / explicit toggle.

Feels visibly “different” (colors, icons).

Once inside:

No prices

No RFQs

No messaging

No donation/fundraiser surfaces

No “post to feed” anywhere

Try:

Tapping on every nav button.

Opening map.

Browsing events and vendors.

If anything commerce-like or adult feed shows in Kids Mode → bug.

4.5 Seasonal & Holiday UI

You’ve designed this as:

Season baseline always on

Holidays opt-in overlays only, never forced, never based on religion/demographics

Debug:

Change system date (or simulate) to:

A regular day

A holiday you support

Confirm:

Season-only visuals by default

Holiday overlays appear only when:

User opted in

Business opted in

Content is kid-safe (if in Kids Mode)

If you see holiday stuff with no consent → logic bug / unfinished wiring.

4.6 Support / Contact

You have a support form wired to your email.

Debug:

On desktop & mobile:

Check that “Contact / Support” is visible and not buried.

Submit a test support request.

Confirm:

UI shows success message.

Email arrives via Resend (or whatever provider you wired).

If mobile contact feels hidden → UI refinement needed, not backend.

5. CONSTRUCTION VERTICAL – BACKEND HARDENING DEBUG

This vertical is backend design + audits, not public UI.

Use your existing docs:

CONSTRUCTION_AUDIT_PREPRODUCTION.md

CONSTRUCTION_AUDIT_EXECUTIVE_SUMMARY.md

CONSTRUCTION_BACKEND_HARDENING_CHECKLIST.md

DATABASE_ENTITY_MODEL.md

ROLE_PERMISSION_MATRIX.md

AUTOMATION_FLOWS.md

RISK_FAILURE_ANALYSIS.md

5.1 Reality Check (Honest)

There is no live construction app UI yet.

Schemas and flows are pre-production.

You have known critical gaps (escrow, COI, bid deadline, etc.) already called out in the audit.

5.2 What You Can Debug Right Now

Schemas vs. docs:

Ensure that the tables that do exist in Supabase match names & key columns in docs.

RLS consistency:

For any tables you’ve already created from the design, test:

Contractor view

Institution view

Admin view

Hardening checklist:

Use CONSTRUCTION_BACKEND_HARDENING_CHECKLIST.md as the step-by-step process.

Check off items as you implement them in SQL.

Everything else for construction is design-stage debug, not live-system debug.

6. FUTURE VERTICALS – HONEST STATUS

Repos like:

rooted-healthcare

rooted-education

rooted-arts-culture

rooted-environment

rooted-workforce

rooted-disaster

rooted-emergency

rooted-utilities, etc.

are currently:

✅ Clearly described

✅ Scoped with role/permission ideas

✅ GEO rules linked back to rooted-core docs

❌ NOT wired to Figma

❌ NOT wired to Supabase

❌ NOT live

Debug stance:

You cannot debug these like apps, because they aren’t apps yet.

You can review docs for:

Contradictions

Role rule conflicts

Discovery leaks

Safety / compliance issues

Mark them as “future phase – documentation only” in your README to avoid confusion for other devs.

7. GLOBAL “HONEST GAPS” LIST

Here’s the blunt status of things that are not fully done:

🔴 Payments / escrow:

Not fully implemented.

Any “pay” or “donate” flows must be considered placeholder until wired to Stripe/etc + legal cleared.

🔴 Advanced analytics ETL:

Tables exist (design), but scheduled jobs / edge functions likely not wired.

Any advanced analytics dashboards are visual only until ETL exists.

🟠 Holiday / cultural overlays:

Logic is designed.

Need end-to-end test to confirm opt-in behavior and respect for Kids Mode.

🟠 Messaging moderation & reporting:

Conversation + messages tables exist.

Need clear moderation UI + flows for abuse reporting.

🟠 Construction critical security hardening:

You have a full audit.

Critical issues (admin verification, bid deadline, COI, escrow, etc.) are design-ready but not yet all implemented in DB.

🟢 Core auth + roles:

You do have a stable user_tiers + feature_flags model.

Needs continual testing as you add tiers or UI routing changes.

8. SIMPLE “RUN THIS WHEN STUFF BREAKS” CHECKLIST

When anything feels broken, run this top-down:

Who am I logged in as?

Check user_tiers row in Supabase.

Is RLS blocking me?

Look for RLS error messages or check Supabase logs.

Is the UI allowed to show this?

Kids Mode?

Role?

Tier?

Is this feature actually built yet?

If it’s construction / healthcare / emergency vertical UI → probably not wired yet.

Is this a GEO or discovery issue?

Check whether the provider / event should be visible based on discovery rules.

Is this a media/storage issue?

Try loading the raw media URL.

Check bucket + path + permissions.

Is this just UI state bugging out?

Clear cache, reload, log out/in.

Check for stale feature flags or state not resetting on nav.

If it’s still weird:

Write a short bug report:

Role / tier

Mode (kids / normal)

Page / feature

What you expected

What actually happened
