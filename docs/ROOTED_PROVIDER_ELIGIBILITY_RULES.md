# ROOTED — PROVIDER ELIGIBILITY RULES (CANONICAL)

File: /docs/ROOTED_PROVIDER_ELIGIBILITY_RULES.md  
Authority Level: Implementation Contract (NON-LAW)  
Status: ✅ LOCKED | ✅ PRE-UI REQUIRED

---

## PURPOSE

This file defines the eligibility rules that gate:

- discovery visibility (when needed)
- event hosting privileges
- volunteer hosting privileges
- marketplace eligibility (RFQ/bid/bulk)
- analytics access levels
- future payments readiness (prepared vs live)

Enforcement must occur in:
- Database (RLS / constraints / views / RPCs)
- Never UI-only

---

## CANONICAL BADGES

These badges already exist and are canonical enforcement candidates:

- `INSURED`
- `LICENSED`
- `verified` / `VERIFIED_VENDOR` / `VERIFIED_INSTITUTION`
- `ETHICALLY_SOURCED`
- `KIDS_MODE_SAFE`
- Sanctuary/nonprofit identifiers (badge or specialty routing)

---

## SANCTUARY / NONPROFIT — ABSOLUTE PROTECTIONS

If a provider is in the sanctuary/nonprofit classification set, then:

Allowed:
- discovery
- story + education content
- volunteer events (subject to volunteer rules)
- basic non-sensitive analytics (views/saves/clicks as allowed)

Not allowed:
- premium/premium_plus monetization routes where prohibited
- B2B marketplaces where prohibited
- any “rank-by-payment” discovery bias

Enforcement sources:
- `public.sanctuary_providers` central list
- provider badges (if used as secondary signals)
- RLS restrictive policies (deny-first)

---

## MARKETPLACE ELIGIBILITY (CANONICAL MODEL)

### Bulk marketplace (bulk_offers)
Minimum gates (example intent):
- vendor role
- tier >= premium (or premium_plus depending on vertical)
- must own provider_id
- must not be sanctuary/nonprofit
- may require INSURED + LICENSED based on vertical_code + specialty overlay (recommended)

### Bid marketplace (rfqs/bids)
Minimum gates (current intent you already enforce strongly):
- bids: premium_plus vendor only
- rfqs: institution/admin (and/or bulk-capable institutions)
- vertical_code must match canonical_verticals
- (recommended) add compliance gates per vertical_code where required (INSURED/LICENSED)

---

## ADS / SPONSORSHIP SLOTS (DOCS ONLY)

Ads/civic sponsorship slots:
- are optional
- never required for production readiness
- never appear in Kids Mode or Teens Mode
- are controlled by platform choice flags and must be backed by DB rules when implemented

This does not belong in governance law.
