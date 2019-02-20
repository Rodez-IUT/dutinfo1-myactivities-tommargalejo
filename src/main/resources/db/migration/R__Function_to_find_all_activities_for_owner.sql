/*CREATE OR REPLACE FUNCTION find_all_activities_for_owner(character varying(500)) RETURNS record AS $$
   RETURNING (SELECT * 
   			  FROM activities
   			  JOIN user
   			  ON owner_id = id
   			  WHERE ); 
$$ LANGUAGE SQL;*/