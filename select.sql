-- create table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
)

-- insert data
Insert INTO
    students (
        first_name,
        last_name,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
VALUES (
        'John',
        'Doe',
        20,
        'A',
        'Math',
        'john.doe@example.com',
        '2004-01-15',
        '0+',
        'USA'
    ),
    (
        'Jane',
        'Smith',
        21,
        'B',
        'History',
        'jane.smith@example.com',
        '2003-05-20',
        'A-',
        'Canada'
    ),
    (
        'Alice',
        'Johnson',
        19,
        'A',
        'Physics',
        'alice.johnson@example.com',
        '2002-11-08',
        'B+',
        'UK'
    ),
    (
        'Bob',
        'Williams',
        22,
        'C',
        'Chemistry',
        'bob.williams@example.com',
        '2001-07-03',
        'AB-',
        'Australia'
    ),
    (
        'Charlie',
        'Brown',
        20,
        'B',
        'English',
        NULL,
        '2004-03-30',
        'A+',
        'New Zealand'
    ),
    (
        'Emma',
        'Jones',
        23,
        'B',
        'Biology',
        'emma.jones@example.com',
        '2000-09-12',
        'A-',
        'USA'
    ),
    (
        'Michael',
        'Johnson',
        22,
        'C',
        'Physics',
        'michael.johnson@example.com',
        '2002-04-05',
        '0-',
        'Canada'
    ),
    (
        'Olivia',
        'Davis',
        21,
        'A',
        'Math',
        'olivia.davis@example.com',
        '2003-12-18',
        'B-',
        'UK'
    ),
    (
        'William',
        'Taylor',
        20,
        'B',
        'Chemistry',
        NULL,
        '2004-08-30',
        'A+',
        'Australia'
    ),
    (
        'Sophia',
        'Brown',
        24,
        'A',
        'English',
        'sophia.brown@example.com',
        '1999-06-25',
        'AB+',
        'New Zealand'
    ),
    (
        'Liam',
        'Miller',
        19,
        'C',
        'History',
        'liam.miller@example.com',
        '2002-02-10',
        'A-',
        'USA'
    ),
    (
        'Ava',
        'Anderson',
        22,
        'B',
        'Biology',
        'ava.anderson@example.com',
        '2000-11-15',
        'B+',
        'Canada'
    ),
    (
        'Noah',
        'Martinez',
        21,
        'A',
        'Physics',
        NULL,
        '2001-04-28',
        '0+',
        'UK'
    ),
    (
        'Isabella',
        'Clark',
        20,
        'C',
        'Chemistry',
        'isabella.clark@example.com',
        '2003-10-03',
        'A-',
        'Australia'
    ),
    (
        'Ethan',
        'Garcia',
        23,
        'B',
        'Math',
        'ethan.garcia@example.com',
        '2000-07-22',
        'B-',
        'New Zealand'
    ),
    (
        'Sophie',
        'Moore',
        22,
        'A',
        'English',
        'sophie.moore@example.com',
        '2002-12-05',
        'A+',
        'USA'
    ),
    (
        'Mia',
        'Hernandez',
        20,
        'C',
        'History',
        'mia.hernandez@example.com',
        '2004-05-18',
        'AB-',
        'Canada'
    ),
    (
        'James',
        'Young',
        21,
        'B',
        'Biology',
        'james.young@example.com',
        '2003-02-08',
        '0-',
        'UK'
    ),
    (
        'Emma',
        'Gonzalez',
        24,
        'A',
        'Physics',
        NULL,
        '1999-09-30',
        'B+',
        'Australia'
    ),
    (
        'Liam',
        'Wright',
        19,
        'C',
        'Math',
        'liam.wright@example.com',
        '2002-06-14',
        'A+',
        'New Zealand'
    );

-- get all data
SELECT * FROM students

-- get email field data
SELECT email FROM students

-- get email field data but change field name, this change is not permanent
SELECT email as student_email FROM students

-- get data ASC by first name
SELECT * FROM students ORDER BY first_name ASC;

-- get data DESC by first name
SELECT * FROM students ORDER BY first_name DESC;

-- unique country
SELECT DISTINCT country FROM students

-- data filtering

-- select students from the USA
-- select students with 'A' grade in Physics
-- select students with a specific blood group ('A+')
-- select students from the USA or from Australia
-- select students from the USA or from Australia and the age is 20
-- select students older than 20

SELECT * FROM students WHERE country = 'USA';

SELECT * FROM students WHERE grade = 'A' AND course = 'Physics';

SELECT * FROM students WHERE blood_group = 'A+';

SELECT *
FROM students
WHERE
    country = 'USA'
    OR country = 'Australia';

SELECT *
FROM students
WHERE (
        country = 'USA'
        OR country = 'Australia'
    )
    AND age = 20;

SELECT * FROM students WHERE age > 20;

/*
@Scalar function
UPPER() converts a string to uppercase
LOWER() converts a string to lowercase
CONCAT() concatenate two or more strings
LENGTH() returns the number of characters in a string


@Aggregate Functions
AVG()calculate the average of a set of values
MAX() returns the max value in a set
MIN() returns the minimum value in a set
SUM() calculates the sum of values in a set
COUNT() counts the number of rows in a set

*/

-- proti row ar jonno 1 bar call korbe and 1 data dibe

SELECT upper(first_name) FROM students;

SELECT lower(first_name) FROM students;

SELECT concat(first_name, ' ', last_name) FROM students;

SELECT length(first_name) FROM students;

-- multiple rows ar upor akta opration kore 1 ta data dibe

SELECT avg(age) FROM students;

SELECT max(age) FROM students;

SELECT min(age) FROM students;

SELECT sum(age) FROM students;

SELECT count(*) FROM students;

-- table a nullable data ar jonno query

SELECT *
FROM students
WHERE
    email = NULL -- ❌ ai vabe kora jabe na karon null ar shate jai kichu kori na kno se null e return korbe. tai ata onno vabe handle korte hobe

-----  handle nullable field -----

-- jei email gula null na sei gula dibe
SELECT * FROM students WHERE email IS NOT NULL;

-- jei email gula null sei gula dibe
SELECT * FROM students WHERE email IS NULL;

-- null field a akta default value set kora
SELECT COALESCE( email, '--Email not provided--' ) FROM students;

-- multiple or handle shortly

-- long line
SELECT *
FROM students
WHERE
    country = 'USA'
    OR country = 'UK'
    OR country = 'Canada';

-- short line
SELECT * FROM students WHERE country IN ('USA', 'UK', 'Canada')

-- range bujanor khattre between keyword use korte hobe
SELECT * FROM students WHERE age BETWEEN 19 AND 21;

-- search ar khattre like and ilike keyword use kora hoy
---------- like keyword case sensitive -------------
SELECT * FROM students WHERE first_name LIKE '%am';   -- akhane first_name ar first a jai thak na kno last a am ache kina sei ta check kore search hocche

SELECT * FROM students WHERE first_name LIKE 'A%';    -- akhane first_name ar last a jai thak na kno first a A ache kina sei ta check kore search hocche 

SELECT * FROM students WHERE first_name LIKE '___a';  -- akhane "_" dara 1 ta character bojay, ami 3 ta _ use korchi ar mane 3 ta character ar por amar a thakte hobe oi 3 ta character je kono kichu hote pare 


----------- ilike keyword case sensitive na -------------
SELECT * FROM students WHERE first_name ILIKE 'a%';



--- limit ---
SELECT * FROM students LIMIT 5;

SELECT * FROM students 
     WHERE country IN('USA') LIMIT 5;

-- pagination --
SELECT * FROM students LIMIT 5 OFFSET 5 * 0; -- 1st page
SELECT * FROM students LIMIT 5 OFFSET 5 * 1; -- 2nd page
SELECT * FROM students LIMIT 5 OFFSET 5 * 2; -- 3nd page


SELECT * FROM students;

-- delete a row --
DELETE FROM students WHERE grade = 'B';  -- single condition 
DELETE FROM students WHERE grade = 'C' AND country = 'USA';  -- multiple condition



-- update a row --
UPDATE students set email = 'default@gmail.com'
     WHERE student_id = 16;