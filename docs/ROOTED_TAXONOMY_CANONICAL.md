# 🌐 ROOTED — CANONICAL TAXONOMY & SEEDING REPORT (v1)

Status: ✅ LOCKED | ✅ PRODUCTION-READY | ✅ FUTURE-PROOF  

Owner / Architect: **Alec**

Scope: ROOTED Core + All Present & Future Verticals

Cross-References:

- /docs/ROOTED_SEEDING_CANONICAL.sql  
- /governance/ROOTED_PLATFORM_CONSTITUTION.md  
- /governance/ROOTED_KIDS_MODE_GOVERNANCE.md  
- /governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md  
- /governance/ENFORCEMENT_MATRIX.md  

---

## 1️⃣ Purpose of This Document

This document formally certifies that ROOTED’s core taxonomic foundation is:

- Fully designed  
- Fully seeded  
- Governed by law  
- Future-proofed for 20+ verticals  
- Not subject to re-architecture for expansion  

✅ All verticals plug into this foundation.  
✅ No new **core** tables are required for expansion.  
✅ Only optional specialty extensions may ever be added.

---

## 2️⃣ Canonical Core Tables (LOCKED)

The following tables are now structural infrastructure:

| Table              | Purpose                               | Status   |
|--------------------|----------------------------------------|----------|
| `badges`           | Trust & verification layer             | ✅ Locked |
| `specialty_types`  | Global provider & institution taxonomy | ✅ Locked |
| `experience_types` | Cross-vertical experience system       | ✅ Locked |
| `compliance_overlays` | Legal & safety governance          | ✅ Locked |
| `landmark_types`   | Map intelligence & discovery           | ✅ Locked |
| `kids_mode_overlays` | Child-safe educational translation | ✅ Locked |

Rules:

- Admin-insert only (via tools/migrations)  
- No hard deletes (deprecation only)  
- Version-controlled via migrations  
- Never UI-mutated directly  

---

## 3️⃣ Trust & Discovery Layer — `badges` (LOCKED)

Seeded canonical values:

- `INSURED`  
- `LICENSED`  
- `ETHICALLY_SOURCED`  
- `ORGANIC`  
- `GREEN`  
- `YOUTH_SAFE`  
- `EMERGENCY_CERTIFIED`  
- `GOVERNMENT_PARTNER`  
- `COMMUNITY_VERIFIED`  

Purposes:

- Discovery ranking & boost  
- Youth safety signaling  
- Emergency & government credibility  
- Sustainability & ethics transparency  
- Procurement trust validation  

Badges feed directly into discovery views and market eligibility rules.

---

## 4️⃣ Global Specialty Taxonomy — `specialty_types` (LOCKED)

Backbone for:

- Providers & institutions  
- RFQs / Bids / Bulk Offers  
- Events & Experiences  
- Landmarks & map layers  

Supported **vertical groups** (20):

1. AGRICULTURE_FOOD  
2. CONSTRUCTION  
3. HEALTH_COMMUNITY (non-clinical)  
4. EMERGENCY_RESPONSE  
5. GOVERNMENT_CIVIC  
6. EDUCATION_WORKFORCE  
7. ENVIRONMENT_SUSTAINABILITY  
8. COMMUNITY_SERVICES  
9. MANUFACTURING_SUPPLY  
10. UTILITIES_ENERGY  
11. LOGISTICS_TRANSIT  
12. HOUSING_DEVELOPMENT  
13. MENTAL_HEALTH_WELLNESS (non-clinical)  
14. ARTS_CULTURE  
15. RECREATION_TOURISM  
16. SCIENCE_MAKER  
17. TRADES_APPRENTICESHIP  
18. LAND_MANAGEMENT  
19. PUBLIC_SAFETY  
20. RESEARCH_PLANNING  

✅ Every vertical in the 20-vertical ROOTED roadmap maps to at least one of these groups.

---

## 5️⃣ Cross-Vertical Experiences — `experience_types` (LOCKED)

Canonical experience types:

- FARM_TOUR  
- HARVEST_DAY  
- TRADE_DEMO  
- JOB_SHADOW  
- FIELD_TRIP  
- DISASTER_DRILL  
- EMERGENCY_TRAINING  
- CLEANUP_DAY  
- TREE_PLANTING  
- ART_WORKSHOP  
- SCIENCE_WORKSHOP  
- HISTORIC_TOUR  
- VOLUNTEER_SHIFT  

Each experience is governed by:

- `requires_waiver`  
- `kids_allowed`  
- `insurance_required`  
- `seasonal_lockable`  

This enables safe reuse across verticals with consistent legal gating.

---

## 6️⃣ Legal & Safety Governance — `compliance_overlays` (LOCKED)

Canonical compliance engine overlays:

- FOOD_SAFETY  
- INSURANCE_REQUIRED  
- LICENSE_REQUIRED  
- HI_PII_RESTRICTED  
- NO_MEDICAL_DATA  
- YOUTH_SAFETY  
- CRITICAL_INFRASTRUCTURE  
- GOVERNMENT_MONITORED  
- ENVIRONMENTAL_REPORTING  
- EMERGENCY_PRIORITY_ACCESS  

Attach to:

- Specialties  
- Providers  
- RFQs / bids  
- Experiences  
- Landmarks  

This gives ROOTED **court-defensible** operational compliance without needing to store medical charts or sensitive family records.

---

## 7️⃣ Map Intelligence & Landmarks — `landmark_types` (LOCKED)

Canonical landmark types:

- HISTORIC_FARM  
- HISTORIC_BRIDGE  
- HISTORIC_SCHOOL  
- HOSPITAL_LANDMARK  
- FIRE_STATION  
- SHELTER  
- LIBRARY  
- MILL  
- POWER_PLANT  
- RAIL_YARD  
- NATURE_PRESERVE  
- PUBLIC_MONUMENT  

Uses:

- Cultural + historical discovery  
- Seasonal & educational overlays  
- Emergency shelter / infrastructure awareness  
- Regional identity modeling  

---

## 8️⃣ Kids Mode Educational Translation — `kids_mode_overlays` (LOCKED)

Canonical overlays:

- ANIMAL_EDUCATION  
- FOOD_SYSTEMS  
- CONSTRUCTION_EDUCATION  
- BODY_EDUCATION  
- SAFETY_EDUCATION  
- ENVIRONMENTAL_SCIENCE  
- ART_EDUCATION  
- STEM_EDUCATION  
- EMOTIONAL_EDUCATION  

Purpose:

- Translate civic infrastructure into **age-appropriate** educational views  
- Not just block access — reframe for learning  

---

## 9️⃣ Feature Flag Vertical Governance (DESIGN LOCKED)

Suggested default `feature_flags` baseline:

```json
{
  "agriculture_access": true,
  "education_access": true,
  "arts_access": false,
  "environment_access": false,
  "construction_access": false,
  "health_access": false,
  "emergency_access": false,
  "government_access": false,
  "research_access": false,
  "sanctuary_restricted": false,
  "kids_mode_enabled": true,
  "seasonal_marketing_opt_in": false
}
This is a design lock:

Future verticals toggle via feature flags

Taxonomy tables remain unchanged

🔟 Change Management
Any proposed change to:

badges

specialty_types

experience_types

compliance_overlays

landmark_types

kids_mode_overlays

must:

Reference this document and SEEDING_CANONICAL_V1.sql

Provide a migration plan (no hard deletes)

Be reviewed against governance laws

If a change conflicts with law or breaks vertical mapping:

The taxonomy stays. The feature request is redesigned.

yaml
Copy code
