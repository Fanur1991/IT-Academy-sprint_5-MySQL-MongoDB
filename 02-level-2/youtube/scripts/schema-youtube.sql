CREATE DATABASE IF NOT EXISTS youtube;
USE youtube;

CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  user_name VARCHAR(30) UNIQUE NOT NULL,
  birthdate DATE NOT NULL,
  gender VARCHAR(11),
  country VARCHAR(30),
  postal_code VARCHAR(30)
);

CREATE TABLE Videos (
  video_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  size FLOAT,
  file_name VARCHAR(255),
  duration FLOAT,
  thumbnail VARCHAR(60),
  views INT DEFAULT 0,
  likes INT DEFAULT 0,
  dislikes INT DEFAULT 0,
  status ENUM('public', 'hidden', 'private') NOT NULL,
  upload_date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Tags (
  tag_id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(30) NOT NULL
);

CREATE TABLE Video_tags (
  video_id INT,
  tag_id INT,
  PRIMARY KEY (video_id, tag_id),
  FOREIGN KEY (video_id) REFERENCES Videos(video_id),
  FOREIGN KEY (tag_id) REFERENCES Tags(tag_id)
);

CREATE TABLE Channels (
  channel_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  channel_name VARCHAR(255) NOT NULL,
  description TEXT,
  creation_date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Subscriptions (
  user_id INT,
  channel_id INT,
  subscription_date DATETIME,
  PRIMARY KEY (user_id, channel_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (channel_id) REFERENCES Channels(channel_id)
);

CREATE TABLE Video_likes_dislikes (
  user_id INT,
  video_id INT,
  type ENUM('like', 'dislike'),
  action_date DATETIME,
  PRIMARY KEY (user_id, video_id, type),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Playlists (
  playlist_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  playlist_name VARCHAR(255) NOT NULL,
  creation_date DATE,
  status ENUM('public', 'private') NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Playlists_video (
  playlist_id INT,
  video_id INT,
  PRIMARY KEY (playlist_id, video_id),
  FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
  FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Comments (
  comment_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  video_id INT,
  comment_text TEXT NOT NULL,
  comment_date DATETIME,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);

CREATE TABLE Comment_likes_dislikes (
  user_id INT,
  comment_id INT,
  type ENUM('like', 'dislike'),
  action_date DATETIME,
  PRIMARY KEY (user_id, comment_id, type),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (comment_id) REFERENCES Comments(comment_id)
);
