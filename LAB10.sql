--Implement SQL In-Built Functions for Mathematical and String Operations

--Math functions 
-- Part – A: 
--1. Display the result of 5 multiply by 30. 
SELECT 5*30 AS MUL;

--2. Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25) AS ABS_NEG25,
       ABS(25)  AS ABS_25,
       ABS(-50) AS ABS_NEG50,
       ABS(50)  AS ABS_50;

--3. Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 
SELECT CEILING(25.2)  AS CEIL_25_2,
       CEILING(25.7)  AS CEIL_25_7,
       CEILING(-25.2) AS CEIL_NeG_25_2;

--4. Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2. 
SELECT FLOOR(25.2)  AS FLOOR_25_2,
       FLOOR(25.7)  AS FLOOR_25_7,
       FLOOR(-25.2) AS FLOOR_NEG_25_2;

--5. Find out remainder of 5 divided 2 and 5 divided by 3. 
SELECT 5 % 2 AS REM_5_2,
       5 % 3 AS REM_5_3;

--6. Find out value of 3 raised to 2nd power and 4 raised 3rd power. 
SELECT POWER(3, 2) AS POWER_3_2,
       POWER(4, 3) AS POWER_4_3;

--7. Find out the square root of 25, 30 and 50. 
SELECT  SQRT(25) AS SQRT_25 ,
        SQRT(30) AS SQRT_30,
        SQRT(50) AS SQRT_50;

--8. Find out the square of 5, 15, and 25. 
SELECT SQUARE(5) AS SQ_5 , 
       SQUARE(15) AS SQ_15,
       SQUARE(25) AS SQ_25;

--9. Find out the value of PI. 
SELECT PI();

--10. Find out round value of 157.732 for 2, 0 and -2 decimal points.
SELECT ROUND(157.732,2) AS ROUND_2,
       ROUND(157.732,0) AS ROUND_0,
       ROUND(157.732,-2) AS ROUND_NEG_2;

--11. Find out exponential value of 2 and 3.
SELECT EXP(2) AS EXP_2,
       EXP(3) AS EXP_3;

--12. Find out logarithm having base e of 10 and 2. 
SELECT LOG(10) AS LOG_10,
       LOG(2) AS LOG_2;

--13. Find logarithm base 10 of 5 and 100 
SELECT LOG10(5) AS LOG_5,
       LOG10(100) AS LOG_100;

--14. Find sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415) AS SIN_NO,
       COS(3.1415) AS COS_NO,
       TAN(3.1415) AS TAN_NO;

--15. Find sign of -25, 0 and 25. 
SELECT SIGN(-1626) AS SIGN_NEG,
       SIGN(0) AS SIGN_ZERO,
       SIGN(25) AS SIGN_POS;

--16. Generate random number using function.
SELECT RAND() AS RANDOM_NO;

--String functions 
--Part – A: 
--1. Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank 
SELECT LEN(NULL) AS NULL_LLEN,
       LEN('       HELLO    ') AS LEN_HELLO,
       LEN('') AS BLANK_LEN;

--2. Display your name in lower & upper case. 
SELECT LOWER('SNEHA') AS LOWER_NAME, 
       UPPER('sNeHa') AS UPPER_NAME;

--3. Display first three characters of your name.
SELECT LEFT('SNEHA',3) AS FIRST_3;

--4. Display 3rd to 10th character of your name. 
SELECT SUBSTRING('SNEHA CHANDARANA',3,8) AS FROM_3_TO_10;

--5. Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
SELECT REPLACE('abc123efg', '123', 'XYZ') AS Replaced1,
       REPLACE('abcabcabc', 'abc', 'ab5') AS Replaced2;

--6. Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9. 
SELECT ASCII('a') AS Ascii_a,
       ASCII('A') AS Ascii_A,
       ASCII('z') AS Ascii_z,
       ASCII('Z') AS Ascii_Z,
       ASCII('0') AS Ascii_0,
       ASCII('9') AS Ascii_9;

--7. Write a query to display character based on number 97, 65,122,90,48,57.
SELECT CHAR(97)  AS Char_97,
       CHAR(65)  AS Char_65,
       CHAR(122) AS Char_122,
       CHAR(90)  AS Char_90,
       CHAR(48)  AS Char_48,
       CHAR(57)  AS Char_57;

