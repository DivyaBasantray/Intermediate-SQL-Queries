-- STRING FUNCTIONS

-- Length will give us the length of each value

SELECT LENGTH ('skyfall');

SELECT first_name, LENGTH (first_name)
FROM employee_demographics;

SELECT first_name, LENGTH (first_name)
FROM employee_demographics
ORDER BY 2;

-- Upper will change all the string characters to upper case

SELECT UPPER('sky');

-- lower will change all the string characters to lower case

SELECT LOWER('SKY');

SELECT first_name, UPPER (first_name)
FROM employee_demographics;

SELECT TRIM('                 sky             ');

SELECT ('                 sky             ');

SELECT LTRIM('                 sky             ');

SELECT RTRIM('                 sky             ');

-- Substring allows you to specify a starting point and how many characters you want so you can take characters from anywhere in the string. 

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

SELECT LOCATE('a', 'Divya');

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM employee_demographics;