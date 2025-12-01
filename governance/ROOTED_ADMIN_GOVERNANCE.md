# ROOTED — ADMIN GOVERNANCE & MUTATION POLICY (v1)

Owner / Architect: Alec  
Scope: ROOTED Core + All Verticals  
Status: ✅ ACTIVE POLICY

---

## 1. Admin Role Definition

Admins in ROOTED are:

- Guardians of governance and safety
- Not “super users” in the consumer sense
- Bound to audit, logs, and non-bypassable constraints

Admin identity is enforced through:

- `public.is_admin()` helper (SQL/RPC)
- `user_tiers.role = 'admin'`
- RLS policies on admin-only tables and RPCs

---

## 2. Canonical Admin-Only Surfaces

Admin actions MUST go through:

1. **Account Governance:**
   - `public.admin_user_accounts` (view, read-only)
   - `public.admin_get_user_accounts()` (RPC, read-only)
   - `public.admin_set_account_status()` (RPC)
   - `public.admin_set_role_tier()` (RPC)
   - `public.admin_update_feature_flags()` (RPC)

2. **Taxonomy & Governance:**
   - `badges` (insert-only, no deletes)
   - `specialty_types` (insert-only, no deletes)
   - `experience_types` (insert-only, no deletes)
   - `compliance_overlays` (insert-only, no deletes)
   - `landmark_types` (insert-only, no deletes)
   - `kids_mode_overlays` (insert-only, no deletes)

3. **Audit Log:**
   - `user_admin_actions` (append-only)

No other tables should be mutated directly for governance purposes.

---

## 3. Prohibited Admin Behaviors

Admins MAY NOT:

- Bypass `user_tiers` for any feature access
- Change roles, tiers, or statuses via raw SQL UPDATE
- Delete audit logs (`user_admin_actions`)
- Delete taxonomy rows (badges, specialties, overlays, landmarks, kids overlays)
- Override Kids Mode behavior directly via front-end hacks
- Hard-delete users outside of the official account deletion pipeline

---

## 4. Account Lifecycle Controls

All account-level mutations must go through RPCs:

1. **Status Changes**
   - `admin_set_account_status(target_user, new_status)`
   - Allowed transitions:
     - `active → suspended`
     - `active → locked`
     - `active → pending_deletion`
     - `suspended → active` (if resolved)
   - Each change:
     - Updates `user_tiers.account_status`
     - Writes to `user_admin_actions`
     - Has immediate site-wide effect

2. **Role & Tier Changes**
   - `admin_set_role_tier(target_user, new_role, new_tier)`
   - Examples:
     - `guest → vendor`
     - `vendor → institution`
     - `any → admin` (highly restricted)
   - Must:
     - Update dashboards and feature access
     - Emit admin audit entry

3. **Feature Flag Updates**
   - `admin_update_feature_flags(target_user, new_flags jsonb)`
   - Controls:
     - Vertical access (construction, emergency, etc.)
     - Experimental features
     - Marketing eligibility
     - Kids Mode availability
   - Must:
     - Preserve required keys
     - Write diff to `user_admin_actions`

---

## 5. Taxonomy Change Policy

### 5.1 Allowed Changes

Admins MAY:

- Add new rows to:
  - `badges`
  - `specialty_types`
  - `experience_types`
  - `compliance_overlays`
  - `landmark_types`
  - `kids_mode_overlays`

Under conditions:

- New codes are unique and stable
- New entries map to an existing or clearly documented vertical
- Changes are recorded in release notes / migrations

### 5.2 Forbidden Changes

Admins MAY NOT:

- Delete canonical seed rows
- Rename codes that are already in use
- Mutate meaning of existing codes

If something must be “removed”:

- Mark as deprecated via a boolean or metadata
- Do not delete the row

---

## 6. Logging & Audit Requirements

All admin mutations MUST:

- Be performed via official RPCs or admin UI
- Write to `user_admin_actions` with:
  - `admin_id`
  - `target_user_id`
  - `action_type`
  - `details` (JSONB diff/summary)
  - `created_at` timestamp

Audit logs must be:

- Append-only
- Non-editable by admins
- Retained for legal and safety reasons

---

## 7. Account Deletion Governance

Account deletion is never a raw DELETE.

Pipeline:

1. User triggers account deletion →  
   `account_deletion_requests` row created with `status = 'pending'`.

2. Account enters restricted mode:
   - No posting
   - No messaging
   - No marketplace access

3. Admin processes deletion queue:
   - `pending → in_progress → completed`
   - PII anonymized
   - Provider relationships soft-detached
   - Legal procurement history retained

All transitions and actions must be:

- Logged in `user_admin_actions`
- Non-bypassable via UI

---

## 8. Kids Mode & Sensitive Surfaces

Admins:

- Cannot override Kids Mode safely via UI
- Cannot force unsafe content into Kids Mode surfaces
- Must rely on:
  - `kids_mode_overlays`
  - Taxonomy mappings (specialty ↔ kids overlay)
  - Predefined compliance overlays (YOUTH_SAFETY, NO_MEDICAL_DATA, HI_PII_RESTRICTED)

---

## 9. Governance Philosophy

ROOTED is:

- Governance-first, not “growth-hack-first”
- Community and safety-oriented
- Designed for civic, educational, and institutional trust

Admin powers are:

- Narrowly scoped
- Fully logged
- Never silent or invisible to the audit layer

This document represents the official, canonical admin governance standard for ROOTED.
