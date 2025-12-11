# ROOTED Vertical & Marketplace Model (Canonical)

This document describes how ROOTED’s vertical system is wired at the database level. It is the canonical reference for:

Vertical codes (21 total)

How providers, RFQs, bids, bulk offers, events, and landmarks attach to verticals

Separation of backend law vs community-facing discovery

The market_coverage_v1 debug view

---

## 1. Canonical verticals

Table: public.canonical_verticals

Columns:

vertical_code text PRIMARY KEY

label text – human-readable name

description text – optional description

sort_order integer NOT NULL – controls display order

default_specialty text NULL – FK → specialty_types(code)

Notes:

This is the only source of truth for verticals.

All other tables that care about verticals reference canonical_verticals.vertical_code.

---

## 2. Law vs. Discovery: vertical_code vs vertical

ROOTED intentionally separates backend law from community-facing labels:

Law / backend spine

providers.primary_vertical → FK to canonical_verticals.vertical_code

rfqs.vertical_code → FK to canonical_verticals.vertical_code

bids.vertical_code → FK to canonical_verticals.vertical_code

bulk_offers.vertical_code → FK to canonical_verticals.vertical_code

events.event_vertical → FK to canonical_verticals.vertical_code

landmarks.landmark_vertical → FK to canonical_verticals.vertical_code

Discovery / UI

providers.vertical text is a community-facing bucket, e.g.:

community

education

experiences

arts_culture

Discovery views can show both:

providers.vertical (soft label)

providers.primary_vertical (canonical vertical code)

Rule: No safety-critical or marketplace logic may depend on providers.vertical. All enforcement must flow through the canonical vertical codes and specialties/badges.

---

## 3. Marketplace tables and verticals

---
3.1 RFQs

Table: public.rfqs

Key columns:

institution_id uuid

vertical_code text NOT NULL

plus RFQ details (title, description, quantity, etc.)

Constraints:

ALTER TABLE public.rfqs
ADD CONSTRAINT rfqs_vertical_code_fkey
FOREIGN KEY (vertical_code)
REFERENCES public.canonical_verticals(vertical_code);


Canonical view:

CREATE OR REPLACE VIEW public.market_rfqs_v1 AS
SELECT
  r.id,
  r.institution_id,
  r.vertical_code,
  r.title,
  r.description,
  r.category,
  r.quantity,
  r.unit,
  r.delivery_start_date,
  r.delivery_end_date,
  r.status,
  r.created_at,
  r.updated_at
FROM public.rfqs r;


Per-vertical RFQ views simply filter:

CREATE OR REPLACE VIEW public.agriculture_rfqs_v1 AS
SELECT *
FROM public.market_rfqs_v1
WHERE vertical_code = 'AGRICULTURE_FOOD';

CREATE OR REPLACE VIEW public.community_rfqs_v1 AS
SELECT *
FROM public.market_rfqs_v1
WHERE vertical_code = 'COMMUNITY_SERVICES';

CREATE OR REPLACE VIEW public.education_rfqs_v1 AS
SELECT *
FROM public.market_rfqs_v1
WHERE vertical_code = 'EDUCATION_WORKFORCE';

CREATE OR REPLACE VIEW public.construction_rfqs_v1 AS
SELECT *
FROM public.market_rfqs_v1
WHERE vertical_code = 'CONSTRUCTION_BUILT_ENVIRONMENT';

CREATE OR REPLACE VIEW public.experiences_rfqs_v1 AS
SELECT *
FROM public.market_rfqs_v1
WHERE vertical_code = 'EXPERIENCES_RECREATION_TOURISM';

CREATE OR REPLACE VIEW public.arts_culture_rfqs_v1 AS
SELECT *
FROM public.market_rfqs_v1
WHERE vertical_code = 'ARTS_CULTURE_HERITAGE';


(The same pattern can be extended to all 21 vertical_code values.)

---

3.2 Bids

Table: public.bids

Key columns:

rfq_id uuid

vendor_id uuid

vertical_code text NOT NULL

plus bid details (price, currency, notes, status, timestamps)

Constraint:

ALTER TABLE public.bids
ADD CONSTRAINT bids_vertical_code_fkey
FOREIGN KEY (vertical_code)
REFERENCES public.canonical_verticals(vertical_code);


Canonical view:

CREATE OR REPLACE VIEW public.market_bids_v1 AS
SELECT
  b.id,
  b.rfq_id,
  b.vendor_id,
  b.vertical_code,
  b.price_total,
  b.price_unit,
  b.currency,
  b.notes,
  b.status,
  b.created_at,
  b.updated_at
