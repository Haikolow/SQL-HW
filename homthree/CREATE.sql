CREATE TABLE IF NOT EXISTS genres (
	id serial PRIMARY KEY,	
	genre_name varchar(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS artists (
	id serial PRIMARY KEY,
	artist_name varchar(60) NOT NULL UNIQUE,
	alias varchar(80)
);

CREATE TABLE IF NOT EXISTS genres_artists (
	CONSTRAINT ptk PRIMARY KEY (genre_id, artists_id),	
	artists_id integer NOT NULL REFERENCES artists(id),
	genre_id integer NOT NULL REFERENCES genres(id)
);

CREATE TABLE IF NOT EXISTS albums (
	id serial PRIMARY KEY,
	album_name varchar(80) NOT NULL,
	date_release integer
);

CREATE TABLE IF NOT EXISTS album_artists (
	CONSTRAINT fk PRIMARY KEY (album_id, artists_id),
	artists_id SERIAL NOT NULL REFERENCES artists(id),
	album_id SERIAL NOT NULL REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS tracks (
	id serial PRIMARY KEY,
	album_id integer REFERENCES albums(id),
	track_name varchar(80),
	track_time integer NOT NULL
);

CREATE TABLE IF NOT EXISTS collections (
	id_collection serial PRIMARY KEY,
	collection_name varchar(60),
	date_release integer NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks_collections (
	CONSTRAINT fpk PRIMARY KEY (collection_id, track_id),
	collection_id integer NOT NULL REFERENCES collections(id_collection),
	track_id integer NOT NULL REFERENCES tracks(id)
);