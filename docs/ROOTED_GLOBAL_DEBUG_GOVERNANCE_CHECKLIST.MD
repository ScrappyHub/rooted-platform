ROOTED – GLOBAL DEBUG + GOVERNANCE CHECKLIST

Version: v1.0 (Canonical Locked)

This document defines the complete verification framework for ROOTED vertical readiness, data integrity, safety logic, and system compliance.
Every vertical must pass all nine layers before activation.

1. Vertical Registration Layer

Every vertical must exist in canonical_verticals with the following required fields:

vertical_code

name

is_active

supports_rfq

supports_bulk_offers

supports_events

supports_volunteering

is_kids_safe_vertical

seasonal_intel_enabled

Debug Queries
SELECT * FROM canonical_verticals ORDER BY vertical_code;

Validation Requirements

No missing vertical definitions.

No unknown vertical_code used by providers, RFQs, bids, bulk offers, or events.

Capability flags must correctly reflect supported behaviors.

2. Provider Layer

Each vertical must have at least one valid vendor provider.
If the vertical requires institutions (education, healthcare, community services), those must also be present.

Provider Requirements

provider record with primary_vertical defined

provider badges applied correctly

is_discoverable set correctly

Kids/Teens safety flags applied when applicable

Debug Queries
SELECT provider_id, name, primary_vertical, is_discoverable
FROM providers
ORDER BY primary_vertical;

SELECT *
FROM provider_badges
WHERE provider_id = :id;

Validation Requirements

Providers match valid verticals.

No orphan provider_badges.

Institutional providers correctly mapped when required.

3. Marketplace Layer (RFQs, Bids, Bulk Offers)

Verticals supporting procurement workflows must have:

At least one RFQ

At least two valid bids

At least one bulk offer (if supported)

RFQs, bids, and bulk offers must carry correct vertical_code

Debug Queries
SELECT id, institution_id, vertical_code, status
FROM rfqs ORDER BY created_at DESC;

SELECT id, rfq_id, vendor_id, vertical_code, status
FROM bids ORDER BY created_at DESC;

SELECT id, vendor_id, vertical_code, is_active
FROM bulk_offers ORDER BY created_at DESC;

Validation Requirements

All RFQs reference institutions with valid primary_vertical.

All bids reference vendors in the same vertical as the RFQ.

All bulk offers match the vendor’s vertical.

No NULL vertical assignments.

4. Experience / Events Layer

Verticals supporting events must include:

At least one event

Correct event_vertical assignment

Proper tag arrays (season_tags, cultural_tags, holiday_tags)

Correct JSONB formatting for community_tags

status and moderation_status set

Debug Query
SELECT id, title, event_type, event_vertical, status, moderation_status
FROM events
ORDER BY created_at DESC;

Validation Requirements

event_vertical must exist in canonical_verticals.

event_type must pass its check constraint.

Arrays and JSONB fields must be valid.

seasonal_category must match season_tags when applicable.

5. Volunteer Layer

The following views must return valid rows:

volunteer_events_v1

community_volunteer_events_v1

volunteer_events_by_vertical_v1

teen_volunteer_events_v1

kids_volunteer_lockout_v1 (if applicable)

Debug Queries
SELECT * FROM volunteer_events_v1;
SELECT * FROM teen_volunteer_events_v1;
SELECT * FROM volunteer_events_by_vertical_v1;

Validation Requirements

Every volunteer event appears in the core superset.

Teen view excludes large-scale and institutional-required events.

Kids view includes only explicitly safe events.

6. Safety and Age-Mode Enforcement
Kids Mode Requirements

Kids cannot view unsafe events, providers, or verticals.

Must respect is_kids_safe, kids_mode_safe, cultural_tags, and community_tags filtering.

No direct-contact features allowed unless parent-enabled.

Teen Mode Requirements

Must exclude large-scale volunteer events.

Must exclude events requiring an institutional partner.

Must exclude verticals classified as unsafe.

Debug Query
SELECT id, title, is_kids_safe, kids_mode_safe
FROM events
WHERE event_type = 'volunteer';

Validation Requirements

All safety flags present.

All filtering views correctly exclude restricted content.

7. Seasonal and Holiday Intelligence Layer
Required Components

seasonal admin control tables

holiday override tables

seasonal_featured_providers_v1

providers_discovery_v1

Debug Queries
SELECT * FROM seasonal_featured_providers_v1;
SELECT * FROM providers_discovery_v1;

Validation Requirements

Providers receive seasonal scoring correctly.

Events reflect seasonal_category and tag logic.

No missing season_tags or malformed arrays.

8. RLS and Security Layer

All production tables must have:

RLS enabled

At least one SELECT policy

At least one INSERT/UPDATE policy where applicable

Correct scoping for:

provider owners

institutional admins

community accounts

kids/teens filtering

admin override role

Debug Query
SELECT tablename, rowsecurity
FROM pg_tables
WHERE schemaname = 'public';

Validation Requirements

No table with rowsecurity = false.

No policy granting unintended full access.

Stripe subscription functions properly enforce tiered features.

9. Observability and Admin Debug Layer

These internal debug views must be valid:

vertical_completeness_debug_v1

provider_audit_debug_v1

event_correctness_debug_v1

Debug Queries
SELECT * FROM vertical_completeness_debug_v1;
SELECT * FROM provider_audit_debug_v1;
SELECT * FROM event_correctness_debug_v1;

Validation Requirements

All verticals show “ready” before activation.

All providers have correct tiering and discoverability.

All events pass safety, tagging, and vertical assignments.

Vertical Launch Readiness Summary

A vertical is approved for launch only when all nine layers pass.

Layer	Requirement
Vertical Registration	canonical_verticals entry complete
Provider Layer	vendor + required institutions present
Marketplace	RFQ + two bids + bulk offer if supported
Events	at least one event with correct vertical
Volunteer System	volunteer events present in all views
Safety Enforcement	kids/teens filtering correct
Seasonal Intelligence	seasonal + holiday logic correct
RLS Security	all policies active and scoped correctly
Debug Views	all system audits pass

If all nine layers pass, the vertical is certified production-ready.
