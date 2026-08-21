--Perform SQL Queries Using Subqueries

--Condition: = ANY
--Meaning: Equal to at least one valueAlternative 
--Approach: Use IN

--Condition: > ANY
--Meaning: Greater than the smallest valueAlternative 
--Approach: Use > (SELECT MIN(...))

--Condition: < ANY
--Meaning: Less than the largest valueAlternative
--Approach: Use < (SELECT MAX(...))

--Condition: <> ALL
--Meaning: Not equal to any valueAlternative
--Approach: Use NOT IN

--Condition: > ALL
--Meaning: Greater than the largest valueAlternative 
--Approach: Use > (SELECT MAX(...))

--Condition: < ALL
--Meaning: Less than the smallest valueAlternative
--Approach: Use < (SELECT MIN(...))

--With ANY: If the subquery yields only NULLs, or no match is found among 
--valid values alongside a NULL,
--the result will evaluate to UNKNOWN (effectively acting as false).

--With ALL: If even a single NULL is present in the subquery result set,
--an ALL comparison (like <> ALL) will automatically return no rows at all.
--This happens because SQL cannot definitively prove a condition matches "all" 
--items when one item is unknown.

--From the table STUDENT perform the following queries:  
--Part – A: 
SELECT * FROM STUDENT

--1. Display the details of students whose SPI is greater than the average SPI. 
SELECT * FROM STUDENT
WHERE SPI>(
			SELECT AVG(SPI) FROM STUDENT);

--2. Display the names of students whose SPI is less than the average SPI.
SELECT STUDENT_NAME FROM STUDENT
WHERE SPI<(
			SELECT AVG(SPI) FROM STUDENT);

--3. Display the student details who has the highest SPI. 
SELECT * FROM STUDENT
WHERE SPI=(
			SELECT MAX(SPI) FROM STUDENT);

--4. Display the student details who has the lowest SPI. 
SELECT * FROM STUDENT
WHERE SPI=(
			SELECT MIN(SPI) FROM STUDENT);

--5. Display the students whose SPI is greater than SPI of student DHARMIK. 
SELECT * FROM STUDENT
WHERE SPI>(
			SELECT SPI FROM STUDENT
			WHERE STUDENT_NAME='DHARMIK');

--6. Display the students whose SPI is less than SPI of student RIYA.
SELECT * FROM STUDENT
WHERE SPI<(
			SELECT SPI FROM STUDENT
			WHERE STUDENT_NAME='RIYA');

--7. Display the students who belong to the same branch as KRUNAL. 
SELECT * FROM STUDENT
WHERE BRANCH=(
			SELECT BRANCH FROM STUDENT
			WHERE STUDENT_NAME='KRUNAL');

--8. Display the students whose branch is different from HETVI.
SELECT * FROM STUDENT
WHERE BRANCH !=(
			SELECT BRANCH FROM STUDENT
			WHERE STUDENT_NAME='HETVI');

--9. Display the second highest SPI from RESULT table.
SELECT MAX(SPI) AS SEC_HIGHEST_SPI FROM RESULT
WHERE SPI<(
			SELECT MAX(SPI) FROM RESULT);

--10. Display the second lowest SPI from RESULT table.
SELECT MIN(SPI) AS SEC_LOWEST_SPI FROM RESULT
WHERE SPI>(
			SELECT MIN(SPI) FROM RESULT);

--11. Display the names of students whose SPI is above branch-wise average SPI.
SELECT STUDENT_NAME
FROM STUDENT
WHERE SPI > ANY 
(
SELECT AVG(SPI) AS AV FROM STUDENT
GROUP BY BRANCH) 

--12. Display the branch having maximum average SPI.
SELECT BRANCH
FROM STUDENT
GROUP BY BRANCH
HAVING AVG(SPI) = (
SELECT TOP 1 AVG(SPI) AS AV FROM STUDENT
GROUP BY BRANCH
ORDER BY AVG(SPI) DESC
)

SELECT BRANCH FROM STUDENT 
GROUP BY BRANCH
HAVING AVG(SPI)=
(SELECT MAX(AV) FROM
(SELECT AVG(SPI) AS AV FROM STUDENT 
GROUP BY BRANCH) AS AVS)

--13. Display the branch having minimum average SPI.  
SELECT BRANCH FROM STUDENT 
GROUP BY BRANCH
HAVING AVG(SPI)=
(SELECT MIN(AV) FROM
(SELECT AVG(SPI) AS AV FROM STUDENT 
GROUP BY BRANCH) AS AVS)


--From the table STUDENT_INFO and RESULT perform the following queries:  
--Part – B: 
SELECT * FROM STUDENT_INFO
SELECT * FROM RESULT

--14. Display the students whose SPI is greater than all students of ME branch. 


--15. Display the students whose SPI is less than any student of ME branch.  
--16. Display the student details whose SPI is not equal to any SPI of EC branch students.  
--17. Display the names of students who scored higher SPI than student of RNO 103.  
--18. Display the students whose SPI is greater than average SPI of their own branch.  
--19. Display the students whose SPI is greater than the average SPI of CE branch but greater than the 
--maximum SPI of ME branch.  
--20. Display the branch names whose average SPI is greater than the overall average SPI.  
--21. Display the students who have maximum SPI in their respective branch. 
--22. Display the students whose SPI is greater than their average SPI of their branch and greater than overall 
--average SPI.  

--Part – C: 
--23. Display the students whose SPI is greater than at least one student of every branch.  
--24. Display the students whose SPI is less than all students of CE branch.  
--25. Display the branch that contains the student with highest SPI.  
--26. Display the students whose SPI is less than the SPI of every student in CE branch and greater than every 
--student in ME branch.