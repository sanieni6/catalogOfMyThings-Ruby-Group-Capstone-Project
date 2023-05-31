CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  genre INT REFERENCES genre (id),
  author INT REFERENCES author (id),
  label INT REFERENCES label (id),
  publish_date DATE,
  archived BOOLEAN,
  publisher VARCHAR(255),
  cover_state VARCHAR(255)
);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);