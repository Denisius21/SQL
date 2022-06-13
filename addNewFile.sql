INSERT INTO videos (user_id,title_video)
VALUES 
('5', 'Tom and Jery'),
('5', 'Big foot'),
('5', 'Mask');

INSERT INTO like_dislike (video_id, like_dislike, user_like_dislike_first_name)
VALUES
('1', true, '2'),
('7', false, '2');

INSERT INTO comments_video (comments_video, comments_id, title_video_id,  user_id)
VALUES
('nice','1','1', '5');