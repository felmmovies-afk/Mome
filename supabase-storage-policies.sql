-- NEGM MEMORIES — Supabase Storage policies
-- IMPORTANT: create the `memories` bucket as PRIVATE in Dashboard first.
-- Paths must begin with the authenticated user's auth.uid, e.g. <uid>/file.jpg.
-- These policies only control Storage object access; they do not secure Firebase RTDB.

create policy "Users can upload their own memory files"
on storage.objects for insert
to authenticated
with check (
  bucket_id = 'memories'
  and (storage.foldername(name))[1] = auth.uid()::text
);

create policy "Users can read their own memory files"
on storage.objects for select
to authenticated
using (
  bucket_id = 'memories'
  and (storage.foldername(name))[1] = auth.uid()::text
);

create policy "Users can update their own memory files"
on storage.objects for update
to authenticated
using (
  bucket_id = 'memories'
  and (storage.foldername(name))[1] = auth.uid()::text
)
with check (
  bucket_id = 'memories'
  and (storage.foldername(name))[1] = auth.uid()::text
);

create policy "Users can delete their own memory files"
on storage.objects for delete
to authenticated
using (
  bucket_id = 'memories'
  and (storage.foldername(name))[1] = auth.uid()::text
);
