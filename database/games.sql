CREATE TABLE authors (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(20), 
  last_name VARCHAR(20),
);

CREATE TABLE games (
  id INT GENERATED ALWAYS AS IDENTITY, 
  genre_id INT, 
  author_id INT, 
  source_id INT, 
  label_id INT, 
  publish_date DATE, 
  archived BOOLEAN,
  multiplayer SMALLINT, 
  last_time_played DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES genres (id), 
  FOREIGN KEY (author_id) REFERENCES authors (id), 
  FOREIGN KEY (source_id) REFERENCES  sources (id),
  FOREIGN KEY (label_id) REFERENCES labels (id)
);

