# ROOTED — VERTICAL CAPABILITY MATRIX (CANONICAL)

File: /docs/ROOTED_VERTICAL_CAPABILITY_MATRIX.md  
Authority Level: Platform Capability Router (NON-LAW, BINDING FOR IMPLEMENTATION)  
Status: ✅ LOCKED | ✅ PRE-UI REQUIRED

---

## PURPOSE

This matrix defines what each vertical is allowed to do:

- Discovery
- Events
- Volunteer
- Registrations (non-ticket, civic)
- Ticketing semantics (when applicable)
- B2B procurement (RFQs / bids / bulk)
- Payments (OFF / PREPARED / LIVE)
- Ads / Civic Sponsorship slots (NEVER / OPTIONAL / ALLOWED)
- Kids Mode exposure (NEVER / FILTERED / ALLOWED)
- Teens Mode exposure (NEVER / FILTERED / ALLOWED)

This file does NOT create law — it routes execution.

---

## GLOBAL NON-NEGOTIABLES (CANONICAL)

1) **Kids are never monitored** and are not a separate identity entity.
2) **Ads and sponsorship slots never appear in Kids Mode or Teens Mode.**  
3) Ads/sponsorship slots are **optional** and never required for “production grade.”
4) Markets may be **prepared** but not launched until the vertical is stable and governance-aligned.
5) Sanctuary/nonprofit protections are supreme: they can be visible for discovery/education and volunteer (as allowed), but must not be allowed into restricted marketplaces where prohibited by governance + RLS.

---

## CAPABILITY STATES

- OFF: not built, not exposed
- PREPARED: built + stress tested, but not enabled publicly
- LIVE: enabled for production users under governance + RLS

---

# A) PLATFORM / CORE REPOS (NOT VERTICALS)

These are system repos and do not represent public vertical experiences.

| Repo | Type | Notes |
|---|---|---|
| rooted-platform | Platform docs + governance | Canonical governance + platform architecture |
| rooted-core | Core backend engine | Auth, tiers, RLS, payments plumbing, analytics |
| rooted-shared-ui | UI components only | No business logic, no governance logic |

---

# B) VERTICALS (CANONICAL SET — COMPLETE)

## 1) ROOTED Community Pillar

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots (Adults only) | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-community | LIVE | LIVE | LIVE | LIVE (civic) | PREPARED (not launched) | OFF (prepared later) | OPTIONAL | FILTERED | FILTERED |
| rooted-community-services | LIVE | LIVE | LIVE | LIVE (civic) | OFF/PREPARED (case-by-case) | OFF | OPTIONAL | FILTERED | FILTERED |
| rooted-environments | LIVE | LIVE | Optional | LIVE (civic) | OFF | OFF | OPTIONAL | FILTERED | FILTERED |
| rooted-environment | LIVE | LIVE | Optional | LIVE (civic) | OFF | OFF | OPTIONAL | FILTERED | FILTERED |

Notes:
- Community remains non-extractive.
- Community procurement is NOT a launch requirement and can remain PREPARED indefinitely.

---

## 2) Agriculture & Food Systems (FIRST MARKET-READY)

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots (Adults only) | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-agriculture | LIVE | LIVE | LIVE | LIVE (civic) | **LIVE** (institutions↔farmers) | PREPARED → later | OPTIONAL | FILTERED | FILTERED |

Canonical intent:
- Agriculture is allowed to be the **first real institutional + farm marketplace**.
- This vertical is where procurement proves itself before it touches anything else.

---

## 3) Education & Youth-Facing Decision Making (Adult-operated)

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-education | LIVE | LIVE | Optional | LIVE (civic) | PREPARED (institutions only) | PREPARED (later) | OPTIONAL (adult-only pages) | FILTERED | FILTERED |
| rooted-science-maker | LIVE | LIVE | Optional | LIVE (civic) | OFF/PREPARED | OFF | OPTIONAL | FILTERED | FILTERED |

Notes:
- Kids Mode = view safety overlays; no kid identity tracking.
- Field-trip/workforce pipelines are mediated by adult accounts and institutional verification rules.

---

## 4) Arts, Culture, Experiences

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-arts-culture | LIVE | LIVE | Optional | LIVE (civic) | PREPARED (later) | PREPARED (later) | OPTIONAL (adult-only) | FILTERED | FILTERED |
| rooted-experiences | LIVE | LIVE | Optional | LIVE (civic) | PREPARED (later) | PREPARED (later) | OPTIONAL (adult-only) | FILTERED | FILTERED |
| rooted-land-resources | LIVE | LIVE | Optional | LIVE (civic) | OFF | OFF | OPTIONAL | FILTERED | FILTERED |

---

