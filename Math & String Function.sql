--SQL IN-BUILT FUNCTIONS - MATHEMATICAL AND STRING OPERATIONS
--MATH FUNCTIONS - PART A

-- 1. Display the result of 5 multiply by 30.
SELECT 5 * 30 AS Result;


-- 2. Absolute value of -25, 25, -50 and 50.
SELECT ABS(-25) AS Abs_Neg25,
       ABS(25)  AS Abs_25,
       ABS(-50) AS Abs_Neg50,
       ABS(50)  AS Abs_50;


-- 3. Smallest integer value >= 25.2, 25.7 and -25.2 (CEILING).
SELECT CEILING(25.2)  AS Ceil_25_2,
       CEILING(25.7)  AS Ceil_25_7,
       CEILING(-25.2) AS Ceil_Neg25_2;


-- 4. Largest integer value <= 25.2, 25.7 and -25.2 (FLOOR).
SELECT FLOOR(25.2)  AS Floor_25_2,
       FLOOR(25.7)  AS Floor_25_7,
       FLOOR(-25.2) AS Floor_Neg25_2;


-- 5. Remainder of 5/2 and 5/3 (modulo).
SELECT 5 % 2 AS Rem_5_2,
       5 % 3 AS Rem_5_3;


-- 6. 3 raised to the 2nd power, 4 raised to the 3rd power.
SELECT POWER(3, 2) AS Power_3_2,
       POWER(4, 3) AS Power_4_3;


-- 7. Square root of 25, 30 and 50.
SELECT SQRT(25) AS Sqrt_25,
       SQRT(30) AS Sqrt_30,
       SQRT(50) AS Sqrt_50;


-- 8. Square of 5, 15 and 25.
SELECT SQUARE(5)  AS Sq_5,
       SQUARE(15) AS Sq_15,
       SQUARE(25) AS Sq_25;


-- 9. Value of PI.
SELECT PI() AS Pi_Value;


-- 10. Round 157.732 to 2, 0 and -2 decimal points.
SELECT ROUND(157.732, 2)  AS Round_2dp,
       ROUND(157.732, 0)  AS Round_0dp,
       ROUND(157.732, -2) AS Round_Neg2dp;


-- 11. Exponential value of 2 and 3.
SELECT EXP(2) AS Exp_2,
       EXP(3) AS Exp_3;


-- 12. Logarithm base e (natural log) of 10 and 2.
SELECT LOG(10) AS Ln_10,
       LOG(2)  AS Ln_2;


-- 13. Logarithm base 10 of 5 and 100.
SELECT LOG10(5)   AS Log10_5,
       LOG10(100) AS Log10_100;


-- 14. Sine, cosine and tangent of 3.1415.
SELECT SIN(3.1415) AS Sin_Val,
       COS(3.1415) AS Cos_Val,
       TAN(3.1415) AS Tan_Val;


-- 15. Sign of -25, 0 and 25.
SELECT SIGN(-25) AS Sign_Neg25,
       SIGN(0)   AS Sign_0,
       SIGN(25)  AS Sign_25;


-- 16. Generate a random number.
SELECT RAND() AS Random_Number;



/* =====================================================================
   STRING FUNCTIONS - PART A
   ===================================================================== */

-- 1. Length of (I) NULL  (II) '   hello     '  (III) Blank
SELECT LEN(NULL)            AS Len_Null,        -- returns NULL
       LEN('   hello     ') AS Len_Hello,        -- trailing spaces ignored by LEN
       LEN('')              AS Len_Blank;        -- returns 0


-- 2. Display your name in lower & upper case.
SELECT LOWER('Darshan Patel') AS Name_Lower,
       UPPER('Darshan Patel') AS Name_Upper;


-- 3. Display first three characters of your name.
SELECT LEFT('Darshan', 3) AS First3Chars;


-- 4. Display 3rd to 10th character of your name.
-- ('Darshan Patel' -> starting at position 3, take 8 characters -> positions 3 to 10)
SELECT SUBSTRING('Darshan Patel', 3, 8) AS Char3to10;


-- 5. Convert 'abc123efg' to 'abcXYZefg' & 'abcabcabc' to 'ab5ab5ab5' using REPLACE.
SELECT REPLACE('abc123efg', '123', 'XYZ') AS Replaced1,
       REPLACE('abcabcabc', 'abc', 'ab5') AS Replaced2;


-- 6. Display ASCII code for 'a','A','z','Z',0,9.
SELECT ASCII('a') AS Ascii_a,
       ASCII('A') AS Ascii_A,
       ASCII('z') AS Ascii_z,
       ASCII('Z') AS Ascii_Z,
       ASCII('0') AS Ascii_0,
       ASCII('9') AS Ascii_9;


-- 7. Display character based on number 97,65,122,90,48,57.
SELECT CHAR(97)  AS Char_97,
       CHAR(65)  AS Char_65,
       CHAR(122) AS Char_122,
       CHAR(90)  AS Char_90,
       CHAR(48)  AS Char_48,
       CHAR(57)  AS Char_57;


-- 8. Remove spaces from left of ' hello world  '.
SELECT LTRIM(' hello world  ') AS LeftTrimmed;


-- 9. Remove spaces from right of ' hello world  '.
SELECT RTRIM(' hello world  ') AS RightTrimmed;


-- 10. Display first 4 & last 5 characters of 'SQL Server'.
SELECT LEFT('SQL Server', 4)  AS First4,
       RIGHT('SQL Server', 5) AS Last5;


