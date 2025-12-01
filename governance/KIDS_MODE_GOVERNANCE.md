# ROOTED — KIDS MODE GOVERNANCE & SAFETY (v1)

Owner / Architect: Alec  
Scope: Kids Mode behavior across all ROOTED verticals.

---

## 1. Purpose

Kids Mode is:

- A **platform-wide safety and education layer**, not a visual theme.
- Designed to keep children away from:
  - Harmful content
  - Adult-only experiences
  - Sensitive data surfaces
- Designed to translate civic systems into:
  - Age-appropriate educational overlays
  - Safe discovery and curiosity

Kids Mode is never:

- A parental control “afterthought”
- A marketing toggle
- A soft suggestion that can be bypassed by a vertical

---

## 2. Core Mechanics

Kids Mode behavior is driven by:

1. `user_tiers.feature_flags.kids_mode_enabled`
2. `kids_mode_overlays` taxonomy
3. Mappings between:
   - specialties ↔ kids overlays
   - experiences ↔ kids overlays
   - landmarks ↔ kids overlays
4. Compliance overlays:
   - `YOUTH_SAFETY`
   - `NO_MEDICAL_DATA`
   - `HI_PII_RESTRICTED`

No UI can override these rules.

---

## 3. Kids Mode Overlays

Canonical codes:

- ANIMAL_EDUCATION  
- FOOD_SYSTEMS  
- CONSTRUCTION_EDUCATION  
- BODY_EDUCATION  
- SAFETY_EDUCATION  
- ENVIRONMENTAL_SCIENCE  
- ART_EDUCATION  
- STEM_EDUCATION  
- EMOTIONAL_EDUCATION  

These represent **topics and teaching frames**, not entities.

Example:

- A farm becomes → ANIMAL_EDUCATION + FOOD_SYSTEMS
- A fire station becomes → SAFETY_EDUCATION
- A STEM lab becomes → STEM_EDUCATION

---

## 4. Governance Rules

### 4.1 No Bypass

- Kids Mode cannot be turned off silently by:
  - Individual verticals
  - Specific pages
  - Individual experiences

The enforcement order is:

1. `kids_mode_enabled` feature flag
2. Kids overlays on content
3. Compliance overlays restricting what can be shown

### 4.2 No Sensitive Data

Under Kids Mode:

- No medical data surfaces (even if non-PII)
- No account security logs
- No procurement or contract detail pages
- No internal messaging threads involving sensitive topics

### 4.3 No Adult-Only Content

Under Kids Mode:

- No adult-only events (fundraisers, bars, nightlife)
- No housing or crisis service content that is not education-first
- No explicit mental health content beyond generalized emotional education

---

## 5. Typical Mappings (Examples)

These mappings are conceptual defaults that should be implemented via join tables.

### 5.1 Agriculture & Food

- Specialties:
  - `FARM`, `ORCHARD`, `GREENHOUSE`, `URBAN_FARM`
- Kids overlays:
  - ANIMAL_EDUCATION
  - FOOD_SYSTEMS
  - ENVIRONMENTAL_SCIENCE

### 5.2 Construction & Trades

- Specialties:
  - `GENERAL_CONTRACTOR`, `ELECTRICIAN`, `PLUMBER`, `ROOFING`
- Kids overlays:
  - CONSTRUCTION_EDUCATION
  - SAFETY_EDUCATION
  - STEM_EDUCATION

### 5.3 Emergency & Safety

- Specialties:
  - `FIRE_DEPARTMENT`, `EMS`, `SHELTER_OPERATOR`
- Kids overlays:
  - SAFETY_EDUCATION

### 5.4 Health & Mental Wellness (Non-Clinical)

- Specialties:
  - `PUBLIC_HEALTH_PROGRAM`, `YOUTH_COUNSELING_PROGRAM`
- Kids overlays:
  - BODY_EDUCATION
  - EMOTIONAL_EDUCATION
  - SAFETY_EDUCATION

### 5.5 Arts, Environment, STEM

- Arts:
  - `MUSEUM`, `GALLERY`, `CULTURAL_CENTER`
  - → ART_EDUCATION

- Environment:
  - `CONSERVATION_GROUP`, `LAND_TRUST`, `NATURE_PRESERVE` landmarks
  - → ENVIRONMENTAL_SCIENCE

- STEM:
  - `STEM_LAB`, `ROBOTICS_CLUB`, `MAKER_SPACE`
  - → STEM_EDUCATION

---

## 6. Experiences & Kids Mode

Experiences must be marked correctly:

- `requires_waiver`
- `kids_allowed`
- `insurance_required`
- `seasonal_lockable`

Examples:

- `FARM_TOUR` → kids_allowed = true, overlays: ANIMAL_EDUCATION, FOOD_SYSTEMS
- `TRADE_DEMO` → kids_allowed = true (as audience), overlays: CONSTRUCTION_EDUCATION
- `JOB_SHADOW` → kids_allowed = true for older minors only, with strict waivers
- `DISASTER_DRILL` → kids_allowed = true only under SAFETY_EDUCATION framing

Any experience not properly classified is **assumed not kids-safe by default**.

---

## 7. UI Behavior Under Kids Mode

When `kids_mode_enabled = true`:

- Map & discovery:
  - Hide or down-rank adult-only entities
  - Emphasize educational overlays and landmarks
- Provider profiles:
  - Emphasize:
    - Photos that are safe & educational
    - Descriptions that are teaching-focused
  - De-emphasize:
    - Pricing
    - Contracting details
    - Legal disclaimers (except safety)
- Events & experiences:
  - Only show events tagged as kids_allowed = true
  - Highlight required waivers clearly for guardians

---

## 8. Governance Responsibilities

Admins must:

- Ensure all new verticals define Kids Mode mappings
- Ensure no vertical tries to disable Kids Mode logic
- Review any new taxonomy additions for:
  - Youth safety risk
  - Medical / PII exposure
  - Emergency / disaster sensitivity

Developers must:

- Never implement front-end-only Kids Mode toggles
- Always respect:
  - Feature flags
  - Kids overlays
  - Compliance overlays

---

Kids Mode is not a feature.  
It is a **governance contract** between ROOTED and families, schools, and communities.
