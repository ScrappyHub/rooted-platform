ROOTED — NOTIFICATIONS SYSTEM (CANONICAL)
1. Purpose
The Notifications System provides auditable, multi-channel delivery for platform events.

It currently supports:

In-app delivery
Push delivery (APNs + FCM ready)
Future email expansion
All moderation approvals, rejections, and account actions flow through this system.

2. Core Tables
notifications
Canonical Fields:

id (uuid)
user_id (uuid → auth.users.id)
type (text)
title (text)
body (text)
data (jsonb)
delivery_channel (text → in_app | push | email)
delivered (boolean)
delivered_at (timestamp)
created_at (timestamp)
user_devices
Used for push delivery.

id
user_id
platform (ios | android | web)
device_token
created_at
3. Moderation Approval Notification
Fired by:

notify_submission_approved(...)
Creates a row with:

type = submission_approved
delivery_channel = 'push'
delivered = false
Worker later sends to APNs/FCM.

4. Moderation Rejection Notification
Fired by:

notify_submission_rejected(...)
Creates:

type = submission_rejected
Includes rejection reason
Pending delivery via worker
5. Vendor & Institution Application Notifications
Action	Notification Type
Vendor Approved	vendor_application_approved
Vendor Rejected	vendor_application_rejected
Institution Approved	institution_application_approved
Institution Rejected	institution_application_rejected
All use the same notifications table.

6. Worker Delivery Flow (Push)
Worker queries:

select * from notifications where delivered = false and delivery_channel = 'push';
Worker fetches user_devices

Sends APNs or FCM

Marks:

delivered = true, delivered_at = now()
7. Security
✅ Users only read their own notifications via RLS
✅ Admins can audit delivery
✅ Service role can mark delivery

---

On every insert into public.moderation_queue with status = 'pending', system must:

Create a notifications row for at least one admin/founder user_id

OR raise a visible alert in the admin dashboard “New submissions pending”

This must respect:

RLS on notifications

---

This system is CANONICAL and required for all verticals and moderation operations.


public.is_admin() access

No direct contact to Kids accounts
