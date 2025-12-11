# 🧠 ROOTED — ACCOUNT GOVERNANCE LAW
Authority Level: Absolute Platform Law  
Enforcement: Constitution → Stop Layer → Database → Admin RPCs → UI  
Effective Date: First Public Launch  

Cross-References:
→ ROOTED_PLATFORM_CONSTITUTION.md  
→ ROOTED_STOP_LAYER.md  
→ ROOTED_ADMIN_GOVERNANCE.md  

---

## ✅ SOLE SOURCE OF TRUTH

The ONLY legal authority for account state is:

public.user_tiers

Fields:

- role
- tier
- account_status
- feature_flags

---

## ✅ ADMIN AUDIT LAW

All privileged changes MUST be logged to:

public.user_admin_actions

---

🔒 FOUNDING PROVIDER ECONOMIC ENTITLEMENT LAW (CANONICAL)

§1 — Definition
A Founding Provider is the first provider account ever created in the ROOTED system whose provider row is assigned a valid primary_vertical.

§2 — Immutable Status
The Founding Provider receives a non-revocable, lifetime economic entitlement consisting of:

Lifetime Premium Tier (cannot be downgraded)

Permanent 50% discount on any upgrade to Premium Plus

A Founders Badge displaying publicly on their provider profile

Internal is_founding_member = true written to their provider record

§3 — Authority Chain

This badge may not be granted manually by admins.

No table, RPC, or UI may modify or delete the founding privilege.

Only the Founding Provider Enrollment Trigger may assign it, and only once.

§4 — Economics Law Enforcement
Billing systems, edge functions, and upgrade flows must always read:

providers.is_founding_member = true
OR

user_tiers.feature_flags->>'founding_member' = 'true'

to determine:

Free Premium tier forever

Discounted Premium Plus rate

§5 — Non-transferability
The founding status cannot be transferred, sold, inherited, or applied to any other provider account.

§6 — Registry
The founding provider’s UUID must be permanently registered in:

ROOTED_FOUNDER_PROTECTION_AND_SUCCESSION.md

---

## ✅ LEGAL DELETION PIPELINE

ALL deletions must route through:

public.account_deletion_requests

❌ No hard deletes  
❌ No monetization blocking deletion  
❌ No silent account erasure  

---

## ❌ PROHIBITIONS

❌ No direct SQL role edits  
❌ No manual tier bypass  
❌ No silent feature injections  
❌ No monetization overrides  

---

Accounts are governed by LAW, not convenience.

