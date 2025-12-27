CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT
    p.name AS pizzeria_name
FROM
    menu
    JOIN pizzeria p ON p.id = menu.pizzeria_id
    JOIN person_visits pv ON menu.pizzeria_id = pv.pizzeria_id
    JOIN person p2 ON p2.id = pv.person_id
WHERE
    p2.name = 'Dmitriy'
    AND pv.visit_date = '2022-01-08'
    AND menu.price < 800;