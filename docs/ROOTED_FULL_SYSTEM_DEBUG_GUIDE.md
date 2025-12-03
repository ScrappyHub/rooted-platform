FINAL NOTE

This file is not a wish list.
It is a finite, canonical bug + risk ledger tied directly to governance.

When an item is fixed:

Update this file

Reference the commit or migration

Move the item to a “Resolved in vX.Y” section


---

## 4️⃣ ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md  
📍 **File:** `/docs/ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md`

```md
# 🧪 ROOTED – FULL SYSTEM DEBUG GUIDE (HONEST PASS)

Cross-References:

- /docs/Master_Debug_Toolkit.md  
- /governance/ENFORCEMENT_MATRIX.md  
- /governance/ROOTED_PLATFORM_CONSTITUTION.md  

This is the **master debug playbook** for everything that exists today across ROOTED.

---

## 0️⃣ How to Use This Guide

When you (dev / AI / maintainer) debug ROOTED:

1. Start at **Layer 1 – Core Platform** (Supabase, auth, roles, RLS)  
2. Then debug **Community vertical** (only fully live vertical)  
3. Then apply **Construction hardening checklist** (backend only)  
4. Treat other vertical repos as **documentation & roadmap**, not live apps  

Never assume a feature exists just because a doc mentions it.

---

## 1️⃣ Debug Layers Overview

### 1.1 Layers

ROOTED major layers:

- **Core Platform**

  - Supabase project  
  - `user_tiers`, feature_flags  
  - Providers, media, GEO, analytics  
  - RLS policies and security  

- **Community Vertical (LIVE)**

  - Directory (vendors / institutions / landmarks)  
  - Feeds & comments (restricted)  
  - Events & volunteer listings  
  - Kids Mode front-end  
  - Seasonal & holiday overlays (logic present; wiring pending in some areas)  
  - Basic analytics surface  

- **Construction Vertical (PRE-PRODUCTION)**

  - Schemas & flows designed  
  - Pre-production audit report  
  - Hardening checklist  
  - Backend only (no full UI yet)  

- **Future Verticals (PLANNING ONLY)**

  - Healthcare, Education, Arts & Culture, Environment, Disaster, Emergency, Workforce, etc.  
  - Repos = frameworks + docs, not functioning apps  

---

## 2️⃣ Global Debug Tools

Use these across all layers:

- Supabase Dashboard (table editor, SQL editor, RLS tester)  
- Browser dev tools (Network, Console, Storage)  
- Device/responsive tools for mobile behavior  
- Supabase JS client logs  
- Future: edge function logs, ETL logs  

If this guide mentions a tool you don’t have (like edge logs) → it’s **planned**, not required yet.

---

## 3️⃣ CORE PLATFORM – DEBUG CHECKLIST

### 3.1 Auth & `user_tiers`

Goal: Every signed-in user has exactly one correct `user_tiers` row and behaves accordingly.

Steps:

- In Supabase:

  - Open `user_tiers`  
  - For test accounts, confirm:

    - `role` ∈ {vendor, institution, admin, individual/community}  
    - `tier` ∈ {free, premium, premium_plus}  
    - `feature_flags` JSON matches expectations  

- In app (Community UI):

  - Log in as:

    - Free vendor  
    - Premium Plus vendor  
    - Institution  
    - Individual  

  - Confirm:

    - Correct dashboard  
    - No access to tools outside their tier  

If it fails:

- Missing or wrong `user_tiers` row  
- Or RLS silently rejecting select → check Supabase logs  

---

### 3.2 RLS & Permissions

Goal: No one can read/write what they shouldn’t — and allowed actions still work.

High-risk tables:

- `providers`  
- `provider_media`, `vendor_media`  
- `rfqs`, `bids`, `bulk_offers`  
- `conversations`, `conversation_participants`, `messages`  
- `events`, `event_registrations`  
- `landmarks`  
- `feed_items`, `feed_comments`, `feed_likes`  
- `vendor_analytics_*`  

For each table:

- Log in as various roles OR use Supabase row-level testing  
- Try: SELECT, INSERT (own stuff), UPDATE (own stuff), DELETE (where allowed)  

Look for:

- “new row violates row-level security policy” → RLS working but maybe too strict  
- Seeing too much data → RLS too permissive  

---

### 3.3 Media & Storage

Buckets:

- `rooted-public-media`  
- `rooted-protected-media`  

Debug:

- Upload via UI as vendor & institution  
- Confirm:

  - Media appears in UI  
  - Public media loads without auth where expected  
  - Protected media does **not** load in incognito  

Check:

- Naming conventions: `/vendors/{id}/...`  
- Correct policies per bucket  

---

### 3.4 GEO & Discovery

Debug:

- In Community UI:

  - Use “Discover” / map  
  - Adjust radius, category, filters  

- Confirm:

  - Only curated vendors show  
  - Municipal backend-only entities are hidden  

If municipal entities leak into public map → mis-flag + UI bug.

---

## 4️⃣ COMMUNITY VERTICAL – UI & FLOW DEBUG

This is your **only live vertical**. Treat it like production.

### 4.1 Directory

- Search by name, category, distance  
- Confirm:

  - Accurate results  
  - No duplicates  
  - Inactive providers don’t appear  
  - No admin-only fields leaking  

---

### 4.2 Feed

- Post as individual, vendor, institution  
- Confirm:

  - Posts appear where intended  
  - Kids Mode does **not** show global feed  
  - Comments/likes are present but de-emphasized  
  - No anonymous posting  

If you see feed UI in Kids Mode → UI + routing bug.

---

### 4.3 Events & Volunteering

- Create:

  - Public event  
  - Kids-safe event  
  - Volunteer opportunity  

Check:

- Cards show correct info  
- Kids Mode:

  - Only kids-safe events  
  - No prices, pay CTAs, or donation flows  

- Registration flows are clear and non-abusive  

---

### 4.4 Kids Mode (CRITICAL)

Debug:

- Enter Kids Mode:

  - Requires parent flow / explicit toggle  
  - Visual difference from normal mode  

- Once inside:

  - No prices  
  - No RFQs  
  - No bids  
  - No bulk  
  - No “post” or messaging  
  - No donation/fundraiser flows  

If any commerce or social-heavy UI appears → treat as a **law violation**.

---

### 4.5 Seasonal & Holiday UI

Design:

- Seasons = baseline  
- Holidays = always opt-in (user + business)  

Debug:

- Simulate regular day vs holiday window  
- Confirm:

  - Seasonal visuals show by default  
  - Holiday overlays only when both sides opted in  
  - Kids Mode never sees unwanted holiday content  

---

### 4.6 Support / Contact

- Find support/contact surfaces (desktop + mobile)  
- Submit test request  

Confirm:

- Clear success feedback  
- Email / request actually arrives  

---

## 5️⃣ CONSTRUCTION VERTICAL – BACKEND HARDENING DEBUG

Use these docs:

- CONSTRUCTION_AUDIT_PREPRODUCTION.md  
- CONSTRUCTION_BACKEND_HARDENING_CHECKLIST.md  
- DATABASE_ENTITY_MODEL.md  
- ROLE_PERMISSION_MATRIX.md  
- AUTOMATION_FLOWS.md  
- RISK_FAILURE_ANALYSIS.md  

Reality:

- No fully live Construction UI yet  
- Schemas & flows are **designed**, not all deployed  

Debug now:

- Ensure DB tables match docs (names, key columns)  
- Test RLS for any created tables (contractor vs institution vs admin)  

Everything else = design-stage review.

---

## 6️⃣ FUTURE VERTICALS – HONEST STATUS

Repos like:

- rooted-healthcare  
- rooted-education  
- rooted-arts-culture  
- rooted-environment  
- rooted-disaster  
- rooted-emergency  
- rooted-workforce  

are:

- ✅ Scoped & documented  
- ❌ Not wired to Figma or Supabase as live apps  

Debug stance:

- Only review docs for contradictions or safety issues  
- Mark them as “future phase – documentation only” in README  

---

## 7️⃣ GLOBAL “HONEST GAPS” LIST

Not fully done yet:

- 🔴 Payments / escrow (Stripe flows, legal)  
- 🔴 Advanced analytics ETL (jobs/schedules)  
- 🟠 Holiday / cultural overlays (end-to-end testing)  
- 🟠 Messaging moderation & reporting tools  
- 🟠 Construction critical hardening (COI, escrow, verification, deadlines)  

Stable but must be monitored:

- 🟢 Core auth + roles (`user_tiers`, feature_flags)  

---

## 8️⃣ QUICK EMERGENCY DEBUG CHECKLIST

When something feels broken, ask:

1. Who am I logged in as?  
   - Check `user_tiers` row  

2. Is RLS blocking me?  
   - Look for RLS errors; check Supabase logs  

3. Is this allowed by governance?  
   - Kids Mode? Sanctuary? Role? Tier?  

4. Is this feature actually built yet?  
   - If it’s a non-Community vertical: probably not  

5. GEO or discovery?  
   - Verify provider/event should be visible by rules  

6. Media or storage?  
   - Try raw media URL; check bucket & policy  

7. Is it just UI state?  
   - Clear cache, logout/login, check feature flags  

If still unclear:

- File a bug using `ROOTED_BUG_REPORT_TEMPLATE.md`  
