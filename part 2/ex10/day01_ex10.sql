SELECT
    person.name,
    menu.pizza_name,
    pizzeria.name
FROM
    person_order po
    JOIN person ON po.person_id = person.id
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY
    1,
    2,
    3;