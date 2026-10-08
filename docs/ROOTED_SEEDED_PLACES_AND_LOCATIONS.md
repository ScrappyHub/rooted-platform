# ROOTED: SEEDED PLACES AND LOCATIONS (CANONICAL, 2026-10-10)

Authority level: implementation contract.

## Seeded places
- Real farms, markets and similar places loaded from open data (OpenStreetMap, public lists) into `seed_places`, never into `providers`.
- Seeded places are **never verified**. They show as "listed from public information" and carry source and license.
- An owner claims a place through the normal role-application pipeline (`seed_place_claims`); an admin with `provision` decides (`admin_seed_claim_decide_v1`). Everyone starts as a community member; vendor/institution status needs approval.
- Admin import (`admin_seed_commit_v1`): US bounds only, batches up to 2000, de-duplicated within about 200 m by normalized name, classified by `seed_category_rules`. Reports are resolved with `moderate`.
- The map reads seeded places by viewport (zoom 8 or closer, 150 pin cap).

## Business locations (`provider_locations_v1`)
Three modes, all owner/manager-only to write (`set_my_provider_location_v1`):
1. **verified**: street address checked on the map, apartment/suite in its own field.
2. **typed**: the address exactly as typed, even if the map cannot find it (pin falls back to the street or town).
3. **described**: for food stands, trucks, rural places; a description (10+ characters), nearest address or intersection, optional device location, optional "I move around".

Privacy: a business may hide its street address. The pin is then moved 200-350 m (stable offset per provider) and the public sees the area only. `get_provider_location_public_v1` returns the address only when the owner chose to show it. US bounds enforced.

## Not stored
No religion, age or similar attribute is stored (see Data Sovereignty Law). Dietary/food filters and holiday animations are browser-only.
