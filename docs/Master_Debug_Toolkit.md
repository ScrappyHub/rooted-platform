
---

## `Master_Debug_Toolkit.md`

```md
# ✅ ROOTED — MASTER BUG & RISK LIST (CANONICAL v1)

Status as of now:

- Governance, taxonomy, Kids Mode, and compliance are ✅ structurally complete.  
- Remaining work is: integration, UI enforcement, and edge-case safeguards.

Cross-References:

- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`  
- `/governance/ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md`  
- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`  
- `/governance/ROOTED_COMMUNITY_TRUST_LAW.md`  
- `/governance/ROOTED_DATA_SOVEREIGNTY_LAW.md`  
- `/governance/ROOTED_ACCESS_POWER_LAW.md`  
- `/governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md`  
- `/governance/ROOTED_ADMIN_GOVERNANCE.md`  
- `/governance/ROOTED_ACCOUNT_GOVERNANCE_LAW.md`  
- `/governance/ENFORCEMENT_MATRIX.md`  

Use this file as your **debug + risk map** when auditing the platform.

---

## 🟥 PRIORITY 1 — CRITICAL GOVERNANCE INTEGRATION BUGS

(These are the only items that can compromise your law if left unchecked.)

### 1️⃣ Admin UI Not Yet Hard-Gated by `is_admin()`

**Risk:** views and SQL are secure, but if admin routes are not server-gated, a non-admin could still attempt to load admin panels.

**Fix Required:**

- Every admin route must verify:
  - `user_tiers.role = 'admin'`  
  - `public.is_admin()` server-side  
- Never trust front-end role claims alone.

**Governance Links:**

- `/governance/ROOTED_ADMIN_GOVERNANCE.md`  
- `/governance/ROOTED_ACCESS_POWER_LAW.md`  

---

### 2️⃣ Provider-Level Auto-Inheritance Not Yet Enforced

You have:

- Specialty → compliance overlays  
- Specialty → Kids overlays  

But if provider creation/update doesn’t **enforce inheritance**, a provider could exist without its legal safety net.

**Risk:** e.g. a FARM provider without FOOD_SAFETY enforced.

**Fix Required (Logic Level):**

- On provider create/update:
  - Pull `admin_specialty_governance_v1`  
  - Auto-apply:
    - compliance overlays  
    - kids overlays  
- Do **not** duplicate this logic in multiple services.

**Governance Links:**

- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`  
- `/governance/ROOTED_COMMUNITY_TRUST_LAW.md`  

---

### 3️⃣ Experience Creation Not Yet Validated Against Governance View

You have:

- Experience governance view  
- Kids overlays  
- Insurance & waiver flags  

Without validation at submission time, someone could attempt:

- kids-enabled experience that requires a waiver but skips it  
- experience without insurance when required  

**Fix Required:**

- On experience submission, reject if:
  - `requires_waiver = true` and no waiver attached  
  - `insurance_required = true` and provider lacks insurance badge  
  - `kids_allowed = false` and Kids Mode surface is trying to show it  

**Governance Links:**

- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`  
- `/governance/ROOTED_COMMUNITY_TRUST_LAW.md`  

---

## 🟧 PRIORITY 2 — YOUTH & SAFETY EDGE-CASE BUGS

### 4️⃣ Kids Mode Still Depends on UI Filtering Only

Data law is correct, but if backend queries don’t enforce:

```sql
WHERE kids_allowed = true

then Kids Mode could still leak adult-only content via API.

Fix Required:

Duplicate Kids Mode filtering in:

Events API

Discovery API

Search API

Never rely on front-end-only filtering.

Governance Links:

/governance/ROOTED_KIDS_MODE_GOVERNANCE.md

/governance/ENFORCEMENT_MATRIX.md

5️⃣ Sensitive Compliance Overlays Not Yet Cross-Validated

Example risks:

Provider marked HI_PII_RESTRICTED but allowed to upload free-form documents.

NO_MEDICAL_DATA entity given a medical-style form.

Fix Required:

Form schema must change based on compliance overlays.

Document upload types must be filtered by overlay.

Governance Links:

/governance/ROOTED_DATA_SOVEREIGNTY_LAW.md

/governance/ROOTED_PLATFORM_CONSTITUTION.md

🟨 PRIORITY 3 — DISCOVERY & TRUST SIGNAL BUGS

6️⃣ Discovery Badges Not Yet Enforced as Requirements

You seeded badges:

INSURED

LICENSED

YOUTH_SAFE

EMERGENCY_CERTIFIED

If discovery doesn’t enforce these, a GENERAL_CONTRACTOR might appear public without LICENSED.

Fix Required:

Discovery rules:

If LICENSE_REQUIRED → provider must have LICENSED badge

If INSURANCE_REQUIRED → provider must have INSURED badge

Otherwise:

Hide from public or mark clearly as “unverified”.

Governance Links:

/governance/ROOTED_COMMUNITY_TRUST_LAW.md

7️⃣ Vertical Feature Flags Not Yet Hard-Blocking Routes

Users may still be able to:

Navigate to /construction

Hit emergency RFQs

Access future verticals

Fix Required:

Every vertical route must verify:

relevant feature_flags._access = true

Otherwise:

Redirect to a locked screen / explanation.

Governance Links:

/governance/ROOTED_ACCESS_POWER_LAW.md

🟩 PRIORITY 4 — ADMIN SAFETY + OPERATIONAL BUGS (LOW RISK)
8️⃣ Audit Read UI May Not Be Built Yet

You are writing to user_admin_actions ✅
But you might not yet have:

Admin audit viewer

Filters by action_type, date, target_user

Impact: low risk, but important for long-term trust and forensic debugging.

Governance Links:

/governance/ROOTED_ADMIN_GOVERNANCE.md

9️⃣ Deprecation Flags Not Yet Implemented

Governance says:

“Do not delete — mark deprecated.”

But tables may not yet include:

is_deprecated

deprecated_at

Impact: future cleanup and migrations become harder.

🔟 Cross-Vertical Soft Conflicts Not Yet Modeled

Example:

A provider tagged as both THERAPY_CENTER and YOUTH_PROGRAM but no explicit conflict rules exist.

Impact: not dangerous now, but important in Phase 3+ vertical launches.
