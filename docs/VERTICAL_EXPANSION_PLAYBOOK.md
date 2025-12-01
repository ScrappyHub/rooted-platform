# ROOTED — VERTICAL EXPANSION PLAYBOOK (v1)

Owner / Architect: Alec  
Scope: How to add or activate new verticals without breaking the core.

---

## 1. Core Principle

ROOTED is:

> “A vertically-expandable civic + economic + educational operating system.”

Verticals DO NOT:

- Add new schemas for roles, messages, RFQs, or events.
- Bypass governance, Kids Mode, or compliance.

Verticals ONLY:

- Reuse existing primitives:
  - `providers`
  - `rfqs` / `bids` / `bulk_offers`
  - `events` / `experiences`
  - `messages`
  - `landmarks`
  - `user_tiers` + `feature_flags`
- Add:
  - New specialties (if truly needed)
  - New experiences (if truly needed)
  - New overlays (in rare cases)
  - New UI skins / filters

---

## 2. Vertical Definition Checklist

A “vertical” in ROOTED is defined by:

1. **Vertical Group(s)**  
   One or more `specialty_types.vertical_group` values.
   - Example: Construction → `CONSTRUCTION`, `TRADES_APPRENTICESHIP`

2. **Supported Roles**
   - Vendors
   - Institutions
   - Community members
   - Admins

3. **Required Compliance**
   - One or more `compliance_overlays` codes

4. **Kids Mode Behavior**
   - One or more `kids_mode_overlays` attached to relevant specialties & experiences

5. **Map & Landmarks**
   - One or more `landmark_types` used to anchor discovery

6. **Access Gates**
   - `user_tiers.feature_flags` keys that control access

---

## 3. High-Level Vertical Phases

### Phase 1 — Trust & Community Foundation

Verticals:

- Agriculture & Local Food (AGRICULTURE_FOOD)
- Education & Workforce (EDUCATION_WORKFORCE)
- Arts, Culture & Heritage (ARTS_CULTURE)
- Environment & Sustainability (ENVIRONMENT_SUSTAINABILITY)

Goals:

- Build trust with families, schools, local institutions
- Build safety reputation
- Train seasonal and landmark engines

---

### Phase 2 — Civic Infrastructure & Economy

Verticals:

- Construction & Built Environment (CONSTRUCTION)
- Manufacturing & Supply Chain (MANUFACTURING_SUPPLY)
- Logistics, Transport & Transit (LOGISTICS_TRANSIT)
- Housing & Community Development (HOUSING_DEVELOPMENT)
- Community Services & Nonprofits (COMMUNITY_SERVICES)

Goals:

- Bring in institutional contracts (RFQs, bids, bulk offers)
- Enable workforce visibility and apprenticeships
- Connect infrastructure providers to civic stakeholders

---

### Phase 3 — Health, Safety & Resilience

Verticals:

- Healthcare & Community Health (HEALTH_COMMUNITY, non-clinical)
- Mental Health & Wellness (MENTAL_HEALTH_WELLNESS, non-clinical)
- Emergency & Disaster Response (EMERGENCY_RESPONSE)
- Public Safety & Community Watch (PUBLIC_SAFETY)

Goals:

- Power civic safety and preparedness
- Keep ROOTED away from direct medical record handling
- Support community education and access to resources

---

### Phase 4 — Regional Operating System

Verticals:

- Government & Civic Services (GOVERNMENT_CIVIC)
- Utilities & Energy (UTILITIES_ENERGY)
- Land & Natural Resource Management (LAND_MANAGEMENT)
- Science, Maker & Innovation (SCIENCE_MAKER)
- Research, Data & Regional Planning (RESEARCH_PLANNING)

Goals:

- Become the regional operating layer
- Support planners, utilities, institutions, and researchers
- Offer trend and seasonal forecasting over real behavior

---

## 4. Step-by-Step: Activating a New Vertical

Example: Activating **Construction**.

### Step 1 — Confirm Taxonomy

- Ensure needed specialties exist:
  - `GENERAL_CONTRACTOR`, `ELECTRICIAN`, `PLUMBER`, `ROOFING`, etc.  
  These already exist in `specialty_types` under `CONSTRUCTION`.

- Add rare additional specialties if needed (optional, not required).

### Step 2 — Define Access Flags

- Use `user_tiers.feature_flags`:
  - `"construction_access": true | false`
- Update:
  - Admin UI toggles
  - Onboarding flows
  - Pricing tiers (if vertical is monetized)

### Step 3 — Attach Compliance Overlays

Via join tables (conceptual):

- Construction specialties → `INSURANCE_REQUIRED`, `LICENSE_REQUIRED`, `YOUTH_SAFETY` (for tours/education)

### Step 4 — Define Experiences

Reuse existing experiences:

- `TRADE_DEMO`
- `JOB_SHADOW`
- `FIELD_TRIP`
- `VOLUNTEER_SHIFT`

Add new ones only if you truly need them.

### Step 5 — Kids Mode Overlays

Attach:

- `CONSTRUCTION_EDUCATION`
- `SAFETY_EDUCATION`
- `STEM_EDUCATION`

to construction specialties & related experiences so kids see education content only.

### Step 6 — Landmarks

Use existing:

- `HISTORIC_BRIDGE`
- `MILL`
- `PUBLIC_MONUMENT`

Add more only if necessary.

### Step 7 — UI Surfacing

Add:

- Filters by `vertical_group`
- Dedicated “Construction” tab/page
- RFQ templates specific to construction

All using existing primitives (providers, RFQs, events, messages).

---

## 5. Rules for Adding New Taxonomy

You MAY add:

- New `specialty_types`
- New `experience_types`
- New `landmark_types`
- New `kids_mode_overlays`
- New `compliance_overlays`

But only when:

- A clear new real-world category exists
- It cannot be represented by any current code
- Governance & Kids Mode behavior is documented

You MUST NOT:

- Repurpose existing codes to mean something different
- Delete canonical seeds
- Add vertical-specific one-off tables for roles, RFQs, messages, or events

---

## 6. Vertical Success Criteria

A vertical is considered successfully integrated when:

- Providers and institutions can onboard using existing primitives
- RFQs and bulk offers work without schema changes
- Kids Mode and safety rules apply automatically
- Compliance overlays are defined and enforced
- Landmarks and maps reflect the vertical
- Feature flags gate access cleanly and predictably

---

This playbook ensures ROOTED can scale from one vertical to twenty (and beyond) without fracturing its core.
