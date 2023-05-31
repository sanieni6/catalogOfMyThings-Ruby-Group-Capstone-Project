CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre_id INT REFERENCES genre(id),
    author INT REFERENCES author(id),
    label INT REFERENCES label(id),
    publish_date DATE,
    archived BOOLEAN DEFAULT FALSE
);

CREATE TABLE musicAlbum (
    id SERIAL PRIMARY KEY,
    genre_id INT REFERENCES genre(id),
    author INT REFERENCES author(id),
    label INT REFERENCES label(id),
    publish_date DATE,
    archived BOOLEAN DEFAULT FALSE,
    on_spotify BOOLEAN DEFAULT FALSE
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);