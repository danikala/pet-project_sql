SELECT
    p.name AS pizzeria_name
FROM
    menu
    INNER JOIN pizzeria p ON p.id = menu.pizzeria_id
    INNER JOIN person_visits pv ON menu.pizzeria_id = pv.pizzeria_id
    INNER JOIN person p2 ON p2.id = pv.person_id
WHERE
    p2.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08'
    AND menu.price < 800;