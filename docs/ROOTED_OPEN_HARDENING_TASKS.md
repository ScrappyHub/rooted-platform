# ✅ ROOTED — OFFICIAL HARDENING TODO (CANONICAL MASTER)

File: /docs/ROOTED_OPEN_HARDENING_TASKS.md  
Authority Level: Execution Checklist (NON-LAW)  
Status: Phase 1 — Community + Agriculture Markets + Core Enforcement  
Rule:

> Governance → Feature Flags → RLS → Views → UI Gates  
> (Never reversed. UI is never authority.)

---

## Cross-References (Binding Sources of Truth)

**Law (Governance folder):**
- `/governance/ROOTED_GOVERNANCE_INDEX.md`
- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`
- `/governance/ROOTED_STOP_LAYER.md`
- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`
- `/governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md`
- `/governance/ROOTED_ACCESS_POWER_LAW.md`
- `/governance/ROOTED_DATA_SOVEREIGNTY_LAW.md`

**Docs (Implementation contracts):**
- `/docs/ROOTED_DOCS_INDEX.md`
- `/docs/ROOTED_VERTICAL_CAPABILITY_MATRIX.md`
- `/docs/ROOTED_PROVIDER_ELIGIBILITY_RULES.md`
- `/docs/ROOTED_REGISTRATION_AND_TICKETING_SEMANTICS.md`
- `/docs/ROOTED_PAYMENTS_AND_PROCUREMENT_MODEL.md`
- `/docs/DATABASE_VERTICAL_MARKETPLACE_MODEL.md`
- `/docs/ROOTED_SECURITY_DISCOVERY_CONTRACT.md`
- `/docs/ROOTED_Master_Debug_Toolkit.md`
- `/docs/ROOTED_GLOBAL_DEBUG_GOVERNANCE_CHECKLIST.MD`
- `/docs/ROOTED_PRE-LAUNCH-ABUSE_TEST_MATRIX`

---

# 0) PRE-FLIGHT (ALWAYS FIRST)

✅ Verified: your SQL console session is currently `postgres/postgres` with `uid_now = null`.
This is expected for admin SQL work, but **all RLS stress tests MUST also be run as authenticated**.

### TODO
- Maintain a repeatable “Auth Session Check” script:
  - Validate `auth.uid()` is non-null for user-simulation tests
  - Validate `jwt_role = authenticated` for RLS insert/update tests
- Keep the canonical test header block for every INSERT stress test:
  - current_user / session_user / uid_now / jwt_role / jwt_sub

---

# 1) USER TIERS & FEATURE FLAGS (CANONICAL LOCK)

✅ Already Locked
- `public.user_tiers` is single authority for:
  - `role`, `tier`, `account_status`, `feature_flags`
- `has_feature(...)` and `current_user_has_feature(...)` confirmed
- Premium ≠ Premium Plus
- Admin is logged + RLS governed (no silent power)

### TODO (Hardening)
- Add explicit deny/allow flags for “future markets” (deny-first):
  - `can_use_experience_market`
  - `can_use_event_bidding`
  - `can_use_ticketing` (future)
  - `can_use_payments` (future)
- Add “capability state” flags (prepared vs launched):
  - `vertical_<code>_state = off|prepared|live` (implementation pattern)
- Add audit triggers/records for all market mutations:
  - RFQs, Bids, Bulk Offers
  - (future) Experience Quotes, Event Bidding, Ticket-like flows

---

# 2) ADMIN OVERRIDE & AUDITABILITY

✅ Already Locked
- `user_admin_actions` exists
- Admin role enforced via `public.is_admin()`
- Admin access policies exist on: bids, bulk_offers, analytics, moderation_queue, provider_badges

### TODO
- Confirm RLS policy correctness on:
  - `notifications` admin read scope
  - `user_admin_actions` admin read scope
- Ensure all admin writes route through RPCs where required and emit audit rows
- Track Admin UI Toolkit as Phase 1.5 (not required for launch)

---

# 3) KIDS MODE HARD LOCK (NO CHILD MONITORING)

✅ Canonical Truth
- Kids Mode is a **safety state** on an adult account.
- Kids are **not** separate user entities inside ROOTED.
- No monetization and no market access in Kids Mode.

