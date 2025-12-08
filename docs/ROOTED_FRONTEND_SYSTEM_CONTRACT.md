# 🌱 ROOTED — FRONTEND SYSTEM CONTRACT (CANONICAL)

File: /governance/ROOTED_FRONTEND_SYSTEM_CONTRACT.md  
Authority Level: IMPLEMENTATION-BINDING (below Governance Index & Core System)  

If this contract and any governance law disagree →  
**GOVERNANCE WINS. THIS FILE MUST BE UPDATED.**

---

## 0. Cross-References (MUST FOLLOW)

- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`
- `/governance/ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md`
- `/governance/ROOTED_GOVERNANCE_INDEX.md`
- `/governance/ROOTED_CORE_SYSTEM_GOVERNANCE.md`
- `/governance/ROOTED_VERTICAL_ACCESS_CONTRACT.md`
- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`
- `/governance/ROOTED_ACCESS_POWER_LAW.md`
- `/governance/ROOTED_DATA_SOVEREIGNTY_LAW.md`
- `/governance/ROOTED_COMMUNITY_TRUST_LAW.md`
- `/governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md`
- `/governance/ROOTED_ADMIN_GOVERNANCE.md`
- `/governance/ROOTED_ACCOUNT_GOVERNANCE_LAW.md`

Implementation references:

- `/docs/ROOTED_MASTER_DEBUG_TOOLKIT.md`
- `/docs/ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md`
- Vertical-specific UI / FE contracts (Community, Education, Construction, Experiences, Arts & Culture)

---

## 1. Scope & Philosophy

1. The frontend is a **read-only projection** of ROOTED’s governed database and law.  
2. The frontend:
   - ❌ Never invents roles, tiers, or feature flags  
   - ❌ Never bypasses RLS  
   - ❌ Never writes directly to critical tables when an RPC exists  
3. Every screen and component is constrained by:
   - **Role** (community, vendor, institution, admin, sanctuary)  
   - **Tier** (free, premium, premium_plus)  
   - **Feature flags** (`feature_flags` JSONB from `user_tiers`)  
   - **Vertical access** (Community, Education, Construction, Experiences, Arts & Culture)

> If the UI and the database ever disagree about power or access →  
> **the database and governance are correct; the UI is a bug.**

---

## 2. Stack & Client Contract

### 2.1 Supabase Client

The frontend uses a **single shared Supabase client**:

- Env vars (in `.env` and Vercel):
  - `VITE_SUPABASE_URL`
  - `VITE_SUPABASE_ANON_KEY`

Contract:

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
✅ The frontend only uses the anon key.

❌ The frontend never uses the service role key.

3. Identity, Roles, Tiers & Routing
The frontend must treat one ROOTED account per human (one auth.users row), and must never create shadow identities.

3.1 Canonical “Who Am I?” RPC
All role/tier/feature logic comes from one RPC:

rpc('get_my_role_and_tier') → { role, tier, feature_flags }

Contract:

ts
Copy code
export async function handlePostLoginRouting(supabase, goTo) {
  const { data: { user }, error: userError } = await supabase.auth.getUser();
  if (userError || !user) {
    return goTo('/login');
  }

  const { data: roleInfo, error: roleError } = await supabase
    .rpc('get_my_role_and_tier')
    .single();

  if (roleError || !roleInfo) {
    return goTo('/community/home');
  }

  const { role, tier, feature_flags } = roleInfo;
  const isKidsMode = !!feature_flags?.is_kids_mode;

  if (role === 'admin') {
    return goTo('/admin/dashboard');
  }

  if (role === 'vendor') {
    if (tier === 'premium_plus') return goTo('/vendor/premium-plus-dashboard');
    if (tier === 'premium')      return goTo('/vendor/premium-dashboard');
    return goTo('/vendor/free-dashboard');
  }

  if (role === 'institution') {
    if (tier === 'premium_plus') return goTo('/institution/premium-plus-dashboard');
    if (tier === 'premium')      return goTo('/institution/premium-dashboard');
    return goTo('/institution/free-dashboard');
  }

  // Community
  if (isKidsMode) return goTo('/community/kids-mode');
  return goTo('/community/home');
}
Rules:

✅ This helper is the only post-login routing entrypoint.

✅ It must be reused for web, mobile, and any future FE surface.

❌ No screen may hard-code routing by guessing role/tier directly from user_tiers without this RPC.

4. Feature Flags & Tier Inheritance (5-Tier Market Logic)
Feature flags are the only source of truth for capabilities like:

can_use_bulk_marketplace

can_use_bid_marketplace

can_view_basic_analytics

can_view_advanced_analytics

vertical_community_access

vertical_education_access

vertical_construction_access

vertical_experiences_access

vertical_arts_culture_access

