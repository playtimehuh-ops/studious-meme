# SideStreet — Free community promotion

A small, ad-free directory where people can discover and submit small businesses, student projects, creators, and useful services. No paid placements or boosted ranking.

## Current status

- The static site is ready to deploy to Vercel or GitHub Pages.
- Search, category filters, responsive layout, and submission form are implemented.
- **Without Supabase configuration, the site is in preview mode.** Example cards are clearly marked DEMO, and submitted forms are saved only in the submitter's browser. They are not public submissions.
- Configure Supabase below to enable shared approved listings and public submission intake.

## Connect a free Supabase project

1. Create a Supabase project on the free plan.
2. Open the SQL Editor and run `supabase/schema.sql`.
3. In `index.html`, set `SUPABASE_URL` and `SUPABASE_ANON_KEY` near the top of the script using the project's **Project URL** and **publishable/anon key**.
4. Never use a service-role key in frontend code.
5. Public submissions are inserted as `pending`; only `approved` rows are publicly readable. Review submissions in Supabase Table Editor and change status to `approved` only after checking them.

## Safety and privacy

- Collect only a public listing name, category, short description, optional public website/social URL, and optional display name.
- Do not ask for passwords, ID documents, private addresses, or sensitive personal details.
- Do not publish a listing without permission from the person/business represented.
- Because public inserts are anonymous, add a CAPTCHA or a server-side rate limit before promoting the form widely. Supabase RLS prevents public users from approving/rejecting listings, but it does not fully prevent spam.
- Demo entries are examples, not real endorsements or active businesses.

## Files

- `index.html`: responsive site and client-side functionality.
- `supabase/schema.sql`: table, validation constraints, and row-level security policies.

## Deploy

Import this repository into Vercel and deploy with no build command and no output directory (static HTML). Or enable GitHub Pages from the repository's main branch/root.
