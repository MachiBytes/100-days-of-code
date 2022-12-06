-- SQLite
.schema


-- GROUP 1

-- write a sql query that shows the music name with the highest tempos
-- then loudness, respectively, limit by 10.
-- * your query should show 1 column with 10 rows 
SELECT name
FROM songs
ORDER BY tempo, loudness
LIMIT 10;

-- write a sql query that shows uppercase names of all music that has
-- Eminem as the artist and energy is above 0.5.
-- * your query should show 1 column with 2 rows
SELECT UPPER(name)
FROM songs
WHERE artist_id = (
    SELECT id
    FROM artists
    WHERE name = 'Eminem'
) AND energy > 0.5;


-- GROUP 2

-- write a sql query that shows the average of loudness as
-- “ave_loudness” where the energy is above 0.75
-- * your query should show 1 column that shows the average loudness
SELECT AVG(loudness) AS ave_loudness
FROM songs
WHERE energy > 0.75;

-- write a sql query that shows the top 2 shortest musics where the tempo
-- is greater than 134 name the columns as “top_2CARDI” and the artist
-- is “Cardi B”.
-- * your query should show 1 column with 2 rows of cardi b’s song
SELECT name AS top_2CARDI
FROM songs
WHERE tempo > 134
    AND (
        SELECT id
        FROM artists
        WHERE name = 'Cardi B'
    )
ORDER BY duration_ms
LIMIT 2;


-- GROUP 3

-- write a sql query that shows the count of the songs where valence is
-- above 0.5 but danceability is below 0.3.
-- * your query should show 1 column with the number of songs that has
-- the given condition
SELECT COUNT(name)
FROM songs
WHERE valence > 0.5
    AND danceability < 0.3;

-- write a sql query that shows the lowercase name of music with
-- valence lower than 0.4. In ascending order of music
-- name and limit it by 6 plus the artist are “Post Malone”,
-- “The Weeknd”, “Cardi B”.
-- * your query should show 1 column with 6 rows of all the songs with
-- lowercase text
SELECT LOWER(name)
FROM songs
WHERE valence < 0.4
    AND artist_id IN (
        SELECT id
        FROM artists
        WHERE name IN ('Post Malone', 'The Weeknd', 'Cardi B')
    )
ORDER BY name ASC
LIMIT 6;


-- GROUP 4

-- write a sql query that shows music name where the key is 2 or 3 and
-- tempo is above 150 name the column as “fast_songs”.
-- * your query should show 1 column with 2 rows of the fastest songs
SELECT name AS fast_songs
FROM songs
WHERE key IN (2, 3)
    AND tempo > 150;

-- write a sql query that shows the number of musics that has either
-- Bruno Mars or Cardi B as an artist or another artist who has an id
-- of 26. The tempo of the music is between 95 and 150.
-- * your query should show 1 column having the count of all songs of
-- cardi B and Bruno mars
SELECT COUNT(name)
FROM songs
WHERE artist_id in (
    SELECT id
    FROM artists
    WHERE name IN ('Bruno Mars', 'Cardi B')
        OR id = 26
    )
    AND tempo BETWEEN 95 AND 150;


-- GROUP 5

-- write a sql query that shows the average energy of musics that starts
-- with ‘g’, ‘d’, ‘s’, ‘c’.
-- * your query should show 1 column having the average energy of the musics
SELECT AVG(energy)
FROM songs
WHERE name LIKE 'g%'
    OR name LIKE 'd%'
    OR name LIKE 's%'
    OR name LIKE 'c%';

-- write a sql query that shows musics that has energy greater than .7 and
-- the artist is “Ariana Grande”. Ordered by name in ascending order.
-- * your query should show 1 column with 2 rows having the name of the
-- songs of ariana
SELECT name
FROM songs
WHERE energy > 0.7
    AND artist_id = (
        SELECT id
        FROM artists
        WHERE name = 'Ariana Grande'
    )
ORDER BY name ASC;


-- GROUP 6

