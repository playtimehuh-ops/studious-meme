-- Orbal core schema. Apply to a fresh Supabase project.
create extension if not exists pgcrypto;

create table if not exists public.orbal_profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default 'Orbal member',
  created_at timestamptz not null default now()
);

create table if not exists public.orbal_ledger (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  entry_type text not null check (entry_type in ('compute_revenue','platform_fee','contributor_credit','orb_conversion','adjustment')),
  amount_usd numeric(18,2) not null default 0,
  amount_orb numeric(24,8) not null default 0,
  reference_id text,
  description text not null,
  created_at timestamptz not null default now()
);

create index if not exists orbal_ledger_user_created_idx on public.orbal_ledger(user_id, created_at desc);

alter table public.orbal_profiles enable row level security;
alter table public.orbal_ledger enable row level security;

drop policy if exists "Members can read own profile" on public.orbal_profiles;
create policy "Members can read own profile" on public.orbal_profiles for select to authenticated using (auth.uid() = id);

drop policy if exists "Members can read own ledger" on public.orbal_ledger;
create policy "Members can read own ledger" on public.orbal_ledger for select to authenticated using (auth.uid() = user_id);

-- Deliberately no client INSERT/UPDATE/DELETE policies. Trusted server-side code
-- must verify provider-signed usage and apply revenue splits/conversions atomically.
revoke insert, update, delete on public.orbal_ledger from anon, authenticated;
revoke insert, update, delete on public.orbal_profiles from anon, authenticated;

create or replace function public.orbal_create_profile()
returns trigger language plpgsql security definer set search_path = public
as $$
begin
  insert into public.orbal_profiles(id, display_name)
  values (new.id, coalesce(new.raw_user_meta_data->>'display_name', 'Orbal member'))
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_orbal_user_created on auth.users;
create trigger on_orbal_user_created after insert on auth.users
for each row execute procedure public.orbal_create_profile();
