INSERT INTO genres(id, genre_name)
VALUES(1, 'Pop-music'),
      (2, 'Hip - hop'),
      (3, 'Rock'),
      (4, 'Metal'),
      (5, 'R-n-B');

INSERT INTO artists(id, artist_name)
VALUES(1, 'Shakira'),
	  (2, 'Jennifer Lopez'),
	  (3, 'JAY-Z'),
	  (4, 'M.I.A'),
	  (5, 'Linkin Park'),
	  (6, 'System of a Down'),
	  (7, 'Disturbed'),
	  (8, 'The Weeknd'),
	  (9, 'Клава Кока');
      
INSERT INTO albums(id, album_name, date_release)
VALUES(1, 'Laundry Service', '2001'),
      (2, 'Sale el Sol', '2010'),
      (3, 'On the 6', '1999'),
      (4, 'LOVE?', '2011'),
      (5, 'The Blueprint 3', '2009'),
      (6, '4:44', '2017'),
      (7, 'Ctrl', '2020'),
      (8, 'Hybrid Theory', '2000'),
      (9, 'Meteora', '2003'),
      (10, 'Hypnotize', '2005'),
      (11, 'Mezmerize', '2005'),
      (12, 'Evolution', '2018'),
      (13, 'A Reason to Fight', '2018'),
      (14, 'My Dear Melancholy,', '2018'),
      (15, 'After Hours', '2020'),
      (16, 'Пьяную домой', '2020');
      
INSERT INTO tracks(id, album_id, track_name, track_time)
VALUES(1, 1, 'Whenever, Wherever', 190),
      (2, 1, 'The One', 206),
      (3, 2, 'Antes de las Seis', 153),
      (4, 2, 'Mariposas', 209),
      (5, 3, 'If You Had My Love', 209),
      (6, 3, 'Waiting for Tonight', 244),
      (7, 4, 'Papi (Album Version)', 206),
      (8, 4, 'Hypnotico', 202),
      (9, 5, 'What We Talkin About', 243),
      (10, 5, 'On to the Next One', 250),
      (11, 6, 'Kill Jay Z', 155),
      (12, 6, 'Marcy Me', 153),
      (13, 7, 'CTRL', 201),
      (14, 8, 'By Myself', 185),
      (15, 8, 'A Place for My Head', 186),
      (16, 9, 'Numb', 183),
      (17, 9, 'Session', 135),
      (18, 10, 'Lonely Day', 148),
      (19, 10, 'Attack', 185),
      (20, 11, 'B.Y.O.B.', 249),
      (21, 11, 'Cigaro', 127),
      (22, 12, 'Are You Ready', 254),
      (23, 12, 'No More', 212),
      (24, 13, 'A Reason to Fight', 267),
      (25, 14, 'Call Out My Name', 209),
      (26, 14, 'Try Me', 205),
      (27, 15, 'Alone Again', 246),
      (28, 15, 'Hardest to Love', 199),
      (29, 16, 'Пьяную домой', 141);
      
INSERT INTO collections(id_collection, collection_name, date_release)
VALUES(1, 'Monday', 2020),
      (2, 'Tuesday', 2010),
      (3, 'Wednesday', 2018),
      (4, 'Thursday', 2017),
      (5, 'Friday', 2019);

INSERT INTO genres_artists
VALUES(1,1),(2,1),(3,2),(4,2),
      (5,3),(6,4),(7,4),(8,5),
      (9,1);

INSERT INTO album_artists
VALUES(1,1),(1,2),(2,3),(2,4),
      (3,5),(3,6),(4,7),(5,8),
      (5,9),(6,10),(6,11),(7,12),
      (7,13),(8,14),(8,15),(9,16);

INSERT INTO tracks_collections
VALUES(1,1),(1,2),(1,3),(1,4),
      (1,5),(2,6),(2,7),(2,8),
      (2,9),(2,10),(3,11),(3,12),
      (3,13),(3,14),(3,15),(4,16),
      (4,17),(4,18),(4,19),(4,20),
      (5,21),(5,22),(5,25),(1,26),
      (2,27),(3,28),(5,29);