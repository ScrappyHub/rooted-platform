# ROOTED — CANONICAL TAXONOMY & SEEDING REPORT (v1)
Status: ✅ LOCKED | ✅ PRODUCTION-READY | ✅ FUTURE-PROOF  
Owner / Architect: Alec  
Scope: ROOTED Core + All Present & Future Verticals  

---

## 1. Purpose of This Document

This document formally certifies that ROOTED’s **core taxonomic foundation** is:

- Fully designed
- Fully seeded
- Governed
- Future-proofed for 20+ verticals
- Not subject to re-architecture for expansion

✅ All verticals plug into this foundation.  
✅ No new core tables are required for expansion.  
✅ Only optional specialty *extensions* may ever be added.

---

## 2. Canonical Core Tables Now Locked

The following tables are now considered **structural infrastructure**:

| Table | Purpose | Status |
|------|----------|--------|
| `badges` | Trust & verification layer | ✅ Locked |
| `specialty_types` | Global provider & institution taxonomy | ✅ Locked |
| `experience_types` | Cross-vertical experience system | ✅ Locked |
| `compliance_overlays` | Legal & safety governance | ✅ Locked |
| `landmark_types` | Map intelligence & discovery | ✅ Locked |
| `kids_mode_overlays` | Child-safe educational translation | ✅ Locked |

These tables are:

- Admin-insert only  
- No hard deletes  
- Version-controlled via migrations  
- Never UI-mutated directly  

---

## 3. Trust & Discovery Layer — `badges` (LOCKED)

Seeded Canonical Values:

- INSURED  
- LICENSED  
- ETHICALLY_SOURCED  
- ORGANIC  
- GREEN  
- YOUTH_SAFE  
- EMERGENCY_CERTIFIED  
- GOVERNMENT_PARTNER  
- COMMUNITY_VERIFIED  

Purpose:

- Discovery ranking
- Youth safety signaling
- Emergency & government credibility
- Sustainability & ethics transparency
- Procurement trust validation

---

## 4. Global Specialty Taxonomy — `specialty_types` (LOCKED)

This table is the **permanent backbone** for:

- Providers
- Institutions
- RFQs / Bids / Bulk Offers
- Events & Experiences
- Landmarks & Map Layers

### Supported Vertical Groups (20)

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

✅ Every vertical in the 20-vertical ROOTED roadmap maps directly to at least one of these groups.

---

## 5. Cross-Vertical Experiences — `experience_types` (LOCKED)

Canonical Experience Types:

- FARM_TOUR  
- HARVEST_DAY  
- TRADE_DEMO  
- JOB_SHADOW  
- FIELD_TRIP  
- DISASTER_DRILL  
- CLEANUP_DAY  
- TREE_PLANTING  
- ART_WORKSHOP  
- SCIENCE_WORKSHOP  
- EMERGENCY_TRAINING  
- HISTORIC_TOUR  
- VOLUNTEER_SHIFT  

Each experience is governed by:

- `requires_waiver`
- `kids_allowed`
- `insurance_required`
- `seasonal_lockable`

This enables **safe reuse of experiences across every vertical** with correct legal gating.

---

## 6. Legal & Safety Governance — `compliance_overlays` (LOCKED)

Canonical Compliance Engine:

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

These overlays attach to:

- Specialties
- Providers
- RFQs
- Experiences
- Landmarks

This gives ROOTED **court-defensible operational compliance** without family exposure or medical data storage.

---

## 7. Map Intelligence & Landmarks — `landmark_types` (LOCKED)

Canonical Landmarks:

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

Used for:

- Cultural discovery
- Seasonal overlays
- Educational tours
- Emergency shelter routing
- Regional identity modeling

---

## 8. Kids Mode Educational Translation — `kids_mode_overlays` (LOCKED)

Canonical Overlays:

- ANIMAL_EDUCATION  
- FOOD_SYSTEMS  
- CONSTRUCTION_EDUCATION  
- BODY_EDUCATION  
- SAFETY_EDUCATION  
- ENVIRONMENTAL_SCIENCE  
- ART_EDUCATION  
- STEM_EDUCATION  
- EMOTIONAL_EDUCATION  

Used to **translate civic infrastructure into age-appropriate education**, not just block access.

---

## 9. Feature Flag Vertical Governance (DESIGN LOCKED)

Canonical Default Feature Flags:

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
