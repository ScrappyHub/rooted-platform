🧩 ROOTED — FRONTEND PLATFORM CONTRACT (CANONICAL)

Authority Level: Binding Engineering Contract
Applies To: All frontend / edge / app code for ROOTED Community + future verticals
Enforcement Chain:
Governance → Database (RLS, Views, RPCs) → Admin RPCs → Frontend

This document defines how frontend code is legally required to behave in ROOTED.

If a frontend implementation conflicts with this file,
➡ the implementation is invalid, even if it “works.”

Cross-References:

ROOTED_PLATFORM_CONSTITUTION.md

ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md

ROOTED_ACCESS_POWER_LAW.md

ROOTED_KIDS_MODE_GOVERNANCE.md

ROOTED_DATA_SOVEREIGNTY_LAW.md

ROOTED_COMMUNITY_TRUST_LAW.md

ROOTED_SANCTUARY_NONPROFIT_LAW.md

ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md

ROOTED_ADMIN_GOVERNANCE.md

ROOTED_ACCOUNT_GOVERNANCE_LAW.md

1. Core Principles (Frontend Must Obey)

Frontend is display-only, not authority.

All real power lives in:

Governance + SQL

RLS + Views

Feature flags

Admin RPCs

Frontend never:

Bypasses RLS

Writes directly to core tables that affect power, trust, or money

Recreates business rules that already live in views / RPCs

You are wiring UI to the law — not re-implementing it.

2. Canonical Auth + Role/Tier Fetch

After any successful login, you MUST fetch the user’s ROOTED identity via a single RPC, not ad-hoc table reads.

import { createClient } from '@supabase/supabase-js';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

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

  const isKidsMode              = !!feature_flags?.is_kids_mode;
  const canUseBulkMarketplace   = !!feature_flags?.can_use_bulk_marketplace;
  const canUseBidMarketplace    = !!feature_flags?.can_use_bid_marketplace;
  const canViewBasicAnalytics   = !!feature_flags?.can_view_basic_analytics;
  const canViewAdvancedAnalytics= !!feature_flags?.can_view_advanced_analytics;

  // 3) Enforce 2FA for high-power roles (see §3)
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

// after successful login:
await handlePostLoginRouting(goTo);


This helper is the only allowed routing entrypoint.

3. 2FA Enforcement (Admins & Institutions)

In alignment with ROOTED_ADMIN_GOVERNANCE.md and ROOTED_ACCESS_POWER_LAW.md:

Admin and Institution roles must not access dashboards without 2FA.

Frontend UX must redirect them to /security/setup-2fa if has_2fa === false.

Backend admin RPCs must also enforce has_2fa = true (not handled here, but assumed).

Frontend rule (already embedded in handlePostLoginRouting):

If role in ('admin', 'institution') AND !has_2fa → route to /security/setup-2fa and block further access.

4. Subscription State: How UI Checks Billing

Frontend must never speak to Stripe directly.

Premium / Premium Plus access is derived from:

provider.subscription_status === 'active' ||
provider.subscription_status === 'trialing'


Everything else is treated as “no premium access”:

const hasPremium =
  provider.subscription_status === 'active' ||
  provider.subscription_status === 'trialing';

if (!hasPremium) {
  // show upgrade UI / lock icons / disabled states
}


Stripe is handled in backend webhooks; frontend only reads normalized fields:

provider.subscription_status

user_tiers.tier

user_tiers.feature_flags.*

This aligns with ROOTED_BILLING_ABUSE_TEST_MATRIX.md and prevents billing exploit attempts.

5. Feature Flags → UI Capabilities

Frontend must never hard-code tier → feature mappings.
It must read feature_flags and let the DB decide.

Example in a vendor dashboard:

