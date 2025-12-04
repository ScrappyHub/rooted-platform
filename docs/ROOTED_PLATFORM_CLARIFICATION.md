# ROOTED PLATFORM CLARIFICATION 🌱  
**File:** docs/ROOTED_PLATFORM_CLARIFICATION.md  
**Authority Level:** Canonical Clarification (must agree with:**
- ROOTED_PLATFORM_CONSTITUTION.md
- ROOTED_GIT_HANDOFF.md
- ROOTED_DEBUG_TOOLKIT_CORE.md
- ROOTED_COMMUNITY_UI_QA.md
- ROOTED_COMMUNITY_UI_PROMPT (canonical UI file)
- ROOTED_ACCESS_POWER_LAW (feature grid)

This file exists to correct any mistaken assumptions that ROOTED is a consumer e-commerce platform.

ROOTED is **not** a “shop local” marketplace.  
ROOTED is a **community, education, and B2B infrastructure layer**.

---

## 1. What ROOTED IS NOT ❌

ROOTED is **NOT**:

- A public marketplace where people buy/sell food
- An e-commerce platform for consumers
- A “shop local” consumer marketplace
- A cart/checkout system (no items, no cart, no checkout)
- A “DoorDash for farms” or “Instacart for local food”

No UI, copy, data model, or vertical is allowed to contradict this.

---

## 2. What ROOTED Actually Is ✅

ROOTED is a governed multi-layer platform for:

### 2.1 Education & Discovery (Public)

- Shows vendor stories, faces, practices, and seasonal work
- Reveals what is growing when and where
- Serves seasonal produce education and food-system awareness
- Connects people to the **source** of their food and work
- Encourages visiting vendors in real life (off-platform)

> **Core truth:** ROOTED connects people to the **SOURCE**, not the **TRANSACTION**.

### 2.2 B2B Marketplace (Institutional Only)

- Institutions (schools, libraries, community centers, etc.) can:
  - Issue RFQs
  - Receive bids
  - Coordinate bulk procurement
- Vendors can:
  - Respond to institutional RFQs
  - Offer structured experiences for institutions
- All of this is **B2B**, not public commerce.
- B2B markets must obey:
  - Platform Access & Feature Grid (Premium/Premium Plus)
  - RLS
  - Moderation
  - Sanctuary restrictions
  - Kids Mode doctrine (no Kids)

### 2.3 Education Experiences Marketplace

- Field trips, farm tours, and educational experiences for:
  - Schools, youth groups, community programs, institutions
- Experiences are **booked by institutions**, not random public guests
- Kids Mode sees *only* educational + safe surfaces (no pricing/commerce)

### 2.4 Volunteer Coordination Platform

- Logged-in community users can:
  - Discover volunteer opportunities (farms, markets, events, sanctuaries)
  - Commit to shifts
  - View and track their own volunteer history
- Vendors/institutions can:
  - Post volunteer needs
  - See who signed up (subject to policy)

### 2.5 Children’s Seasonal Activity & Learning Hub

- Seasonal educational content for children:
  - Crafts
  - Seasonal activities
  - Kid-safe experiences
- Kids Mode:
  - Strongly governed by Supreme Child Safety Clause
  - No payments, no buying, no fundraising, no B2B tools
  - Education and discovery only

---

## 3. Platform Philosophy (From Community Home Copy)

> "ROOTED is not built to sell to people — it is built to **reconnect people.**  
> For citizens, this platform exists as a place of discovery, learning, and awareness,  
> **not pressure or transaction.**"

> "It reveals the **faces, hands, seasons,** and **quiet dedication** behind the food  
> and work that sustain communities."

> "The tools for procurement and sourcing exist where they belong — within structured  
> institutional systems — but the public experience remains rooted in **education,  
> visibility,** and **trust.**"

> "In ROOTED, people are not customers, farmers are not inventory, and connection  
> is never engineered. It is simply made possible."

**Tagline:**  
> **“Building community, not commerce.”**

This philosophy is binding for all UI, copy, and backend behavior.

---

## 4. Role Reality — What Each User Can Actually Do

These are the **canonical permissions** for Community vertical (UI behavior must match role + RLS):

### 4.1 Guest (Not Logged In)

✅ CAN:

- Discover local vendors, farms, institutions, landmarks (within GEO limits)
- Learn vendor stories, practices, and seasonal focus
- View seasonal produce and educational content
- See basic info: location, hours, accepted payment types (for in-person visits)
- See **curated** map results (6–8 cards, 50-mile max radius)
- See kids-safe landmarks and educational content (outside Kids Mode context)

❌ CANNOT:

- Buy anything on the platform
- Create or manage content
- Volunteer (must log in)
- Access B2B tools (RFQs, bids, bulk tools, analytics)
- Access Billing or Stripe surfaces

### 4.2 Individual / Community User (Logged In)

✅ CAN (in addition to Guest):

- Sign up and log in
- Save favorites / bookmarks (if implemented)
- View their own volunteer history
- Register/commit for volunteer opportunities
- Participate in strictly governed community experiences

❌ CANNOT:

- Purchase through ROOTED
- Use B2B tools (RFQs, bids, bulk procurement)
- Access Billing/Plans (Stripe), vendor/institution dashboards

### 4.3 Vendor (Farms, Food Makers, etc.)

✅ CAN:

- Create and manage their provider profile (story, what they grow/make)
- Declare accepted payment methods (cash, EBT, card, etc. — for off-platform visits)
- Show seasonal focus (what’s in season, educational, not inventory)
- Post volunteer opportunities tied to their provider
- Participate in B2B markets once:
  - Premium/Premium Plus tier is valid
  - Markets are enabled by app_settings + feature_flags
- Offer education experiences to institutions (field trips, tours, classes)

❌ CANNOT:

- Sell to public through ROOTED (no carts, no public checkout)
- Bypass premium_plus gate for B2B bidding/advanced analytics
- Use kids surfaces for promotion or sales

### 4.4 Institution

✅ CAN:

- Discover local vendors for B2B sourcing
- Use RFQ/Bid flows for procurement (when markets go live)
- Browse and request educational experiences and field trips
- Post institutional volunteer opportunities

❌ CANNOT:

- Expose institutional procurement tools to public/kids
- Access Kids Mode surfaces as “institution role UI” (Kids Mode is child/parent oriented)

### 4.5 Admin

✅ CAN:

- Moderate content (vendors, landmarks, events, experiences)
- Approve or reject applications
- Enforce Kids Mode rules and sanctuary protections
- See all institutional/vendorship tools as needed (within RLS + is_admin())
- Maintain configuration (app_settings, feature flags) via governed paths

❌ CANNOT:

- Convert ROOTED into public e-commerce via UI copy or hidden flows
- Give commercial tools to sanctuaries / non-commercial entities
- Bypass Kids Mode, consent, or deletion pipelines without trace

---

## 5. Language: Banned vs Allowed

To prevent reversion to “shop local” thinking:

### 5.1 Language That MUST NOT Appear in Community UI

❌ “Browse vendors” (implies shopping)  
❌ “Shop local”  
❌ “Buy fresh produce”  
❌ “Order now”  
❌ “Add to cart”  
❌ “Checkout”  
❌ “Place order” (for public users)  
❌ “Delivery” / “Shipping” (consumer context)

If these appear, they must be treated as **bugs**.

### 5.2 Approved Language

✅ “Discover local farms and food makers”  
✅ “Learn their stories”  
✅ “See what’s growing this season”  
✅ “Find where they’re located”  
✅ “Visit in person” (off-platform, no link to transaction)  
✅ “Support through volunteering”  
✅ “Meet the makers”  
✅ “Seasonal education”  
✅ “Community connection”

B2B contexts may use:

✅ “Request quote” (institutional, not public)  
✅ “Bid response” (vendor↔institution only)  
✅ “Bulk procurement” (hidden from public)

---

## 6. Map / Legend Flags — What `allows_commerce` REALLY Means

For map metadata and specialty registry fields like `allows_commerce` and `allows_ads`:

- `allows_commerce = true`:
  - This provider **MAY** participate in B2B tools (RFQs, Bids, Bulk).
  - It does **NOT** mean they sell directly to the public through ROOTED.
- `allowBidding` or `can_use_bid_marketplace`:
  - This provider **MAY** bid in institutional RFQs (subject to Premium Plus + feature flags).
- `allows_ads = true`:
  - This provider **MAY** be eligible for limited, non-intrusive ads in future (not in Kids Mode, not in civic/emergency/health surfaces).

These flags are **internal eligibility** for B2B / monetization — not consumer checkout permissions.

---

## 7. Kids Mode & Seasonal Crafts

- Seasonal crafts and activities are:
  - For children and families
  - Educational and creative
  - Non-commercial
- Kids Mode:
  - Must never surface:
    - Pricing, buying, fundraising, or “donate now”
    - B2B tools (RFQs, Bids, Bulk, Analytics)
    - Stripe or Billing surfaces
  - Must always enforce:
    - is_kids_safe = true
    - content moderation
    - cultural and holiday consent rules

---

## 8. Governance Hooks (Backend Alignment)

The following must remain true across backend + UI:

1. GEO constraints:
   - Max radius = 50 miles
   - Card count = 6–8 results (no “load all vendors”)
2. RLS:
   - Enforces role + tier + feature_flags
   - Prevents public access to B2B tables
3. Moderation:
   - All public content must pass moderation pipeline
4. Kids Mode:
   - Never touches commerce or B2B
   - Uses is_kids_safe + content flags
5. Platform Access & Feature Grid:
   - Only Premium Plus can use Bidding
   - Bulk and Advanced Analytics are premium/premium_plus only
6. Sanctuaries & Rescue:
   - Discovery + volunteer only
   - No commercial tools, no ads

---

## 9. Implementation Checklist (For You / Future Devs)

Use this list when updating or reviewing Community UI:

- [ ] Search dialog text: only “discover/learn/connect” language.
- [ ] Explore page: no commerce phrasing; highlight stories + seasons.
- [ ] Home CTAs: no “shop,” no “order”; only discover, volunteer, visit, learn.
- [ ] Navigation labels: reflect education, discovery, volunteering, experiences.
- [ ] Vendor profiles:
  - [ ] Story / practices / seasonal focus
  - [ ] Payment methods for **in-person** visits only (cash, EBT, card)
  - [ ] Location, hours, and volunteer needs
  - [ ] B2B contact/experience requests visible only to institutions.
- [ ] Map popups:
  - [ ] Use “Learn more”, “Visit”, “Get directions”, “View volunteer needs”
  - [ ] No “Buy”, “Order”, “Add to cart”.
- [ ] Volunteer features:
  - [ ] Clear language about helping / supporting, not “jobs” or “gigs”.
- [ ] Markets:
  - [ ] Labeled as Institutional/B2B.
  - [ ] Hidden or “Coming Soon” until Stripe + legal ready.
- [ ] Kids Mode:
  - [ ] No money, no checkout, no fundraising.
  - [ ] Education + safe discovery only.

---

## 10. Canonical Core Truth

> **ROOTED connects people to the SOURCE, not the TRANSACTION.**  

Community members **discover, learn, and support**.  
Institutions **procure and book experiences** in governed B2B tools.  
Volunteers **show up and help**.  
Kids **learn safely**.

No public buying and selling.  
Yes to **education, stories, and community.**
