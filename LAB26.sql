--Implement User Defined Functions (UDF) in SQL (Advanced)

-- From the table STUDENT perform the following queries:
SELECT * FROM STUDENT

--Part – A:
--1. Create a table valued function to display all student records.
CREATE OR ALTER FUNCTION FN_ALL_STUDENTS ()
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
);

SELECT * FROM DBO.FN_ALL_STUDENTS();

--2. Create a table valued function that accepts CITY and returns all students from that city.
CREATE OR ALTER FUNCTION FN_STUDENT_CITY (@CITY VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE CITY = @CITY
);

SELECT * FROM DBO.FN_STUDENT_CITY('RAJKOT');


--3. Create a table valued function that accepts BRANCH and returns all students of that branch.
CREATE OR ALTER FUNCTION FN_STUDENT_BRANCH (@BRANCH VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE BRANCH = @BRANCH
);

SELECT * FROM DBO.FN_STUDENT_BRANCH('COMPUTER');


--4. Create a table valued function that accepts SPI and returns students whose SPI is greater than entered SPI.
CREATE OR ALTER FUNCTION FN_SPI_GREATER (@SPI DECIMAL(4,2))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE SPI > @SPI
);

SELECT * FROM DBO.FN_SPI_GREATER(8.00);


--5. Create a table valued function that accepts MIN_SPI and MAX_SPI and returns students whose SPI lies between given range.
CREATE OR ALTER FUNCTION FN_SPI_RANGE 
(@MIN_SPI DECIMAL(4,2), @MAX_SPI DECIMAL(4,2))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE SPI BETWEEN @MIN_SPI AND @MAX_SPI
);

SELECT * FROM DBO.FN_SPI_RANGE(7.00, 9.00);


--Part – B:
--6. Create a table valued function that accepts STDID and returns details of that student.
CREATE OR ALTER FUNCTION FN_STUDENT_DETAILS (@STDID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE STDID = @STDID
);

SELECT * FROM DBO.FN_STUDENT_DETAILS(101);


--7. Create a table valued function that accepts CITY and returns students whose SPI is greater than 7 from that city.
CREATE OR ALTER FUNCTION FN_CITY_SPI_GREATER (@CITY VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE CITY = @CITY AND SPI > 7
);

SELECT * FROM DBO.FN_CITY_SPI_GREATER('RAJKOT');


--8. Create a table valued function that accepts BRANCH and returns students whose SPI is less than 8 from that branch.
CREATE OR ALTER FUNCTION FN_BRANCH_SPI_LESS (@BRANCH VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT * FROM STUDENT
    WHERE BRANCH = @BRANCH AND SPI < 8
);

SELECT * FROM DBO.FN_BRANCH_SPI_LESS('COMPUTER');


--9. Create a table valued function that accepts TOPN and returns top N students based on SPI.
CREATE OR ALTER FUNCTION FN_TOP_N_STUDENTS (@TOPN INT)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP (@TOPN) *
    FROM STUDENT
    ORDER BY SPI DESC
);

SELECT * FROM DBO.FN_TOP_N_STUDENTS(3);

--10. Create a table valued function that accepts BRANCH and returns highest SPI student from that branch.
CREATE OR ALTER FUNCTION FN_HIGHEST_SPI_BRANCH (@BRANCH VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM STUDENT
    WHERE BRANCH = @BRANCH
    AND SPI = (SELECT MAX(SPI) FROM STUDENT WHERE BRANCH = @BRANCH)
);

SELECT * FROM DBO.FN_HIGHEST_SPI_BRANCH('COMPUTER');

--Part – C:
--11. Create a table valued function that accepts CITY and returns total students from that city.
CREATE OR ALTER FUNCTION FN_TOTAL_STUDENTS_CITY (@CITY VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT COUNT(*) AS TOTAL_STUDENTS
    FROM STUDENT
    WHERE CITY = @CITY
);

SELECT * FROM DBO.FN_TOTAL_STUDENTS_CITY('RAJKOT');

--12. Create a table valued function that accepts BRANCH and returns students ordered by SPI in descending order.
CREATE OR ALTER FUNCTION FN_BRANCH_SPI_DESC (@BRANCH VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM STUDENT
    WHERE BRANCH = @BRANCH
);

SELECT * FROM DBO.FN_BRANCH_SPI_DESC('COMPUTER')
ORDER BY SPI DESC;

--13. Create a table valued function that accepts CITY and returns top 3 student from that city based on SPI.
CREATE OR ALTER FUNCTION FN_TOP_3_CITY (@CITY VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 3 *
    FROM STUDENT
    WHERE CITY = @CITY
    ORDER BY SPI DESC
);

SELECT * FROM DBO.FN_TOP_3_CITY('RAJKOT');

--14. Create a table valued function that accepts STDID and returns student rank based on SPI (RANK).
CREATE OR ALTER FUNCTION FN_STUDENT_RANK (@STDID INT)
RETURNS TABLE
AS
RETURN
(
    SELECT STDID, SNAME, CITY, SPI, BRANCH,
           RANK() OVER (ORDER BY SPI DESC) AS STUDENT_RANK
    FROM STUDENT
    WHERE STDID = @STDID
);

SELECT * FROM DBO.FN_STUDENT_RANK(101);


--15. Create a table valued function that accepts BRANCH and returns students having second highest SPI from that branch.
CREATE OR ALTER FUNCTION FN_SECOND_HIGHEST_SPI (@BRANCH VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
    SELECT STDID, SNAME, CITY, SPI, BRANCH
    FROM
    (
        SELECT *,
               DENSE_RANK() OVER (ORDER BY SPI DESC) AS SPI_RANK
        FROM STUDENT
        WHERE BRANCH = @BRANCH
    ) AS T
    WHERE SPI_RANK = 2
);

SELECT * FROM DBO.FN_SECOND_HIGHEST_SPI('COMPUTER');