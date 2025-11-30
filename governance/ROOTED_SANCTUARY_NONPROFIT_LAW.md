# 🐾 ROOTED SANCTUARY & NONPROFIT COMMERCIAL RESTRICTION LAW

Sanctuaries, rescues, and mission-only nonprofits exist for public good — not commerce.

This law is absolute and cannot be overridden by:

- Admins
- Partners
- Institutions
- Revenue strategy
- Growth targets

---

## ❌ COMMERCIAL PROHIBITIONS

Sanctuary & nonprofit entities may **never** access:

- Bid marketplaces
- Bulk marketplaces
- Institutional procurement
- Paid vendor tools
- Sponsored promotion tiers

---

## ✅ ALLOWED FEATURES

They may access:

- Public discovery
- Mission profiles
- Volunteer-only events
- Educational programming surfaces
- Donation visibility (if enabled)
- Seasonal & cultural discovery

---

## 🧒 CHILD SAFETY PRIORITY

All sanctuary surfaces:

- Must default to kids-safe visibility
- Must disable commercial linking
- Must pass full moderation
- May never be monetized through ads or platform extraction

---

## 🧾 STRUCTURAL ENFORCEMENT

This law is enforced via:

- `provider_type = 'sanctuary'`
- `provider_specialty = 'noncommercial'`
- Feature flag hard false:
  - can_use_bid_marketplace
  - can_use_bulk_marketplace
- RLS hard denial on:
  - bids
  - bulk_offers
  - rfqs

UI bypass attempts are invalid and ignored by the database.

---

## 🚨 VIOLATIONS

If a sanctuary is ever granted commercial tools:

- Immediate revoke
- Forced audit
- Admin privilege review
- Possible permanent removal from the platform
