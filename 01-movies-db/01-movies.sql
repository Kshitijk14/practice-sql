SELECT * FROM moviesdb.movies;
SELECT title, industry FROM moviesdb.movies;

SELECT * FROM moviesdb.movies WHERE industry="bollywood";
SELECT COUNT(*) FROM moviesdb.movies WHERE industry="hollywood";

SELECT distinct studio from moviesdb.movies;
SELECT distinct studio FROM moviesdb.movies WHERE industry="hollywood";

SELECT * FROM moviesdb.movies WHERE title LIKE "%THOR%";
SELECT * FROM moviesdb.movies WHERE title LIKE "america%";
SELECT * FROM moviesdb.movies WHERE title LIKE "%america%";

SELECT * FROM moviesdb.movies WHERE studio="";

SELECT * FROM moviesdb.movies WHERE imdb_rating >=9;
SELECT * FROM moviesdb.movies WHERE imdb_rating <5;
SELECT * FROM moviesdb.movies WHERE imdb_rating>=6 AND imdb_rating<=8;
SELECT * FROM moviesdb.movies WHERE imdb_rating BETWEEN 6 AND 8;

SELECT * 
FROM moviesdb.movies 
WHERE release_year=2022 OR release_year=2019;
SELECT * 
FROM moviesdb.movies 
WHERE release_year IN (2022, 2019, 2018);
SELECT * 
FROM moviesdb.movies 
WHERE studio IN ("MArvel Studios", "Zee Studios");

SELECT *
FROM moviesdb.movies
WHERE imdb_rating is NULL;
SELECT COUNT(*)
FROM moviesdb.movies
WHERE imdb_rating is NOT NULL;

SELECT *
FROM moviesdb.movies
WHERE industry="bollywood"
ORDER BY imdb_rating;
SELECT *
FROM moviesdb.movies
WHERE industry="bollywood"
ORDER BY imdb_rating DESC;

SELECT *
FROM moviesdb.movies
WHERE industry="hollywood"
ORDER BY imdb_rating DESC LIMIT 5;
SELECT *
FROM moviesdb.movies
WHERE industry="hollywood"
ORDER BY imdb_rating DESC LIMIT 5 OFFSET 1;

SELECT MAX(imdb_rating) FROM moviesdb.movies WHERE industry="bollywood";
SELECT MIN(imdb_rating) FROM moviesdb.movies WHERE industry="bollywood";
SELECT AVG(imdb_rating) FROM moviesdb.movies WHERE studio="Marvel Studios";
SELECT ROUND(AVG(imdb_rating), 2) FROM moviesdb.movies WHERE studio="Marvel Studios";
SELECT ROUND(AVG(imdb_rating), 2) as avg_rating 
FROM moviesdb.movies WHERE studio="Marvel Studios";
SELECT MAX(imdb_rating) as max_rating,
	MIN(imdb_rating) as min_rating,
	ROUND(AVG(imdb_rating), 2) as avg_rating 
FROM moviesdb.movies WHERE studio="Marvel Studios";

SELECT industry, COUNT(*) 
FROM moviesdb.movies 
GROUP BY industry;
SELECT studio, COUNT(*) 
FROM moviesdb.movies 
GROUP BY studio;
SELECT studio, COUNT(*) as cnt
FROM moviesdb.movies 
GROUP BY studio
ORDER BY cnt DESC;

SELECT 
	industry, 
    COUNT(industry) as cnt,
    ROUND(AVG(imdb_rating), 2) as avg_rating
FROM moviesdb.movies 
GROUP BY industry;
SELECT 
	studio, 
    COUNT(studio) as cnt,
    ROUND(AVG(imdb_rating), 1) as avg_rating
FROM moviesdb.movies 
GROUP BY studio
ORDER BY avg_rating DESC;
SELECT 
	studio, 
    COUNT(studio) as cnt,
    ROUND(AVG(imdb_rating), 1) as avg_rating
FROM moviesdb.movies 
WHERE studio != ""
GROUP BY studio
ORDER BY avg_rating DESC;

SELECT release_year, COUNT(*) as movies_count
FROM moviesdb.movies
-- WHERE movies_count > 2
GROUP BY release_year
ORDER BY movies_count DESC;
SELECT release_year, COUNT(*) as movies_count
FROM moviesdb.movies
GROUP BY release_year
HAVING movies_count > 2
ORDER BY movies_count DESC;

SELECT * FROM moviesdb.actors;
SELECT CURDATE();
SELECT *, CURDATE()
FROM moviesdb.actors;
SELECT *, YEAR(CURDATE())-birth_year as age
FROM moviesdb.actors;

SELECT * FROM moviesdb.financials;
SELECT *, (revenue - budget) as profit
FROM moviesdb.financials;

SELECT distinct currency FROM moviesdb.financials;
SELECT *, 
IF(currency = 'USD', revenue * 83.95, revenue) as revenue_inr
FROM moviesdb.financials;

SELECT distinct unit FROM moviesdb.financials;
SELECT *, 
CASE
    WHEN unit = 'Billions' THEN revenue * 1000
    WHEN unit = 'Thousands' THEN revenue / 1000
    ELSE revenue
END as revenue_mils
FROM moviesdb.financials;

SELECT 
    *,
    (CASE
        WHEN unit = 'Billions' THEN revenue * 1000
        WHEN unit = 'Thousands' THEN revenue / 1000
        ELSE revenue
    END) AS revenue_mils,
    IF(currency = 'USD', 
        (CASE
            WHEN unit = 'Billions' THEN revenue * 1000 * 83.95
            WHEN unit = 'Thousands' THEN revenue / 1000 * 83.95
            ELSE revenue * 83.95
        END), 
        (CASE
            WHEN unit = 'Billions' THEN revenue * 1000
            WHEN unit = 'Thousands' THEN revenue / 1000
            ELSE revenue
        END)
    ) AS revenue_inr_mils,
    (IF(currency = 'USD', 
        (CASE
            WHEN unit = 'Billions' THEN (revenue - budget) * 1000 * 83.95
            WHEN unit = 'Thousands' THEN (revenue - budget) / 1000 * 83.95
            ELSE (revenue - budget) * 83.95
        END), 
        (CASE
            WHEN unit = 'Billions' THEN (revenue - budget) * 1000
            WHEN unit = 'Thousands' THEN (revenue - budget) / 1000
            ELSE (revenue - budget)
        END)
    )) AS profit_inr_mils
FROM 
    moviesdb.financials;