-- ══════════════════════════════════════════════════════════════
-- THREATFORGE by BCyberaware — Supabase Database Setup
-- Run this in: Supabase Dashboard → SQL Editor → New Query
-- ══════════════════════════════════════════════════════════════

-- 1. Create reports table
create table if not exists public.reports (
  id            uuid      default gen_random_uuid() primary key,
  user_id       uuid      references auth.users(id) on delete cascade not null,
  project_name  text      not null,
  project_type  text,
  classification text,
  team          text,
  hld_text      text,
  lld_text      text,
  report_data   jsonb,
  risk_score    integer   default 0,
  risk_level    text      default 'LOW',
  vuln_count    integer   default 0,
  created_at    timestamptz default now(),
  updated_at    timestamptz default now()
);

-- 2. Create profiles table (stores display name, plan)
create table if not exists public.profiles (
  id          uuid primary key references auth.users(id) on delete cascade,
  full_name   text,
  company     text,
  plan        text default 'free',
  reports_this_month integer default 0,
  last_reset  date default current_date,
  created_at  timestamptz default now()
);

-- 3. Enable Row Level Security (users only see THEIR data)
alter table public.reports  enable row level security;
alter table public.profiles enable row level security;

-- 4. RLS Policies for reports
create policy "Users can view own reports"
  on public.reports for select
  using (auth.uid() = user_id);

create policy "Users can insert own reports"
  on public.reports for insert
  with check (auth.uid() = user_id);

create policy "Users can update own reports"
  on public.reports for update
  using (auth.uid() = user_id);

create policy "Users can delete own reports"
  on public.reports for delete
  using (auth.uid() = user_id);

-- 5. RLS Policies for profiles
create policy "Users can view own profile"
  on public.profiles for select
  using (auth.uid() = id);

create policy "Users can update own profile"
  on public.profiles for update
  using (auth.uid() = id);

create policy "Users can insert own profile"
  on public.profiles for insert
  with check (auth.uid() = id);

-- 6. Auto-create profile when user signs up
create or replace function public.handle_new_user()
returns trigger as $$
begin
  insert into public.profiles (id, full_name)
  values (new.id, new.raw_user_meta_data->>'full_name');
  return new;
end;
$$ language plpgsql security definer;

create or replace trigger on_auth_user_created
  after insert on auth.users
  for each row execute procedure public.handle_new_user();

-- 7. Auto-update updated_at on reports
create or replace function update_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create trigger reports_updated_at
  before update on public.reports
  for each row execute procedure update_updated_at();
