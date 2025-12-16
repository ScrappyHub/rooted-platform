# ROOTED — REGISTRATION & TICKETING SEMANTICS (CANONICAL)

File: /docs/ROOTED_REGISTRATION_AND_TICKETING_SEMANTICS.md  
Authority Level: Implementation Contract (NON-LAW)  
Status: ✅ LOCKED | ✅ PRE-UI REQUIRED

---

## PURPOSE

Define how ROOTED handles:
- registrations for events/programs/teams
- future ticket-like flows without collecting buyer identity
- civic hidden info principles

---

## HARD RULES

1) Kids are never stored as independent identity entities in ROOTED.
2) Kids Mode is a safety state of an adult account and UI surface behavior.
3) Registrations may capture only what is operationally required.
4) “Ticketing” (if added later) must not require purchaser email or identity storage in ROOTED.

---

## REGISTRATION TYPES

### A) Civic Registration (default)
- Used for events, volunteers, programs, teams (future)
- Stores minimal metadata
- Host receives only necessary operational fields

### B) Ticket-like Purchase (future)
- Shows as “tickets purchased” or equivalent state
- Validation via scan-state/verification tokens only
- ROOTED does not store purchaser personal details beyond what is required for fraud prevention and minimal accounting records (if any)

---

## HOST VISIBILITY RULE

Hosts never receive:
- hidden user profile data
- unnecessary contact details
- sensitive identity attributes

Only the “operational minimum” needed for running the event/program is exposed.
