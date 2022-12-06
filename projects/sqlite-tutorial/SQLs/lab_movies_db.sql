-- SQLite
.schema

-- create a SQL query that shows the titles of all movies released in
-- 2003 ordered by title in ascending order.
SELECT title AS "Movies released in 2003"
FROM movies
WHERE year = 2003
ORDER BY title ASC;

-- create a query to determine the average rating of all movies
-- released between 2010 and 2013.
SELECT AVG(rating) AS "Average rating of movies released between 2010 and 2013"
FROM ratings
WHERE movie_id IN (
        SELECT id
        FROM movies
        WHERE year BETWEEN 2010 AND 2013
    );

-- create a query that shows the names of all people who starred in
-- a movie released in 2004, ordered by name in descending order.
SELECT name AS "Stars in movies released in 2004 in descending order"
FROM people
WHERE id IN (
        SELECT person_id
        FROM stars
        WHERE movie_id IN (
                SELECT id
                FROM movies
                WHERE year = 2004
            )
    )
ORDER BY name DESC;

-- create a SQL query to list the names of all people who starred in
-- “The SpongeBob Movie: Sponge Out of Water”.
SELECT name AS "Stars in The SpongeBob Movie: Sponge Out of Water"
FROM people
WHERE id IN (
        SELECT person_id
        FROM stars
        WHERE movie_id = (
                SELECT id
                FROM movies
                WHERE title = 'The SpongeBob Movie: Sponge Out of Water'
            )
    );

-- create a query that shows all movie title where “Dwayne Johnson”
-- and “Kevin Hart” starred
SELECT title as "Movies of Dwayne Johnson and Kevin Hart"
FROM movies
WHERE id IN (
        SELECT movie_id
        FROM stars
        WHERE person_id = (
                SELECT id
                FROM people
                WHERE name = 'Dwayne Johnson'
            )
    )
    AND id IN (
        SELECT movie_id
        FROM stars
        WHERE person_id = (
                SELECT id
                FROM people
                WHERE name = 'Kevin Hart'
            )
    );
