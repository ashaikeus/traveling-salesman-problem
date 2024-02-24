WITH RECURSIVE paths(p1, p2, total_cost, tour) AS (
    SELECT 'a'::VARCHAR AS p1, 'a'::VARCHAR AS p2, 0 AS total_cost, ARRAY['a'] AS tour
	UNION ALL
	SELECT paths.p2, road.point2,
			paths.total_cost + road.cost, tour || road.point2
	FROM road
	JOIN paths ON paths.p2 = road.point1
	WHERE road.point2 != ALL(tour) OR (road.point2 = 'a' AND CARDINALITY(tour) = 4)
)
SELECT total_cost, tour FROM paths WHERE CARDINALITY(tour) = 5
ORDER BY total_cost, tour;