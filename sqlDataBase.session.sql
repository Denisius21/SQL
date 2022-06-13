CREATE DATABASE training;
CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name varchar(64) NOT NULL CHECK (first_name != ''),
  last_name varchar(64) NOT NULL CHECK (last_name != ''),
  email varchar(100) NOT NULL UNIQUE CONSTRAINT "VALID EMAIL" CHECK (
    email ~ '^[A-Za-z0-9]\w{0,}@[a-z]{1,}\.[a-z]{1,}$'),
    is_male bool,
  birthday date NOT NULL CHECK (
    age(birthday) < interval '120 years'
    AND birthday < (current_date + interval '1 day')
  )
);
DROP TABLE users;

CREATE TABLE "videos"(
  id serial PRIMARY KEY,
  user_id int NOT NULL REFERENCES users,
  title_video varchar (100) NOT NULL,
  created_at timestamp NOT NULL DEFAULT current_timestamp
);
DROP TABLE "videos";


CREATE TABLE like_dislike (
  id serial PRIMARY KEY,
  video_id int NOT NULL REFERENCES videos,
  like_dislike boolean,
  user_like_dislike_first_name int NOT NULL REFERENCES videos
);
DROP TABLE like_dislike;

CREATE TABLE comments_video(
  id serial PRIMARY KEY,
  comments_video varchar (100),
  comments_id int NOT NULL REFERENCES videos,
   user_id int NOT NULL REFERENCES users,
   title_video_id int NOT NULL REFERENCES videos
);

DROP TABLE comments_video;

SELECT users.first_name, videos.title_video, videos.id, videos.created_at FROM users
JOIN videos ON videos.user_id = users.id;

SELECT  users.first_name, videos.title_video, like_dislike.like_dislike, 
like_dislike.user_like_dislike_first_name FROM users
JOIN videos ON videos.user_id = users.id
JOIN like_dislike ON like_dislike.video_id = videos.id;

SELECT comments_video.comments_video, videos.user_id, videos.title_video,
comments_video.user_id FROM comments_video
JOIN videos ON videos.user_id = users.id
JOIN users ON comments_video.user_id = users.id;