-- 11. Convert string '1234.56' to number (CAST and CONVERT).
SELECT CAST('1234.56' AS FLOAT)    AS Cast_ToNumber,
       CONVERT(FLOAT, '1234.56')  AS Convert_ToNumber;


-- 12. Convert float 10.58 to integer (CAST and CONVERT).
SELECT CAST(10.58 AS INT)   AS Cast_ToInt,
       CONVERT(INT, 10.58)  AS Convert_ToInt;


-- 13. Put 10 spaces before your name using a function.
SELECT SPACE(10) + 'Darshan' AS Name_With_Leading_Spaces;


-- 14. Combine two strings using + sign as well as CONCAT().
SELECT 'Darshan' + ' ' + 'Patel' AS Combined_PlusOperator,
       CONCAT('Darshan', ' ', 'Patel') AS Combined_ConcatFunction;


-- 15. Find reverse of "Darshan".
SELECT REVERSE('Darshan') AS Reversed_Name;


-- 16. Repeat your name 3 times.
SELECT REPLICATE('Darshan ', 3) AS Repeated_Name;



/* =====================================================================
   STRING FUNCTIONS - PART B & C
   Sample EMPLOYEE table (create & populate so queries can run)
   ===================================================================== */

IF OBJECT_ID('dbo.EMPLOYEE', 'U') IS NOT NULL
    DROP TABLE dbo.EMPLOYEE;

CREATE TABLE dbo.EMPLOYEE (
    EMPID     INT PRIMARY KEY,
    FIRSTNAME VARCHAR(50),
    LASTNAME  VARCHAR(50)
);

INSERT INTO dbo.EMPLOYEE (EMPID, FIRSTNAME, LASTNAME) VALUES
(1, 'Amit',    'Anand'),
(2, 'Bhavesh', 'Barot'),
(3, 'Chetan',  'Chauhan'),
(4, 'Darshan', 'Patel'),
(5, 'Esha',    'Mehta'),
(6, 'Foram',   'Shah');


/* --------------------------- PART B --------------------------- */

-- 17. Display FIRSTNAME and LASTNAME in lowercase and uppercase.
SELECT FIRSTNAME,
       LOWER(FIRSTNAME) AS FirstName_Lower,
       UPPER(FIRSTNAME) AS FirstName_Upper,
       LASTNAME,
       LOWER(LASTNAME)  AS LastName_Lower,
       UPPER(LASTNAME)  AS LastName_Upper
FROM dbo.EMPLOYEE;


-- 18. Display full name by combining FIRSTNAME and LASTNAME.
SELECT CONCAT(FIRSTNAME, ' ', LASTNAME) AS FullName
FROM dbo.EMPLOYEE;


-- 19. Display FIRSTNAME with first 3 characters only.
SELECT FIRSTNAME, LEFT(FIRSTNAME, 3) AS First3
FROM dbo.EMPLOYEE;


-- 20. Display LASTNAME with last 2 characters only.
SELECT LASTNAME, RIGHT(LASTNAME, 2) AS Last2
FROM dbo.EMPLOYEE;


-- 21. Display length of each employee's FIRSTNAME.
SELECT FIRSTNAME, LEN(FIRSTNAME) AS NameLength
FROM dbo.EMPLOYEE;


-- 22. Display FIRSTNAME after replacing 'A' with '@'.
SELECT FIRSTNAME, REPLACE(FIRSTNAME, 'A', '@') AS Modified_FirstName
FROM dbo.EMPLOYEE;


-- 23. Display FIRSTNAME and LASTNAME with '-' between them using CONCAT.
SELECT CONCAT(FIRSTNAME, '-', LASTNAME) AS Name_With_Dash
FROM dbo.EMPLOYEE;


/* --------------------------- PART C --------------------------- */

-- 24. Display FIRSTNAME without first and last character.
SELECT FIRSTNAME,
       SUBSTRING(FIRSTNAME, 2, LEN(FIRSTNAME) - 2) AS Trimmed_FirstName
FROM dbo.EMPLOYEE;


-- 25. Display FIRSTNAME after replacing vowels with '*'.
SELECT FIRSTNAME,
       REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
            FIRSTNAME, 'a', '*'), 'e', '*'), 'i', '*'), 'o', '*'), 'u', '*')
       AS FirstName_VowelsReplaced
FROM dbo.EMPLOYEE;
-- Note: REPLACE is case-sensitive depending on collation. For full case
-- coverage, replace both lowercase and uppercase vowels, e.g. wrap the
-- expression again for 'A','E','I','O','U'.


-- 26. Display employees where combined length of FIRSTNAME and LASTNAME > 10.
SELECT FIRSTNAME, LASTNAME,
       LEN(FIRSTNAME) + LEN(LASTNAME) AS CombinedLength
FROM dbo.EMPLOYEE
WHERE LEN(FIRSTNAME) + LEN(LASTNAME) > 10;


-- 27. Display FIRSTNAME and its reverse.
SELECT FIRSTNAME, REVERSE(FIRSTNAME) AS Reversed_FirstName
FROM dbo.EMPLOYEE;


-- 28. Display employees whose FIRSTNAME and LASTNAME start with the same
--     character, using LEFT().
SELECT FIRSTNAME, LASTNAME
FROM dbo.EMPLOYEE
WHERE LEFT(FIRSTNAME, 1) = LEFT(LASTNAME, 1);