--Название и продолжительность самого длительного трека
SELECT track_name, track_time FROM tracks
where track_time=(select MAX(track_time) FROM tracks);

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name, track_time FROM tracks
WHERE track_time >= (3.5*60);

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name, date_release FROM collections
WHERE date_release BETWEEN '2018' AND '2020';

--Исполнители, чьё имя состоит из одного слова.
SELECT artist_name FROM artists
WHERE artist_name NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my».
SELECT track_name FROM tracks
WHERE track_name iLIKE '%my%';

--Название треков, которые содержат слово «мой» или «my».
SELECT track_name FROM tracks
WHERE track_name iLIKE '%мой%';

--Количество исполнителей в каждом жанре.
SELECT genre_name, count(artist_name) FROM artists
JOIN genres_artists ga ON artists.id = ga.artists_id
JOIN genres ON ga.genre_id = genres.id
GROUP BY genre_name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT al.album_name, al.date_release , count(t.id) FROM albums al
JOIN tracks t ON al.id = t.album_id
WHERE al.date_release BETWEEN 2019 and 2020
GROUP BY al.album_name, al.date_release;

--Средняя продолжительность треков по каждому альбому.
SELECT al.album_name, AVG(t.track_time) FROM albums al
JOIN tracks t ON al.id = t.album_id
GROUP BY al.album_name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT artists.artist_name FROM artists
WHERE id NOT IN (
    SELECT DISTINCT album_artists.artists_id
    FROM album_artists
    JOIN albums ON album_artists.album_id = albums.id
    WHERE date_release = 2020
);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT collection_name FROM collections c
JOIN tracks_collections tc ON c.id_collection = tc.collection_id
JOIN tracks t ON tc.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN album_artists aa ON a.id = aa.album_id
JOIN artists a2 ON aa.artists_id = a2.id
WHERE a2.artist_name LIKE 'Linkin Park';