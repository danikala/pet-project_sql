SELECT
    p.address,
    pi.name,
    COUNT(po.id) AS count_of_orders
FROM
    person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pi ON pi.id = m.pizzeria_id
    JOIN person p ON p.id = po.person_id
GROUP BY
    1,
    2
ORDER BY
    1,
    2;