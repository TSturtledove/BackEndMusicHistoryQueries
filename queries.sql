-- Query all of the entries in the Genre table

SELECT *
FROM Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ("DC Talk", 1987);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId)
VAlUES ("Supernatural", "9/22/1998", 3391, "Virgin", 29);


-- Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VAlUES ("Supernatural", 240, "9/22/1998", 2, 29, 24);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VAlUES ("My Friend (So Long)", 251, "9/22/1998", 2, 29, 24);


-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.
--
--     Reminder: Direction of join matters. Try the following statements and see the difference in results.
--
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
--

SELECT a.Title, s.Title, r.ArtistName
FROM Album a
JOIN Song s ON s.AlbumId = a.AlbumId
JOIN Artist r ON r.ArtistId = a.ArtistId
WHERE r.ArtistName
LIKE "DC Talk";


-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(), AlbumId
FROM Song
GROUP BY AlbumId;

SELECT a.Title, COUNT()
FROM Album a
JOIN Song s ON s.AlbumId = a.AlbumId
GROUP BY a.AlbumId;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(), ArtistId
FROM Song
GROUP BY ArtistId;

SELECT r.ArtistName, COUNT()
FROM Artist r
JOIN Song s ON s.ArtistId = r.ArtistId
GROUP BY r.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(), GenreId
FROM Song
GROUP BY GenreId;

SELECT g.Label, COUNT()
FROM Genre g
JOIN Song s ON s.GenreId = g.GenreId
GROUP BY g.GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT a.Title, a.AlbumLength, MAX(a.AlbumLength)
FROM Album a;

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT s.Title, MAX(s.SongLength)
FROM Song s;

-- Modify the previous query to also display the title of the album.

SELECT a.Title, s.Title, MAX(s.SongLength)
FROM Album a
JOIN Song s ON s.AlbumId = a.AlbumId;









--
