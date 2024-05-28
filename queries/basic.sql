-- basic_queries.sql
SELECT * FROM Movies WHERE ReleaseYear = 2020;

SELECT Actors.Name 
FROM Actors 
JOIN MovieActors ON Actors.ActorID = MovieActors.ActorID 
WHERE MovieActors.MovieID = (SELECT MovieID FROM Movies WHERE Title = 'Inception');
