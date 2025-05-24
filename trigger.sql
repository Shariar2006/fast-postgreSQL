/*
A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of
actions in response to certain database events or conditions.

Table-Level Events:
- INSERT, UPDATE, DELETE, TRUNCATE
-- Database-Level Events
-. Database Startup, Database Shutdown, Connection start and end etc
- CREATE TRIGGER trigger_name
- [BEFORE | AFTER | INSTEAD OF) (INSERT | UPDATE | DELETE | TRUNCATE]
- ON table_name
- [FOR EACH ROW]

16

- EXECUTE FUNCTION function_name()


trigger shadaronoto kono automatic kaj korar jonno use kora hoy
*/


-- kono user delete hole oi user gula onno akta table a rakha hocche trigger use kore

CREATE Table my_users(
    user_name VARCHAR(50),
    email VARCHAR(50)
);

INSERT INTO my_users VALUES('user1', 'user1@gmail.com'), ('user2', 'user2@gmail.com');
SELECT * FROM my_users;

CREATE TABLE deleted_user_audit
(
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
);

CREATE Function save_deleted_user()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
    BEGIN
        INSERT INTO deleted_user_audit VALUES(OLD.user_name, now());
        RETURN OLD;
    END
$$;

CREATE Trigger save_deleted_user_trigger
BEFORE DELETE
on my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();

DELETE FROM my_users WHERE user_name = 'user1';

SELECT * FROM deleted_user_audit