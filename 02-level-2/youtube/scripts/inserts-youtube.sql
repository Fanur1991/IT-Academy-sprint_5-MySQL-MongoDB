USE youtube;

INSERT INTO Users (email, password, user_name, birthdate, gender, country, postal_code) VALUES
('coder1@example.com', 'password123', 'coder1', '1990-01-01', 'male', 'USA', '90210'),
('coder2@example.com', 'password123', 'coder2', '1992-02-02', 'female', 'Canada', 'K1A0B1'),
('developer3@example.com', 'password123', 'dev3', '1988-03-03', 'male', 'UK', 'SW1A0AA'),
('programmer4@example.com', 'password123', 'programmer4', '1995-04-04', 'female', 'India', '110001');

INSERT INTO Channels (user_id, channel_name, description, creation_date) VALUES
(1, 'Coder1 Tutorials', 'Channel dedicated to programming tutorials.', CURDATE()),
(2, 'Coder2 Workshops', 'Advanced coding workshops and more.', CURDATE()),
(3, 'Dev3 Tips & Tricks', 'Quick development tips and industry tricks.', CURDATE()),
(4, 'Programmer4 Insights', 'Insights and deep dives into programming.', CURDATE());

INSERT INTO Videos (user_id, title, description, size, file_name, duration, thumbnail, status, upload_date) VALUES
(1, 'Intro to Python', 'Python basics for beginners.', 250.00, 'intro_to_python.mp4', 600.00, 'thumb1.jpg', 'public', CURDATE()),
(2, 'JavaScript Advanced', 'Deep dive into JavaScript.', 350.00, 'javascript_advanced.mp4', 800.00, 'thumb2.jpg', 'public', CURDATE()),
(3, 'HTML & CSS', 'Learn HTML and CSS from scratch.', 150.00, 'html_css.mp4', 300.00, 'thumb3.jpg', 'public', CURDATE()),
(4, 'Database Design', 'Understanding the fundamentals of database design.', 450.00, 'database_design.mp4', 900.00, 'thumb4.jpg', 'public', CURDATE());

INSERT INTO Tags (tag_name) VALUES
('python'),
('javascript'),
('html'),
('css'),
('database');

INSERT INTO Video_tags (video_id, tag_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 5);

INSERT INTO Subscriptions (user_id, channel_id, subscription_date) VALUES
(1, 2, NOW()),
(2, 1, NOW()),
(3, 4, NOW()),
(4, 3, NOW());

INSERT INTO Video_likes_dislikes (user_id, video_id, type, action_date) VALUES
(1, 2, 'like', NOW()),
(2, 1, 'like', NOW()),
(3, 4, 'dislike', NOW()),
(4, 3, 'like', NOW());

INSERT INTO Playlists (user_id, playlist_name, creation_date, status) VALUES
(1, 'Python for Beginners', CURDATE(), 'public'),
(2, 'Frontend Mastery', CURDATE(), 'private'),
(3, 'Full Stack Essentials', CURDATE(), 'public'),
(4, 'Data Science Fundamentals', CURDATE(), 'private');

INSERT INTO Playlists_video (playlist_id, video_id) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(4, 1);

INSERT INTO Comments (user_id, video_id, comment_text, comment_date) VALUES
(2, 1, 'Great introduction, thanks for sharing!', NOW()),
(3, 2, 'This was really helpful, especially the part about closures.', NOW()),
(1, 3, 'I never knew CSS could be so interesting!', NOW()),
(4, 4, 'Database design is crucial. This video explains why.', NOW());

INSERT INTO Comment_likes_dislikes (user_id, comment_id, type, action_date) VALUES
(1, 1, 'like', NOW()),
(2, 2, 'like', NOW()),
(3, 3, 'dislike', NOW()),
(4, 4, 'like', NOW());
