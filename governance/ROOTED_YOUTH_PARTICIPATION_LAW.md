# 🧒 ROOTED — OFFICIAL YOUTH PARTICIPATION LAW

Version: Canonical  
Authority Level: Platform Law  
Enforcement: Constitution → Kids Mode Governance → Account Governance → RLS → UI  
Effective Date: First Public Deployment  

Cross-References:  
→ ROOTED_PLATFORM_CONSTITUTION.md  
→ ROOTED_STOP_LAYER.md  
→ ROOTED_KIDS_MODE_GOVERNANCE.md  
→ ROOTED_ACCOUNT_GOVERNANCE_LAW.md  
→ ROOTED_COMMUNITY_TRUST_LAW.md  
→ ROOTED_VOLUNTEER_PARTICIPATION_LAW.md  

---

## 1️⃣ AGE TIERS & ACCOUNT RULES

ROOTED recognizes **age tiers**, not birthday exposure in UI:

- 0–12 → Children (no independent account)  
- 13–17 → Youth (limited accounts)  
- 18+ → Adults (full account classes by role/tier)  

Age logic enforcement is:

- Backend-first  
- Governance-driven  
- Never exposed as raw DOB in discovery  

---

### 1.1 Children (0–12)

Children (0–12):

- ❌ Do NOT have standalone ROOTED accounts  
- ✅ May only use ROOTED through **Kids Mode**, activated and controlled by a parent/guardian  
- ✅ Use is on shared devices under parental control  

Kids Mode for 0–12 is:

- Read-only learning (landmarks, experiences, stories)  
- No markets  
- No messaging  
- No uploads  
- No account-level actions  
- No “in-app identity”  

---

### 1.2 Youth (13–17)

Youth (13–17):

- ✅ May have their own ROOTED accounts (role = individual/community)  
- ❌ Are NOT treated as adults in discovery or markets  

Youth discovery is:

- Reduced / age-filtered  
- Focused on:
  - Farms  
  - Sanctuaries / rescues  
  - Educational institutions (schools, libraries, museums)  
  - Community spaces  

Youth accounts have:

❌ No access to RFQs  
❌ No access to bids  
❌ No access to bulk markets  
❌ No access to procurement surfaces  
❌ No access to direct vendor/institution messaging channels outside tightly controlled flows  

Youth volunteer opportunities:

- MUST pass moderation  
- MUST be flagged explicitly as youth-appropriate  
- MUST be educational / civic service, not labor exploitation  

Law:

> If there is ever a conflict between “youth convenience” and “youth safety” → **youth safety wins.**

---

### 1.3 Youth → Vendor Upgrade (18+)

At 18½ (age with buffer to prevent gaming):

A youth may:

- Apply to become a vendor in the Community vertical  

This process is:

- ✅ Application-based  
- ✅ Moderation-reviewed  
- ✅ Provider-created only after approval  

If approved:

- Their role transitions from `individual/community` → `vendor`  
- `user_tiers` is updated through **admin RPCs only**  
- All vendor rules, feature flags, and governance constraints apply  

This upgrade path:

- Is back-end controlled  
- MUST NOT depend on UI logic alone  
- MUST be documented in account governance flows  

---

## 2️⃣ KIDS MODE + EVENTS / LANDMARKS (LAW LEVEL)

This section binds youth to **discovery & map behavior**.

---

### 2.1 Events (General)

All events in ROOTED must:

- Have a moderation status:
  - `moderation_status = 'pending' | 'approved' | 'rejected'`  

Public discovery (non-Kids Mode) must require:

- `moderation_status = 'approved'`  

Hosts MUST be:

- A valid provider (vendor or institution), OR  
- In future: a tightly controlled nonprofit / mission entity  

No unowned / anonymous events appear in discovery.

---

### 2.2 Events in Kids Context

When events appear in Kids Mode or Kids Explore surfaces, they must be:

✅ Approved via moderation  
✅ Explicitly marked kids-safe via event-level fields / overlays  
✅ Hosted by:
- Farms  
- Sanctuaries / rescues  
- Kids-friendly institutions (schools, libraries, museums, etc.)  
- Other entities that pass youth safety rules  

Kids Mode events must NOT expose:

❌ Price  
❌ “Book now / buy” actions  
❌ Donation or fundraising CTAs  
❌ Ticketing flows  
❌ Links that drop directly into sales funnels  

Kids Mode events are:

> Field trip / visit / volunteer / learn — **not commerce.**

---

### 2.3 Landmarks

Landmarks are governed by ROOTED landmark law:

- Always educational  
- Never monetized  

Landmarks may be:

- Farms  
- Historical markers  
- Cultural spaces  
- Nature areas  
- Environmental sites  

Kids Mode landmark rules:

- Only landmarks marked kids-safe may appear  
- All kids-visible landmarks MUST be approved in moderation  
- Landmarks in youth/Kids surfaces may NOT show:
  - Ticket prices  
  - Donation requests  
  - Booking flows  

Landmarks are **map-based, educational, non-commercial “things to learn about.”**

---

## 3️⃣ KIDS-SAFE TAGS & ADMIN CONTROL (AUTOMATION LAW)

### 3.1 Kids-Safe Tags

Any entity (provider, event, landmark, media) that appears as kids-safe:

- MUST go through moderation  
- MUST NOT self-assign kids-safe in a way that bypasses admin review  

Kids-safe state MUST be:

- Assigned or approved by:
  - Admin via moderation tools, OR  
  - A validated pipeline inserting into `moderation_queue` + admin RPC  

> Law: “Kids-safe” is an **admin-approved state**, not a user toggle.

---

### 3.2 Kids-Safe Media (Videos, Photos, etc.)

All media that appears in Kids Mode:

- MUST be attached to an **approved kids-safe** event / landmark / provider  
- MUST pass moderation  
- MUST NOT be auto-approved from raw uploads  

“There is no ‘this is safe for kids’ checkbox that instantly goes live.”

---

## 4️⃣ RELATIONSHIP TO OTHER YOUTH LAWS

This law cooperates with:

- `KIDS_MODE_GOVERNANCE.md`  
- `ROOTED_VOLUNTEER_PARTICIPATION_LAW.md`  
- `ROOTED_COMMUNITY_TRUST_LAW.md`  

Together, they guarantee:

- No child commerce  
- No labor exploitation under “volunteer”  
- No exploitative crisis exposure  
- No predatory discovery patterns  

---

## ✅ FINAL DECLARATION

Youth in ROOTED:

- Are participants, not products  
- Are protected, not targeted  
- Are invited to learn, help, and grow — not to be extracted  

When in doubt:

> Protect the child.  
> Protect the youth.  
> Block the feature.  
> Even if it costs growth.
