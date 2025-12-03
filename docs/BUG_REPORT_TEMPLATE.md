# ROOTED Bug Report Template

Copy this into a GitHub issue and fill it out.

---

## 1. Summary

**Short title:**  
_Example: Kids Mode showing normal events on map_

**Vertical:**

- [ ] Core  
- [ ] Community  
- [ ] Construction  
- [ ] Other: `____________`

**Area (screen / feature):**  
_Example: directory / map / events / kids-mode / seasonal / auth / media_

---

## 2. Environment

- **Device:** Desktop / Mobile (brand & model if helpful)  
- **OS:** Windows / macOS / iOS / Android / Linux  
- **Browser / App:** Chrome / Safari / Edge / App build tag  
- **Logged-in role:** guest / community / vendor / institution / admin  
- **Tier:** free / premium / premium_plus  
- **Kids Mode:** on / off  

---

## 3. Steps to Reproduce

1. Go to: `_URL or screen name_`  
2. Click / tap: `_button / action_`  
3. …  
4. See problem.

---

## 4. Expected vs Actual

**Expected:**  
_What you thought should happen (one or two sentences)._

**Actual:**  
_What actually happened (include screenshots or screen recording if possible)._

---

## 5. Suspected Layer (if you have a guess)

- [ ] Pure front-end (layout / state / routing)  
- [ ] Auth / `user_tiers` / feature_flags  
- [ ] RLS / permissions / policies  
- [ ] GEO / discovery rules / maps  
- [ ] Storage / media / uploads  
- [ ] Moderation / notifications  
- [ ] Construction backend  
- [ ] Not sure  

---

## 6. Governance / Law Impact (if known)

Does this bug **appear to violate or weaken** any platform law?

- [ ] Kids Mode safety (children see something they shouldn’t)  
- [ ] Data sovereignty / privacy  
- [ ] Anti-profiling / anti-discrimination  
- [ ] Sanctuary / nonprofit protections  
- [ ] Admin access / power limits  
- [ ] Community trust / moderation rules  
- [ ] Seasonal / holiday consent rules  
- [ ] Billing / subscription safety  
- [ ] Not sure  

If yes, list any files you believe are involved:

- `/governance/ROOTED_PLATFORM_CONSTITUTION.md`  
- `/governance/ROOTED_CONSTITUTIONAL_LEGAL_STOP_LAYER.md`  
- `/governance/ROOTED_KIDS_MODE_GOVERNANCE.md`  
- `/governance/ROOTED_DATA_SOVEREIGNTY_LAW.md`  
- `/governance/ROOTED_COMMUNITY_TRUST_LAW.md`  
- `/governance/ROOTED_ACCESS_POWER_LAW.md`  
- `/governance/ROOTED_SANCTUARY_NONPROFIT_LAW.md`  
- `/governance/ROOTED_ACCOUNT_GOVERNANCE_LAW.md`  
- `/governance/ROOTED_ADMIN_GOVERNANCE.md`  
- `/governance/ENFORCEMENT_MATRIX.md`  

_(Check or reference only the ones that seem relevant.)_

---

## 7. Extra Notes

Logs, console errors, weird side effects, or anything else that will help:

```text
Paste console logs, error IDs, Supabase error messages, etc. here.
