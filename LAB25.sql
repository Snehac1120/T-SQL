--Implement User Defined Functions (UDF) in SQL (Intermediate) 
-- Part – A:  
--1. Implement scalar function to return "Welcome to DBMS Lab".
CREATE FUNCTION FN_STRING ()
RETURNS VARCHAR(30) 
AS 
BEGIN 
    DECLARE @RESULT VARCHAR(30);
    SET @RESULT = 'Welcome to DBMS Lab';
    RETURN @RESULT;
END;

SELECT DBO.FN_STRING()

--2. Implement scalar function to calculate simple interest. 
CREATE FUNCTION FN_SI
(@P INT,@R INT,@T INT)
RETURNS INT
AS
BEGIN
        DECLARE @SI INT
        SET @SI= (@P*@R*@T)/100
        RETURN @SI
END;

SELECT DBO.FN_SI(20,5,2)

--3. Implement scalar function to find difference in days between two dates. 
-- 1. Create the scalar function
CREATE  OR ALTER FUNCTION FN_DAY_DIFF (@D1 DATE, @D2 DATE) 
RETURNS INT 
AS 
BEGIN 
    DECLARE @DIFF INT;
    SET @DIFF = DATEDIFF(DAY, @D1, @D2);
    RETURN @DIFF;
END;

SELECT DBO.FN_DAY_DIFF('2025-05-01', '2026-09-04') 

--4. Implement scalar function to check whether number is odd or even. 
CREATE FUNCTION FN_ODD_EVEN
(@N INT)
RETURNS VARCHAR(4)
AS
BEGIN
        DECLARE @RESULT VARCHAR(4)
        IF @N%2 = 0
        SET @RESULT='EVEN'
        ELSE
        SET @RESULT ='ODD'
        RETURN @RESULT
END;

SELECT DBO.FN_ODD_EVEN(7);

--5. Implement scalar function to print numbers from 1 to N. 
CREATE OR ALTER FUNCTION FN_PRINT_N 
(@N INT) 
RETURNS VARCHAR(30) 
AS 
BEGIN 
    DECLARE @I INT = 1; 
    DECLARE @ANS VARCHAR(30) = '';  

    WHILE @I <= @N 
    BEGIN 
        SET @ANS = @ANS + CAST(@I AS VARCHAR(10)) + ' '; 
        SET @I = @I + 1; 
    END 

    RETURN @ANS
END

SELECT DBO.FN_PRINT_N(4)

--Part – B:  
--6. Implement scalar function to calculate factorial of given number.
CREATE FUNCTION FN_FACT
(@N INT)
RETURNS INT
AS
BEGIN
        DECLARE @I INT=1;
        DECLARE @FACT INT=1;

        WHILE @I<=@N
        BEGIN
        SET @FACT=@FACT*@I
        SET @I=@I+1
        END
        RETURN @FACT
END

SELECT DBO.FN_FACT(4);

--7. Implement scalar function to check palindrome number.
CREATE FUNCTION FN_PALINDROME
(@N INT)
RETURNS VARCHAR(30)
AS
BEGIN
        DECLARE @NUM VARCHAR(30) = CAST(ABS(@N) AS VARCHAR(30))
        DECLARE @ANS INT

        IF @NUM=REVERSE(@N)
        SET @ANS=1
        ELSE
        SET @ANS=0
        RETURN @ANS
END

SELECT DBO.FN_PALINDROME(121);

--8. Implement scalar function to find maximum of three numbers. 
CREATE FUNCTION FN_MAX_THREE
(@N1 INT,@N2 INT,@N3 INT)
RETURNS INT
AS
BEGIN
        DECLARE @ANS INT
        IF @N1>@N2 AND @N1>@N3
        SET @ANS=@N1
        ELSE IF @N2>@N3 AND @N2>@N1
        SET @ANS=@N2
        ELSE
        SET @ANS=@N3
        RETURN @ANS
END

SELECT DBO.FN_MAX_THREE(7,12,4);

--9. Implement scalar function to calculate square and cube of a number. 
CREATE OR ALTER FUNCTION FN_SQ_CUBE (@N INT) 
RETURNS VARCHAR(50) 
AS 
BEGIN 
    DECLARE @SQ INT = @N * @N; 
    DECLARE @CUBE INT = @N * @N * @N; 
    DECLARE @ANS VARCHAR(50) = CAST(@SQ AS VARCHAR(10)) + ' ' + CAST(@CUBE AS VARCHAR(15)); 
    RETURN @ANS; 
END;


SELECT DBO.FN_SQ_CUBE(2)
      
--From the table EMPLOYEE perform the following queries:  
--Part – C:  
SELECT * FROM EMPLOYEE
--10. Implement scalar function to return employee full details using EID. 
--11. Implement scalar function to return highest salary from a given department. 
--12. Implement scalar function to count total employees in EMPLOYEE table. 
--13. Implement scalar function to find total experience of employee using JoiningYear. 
--14. Implement scalar function to return total number of employees in a given department. 
--15. Implement scalar function to count total employees from a given city.