-- Active: 1747802981480@@127.0.0.1@5432@ph@public

CREATE Table "user"(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) not NULL
);

CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT null,
    user_id INTEGER REFERENCES "user"(id)
)