--8. Write a query to remove spaces from left of a given string ‘ hello world  ‘. 
SELECT LTRIM('          HELLO WORLD'          ) AS LEFT_TRIM;

--9. Write a query to remove spaces from right of a given string ‘ hello world  ‘.
SELECT RTRIM('          HELLO WORLD'          ) AS RIGHT_TRIM;

--10. Write a query to display first 4 & Last 5 characters of ‘SQL Server’. 
SELECT LEFT('SQL Server', 4) AS First4,
       RIGHT('SQL Server', 5) AS Last5;

--11. Write a query to convert a string ‘1234.56’ to number (Use cast and convert function). 
SELECT CAST('1234.56' AS VARCHAR)    AS Cast_FN,
       CONVERT(VARCHAR, '1234.56')  AS CONVERT_FN;

--12. Write a query to convert a float 10.58 to integer (Use cast and convert function).
SELECT CAST(10.58 AS INT)   AS Cast_ToInt,
       CONVERT(INT, 10.58)  AS Convert_ToInt;

--13. Put 10 space before your name using function. 
SELECT SPACE(10) + 'Darshan';

--14. Combine two strings using + sign as well as CONCAT ().
SELECT CONCAT('DARSHAN','+','UNIVERSITY');

--15. Find reverse of “Darshan”.
SELECT REVERSE('DARSHAN');

--16. Repeat your name 3 times.
SELECT REPLICATE('SNEHA ',3);
 

--Part – B: Perform following queries on EMPLOYEE table.
--17. Display FIRSTNAME and LASTNAME in lowercase and uppercase.
SELECT FIRSTNAME,
       LOWER(FIRSTNAME) AS FirstName_Lower,
       UPPER(FIRSTNAME) AS FirstName_Upper,
       LASTNAME,
       LOWER(LASTNAME)  AS LastName_Lower,
       UPPER(LASTNAME)  AS LastName_Upper
FROM EMPLOYEE;

--18. Display full name by combining FIRSTNAME and LASTNAME.
SELECT FIRSTNAME,LASTNAME, CONCAT(FIRSTNAME,' ' ,LASTNAME) AS FULL_NAME FROM EMPLOYEE;

--19. Display FIRSTNAME with first 3 characters only.
SELECT FIRSTNAME FROM EMPLOYEE
WHERE LEN(FIRSTNAME)=3;

--20. Display LASTNAME with last 2 characters only. 
SELECT LASTNAME FROM EMPLOYEE
WHERE LEN(LASTNAME)=2;

--21. Display length of each employee’s FIRSTNAME. 
SELECT FIRSTNAME,LEN(FIRSTNAME) AS LEN_NAME FROM EMPLOYEE;

--22. Display FIRSTNAME after replacing ‘A’ with ‘@’. 
SELECT REPLACE(FIRSTNAME,'A','@') FROM EMPLOYEE;

--23. Display FIRSTNAME and LASTNAME with - between them using CONCAT.
SELECT CONCAT(FIRSTNAME,'-',LASTNAME) FROM EMPLOYEE;


--Part – C: Perform following queries on EMPLOYEE table. 
--24. Display FIRSTNAME without first and last character.
SELECT SUBSTRING(FIRSTNAME,2,LEN(FIRSTNAME)-2) FROM EMPLOYEE;

--25. Display FIRSTNAME after replacing vowels with '*'.
--REMOVED
SELECT FIRSTNAME,
        REPLACE(
         REPLACE(
           REPLACE(
             REPLACE(
               REPLACE(FIRSTNAME, 'A', '*'),
             'E', '*'),
           'I', '*'),
         'O', '*'),
       'U', '*') AS REPLACED_FIRSTNAME
FROM employee;


--26. Display employees where combined length of FIRSTNAME and LASTNAME is greater than 10. 
SELECT FIRSTNAME , LASTNAME AS FULLNAME FROM EMPLOYEE
WHERE LEN(CONCAT(FIRSTNAME,LASTNAME))>10;

--27. Display FIRSTNAME and its reverse. 
SELECT REVERSE(FIRSTNAME) FROM EMPLOYEE;

--28. Display employees whose FIRSTNAME and LASTNAME start with same character using LEFT()
SELECT FIRSTNAME, LASTNAME FROM EMPLOYEE
WHERE LEFT(FIRSTNAME,1) = LEFT(LASTNAME,1);