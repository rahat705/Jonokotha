-- Jonokotha Supabase schema (run in Supabase SQL Editor)
-- This schema is a starter, not a complete moderation/legal compliance system.
create extension if not exists pgcrypto;

create table if not exists public.reports (
  id uuid primary key default gen_random_uuid(),
  category text not null check (category in (
    'রাস্তা ও পরিবহন','বিদ্যুৎ ও জ্বালানি','পানি ও পয়ঃনিষ্কাশন','স্বাস্থ্যসেবা',
    'শিক্ষা','নাগরিক সেবা','দুর্নীতি ও অনিয়ম','পরিবেশ ও বর্জ্য',
    'ভোক্তা অধিকার','নিরাপত্তা ও হয়রানি','অন্যান্য'
  )),
  title text not null check (char_length(title) between 4 and 110),
  division text not null,
  district text not null,
  location text not null,
  details text not null check (char_length(details) between 20 and 2500),
  anonymous boolean not null default true,
  display_name text,
  incident_date date,
  created_at timestamptz not null default now(),
  support_count integer not null default 0 check (support_count >= 0),
  status text not null default 'নতুন রিপোর্ট' check (status in ('নতুন রিপোর্ট','পর্যালোচনার অপেক্ষায়','পর্যালোচিত'))
);

alter table public.reports enable row level security;

-- Anyone can read reports that have been published.
create policy "Public can read reports"
on public.reports for select
to anon, authenticated
using (true);

-- Anyone can submit a report without signing in. Add CAPTCHA/rate-limiting before a public launch.
create policy "Anyone can submit a report"
on public.reports for insert
to anon, authenticated
with check (
  char_length(title) between 4 and 110
  and char_length(details) between 20 and 2500
  and (display_name is null or char_length(display_name) <= 40)
);

-- Intentionally no public update/delete policy: clients cannot alter reports or manipulate support_count.
-- A production version should add a moderation/admin workflow and a safe support/vote endpoint.
grant select, insert on public.reports to anon, authenticated;
