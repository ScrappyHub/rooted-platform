# 🐛 ROOTED Bug Report Template (Canonical)

> Copy this into a GitHub issue and fill it out.
> If the bug touches governance, reference the law file(s) from /governance.

---

## 1. Summary

**Short title:**  
> Example: Kids Mode showing normal events on map

**Vertical (choose one):**

- [ ] Core (auth, roles, RLS, media, GEO, analytics)  
- [ ] Community  
- [ ] Construction  
- [ ] Other: __________________________

**Area / Feature:**  
> Example: directory / map / events / kids-mode / seasonal / auth / media / messaging

---

## 2. Environment

**Device:** Desktop / Mobile (brand & model if helpful)  
**OS:** Windows / macOS / iOS / Android / Linux  
**Browser / App:** Chrome / Safari / Firefox / Edge / Native app / Build tag  
**Logged-in role:** guest / community / vendor / institution / admin  
**Tier:** free / premium / premium_plus  
**Kids Mode:** on / off  

---

## 3. Steps to Reproduce

1. Go to: `_URL or screen name_`  
2. Click / tap: `_button / action_`  
3. …  
4. See problem.

Be as specific as possible (include screenshots if available).

---

## 4. Expected vs Actual

**Expected behavior:**  
> What you thought should happen (link law or design doc if relevant).

**Actual behavior:**  
> What actually happened (attach screenshots, console logs, or error messages).

---

## 5. Suspected Layer (If You Have a Guess)

Check all that might apply:

- [ ] Pure front-end (layout / state / routing)  
- [ ] Core auth / user_tiers  
- [ ] RLS / permissions  
- [ ] GEO / discovery rules  
- [ ] Storage / media  
- [ ] Moderation / notifications  
- [ ] Construction backend  
- [ ] Not sure

---

## 6. Governance Cross-References (If Applicable)

If this bug appears to violate a law, reference it:

- [ ] ROOTED_PLATFORM_CONSTITUTION.md  
- [ ] ROOTED_KIDS_MODE_GOVERNANCE.md  
- [ ] ROOTED_COMMUNITY_TRUST_LAW.md  
- [ ] ROOTED_DATA_SOVEREIGNTY_LAW.md  
- [ ] ROOTED_ACCESS_POWER_LAW.md  
- [ ] ROOTED_SANCTUARY_NONPROFIT_LAW.md  
- [ ] ROOTED_ADMIN_GOVERNANCE.md  
- [ ] ENFORCEMENT_MATRIX.md  

Add any notes:

> Example: “Kids Mode showed prices, which conflicts with Kids Mode law.”

---

## 7. Extra Notes

Logs, console errors, weird side effects, or anything else that will help:

> Paste log snippets, Supabase error codes, trace IDs, etc.

---

✅ A bug is **higher priority** if it:

- Exposes monetization to Kids Mode  
- Weakens sanctuary protections  
- Bypasses moderation  
- Leaks private data or violates data sovereignty  
- Circumvents RLS or governance enforcement
