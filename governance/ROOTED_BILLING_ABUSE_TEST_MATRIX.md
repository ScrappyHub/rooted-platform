# 🔐 ROOTED — BILLING ABUSE TEST MATRIX
Purpose: Validate all financial abuse resistance before monetization activation.

This document applies to:
- Stripe
- Subscriptions
- Refunds
- Disputes
- Chargebacks
- Retries
- Downgrades
- Cancellations

---

## ✅ 1. DUPLICATE SUBSCRIPTION ATTEMPT

Test:
- Same provider attempts to subscribe twice

Expected:
✅ Second attempt blocked  
✅ No duplicate Stripe customer created  
✅ No duplicate subscription row  

---

## ✅ 2. DOWNGRADE LOCK BYPASS

Test:
- Premium Plus attempts to downgrade to Free during active cycle

Expected:
✅ Downgrade only effective at next billing cycle  
✅ Premium Plus privileges remain until expiry  

---

## ✅ 3. SANCTUARY COMMERCIAL ABUSE

Test:
- Sanctuary attempts to activate paid tier

Expected:
✅ Payment rejected  
✅ Feature flags remain locked  
✅ Audit log written  

---

## ✅ 4. REFUND FRAUD LOOP

Test:
- User refunds repeatedly and re-subscribes

Expected:
✅ Flagged in Stripe  
✅ Account restricted after threshold  
✅ Admin review required  

---

## ✅ 5. PAYMENT METHOD SWAP EXPLOIT

Test:
- User switches cards during active dispute

Expected:
✅ Stripe enforces verification  
✅ ROOTED subscription remains frozen  

---

## ✅ 6. CHARGEBACK CASCADE

Test:
- Mass chargebacks from a single provider

Expected:
✅ Account auto-frozen  
✅ All monetized tools disabled  
✅ Admin alert generated  

---

## ✅ 7. ADMIN BILLING OVERRIDE VIOLATION

Test:
- Admin attempts to force-enable paid tools

Expected:
✅ Blocked by Feature Flags  
✅ Audit record created  
✅ Admin violation escalated  

---

✅ PASSED = Monetization may go live  
❌ FAILED = Monetization must remain disabled
