# ROOTED — DOCS INDEX (CANONICAL)

File: /docs/ROOTED_DOCS_INDEX.md  
Authority Level: Documentation Router (NON-LAW)  
Enforcement Chain: Subordinate to /governance (see ROOTED_GOVERNANCE_INDEX.md)  
Status: ✅ LOCKED | ✅ NON-LAW | ✅ IMPLEMENTATION-BOUND

---

## PURPOSE

This is the single index for **all platform documentation** in `/docs`.

- This file is **NOT law**
- It does **not** override governance
- It exists to prevent “lost docs”, mismatched execution, and UI-first drift

If a doc conflicts with `/governance` law:
**/governance wins automatically.**

---

## GOVERNANCE (LAW) LOCATION

All binding law lives in:

- `/governance/ROOTED_GOVERNANCE_INDEX.md` (router)
- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`
- `/governance/ROOTED_STOP_LAYER.md`
- Canonical law set referenced by the Governance Index

This docs folder contains platform execution, structure, and implementation contracts only.

---

## DOCS IN THIS FOLDER (CANONICAL)

### Platform Identity & Clarity
- `README.md`
- `ROOTED_PLATFORM_CLARIFICATION.md`
- `ROOTED_PUBLIC_TRUST_PLEDGE.md`
- `ROOTED_LONG_TERM_ROADMAP.md`  ✅ Directional only

### System Contracts & Operating Rules
- `ROOTED_GLOBAL_RULES_FOR_ANY_AI_WORKING_IN_ROOTED.MD`
- `ROOTED_FRONTEND_CONTRACT.MD`
- `ROOTED_SECURITY.MD`
- `ROOTED_SECURITY_DISCOVERY_CONTRACT.md`
- `ROOTED_NOTIFICATIONS.md`
- `ROOTED_Moderation_System.md`

### Database & Marketplace Structure
- `DATABASE_VERTICAL_MARKETPLACE_MODEL.md`
- `ROOTED_TAXONOMY_CANONICAL.md`
- `ROOTED_SEEDING_CANONICAL.sql`

### Debug & Launch Readiness
- `ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md`
- `ROOTED_Master_Debug_Toolkit.md`
- `ROOTED_BUG_REPORT_TEMPLATE.md`
- `ROOTED_GLOBAL_DEBUG_GOVERNANCE_CHECKLIST.MD`
- `ROOTED_OPEN_HARDENING_TASKS.md`
- `ROOTED_PRE-LAUNCH-ABUSE_TEST_MATRIX`

---

## REQUIRED PRE-UI DOCS TO ADD (CANONICAL)

These files MUST exist and be locked before UI wiring begins:

1. `ROOTED_VERTICAL_CAPABILITY_MATRIX.md`
2. `ROOTED_PROVIDER_ELIGIBILITY_RULES.md`
3. `ROOTED_REGISTRATION_AND_TICKETING_SEMANTICS.md`
4. `ROOTED_PAYMENTS_AND_PROCUREMENT_MODEL.md`

Optional (recommended later):
- `ROOTED_CIVIC_SPONSORSHIP_SLOTS.md` (docs-only, NOT governance)

---

## HARD RULE

UI work is not allowed to “invent” behavior.

UI must implement:
- governance law
- database enforcement (RLS / views / RPCs)
- these docs contracts

If UI contradicts any of the above, UI is invalid.
