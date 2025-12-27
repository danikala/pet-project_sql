SELECT
    order_date,
    CONCAT(name, '(', age, ' лет', ')') AS person_information
FROM
    person_order NATURAL
    JOIN (
        SELECT
            person.id AS person_id,
            name,
            age
        FROM
            person
    )
ORDER BY
    1,
    2;