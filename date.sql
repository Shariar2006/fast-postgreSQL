
-- show your current time zone
SHOW timezone;

-- show timestamp
SELECT now()

-- create time table without time zone and with time zone
CREATE Table timeZ (ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone);

INSERT INTO timez VALUES('2025-05-20 08:35:53', '2025-05-20 08:35:53');

SELECT * FROM timez;


-- current date or time
SELECT CURRENT_DATE;
-- or
SELECT now()::date;


-- formate time 
SELECT to_char(now(), 'yyyy-mm-dd');
SELECT to_char(now(), 'dd/mm/yyyy');


-- current date ar thake ager date 
SELECT CURRENT_DATE - INTERVAL '1 year';


-- get age by date
SELECT age(CURRENT_DATE, '2006-03-13');
SELECT *, age(CURRENT_DATE, dob) FROM students;


-- extract month|day|year from date
SELECT extract( YEAR FROM '2006-05-20'::date)