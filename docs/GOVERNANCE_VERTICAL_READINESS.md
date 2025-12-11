# ROOTED Vertical Readiness & Intelligence Index

This document is the **single map** of where all vertical and platform
intelligence is governed and implemented.

It does **not** redefine laws.  
It simply points to the canonical files that already hold those laws.

---

## 1. Core Platform Governance (Laws)

- Kids Mode  
  - `governance/ROOTED_KIDS_MODE_GOVERNANCE.md`

- Seasonal & Cultural Intelligence  
  - `governance/ROOTED_SEASONAL_CULTURAL_INTELLIGENCE_LAW.md`

- Vendor Marketplace & Procurement  
  - `governance/ROOTED_VENDOR_MARKETPLACE_GOVERNANCE.md`

- Parent & Family Services  
  - `governance/ROOTED_PARENT_FAMILY_GOVERNANCE.md`

- Geo / Map Intelligence  
  - `governance/ROOTED_GEO_AND_MAP_INTELLIGENCE_GOVERNANCE.md`

(Plus all existing laws: account, access, admin, overrides, youth participation,
sanctuary/nonprofit, etc.)

---

## 2. Core Engine Implementations (rooted-core)

These documents explain how the platform laws are enforced in code.

- Seasonal & Cultural Intelligence Engine  
  - `rooted-core/docs/SEASONAL_CULTURAL_INTELLIGENCE_ENGINE.md`

- Seasonal & Cultural Intelligence UI Contract  
  - `rooted-core/docs/SEASONAL_CULTURAL_INTELLIGENCE_UI_CONTRACT.md`

- Vendor Marketplace / Procurement Engine  
  - `rooted-core/docs/PROCUREMENT_AND_VENDOR_MARKETPLACE_ENGINE.md`  
  - `rooted-core/docs/PROCUREMENT_UI_CONTRACT.md`

- Parent & Family Services Engine  
  - `rooted-core/docs/PARENT_AND_FAMILY_SERVICES_ENGINE.md`  
  - `rooted-core/docs/PARENT_FAMILY_UI_CONTRACT.md`

- Kids Mode Engine  
  - `rooted-core/docs/KIDS_MODE_ENGINE.md`  
  - `rooted-core/docs/KIDS_MODE_DISCOVERY_AND_UI_CONTRACT.md`

- Geo / Map Intelligence Engine  
  - `rooted-core/docs/GEO_INTELLIGENCE_AND_MAP_ENGINE.md`  
  - `rooted-core/docs/MAP_UI_CONTRACT_GLOBAL.md`

---

## 3. Vertical Repos

Every **vertical** has its own repository in the `rooted-*` family.

Each vertical repo:

- Owns its **UI, UX, and content** for that domain  
- **Does not** re-implement core laws  
- **Relies on** the engines and governance mapped above

Each vertical README must link back to:

- `rooted-platform/docs/GOVERNANCE_VERTICAL_READINESS.md`
- Relevant governance laws under `rooted-platform/governance/`
- Relevant engine docs under `rooted-core/docs/`
