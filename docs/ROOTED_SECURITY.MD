# SECURITY — ROOTED PLATFORM

ROOTED relies on Supabase Auth for all authentication and password handling.

Passwords are:
- ✅ Never stored in plain text
- ✅ Always hashed and salted using modern cryptographic standards
- ✅ Never visible to ROOTED developers or administrators

Additional Security Measures:
- Login rate limiting and brute-force protection are enforced at the authentication layer.
- Sensitive account metadata is protected by Row Level Security (RLS).
- All role, tier, and access changes are fully logged.
- No child, identity, billing, or compliance data is ever sold or shared.

ROOTED treats security as platform law, not a feature.
