# ROOTED — Kids Mode Governance & Safety

Founder / Architect: Alec  
Authority Level: Absolute Platform Law  
Enforcement: Constitution → Database (RLS + Flags + Views) → UI  
Effective Date: First Public Launch

---

## 1. Purpose

Kids Mode is a platform-wide safety and education layer, not a theme or parental afterthought.

Kids Mode is designed to:
- Prevent exposure to harmful content
- Prevent access to adult systems
- Translate civic systems into educational representations

Kids Mode is never:
- A cosmetic toggle
- A marketing feature
- A soft recommendation

---

## 2. Enforcement Mechanics

Kids Mode is enforced through:

1. `public.user_tiers.feature_flags.kids_mode_enabled`
2. `kids_mode_overlays` taxonomy
3. Compliance overlays:
   - `YOUTH_SAFETY`
   - `NO_MEDICAL_DATA`
   - `HI_PII_RESTRICTED`

No UI may bypass these.

---

## 3. Canonical Kids Mode Overlays

- ANIMAL_EDUCATION  
- FOOD_SYSTEMS  
- CONSTRUCTION_EDUCATION  
- BODY_EDUCATION  
- SAFETY_EDUCATION  
- ENVIRONMENTAL_SCIENCE  
- ART_EDUCATION  
- STEM_EDUCATION  
- EMOTIONAL_EDUCATION  

---

## 4. Prohibited Content Under Kids Mode

- Medical records
- Account security logs
- Procurement data
- Contracts
- Messaging of sensitive topics
- Adult-only events
- Explicit crisis services
- Fundraising & commerce

---

## 5. Experience Classification Rules

All experiences must declare:

- `kids_allowed`
- `requires_waiver`
- `insurance_required`

Any experience without classification is NOT kids-safe by default.

---

## 6. Admin & Developer Obligations

Admins must:
- Audit all new verticals for Kids Mode compatibility

Developers must:
- Never implement UI-only Kids Mode
- Respect flags, overlays, and compliance rules

---

Kids Mode is not optional.  
It is a legal safety contract with families, schools, and communities.
