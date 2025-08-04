CREATE DATABASE IF NOT EXISTS ig_clone;

USE ig_clone;
DROP TABLE IF EXISTS photo_tags;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS likes;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS follows;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS users;

USE ig_clone;
CREATE TABLE users (
  id int AUTO_INCREMENT,
  username VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (id)
);

CREATE TABLE photos (
  id int AUTO_INCREMENT,
  image_url VARCHAR(255) NOT NULL,
  user_id int NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
  id int AUTO_INCREMENT,
  comment_text VARCHAR(255) NOT NULL,
  user_id int NOT NULL,
  photo_id int NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE likes (
  user_id int NOT NULL,
  photo_id int NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  PRIMARY KEY (user_id, photo_id)
);

CREATE TABLE follows (
  follower_id int NOT NULL,
  followee_id int NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (followee_id) REFERENCES users(id),
  PRIMARY KEY (followee_id, follower_id)
);

CREATE TABLE tags (
  id int AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
  photo_id int NOT NULL,
  tag_id int NOT NULL,
  FOREIGN KEY (photo_id) REFERENCES photos(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id)
);