✅ Already Locked (partially)
- Kids-safe enforcement exists for events/landmarks surfaces (as designed)

### TODO (Hardening)
- Kids-safe media approval pipeline:
  - Separate moderation lane for kids-safe photos/videos
- Teens: 13–17 volunteer-only rules (where allowed) must be DB enforceable
- Kids Explore must be “event-only” views where required (no marketplaces)
- Education vertical unlock must require:
  - governance + feature flag gate + DB constraints

---

# 4) ADS / CIVIC SPONSORSHIP SLOTS (DOCS-ONLY, OPTIONAL)

✅ Canonical Rule
- Ads/sponsorship slots are OPTIONAL and are never required for “production grade.”
- Ads/sponsorship slots MUST NEVER appear in:
  - Kids Mode
  - Teens Mode

### TODO (Implementation)
- Add docs-only file later (no governance law):
  - `/docs/ROOTED_CIVIC_SPONSORSHIP_SLOTS.md`
- When tables are introduced:
  - hard DB block: `is_kids_account()` and teen-mode equivalents
  - admin-controlled seeding + enable flags
  - UI placeholders must only render if DB says eligible + enabled

---

# 5) SANCTUARY & NONPROFIT ENFORCEMENT

✅ Already Locked
- Sanctuary/nonprofit classification exists via:
  - centralized `public.sanctuary_providers`
  - and/or provider badges like `SANCTUARY_VENDOR`, `NONPROFIT_VENDOR`
- Sanctuaries:
  - ✅ volunteer events
  - ✅ discovery/education surfaces (as allowed)
  - ❌ RFQs / Bids / Bulk markets
  - ❌ premium monetization routes (where prohibited)

✅ Observed Enforcement
- `bulk_offers` has a RESTRICTIVE deny policy for sanctuary_providers
- `events_host_insert_v4` includes sanctuary/nonprofit gating (volunteer-only exception)

### TODO
- Production-ready “sanctuary volunteer view” (`sanctuary_volunteer_events_v1`) verify full correctness
- Ensure sanctuary filters propagate into:
  - Kids Explore
  - Volunteer maps
- Confirm sanctuary providers cannot ever be granted market flags via admin mistake:
  - enforce deny-first logic at DB level (trigger or RPC guard)

---

# 6) LICENSING, INSURANCE & COMPLIANCE VAULT

✅ Already Present
- Badges exist:
  - `LICENSED`
  - `INSURED`
  - `safety` (“Safety Checked”)
  - `ETHICALLY_SOURCED`
- Enforcement candidates exist in RLS/functions searches

### TODO (Critical)
- Create Compliance Vault storage + policies:
  - Private bucket for compliance docs (licenses, insurance, permits)
  - Owner-only read
  - Admin-only read (verification)
  - No public exposure, no cross-provider reads
- Create “verification freshness” model:
  - license expiry / insurance expiry
  - badge validity windows
  - remove/disable eligibility automatically when expired
- Build compliance verification UI (Phase 1.5):
  - upload doc → admin verify → badge applied

---

# 7) MARKETPLACE ARCHITECTURE (FIVE-TIER) + GATING

✅ Locked Structure (conceptual)
1. Community Discovery (non-commercial)
2. Bulk Goods Market (Premium / Premium Plus; sanctuary denied)
3. Institutional RFQs & Bids (Institutions + Premium Plus; vendor bids gated)
4. Experience Quote Market (future)
5. Event-Based Institutional Bidding (future)

✅ Current Reality Check
- `bulk_offers.provider_id` ties directly to providers
- `bids.vendor_id` is user_id (auth.uid) + rfq linkage
- `rfqs.institution_id` is user_id (auth.uid) and insert checks confirm ownership of institution provider

### TODO (Hardening)
- Lock the canonical mapping decision:
  - User-based market actors (auth.uid) remain authority, with “must own provider” checks
  - Any provider-level market actor changes require explicit schema work (future, not now)
- Add compliance gates by vertical_code where required:
  - require LICENSED + INSURED for specific market actions (per vertical rules)
- Enforce “prepared vs launched”:
  - markets can exist but remain disabled by flags until production green light

---

# 8) COMMUNITY MAP & DISCOVERY ENFORCEMENT

