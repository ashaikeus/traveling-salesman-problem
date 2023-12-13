WITH itr1 AS (
    SELECT r_o.id,
        r_o.point1,
        r_o.point2,
        r.point2 AS point3,
        (r_o.cost + r.cost) AS cost
    FROM road AS r_o
    RIGHT JOIN road AS r ON r.point1 = r_o.point2
    WHERE r.point2 != r_o.point1 AND r_o.point1 = 'a'),
    itr2 AS (
        SELECT itr1.id,
            itr1.point1,
            itr1.point2,
            itr1.point3,
            r.point2 AS point4,
            (itr1.cost + r.cost) AS cost
        FROM itr1 
        RIGHT JOIN road AS r ON r.point1 = itr1.point3
        WHERE r.point2 != itr1.point2 AND r.point2 != itr1.point3 AND r.point2 != itr1.point1),
    itr3 AS (
        SELECT itr2.id,
            itr2.point1,
            itr2.point2,
            itr2.point3,
            itr2.point4,
            r.point2 AS point5,
            (itr2.cost + r.cost) AS cost
        FROM itr2 
        RIGHT JOIN road AS r ON r.point1 = itr2.point4
        WHERE r.point2 = 'a')

SELECT cost AS total_cost,
    ('{' || point1 || ',' || point2 || ',' || point3 || ',' || point4 || ',' || point5 || '}') AS tour
FROM itr3
WHERE cost = (select  min(cost) from itr3)
ORDER BY 1, 2;