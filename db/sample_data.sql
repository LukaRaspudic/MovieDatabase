-- sample_data.sql
INSERT INTO Genres (GenreName) VALUES ('Action'), ('Drama'), ('Comedy');

INSERT INTO Directors (Name, BirthDate) VALUES ('Christopher Nolan', '1970-07-30'), ('Quentin Tarantino', '1963-03-27');

INSERT INTO Movies (Title, ReleaseYear, GenreID, DirectorID) VALUES ('Inception', 2010, 1, 1), ('Pulp Fiction', 1994, 2, 2);

INSERT INTO Actors (Name, BirthDate) VALUES ('Leonardo DiCaprio', '1974-11-11'), ('Samuel L. Jackson', '1948-12-21');

INSERT INTO MovieActors (MovieID, ActorID) VALUES (1, 1), (2, 2);

INSERT INTO Users (Username, Email) VALUES ('john_doe', 'john@example.com'), ('jane_doe', 'jane@example.com');

INSERT INTO Reviews (MovieID, UserID, Rating, Comment, ReviewDate) VALUES (1, 1, 5, 'Amazing movie!', '2022-01-01');
