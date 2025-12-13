-- JOINS

-- joins allow you to combine 2 tables together (or more) if they have a common column.
-- doesn't mean they need the same column name, but the data in it are the same and can be used to join the tables together.

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- INNER JOIN

SELECT *
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- OUTER JOINS

-- for outer joins we have a left and a right join
-- a left join will take everything from the left table even if there is no match in the join, but will only return matches from the right table.
-- the exact opposite is true for a right join.

SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- SELF JOIN

-- a self join is where you tie a table to itself.

SELECT *
FROM employee_salary;

SELECT *
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id = emp2.employee_id;
    
SELECT *
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id;

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id;

-- JOINING MULTIPLE TABLES TOGETHER

SELECT *
FROM parks_departments;

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id;

-- since it's an inner join it got rid of andy because he wasn't a part of any department.

-- if we do a left join we would still include him because we are taking everything from the left table which is the salary table in this instance

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
LEFT JOIN parks_departments AS dept
	ON dept.dept_id = sal.department_id;