FROM public.bids b;


Per-vertical views follow the same pattern as RFQs:

CREATE OR REPLACE VIEW public.agriculture_bids_v1 AS
SELECT *
FROM public.market_bids_v1
WHERE vertical_code = 'AGRICULTURE_FOOD';


(and so on for other verticals.)

---

3.3 Bulk offers

Table: public.bulk_offers

Key columns:

provider_id uuid – owning provider

vertical_code text NOT NULL – canonical vertical

plus pricing, quantity, and availability fields.

Canonical enforcement trigger (conceptual):

Looks up the provider’s primary_vertical and specialty.

If vertical_code is NULL, defaults it to primary_vertical.

Otherwise enforces that the chosen vertical_code is allowed for that specialty (via cross-vertical specialty mapping).

Canonical view:

CREATE OR REPLACE VIEW public.market_bulk_offers_v1 AS
SELECT
  bo.id,
  bo.provider_id,
  bo.vertical_code,
  bo.category,
  bo.title,
  bo.description,
  bo.min_quantity,
  bo.unit,
  bo.price_per_unit,
  bo.currency,
  bo.delivery_radius_miles,
  bo.is_delivery_available,
  bo.pickup_only,
  bo.is_active,
  bo.starts_at,
  bo.ends_at,
  bo.created_at,
  bo.updated_at
FROM public.bulk_offers bo;


Per-vertical views again filter on vertical_code:

CREATE OR REPLACE VIEW public.agriculture_bulk_offers_v1 AS
SELECT *
FROM public.market_bulk_offers_v1
WHERE vertical_code = 'AGRICULTURE_FOOD';

---

## 4. Events and volunteering

Table: public.events

Key vertical column:

event_vertical text NOT NULL → FK to canonical_verticals(vertical_code)

Constraint:

ALTER TABLE public.events
ADD CONSTRAINT events_event_vertical_fkey
FOREIGN KEY (event_vertical)
REFERENCES public.canonical_verticals(vertical_code);


Volunteer surfaces:

public.volunteer_events_v1 – adult/parent/institution-facing volunteer events (published + approved).

public.teen_volunteer_events_v1 – teen-safe subset:

event is volunteer, approved, small-scale

no institutional partner requirement

hosted only by allowed specialties/badges (e.g., farms, sanctuaries)

restricted to safe verticals (e.g., community, education).

These views consume events.event_vertical (canonical) plus provider specialties/badges and Kids/Teen governance logic from the global law set.

---

## 5. Providers: law vs. discovery

Table: public.providers

Relevant columns:

primary_vertical text NOT NULL → FK to canonical_verticals(vertical_code)

vertical text – community-facing bucket (e.g., community, education, experiences, arts_culture)

specialty text → FK to specialty_types(code)

plus flags like is_education_site, is_arts_culture_site, is_community_org, etc.

Principle:

primary_vertical + specialty + badges = who you are in law (what markets and events you can host).

vertical + badges + tags = how the community sees you in discovery.

Discovery views (e.g., *_providers_discovery_v1, *_sites_v1, *_trusted_providers_v1) are allowed to:

Filter by discovery flags (is_education_site, is_community_org, etc.).

Show vertical and primary_vertical together.

They must not be used to bypass vertical law for marketplaces or events.

---

## 6. Market coverage debug view (canonical)

View: public.market_coverage_v1

Purpose: 21-row debug surface showing which verticals currently have RFQs, bids, bulk offers, and events.

Definition:

CREATE OR REPLACE VIEW public.market_coverage_v1 AS
SELECT
  v.vertical_code,
  v.label AS vertical_label,
  EXISTS (
    SELECT 1
    FROM public.rfqs r
    WHERE r.vertical_code = v.vertical_code
  ) AS has_rfqs,
  EXISTS (
    SELECT 1
    FROM public.bids b
    WHERE b.vertical_code = v.vertical_code
  ) AS has_bids,
  EXISTS (
    SELECT 1
    FROM public.bulk_offers bo
    WHERE bo.vertical_code = v.vertical_code
  ) AS has_bulk_offers,
  EXISTS (
    SELECT 1
    FROM public.events e
    WHERE e.event_vertical = v.vertical_code
  ) AS has_events
FROM public.canonical_verticals v
ORDER BY v.sort_order, v.vertical_code;


Usage:

SELECT * FROM public.market_coverage_v1;


One row per vertical.

Initially all flags may be false (cold start, no seed data).

As seeding and real data are added, this acts as a quick “vertical health” dashboard.
