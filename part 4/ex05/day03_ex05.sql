SELECT
    pi.name AS pizzeria_name
FROM
    person_visits pv
    JOIN person p ON p.id = pv.person_id
    JOIN pizzeria pi ON pv.pizzeria_id = pi.id
WHERE
    p.name = 'Andrey'
EXCEPT
SELECT
    pi.name
FROM
    person_order po
    JOIN person p ON p.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
WHERE
    p.name = 'Andrey'
ORDER BY
    1;