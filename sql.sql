-- #1
SELECT
    model_name,
    sum(seen_count)
FROM
    window_shopping
GROUP BY
    model_name
ORDER BY
    sum(seen_count) DESC
LIMIT
    5;

-- #2
SELECT
    *
FROM
    review AS r
WHERE
    r.store_name = '11번가'
    AND r.model_name = 'MGN63KH/1';

-- #3
SELECT
    *
FROM
    old_price AS o
WHERE
    o.model_name = 'MGN63KH/1'
    AND o.measurement_date > NOW() - INTERVAL 30 DAY;

-- #4
SELECT
    *
FROM
    goods AS g NATURAL
    JOIN laptop AS l NATURAL
    JOIN review AS r
WHERE
    model_name IN (
        SELECT
            model_name
        FROM
            review
        GROUP BY
            model_name
        HAVING
            avg(rating) > 4.3
    )
    AND operating_system = 'Windows'
    AND screen_size_inch >= 13.0
    AND hard_drive_size >= 256
    AND ram_size >= 4
    AND product_weight < 2.0;

-- #5
SELECT
    *
FROM
    goods AS g NATURAL
    JOIN laptop AS l NATURAL
    JOIN sells AS s
WHERE
    shopping_mall_domain = '11번가';