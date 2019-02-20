CREATE OR REPLACE FUNCTION add_activity_with_title(title character varying(200)) RETURNS int AS $$
   INSERT INTO activity VALUES ((SELECT nextval('id_generator')), title, null, NOW(), NOW())
   RETURNING (SELECT CAST((SELECT currval('id_generator')) AS int));  
$$ LANGUAGE SQL;