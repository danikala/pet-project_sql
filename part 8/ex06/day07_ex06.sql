SELECT
    pi.name,
    COUNT(po.id) AS count_of_orders,
    ROUND(SUM(m.price) / COUNT(po.id), 2) AS average_price,
    MAX(price) AS max_price,
    MIN(price) AS min_price
FROM
    person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pi ON m.pizzeria_id = pi.id
GROUP BY
    1
ORDER BY
    1;