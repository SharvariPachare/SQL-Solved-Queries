CREATE DATABASE data_new;
USE data_new;
SHOW TABLES;
SELECT * FROM titanic;
SELECT * FROM salaries;

-- Show all columns and rows in the table
SELECT * FROM  salaries;

-- Show only the Employee name and job title column
SELECT EmployeeName,JobTitle FROM salaries;

-- Show the number of employees in the table
SELECT COUNT(*) FROM salaries;

-- Show the unique job title from the table
SELECT DISTINCT(JobTitle) FROM salaries;
SELECT COUNT(DISTINCT(JobTitle)) FROM salaries;

-- Show the job title and overtime pay for all employees with overtime pay greater than 50000
SELECT JobTitle,OvertimePay FROM salaries
WHERE OvertimePay>=50000 ;

-- Show the average base pay for all employees
SELECT AVG(BasePay) AS "Average Basepay" FROM salaries;

-- Show the top 10 highest paid employees
SELECT EmployeeName,TotalPay FROM salaries 
ORDER BY TotalPay DESC
LIMIT 10;

-- Show the average of basepay, overtimepay and otherpay for each employee
SELECT EmployeeName,(BasePay+OvertimePay+OtherPay)/3  AS "average of total pay" FROM salaries;

-- Show all employees who have the word "Manager" in their job title 
SELECT EmployeeName,JobTitle FROM salaries
WHERE JobTitle LIKE "%MANAGER";

-- Show all employees who does not have the word "Manager" in their job title 
SELECT EmployeeName,JobTitle FROM salaries
WHERE JobTitle != "MANAGER";
-- or
SELECT EmployeeName,JobTitle FROM salaries
WHERE JobTitle <> "MANAGER";

-- Show all employees with a base pay between 50000 and 75000
SELECT EmployeeName,BasePay FROM salaries
WHERE BasePay BETWEEN 50000 AND 75000;
-- OR
SELECT EmployeeName,BasePay FROM salaries
WHERE BasePay>=50000 AND BasePay<=75000;

-- Show all employees with a base pay less than 50000 or total pay greater than 100000
SELECT EmployeeName,BasePay,TotalPay FROM salaries
WHERE BasePay<=50000 AND TotalPay>=100000;

-- Show all employees with a total pay benefits value between 125000 and 150000 and a job title containing the word "Director"
SELECT EmployeeName,TotalPayBenefits,JobTitle FROM salaries
WHERE TotalPayBenefits BETWEEN 125000 AND 150000
AND JobTitle LIKE "%DIRECTOR";

-- Show all job titles with average base pay in decending order, atleast 100000 and order them by average base pay in decending order
SELECT JobTitle, AVG(BasePay) as "Average_BasePay" FROM salaries
GROUP BY JobTitle
HAVING AVG(BasePay) >=100000
ORDER BY Average_BasePay DESC; 

-- Delete the column
ALTER TABLE salaries DROP COLUMN Notes ;
ALTER TABLE salaries DROP COLUMN Benefits ;
ALTER TABLE salaries DROP COLUMN Status ;
SELECT * FROM salaries;

-- Update the base pay of all employees with job title containing "manager" by Increasing it by 10%
UPDATE salaries
SET BasePay= BasePay*1.1 
WHERE JobTitle LIKE "%MANAGER";

-- Delete all employees who have no Overtimepay
DELETE FROM salaries
WHERE OvertimePay=0;

SELECT * FROM salaries
WHERE OvertimePay=0;
