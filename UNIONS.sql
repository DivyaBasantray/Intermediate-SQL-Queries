-- UNIONS

-- A union is how you can combine rows together- not columns like we have been doing with joins where one column is put next to another
-- Joins allow you to combine the rows of data


SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;

-- Union is actually shorthand for Union Distinct

SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

-- UNION ALL shows all values

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name, 'Old' AS label
FROM employee_demographics
WHERE age > 50;

-- The Parks department is trying to cut their budget and wants to identify older employees they can push out or high paid employees who they can reduce pay or push out

SELECT first_name, last_name, 'Old' AS label
FROM employee_demographics
WHERE age > 50
UNION
SELECT first_name, last_name, 'Highest Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000;

SELECT first_name, last_name, 'Old Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highest Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000;

SELECT first_name, last_name, 'Old Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highest Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;