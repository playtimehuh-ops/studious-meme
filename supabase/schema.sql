-- SideStreet public listings. Run in Supabase SQL Editor.
create extension if not exists pgcrypto;

create table if not exists public.listings (
  id uuid primary key default gen_random_uuid(),
  name text not null check (char_length(trim(name)) between 2 and 60),
  category text not null check (category in ('Food & drink','Art & handmade','Services','Student projects','Digital & tech','Other')),
  description text not null check (char_length(trim(description)) between 10 and 240),
  contact text check (contact is null or (char_length(contact) <= 200 and contact ~* '^https?://')),
  submitter text check (submitter is null or char_length(submitter) <= 40),
  status text not null default 'pending' check (status in ('pending','approved','rejected')),
  created_at timestamptz not null default now()
);

alter table public.listings enable row level security;

-- Anyone can view only approved public listings.
drop policy if exists "Anyone can read approved listings" on public.listings;
create policy "Anyone can read approved listings"
on public.listings for select
to anon, authenticated
using (status = 'approved');

-- Anyone may submit a listing, but new submissions are always pending.
drop policy if exists "Anyone can submit pending listings" on public.listings;
create policy "Anyone can submit pending listings"
on public.listings for insert
to anon, authenticated
with check (status = 'pending');

-- Intentionally no public UPDATE or DELETE policies.
-- Review/moderate from Supabase Dashboard as project owner.
grant select, insert on public.listings to anon, authenticated;