type RoleInfo = {
  role: string;
  tier: string;
  feature_flags: Record<string, boolean>;
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


Backend (laws) defines what flags each tier gets.
Frontend just reads flags, it never guesses.

6. Discovery & Map Contract (Views Only)

Per ROOTED_COMMUNITY_TRUST_LAW.md and the Stop Layer, public discovery must only use canonical views.

6.1 Directory & Map Lists

Use:

public.providers_discovery_v1 for:

directory lists

search results

map pins

Never query providers directly for public discovery.

const { data, error } = await supabase
  .from('providers_discovery_v1')
  .select('*');


Frontend may apply only:

search term filters (name, city, etc.)

category filters (farm, market, bakery, etc.)

client-side distance filters (or via a safe RPC)

Frontend must not:

recheck moderation status

recheck is_discoverable

recheck is_active

The view already enforces those.

6.2 Seasonal “Featured This Season”

Use:

public.seasonal_featured_providers_v1 ordered by seasonal_score DESC

const { data, error } = await supabase
  .from('seasonal_featured_providers_v1')
  .select('*')
  .order('seasonal_score', { ascending: false });

// Use top 6–8 as featured carousel
const featured = (data ?? []).slice(0, 8);


UI rules:

No manual pinning above these results.

No direct use of providers to “boost” anyone.

Visual badges like “In Season” are purely UI labels; they do not change data.

7. Kids Mode — Frontend Behavior

Per ROOTED_KIDS_MODE_GOVERNANCE.md and the Constitution:

Kids Mode is a safety sandbox, not a theme.

Frontend must never expose:

pricing

booking

fundraising

RFQs/bids

messaging

ads

7.1 Routing

If feature_flags.is_kids_mode === true, community user must route into:

goTo('/community/kids-mode');


Kids Mode screens:

show only kids-safe content from kids-safe views (e.g. kids_safe_events_v1, kids_landmarks_v1, kids_seasonal_v1).

never show call-to-action for commerce.

7.2 UI Rules

In Kids Mode:

Hide all:

“Book now”

“Donate”

“Buy tickets”

“Subscribe”

“Become a member”

Show only:

educational text

safe photos / videos

nature / agriculture / culture (non-political, non-proselytizing)

kids-safe crafts and seasonal items

Any new Kids Mode screen must be checked against:

ROOTED_KIDS_MODE_GOVERNANCE.md

ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md

8. Seasonal Knowledge Streams — Frontend Contract

Per ROOTED_SEASONAL_KNOWLEDGE_STREAMS_LAW.md:

8.1 Education Only (Produce, Seeds, Crafts)

Frontend reads from seasonal views, e.g.:

seasonal_current_month_v1 (public education)

kids_seasonal_v1 (kids-safe subset)

UI MUST:

Show education only:

what’s in season

storage tips

planting guidance

crafts how-tos

Never show:

product links

carts

vendor ranking

sponsored placement

8.2 Recipes (Premium Plus Only)

Recipes are the only monetized seasonal layer:

Rules for UI:

Check both:

user role/tier/flags (Premium Plus)

backend view for recipes (seasonal_recipes_v1 or similar)

Show lock icon / upgrade UI if not Premium Plus.

Never show recipes in Kids Mode, except:

safe, education-only snippets explicitly approved.

No user-specific food profiling, tracking, or diet targeting is allowed.

9. Applications & Submissions (RPC-Only)

All “apply” flows must call RPCs, never insert directly into core tables.

Examples:

// Apply as vendor
await supabase.rpc('submit_vendor_application', {
  /* form payload */
});

// Apply as institution
await supabase.rpc('submit_institution_application', {
  /* form payload */
});


Frontend must not call:

.from('providers').insert(...)
.from('institutions').insert(...)


Those tables are governed by admin / moderation pipelines.

10. Notifications & Moderation Events

Approvals, rejections, and system messages use a notification RPC or direct insert into notifications (if allowed by RLS).

Canonical pattern:

await supabase.rpc('notify_submission_approved', {
  target_user: userId,
  entity_type: 'event',
  entity_id: eventId,
  entity_title: 'Farm to Table Concert',
});


or, where direct insert is allowed:

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


UI shows notifications read-only; it never bypasses moderation or approval logic.

11. Media Uploads — Safe Pattern

All media uploads must:

Use the logged-in user’s ID as owner_user_id.

Use a valid provider / entity ID the backend will accept.

Respect whatever RLS requires (e.g., they must own that provider).

Example:

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


Frontend must never set owner_user_id to anything other than user.id.

12. Vendor / Institution Dashboards — Gating

Inside vendor/institution dashboards, every advanced section must be gated by feature flags and subscription status together.

Example:

const hasPremium =
  provider.subscription_status === 'active' ||
  provider.subscription_status === 'trialing';

if (role === 'vendor') {
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
}


If either the feature flag or subscription state says “no,” the UI must treat it as locked.

13. Pre-Commit Frontend Checklist (Mini)

Before merging any frontend change that touches:

auth

routing

discovery

kids mode

seasonal

billing

admin panels

You MUST be able to answer “yes” to:

Am I using handlePostLoginRouting (or equivalent) instead of inventing new routing logic?

Am I reading from canonical views (providers_discovery_v1, seasonal_featured_providers_v1, kids-safe views) instead of raw tables?

Am I using feature_flags and subscription_status to gate features — not hard-coded tiers?

Have I ensured Kids Mode surfaces no commerce, no messaging, no fundraising, no ads?

For any application / approval / notification flow, am I using an approved RPC (or allowed insert) instead of touching core tables directly?

If any answer is “no” → the change violates this contract.
