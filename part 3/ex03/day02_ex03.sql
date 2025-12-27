WITH g AS (
    SELECT
        g :: date
    FROM
        generate_series('2022-01-01', '2022-01-10', interval '1 day') AS g
)
SELECT
    g :: date AS missing_date
FROM
    (
        SELECT
            *
        FROM
            person_visits
        WHERE
            person_id = 1
            OR person_id = 2
    ) AS pv
    RIGHT JOIN g ON pv.visit_date = g
WHERE
    pv.id IS NULL
ORDER BY
    1;