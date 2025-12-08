# 🧩 ROOTED — FRONTEND PLATFORM CONTRACT (CANONICAL)

Authority Level: Binding Engineering Contract  
Applies To: All frontend / edge / app code for ROOTED (Community, Education, Construction, Experiences, Arts & Culture)  

Enforcement Chain:  
GOVERNANCE  
→ DATABASE (RLS, Views, RPCs)  
→ ADMIN RPCs  
→ FRONTEND  

This document defines how frontend code is **legally required** to behave in ROOTED.

If a frontend implementation conflicts with this file,  
➡ the implementation is **invalid**, even if it “works.”

---

## 0. Cross-References (MUST OBEY)

Top-level law:

- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`
- `/governance/ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md`
- `/governance/ROOTED_GOVERNANCE_INDEX.md`
- `/governance/ROOTED_CORE_SYSTEM_GOVERNANCE.md`
- `/governance/ROOTED_VERTICAL_ACCESS_CONTRACT.md`

Key governance:

- `/governance/ROOTED_ACCESS_POWER_LAW.md`
- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`
- `/governance/ROOTED_DATA_SOVEREIGNTY_LAW.md`
- `/governance/ROOTED_COMMUNITY_TRUST_LAW.md`
- `/governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md`
- `/governance/ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md`
- `/governance/ROOTED_ADMIN_GOVERNANCE.md`
- `/governance/ROOTED_ACCOUNT_GOVERNANCE_LAW.md`

Implementation / hardening:

- `/governance/ROOTED_BILLING_ABUSE_TEST_MATRIX.md` (if present)
- `/docs/ROOTED_MASTER_DEBUG_TOOLKIT.md`
- `/docs/ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md`
- Vertical FE contracts, e.g.  
  - `ROOTED_COMMUNITY_FRONTEND_CONTRACT.md`  
  - `ROOTED_EDUCATION_FRONTEND_CONTRACT.md`  
  - `ROOTED_CONSTRUCTION_FRONTEND_CONTRACT.md`  
  - `ROOTED_EXPERIENCES_FRONTEND_CONTRACT.md`  
  - `ROOTED_ARTS_CULTURE_FRONTEND_CONTRACT.md`

---

## 1. Core Principles (Frontend Must Obey)

Frontend is **display-only**, not authority.

All real power lives in:

- Governance files  
- SQL schemas  
- RLS policies & views  
- Feature flags  
- Admin-only RPCs  

Frontend **never**:

- Bypasses RLS  
- Writes directly to core tables that affect **power, trust, or money** when an RPC exists  
- Recreates business rules that already live in views / RPCs  
- Invents roles, tiers, or new feature flags

> Frontend wires UI to the law.  
> It does **not** define the law.

---

## 2. Supabase Client & Environment

The frontend uses a **single shared Supabase client** with anon key only.

