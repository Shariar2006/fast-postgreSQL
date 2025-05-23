CREATE TABLE employes(
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments(
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO employes VALUES (1, 'john doe', 101), (2, 'john doe', 102);

INSERT INTO departments VALUES ('favzczxcdfad', 102);


SELECT * FROM employes;
SELECT * FROM departments;



SELECT * FROM employes
 CROSS JOIN departments;

SELECT * FROM employes
 NATURAL JOIN departments;