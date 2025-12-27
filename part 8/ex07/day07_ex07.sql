SELECT
    ROUND(SUM(rating) / count(*), 4) AS global_rating
FROM
    pizzeria;