WITH visit_count AS (
    SELECT
        pi.name,
        COUNT(pv.id) AS visit_counts
    FROM
        person_visits pv
        JOIN pizzeria pi ON pv.pizzeria_id = pi.id
    GROUP BY
        1
),
order_count AS (
    SELECT
        pi.name,
        COUNT(po.id) AS order_counts
    FROM
        person_order po
        JOIN menu m ON po.menu_id = m.id
        JOIN pizzeria pi ON m.pizzeria_id = pi.id
    GROUP BY
        1
)
SELECT
    COALESCE(v.name, o.name) AS name,
    COALESCE(v.visit_counts, 0) + COALESCE(o.order_counts, 0) AS total_count
FROM
    visit_count v FULL
    OUTER JOIN order_count o ON v.name = o.name
ORDER BY
    2 DESC,
    1 ASC;