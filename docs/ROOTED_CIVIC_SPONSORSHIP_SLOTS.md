# 🟩 ROOTED — Civic Sponsorship Slots (Optional, Docs-Only)

Location: `/docs/ROOTED_CIVIC_SPONSORSHIP_SLOTS.md`  
Authority Level: Implementation Reference (Non-Law)  
Status: Optional | Founder-Controlled | Not Required For Production

> This file describes **optional** “civic sponsorship slots” that may appear on some public discovery surfaces.
> It is **not law**. Governance law lives in `/governance`.

---

## ✅ Core Principle

Civic sponsorship slots are:

- **Optional** (may be OFF forever)
- **Founder-controlled** (exist only if explicitly enabled)
- **Non-invasive** (no behavioral profiling)
- **Public-surface only** (never on sensitive or youth surfaces)
- **Non-essential** (ROOTED remains production-grade without them)

These slots are designed to support fairness and sustainability without turning ROOTED into an extractive system.

---

## 🚫 Absolute Prohibitions

Civic sponsorship slots MUST NEVER:

- Appear in **Kids Mode** surfaces
- Appear in **Teen Mode** surfaces
- Use behavioral targeting, inferred traits, or demographic profiling
- Use third-party ad networks or surveillance pixels
- Be driven by “engagement at all costs”
- Influence moderation outcomes or safety controls
- Override the discovery fairness rules

If any sponsorship implementation violates these rules, the implementation is invalid and must be removed.

---

## ✅ Allowed Categories (If Enabled)

If enabled, sponsorship slots may be limited to:

- **Local-first** sponsorships (local community organizations, local businesses)
- **Vertical-aligned** sponsorships (relevant to the current discovery context)
- **Green / sustainability-focused** sponsorships (curated and values-aligned)
- **Civic sponsorships** (libraries, parks foundations, local public-good programs)

All sponsorship categories remain subject to safety, trust, and governance constraints.

---

## 🧒 Kids & Teens: Guaranteed Exclusion

Kids are not monitored and are not treated as entities.

Therefore:

- Kids Mode and Teen Mode surfaces must be **sponsorship-free by design**
- There is no “kids ad personalization”
- There is no “teen ad personalization”
- There is no “ad performance optimization” on youth surfaces

Implementation must enforce these exclusions as early as possible (routing + API + DB views).

---

## 🧭 Placement Rules (If Enabled)

Sponsorship slots may appear ONLY on:

- Public discovery “Home” surfaces
- Public “Explore” surfaces
- Non-sensitive directory/list pages approved for public display

Sponsorship slots must NOT appear on:

- Messaging
- User account settings
- RFQs / bids / bulk marketplaces
- Volunteer registration flows
- Emergency / disaster alert flows
- Education decision flows tied to minors
- Any safety-critical or high-trust action screen

---

## 🔒 Data Minimization (Non-Invasive)

If sponsorships exist at all, analytics must be limited to:

- View counts (aggregate)
- Click counts (aggregate)
- Basic placement reporting

No cross-site tracking.  
No “shadow profiles.”  
No sensitive segmentation.

---

## ⚙️ Operational Mode

Sponsorship slots are:

- **A capability**, not a requirement
- Must be able to be toggled OFF without breaking UI, layout, or production stability
- Must degrade gracefully into “empty placeholder” or “no slot” state

ROOTED must remain stable even if:
- sponsorship inventory = 0
- sponsorship engine is OFF
- sponsorship rules change
- sponsorship features are never shipped

---

## ✅ Final Statement

Sponsorship slots are allowed only as:

- Optional sustainability tooling
- Public-surface support
- Values-aligned civic exchange

They must never compromise:
- Kids safety
- Teen safety
- Privacy
- Trust
- Governance enforcement
