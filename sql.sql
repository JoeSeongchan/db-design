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
    AND o.measurement_date = > NOW() - internal 30 DAY;