```ts
// src/lib/supabaseClient.ts (canonical pattern)
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL as string;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY as string;

if (!supabaseUrl || !supabaseAnonKey) {
  console.warn('Supabase env vars are missing');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey, {
  auth: {
    persistSession: true,
  },
});
Env vars:

VITE_SUPABASE_URL

VITE_SUPABASE_ANON_KEY

Frontend must never use the service role key.

3. Canonical Auth + Role/Tier Fetch
After any successful login, the app must not poke tables directly to figure out power.

Instead, it must call one RPC:

rpc('get_my_role_and_tier') → { role, tier, feature_flags, has_2fa }

ts
Copy code
import { supabase } from '@/lib/supabaseClient';

export async function handlePostLoginRouting(goTo: (path: string) => void) {
  // 1) Get current auth user
  const { data: { user }, error: userError } = await supabase.auth.getUser();
  if (userError || !user) {
    goTo('/login');
    return;
  }

  // 2) Ask backend who this user is in ROOTED terms
  const { data: roleInfo, error: roleError } = await supabase
    .rpc('get_my_role_and_tier')
    .single();

  if (roleError || !roleInfo) {
    // Treat as community/free
    goTo('/community/home');
    return;
  }

  const { role, tier, feature_flags, has_2fa } = roleInfo;

  const isKidsMode               = !!feature_flags?.is_kids_mode;
  const canUseBulkMarketplace    = !!feature_flags?.can_use_bulk_marketplace;
  const canUseBidMarketplace     = !!feature_flags?.can_use_bid_marketplace;
  const canViewBasicAnalytics    = !!feature_flags?.can_view_basic_analytics;
  const canViewAdvancedAnalytics = !!feature_flags?.can_view_advanced_analytics;

  // 3) Enforce 2FA for high-power roles (see §4)
  if ((role === 'admin' || role === 'institution') && !has_2fa) {
    goTo('/security/setup-2fa');
    return;
  }

  // 4) Route by role + tier
  if (role === 'admin') {
    goTo('/admin/dashboard');
    return;
  }

  if (role === 'vendor') {
    if (tier === 'premium_plus') {
      goTo('/vendor/premium-plus-dashboard');
    } else if (tier === 'premium') {
      goTo('/vendor/premium-dashboard');
    } else {
      goTo('/vendor/free-dashboard');
    }
    return;
  }

  if (role === 'institution') {
    if (tier === 'premium_plus') {
      goTo('/institution/premium-plus-dashboard');
    } else if (tier === 'premium') {
      goTo('/institution/premium-dashboard');
    } else {
      goTo('/institution/free-dashboard');
    }
    return;
  }

  // Community (parents, general public, kids mode)
  if (isKidsMode) {
    goTo('/community/kids-mode');
  } else {
    goTo('/community/home');
  }
}
Usage after sign-in:

ts
Copy code
// after successful login:
await handlePostLoginRouting(goTo);
This helper is the only allowed routing entrypoint.
All platforms (web, mobile, desktop) must reuse this pattern.

4. 2FA Enforcement (Admins & Institutions)
Per ROOTED_ADMIN_GOVERNANCE.md and ROOTED_ACCESS_POWER_LAW.md:

Admin and Institution roles must not access dashboards without 2FA.

Frontend UX must:

If role in ('admin','institution') and has_2fa === false
➜ route to /security/setup-2fa and block further access.

Backend (RLS/RPCs) mirrors this rule; frontend is the first gate, not the only gate.

5. Subscription State: How UI Checks Billing
Frontend must never speak to Stripe directly.

Premium / Premium Plus access is derived from:

ts
Copy code
const hasPremium =
  provider.subscription_status === 'active' ||
  provider.subscription_status === 'trialing';
If hasPremium is false:

UI must show upgrade / locked state for premium tools.

Stripe and billing logic live in:

Webhooks

Backend jobs

Normalized fields like:

provider.subscription_status

user_tiers.tier

user_tiers.feature_flags

Frontend uses only those values — never Stripe APIs directly.

This aligns with any ROOTED_BILLING_ABUSE_TEST_MATRIX.md.

6. Feature Flags → UI Capabilities (5-Tier Market Logic)
Frontend must not hard-code “premium can do X” logic on its own.

All feature capability comes from feature_flags exposed via get_my_role_and_tier.

Example in a vendor dashboard:

ts
Copy code
type RoleInfo = {
  role: string;
  tier: string;
  feature_flags: Record<string, any>;
};

function VendorDashboard({ roleInfo }: { roleInfo: RoleInfo }) {
  const { feature_flags } = roleInfo;

  const canUseBulkMarketplace    = !!feature_flags?.can_use_bulk_marketplace;
  const canUseBidMarketplace     = !!feature_flags?.can_use_bid_marketplace;
  const canViewBasicAnalytics    = !!feature_flags?.can_view_basic_analytics;
  const canViewAdvancedAnalytics = !!feature_flags?.can_view_advanced_analytics;

  return (
    <>
      {/* always-on stuff like profile, gallery, etc. */}

      {canUseBulkMarketplace && <BulkMarketplaceSection />}
      {canUseBidMarketplace && <BidMarketplaceSection />}

      {canViewBasicAnalytics && <BasicAnalyticsPanel />}

      {canViewAdvancedAnalytics && <AdvancedAnalyticsPanel />}
    </>
  );
}
Backend law guarantees:

Premium = Free + more tools

Premium Plus = Premium + more tools

The UI just reads flags; it never “cuts off” lower-tier abilities when upgrading.

7. Discovery & Map Contract (Views Only)
Per ROOTED_COMMUNITY_TRUST_LAW.md and the Stop Layer, public discovery surfaces must only use canonical views.

7.1 Directory & Map Lists
Use:

public.providers_discovery_v1 (Community & shared provider discovery)

Vertical-specific discovery views, e.g.:

community_providers_discovery_v1

education_providers_discovery_v1

construction_providers_discovery_v1

experiences_discovery_v1

arts_culture_venues_discovery_v1

Never query base tables (like providers) for public discovery:

ts
Copy code
// ✅ Correct
const { data, error } = await supabase
  .from('providers_discovery_v1')
  .select('*');

// ❌ Forbidden
// const { data, error } = await supabase
//   .from('providers')
//   .select('*');
Frontend may apply:

Search term filters (name, city, etc.)

Category filters

Client-side distance filters (or via safe RPCs)

Frontend must not:

Recheck moderation status

Recheck is_discoverable

Recheck is_active

The view already encodes those.

7.2 Seasonal “Featured This Season”
For seasonal boost:

ts
Copy code
const { data, error } = await supabase
  .from('seasonal_featured_providers_v1')
  .select('*')
  .order('seasonal_score', { ascending: false });

const featured = (data ?? []).slice(0, 8);
UI rules:

No manual pinning above these results.

No direct base-table overrides to “boost” someone.

Visual badges like “In Season” / “Harvest Season” are purely UI labels, not new data.

8. Kids Mode — Frontend Behavior
Per ROOTED_KIDS_MODE_GOVERNANCE.md and the Constitution:

Kids Mode is a non-commercial safety sandbox, not a theme.

Frontend must never expose in Kids Mode:

Pricing

Booking

Fundraising / donations

RFQs / bids

Bulk markets

Ads or promoted content

Direct messaging

Analytics dashboards

8.1 Routing
If feature_flags.is_kids_mode === true for a community identity, route to:

ts
Copy code
goTo('/community/kids-mode');
Kids Mode screens:

Use kids-safe views (kids_*_v1 views) defined by backend.

Show only content the Kids governance explicitly allows.

8.2 UI Rules
In Kids Mode:

Hide all:

“Book now” / “Request quote” / “Hire us”

“Donate” / “Fundraise”

“Buy tickets” / “Subscribe”

Show only:

Educational text

Safe photos / videos

Nature / agriculture / animal / environment content

Crafts / seasonal educational elements

Any new Kids Mode UI must be checked against:

ROOTED_KIDS_MODE_GOVERNANCE.md

ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md

9. Seasonal Knowledge Streams — Frontend Contract
Per ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md:

9.1 Education-Only Seasonal Streams
Frontend reads from seasonal education views, for example:

seasonal_current_month_v1 (public education)

kids_seasonal_v1 (kids-safe subset)

UI must:

Show education only:

what’s in season

storage tips

planting guidance

safe crafts how-tos

Never show:

product links

carts

vendor ranking

“sponsored” placement

These are knowledge streams, not ads.

9.2 Recipes (Monetized Seasonal Layer)
Recipes are the one monetized seasonal piece and only for allowed tiers (e.g. Premium Plus).

UI contract:

Check both:

Role/tier/feature flags

Recipe view (e.g. seasonal_recipes_v1)

If user is not allowed:

Show lock icon / upgrade messaging

Do not leak full recipe content

Recipes never load in Kids Mode except for explicit, education-only snippets governed by Kids law.

No user-specific food profiling, tracking, or diet targeting is allowed.

10. Applications & Submissions (RPC-Only)
All “apply” flows must go through RPCs, not direct inserts:

ts
Copy code
// Apply as vendor
await supabase.rpc('submit_vendor_application', {
  /* form payload */
});

// Apply as institution
await supabase.rpc('submit_institution_application', {
  /* form payload */
});
Frontend must not:

ts
Copy code
// ❌ Forbidden
// await supabase.from('providers').insert(...);
// await supabase.from('institutions').insert(...);
Core application/approval tables are controlled by moderation and admin law.

11. Notifications & Moderation Events
Approvals, rejections, system messages, etc. must go through:

A notification RPC (notify_submission_approved, etc.), or

Direct insert into notifications where RLS allows.

Canonical pattern:

ts
Copy code
await supabase.rpc('notify_submission_approved', {
  target_user: userId,
  entity_type: 'event',
  entity_id: eventId,
  entity_title: 'Farm to Table Concert',
});
or:

ts
Copy code
await supabase
  .from('notifications')
  .insert([{
    user_id: userId,
    type: 'submission_approved',
    title: 'Your event was approved',
    body: `Your event "${eventTitle}" is now live on ROOTED.`,
    data: {
      entity_type: 'event',
      entity_id: eventId,
    },
  }]);
UI:

Reads notifications via governed views.

Never fakes approval or bypasses moderation logic.

12. Media Uploads — Safe Pattern
All media uploads must:

Use the logged-in user’s user.id as owner_user_id.

Use a valid provider_id / entity_id that backend RLS will accept.

Respect bucket + path patterns defined by backend.

Example:

ts
Copy code
const { data: { user } } = await supabase.auth.getUser();

await supabase
  .from('vendor_media')
  .insert({
    owner_user_id: user.id,
    provider_id: providerId, // vendor they own
    storage_bucket: 'rooted-public-media',
    storage_path: `vendors/${providerId}/profile-banner.jpg`,
    media_type: 'image',
    visibility: 'public',
  });
Frontend must never:

Set owner_user_id to anything other than user.id.

Fake ownership of another vendor’s media.

13. Vendor / Institution Dashboards — Gating
Inside dashboards, advanced sections must be gated by:

provider.subscription_status and

feature_flags

Example:

tsx
Copy code
const hasPremium =
  provider.subscription_status === 'active' ||
  provider.subscription_status === 'trialing';

return (
  <>
    <ProfileSection />
    <GallerySection />

    {hasPremium && canUseBulkMarketplace && <BulkMarketplaceSection />}
    {hasPremium && canUseBidMarketplace && <BidMarketplaceSection />}

    {canViewBasicAnalytics && <BasicAnalyticsPanel />}
    {hasPremium && canViewAdvancedAnalytics && <AdvancedAnalyticsPanel />}
  </>
);
If either the feature flag or subscription says “no” → UI treats it as locked.

14. Weather & Vertical Conditions Widgets
Weather logic lives in backend (weather_snapshots, vertical_conditions_v1).

Frontend reads only from the vertical conditions view.

Helper:

ts
Copy code
// src/lib/verticalConditions.ts
export type Vertical =
  | 'community'
  | 'education'
  | 'construction'
  | 'experiences'
  | 'arts_culture';

export type VerticalConditions = {
  vertical: Vertical;
  summary: string;
  guidance_text: string;
  risk_level: 'low' | 'moderate' | 'high' | 'extreme';
  risk_flags: string[];
  seasonal_phase: 'winter' | 'late_fall' | 'spring_summer' | 'high_summer' | 'unspecified';
  valid_from: string;
};

export async function fetchVerticalConditions(
  supabase: any,
  vertical: Vertical
): Promise<VerticalConditions | null> {
  const { data, error } = await supabase
    .from('vertical_conditions_v1')
    .select('*')
    .eq('vertical', vertical)
    .single();

  if (error || !data) return null;
  return data as VerticalConditions;
}
Each vertical uses it with its own label:

Community → “Local Conditions”

Education → “Trip Conditions”

Construction → “Jobsite Conditions”

Experiences → “Trail & Activity Conditions”

Arts & Culture → “Show Conditions”

Frontend does not call external weather APIs directly.

15. Figma / Design AI Contract
Every shipped screen must be able to answer:

Data Source View/Table:

RPC (for writes):

Role(s) allowed:

Tier(s) allowed:

Feature flags required:

Vertical: (community / education / construction / experiences / arts_culture)

If a screen cannot name:

The view/table it reads from

The RPC it writes through (if any)

The role & tier

The vertical

→ it cannot ship.

Discovery screens must use discovery views for their vertical.
Kids Mode screens must reference Kids governance.
Sanctuary-related screens must reference Sanctuary law.

16. Vertical Boundaries (No Knowledge Spillage)
Per ROOTED_CORE_SYSTEM_GOVERNANCE.md and vertical docs:

Sanctuaries & rescues:

Live in Community discovery.

May appear in Education/Experiences only under Sanctuary law as non-commercial education.

Construction:

Strictly B2B infrastructure.

No sanctuaries, no kids commerce.

Education:

Institutions, learning sites, field trip hosts.

Handles quote/bid/booking for institutions, not random consumers.

Experiences:

Uses trust signals (e.g., volunteers) from Community but never rebrands Kids or sanctuaries.

Arts & Culture:

Venue/gallery/event discovery.

No RFQs, no construction, no sanctuary commercialization.

Any FE cross-link between verticals must obey:

ROOTED_CORE_SYSTEM_GOVERNANCE.md

ROOTED_VERTICAL_ACCESS_CONTRACT.md

17. Pre-Commit Frontend Checklist (Mini)
Before merging any frontend change that touches:

Auth / routing

Discovery / map

Kids Mode

Seasonal knowledge streams / recipes

Billing / subscription

Admin panels

Vertical dashboards / marketplaces

You must be able to say yes to all:

Am I using handlePostLoginRouting (or that exact pattern) instead of inventing new routing?

Am I reading from canonical views (*_discovery_v1, seasonal_*_v1, kids_*_v1) instead of raw tables?

Am I using feature_flags and subscription_status to gate tools — not guessing based on tier alone?

Have I ensured Kids Mode shows no commerce, fundraising, messaging, or ads?

For any “apply / approve / notify” flow, am I using an approved RPC (or allowed insert) and not touching core tables directly?

For seasonal content, am I respecting ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md (education first, non-ads) and only exposing recipes where allowed?

If any answer is no → the change violates this contract.
