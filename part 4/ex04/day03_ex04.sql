(
    SELECT
        pi.name AS pizzeria_name
    FROM
        person_order po
        JOIN person p ON po.person_id = p.id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pi ON pi.id = m.pizzeria_id
    WHERE
        gender = 'female'
    EXCEPT
    SELECT
        pi.name
    FROM
        person_order po
        JOIN person p ON po.person_id = p.id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pi ON pi.id = m.pizzeria_id
    WHERE
        gender = 'male'
)
UNION
(
    SELECT
        pi.name
    FROM
        person_order po
        JOIN person p ON po.person_id = p.id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pi ON pi.id = m.pizzeria_id
    WHERE
        gender = 'male'
    EXCEPT
    SELECT
        pi.name
    FROM
        person_order po
        JOIN person p ON po.person_id = p.id
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pi ON pi.id = m.pizzeria_id
    WHERE
        gender = 'female'
)
ORDER BY
    1;