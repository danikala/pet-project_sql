-- session 1
-- Обновим рейтинг пиццерии до 5 используя режим транзакции
BEGIN;

UPDATE
    pizzeria
SET
    rating = 5
WHERE
    name = 'Pizza Hut';

-- Проверяем изменения
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- session 2
-- Видим старое значение рейтинга
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- session 1
-- Фиксируем изменения, теперь они видны всем
COMMIT;

-- session 2
-- Видим новое значение рейтинга
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';