is_kids_mode

4.1 Tier Inheritance Rules (UI-side)
Premium = Free plus extra tools.

Premium Plus = Premium plus extra tools.

Institutions mirror vendor tier behavior for allowed features.

Example canonical usage in UI:

ts
Copy code
function VendorDashboard({ roleInfo }) {
  const { feature_flags } = roleInfo;

  const canUseBulkMarketplace    = !!feature_flags?.can_use_bulk_marketplace;
  const canUseBidMarketplace     = !!feature_flags?.can_use_bid_marketplace;
  const canViewBasicAnalytics    = !!feature_flags?.can_view_basic_analytics;
  const canViewAdvancedAnalytics = !!feature_flags?.can_view_advanced_analytics;

  return (
    <>
      {/* Always: profile, media, core info */}

      {canUseBulkMarketplace && <BulkMarketplaceSection />}
      {canUseBidMarketplace && <BidMarketplaceSection />}
      {canViewBasicAnalytics && <BasicAnalyticsPanel />}
      {canViewAdvancedAnalytics && <AdvancedAnalyticsPanel />}
    </>
  );
}
The UI must never:

Hard-code “if tier === 'premium_plus' then show X” without checking flags.

Create new flags that do not exist in the backend.

5. Data Access Rules (Views vs Tables vs RPCs)
5.1 Discovery & Public Maps (Read-Only Views)
The frontend must use read-only discovery views for public surfaces.

Examples (exact names may vary by vertical):

Community:

community_providers_discovery_v1

providers_discovery_v1

seasonal_featured_providers_v1

events_discovery_v1

landmarks_discovery_v1

Education:

education_providers_discovery_v1

education_trips_discovery_v1

Construction:

construction_providers_discovery_v1

Experiences:

experiences_discovery_v1

Arts & Culture:

arts_culture_venues_discovery_v1

Contract:

ts
Copy code
// ✅ Correct: discovery list
const { data, error } = await supabase
  .from('providers_discovery_v1')
  .select('*');

// ❌ Forbidden: direct public discovery from base table
// const { data, error } = await supabase
//   .from('providers')
//   .select('*');
The views already enforce:

is_discoverable

Active user_tiers

Non-deprecated providers

Role constraints (where applicable)

The frontend must not re-implement trust law in JS.

5.2 Seasonal Featured Providers
For “featured this season”:

ts
Copy code
const { data, error } = await supabase
  .from('seasonal_featured_providers_v1')
  .select('*')
  .order('seasonal_score', { ascending: false });
UI may:

Render seasonal badges and carousels.

❌ Never manually override seasonal ordering using base tables.

5.3 RPCs for Writes (No Direct Inserts Where RPC Exists)
All structured submissions use RPCs, not direct inserts, when a canonical RPC exists:

submit_vendor_application

submit_institution_application

upsert_provider_context

upsert_event_context

upsert_experience_context

notify_submission_approved

Any vertical-specific “submit_*_request” RPCs

Contract example:

ts
Copy code
// ✅ Correct
await supabase.rpc('submit_vendor_application', {
  /* application payload */
});

// ❌ Forbidden
// await supabase.from('vendors').insert({ ... });
RPCs encapsulate:

Moderation rules

Status transitions

Audit logging

Role/tier checks

6. Kids Mode UI Enforcement
Kids Mode behavior is governed by /governance/ROOTED_KIDS_MODE_GOVERNANCE.md.

Frontend contract:

Kids Mode screens must not show:

Pricing

RFQs

Bids

Bulk markets

Donations / fundraising flows

Direct messaging

Analytics

Kids Mode may show:

Educational content (farms, nature, animals, environment, community)

Calm seasonal discovery

Safety explanations in age-appropriate language

Implementation pattern:

ts
Copy code
if (isKidsMode) {
  // Render only Kids-safe components
  return <KidsHome />;
}

// Otherwise, normal community or other vertical home
No component serving Kids Mode may:

Call RFQ/Bid/Bulk RPCs.

Show marketplace CTAs.

7. 2FA Enforcement (Admin & Institutions)
Security requirements are defined in:

/governance/ROOTED_ADMIN_GOVERNANCE.md

/governance/ROOTED_ACCOUNT_GOVERNANCE_LAW.md

Frontend contract:

After resolving roleInfo:

ts
Copy code
const requiresStrongSecurity =
  roleInfo.role === 'admin' || roleInfo.role === 'institution';

if (requiresStrongSecurity && !roleInfo.feature_flags?.has_2fa_enabled) {
  return goTo('/security/setup-2fa');
}
Backend mirrors this requirement in RPCs and RLS.
Frontend is not the only guard, it is the first UX guard.

8. Billing / Stripe Contract (Frontend)
The frontend:

