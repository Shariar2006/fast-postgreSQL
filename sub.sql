
select * FROM departments;

-- employee and departments table age e kora ache practice.sql file a

-- retrieve all employees whose salary is greater than the hightest salary of HR
SELECT * FROM employees JOIN departments USING(department_id) WHERE salary > (SELECT MAX(e2.salary)
FROM employees e2
    JOIN departments d2 USING(department_id)
WHERE
    d2.department_name = 'HR');

-- can return a single value
-- can return multiple rows 
-- can return a single column