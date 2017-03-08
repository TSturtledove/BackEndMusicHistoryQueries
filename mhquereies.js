// This is an in class review of how to do the music history query

// Query all of the entries in the Genre table
SELECT * FROM genre

// Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO artist
VALUES (null, "Billy Beetz", 2017)


// Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO album
VALUES (null, "Bears and Beetz", "2/28/2017", 364738, "Epic Records", (SELECT artistid FROM artist WHERE artistname = "Billy Beetz"),
(SELECT genreid FROM genre WHERE label = "Latin"))

//could also do

INSERT INTO
SELECT NULL, "Bears and Beetz", "2/28/2017", 364738, "Epic Records", ar.artistid, g.GenreId
FROM artistid ar, genre g
WHERE ar.artistname = "Billy Beetz"
AND g.label = "Latin";


// Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO song
VALUES(null, "Beetz for Dinner", 3647, "02/10/17",
(SELECT genreid FROM genre WHERE label = "Latin"),
(SELECT artistid FROM artist WHERE artistname = "Billy Beetz"),
(SELECT albumid FROM album WHERE Title = "Bears and Beetz"))



// Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.
SELECT song.Title AS "Song Title", album.Title AS "Album", a.artistname AS "Artist"
FROM artist a
LEFT JOIN album ON a.artistid = album.artistid
LEFT JOIN song ON a.artistid = song.artistid
WHERE a.artistname = "Billy Beetz"


        Reminder: Direction of join matters. Try the following statements and see the difference in results.

    SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
    SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

// Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT album.title AS album,
COUNT(song.title) AS "# of tracks"
FROM album, song
ON album.albumid = song.albumid
GROUP BY album.title


// Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT artist.artistname AS artist,
COUNT(song.title) AS "# of tracks"
FROM artist, song
ON artist.artistid = song.artistid
GROUP BY artist.artistname


// Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT genre.label AS Genre,
COUNT(song.title) AS "# of tracks"
FROM genre, song
ON genre.genreid = song.genreid
GROUP BY genre.label

// Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT title, MAX(AlbumLength)
FORM album

// Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT title, MAX(SongLength)
FROM song

// Modify the previous query to also display the title of the album.
SELECT album.title, song.title, MAX(SongLength)
FROM song, album
ON song.albumid = album.albumid