❌ Does not ever call Stripe directly.

✅ Reads only provider.subscription_status (and any feature flags derived from it).

Contract:

ts
Copy code
const isSubscribed =
  provider.subscription_status === 'active' ||
  provider.subscription_status === 'trialing';

if (!isSubscribed) {
  // show “upgrade / locked” UI
} else {
  // show premium / premium-plus tools, still filtered by feature_flags
}
Stripe webhooks → update backing tables / feature flags.

UI only reacts to those values; it does not talk to Stripe.

9. Media Uploads & Storage Rules
Media is handled through governed tables (vendor_media, provider_media, etc.) with RLS.

Canonical pattern:

ts
Copy code
const { data: { user } } = await supabase.auth.getUser();

// ✅ owner_user_id must always be user.id
await supabase
  .from('vendor_media')
  .insert({
    owner_user_id: user.id,
    storage_bucket: 'rooted-public-media',
    storage_path: 'vendors/1234/profile-banner.jpg',
    media_type: 'image',
    visibility: 'public',
  });
Rules:

❌ No arbitrary owner_user_id.

❌ No UI-level ability to impersonate another user.

✅ All paths must respect the bucket and pattern defined by backend governance.

10. Notifications Contract
Notifications are created by backend logic or approved RPCs.

Frontend contract:

Read: notifications (with RLS limiting to current user).

Write: only via approved RPCs, e.g.:

ts
Copy code
await supabase.rpc('notify_submission_approved', {
  target_user: userId,
  entity_type: 'event',      // or provider, experience, etc.
  entity_id: eventId,
  entity_title: 'Farm to Table Concert',
});
Frontend never:

Inserts directly to notifications for governance-critical flows.

Deletes notifications without using authorized endpoints.

11. Weather & Vertical Conditions Widgets
Weather snapshots are computed in backend (weather_snapshots, vertical_conditions_v1) and surfaced as simple UI text.

Canonical helper:

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

export async function fetchVerticalConditions(supabase: any, vertical: Vertical) {
  const { data, error } = await supabase
    .from('vertical_conditions_v1')
    .select('*')
    .eq('vertical', vertical)
    .single();

  if (error || !data) return null;
  return data as VerticalConditions;
}
Usage example (Construction top nav):

tsx
Copy code
const [conditions, setConditions] = useState<VerticalConditions | null>(null);

useEffect(() => {
  (async () => {
    const data = await fetchVerticalConditions(supabase, 'construction');
    setConditions(data);
  })();
}, [supabase]);
Each vertical uses the same view, but different wording in the UI:

Community → “Local Conditions”

Education → “Trip Conditions”

Construction → “Jobsite Conditions”

Experiences → “Trail & Activity Conditions”

Arts & Culture → “Show Conditions”

Frontend never calls external weather APIs directly; it trusts the backend.

12. Figma / Design AI Contract
Figma exports must respect backend reality.

Every screen/component must declare:

Data Source:

Table OR View name

RPC: (if submitting or mutating)

Feature Flags Required: (if gated)

Role: (who can see it)

Vertical: (community, education, construction, experiences, arts_culture)

If a screen cannot name:

The view/table it reads from

The RPC it writes through (if any)

The role & tier

The vertical

→ it cannot ship.

Discovery screens must use discovery views (per vertical).
Kids Mode screens must reference Kids governance doc.
Sanctuary screens must reference Sanctuary Nonprofit law.

13. Vertical Boundaries (No Knowledge Spillage)
The frontend contract obeys:

Sanctuaries & rescues only live in Community’s discovery domain.

Education:

Discovers institutions, field trip hosts, learning sites.

Does not treat sanctuaries as commercial entities (still under sanctuary law).

Construction:

Is strictly B2B for infrastructure; no sanctuaries here.

Experiences:

Uses Community history (e.g., trusted volunteers) when inviting people into experience creation, but does not rebrand Kids or sanctuaries.

Arts & Culture:

Directory + experiences around venues & culture.

No construction, no RFQs, no sanctuaries as commercial users.

Any UI that cross-links verticals must:

Respect /governance/ROOTED_CORE_SYSTEM_GOVERNANCE.md

Respect /governance/ROOTED_VERTICAL_ACCESS_CONTRACT.md

14. Change Control
Any frontend change that:

Alters role routing logic

Changes how feature flags are interpreted

Touches Kids Mode behavior

Changes how discovery views are used

Surfaces new marketplace tools in any vertical

…MUST:

Be checked against:

Governance Index

Core System Governance

Vertical Access Contract

Be tested against:

ROOTED_MASTER_DEBUG_TOOLKIT.md

ROOTED_FULL_SYSTEM_DEBUG_GUIDE.md

If a proposed change conflicts with governance → it is not allowed.
