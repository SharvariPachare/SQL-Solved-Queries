CREATE DATABASE INTERVIEW;
USE INTERVIEW;

-- Write a query to create the WORKER table
CREATE TABLE WORKER (
WORKER_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT VARCHAR(25)
); 

-- Write a query to insert values in the WORKER table
INSERT INTO WORKER (WORKER_ID,FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT ) VALUES
(1,"Siddharth","Singh", 80000, '2019-03-20 09:00:00', "HR"),
(2,"Lavesh","Ahir", 300000, '2019-07-11 09:00:00', "Admin"),
(3,"Abhishek","Midha", 500000, '2019-03-20 09:00:00', "HR"),
(4,"Rahul","Mahar", 200000, '2019-03-20 20:00:00', "Admin"),
(5,"Saurabh","Madavi", 90000, '2019-07-11 09:00:00', "Admin"),
(6,"Aman","Nain", 75000,'2019-07-11 09:00:00', "Account"),
(7,"Vaibhav","Varshney", 100000, '2019-02-20 09:00:00', "Account"),
(8,"Farhaan","Majied", 500000, '2019-05-11 09:00:00', "Admin");

SELECT * FROM WORKER;

-- Write a query to create a table Title which has WORKER_REF_ID as foreign key 
CREATE TABLE TITLE (
WORKER_REF_ID INT ,
WORKER_TITLE VARCHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY(WORKER_REF_ID)
REFERENCES WORKER(WORKER_ID) 
ON DELETE CASCADE
);
SELECT * FROM TITLE;

-- Write a query to insert values to table Title
INSERT INTO TITLE(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES(1,"Manager",'2021-02-20 00:00:00'),
(2,"Executive",'2021-06-11 00:00:00'),
(8,"Executive",'2021-06-11 00:00:00'),
(5,"Manager",'2021-06-11 00:00:00'),
(4,"Asst. Manager",'2021-06-11 00:00:00'),
(7,"Executive",'2021-06-11 00:00:00'),
(6,"Lead",'2021-06-11 00:00:00'),
(3,"Lead",'2021-06-11 00:00:00');

-- Write a query to clone a new table WorkCopy from another table
CREATE TABLE WorkerCopy LIKE WORKER;
SELECT * FROM WorkerCopy;

-- Write a query to fetch FIRST_NAME from WORKER table using the alias name as WORKER_NAME
SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;

-- Write a query to fetch FIRST_NAME from the WORKER table in uppercase
SELECT UPPER(FIRST_NAME) FROM WORKER;

-- Write a query to fetch unique values of DEPARTMENT from WORKER table
SELECT DISTINCT DEPARTMENT FROM WORKER;

-- Write a query to to print the FIRST_NAME from WORKER table after replacing a with alter
SELECT REPLACE(FIRST_NAME, 'a', 'A') FROM WORKER;

-- Write a query to fetch FIRST_NAME and LAST_NAME from the WORKER table into a single column COMPLETE_NAME. A space bar should seperate them.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME FROM WORKER;

-- Write a query to print all the workers details from the WORKER table order by FIRST_NAME ascending
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;

-- Write a query to print all the workers details from the WORKER table order by FIRST_NAME ascending and DEPARTMENT decending
SELECT * FROM WORKER ORDER BY FIRST_NAME ASC , DEPARTMENT DESC;

-- Write a query to print details for workers for the first name "Rahul" and "Lavesh" from WORKER table
SELECT * FROM WORKER WHERE FIRST_NAME IN ("Rahul","Lavesh");

-- Write a query to print details for workers excluding first names,"Rahul" and "Lavesh" from WORKER table
SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ("Rahul","Lavesh");

-- Write a query to print details of the workers whose FIRST_NAME start with S
SELECT * FROM WORKER WHERE FIRST_NAME LIKE 'S%';

-- Write a query to print details of the workers whose FIRST_NAME contains a
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%a%';

-- Write a query to print details of the workers whose FIRST_NAME ends with n
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '%n';

-- Write a query to print details of the worker workers whose FIRST_NAME ends with l and contains five alphabets 
SELECT * FROM WORKER WHERE FIRST_NAME LIKE '____l';

-- Write a query to print details of the Workers whose SALARY lies between 100000 and 500000
SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;

-- Write a query to print details of the Workers who have joined in MAR'2019
SELECT * FROM WORKER WHERE YEAR(JOINING_DATE) = 2019 AND MONTH(JOINING_DATE) = 3;

-- Write a query to show current date and time 
SELECT CURDATE(); -- date
SELECT NOW(); -- date and time

-- Write a query to fetch the count of employees working in the department 'Admin'
SELECT COUNT(WORKER_ID) FROM WORKER WHERE DEPARTMENT = "Admin";

-- Write a query to fetch the number of workers in each department in the desending order
SELECT DEPARTMENT,COUNT(WORKER_ID) AS NO_OF_WORKERS
FROM WORKER
GROUP BY DEPARTMENT 
ORDER BY NO_OF_WORKERS DESC;

-- Write a query to fetch departments along with the total salaries paid for each of them
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY FROM WORKER
GROUP BY DEPARTMENT;

-- Write a query to show all the departments along with the number of people in there
SELECT DEPARTMENT, COUNT(*) AS NO_OF_PEOPLE FROM WORKER
GROUP BY DEPARTMENT;

-- Write a query to fetch the departments that have less than four people in it
SELECT DEPARTMENT, COUNT(WORKER_ID) AS NO_OF_PEOPLE FROM WORKER
GROUP BY DEPARTMENT 
HAVING COUNT(WORKER_ID) <4;

-- Write a query to show one row twice in result from table with department HR
SELECT FIRST_NAME , DEPARTMENT FROM WORKER W1 WHERE W1.DEPARTMENT ="HR" 
UNION ALL 
SELECT FIRST_NAME , DEPARTMENT FROM WORKER W2 WHERE W2.DEPARTMENT ="HR";
-- NOTE: UNION keeps the record of unique values and UNION ALL keeps the record of all the values including duplicates

-- Write a query to fetch the names of workers who earn the highest salary
SELECT FIRST_NAME ,SALARY FROM WORKER
WHERE SALARY= (SELECT MAX(SALARY) FROM WORKER);

-- Write a query to show the second highest salary from a table 
SELECT MAX(SALARY) FROM WORKER
WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM WORKER);
-- or
SELECT SALARY FROM WORKER
ORDER BY SALARY DESC 
LIMIT 1,1; -- LIMIT n-1,1;

