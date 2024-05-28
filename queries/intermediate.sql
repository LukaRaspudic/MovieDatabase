-- Get the average rating of a particular movie
SELECT AVG(Rating) AS AverageRating
FROM Reviews
WHERE MovieID = (SELECT MovieID FROM Movies WHERE Title = 'Inception');

-- List the top 5 highest-rated movies
SELECT Movies.Title, AVG(Reviews.Rating) AS AverageRating
FROM Movies
JOIN Reviews ON Movies.MovieID = Reviews.MovieID
GROUP BY Movies.Title
ORDER BY AverageRating DESC
LIMIT 5;
