-- Active: 1747802981480@@127.0.0.1@5432@ph@public

CREATE Table "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) not NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT null,
    user_id INTEGER REFERENCES "user" (id)
);

INSERT INTO
    "user" (username)
VALUES ('akash'),
    ('batash'),
    ('sagor'),
    ('nodi');

INSERT INTO
    post (title, user_id)
VALUES (
        'Enjoying a sunny day with Akash! @',
        2
    ),
    (
        'Batash just shared an amazing recipe! @',
        1
    ),
    (
        'Exploring adventures with Sagor. ',
        4
    ),
    (
        'Nodi''s wisdom always leaves me inspired. ',
        4
    );

SELECT * FROM "user";

SELECT * FROM post

DROP Table post;

DROP Table "user";

----- post table and user table ar combination a new table -----
SELECT title, username
FROM post
    JOIN "user" on post.user_id = "user".id;
-- akhane order ta matter kore na

SELECT title, username
FROM post
    LEFT JOIN "user" on post.user_id = "user".id;
-- akhane order ta matter kore and akhane left a jei table thakbe tar priority bechi thakbe. left table ar sob data show hobe

SELECT title, username
FROM post
    RIGHT JOIN "user" on post.user_id = "user".id;
-- akhane order ta matter kore and akhane right a jei table thakbe tar priority bechi thakbe. right table ar sob data show hobe