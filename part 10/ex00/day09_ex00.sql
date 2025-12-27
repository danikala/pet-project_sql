CREATE TABLE IF NOT EXISTS person_audit (
    row_id bigint not null,
    name varchar not null,
    age integer not null DEFAULT 10,
    gender varchar DEFAULT 'female' not null,
    address varchar,
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP not null,
    type_event char(1) DEFAULT 'I' not null,
    constraint ch_type_event check (type_event IN ('I', 'U', 'D'))
);

CREATE
OR REPLACE FUNCTION fnc_trg_person_insert_audit () RETURNS TRIGGER AS $$ BEGIN
    INSERT INTO
        person_audit (row_id, name, age, gender, address, type_event)
    VALUES
        (
            NEW .id,
            NEW .name,
            NEW .age,
            NEW .gender,
            NEW .address,
            'I'
        );

RETURN NEW;

END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER
INSERT
    ON person FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO
    person(id, name, age, gender, address)
VALUES
    (10, 'Damir', 22, 'male', 'Irkutsk');