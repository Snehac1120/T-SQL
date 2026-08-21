--Implement Window Functions for Advanced Data Analysis 

SELECT * FROM STUDENT;

-- From the table STUDENT perform the following queries:  
--Part – A: 
--1. Display rank of students based on SPI.
SELECT	STUDENT_NAME,
		SPI,
		RANK() OVER (ORDER BY SPI DESC) AS RK
FROM STUDENT

--2. Display dense rank of students based on SPI. 
SELECT	STUDENT_NAME,
		SPI,
		DENSE_RANK() OVER (ORDER BY SPI DESC) AS RK
FROM STUDENT

--3. Display sequential number for each student record.
SELECT	STUDENT_NAME,
		SPI,
		ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RN
FROM STUDENT

--4. Display branch-wise rank of students. 
SELECT	STUDENT_NAME,
		SPI,
		BRANCH,
		RANK() OVER (
		PARTITION BY BRANCH
		ORDER BY SPI DESC) AS RK
FROM STUDENT

--5. Display branch-wise dense ranking of students. 
SELECT	STUDENT_NAME,
		SPI,
		BRANCH,
		DENSE_RANK() OVER (
		PARTITION BY BRANCH
		ORDER BY SPI DESC) AS RK
FROM STUDENT

--6. Display branch-wise sequential numbering of students.
SELECT	STUDENT_NAME,
		SPI,
		BRANCH,
		ROW_NUMBER() OVER (
		PARTITION BY BRANCH
		ORDER BY SPI DESC) AS RN
FROM STUDENT

--7. Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of SPI. 
SELECT STUDENT_NAME,
		SPI,
		LAG(SPI) OVER (ORDER BY SPI) AS PREV,
		SPI-LAG(SPI) OVER (ORDER BY SPI) AS DIFF
FROM STUDENT

--8. Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.  
SELECT STUDENT_NAME,
		SPI,
		LEAD(SPI) OVER (ORDER BY SPI DESC) AS NEXT,
		SPI-LEAD(SPI) OVER (ORDER BY SPI DESC) AS DIFF
FROM STUDENT

--9. Display top 3 students based on SPI. 
SELECT * FROM (SELECT STUDENT_NAME,
		SPI,
		BRANCH,
		ROW_NUMBER() OVER (
		ORDER BY SPI DESC) AS RK
FROM STUDENT) AS TOP_3
WHERE RK<=3;

--10. Display top 2 students from each branch. 
 SELECT * FROM(
 SELECT	STUDENT_NAME,
		SPI,
		BRANCH,
		DENSE_RANK() OVER (
		PARTITION BY BRANCH
		ORDER BY SPI DESC) AS RK
FROM STUDENT)AS TOP_2
WHERE RK<=2;

--Part – B: 
--11. Display 5th highest SPI. 
SELECT * FROM (SELECT STUDENT_NAME,
		SPI,
		BRANCH,
		ROW_NUMBER() OVER (
		ORDER BY SPI DESC) AS RK
FROM STUDENT) AS RK5
WHERE RK=5;

--12. Display 6th highest SPI.
SELECT * FROM (SELECT STUDENT_NAME,
		SPI,
		BRANCH,
		ROW_NUMBER() OVER (
		ORDER BY SPI DESC) AS RK
FROM STUDENT) AS RK6
WHERE RK=6;

--13. Display students having same ranking.
--SELECT * 
--FROM 
--(SELECT STUDENT_NAME,SPI,
--RANK() OVER (ORDER BY SPI) AS RK
--FROM STUDENT) AS E
--WHERE RK IN
--(SELECT RK
--FROM (SELECT STUDENT_NAME,SPI,
--RANK() OVER (ORDER BY SPI) AS RK
--FROM STUDENT) AS E
--GROUP BY SPI
--HAVING COUNT(*)>1);

SELECT STUDENT_NAME, SPI, RK
FROM (
    SELECT STUDENT_NAME, SPI, 
           DENSE_RANK() OVER (ORDER BY SPI) AS RK
    FROM STUDENT
) AS E
WHERE RK IN (
    SELECT RK 
    FROM (
        SELECT SPI, DENSE_RANK() OVER (ORDER BY SPI) AS RK
        FROM STUDENT
    ) AS T
    GROUP BY RK, SPI
    HAVING COUNT(*) > 1
);


--14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI. 
SELECT STUDENT_NAME,
		SPI,
		LAG(SPI) OVER (ORDER BY SPI) AS PREV,
		LEAD(SPI) OVER (ORDER BY SPI) AS [NEXT]
FROM STUDENT

--15. Display topper of each branch. 
SELECT * FROM (SELECT STUDENT_NAME,
		SPI,
		BRANCH,
		ROW_NUMBER() OVER (
		PARTITION BY BRANCH
		ORDER BY SPI DESC) AS RK
FROM STUDENT) AS RK6
WHERE RK=1;

--Part – C: 
--16. Display students whose SPI is greater than the previous student and less than the next student.
SELECT * FROM
(SELECT STUDENT_NAME,
		SPI,
		LAG(SPI) OVER (ORDER BY SPI) AS PREV,
		LEAD(SPI) OVER (ORDER BY SPI) AS NXT
FROM STUDENT) AS OD
WHERE SPI>PREV AND SPI<NXT

--17. Display branch-wise second topper students. 
SELECT * FROM (SELECT STUDENT_NAME,
		SPI,
		BRANCH,
		ROW_NUMBER() OVER (
		PARTITION BY BRANCH
		ORDER BY SPI DESC) AS RK
FROM STUDENT) AS RK6
WHERE RK=2;

--18. Display students whose rank and dense rank are different.
SELECT * FROM
(SELECT STUDENT_NAME,SPI,
RANK() OVER (ORDER BY SPI DESC) AS RK,
DENSE_RANK() OVER (ORDER BY SPI DESC) AS DENSRK
FROM STUDENT) AS DIFF
WHERE RK!=DENSRK;

--19. Display consecutive students having same branch ordered by SPI. 
--SELECT STUDENT_NAME,BRANCH,STDID,
--ROW_NUMBER() OVER(
--PARTITION BY BRANCH
--ORDER BY SPI
--) AS DATA
--FROM STUDENT

SELECT STDID, STUDENT_NAME, BRANCH, SPI
FROM (
    SELECT 
        STDID, 
        STUDENT_NAME, 
        BRANCH, 
        SPI,
        LAG(BRANCH) OVER (ORDER BY SPI) AS prev_branch,
        LEAD(BRANCH) OVER (ORDER BY SPI) AS next_branch
    FROM STUDENT
) t
WHERE BRANCH = prev_branch OR BRANCH = next_branch



--20. Display students whose SPI difference with previous student is maximum.
SELECT TOP 1 * FROM
(SELECT STUDENT_NAME,
		SPI,
		LAG(SPI) OVER (ORDER BY SPI) AS PREV,
		SPI-LAG(SPI) OVER (ORDER BY SPI) AS DIFF
		FROM STUDENT) AS MX
ORDER BY DIFF DESC