-- write a sql query that shows the tempo and key of “Better Now” and all
-- the music names that ends with ‘s’ ordered by tempo is ascending order.
-- * your query should show 1 column with 2 rows showing the tempo and the
-- key
SELECT tempo,
    key
FROM songs
WHERE name = 'Better Now'
    OR name LIKE '%s'
ORDER BY tempo ASC;

-- write a sql query that shows music name and energy that has energy
-- greater than .4 and the music is made by “The Weeknd”. Ordered by energy
-- in ascending order.
-- * your query should show 1 column with 2 rows showing the name and
-- energy of the songs of the weeknd
SELECT name,
    energy
FROM songs
WHERE energy > 0.4
    AND artist_id = (
        SELECT id
        FROM artists
        WHERE name = 'The Weeknd'
    )
ORDER BY energy ASC;


-- GROUP 7

-- write a sql query that shows the number of music that has an artist id
-- of 26 or 12, and the tempo is between 95 and 150.
-- * your query should show 1 column having the count of songs that has the
-- given condition
SELECT COUNT(id)
FROM songs
WHERE artist_id IN (26, 12)
    AND tempo BETWEEN 95 AND 150;

-- write a sql query that shows the music name where the key is 5, the
-- artist is “Bruno Mars” and tempo is below 90 name the column as
-- “slow_songs_brunomars”.
-- * your query should show 1 column and 1 row having the slowest song in
-- the database of Bruno mars
SELECT name AS slow_songs_brunomars
FROM songs
WHERE key = 5
    AND artist_id = (
        SELECT id
        FROM artists
        WHERE name = 'Bruno Mars'
    )
    AND tempo < 90;


-- GROUP 8

-- write a sql query that shows the lowercase name of music with valence
-- lower than 0.4, in descending order of music name and limit it by 10.
-- * your query should show 1 column and 1 row having the name of the songs
-- in lowercase
SELECT LOWER(name)
FROM songs
WHERE valence < 0.4
ORDER BY name
LIMIT 10;

-- write a sql query that shows the count of the songs where valence is
-- above 0.3 but danceability is below 0.8 and the artist are “Bazzi” or
-- “Maroon 5”.
-- * your query should show 1 column and 1 row having the count of songs
-- that has the given condition
SELECT COUNT(id)
FROM songs
WHERE valence > 0.3
    AND danceability < 0.8
    AND artist_id IN (
        SELECT id
        FROM artists
        WHERE name IN ('Bazzi', 'Maroon 5')
    );


-- GROUP 9

-- write a sql query that shows the top 3 shortest musics where the name
-- starts with ‘h’ name the columns as “top_3h”.
-- * your query should show 1 column with 3 rows that shows music name
-- that starts with h
SELECT name AS top_3h
FROM songs
WHERE name LIKE 'h%'
ORDER BY duration_ms
LIMIT 3;

-- write a sql query that shows the average of loudness as “ave_loudness”
-- where the energy is above 0.5 and the artist is “The Weeknd”
-- * your query should show 1 column with 1 row having the average loudness
-- of the songs of the weeknd
SELECT AVG(loudness) AS ave_loudness
FROM songs
WHERE energy > 0.5
    AND artist_id = (
        SELECT id
        FROM artists
        WHERE name = 'The Weeknd'
    );


-- GROUP 10

-- write a sql query that shows uppercase names of all musics that has
-- artist id of 24 and energy is above 0.4.
-- * your query should show 1 column with 2 rows having the songs of
-- artist 24
SELECT UPPER(name)
from songs
where artist_id = 24
    and energy > 0.4;

-- write a sql query that shows the music name with the highest tempos
-- then loudness, respectively, and the music artist is either “Post Malone”
-- or “Ed Sheeran”.
-- * your query should show 11 column with 9 rows showing the name of songs
-- of post with the given condition
SELECT *
FROM songs
WHERE artist_id in (
        SELECT id
        FROM artists
        WHERE name in ("Ed Sheeran", "Post Malone")
    )
ORDER BY tempo DESC,
    loudness DESC
LIMIT 9;
