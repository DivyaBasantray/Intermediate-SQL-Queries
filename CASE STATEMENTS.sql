-- CASE STATEMENT

-- A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages (Python) or even things like Excel.

SELECT first_name, 
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young' 
END
FROM employee_demographics;

SELECT first_name, 
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
	WHEN age BETWEEN 31 AND 50 THEN 'Old'
	WHEN age >= 50 THEN 'Oldest'
END AS Age_Bracket
FROM employee_demographics;

-- Pawnee Council sent out a memo of their bonus and pay increase structure so we need to follow it
-- Basically if they make less than 50k then they get a 5% raise
-- if they make more than 50k they get a 7% raise
-- they get a bonus of 10% if they work for the Finance Department

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN (salary + salary* 0.05)
END AS New_Salary
FROM employee_salary;  

-- OR (ALTERNATE SOLUTION)

SELECT first_name, last_name, salary, dept_id,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END AS Bonus
FROM employee_salary;

-- This shows that Ben is the only one who get's a bonus