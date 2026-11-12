# Orbal

Orbal is a cross-platform compute-contribution and internal rewards prototype.

## Repository layout
- `apps/orbal_flutter/` — Android, iOS, Windows and Linux client (Flutter).
- `extensions/browser/` — separate Chrome/Edge Manifest V3 companion.
- `supabase/migrations/` — database schema and row-level security.
- `.github/workflows/` — Flutter analysis and test checks.

## Current prototype status
- The Flutter client has a dashboard, compute status, ORB wallet and settings.
- The browser extension is a companion status panel; it does not mine, use CPU/RAM, or run background workloads.
- Compute provider integration is **not connected**. No real compute jobs, revenue, payouts or ORB issuance occur in this prototype.
- The 50/50 split and $10-to-1-ORB conversion are displayed as proposed accounting rules, not guaranteed cash value or market price.
- The database schema is prepared for authenticated profiles and an auditable ledger. Sensitive ledger writes must be performed by trusted server-side code after a provider has verified revenue.

## Run the Flutter app
Install Flutter, then:
```sh
cd apps/orbal_flutter
flutter create . --platforms=android,ios,windows,linux
flutter pub get
flutter analyze
flutter test
flutter run
```

For Supabase, apply `supabase/migrations/0001_orbal_core.sql` to a new project. Configure the app at build time:
```sh
flutter run --dart-define=SUPABASE_URL=https://YOUR_PROJECT.supabase.co --dart-define=SUPABASE_ANON_KEY=YOUR_PUBLIC_ANON_KEY
```
Never put a Supabase service-role key in a client app or browser extension.

## Browser extension
Open Chrome/Edge extensions, enable Developer mode, choose **Load unpacked**, and select `extensions/browser`. It only displays connection status and links to the Orbal app.

## Important before real compute
A provider partnership and permission for the intended commercial/resale model are required. Before enabling workloads, implement explicit opt-in, resource caps, pause/stop controls, workload isolation, abuse prevention, provider-reported usage verification, and transparent contributor revenue statements. Do not execute arbitrary customer code on contributor devices.

## Accounting proposal
For each verified customer payment:
- 50% platform share.
- 50% contributor share.
- When the contributor's available share reaches USD 10, the ledger may convert USD 10 into 1 ORB and debit the corresponding USD amount exactly once.
- ORB is an internal unit in this prototype. It has no guaranteed USD value, cash redemption, exchange listing, or external transfer capability.
