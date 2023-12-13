CREATE TABLE road (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    point1,
    point2,
    cost
);

INSERT INTO
road (cost, point1, point2, id)
VALUES
(15, 'c', 'a', 1),
(15, 'a', 'c', 2),
(20, 'd', 'a', 3),
(20, 'a', 'd', 4),
(10, 'b', 'a', 5),
(10, 'a', 'b', 6),
(25, 'd', 'b', 7),
(25, 'b', 'd', 8),
(30, 'd', 'c', 9),
(30, 'c', 'd', 10),
(35, 'c', 'b', 11),
(35, 'b', 'c', 12);