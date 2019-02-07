CREATE DATABASE life_hacks;

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  name VARCHAR(400),
  email VARCHAR(500),
  password_digest VARCHAR(600)
);

CREATE TABLE catergories(
  id SERIAL PRIMARY KEY,
  name VARCHAR(400)
);

CREATE TABLE ideas(
  id SERIAL PRIMARY KEY,
  title VARCHAR(600),
  description TEXT,
  created_at TIMESTAMP,
  user_id INTEGER,
  catergory_id INTEGER
);

CREATE TABLE comments(
  id SERIAL PRIMARY KEY,
  content TEXT,
  idea_id INTEGER
);

INSERT INTO users(name, email, password_digest) VALUES('Hansol', 'hansol@ga.co.au', 'pudding')

INSERT INTO comments(content, idea_id) VALUES ('awsome idea! thank you for sharing!', 16);
INSERT INTO catergories(name) VALUES('clothes');
INSERT INTO catergories(name) VALUES('cars');
INSERT INTO catergories(name) VALUES('babies');