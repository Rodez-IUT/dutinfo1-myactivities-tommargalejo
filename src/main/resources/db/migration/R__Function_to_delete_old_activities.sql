
CREATE OR REPLACE FUNCTION delete_activities_older_than(old_date date) RETURNS int AS $$
   DELETE
   FROM public.activity
   WHERE modification_date < old_date
   RETURNING 0
$$ LANGUAGE SQL; 