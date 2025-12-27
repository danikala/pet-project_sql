(
    SELECT
        pi.name,
        COUNT(pv.id),
        'visit' AS action_type
    FROM
        person_visits pv
        JOIN pizzeria pi ON pv.pizzeria_id = pi.id
    GROUP BY
        1
    ORDER BY
        2 DESC
    LIMIT
        3
)
UNION
ALL (
    SELECT
        pi.name,
        COUNT(po.id),
        'order' AS action_type
    FROM
        person_order po
        JOIN menu m ON po.menu_id = m.id
        JOIN pizzeria pi ON m.pizzeria_id = pi.id
    GROUP BY
        1
    ORDER BY
        2 DESC
    LIMIT
        3
)
ORDER BY
    3 ASC;