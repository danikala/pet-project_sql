SELECT
    object_name
FROM
    (
        SELECT
            name AS object_name,
            0 AS ord
        FROM
            person
        UNION
        ALL
        SELECT
            pizza_name,
            1
        FROM
            menu
        ORDER BY
            2,
            1
    );