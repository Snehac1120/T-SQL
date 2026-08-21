--From the tables EMPLOYEE perform the following queries 
--Part – A: 
--1. Display the Highest, Lowest Salary and Label the columns Maximum, Minimum respectively.
SELECT MAX(SALARY) AS MAXIMUM , MIN(SALARY) AS MINIMUM FROM EMPLOYEE;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively. 
SELECT SUM(SALARY) AS Total_Sal , AVG(SALARY) AS Average_Sal FROM EMPLOYEE;

--3. Find total number of employees of EMPLOYEE table. 
SELECT COUNT(EID) AS EMP FROM EMPLOYEE;

--4. Find highest salary from Rajkot city. 
SELECT MAX(SALARY) AS MAX_SAL FROM EMPLOYEE
WHERE CITY='RAJKOT';

--5. Give maximum salary from IT department.
SELECT MAX(SALARY) AS MAX_IT_SAL FROM EMPLOYEE
WHERE DEPARTMENT='IT';

--6. Count employee department is HR.
SELECT COUNT(EID) AS EMP_HR FROM EMPLOYEE
WHERE DEPARTMENT='HR';

--7. Display average salary of Admin department.
SELECT AVG(SALARY) AS AVG_SAL FROM EMPLOYEE
WHERE DEPARTMENT='ADMIN';

--8. Display total salary of HR department.
SELECT SUM(SALARY) AS TOT_SAL FROM EMPLOYEE
WHERE DEPARTMENT='HR';

--9. Count total number of cities of employee without duplication.
SELECT COUNT(DISTINCT CITY) AS CITY_COUNT FROM EMPLOYEE;

--10. Count unique departments.
SELECT COUNT(DISTINCT DEPARTMENT) AS UNI_DEP FROM EMPLOYEE;

--11. Display minimum salary of employee who belongs to Ahmedabad. 
SELECT MIN(SALARY) AS MIN_SAL  FROM EMPLOYEE
WHERE CITY='AHMEDABAD';

--12. Find city wise highest salary. 
SELECT MAX(SALARY) AS MAX_SAL,CITY FROM EMPLOYEE
GROUP BY CITY;

--13. Find department wise lowest salary.
SELECT MIN(SALARY) AS MIN_SAL,DEPARTMENT FROM EMPLOYEE
GROUP BY DEPARTMENT;

--14. Display minimum salary in each city.
SELECT MIN(SALARY) AS CITY_MAX_SAL,CITY FROM EMPLOYEE
GROUP BY CITY;

--15. Display average salary of employees from Surat.
SELECT AVG(SALARY) AS SURAT_AVG_SAL,CITY FROM EMPLOYEE
WHERE CITY='SURAT'
GROUP BY CITY;

--16. Display total salary of female employees. 
SELECT SUM(SALARY) AS TOT_FEM_SAL,GENDER FROM EMPLOYEE
WHERE GENDER='FEMALE'
GROUP BY GENDER;

--17. Count number of male employees.
SELECT GENDER,COUNT(EID) AS MAL_EMP FROM EMPLOYEE
WHERE GENDER='MALE'
GROUP BY GENDER;

--18. Display city with the total number of employees belonging to each city. 
SELECT CITY,COUNT(EID) AS CITY_EMP FROM EMPLOYEE
WHERE CITY IS NOT NULL
GROUP BY CITY;

--19. Count number of employees in each city where gender is MALE.
SELECT COUNT(EID) AS MAL_EMP ,CITY FROM EMPLOYEE
WHERE GENDER='MALE'
GROUP BY CITY;

--20. Display maximum salary in each department where city is not Ahmedabad.
SELECT MAX(SALARY) AS NOT_AHM_MIN_SAL ,DEPARTMENT FROM EMPLOYEE
WHERE CITY!='AHMEDABAD'
GROUP BY DEPARTMENT;
 
--Part – B: 
--21. Display minimum salary in each city where gender is FEMALE.
SELECT MIN(SALARY) AS MIN_SAL_FEM ,CITY FROM EMPLOYEE
WHERE GENDER='FEMALE'
GROUP BY CITY;

--22. Give total salary of each department of EMPLOYEE table.
SELECT SUM(SALARY) AS TOT_SAL ,DEPARTMENT FROM EMPLOYEE
GROUP BY DEPARTMENT;

--23. Give average salary of each department of EMPLOYEE table without displaying the respective department name.
SELECT AVG(SALARY)  AS DEP_AVG_SAL FROM EMPLOYEE
GROUP BY DEPARTMENT;

--24. Count the number of employees for each department in every city. 
SELECT COUNT(EID) AS DEP_CITY_EMP ,DEPARTMENT,CITY FROM EMPLOYEE
GROUP BY DEPARTMENT,CITY;

--25. Calculate the total salary distributed to male and female employees. 
 SELECT SUM(SALARY) AS GENDER_WISE_SALARY,GENDER FROM EMPLOYEE
 GROUP BY GENDER;

--Part – C: 
--26. Give city wise maximum and minimum salary of female employees. 
SELECT MAX(SALARY) AS MAX_SAL, MIN(SALARY) AS MIN_SAL FROM EMPLOYEE
WHERE GENDER='FEMALE';

--27. Calculate department, city, and gender wise average salary.
SELECT AVG(SALARY) AS AVG_SAL ,DEPARTMENT,CITY,GENDER FROM EMPLOYEE
GROUP BY DEPARTMENT,CITY,GENDER;

--28. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT (MAX(SALARY) - MIN (SALARY)) AS DIFFERENCE FROM EMPLOYEE;

--29. Display sum of salaries of department wise where department name consist 5 letter.
SELECT SUM(SALARY) AS TOT_SAL_DEP ,DEPARTMENT FROM EMPLOYEE
WHERE DEPARTMENT LIKE '_____'
GROUP BY DEPARTMENT;

--30. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT MAX(SALARY) AS MAX_SAL,DEPARTMENT,CITY FROM EMPLOYEE
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT,CITY;