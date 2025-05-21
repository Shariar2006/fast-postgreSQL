SELECT * FROM students;

-- group 

SELECT country, count(*), avg(age)
FROM students
GROUP BY
    country;

SELECT country, count(*), avg(age)
FROM students
GROUP BY
    country
HAVING -- akhane WHERE use korle hobe na karon WHERE ta protita row ar upor kaj kore group ar upor kore na
    avg(age) > 20.5;

-- count students born in each year
SELECT extract(
        YEAR
        FROM dob
    ) as birth_year, count(*)
FROM students
GROUP BY
    birth_year;