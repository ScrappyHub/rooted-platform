# File: docs/ROOTED_GOVERNANCE_MAP.md

# ROOTED – Governance Map & Authority Chain

Status: ✅ Canonical  
Audience: Founder, engineers, advisors, AI assistants  
Scope: Entire ROOTED stack (all repos, all verticals)

This file explains **who is in charge of what** inside ROOTED:

- Which documents are **law**
- Which repos are **governance vs implementation**
- How authority flows from GitHub → DB → Admin → UI

If there is ever confusion about “who wins” → this file resolves it.

---

## 1. Top-Level Authority: Platform Law

Absolute highest authority:

- `docs/ROOTED_PLATFORM_CONSTITUTION.md`

Everything else must obey this document.

It governs:

- Ethics
- Power boundaries
- Child safety supremacy
- Sanctuary & nonprofit protection
- Tier grid (access & monetization)
- Admin / developer obligations
- Git-locked law (no silent production changes)

If anything conflicts with the Constitution → the Constitution wins.

---

## 2. Governance vs Implementation Repos

ROOTED has **three core repo roles**:

1. **Governance Brain**
   - Repo: `rooted-platform`
   - Type: Platform law, governance, roadmap
   - Contains:
     - Platform Constitution
     - Governance & Ethics
     - Access & Power Law
     - Community Trust & Safety Law
     - Sanctuary & Nonprofit Protection Law
     - Vertical charters & roadmaps

2. **Backend Enforcement**
   - Repo: `rooted-core`
   - Type: Supabase backend implementation
   - Contains:
     - Schema & migrations
     - RLS policies
     - Views & RPCs
     - Billing architecture
     - Moderation & notifications systems
     - Discovery & GEO enforcement
     - Debug & QA tooling

3. **Vertical UIs**
   - Example: `rooted-community`
   - Future: `rooted-construction`, `rooted-arts-culture`, etc.
   - Type: Front-end implementations only
   - Contains:
     - React/TS UI
     - Routing & layout
     - UX gating (buttons, menus, flows)
     - Role/tier-based rendering (never final authority)

**Key Rule:**

> Governance → Core → UIs  
> UIs never outrank governance or core enforcement.

---

## 3. Official Governance Documents (Index)

These files are considered **platform law** and must be treated as such:

- `docs/ROOTED_PLATFORM_CONSTITUTION.md`
- `docs/ROOTED_GOVERNANCE_ETHICS.md`
- `docs/ROOTED_DATA_SOVEREIGNTY_LAW.md`
- `docs/ROOTED_ACCESS_POWER_LAW.md`
- `docs/ROOTED_COMMUNITY_TRUST_LAW.md`
- `docs/ROOTED_MODERATION_SYSTEM.md` (aka `MODERATION_SYSTEM.md`)
- `docs/ROOTED_NOTIFICATIONS_SYSTEM.md` (aka `NOTIFICATIONS_SYSTEM.md`)
- `docs/ROOTED_GIT_HANDOFF.md`
- `docs/ROOTED_DEBUG_TOOLKIT_CORE.md`
- `docs/ROOTED_COMMUNITY_UI_QA.md`
- `docs/ROOTED_UI_QA_CHECKLIST.md`
- `docs/ROOTED_GEO_RULES.md`
- `docs/ROOTED_DISCOVERY_RULES.md`
- `docs/STRIPE_INTEGRATION_CHECKLIST.md`
- `docs/ROOTED_BILLING_ARCHITECTURE.md`
- `docs/ROOTED_BILLING_ABUSE_TEST_MATRIX.md`

If a new file changes these rules, it must be explicitly written and reviewed as **law**, not as a casual note.

---

## 4. Authority Chain by Layer

### 4.1 Governance Layer (GitHub)

- Lives in: `rooted-platform` + `rooted-core/docs`
- Defines:
  - Roles & tiers
  - Feature grid (who gets what)
  - Kids Mode rules
  - Sanctuary & nonprofit rules
  - GEO & discovery constraints
  - Moderation & notifications architecture
  - Stripe & billing law
- Enforcement mechanism:
  - Git history
  - Pull requests
  - Governance sign-off
  - No silent changes

> If it’s not written here, it has **no authority**.

---

### 4.2 Backend & Database Layer (Supabase / `rooted-core`)

- Lives in:
  - `supabase` migrations
  - `public` tables, views, functions
  - RLS policies
