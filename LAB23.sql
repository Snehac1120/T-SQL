--Implement Stored Procedures for Reusable SQL Operations 
-- From the table STUDENT perform the following queries:  
--Part – A:  
--1. INSERT Procedures: Create stored procedures to insert records into STUDENT tables 
--(SP_INSERT_STUDENT) 
CREATE OR ALTER PROC PR_INSERT_STUDENT
@STDID INT,@SNAME VARCHAR(30),@CITY VARCHAR(30),@SPI DECIMAL(4,2),@BRANCH VARCHAR(30) 
AS
BEGIN
		INSERT INTO STUDENT
		VALUES
		(@STDID,@SNAME,@CITY,@SPI,@BRANCH)
END;

EXEC PR_INSERT_STUDENT 115,'PUSHTI','RAJKOT',9.48,'COMPUTER' 
EXEC PR_INSERT_STUDENT 116,'NIKUNJ','SURAT',8.80,'CHEMICAL' 

SELECT * FROM STUDENT

--2. INSERT Procedures: Create stored procedures to insert records into DEPOSIT tables  
--(SP_INSERT_DEPOSIT) 
CREATE OR ALTER PROC PR_INSERT_DEPOSIT 
    @ACTNO INT, 
    @CNAME VARCHAR(30), 
    @BNAME VARCHAR(30), 
    @AMOUNT INT, 
    @ADATE DATE 
AS 
BEGIN 
    INSERT INTO BANK_DEPOSIT 
    VALUES (@ACTNO, @CNAME, @BNAME, @AMOUNT, @ADATE); 
END;

EXEC PR_INSERT_DEPOSIT 118,'HEMENT','BEDI',16000,'05-05-2025';

EXEC PR_INSERT_DEPOSIT 119,'RAVI','MAVDI',24000,'09-07-2024';

--3. UPDATE Procedures: Create stored procedure SP_UPDATE_STUDENT to update Branch in STUDENT 
--table. (Update using studentID) 
CREATE OR ALTER PROC PR_UPDATE_STUDENT
@STDID INT,@BRANCH VARCHAR(30)
AS
BEGIN
    UPDATE STUDENT
    SET BRANCH=@BRANCH
    WHERE STDID=@STDID
END;

EXEC PR_UPDATE_STUDENT 115,'ELECTRICAL'; 
EXEC PR_UPDATE_STUDENT 116,'MECHANICAL';

--4. DELETE Procedures: Create stored procedure SP_DELETE_STUDENT to delete records from STUDENT 
--where Student Name is RAVI. 
CREATE PROC PR_DELETE_STUDENT
@SNAME VARCHAR(30)
AS
BEGIN
        DELETE FROM STUDENT
        WHERE SNAME=@SNAME
END;

EXEC PR_DELETE_STUDENT 'RAVI';

--5. SELECT BY PRIMARY KEY: Create stored procedures to select records by primary key 
--(SP_SELECT_STUDENT_BY_ID) from Student table. (Display All Columns)
CREATE PROC PR_SELECT_STUDENT_BY_ID
@STDID INT
AS
BEGIN
        SELECT * FROM STUDENT
        WHERE STDID=@STDID
END;

EXEC PR_SELECT_STUDENT_BY_ID 101;

--6. Create a stored procedure that shows details of the first 5 students ordered by SPI (Highest First). 
CREATE OR ALTER PROC PR_TOP5 
AS 
BEGIN 
    WITH RS AS (
        SELECT 
            STDID, SNAME, CITY, SPI, BRANCH, 
            ROW_NUMBER() OVER(ORDER BY SPI DESC) AS RK 
        FROM STUDENT
    )
    SELECT STDID, SNAME, CITY, SPI, BRANCH, RK 
    FROM RS 
    WHERE RK<=5;
END;

EXEC PR_TOP5;

--From the table EMPLOYEE perform the following queries:  
--Part – B:   
--7. Create a stored procedure which displays all employee details.
CREATE OR ALTER PROC PR_EMP
AS
BEGIN
        SELECT * FROM EMPLOYEE
END

EXEC PR_EMP;

--8. Create a stored procedure that takes department name as input and returns all the employee in that 
--department. 
CREATE PROC PR_EMPLOYEE
@DEPARTMENT VARCHAR(30)
AS
BEGIN
       SELECT * FROM EMPLOYEE
       WHERE DEPARTMENT=@DEPARTMENT
END;

EXEC PR_EMPLOYEE 'IT';

--Part – C:  
--9. Create a stored procedure which displays department-wise maximum, minimum, and average salary of 
--employee. 
CREATE PROC PR_STAT
@DEPARTMENT VARCHAR(30)
AS
BEGIN
        SELECT MAX(SALARY) AS MX,MIN(SALARY) AS MN,AVG(SALARY) AS AV
        FROM EMPLOYEE
        WHERE DEPARTMENT=@DEPARTMENT
END;

EXEC PR_STAT 'IT';

--10. Create a stored procedure that accepts department name as parameter and returns total salary of their 
--department.
CREATE PROC PR_TOT
@DEPARTMENT VARCHAR(30)
AS
BEGIN
        SELECT SUM(SALARY) AS TOT
        FROM EMPLOYEE
        WHERE DEPARTMENT=@DEPARTMENT
END;

EXEC PR_TOT 'IT';