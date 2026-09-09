-- SQL Practice Queries

-- Create Table1: MovieDetails
CREATE TABLE MovieDetails
(
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(100),
    Director VARCHAR(100),
    ReleaseYear INT
);

-- Create Table2: MovieFinancials
CREATE TABLE MovieFinancials
(
    FinancialID INT PRIMARY KEY,
    BudgetUSD DECIMAL(12,2),
    BoxOfficeUSD DECIMAL(12,2),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES MovieDetails(MovieID)
);

-- Create Table3: MovieRatingsDuration
CREATE TABLE MovieRatingsDuration
(
    RatingID INT PRIMARY KEY,
    DurationMin INT,
    Rating DECIMAL(12,2),
    Language VARCHAR(100),
    Country VARCHAR(100),
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES MovieDetails(MovieID)
);


-- From the tables MovieDetails, MovieFinancials and MovieRatingsDuration perform the following queries:

--1. Retrieve first five distinct movies along with their title from MovieDetails table.
SELECT DISTINCT TOP 5 MovieID, Title
FROM MovieDetails;


--2. Display the total of the BudgetUSD and BoxOfficeUSD assign the name TotalUSD from MovieFinancials.
SELECT SUM(BudgetUSD + BoxOfficeUSD) AS TotalUSD
FROM MovieFinancials;


--3. Insert the new row with this data (11, The Incredible Hulk, Action, Louis Leterrier, 2008) in MovieDetails table.
INSERT INTO MovieDetails
(MovieID, Title, Genre, Director, ReleaseYear)
VALUES
(11, 'The Incredible Hulk', 'Action', 'Louis Leterrier', 2008);


--4. Set the value of the genre to 'Action' of 'Avengers:Endgame' movie from MovieDetails table.
UPDATE MovieDetails
SET Genre = 'Action'
WHERE Title = 'Avengers:Endgame';


--5. Delete the records with duration of 181 minutes from MovieRatingsDuration table.
DELETE FROM MovieRatingsDuration
WHERE DurationMin = 181;


--6. Add a new column 'Producer' into the MovieDetails table.
ALTER TABLE MovieDetails
ADD Producer VARCHAR(100);


--7. Delete records of MovieFinancials table without removing its table structure.
TRUNCATE TABLE MovieFinancials;


--8. Retrieve all the movies from MovieDetails table with title starting with 'The'.
SELECT *
FROM MovieDetails
WHERE Title LIKE 'The%';


--9. Retrieve name of directors includes 'son' from MovieDetails table.
SELECT Director
FROM MovieDetails
WHERE Director LIKE '%son%';


--10. Convert and display title of all movies in uppercase.
SELECT UPPER(Title) AS Title
FROM MovieDetails;


--11. Display the highest rating from the MovieRatingsDuration table.
SELECT MAX(Rating) AS HighestRating
FROM MovieRatingsDuration;


--12. Calculate the years between current year and movies release year.
SELECT Title,
       YEAR(GETDATE()) - ReleaseYear AS Years
FROM MovieDetails;


--13. Find the languages in which movies have an average rating of greater than 8.0.
--Display the language and the average rating.
SELECT Language,
       AVG(Rating) AS AverageRating
FROM MovieRatingsDuration
GROUP BY Language
HAVING AVG(Rating) > 8.0;


--14. Retrieve the minimum, maximum, and average movie duration for each language in the MovieRatingsDuration table,
--but display only those languages where the average rating is greater than 7.5.
SELECT Language,
       MIN(DurationMin) AS MinimumDuration,
       MAX(DurationMin) AS MaximumDuration,
       AVG(DurationMin) AS AverageDuration
FROM MovieRatingsDuration
GROUP BY Language
HAVING AVG(Rating) > 7.5;


--15. Find the titles of movies whose budget is higher than the average budget of all movies.
--Do not use JOINS.
SELECT Title
FROM MovieDetails
WHERE MovieID IN
(
    SELECT MovieID
    FROM MovieFinancials
    WHERE BudgetUSD >
    (
        SELECT AVG(BudgetUSD)
        FROM MovieFinancials
    )
);


--16. Find the titles of movies that have a box office revenue greater than the average box office revenue of all movies.
SELECT Title
FROM MovieDetails
WHERE MovieID IN
(
    SELECT MovieID
    FROM MovieFinancials
    WHERE BoxOfficeUSD >
    (
        SELECT AVG(BoxOfficeUSD)
        FROM MovieFinancials
    )
);


--17. Create a view with Rating, Language and Country columns with no data and named it MovieReview.
CREATE VIEW MovieReview
AS
SELECT Rating, Language, Country
FROM MovieRatingsDuration
WHERE 1 = 0;


--18. List all movies that have the same director but different genres,
--displaying the director’s name, both movie titles, and their respective genres.
SELECT
    A.Director,
    A.Title AS Movie1,
    A.Genre AS Genre1,
    B.Title AS Movie2,
    B.Genre AS Genre2
FROM MovieDetails A
JOIN MovieDetails B
ON A.Director = B.Director
AND A.MovieID < B.MovieID
AND A.Genre <> B.Genre;


--19. Retrieve the title, director, and box office earnings for all movies that were released after 2010,
--along with their ratings.
SELECT
    M.Title,
    M.Director,
    F.BoxOfficeUSD,
    R.Rating
FROM MovieDetails M
JOIN MovieFinancials F
ON M.MovieID = F.MovieID
JOIN MovieRatingsDuration R
ON M.MovieID = R.MovieID
WHERE M.ReleaseYear > 2010;


--20. List all directors and the number of movies they have directed,
--but only include directors who have directed more than 1 movie.
SELECT
    Director,
    COUNT(*) AS MovieCount
FROM MovieDetails
GROUP BY Director
HAVING COUNT(*) > 1;