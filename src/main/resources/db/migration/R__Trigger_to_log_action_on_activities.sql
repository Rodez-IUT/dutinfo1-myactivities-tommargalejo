/*
CREATE FUNCTION supr() RETURNS trigger AS $supr$
    BEGIN
        --sélections des activités suprimées
        select * from activity where owner_id = OLD.id;
        -- ajout des lignes supprimées à action_log
        insert into action_log values (nextval('id_generator') ,'delete', 'activity', OLD.id, 'postgres');
    END;
$supr$ LANGUAGE plpgsql;

-- trigger qui se déclancher à chaque suppression
CREATE TRIGGER suppression AFTER Delete ON "user"
    FOR EACH ROW EXECUTE PROCEDURE supr();
*/
DROP TRIGGER IF EXISTS log_delete_activity on activity;
CREATE OR REPLACE FUNCTION log_delete_activity()
    RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO action_log (id, action_name, entity_name, entity_id, author, action_date)
        values (nextval('id_generator'), 'delete', 'activity', OLD.id, user, now());
    RETURN NULL;
END;
$$ language plpgsql;

CREATE TRIGGER log_delete_activity
    AFTER DELETE ON activity
    FOR EACH ROW EXECUTE PROCEDURE log_delete_activity();