✅ ROOTED — NOTIFICATIONS SYSTEM (CANONICAL)

Cross-References:

- /governance/ROOTED_PLATFORM_CONSTITUTION.md
- /governance/ROOTED_COMMUNITY_TRUST_LAW.md
- /governance/ROOTED_DATA_SOVEREIGNTY_LAW.md
- /governance/ROOTED_ACCESS_POWER_LAW.md
- /governance/ROOTED_ADMIN_GOVERNANCE.md
- /docs/Moderation_System.md
- /governance/ROOTED_KIDS_MODE_GOVERNANCE.md

---

## 1️⃣ PURPOSE

The Notifications System provides **auditable, multi-channel delivery** for all critical platform events.

It currently supports:

- ✅ In-app delivery  
- ✅ Push delivery (APNs + FCM ready)  
- 🔜 Email expansion  

All moderation approvals, rejections, and account actions flow through this system.

---

## 2️⃣ CORE TABLES

### 2.1 `public.notifications`

Canonical Fields:

- `id` (uuid)
- `user_id` (uuid → auth.users.id)
- `type` (text)
- `title` (text)
- `body` (text)
- `data` (jsonb)
- `delivery_channel` (text → in_app | push | email)
- `delivered` (boolean)
- `delivered_at` (timestamp)
- `created_at` (timestamp)

All system alerts flow through this table.

---

### 2.2 `public.user_devices`
Used only for push delivery.

Fields:

- `id`
- `user_id`
- `platform` (ios | android | web)
- `device_token`
- `created_at`

---

## 3️⃣ MODERATION APPROVAL NOTIFICATIONS

Fired by:

- `notify_submission_approved(...)`

Creates a notifications row with:

- `type` = `submission_approved`
- `delivery_channel` = `push`
- `delivered` = false

Worker later sends to APNs/FCM.

---

## 4️⃣ MODERATION REJECTION NOTIFICATIONS

Fired by:

- `notify_submission_rejected(...)`

Creates:

- `type` = `submission_rejected`
- Includes rejection reason in `data`

Queued for push delivery.

---

## 5️⃣ VENDOR & INSTITUTION APPLICATION NOTIFICATIONS

| Action | Notification Type |
|--------|-------------------|
| Vendor Approved | vendor_application_approved |
| Vendor Rejected | vendor_application_rejected |
| Institution Approved | institution_application_approved |
| Institution Rejected | institution_application_rejected |

All use the same `notifications` table.

---

## 6️⃣ WORKER DELIVERY FLOW (PUSH)

Worker queries:

```sql
select * from notifications
where delivered = false
and delivery_channel = 'push';
Then:

Fetches user_devices

Sends via APNs or FCM

Marks:

delivered = true

delivered_at = now()

7️⃣ ADMIN & SECURITY CONTROLS
✅ Users can only read their own notifications via RLS
✅ Admins can audit notification delivery
✅ Service role can mark delivery
✅ No direct notification delivery to Kids accounts
✅ All notifications respect public.is_admin() where applicable

8️⃣ MODERATION QUEUE ALERT REQUIREMENT
On every insert into:

sql
Copy code
public.moderation_queue
where status = 'pending'
The system must do one of the following:

✅ Create a notifications row for at least one admin/founder user
✅ OR raise a visible banner in the Admin UI:

“New submissions pending review”

This must respect:

RLS on notifications

public.is_admin() access

No contact to Kids Mode accounts

✅ CANONICAL STATUS
This system is:

✅ REQUIRED for all verticals
✅ REQUIRED for all moderation flows
✅ REQUIRED for all admin & account actions
✅ REQUIRED for auditability and legal traceability

If any code path bypasses:

public.notifications → it is a hard governance violation.