- Implements:
  - `user_tiers`, `feature_flags`, `account_status`
  - Tier grid for Vendor/Institution/Admin
  - Kids Mode restrictions (where applicable)
  - Sanctuary & nonprofit bans on commercial tools
  - GEO radius 50 miles + 6–8 card discovery rule
  - Moderation queue & approval gates
  - Notifications pipeline
  - Billing state (minimal Stripe mirror fields)

> The DB is the **first line of hard enforcement** after governance.

---

### 4.3 Admin Layer (UI + RPCs)

- Lives in:
  - Admin dashboards
  - Admin RPCs (e.g. `admin_set_role_tier`, `admin_moderate_submission`)
- Can:
  - Change roles & tiers
  - Approve/reject submissions
  - Grant or revoke features (within allowed law)
- Cannot:
  - Bypass Constitution
  - Bypass sanctuary rules
  - Bypass Kids Mode protections
  - Make unlogged changes

All admin actions **must**:

- Call `public.is_admin()`
- Write to `public.user_admin_actions`
- Respect RLS and feature flags

---

### 4.4 UI Layer (Community / Vertical UIs)

- Lives in:
  - `rooted-community` and other UI repos
- Responsibilities:
  - Show or hide features based on role/tier/flags
  - Never expose locked tools to Kids Mode or guests
  - Follow discovery & GEO contracts exactly
  - Surface support and safety affordances

UI **never**:

- Grants real access on its own
- Overrides RLS or DB rules
- Expands discovery beyond 50 miles
- Ignores Kids Mode or sanctuary flags

If UI and backend disagree, backend wins.  
If backend and governance disagree, governance wins.

---

## 5. Alignment of Key Systems

### 5.1 Roles, Tiers, Feature Flags

Source of truth:

- Table: `public.user_tiers`
- Defined in:
  - `ROOTED_PLATFORM_CONSTITUTION.md` (tier law)
  - `ROOTED_GIT_HANDOFF.md`
  - `ROOTED_DEBUG_TOOLKIT_CORE.md`

Backend uses:

- `public.has_feature(...)`
- `public.current_user_has_feature(...)`
- `public.is_admin()`

UI must **mirror**, not invent, this logic.

---

### 5.2 Kids Mode

Defined in:

- Constitution (supreme child safety clause)
- Governance / Kids law files
- Community / UI QA docs

Backend & UI must enforce:

- No billing
- No RFQs or bids
- No messaging
- No donation/fundraiser flows
- No adult discovery surfaces
- Kids Mode is PILOT OFF at Community launch but rules are fully defined.

---

### 5.3 Sanctuary & Nonprofit Protection

Defined in:

- Constitution
- Sanctuary law docs
- Billing & access law

Enforced by:

- `provider_type`
- `feature_flags`
- RLS on marketplaces & billing tables

No UI, admin, or Stripe interaction may grant:

- Bids
- Bulk marketplace access
- Paid ads

---

### 5.4 Discovery & GEO

Defined in:

- `ROOTED_GEO_RULES.md`
- `ROOTED_DISCOVERY_RULES.md`
- `UI_BACKEND_DISCOVERY_CONTRACT.md`
- `DISCOVERY_BACKEND_PSEUDOCODE.md`
- `ROOTED_DISCOVERY_IMPLEMENTATION_MAP.md`

Enforced by:

- DB queries (`providers_discovery_v1`, `seasonal_featured_providers_v1`, etc.)
- Discovery endpoints (`/api/discovery`)

UI cannot:

- Show > 8 cards per curated row
- Expand radius beyond 50 miles
- Override rotation or fairness rules

---

## 6. Where New Work Must Start

Any new feature or vertical must:

1. Start as governance / law in `rooted-platform`
2. Then be implemented in `rooted-core` (schema + RLS + RPCs)
3. Then be wired into UI in `rooted-community` or another vertical repo

If a change skips Step 1 (governance), it is **not valid**.

---

## 7. Final Authority Summary

If there is a conflict:

1. `ROOTED_PLATFORM_CONSTITUTION.md` wins over everything
2. Governance docs in `rooted-platform/docs/` win over `rooted-core`
3. Database enforcement (RLS, views, RPCs) wins over UI
4. Admin UI wins over normal user UI

No UI mockup, script, AI output, or ad-hoc change can override this chain.

This file is the **map**.  
The Constitution is the **law**.
