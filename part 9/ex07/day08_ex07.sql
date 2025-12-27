-- Запуск транзакции с уровнем изоляции REPEATABLE READ
-- session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Обновление значений рейтинга №1
-- session 1
UPDATE
    pizzeria
SET
    rating = 5
WHERE
    id = 1;

-- session 2
UPDATE
    pizzeria
SET
    rating = 5
WHERE
    id = 2;

-- Обновление значений рейтинга №2
-- session 1
UPDATE
    pizzeria
SET
    rating = 4
WHERE
    id = 2;

-- session 2
UPDATE
    pizzeria
SET
    rating = 4
WHERE
    id = 1;

-- Выходит ошибка ERROR:  deadlock detected
-- Фиксируем изменения
-- session 1
COMMIT;

-- session 2
COMMIT;

-- При попытке COMMIT происходит ROLLBACK