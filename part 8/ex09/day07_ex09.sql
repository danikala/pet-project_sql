SELECT
    address,
    (
        ROUND(
            MAX(age) - (
                MIN(age) / MAX(age :: FLOAT)
            ) :: NUMERIC,
            2
        )
    ) AS formula,
    ROUND(AVG(age) :: NUMERIC, 2) AS average,
    MAX(age) - (MIN(age) / MAX(age :: FLOAT)) > AVG(age) :: NUMERIC AS comprasion
FROM
    person
GROUP BY
    1
ORDER BY
    1;