-- Identify the most prolific actor
SELECT Actors.Name, COUNT(MovieActors.MovieID) AS MovieCount
FROM Actors
JOIN MovieActors ON Actors.ActorID = MovieActors.ActorID
GROUP BY Actors.Name
ORDER BY MovieCount DESC
LIMIT 1;

-- Find movies that belong to multiple genres (assuming a different schema for multi-genre)
SELECT Movies.Title
FROM Movies
JOIN MovieGenres ON Movies.MovieID = MovieGenres.MovieID
GROUP BY Movies.Title
HAVING COUNT(MovieGenres.GenreID) > 1;
