SELECT
    pizza_name,
    price,
    pi.name AS pizzeria_name,
    visit_date
FROM
    person_visits pv
    JOIN pizzeria pi ON pv.pizzeria_id = pi.id
    JOIN menu m ON m.pizzeria_id = pi.id
    JOIN person p ON pv.person_id = p.id
WHERE
    p.name = 'Kate'
    AND price BETWEEN 800
    AND 1000
ORDER BY
    1,
    2,
    3;