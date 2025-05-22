-- Active: 1747802981480@@127.0.0.1@5432@ph@public

CREATE Table "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) not NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT null,
    -- user_id INTEGER REFERENCES "user" (id) on delete CASCADE -- user delete hole tar post o delete hobe
    -- user_id INTEGER REFERENCES "user" (id) on delete set NULL -- user delete hole tar post ar user_id null hobe
    user_id INTEGER REFERENCES "user" (id) on delete set DEFAULT DEFAULT 2 -- user delete hole tar post ar user_id 2 hobe
);

ALTER TABLE post alter COLUMN user_id set not null

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

-- deletion constraint on delete user
-- cascading deletion -> on delete cascade
-- setting null -> on delete set null
-- restrict deletion -> on delete restrict / on delete no action (default)
-- set default value -> on delete set default value

delete FROM "user" WHERE id = 4;