✅ Already Locked (conceptual)
- Marker limits and fairness constraints
- Vendor view favors institutions; institution view favors vendors
- Farm priority rules exist conceptually

### TODO
- Wire seasonal + curated boost ordering into default map view (DB-first)
- Canonical farm detection definition:
  - specialty vs badge precedence (lock in docs)
- Landmark vertical visibility enforcement by vertical_code + overlays
- Confirm “community spots” are OFF at launch unless explicitly enabled

---

# 9) LANDMARK VERTICAL CANONICALIZATION

✅ Already Locked (conceptual)
- Landmark classes and kids restrictions:
  - sanctuaries = community + education only
  - adult adventure = never kids; waiver required
  - nightlife excluded from kids forever

### TODO
- Finalize `landmarks.landmark_type` → vertical enforcement mapping
- Add explicit hard gates for “Adult Experience” landmark types
- Ensure landmark discovery respects:
  - account mode (kids/teen/adult)
  - moderation status
  - specialty overlays

---

# 10) MODERATION PIPELINE (CANONICAL V2)

✅ Already Locked
- `moderation_queue`
- RPC moderation workflow
- No auto-approval

### TODO
- Add moderation lane for community uploads (future)
- Add kids-safe media moderation lane (critical)
- Ensure moderation SLA timers are enforced (DB + notifications)

---

# 11) ANALYTICS & INTERNAL TABLE RLS (NO BYPASS)

✅ Identified
- Some tables have RLS ON but not FORCED:
  - `experiences`, `experience_requests`, `providers`, `provider_badges` currently show `relforcerowsecurity = false`

### TODO (Critical)
- Decide and execute “FORCE RLS” posture:
  - For any table that must never be bypassed by table owner/role misconfig → set FORCE RLS true
- Add insert-only patterns where required:
  - system write pipelines
  - admin full read
- Re-run security snapshot after changes

---

# 12) INSTITUTION PARITY ENFORCEMENT

✅ Already Locked (intent)
- Institutions mirror vendor market access where lawful

### TODO
- Verify parity across:
  - `rfqs`
  - `bids`
  - (future) experience quotes
  - (future) event bids
- Ensure “institution must own provider” checks exist for every institution action path

---

# 13) VERTICAL COVERAGE (NO SKIPS — CANONICAL SET)

This hardening checklist applies across all active + prepared verticals:

Active / Present repos:
- rooted-community
- rooted-agriculture
- rooted-environments
- rooted-environment
- rooted-community-services
- rooted-education
- rooted-science-maker
- rooted-arts-culture
- rooted-experiences
- rooted-land-resources
- rooted-construction
- rooted-manufacturing
- rooted-logistics
- rooted-housing
- rooted-workforce
- rooted-government
- rooted-utilities
- rooted-public-safety
- rooted-healthcare
- rooted-mental-health
- rooted-meta-infrastructure
- rooted-regional-intel
- rooted-local-business
- rooted-celebrations
- rooted-emergency-and-disaster (merged)

Prepared / planned repos (tracked here, not launched):
- rooted-wellness (merge target: seniors + family-services)
- rooted-fitness
- rooted-sports

All vertical capabilities must match:
- `/docs/ROOTED_VERTICAL_CAPABILITY_MATRIX.md`

---

# 14) ADMIN TOOLKIT (PHASE 1.5 — TRACKED)

Not required for initial launch, but formally tracked:

- Moderation queue UI
- Feature flag admin panel
- Badge assignment panel
- Sanctuary verification panel
- Kids-safe approval panel
- Institutional verification panel
- Compliance verification panel (licenses/insurance expiries)

---

# ✅ STATUS SUMMARY (CANONICAL)

Hard Locked / Verified:
- Governance chain supremacy
- Kids Mode = no monitoring, no monetization, no markets
- Sanctuary/nonprofit protections exist and deny markets
- Market separation exists (bulk / rfq / bid)
- Badges include LICENSED + INSURED
- RLS is ON for key market tables and FORCED for bids/rfqs/bulk/events/event_registrations

Remaining work is finite and sequential:
1) Force-RLS posture decisions + apply
2) Compliance Vault (private docs + expiry + verification)
3) Vertical-by-vertical compliance gating (LICENSED/INSURED) where markets exist
4) Prepared vs launched capability flags
5) Final stress test matrix rerun before UI wiring
