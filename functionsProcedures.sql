/*

                    @Non-Procedural Approach:
    1. Declarative Queries: Focuses on writing declarative SQL queries to retrieve, insert, update, or delete data from the database.
    2. Simplicity: Emphasizes simplicity by expressing operations in terms of what data is needed.
    3. SQL Functions: Supports SQL functions, which are single SQL statements that return a value or set of values.
    4. Performance: Can sometimes offer better performance for simple operations due to the optimized query execution plans generated
    by the database engine.                    

*/


CREATE Function emp_count()
RETURNS INT
LANGUAGE SQL
AS
$$
    SELECT count(*) FROM employees
$$;

SELECT emp_count();


CREATE Function delete_emp_by_id(p_emp_id INT)
RETURNS void
LANGUAGE SQL
AS
$$
    DELETE FROM employees WHERE employee_id = p_emp_id;
$$;

SELECT delete_emp_by_id(30);




/*

                    @Procedural Approach:
    1. Language Support: Supports procedural languages like PL/pgSQL, PL/Perl, PL/Python, etc.
    2. Complex Logic: Allows for complex logic using control structures like loops, conditionals, and exception handling.
    3. Variable Support: Supports variable declarations and manipulation within the procedural code.
    4. Stored Procedures/Functions: Provides the ability to create stored procedures or functions,

*/

CREATE Procedure remove_emp()
LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM employees WHERE employee_id = 29;
    END
$$;

CALL remove_emp();


-- variable use kore
CREATE Procedure var_remove_emp()
LANGUAGE plpgsql
AS
$$
    DECLARE
    detected_emp_id INT;
    BEGIN
        SELECT employee_id into detected_emp_id FROM employees WHERE employee_id = 28 ;
        DELETE FROM employees WHERE employee_id = detected_emp_id;
    END
$$;

CALL var_remove_emp();


-- paramatter use kore
CREATE Procedure remove_emp_by_id(p_emp_id int)
LANGUAGE plpgsql
AS
$$
    DECLARE
    detected_emp_id INT;
    BEGIN
        SELECT employee_id into detected_emp_id FROM employees WHERE employee_id = p_emp_id;
        DELETE FROM employees WHERE employee_id = detected_emp_id;
    END
$$;

CALL remove_emp_by_id(27);



SELECT * FROM employees;