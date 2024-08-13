SELECT * FROM movies;
SELECT * FROM financials;

-- INNER JOIN
SELECT 
	m.movie_id, title, budget, revenue, unit, currency
FROM movies m
JOIN financials f
ON m.movie_id = f.movie_id;

-- LEFT JOIN
SELECT 
	m.movie_id, title, budget, revenue, unit, currency
FROM movies m
LEFT JOIN financials f
ON m.movie_id = f.movie_id;

-- RIGHT JOIN
SELECT 
	f.movie_id, title, budget, revenue, unit, currency
FROM movies m
RIGHT JOIN financials f
ON m.movie_id = f.movie_id;

-- FULL JOIN
SELECT 
	m.movie_id, title, budget, revenue, unit, currency
FROM movies m LEFT JOIN financials f ON m.movie_id = f.movie_id
UNION
SELECT 
	f.movie_id, title, budget, revenue, unit, currency
FROM movies m RIGHT JOIN financials f ON m.movie_id = f.movie_id;

SELECT 
	movie_id, title, budget, revenue, unit, currency
FROM movies m
RIGHT JOIN financials f
USING (movie_id);