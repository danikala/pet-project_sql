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
    (10, 'Kazan Pizza', 5);

-- Фиксируем изменения
-- session 2
COMMIT;

-- Проверка значения суммы рейтинга всех заведений, видим новое значение
-- session 1
SELECT
    SUM(rating)
FROM
    pizzeria;

-- делаем commit
-- session 1
COMMIT;

-- Проверка значения рейтинга, результаты одинаковы
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