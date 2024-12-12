-- Peliculas estrenadas entre 1950 y 1975 
SELECT *
FROM films
WHERE released_year BETWEEN 1950 AND 1975;

--  Calcula la calificación promedio de IMDB de todas las películas:
SELECT AVG(imdb_rating) AS average_rating
FROM films;

-- Películas con una calificación de IMDB mayor a 8:
SELECT film_name, imdb_rating
FROM films
WHERE imdb_rating > 8.5;

-- Encuentra películas de más de 2 horas con una calificación superior a 7:
SELECT film_name, runtime_min, imdb_rating
FROM films
WHERE runtime_min > 120 AND imdb_rating > 7
ORDER BY imdb_rating DESC;

-- Películas que sean de género 'Comedy' o tengan un IMDB superior a 8:
SELECT f.film_name, g.genre, f.imdb_rating
FROM films f
JOIN genre g ON f.genre_id = g.genre_id
WHERE g.genre = 'Comedy' AND f.imdb_rating > 8.5;

-- Películas que no sean del género 'Horror' y su director comience por 'G':
SELECT f.film_name, g.genre
FROM films f
JOIN genre g ON f.genre_id = g.genre_id
WHERE g.genre = 'Horror' AND f.director_id IN (SELECT director_id FROM director WHERE director_name LIKE 'G%');

-- Encuentra películas donde el actor principal es "Al Pacino":
SELECT f.film_name, s.star1_name
FROM films f
JOIN star1 s ON f.star1_id = s.star1_id
WHERE s.star1_name = 'Al Pacino';

--  Ordena las películas por el nombre del actor secundario (star2):
SELECT f.film_name, s2.star2_name
FROM films f
JOIN star2 s2 ON f.star2_id = s2.star2_id
ORDER BY s2.star2_name DESC;

-- Encuentra películas donde el actor secundario sea  comience por "W" y el género sea "Horror":
SELECT 
	f.film_name, s2.star2_name, g.genre
FROM films f
JOIN star2 s2 
	ON f.star2_id = s2.star2_id
JOIN genre g 
	ON f.genre_id = g.genre_id
WHERE s2.star2_name LIKE 'W%' AND g.genre = 'Horror';

-- Obtener la pelicula con el minimo y maximo gross.
SELECT film_name, gross as min_gross
FROM films
WHERE  gross = (SELECT MIN(gross) FROM films);
SELECT film_name, gross as max_gross
FROM films
WHERE  gross = (SELECT MAX(gross) FROM films);

-- Peliculas con el mayor imdb_rating y con genero 'Comedia'.
SELECT film_name, genre_id, imdb_rating
FROM films
WHERE genre_id = 6
AND imdb_rating = (SELECT MAX(imdb_rating) AS max_rating
FROM films
WHERE genre_id =  6);



