-- Проверка уровня изоляции транзакции
-- session 1
SHOW TRANSACTION ISOLATION LEVEL;

-- session 2
SHOW TRANSACTION ISOLATION LEVEL;

-- Запуск транзакции с уровнем изоляции SERIALIZABLE
-- session 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- session 2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Проверка значения рейтинга до обновления
-- session 1
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- Обновление данных
-- session 2
UPDATE
    pizzeria
SET
    rating = 3.0
WHERE
    name = 'Pizza Hut';

-- Фиксируем изменения
-- session 2
COMMIT;

-- Проверяем значения рейтинга, изменений внесенных в session 2 не видим
-- session 1
SELECT
    *
FROM
    pizzeria
WHERE
    name = 'Pizza Hut';

-- делаем commit
-- session 1
COMMIT;

-- Проверка значения рейтинга, видим значения внесенные в session 2
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