# MovieDatabase

This project is a comprehensive movie database application that uses SQL for data management and queries. It includes a robust database schema to manage information related to movies, actors, directors, genres, and user reviews. Additionally, it features a simple web interface built with Flask for browsing and viewing movie data.

## Project Structure

```txt
movie-database-project/
├── db/
│ ├── init.sql
│ ├── sample_data.sql
├── queries/
│ ├── basic_queries.sql
│ ├── intermediate_queries.sql
│ ├── advanced_queries.sql
├── ui/
│ ├── app.py
│ ├── templates/
│ │ ├── index.html
│ │ ├── movie_details.html
│ ├── static/
│ │ ├── styles.css
├── .env
├── README.md
└── requirements.txt
```


## Prerequisites

- Python 3.x
- MySQL (or any other DBMS of your choice)
- Visual Studio Code (VS Code)
- Required VS Code extensions: SQLTools, Python, Live Server

## Installation and Setup

### Step 1: Install Required Software

1. **Visual Studio Code:** Download and install VS Code from [here](https://code.visualstudio.com/).
2. **DBMS:** Install MySQL or your chosen Database Management System.
3. **Extensions for VS Code:**
   - **SQLTools:** For managing and executing SQL queries.
   - **Python:** For developing the Flask web application.
   - **Live Server:** For running a local web server if developing a front-end.

### Step 2: Set Up the Database

1. **Create Database and Tables:**
   - Open the `db/init.sql` file and execute it using SQLTools or your preferred SQL client to create the database and tables.

   ```sql
   -- init.sql
   CREATE DATABASE MovieDB;
   USE MovieDB;

   CREATE TABLE Genres (
       GenreID INT PRIMARY KEY AUTO_INCREMENT,
       GenreName VARCHAR(255) NOT NULL
   );

   CREATE TABLE Directors (
       DirectorID INT PRIMARY KEY AUTO_INCREMENT,
       Name VARCHAR(255) NOT NULL,
       BirthDate DATE
   );

   CREATE TABLE Movies (
       MovieID INT PRIMARY KEY AUTO_INCREMENT,
       Title VARCHAR(255) NOT NULL,
       ReleaseYear INT,
       GenreID INT,
       DirectorID INT,
       FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
       FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID)
   );

   CREATE TABLE Actors (
       ActorID INT PRIMARY KEY AUTO_INCREMENT,
       Name VARCHAR(255) NOT NULL,
       BirthDate DATE
   );

   CREATE TABLE MovieActors (
       MovieID INT,
       ActorID INT,
       PRIMARY KEY (MovieID, ActorID),
       FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
       FOREIGN KEY (ActorID) REFERENCES Actors(ActorID)
   );

   CREATE TABLE Users (
       UserID INT PRIMARY KEY AUTO_INCREMENT,
       Username VARCHAR(255) NOT NULL,
       Email VARCHAR(255) NOT NULL
   );

   CREATE TABLE Reviews (
       ReviewID INT PRIMARY KEY AUTO_INCREMENT,
       MovieID INT,
       UserID INT,
       Rating INT,
       Comment TEXT,
       ReviewDate DATE,
       FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
       FOREIGN KEY (UserID) REFERENCES Users(UserID)
   );
   ```

## Insert Sample Data:

Open the db/sample_data.sql file and execute it to insert sample data into the database.

```sql
-- sample_data.sql
INSERT INTO Genres (GenreName) VALUES ('Action'), ('Drama'), ('Comedy');

INSERT INTO Directors (Name, BirthDate) VALUES ('Christopher Nolan', '1970-07-30'), ('Quentin Tarantino', '1963-03-27');

INSERT INTO Movies (Title, ReleaseYear, GenreID, DirectorID) VALUES ('Inception', 2010, 1, 1), ('Pulp Fiction', 1994, 2, 2);

INSERT INTO Actors (Name, BirthDate) VALUES ('Leonardo DiCaprio', '1974-11-11'), ('Samuel L. Jackson', '1948-12-21');

INSERT INTO MovieActors (MovieID, ActorID) VALUES (1, 1), (2, 2);

INSERT INTO Users (Username, Email) VALUES ('john_doe', 'john@example.com'), ('jane_doe', 'jane@example.com');

INSERT INTO Reviews (MovieID, UserID, Rating, Comment, ReviewDate) VALUES (1, 1, 5, 'Amazing movie!', '2022-01-01');
```


## Step 3: Writing SQL Queries

1. **Organize Queries:**

In the queries/ folder, create separate SQL files for basic, intermediate, and advanced queries.

```sql
-- basic_queries.sql
SELECT * FROM Movies WHERE ReleaseYear = 2020;

SELECT Actors.Name 
FROM Actors 
JOIN MovieActors ON Actors.ActorID = MovieActors.ActorID 
WHERE MovieActors.MovieID = (SELECT MovieID FROM Movies WHERE Title = 'Inception');
```

2. **Test Queries:**

Use SQLTools to run and test your queries.


## Step 4: Set Up the Flask Web Interface

1. **Set Up Python Environment:**

Create a virtual environment and install necessary packages.

```bash
python3 -m venv venv
source venv/bin/activate
pip install flask mysql-connector-python
```

List dependencies in requirements.txt.

```txt
flask
mysql-connector-python
```

2. **Run the Flask App:**

Start your Flask server.

```bash
python ui/app.py
```