SELECT
    m.pizza_name,
    m.price,
    pi.name AS pizzeria_name
FROM
    (
        SELECT
            id
        FROM
            menu m
        EXCEPT
        SELECT
            menu_id
        FROM
            person_order
    ) AS t1
    JOIN menu m ON t1.id = m.id
    JOIN pizzeria pi ON pi.id = m.pizzeria_id
ORDER BY
    1,
    2;