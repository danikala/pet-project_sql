-- Проверка уровня изоляции транзакции
-- session 1
SHOW TRANSACTION ISOLATION LEVEL;

-- session 2
SHOW TRANSACTION ISOLATION LEVEL;

-- Запуск транзакции с уровнем изоляции READ COMMITTED
-- session 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- session 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Проверка значения рейтинга до обновления
-- session 1
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- session 2
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Обновление данных
-- session 1
UPDATE
    pizzeria
SET
    rating = 4
WHERE
    name = 'Pizza Hut';

-- session 2
UPDATE
    pizzeria
SET
    rating = 3.6
WHERE
    name = 'Pizza Hut';

-- Фиксируем изменения
-- session 1
COMMIT;

-- session 2
COMMIT;

-- Проверяем значения рейтинга, видим анамалию с потерей обновления в session 1
-- session 1
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- session 2
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';