CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255),
    author VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN DEFAULT FALSE
);

CREATE TABLE musicAlbum (
    id SERIAL PRIMARY KEY,
    genre VARCHAR(255),
    author VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN DEFAULT FALSE,
    on_spotify BOOLEAN DEFAULT FALSE
);

CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE genre_item (
    genre_id INT REFERENCES genre(id),
    item_id INT REFERENCES item(id),
    PRIMARY KEY (genre_id, item_id)
);