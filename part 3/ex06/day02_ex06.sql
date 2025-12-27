SELECT
    menu.pizza_name,
    pizzeria.name AS pizzeria_name
FROM
    menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
WHERE
    person.name IN ('Denis', 'Anna')
ORDER BY
    1,
    2;