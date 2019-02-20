CREATE OR REPLACE FUNCTION add_activity_with_title(title character varying(200)) RETURNS bigint AS $$
   INSERT INTO activity VALUES ((SELECT nextval('id_generator')), title)
   RETURNING id;  
$$ LANGUAGE SQL;