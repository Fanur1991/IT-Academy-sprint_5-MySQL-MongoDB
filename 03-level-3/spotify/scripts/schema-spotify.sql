CREATE DATABASE IF NOT EXISTS spotify;

USE spotify;

-- Users Table: Stores both free and premium users with their details.
CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  user_name VARCHAR(30) UNIQUE NOT NULL,
  birthdate DATE NOT NULL,
  gender ENUM('male', 'female', 'other') NOT NULL,
  country VARCHAR(30) NOT NULL,
  postal_code VARCHAR(30) NULL,
  user_type ENUM('free', 'premium') NOT NULL
);

-- Subscription Table: Stores subscription details for premium users.
CREATE TABLE Subscriptions (
  subscription_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  start_date DATE NOT NULL,
  renewal_date DATE NOT NULL,
  payment_method ENUM('credit_card', 'paypal') NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- PaymentInfo Table: Stores payment method details for subscriptions.
CREATE TABLE Payment_info (
  payment_info_id INT AUTO_INCREMENT PRIMARY KEY,
  subscription_id INT NOT NULL,
  card_number VARCHAR(30) NULL, 
  expiry_month INT NULL,
  expiry_year INT NULL,
  security_code INT NULL,
  paypal_username VARCHAR(30),
  FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

-- Payment Table: Stores all payments made by premium users.
CREATE TABLE Payments (
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  subscription_id INT NOT NULL,
  payment_date DATE NOT NULL,
  order_number VARCHAR(255) UNIQUE NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (subscription_id) REFERENCES Subscriptions(subscription_id)
);

-- Playlist Table: Stores playlists created by users.
CREATE TABLE Playlists (
  playlist_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  playlist_name VARCHAR(255) NOT NULL,
  creation_date DATE NOT NULL,
  status ENUM('active', 'deleted') NOT NULL,
  deletion_date DATE NULL,
  is_shared BOOLEAN NOT NULL DEFAULT FALSE, 
  is_public BOOLEAN NOT NULL DEFAULT FALSE, 
  FOREIGN KEY (user_id) REFERENCES Users(user_id) 
);

-- Playlist_access: manage access rights to playlists
CREATE TABLE Playlist_access (
  playlist_id INT NOT NULL,
  user_id INT NOT NULL,
  access_type ENUM('owner', 'collaborator') NOT NULL,
  PRIMARY KEY (playlist_id, user_id),
  FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Artists Table: Stores artists who may have published multiple albums.
CREATE TABLE Artists (
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  image_url VARCHAR(2048) NOT NULL
);

-- Albums Table: Stores albums, each published by a single artist.
CREATE TABLE Albums (
  album_id INT AUTO_INCREMENT PRIMARY KEY,
  artist_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  publication_year YEAR NOT NULL,
  cover_image_url VARCHAR(2048) NULL, 
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- Songs Table: Stores songs, each belonging to a single album.
CREATE TABLE Songs (
  song_id INT AUTO_INCREMENT PRIMARY KEY,
  album_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  duration FLOAT NOT NULL,
  plays INT DEFAULT 0,
  FOREIGN KEY (album_id) REFERENCES Albums(album_id) 
);

-- PlaylistSongs Table: Associates songs with playlists and who added them.
CREATE TABLE Playlist_songs (
  playlist_id INT NOT NULL,
  song_id INT NOT NULL,
  user_id INT NOT NULL,
  added_date DATE NOT NULL,
  PRIMARY KEY (playlist_id, song_id),
  FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id),
  FOREIGN KEY (song_id) REFERENCES Songs(song_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id) 
);

--- Favorites Table: Stores users' favorite songs and albums.
CREATE TABLE Favorites (
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (user_id, song_id, album_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (song_id) REFERENCES Songs(song_id),
  FOREIGN KEY (album_id) REFERENCES Albums(album_id)
);

-- ArtistFollows Table: Represents users following artists.
CREATE TABLE Artist_follows (
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  follow_date DATETIME NOT NULL,
  PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- RelatedArtists Table: Represents relationships between artists for music recommendations.
CREATE TABLE Related_artists (
  artist_id INT NOT NULL,
  related_artist_id INT NOT NULL,
  PRIMARY KEY (artist_id, related_artist_id),
  FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
  FOREIGN KEY (related_artist_id) REFERENCES Artists(artist_id)
);