-- Write a query to show the top 10 records of the table
SELECT * FROM WORKER
ORDER BY SALARY DESC 
LIMIT 10;

-- Write a query to determine the 3rd highest salary from the table
SELECT SALARY FROM WORKER
ORDER BY SALARY DESC 
LIMIT 2,1;

-- Write a SQL query to determine the 3rd highest salary without using limit method
SELECT SALARY FROM Worker W1
WHERE 2 = (SELECT COUNT( DISTINCT ( W2.Salary ) ) FROM Worker W2
WHERE W2.Salary >= W1.Salary
);

-- Write a SQL query to fetch three max salaries from a table
SELECT DISTINCT(SALARY) FROM WORKER a
WHERE 3 >= (SELECT COUNT(DISTINCT(SALARY)) FROM WORKER b
WHERE a.SALARY <= b.SALARY)
ORDER BY a.SALARY DESC;
-- OR
SELECT DISTINCT(SALARY) FROM WORKER
ORDER BY SALARY DESC 
LIMIT 3;

-- Write a SQL query to fetch n max salaries from a table.
SELECT DISTINCT(SALARY) FROM WORKER a
WHERE n >= (SELECT COUNT(DISTINCT(SALARY)) FROM WORKER b WHERE a.SALARY <= b.SALARY)
ORDER BY a.SALARY DESC;

-- Write a SQL query to fetch three min salaries from a table
SELECT DISTINCT(SALARY) FROM WORKER a
WHERE 3 >= (SELECT COUNT(DISTINCT(SALARY)) FROM WORKER b
WHERE a.SALARY >= b.SALARY)
ORDER BY a.SALARY ASC;
-- OR
SELECT DISTINCT(SALARY) FROM WORKER
ORDER BY SALARY ASC
LIMIT 3;

-- Write a SQL query to print details of the Workers who are also manager
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE FROM WORKER W
INNER JOIN TITLE T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE IN ('Manager');

-- Create Job Grades table
CREATE TABLE JOB_GRADE (
GRADE_LEVEL VARCHAR(1),
LOWEST_SALARY INT,
HIGHEST_SALARY INT);

SELECT * FROM JOB_GRADE;

-- Insert values to job_grades table
INSERT INTO JOB_GRADE(GRADE_LEVEL,LOWEST_SALARY,HIGHEST_SALARY) VALUES
("A",10000,75999),
("B",76000,80999),
("C",81000,99999),
("D",100000,199999),
("E",200000,299999),
("F",300000,600000);

-- Write a SQL query to find the first name, last name, salary, and job grade for all employees. 
SELECT W.FIRST_NAME, W.LAST_NAME, W.Salary, J.GRADE_LEVEL
FROM Worker W JOIN JOB_GRADE J
ON W.SALARY BETWEEN J.LOWEST_SALARY AND J.HIGHEST_SALARY;

-- Write a SQL query to compute the average salary of Workers for each job title.
SELECT WORKER_TITLE, AVG(Salary) FROM Worker
NATURAL JOIN Title
GROUP BY WORKER_TITLE;

-- Write a SQL query to print the name of employees having the highest salary in each department
SELECT t.DEPARTMENT,t.FIRST_NAME,t.SALARY FROM
(SELECT MAX(SALARY) AS TOTAL_SALARY,DEPARTMENT FROM WORKER
GROUP BY DEPARTMENT) AS TEMP_NEW
INNER JOIN WORKER t 
ON TEMP_NEW.DEPARTMENT=t.DEPARTMENT
and TEMP_NEW.TOTAL_SALARY =t.SALARY;

-- Write a SQL query to create a view for those Worker belonging to the Department 'HR'
CREATE VIEW HR_STAFF AS
SELECT * FROM WORKER
WHERE DEPARTMENT = "HR";

SELECT * FROM HR_STAFF;
