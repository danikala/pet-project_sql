CREATE
OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar DEFAULT 'Dmitriy',
    pprice numeric DEFAULT 500,
    pdate date DEFAULT '2022-01-08'
) RETURNS TABLE (pizzeria varchar) AS $$ BEGIN
    RETURN QUERY
    SELECT
        DISTINCT pi.name
    FROM
        person_visits pv
        JOIN pizzeria pi ON pi.id = pv.pizzeria_id
        JOIN person p ON p.id = pv.person_id
        JOIN menu m ON m.pizzeria_id = pi.id
    WHERE
        p.name = pperson
        AND m.price < pprice
        AND pv.visit_date = pdate
    ORDER BY
        1;

END;

$$ LANGUAGE plpgsql;

select
    *
from
    fnc_person_visits_and_eats_on_date(pprice := 800);

select
    *
from
    fnc_person_visits_and_eats_on_date(
        pperson := 'Anna',
        pprice := 1300,
        pdate := '2022-01-01'
    );