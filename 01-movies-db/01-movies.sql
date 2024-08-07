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