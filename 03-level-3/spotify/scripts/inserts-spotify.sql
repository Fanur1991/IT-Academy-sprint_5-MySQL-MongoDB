-- Inserting Users
INSERT INTO Users (email, password, user_name, birthdate, gender, country, postal_code, user_type) VALUES
('user1@example.com', 'secure1234', 'musicfan1', '1990-05-15', 'male', 'USA', '10001', 'premium'),
('user2@example.com', 'password234', 'audiophile2', '1992-08-23', 'female', 'Canada', 'M5H 2N2', 'free'),
('user3@example.com', 'verysecure123', 'songlover3', '1988-11-30', 'other', 'UK', 'SW1A 1AA', 'premium'),
('user4@example.com', 'mypassword', 'melody4', '1995-02-19', 'female', 'Australia', '2000', 'free'),
('user5@example.com', 'pass12345', 'beatmaster5', '1993-07-21', 'male', 'Germany', '10115', 'premium');

-- Inserting data for Subscriptions
INSERT INTO Subscriptions (user_id, start_date, renewal_date, payment_method) VALUES
(1, '2021-01-01', '2022-01-01', 'credit_card'),
(3, '2021-03-15', '2022-03-15', 'paypal'),
(5, '2021-05-20', '2022-05-20', 'credit_card');

-- Inserting data for Payment Info
INSERT INTO Payment_info (subscription_id, card_number, expiry_month, expiry_year, security_code, paypal_username) VALUES
(1, '4111111111111111', 12, 2024, 123, NULL),
(2, NULL, NULL, NULL, NULL, 'dev3_paypal'),
(3, '5500000000000004', 10, 2023, 321, NULL);

-- Inserting data for Payments
INSERT INTO Payments (subscription_id, payment_date, order_number, total) VALUES
(1, '2021-01-01', 'ORDER001', 120.00),
(2, '2021-03-15', 'ORDER002', 99.99),
(3, '2021-05-20', 'ORDER003', 150.00);

-- Inserting Playlists
INSERT INTO Playlists (user_id, playlist_name, creation_date, status, deletion_date) VALUES
(1, 'Workout Hits', CURDATE(), 'active', NULL),
(2, 'Chill Vibes', CURDATE(), 'active', NULL),
(3, 'Top Charts', CURDATE(), 'active', NULL),
(4, 'Morning Routine', CURDATE(), 'deleted', NULL),
(5, 'Party Mix', CURDATE(), 'active', NULL);

-- Inserting Artists
INSERT INTO Artists (name, image_url) VALUES
('Adele', 'https://example.com/images/adele.jpg'),
('The Weeknd', 'https://example.com/images/theweeknd.jpg'),
('Taylor Swift', 'https://example.com/images/taylorswift.jpg'),
('Drake', 'https://example.com/images/drake.jpg'),
('Billie Eilish', 'https://example.com/images/billieeilish.jpg');

-- Inserting Albums
INSERT INTO Albums (artist_id, title, publication_year, cover_image_url) VALUES
(1, '25', 2015, 'https://example.com/covers/25.jpg'),
(2, 'After Hours', 2020, 'https://example.com/covers/afterhours.jpg'),
(3, '1989', 2014, 'https://example.com/covers/1989.jpg'),
(4, 'Scorpion', 2018, 'https://example.com/covers/scorpion.jpg'),
(5, 'When We All Fall Asleep, Where Do We Go?', 2019, 'https://example.com/covers/whenweallfallasleep.jpg');

-- Inserting Songs
INSERT INTO Songs (album_id, title, duration, plays) VALUES
(1, 'Hello', 4.55, 1500000),
(1, 'Send My Love', 3.43, 500000),
(2, 'Blinding Lights', 3.20, 2000000),
(2, 'Heartless', 3.18, 1000000),
(3, 'Shake It Off', 3.39, 2500000),
(3, 'Blank Space', 3.51, 3000000),
(4, 'God has Plan', 3.19, 1800000),
(4, 'Nice For What', 3.30, 1700000),
(5, 'Bad Guy', 3.14, 2900000),
(5, 'Bury a Friend', 3.13, 900000);

-- Inserting Playlist Songs
INSERT INTO Playlist_songs (playlist_id, song_id, user_id, added_date) VALUES
(1, 1, 1, CURDATE()),
(1, 4, 1, CURDATE()),
(2, 5, 2, CURDATE()),
(2, 6, 2, CURDATE()),
(3, 7, 3, CURDATE()),
(3, 8, 3, CURDATE()),
(4, 9, 4, CURDATE()),
(5, 10, 5, CURDATE());

-- Inserting Favorites
INSERT INTO Favorites (user_id, song_id, album_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3);

-- Artist Follows
INSERT INTO Artist_follows (user_id, artist_id, follow_date) VALUES
(1, 2, NOW()),
(2, 1, NOW()),
(3, 5, NOW()),
(4, 3, NOW()),
(5, 4, NOW());

-- Related Artists
INSERT INTO Related_artists (artist_id, related_artist_id) VALUES
(1, 2),
(1, 3),
(2, 3),
(2, 4),
(3, 4),
(3, 5),
(4, 5),
(5, 1);

