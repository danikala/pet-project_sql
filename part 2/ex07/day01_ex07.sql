SELECT
    order_date,
    CONCAT(name, '(', age, ' лет', ')') AS person_information
FROM
    person_order po
    JOIN person p ON po.person_id = p.id
ORDER BY
    1,
    2;