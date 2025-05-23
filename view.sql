
-- kono query reuse korte hole view create korte hoy

CREATE View dept_salary
AS
SELECT department_name, avg(e2.salary)
FROM employees e2
    JOIN departments d2 USING(department_id)
GROUP BY department_name;


SELECT * FROM dept_salary;