## 5) Infrastructure & Industry

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-construction | LIVE (contractor discovery) | Optional | Optional | LIVE (civic) | **LIVE/PREPARED** (RFQ→bid) | PREPARED (later) | OPTIONAL | NEVER/FILTERED | NEVER/FILTERED |
| rooted-manufacturing | LIVE | Optional | Optional | LIVE (civic) | PREPARED | PREPARED | OPTIONAL | NEVER/FILTERED | NEVER/FILTERED |
| rooted-logistics | LIVE | Optional | Optional | LIVE (civic) | PREPARED | PREPARED | OPTIONAL | NEVER/FILTERED | NEVER/FILTERED |
| rooted-housing | LIVE | Optional | Optional | LIVE (civic) | PREPARED | PREPARED | OPTIONAL | NEVER/FILTERED | NEVER/FILTERED |
| rooted-workforce | LIVE | Optional | Optional | LIVE (civic) | PREPARED | PREPARED | OPTIONAL | FILTERED | FILTERED |

Important: you explicitly cut off private-home procurement.  
Procurement targets institutions, verified projects, and public-good contexts only.

---

## 6) Government & Utilities

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-government | LIVE | LIVE | Optional | LIVE (civic) | OFF/PREPARED | OFF | OPTIONAL (adult-only) | FILTERED | FILTERED |
| rooted-utilities | LIVE | Optional | Optional | LIVE (civic) | OFF | OFF | OPTIONAL (adult-only) | FILTERED | FILTERED |

---

## 7) Safety, Emergency, Disaster

You explicitly want these merged into ONE repo.

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-emergency-and-disaster | LIVE | Optional | Optional | LIVE (civic) | OFF | OFF | NEVER | FILTERED (safety only) | FILTERED |

Notes:
- Informational awareness only. No 911 replacement. No medical diagnosis. No political/editorial content.

---

## 8) Public Safety

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-public-safety | LIVE | Optional | Optional | LIVE (civic) | OFF | OFF | NEVER/OPTIONAL (your choice) | FILTERED | FILTERED |

---

## 9) Healthcare (High Boundary)

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-healthcare | LIVE (facility/program discovery) | Optional | Optional | LIVE (civic) | PREPARED (future) | OFF/PREPARED (far future) | NEVER/OPTIONAL (your choice) | FILTERED | FILTERED |

Hard boundary: non-clinical, no EMR, no diagnosis, no protected medical record storage.

---

## 10) Meta + Regional Intelligence

These are structural intelligence and planning verticals.

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-meta-infrastructure | LIVE (education/clarity) | Optional | Optional | Optional | OFF | OFF | OPTIONAL (adult-only) | FILTERED | FILTERED |
| rooted-regional-intel | LIVE (signals/forecast/insight) | Optional | Optional | Optional | OFF | OFF | OPTIONAL (adult-only) | FILTERED | FILTERED |

---

## 11) Discovery-Only Verticals (Public Storytelling)

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-local-business | LIVE | Optional | Optional | LIVE (civic) | OFF | OFF | OPTIONAL (adult-only) | FILTERED | FILTERED |
| rooted-celebrations | LIVE | LIVE (public event listings) | Optional | LIVE (civic) | OFF | OFF | OPTIONAL (adult-only) | FILTERED | FILTERED |

---

## 12) Wellness Expansion (NEW REPOS YOU WANT)

These repos do not exist yet (you asked to include them). They are PREPARED in matrix now, not launched.

| Vertical Repo | Discovery | Events | Volunteer | Registrations | B2B Procurement | Payments | Ads Slots | Kids Exposure | Teens Exposure |
|---|---:|---:|---:|---:|---:|---|---|---|---|
| rooted-wellness | LIVE | LIVE | Optional | LIVE (civic) | PREPARED (later) | PREPARED (later) | OPTIONAL (adult-only) | FILTERED | FILTERED |
| rooted-fitness | PREPARED | PREPARED | Optional | PREPARED (civic) | OFF | OFF/PREPARED | OPTIONAL (adult-only) | FILTERED | FILTERED |
| rooted-sports | PREPARED | PREPARED | Optional | PREPARED (civic) | OFF | OFF/PREPARED | OPTIONAL (adult-only) | FILTERED | FILTERED |

Canonical intent:
- Sports/fitness can rival TeamSnap-style capabilities later,
- But payments are delayed until procurement models are proven and governance is stable.

---

## CANONICAL NOTE: “PREPARED ≠ LAUNCHED”

Markets can be built, tested, and hardened without exposure.

Launch only occurs when:
1) governance and life-capacity allow it
2) abuse tests pass
3) backend enforcement passes stress tests
4) you explicitly green-light the vertical capability state change
