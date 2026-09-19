-- KHUNYUI DATABASE 005 — LINK REAL OWNER AFTER CREATING AUTH USER
-- 1) Supabase Dashboard > Authentication > Users: create the real owner account.
-- 2) Replace the email below, then run this file once.

insert into public.store_members(store_id,user_id,role)
select '11111111-1111-4111-8111-111111111111',id,'owner' from auth.users where lower(email)=lower('REPLACE_WITH_OWNER_EMAIL@example.com')
on conflict(store_id,user_id) do update set role='owner';

insert into public.owner_preferences(store_id,user_id)
select '11111111-1111-4111-8111-111111111111',id from auth.users where lower(email)=lower('REPLACE_WITH_OWNER_EMAIL@example.com')
on conflict(store_id,user_id) do nothing;
