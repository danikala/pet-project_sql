SELECT
    p.name,
    m.pizza_name,
    m.price,
    ROUND(m.price * (1 - (discount / 100))) AS discount_price,
    pi.name AS pizzeria_name
FROM
    person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    JOIN person_discounts pd ON pd.person_id = p.id
    AND pd.pizzeria_id = m.pizzeria_id
    JOIN pizzeria pi ON pi.id = m.pizzeria_id
ORDER BY
    1,
    2;