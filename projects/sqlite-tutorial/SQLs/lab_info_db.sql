-- SQLite
.schema;

-- GROUP 1 & 2
-- you’re an employee of tinder, they assigned you to give them the
-- people who wanted pet and watches stranger things so that they can
-- pair them with someone who has the same interest arrange them by
-- name in ascending order.
-- * your query should show 2 column with 14 rows showing the name
-- and stranger things as their fav Netflix series
SELECT name
FROM info
WHERE pet = 'yes'
    AND series LIKE '%Stranger Things%'
ORDER BY name;

-- GROUP 3 & 4
-- the ceo of bumble is looking for a suitable partner, she asked
-- you to give the name of the people must start with an “a “or “e”
-- and must be single, whatever the reason is. She also prefers the
-- name to be all uppercase.
-- * your query should show 1 column with 20 rows of all names in
-- uppercase
SELECT UPPER(name)
FROM info
WHERE (
        name LIKE 'a%'
        OR name LIKE 'e%'
    )
    AND status LIKE '%single%';

-- GROUP 5 & 6
-- The founder of GDSC PUP main wanted to WATCH Netflix then chill
-- with someone who’s favorite Netflix has a comedy genre. Moreover,
-- she wanted to chill or talk with someone who has an intermediate
-- or advance knowledge in SQL.
-- * your query should show 1 column with 1 row of the name of that
-- person
SELECT name
FROM info
WHERE genre LIKE '%comedy%'
    AND sql IN ('Intermediate', 'Advanced')

-- GROUP 7 & 8
-- There was a saying that those people whose favorite number is
-- lesser than 10 has a higher chance of having a partner before
-- Christmas while those who’s favorite number is 69 is doomed to be
-- single. Show us how many people have a high chance of getting a
-- partner before this year end. (Take note, the “Favorite Number:“
-- column is in the data type TEXT)
-- * your query should show 1 column with 1 row having the count of 
-- people with the given condition
SELECT count(timestamp)
FROM info
WHERE number > 10
    AND number != 69;

-- GROUP 9 & 10
-- The speaker for the fundamentals of SQL wanted to take someone
-- out on a date, he wants to have someone who was excited, or happy
-- during or before the event. Moreover, he wanted to just have a
-- friendly afternoon with the person, so he wanted someone who is
-- studying first. Can you give him some suggestion and show him
-- the names and what they felt?
-- * your query should show 2 columns with 16 rows having the name
-- and feelings
SELECT name, feeling
FROM info
WHERE (
        feeling LIKE '%excited%'
        OR feeling LIKE '%happy%'
    )
    AND status LIKE '%study first%';
-- UPDATED QUESTION
-- The speaker for the fundamentals of SQL wanted to take someone
-- out on a date, he wants to have someone who was excited, or happy
-- during or before the event. Can you give him some suggestion and
-- show him the names and what they felt?
-- * your query should show 2 columns with 16 rows having the name
-- and feelings
SELECT name, feeling
FROM info
WHERE feeling LIKE '%excited%'
    OR feeling LIKE '%happy%';
