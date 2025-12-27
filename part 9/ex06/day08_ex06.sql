-- Проверка уровня изоляции транзакции
-- session 1
SHOW TRANSACTION ISOLATION LEVEL;

-- session 2
SHOW TRANSACTION ISOLATION LEVEL;

-- Запуск транзакции с уровнем изоляции REPEATABLE READ
-- session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Проверка значения суммы рейтинга всех заведений
-- session 1
SELECT
    SUM(rating)
FROM
    pizzeria;

-- Добавление новой пиццерии в таблицу
-- session 2
INSERT INTO
    pizzeria
VALUES
    (11, 'Kazan Pizza 2', 4);

-- Фиксируем изменения
-- session 2
COMMIT;

-- Проверка значения суммы рейтинга всех заведений, новых значений не наблюдается
-- session 1
SELECT
    SUM(rating)
FROM
    pizzeria;

-- делаем commit
-- session 1
COMMIT;

-- Проверка значения рейтинга, после commit значения в обоих session одинаковы
-- session 1
SELECT
    SUM(rating)
FROM
    pizzeria;

-- session 2
SELECT
    SUM(rating)
FROM
    pizzeria;