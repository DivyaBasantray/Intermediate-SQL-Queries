-- WINDOW FUNCTIONS

-- Window Functions are really powerful and are somewhat like a group by - except they don't roll everything up into 1 row when grouping. 
-- Window Functions allow us to look at a partition or a group, but they each keep their own unique rows in the output

SELECT *
FROM employee_demographics;

SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS avg_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id= sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id= sal.employee_id;

-- now if we wanted to see what the salaries were for genders we could do that by using sum, but also we could use order by to get a rolling total.
    
SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id= sal.employee_id;
    
-- ROW NUMBER

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id= sal.employee_id;

-- RANK

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK () OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id= sal.employee_id;

-- DENSE RANK

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK () OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK () OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id= sal.employee_id;