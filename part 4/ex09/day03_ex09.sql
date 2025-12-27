insert into
    person_visits
values
    (
        (
            SELECT
                max(id) + 1
            FROM
                person_visits
        ),
        (
            SELECT
                id
            FROM
                person
            WHERE
                name = 'Denis'
        ),
        (
            SELECT
                id
            FROM
                pizzeria
            WHERE
                name = 'Dominos'
        ),
        '2022-02-24'
    );

insert into
    person_visits
values
    (
        (
            SELECT
                max(id) + 1
            FROM
                person_visits
        ),
        (
            SELECT
                id
            FROM
                person
            WHERE
                name = 'Irina'
        ),
        (
            SELECT
                id
            FROM
                pizzeria
            WHERE
                name = 'Dominos'
        ),
        '2022-02-24'
    );

SELECT count(*)=2 AS CHECK
 FROM person_visits
 WHERE visit_date = '2022-02-24'
   AND person_id IN (6, 4)
   AND pizzeria_id = 2;