(
    SELECT
        pi.name AS pizzeria_name
    FROM
        pizzeria pi
        JOIN person_visits pv ON pv.pizzeria_id = pi.id
        JOIN person p ON pv.person_id = p.id
    WHERE
        gender = 'female'
    EXCEPT
        ALL
    SELECT
        pi.name
    FROM
        pizzeria pi
        JOIN person_visits pv ON pv.pizzeria_id = pi.id
        JOIN person p ON pv.person_id = p.id
    WHERE
        gender = 'male'
)
UNION
ALL(
    SELECT
        pi.name
    FROM
        pizzeria pi
        JOIN person_visits pv ON pv.pizzeria_id = pi.id
        JOIN person p ON pv.person_id = p.id
    WHERE
        gender = 'male'
    EXCEPT
        ALL
    SELECT
        pi.name
    FROM
        pizzeria pi
        JOIN person_visits pv ON pv.pizzeria_id = pi.id
        JOIN person p ON pv.person_id = p.id
    WHERE
        gender = 'female'
)
ORDER BY
    1;