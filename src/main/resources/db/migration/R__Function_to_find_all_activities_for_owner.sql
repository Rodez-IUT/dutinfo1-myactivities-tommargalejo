CREATE OR REPLACE FUNCTION find_all_activities_for_owner(owner character varying(500)) RETURNS SETOF activity AS $$
  SELECT * 
   			  FROM activity
   			  WHERE owner_id = ( SELECT DISTINCT id
   			  					 FROM "user"
   			  					 WHERE user = owner ); 
$$ LANGUAGE SQL;