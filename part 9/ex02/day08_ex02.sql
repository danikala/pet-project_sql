-- Запуск транзакции с уровнем изоляции REPEATABLE READ
-- session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Проверка уровня изоляции транзакции
-- session 1
SHOW TRANSACTION ISOLATION LEVEL;

-- session 2
SHOW TRANSACTION ISOLATION LEVEL;

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
-- Выходит ошибка ERROR:  could not serialize access due to concurrent update
COMMIT;

-- при попытке COMMIT выполняется ROLLBACK
-- Проверяем значения рейтинга
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